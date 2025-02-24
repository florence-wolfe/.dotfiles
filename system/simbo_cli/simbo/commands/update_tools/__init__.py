import rich_click as click

from simbo.commands.command_utils import Platform, get_platform
from simbo.commands.update_tools.secrets import secrets
from simbo.commands.update_tools.nixpkgs import nixpkgs
from simbo.commands.update_tools.flake import flake


@click.group()
def update():
    """Lists the tools that can be updated."""
    pass


if get_platform() != Platform.windows:
    update.add_command(nixpkgs)
    update.add_command(flake)
update.add_command(secrets)
