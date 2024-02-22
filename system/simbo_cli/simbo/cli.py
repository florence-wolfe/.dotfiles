import rich_click as click
from .commands.setup_tools import setup
from .commands.update_tools import update
from .commands.edit_tools import edit


@click.group()
def cli():
    pass


cli.add_command(setup)
cli.add_command(update)
cli.add_command(edit)

if __name__ == "__main__":
    cli()
