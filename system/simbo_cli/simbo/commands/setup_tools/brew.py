import rich_click as click
from halo import Halo
from simbo.commands.command_utils import run_command, run_process, update_environment
from simbo.utils import check_exists, log


@click.command()
def brew():
    """Installs Homebrew."""
    run_command(command=setup_brew, error_message="Failed to setup Homebrew.")


def setup_brew(spinner: Halo):
    # TODO: Set up dependency graph or something
    log(text="Checking if Homebrew is installed.", level="info")
    spinner.start()
    if check_exists("brew"):
        spinner.succeed(text="Homebrew is already installed.")
        return
    else:
        # TODO Capture STDIN
        spinner.warn(text="Homebrew is not installed. Installing.")
        spinner.start(text="Installing Homebrew.")
        # https://docs.brew.sh/Installation
        run_process(
            "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        )
        spinner.succeed(text="Homebrew has been installed.")
        update_environment()
