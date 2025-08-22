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

To build slides in a folder (e.g. `courses/prog1-slides`):

```bash
just build courses/prog1-slides
```

### Live preview

To serve slides in a folder:

```bash
just serve courses/prog1-slides
```

will serve the slides on [http://localhost:8000](http://localhost:8000)

## Make your own slides
- Fork this project
- Copy `courses/prog1-slides` to `courses/<your-slides-folder>`
- Modify `courses/<your-slides-folder>` to include your own content
- (Optional) Publish your slides on Github Pages - see '.github/workflows/publish.yml'

## Help

See more at [mkslides](https://github.com/MartenBE/mkslides)