# ASF Event Microsites

This directory contains the content for the ASF Event Microsites, which are generated using Pelican. Each event has its own subdirectory with content files (Markdown, images, etc.) that are processed to create the final static website for that event. The main README file provides an overview of the structure and purpose of this directory.

## Directory Structure
- `events/`: Contains subdirectories for each event, with content files for that event.
  - `event-name/`: Subdirectory for a specific event.
  - If the event does not have its own subdirectory, its content files are placed directly in the `events/` directory using the name convention of eventName-eventYear or eventCityName-eventYear (e.g., `devcon-2024/` or  `glasgow-2024/`).
  - The easiest way to create a new event is to copy an existing event directory and update the content files and metadata accordingly.

## Content Files
Each event subdirectory may contain the following types of files:
- `index.md`: The main content file for the event, written in Markdown.
- `images/`: A directory containing images related to the event.
- `sponsors.json`: A JSON file containing information about the event sponsors.

## event.yaml
In addition to the content files, there is an `events.yaml` file that contains metadata for each event, such as the event name, date, location, and a reference identifier that links to the content files. This metadata is used by the Pelican templates to generate the appropriate pages for each event.

events.yaml can be found in `data/events.yaml`

It is important that the `ref` field in the `events.yaml` file matches the `ref` field in the event's `index.md` metadata to ensure that the correct content is associated with each event. This allows for seamless integration between the event metadata and the content files, enabling Pelican to generate accurate and informative pages for each event.

## Page metadata
Each Markdown file can include metadata at the top of the file, which is used by Pelican to generate the appropriate pages. Common metadata fields include:
- `title`: (required) The title of the page
- `template`: (required) The template to use for the page
- `ref`: (required) The reference identifier for the event
- `hero_background_image`: (optional - landing page only) The background image for the event hero section
- `event_logo`: (optional) The logo for the event
- `banner_text`: (optional) Text for the banner at the top of the page
- `banner_link`: (optional) URL for the banner link
- `banner_link_text`: (optional) Text for the banner link
- `sponsors_key`: (optional) Key to link the sponsors data from `asfdata.yaml`
- `cta_text`: (optional) Text for the call-to-action button
- `cta_link`: (optional) URL for the call-to-action button
- `cta_two_text`: (optional) Text for the second call-to-action button
- `cta_two_link`: (optional) URL for the second call-to-action button
- `is_colocated_event`: (co-located events only) Indicates if the event is colocated with another event
- `parentEvent`: (co-located events only) The parent event if this event is colocated

## Page Templates
Only the event landing page (index.md) should use `page-event-landing` as the template. All other pages should use `page-event-default` as the template. This ensures a consistent look and feel across all event pages while allowing for customization where necessary.

## Page Event Landing Template
The `page-event-landing` template is used for the main landing page of the event.

This page template uses data entered in events.yaml to populate the event details and also uses the metadata from the index.md file to populate the hero section, banner, sponsors, and call-to-action buttons. This template is designed to provide a visually appealing and informative landing page for the event.

## Sponsors
Sponsors for each event are defined in the `asfdata.yaml` file under the `sponsors` section. Each sponsor entry should include a key that matches the `sponsors_key` defined in the event's index.md metadata. This allows the event landing page to display the appropriate sponsors for each event.

You can add you sponsors.json file in the event directory, but it is not required. If you choose to use a sponsors.json file. Make sure to include the sponsor information in the `asfdata.yaml` file as well, using the same key for consistency. This will ensure that the sponsors are displayed correctly on the event landing page.

## Co-located Events
If an event is co-located with another event, you can indicate this in the metadata of the co-located event's index.md file by setting `is_colocated_event` to true and providing the `parentEvent` reference. This allows the templates to link the co-located event to its parent event, providing a seamless experience for users navigating between the two events.

Add colocated events information to the `events.yaml` file as well, ensuring that the co-located event is properly linked to its parent event. This will help users understand the relationship between the events and navigate accordingly. See the `events.yaml` file for examples of how to structure co-located events.