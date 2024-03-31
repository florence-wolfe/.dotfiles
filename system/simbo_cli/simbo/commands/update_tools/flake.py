import rich_click as click
from halo import Halo
from simbo.utils import get_os
from simbo.utils.constants import DOTFILES_PATH, SYSTEMS, PROFILE
from simbo.commands.command_utils import run_command, run_process_async, run_process


@click.command()
def flake():
    """Updates the flake generation"""
    run_command(command=update_flake, error_message="Failed to update flake.")


def update_flake(spinner: Halo):
    os = get_os()
    spinner.text = f"Updating flake generation for {os}"
    if os == SYSTEMS.MACOS:
        spinner.stop()
        run_process_async(f'darwin-rebuild switch --flake "{DOTFILES_PATH}#{PROFILE}"')
    else:
        spinner.stop()
        run_process("home-manager switch --flake .")
    spinner.succeed(text="Flake generation has been updated.")
