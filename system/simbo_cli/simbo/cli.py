import rich_click as click
from simbo.utils import get_os, log
from simbo.utils.constants import SYSTEMS
from simbo.utils.windows import is_windows_initialized
from .commands.setup_tools import setup
from .commands.update_tools import update
from .commands.edit_tools import edit

@click.group()
def cli():
    """
    Simbo - A cross-platform system management CLI.

    This tool helps manage system configurations across Windows, Linux, and macOS.
    """
    # Ensure Windows initialization command is always available on Windows
    if get_os() == SYSTEMS.WINDOWS and not is_windows_initialized():
        from simbo.commands.setup_tools.windows import windows

        # setup.commands = [windows]
        # update.commands = []
        # edit.commands = []
        setup.commands = {}
        setup.add_command(windows)
    elif get_os() == SYSTEMS.WINDOWS and is_windows_initialized():
        setup.commands = {}
        edit.commands = {}
        update.commands = {}
        log(text="Please run `simbo` from `wsl` to continue.", level="warning")


if get_os() == SYSTEMS.WINDOWS and not is_windows_initialized():
    from simbo.commands.setup_tools.windows import windows

    # setup.commands = [windows]
    # update.commands = []
    # edit.commands = []
    setup.commands = {}
    setup.add_command(windows)
elif get_os() == SYSTEMS.WINDOWS and is_windows_initialized():
    setup.commands = {}
    edit.commands = {}
    update.commands = {}
    log(text="Windows is initialized. Please run `simbo` from `wsl` to continue.", level="warning")
else:
    cli.add_command(setup)
    cli.add_command(update)
    cli.add_command(edit)


if __name__ == "__main__":
    cli()
