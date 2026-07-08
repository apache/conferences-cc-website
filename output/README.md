# ASF Events Website Content

The content for the ASF Events website is generated using Pelican, a static site generator written in Python. The content is organized in the `content` directory, which contains Markdown files for each event, as well as other pages such as the homepage and about page.

## Directory Structure
- `content/`: Main directory for all content files.
  - `events/`: Contains Markdown files for each event, organized by year.
  - `index.md`: The homepage content.
  - `about.md`: The about page content.
    - `contact.md`: The contact page content.
    - `sponsors.md`: The sponsors page content.
    - `archive.md`: The archive page content.
## Content Creation
To create content for a new event, follow these steps:
1. Create a new Markdown file in the `content/events/` directory, following the naming convention `YYYY-MM-DD-event-name.md`.
2. Add the event details in the Markdown file, including the title, date, location, description, and any relevant links or images.
3. Update the `index.md` file to include a link to the new event if it is upcoming or recently past.
4. If the event is a sponsor, update the `sponsors.md` file to include the sponsor's information and logo.
5. If the event is an archived event, update the `archive.md` file to include the event's details and a link to its page.
## Generating the Site
To generate the site, run the following command in the terminal:
```bashpelican content -o output -s pelicanconf.py
```
This command will process the content files and generate the static site in the `output` directory, using the configuration specified in `pelicanconf.py`. You can then deploy the contents of the `output` directory to your web server to make the site live. 
## Additional Notes
- Make sure to keep the content files organized and up-to-date, especially for upcoming events and sponsors.
- Use consistent formatting and structure in the Markdown files to ensure a cohesive look across the site.
- Regularly check the generated site for any issues or broken links, especially after adding new content.


