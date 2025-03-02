# .dotfiles

This is my personal development environment setup stuff. It has my dotfiles, configurations, and automations.

1. Install the `simbo` CLI found in `system/simbo_cli`. Install instructions can be found there.
  - Python is the _only_ requirement for `simbo`.
  - This is by design to ensure that the environment is as minimal as possible and can be installed on any machine.
2. Start setup:
  - `simbo setup nix`
  - After nix completes its installation, run `nix install home-manager`
  - Then `nix install brew`
3. Next run the updates
  - `simbo update nixpkgs` will get the latest nixpkgs needed to install the packages.
  - `simbo update flake` should then update the current OS's flake and install the packages, starting with brew and ending with the nix config.

## Optional Steps

4. Setup a new SSH key
  - [generating a new ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  - [add the ssh key to gh using gh cli](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account?platform=linux&tool=cli)
