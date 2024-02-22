import rich_click as click
from .nvim import nvim


@click.group()
def edit():
    """Lists the available things to edit."""
    pass


edit.add_command(nvim)
