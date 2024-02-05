import rich_click as click
import subprocess
import sys

from halo import Halo
from simbo.utils.constants import DOTFILES_PATH
from simbo.commands.command_utils import run_command, run_process,  run_process_async
from simbo.utils import log

LOGIN_TEXT = "You must be logged in to run this command. To login, run [infisical login]"

@click.command()
def secrets():
    """Sets up secret management."""
    run_command(command=setup_secrets_management, error_message="Failed to setup secrets management.")

def setup_secrets_management(spinner: Halo):
    log("Setting up secrets management.");
    if is_secrets_logged_in():
        log("Logged into the secrets management tool.")
    else:
        spinner.warn("Not logged into the secrets management tool.")
        login_to_secrets_management(spinner=spinner)
    
    init_secrets_management(spinner=spinner)
    export_default_secrets(spinner=spinner)

def is_secrets_logged_in():
    process = run_process_async(command="infisical init", stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    try:
        _stdout, stderr = process.communicate(timeout=2)
        if bool(stderr) and LOGIN_TEXT in stderr:
            return False

        # assume we're logged into infisical
        # Terminate the process
        process.terminate()
        return True
    except subprocess.TimeoutExpired:
        # the process will throw a timeout error because it's waiting fro user input if we're logged in
        # Terminate the process just to be safe
        process.terminate()
        return True

def login_to_secrets_management(spinner: Halo):
    spinner.start(text="Logging in to the secrets management tool.")
    # Spawn an interactive process, for example, 'bash', 'python', or 'vim'
    process = run_process_async(command="infisical login", stdin=sys.stdin, stdout=sys.stdout, stderr=sys.stderr)
    # Wait for the process to complete
    return_code = process.wait()
    if return_code == 0:
        spinner.succeed(text="Logged into the secrets management tool.")
    else:
        spinner.fail(text="Failed to login to the secrets management tool.")

def init_secrets_management(spinner: Halo):
    spinner.start(text="Initializing the secrets management tool.")
    process = run_process_async(command="infisical init", stdin=sys.stdin, stdout=sys.stdout, stderr=sys.stderr)
    # Wait for the process to complete
    return_code = process.wait()
    if return_code == 0:
        spinner.succeed(text="Logged into the secrets management tool.")
    else:
        spinner.fail(text="Failed to login to the secrets management tool.")
    spinner.succeed(text="Initialized the secrets management tool.")

def export_default_secrets(spinner: Halo):
    spinner.start(text="Exporting default secrets.")
    run_process(f"infisical export > {DOTFILES_PATH}/secrets/.env")
    spinner.succeed(text="Exported default secrets.")
