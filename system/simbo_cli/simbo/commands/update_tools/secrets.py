import rich_click as click
import json
import os
from halo import Halo
from simbo.commands.command_utils import run_command, run_process
from simbo.utils import log
from simbo.utils.constants import DOTFILES_PATH

SECRETS_PATH = os.path.join(DOTFILES_PATH, "secrets")


@click.command()
def secrets():
    """Fetches the latest secrets."""
    run_command(command=update_secrets, error_message="Failed to update secrets.")


def update_secrets(spinner: Halo):
    spinner.start(text="Updating secrets.")
    run_process(command=f"infisical export > {DOTFILES_PATH}/secrets/.env")
    output = run_process(command="infisical export --format json", capture_output=True)
    secrets = json.loads(output.stdout)
    for secret in secrets:
        secret_file_path = os.path.join(SECRETS_PATH, secret["key"])
        with open(secret_file_path, "w") as secret_file:
            secret_file.write(secret["value"])
    spinner.succeed(text="Updated secrets.")
    log(text="Please source .profile to apply changes.", level="success")
