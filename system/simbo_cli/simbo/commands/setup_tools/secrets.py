import rich_click as click
import sys

from halo import Halo
from simbo.commands.command_utils import run_command, run_process_async
from simbo.utils import log
from simbo.commands.update_tools.secrets import update_secrets


@click.command()
def secrets():
    """Sets up secret management."""
    run_command(
        command=setup_secrets_management,
        error_message="Failed to setup secrets management.",
    )


def setup_secrets_management(spinner: Halo):
    log(text="Setting up secrets management.", level="info")
    login_to_secrets_management(spinner=spinner)
    update_secrets(spinner=spinner)


def login_to_secrets_management(spinner: Halo):
    spinner.start(text="Logging in to the secrets management tool.")
    # Spawn an interactive process, for example, 'bash', 'python', or 'vim'
    process = run_process_async(
        command="vault login", stdin=sys.stdin, stdout=sys.stdout, stderr=sys.stderr
    )
    # Wait for the process to complete
    return_code = process.wait()
    if return_code == 0:
        spinner.succeed(text="Logged into the secrets management tool.")
    else:
        spinner.fail(text="Failed to login to the secrets management tool.")
