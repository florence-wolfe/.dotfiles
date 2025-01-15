import rich_click as click
from simbo.commands.command_utils import Platform, get_platform
from .commands.setup_tools import setup
from .commands.update_tools import update
from .commands.edit_tools import edit


@click.group()
def cli():
    pass


if get_platform() != Platform.windows:
    cli.add_command(setup)
    cli.add_command(update)
    cli.add_command(edit)

if __name__ == "__main__":
    cli()
