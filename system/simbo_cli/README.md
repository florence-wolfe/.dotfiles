# Simbo

Simbo is a command-line interface (CLI) tool written in Python. This README provides installation and usage instructions.

## Installation

### Prerequisites
Ensure you have Python 3.7+ installed on your system.

### Installing from Source with `uv`
1. Clone the repository:
   ```sh
   git clone <your-repo-url>
   cd <your-repo-folder>
   ```
2. Install the package using `uv`:
   ```sh
   uv venv .venv
   source .venv/bin/activate  # On Windows use `.venv\Scripts\activate`
   uv pip install .
   ```

### Installing in Editable Mode (For Development)
If you plan to modify the source code, install it in editable mode:
```sh
uv pip install --editable .
```

## Usage
Once installed, you can run `simbo` from the command line:
```sh
simbo
```

### Help Command
To see available commands and options:
```sh
simbo --help
```

## Dependencies
This CLI tool depends on:
- `rich_click`
- `halo`

These dependencies are automatically installed when you install `simbo`.

## Uninstallation
To remove `simbo`, run:
```sh
uv pip uninstall simbo
```

## Contributing
Feel free to submit issues or pull requests.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

