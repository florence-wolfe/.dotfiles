import rich_click as click
from halo import Halo
from simbo.commands.command_utils import run_command, run_process


@click.command()
@click.option(
    "--update_channel", type=click.BOOL, default=False, help="Update Nixpkgs channel."
)
def nixpkgs(update_channel: bool):
    """Updates Nixpkgs."""
    if update_channel:
        run_command(
            command=update_nixpkgs_channel,
            error_message="Failed to update Nixpkgs channel.",
        )
        return
    run_command(
        command=update_nixpkgs_flake_inputs,
        error_message="Failed to update Nixpkgs flake inputs.",
    )


def update_nixpkgs_channel(spinner: Halo):
    spinner.start(text="Updating Nixpkgs channel.")
    run_process("nix-channel --update")
    spinner.succeed(text="Nixpkgs channel has been updated.")


def update_nixpkgs_flake_inputs(spinner: Halo):
    try:
        spinner.start(text="Updating nixpkgs flake inputs.")
        # TODO: Change to home dir
        run_process("nix flake update")
        spinner.succeed(text="Nixpkgs flake inputs have been updated.")
    except Exception as e:
        spinner.fail(text=f"Failed to update Nixpkgs flake inputs: {e}")
        