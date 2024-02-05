import rich_click as click
from halo import Halo
from simbo.commands.command_utils import run_command, run_process
from simbo.utils import check_exists, log


@click.command()
def brew():
    """Installs Homebrew."""
    run_command(command=setup_brew, error_message="Failed to setup Homebrew.")


def setup_brew(spinner: Halo):
    log("Checking if Homebrew is installed.")
    spinner.start()
    if check_exists("brew"):
        spinner.succeed(text="Homebrew is already installed.")
        return
    else:
        spinner.warn(text="Homebrew is not installed. Installing.")
        spinner.start(text="Installing Homebrew.")
        # https://docs.brew.sh/Installation
        run_process(
            "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        )
        spinner.succeed(text="Homebrew has been installed.")
