from simbo.commands.command_utils import Platform, get_platform
import rich_click as click
from .nix import nix
from .home_manager import home_manager
from .brew import brew
from .secrets import secrets


@click.group()
def setup():
    """Lists the available setup tools."""
    pass


if get_platform() != Platform.windows:
    setup.add_command(nix)
    setup.add_command(home_manager)
    setup.add_command(brew)

setup.add_command(secrets)
