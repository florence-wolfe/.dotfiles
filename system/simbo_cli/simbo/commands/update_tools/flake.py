import rich_click as click
from halo import Halo
from simbo.utils import get_os 
from simbo.utils.constants import DOTFILES_PATH, SYSTEMS, PROFILE
from simbo.commands.command_utils import (
    run_command,
    run_process_async,
    run_process,
    update_environment,
)


@click.command()
@click.option(
    "--backup",
    type=click.BOOL,
    default=False,
    help="Backup existing files for Flake switch",
)
def flake(backup: bool):
    """Updates the flake generation"""
    run_command(
        command=lambda spinner: update_flake(spinner=spinner, backup=backup),
        error_message="Failed to update flake.",
    )


def update_flake(spinner: Halo, backup: bool = False):
    os = get_os()
    spinner.text = f"Updating flake generation for {os}"
    backup_command = ""
    if backup:
        backup_command = " -b hm-bkp"
    if os == SYSTEMS.MACOS:
        spinner.stop()
        run_process_async(
            f'darwin-rebuild switch --flake "{DOTFILES_PATH}#{PROFILE}"'
            + backup_command
        )
    else:
        spinner.stop()
        run_process(
            f'home-manager switch --flake "{DOTFILES_PATH}#{PROFILE}"' + backup_command
        )
    update_environment()
    spinner.succeed(text="Flake generation has been updated.")
