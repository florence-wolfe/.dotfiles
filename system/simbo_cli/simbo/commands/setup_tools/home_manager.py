import rich_click as click
from typing import Literal
from halo import Halo
from simbo.utils import check_exists, get_os, log
from simbo.utils.constants import SYSTEMS, DOTFILES_PATH, PROFILE
from simbo.commands.command_utils import run_command, run_process

HOME_MANAGER_LINUX = "home-manager"
HOME_MANAGER_MACOS = "darwin-rebuild"


@click.command()
def home_manager():
    """Installs Home Manager.

    https://github.com/rycee/home-manager
    https://nix-community.github.io/home-manager/index.xhtml
    """
    run_command(
        command=setup_home_manager, error_message="Failed to setup Home Manager."
    )


def setup_home_manager(spinner: Halo):
    os, command = get_os_and_command()
    log(f"Checking if Home Manager for {os} is already installed.")

    if check_exists(command):
        spinner.succeed(text=f"Home Manager for {os} is already installed.")
        return

    spinner.warn(text=f"Home Manager for {os} is not installed.")
    spinner.start(text=f"Installing Home Manager for {os}.")
    # https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone
    run_process(
        "nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager"
    )
    run_process("nix-channel --update")
    run_process("nix-shell '<home-manager>' -A install")

    log("Building activation package for Home Manager profile.")
    run_process(
        f'nix build --no-link "{DOTFILES_PATH}#homeConfigurations."{PROFILE}".activationPackage"'
    )
    spinner.succeed(text=f"Home Manager for {os} has been installed.")


def get_os_and_command() -> tuple[str, str]:
    os = get_os()
    command = ""
    if os == SYSTEMS.LINUX:
        command = HOME_MANAGER_LINUX
    elif os == SYSTEMS.MACOS:
        command = HOME_MANAGER_MACOS
    return os, command
