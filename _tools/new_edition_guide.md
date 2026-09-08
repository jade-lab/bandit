# Creating a New BANDIT Edition

This guide explains how to add a new year-specific BANDIT edition, for example `2027`, using the current multi-edition structure.

The site uses shared root code plus one content/config folder per edition:

```text
_editions/
  2025/
  2026/
  2027/
```

Each edition is built independently and published under a year-prefixed URL such as:

```text
/bandit/2025/
/bandit/2026/
/bandit/2027/
```

The current default `/bandit/` redirect is controlled by `CURRENT_YEAR` in the build script environment, defaulting to `2026` unless changed.

---

## 1. Choose the source edition to copy

Normally, create the new edition by copying the latest edition folder.

For example, to create `2027` from `2026`:

```bash
cp -a _editions/2026 _editions/2027
```

This gives the new edition the required structure:

```text
_editions/2027/
  _config.yml
  index.md
  cfp/
  program/
  talks/
  location/
  _data/
  _includes/
  _rooms/
  _speakers/
  _talks/
```

---

## 2. Update the new edition config

Edit:

```text
_editions/2027/_config.yml
```

Update at least these values:

```yaml
baseurl: "/bandit/2027"
description: >-
  2027 edition of BANDIT -- Workshop on Big Data Analysis and Illicit Trends.

edition:
  year: 2027
  number: 4
  short_name: bandit.27
  hero_image: splash_2025_macau.jpg
  host_logo: macau-logo.png
  host_logo_alt: Host institution
```

If the new edition still has incomplete placeholder content, keep theme error banners disabled:

```yaml
conference:
  show_errors: false
```

Once the edition has complete data, especially a valid program schedule, you can change it back to:

```yaml
conference:
  show_errors: true
```

---

## 3. Update navigation links

Still in:

```text
_editions/2027/_config.yml
```

Update the logo and edition links.

Example:

```yaml
conference:
  navigation:
    logo:
      name: bandit.27
      img: 'logo.png'
      url: '/bandit/2027/'
    links:
      - name: CFP
        relative_url: /cfp/
      - name: Program
        relative_url: /program/
      - name: Accepted Papers
        relative_url: /talks/
      - name: Venue
        relative_url: /location/
      - name: Register
        disabled: true
        absolute_url: ""
      - name: Editions
        menu:
          - name: BANDIT 2027
            absolute_url: /bandit/2027/
          - name: BANDIT 2026
            absolute_url: /bandit/2026/
          - name: BANDIT 2025
            absolute_url: /bandit/2025/
          - name: BANDIT 2023
            absolute_url: https://jade-lab.github.io/bandit/
```

Also consider updating older editions' navigation menus so they link to the newly added edition.

For example, update:

```text
_editions/2026/_config.yml
_editions/2025/_config.yml
```

so their `Editions` dropdown includes:

```yaml
- name: BANDIT 2027
  absolute_url: /bandit/2027/
```

---

## 4. Update the homepage

Edit:

```text
_editions/2027/index.md
```

Update the edition number, year, associated conference, dates, venue, and participation format.

If details are not yet known, use placeholder text such as:

```markdown
BANDIT 2027 will be held in conjunction with IEEE Big Data 2027. Dates, venue, and participation format will be announced soon.
```

---

## 5. Update the CFP page

Edit:

```text
_editions/2027/cfp/index.md
```

Update:

- edition number
- conference year
- dates
- venue
- submission URL
- deadlines
- paper requirements
- proceedings details

If the CFP is not ready yet, keep placeholder text and avoid publishing incorrect dates or links.

---

## 6. Update important dates

Edit:

```text
_editions/2027/_includes/important_dates.md
```

Example placeholder:

```markdown
### Important Dates

Dates for BANDIT 2027 will be announced soon.
```

When dates are known, replace this with the real submission, notification, camera-ready, and workshop dates.

---

## 7. Update topics

Edit:

```text
_editions/2027/_includes/topics.md
```

Usually this can be copied from the previous edition, but review it each year to ensure the scope is still accurate.

---

## 8. Update the program page

Edit:

```text
_editions/2027/program/index.md
```

If the program is not ready, use the simple page layout:

```markdown
---
layout: page
title: Program
---

The BANDIT 2027 programme will be announced soon.
```

Do **not** use this yet:

```yaml
layout: program
```

The `program` layout expects real schedule data in `_data/program.yml`.

---

## 9. Update program data when ready

When the schedule is known, edit:

```text
_editions/2027/_data/program.yml
```

Until then, it can remain empty or contain placeholder data, as long as `conference.show_errors` is disabled for the incomplete edition and the program page uses `layout: page`.

When the schedule is complete, switch:

```text
_editions/2027/program/index.md
```

to:

```yaml
---
layout: program
title: Program
---
```

Then populate `_data/program.yml` using the previous year's structure as a reference.

---

## 10. Update accepted papers and talks

Before accepted papers are available, keep:

```text
_editions/2027/talks/index.md
```

as a simple placeholder page:

```markdown
---
layout: page
title: Accepted Papers
---

Accepted papers for BANDIT 2027 will be announced soon.
```

When accepted papers are available:

1. Add or update talk files in:

   ```text
   _editions/2027/_talks/
   ```

2. Add or update speaker files in:

   ```text
   _editions/2027/_speakers/
   ```

3. Switch the talks overview page to the appropriate theme layout if needed, using the previous complete edition as a reference.

---

## 11. Update rooms and venue

Edit:

```text
_editions/2027/location/index.md
_editions/2027/_rooms/
```

If the venue is not known yet, use placeholder content:

```markdown
---
layout: page
title: Venue
---

The BANDIT 2027 venue will be announced soon.
```

When the venue is known, update the location page, rooms, and map configuration in:

```text
_editions/2027/_config.yml
```

For example:

```yaml
conference:
  location:
    hide: false
    url: '/location'
    navbar_title: 'Location'
    map:
      home_coord: latitude, longitude
      map_provider: "OpenStreetMap.Mapnik"
      default_zoom: 18
```

---

## 12. Update edition-specific images if needed

Shared images are stored in:

```text
assets/images/
```

If the new edition has a new hero image, add it there and update:

```text
_editions/2027/_config.yml
```

Example:

```yaml
edition:
  hero_image: splash_2027_example.jpg
```

The hero image is rendered from:

```text
assets/css/main.scss
```

using:

```scss
background-image: url('{{ site.baseurl }}/assets/images/{{ site.edition.hero_image | default: "splash_2025_macau.jpg" }}');
```

---

## 13. Make the new edition the default `/bandit/` target

The default redirect is controlled by the `CURRENT_YEAR` environment variable in:

```text
_tools/build_editions.sh
_tools/serve_editions.sh
```

The current default is:

```bash
CURRENT_YEAR="${CURRENT_YEAR:-2026}"
```

To make `2027` the default, update both scripts to:

```bash
CURRENT_YEAR="${CURRENT_YEAR:-2027}"
```

Alternatively, keep the scripts unchanged and pass the value when building:

```bash
CURRENT_YEAR=2027 docker compose up --build
```

---

## 14. Build and test locally

From the repository root:

```text
/path/to/bandit
```

run:

```bash
docker compose up --build
```

The container should:

1. install/check Ruby dependencies,
2. build each edition under `_site/bandit/<year>/`,
3. create the `/bandit/` redirect page,
4. serve `_site` on port `4000`.

Open these URLs in your browser:

```text
http://localhost:4000/bandit/
http://localhost:4000/bandit/2027/
http://localhost:4000/bandit/2027/cfp/
http://localhost:4000/bandit/2027/program/
http://localhost:4000/bandit/2027/talks/
http://localhost:4000/bandit/2027/location/
```

Also verify that archived editions still work:

```text
http://localhost:4000/bandit/2026/
http://localhost:4000/bandit/2025/
```

If `/bandit/` should point to the new edition, confirm that:

```text
http://localhost:4000/bandit/
```

redirects to:

```text
http://localhost:4000/bandit/2027/
```

---

## Troubleshooting

### The site shows a `_data/program.yml` error

If the program is not ready yet, make sure the new edition config has:

```yaml
conference:
  show_errors: false
```

and make sure the program page uses:

```yaml
layout: page
```

not:

```yaml
layout: program
```

### WEBrick is not found

The local server should be started through Bundler:

```bash
bundle exec ruby -run -e httpd _site -p 4000 -b 0.0.0.0
```

This is already handled by:

```text
_tools/serve_editions.sh
```

### Old generated files appear in the browser

Stop Docker and rebuild from scratch:

```bash
docker compose down
docker compose up --build
```

The build script removes and recreates `_site/` and `.jekyll-build/` on every build.
