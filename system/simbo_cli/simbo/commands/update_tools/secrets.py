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

    list_output = run_process(
        command="vault kv list -format=json home", capture_output=True
    )
    list_json = json.loads(list_output.stdout)
    for secret_path in list_json:
        secrets_output = run_process(
            command=f"vault kv get -mount=home -format=json {secret_path} ",
            capture_output=True,
        )
        path_secrets = json.loads(secrets_output.stdout)
        # first data is for the metadata and the keys, second one is for the actual data
        secrets = path_secrets["data"]["data"]
        for key, value in secrets.items():
            secret_file_path = os.path.join(SECRETS_PATH, key)
            with open(secret_file_path, "w") as secret_file:
                secret_file.write(value)
    spinner.succeed(text="Updated secrets.")
    log(text="Please source .profile to apply changes.", level="success")
