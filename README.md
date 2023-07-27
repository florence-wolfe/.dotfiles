# Dotfiles Repository

This repository contains my personal dotfiles used for setting up my machines. It primarily consists of Neovim and Nix configurations managed with home-manager.

## Repository Structure

- `system/`: Contains system-level configurations.
- `config/`: Contains application-level configurations.
- `flake.nix`: The primary configuration file for the Nix build system.
- `modules/`: Contains Nix modules or other modular configuration elements.
- `secrets/`: Contains sensitive data, such as API keys or passwords that are `age`-encrypted.
- `utilities.nix`: Contains some custom nix utility functions.
- `nvim/`: Contains configurations for the Neovim editor.

## Usage

To use these dotfiles, clone this repository to your local machine and copy the files to their respective locations.

Please remember to handle the `secrets/` directory with care as it contains sensitive data.

**Note:** This repository is personalized for my use-case. Please review the configurations and adjust them according to your needs before using.

## License

These dotfiles are released under the MIT license. See `LICENSE` for more information.

## Contributions

While this repo is primarily for personal use, I'm open to collaboration. If you have suggestions or improvements, feel free to open an issue or make a pull request.
