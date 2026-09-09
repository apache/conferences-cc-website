from pathlib import Path
import re

root = Path('/Users/paulau/Sites/ASF-Events/conferences-cc-website/content/events/apachecon-home-2021/tracks')
files = [
    'incubator.ezmd',
    'integration.ezmd',
    'cassandra.ezmd',
    'community.ezmd',
    'fineract.ezmd',
    'geospatial.ezmd',
    'highlight.ezmd',
    'observability.ezmd',
    'search.ezmd',
    'tomcat.ezmd',
]

date_re = re.compile(r'^(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday) \d{1,2}:\d{2} UTC$')


def collapse_paragraphs(lines):
    paragraphs = []
    current = []
    for line in lines:
        if line.strip() == '':
            if current:
                paragraphs.append(' '.join(piece.strip() for piece in current).strip())
                current = []
            paragraphs.append('')
            continue
        current.append(line)
    if current:
        paragraphs.append(' '.join(piece.strip() for piece in current).strip())
    return paragraphs


def italicize_bio(lines):
    collapsed = collapse_paragraphs(lines)
    output = []
    for paragraph in collapsed:
        if paragraph == '':
            if output and output[-1] != '':
                output.append('')
            continue
        if not (paragraph.startswith('_') and paragraph.endswith('_')):
            paragraph = f'_{paragraph}_'
        output.append(paragraph)
    while output and output[-1] == '':
        output.pop()
    return output


def normalize_body(body_lines):
    bio_start = None
    for index, line in enumerate(body_lines):
        if line.strip() == '':
            bio_start = index + 1
    if bio_start is None:
        bio_start = len(body_lines)

    talk_body = body_lines[:bio_start]
    bio_body = body_lines[bio_start:]

    normalized_talk = []
    for line in talk_body:
        if re.match(r'^\s{4,}\S', line):
            stripped = line.lstrip()
            if stripped.startswith(('- ', '* ', '+ ')):
                stripped = stripped[2:].lstrip()
            normalized_talk.append(f'- {stripped}')
        else:
            normalized_talk.append(line)

    while normalized_talk and normalized_talk[-1].strip() == '':
        normalized_talk.pop()
    while bio_body and bio_body[0].strip() == '':
        bio_body = bio_body[1:]

    output = []
    if normalized_talk:
        output.extend(normalized_talk)
    if bio_body:
        if output:
            output.append('')
        output.extend(italicize_bio(bio_body))
    return output


def transform_file(path):
    original_lines = path.read_text().splitlines()
    output = []
    index = 0
    while index < len(original_lines):
        line = original_lines[index]
        normalized_line = line.strip()
        if normalized_line.startswith('Wednesdays '):
            normalized_line = 'Wednesday ' + normalized_line.split(' ', 1)[1]
        if date_re.match(normalized_line):
            if not output or output[-1].strip() != '---':
                output.append('---')
                output.append('')
            output.append(f'**{normalized_line}**')
            output.append('')
            index += 1

            session = []
            while index < len(original_lines) and not date_re.match(original_lines[index].strip()):
                session.append(original_lines[index])
                index += 1

            while session and session[0].strip() == '':
                session.pop(0)
            if not session:
                continue

            title = session.pop(0).strip()
            while session and session[0].strip() == '':
                session.pop(0)
            speaker = session.pop(0).strip() if session else ''
            while session and session[0].strip() == '':
                session.pop(0)

            output.append(f'## {title}')
            output.append('')
            if speaker:
                output.append(f'### {speaker}')
                output.append('')

            body = normalize_body(session)
            if body:
                output.extend(body)
                output.append('')
            continue

        output.append(line)
        index += 1

    while output and output[-1] == '':
        output.pop()
    path.write_text('\n'.join(output) + '\n')
    print(f'updated {path.name}')


for filename in files:
    transform_file(root / filename)
