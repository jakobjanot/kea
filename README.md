# KEA coursess

## Installation

### Prerequisites
- Python 3.8 or later
- uv (Python package manager)
- just (command runner)

#### macOS
```bash
brew install just python3
```

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## Usage with `just`

### Build HTML slides from Markdown

To build slides for e.g. programming 1 course:

```bash
just build-slides slides/programmering1
```

### Serve / live preview slides

To serve slides in a folder:

```bash
just serve-slides slides/programmering1
```

will serve the slides on [http://localhost:8000](http://localhost:8000)

### Build PDFs

To build PDF slides for e.g. programming 1 course:

```bash
just pdf-slides slides/programmering1
```

### Tutorials

Use:

```bash
just build-tutorials tutorials/programmering1
```

and pdfs:

```bash
just pdf-tutorials tutorials/programmering1
```

## Make your own slides
- Fork this project
- Copy `slides/programmering1` to `slides/<your-slides-folder>`
- Modify `slides/<your-slides-folder>` to include your own content
- (Optional) Publish your slides on Github Pages - see `.github/workflows/publish.yml`

## Help

See more at [mkslides](https://github.com/MartenBE/mkslides)