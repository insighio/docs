# insigh.io docs

This repo is dedicated on being the single source of knowledge around insigh.io products and services.

Hosted URL: [docs.insigh.io](http://docs.insigh.io)

Documentation is auto-generated from Markdown files in this repo using [Hugo](https://gohugo.io) tool.

## Prerequisites

Install [Hugo](https://gohugo.io/getting-started/installing/)

```
sudo apt install hugo
```

## Run docs locally

Clone repo:

```bash
git clone https://github.com/insighio/docs.git
```

and start Hugo server

```bash
cd docs
git submodule update --init --recursive
hugo serve
```

By default Hugo server binds at localhost port 1313: [localhost:1313](http://localhost:1313/)

## Printed box insert

The [Enviro + 1NCE quick-start flyer](static/print/enviro-quick-start.html) is a
standalone, two-sided A5 insert based on the Getting Started guide. It assumes
firmware is installed and the SIM is fitted, but sensors and Console provisioning
still need to be configured.

Open the HTML file directly in a browser, or visit `/print/enviro-quick-start.html`
on the documentation site after deployment. Print or Save as PDF with A5 portrait,
100% scale, no margins, and browser headers and footers disabled. For physical
copies, print double-sided and flip on the long edge. The print instructions above
the flyer are hidden in print; the output should contain exactly two A5 pages.

Keep the insert aligned with the [Getting Started source](content/gettingstarted/)
when changing setup steps, credentials, or firmware behaviour.

### Four-page illustrated alternative

The [illustrated Enviro + 1NCE guide](static/print/enviro-illustrated-guide.html)
is a separate four-page A5 alternative with inline vector sketches (no external
assets or network access required). It uses the same shipping assumptions as the
two-page flyer, which remains unchanged. The sketches are explanatory, not wiring
diagrams or exact reproductions of the user interface.

Open the HTML directly or visit `/print/enviro-illustrated-guide.html` after
deployment. Save as PDF using the A5 settings above; verify exactly four pages.
Print A5 double-sided, flipping on the long edge. For a folded A4 booklet, select
Booklet mode in a PDF reader that supports it and follow its duplex instructions.
The source is in reading order (1-4), not pre-imposed for folding.
