# KEA courses

## Installation

### Prerequisites
- Python 3.8 or later
- uv (Python package manager)
- just (command runner)

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```


## Create html slides from Markdown files inside a folder

E.g. when your Markdown files are located in the `slides/` folder:

```bash
mkslides build slides/
```

E.g. when you have a single Markdown file called `lecture1.md`:

```bash
mkslides build lecture1.md
```

## Live preview

```bash
mkslides serve slides/
```

```bash
mkslides serve lecture1.md
```

## Help

See more at [mkslides](https://github.com/MartenBE/mkslides)