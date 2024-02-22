import rich_click as click
import subprocess

from simbo.commands.command_utils import run_process_async
from simbo.utils.constants import DOTFILES_PATH


@click.command()
def nvim():
    """Edit the nvim config."""
    process = run_process_async(
        command=f"nvim {DOTFILES_PATH}/nvim",
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    process.wait()
