import rich_click as click
import os
from halo import Halo
from simbo.utils import check_exists, log
from simbo.commands.command_utils import run_command, run_process

NIX_CONF_PATH = os.path.expanduser("~/.config/nix/nix.conf")
NIX_FLAKES_CONFIG = "experimental-features = nix-command flakes"


@click.command()
@click.option(
    "--install-method",
    type=click.Choice(["single-user", "multi-user"], case_sensitive=False),
    default="multi-user",
    help="Choose between single-user or multi-user install methods.",
)
def nix(install_method: str):
    """Installs Nix with flake support.
    https://nixos.org/download
    https://nixos.wiki/wiki/Flakes
    """
    run_command(
        command=lambda spinner: setup_nix(
            spinner=spinner, install_method=install_method
        ),
        error_message="Failed to setup Nix.",
    )


def setup_nix(spinner: Halo, install_method: str):
    check_and_install_nix(spinner, install_method)
    check_and_enable_flakes(spinner)


def check_and_install_nix(spinner: Halo, install_method: str):
    log("Checking if Nix is already installed.")
    if check_exists("nix"):
        spinner.succeed(text="Nix is already installed.")
    else:
        spinner.warn(text="Nix is not installed.")
        install_nix(spinner=spinner, install_method=install_method)


def install_nix(spinner: Halo, install_method: str):
    spinner.start(text=f"Installing Nix using the {install_method} method.")
    # Determine the installation command based on user choice
    install_cmd = "sh <(curl -L https://nixos.org/nix/install)"
    flag = "--no-daemon"
    if install_method == "multi-user":
        flag = "--daemon"
    # Run the Nix installation script
    run_process(f"{install_cmd} {flag}")
    spinner.succeed(text="Nix has been installed.")


def check_and_enable_flakes(spinner: Halo):
    log("Checking if flakes support is enabled.")
    spinner.start()
    if get_is_flakes_configured():
        spinner.succeed(text="Nix with flakes support is already enabled.")
        return
    else:
        spinner.warn(text="Nix with flakes support is not enabled.")
        configure_flakes(spinner=spinner)


def get_is_flakes_configured() -> bool:
    if os.path.exists(NIX_CONF_PATH):
        # File exists, now open it and search for the text
        with open(NIX_CONF_PATH, "r") as file:
            # Read the content of the file
            content = file.read()
            # Check if the specific text is in the file
            if NIX_FLAKES_CONFIG in content:
                return True
            else:
                return False
    else:
        return False


def configure_flakes(spinner: Halo):
    spinner.start(text="Enabling Nix with flakes support.")
    with open(NIX_CONF_PATH, "w") as file:
        file.write(NIX_FLAKES_CONFIG)
    spinner.succeed(text="Flakes support has been enabled.")
