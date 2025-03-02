import sys
import rich_click as click
from halo import Halo
from simbo.commands.command_utils import run_command, run_process
from simbo.utils import log
from simbo.utils.constants import WINDOWS_SCRIPT_PATH
from simbo.utils.windows import is_windows_initialized, is_admin
from simbo.utils.config import SimboConfig, Configuration


@click.command()
def windows():
    """Installs Windows tools and environment."""
    run_command(
        command=setup_windows, error_message="Failed to setup Windows environment."
    )


def setup_windows(spinner: Halo):
    log(text="Checking if Windows is already configured.", level="info")
    spinner.start()
    if is_windows_initialized():
        spinner.succeed(text="Windows is already configured.")
        return

    log(text="Checking if in elevated shell.", level="info")
    if not is_admin():
        spinner.warn(text="Not in elevated shell.")
        spinner.fail(text="Exiting. Please restart with elevated shell.")
        sys.exit()  # Exit the current script since the new one is now running

    log(text="Running Windows setup via Boxstarter...", level="info")
    completed_process = run_process(
        command=f"powershell -File {WINDOWS_SCRIPT_PATH}",
        use_bash=False,
    )

    if completed_process.returncode == 0:
        config = SimboConfig()
        config.set(key=Configuration.INITIALIZED, value=True)
        spinner.succeed("✅ Windows setup complete. System marked as initialized.")
    else:
        spinner.fail("❌ Setup failed. Check logs.")
