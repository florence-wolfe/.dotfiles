import subprocess
from enum import StrEnum
from typing import Callable
from halo import Halo
from simbo.utils import with_bash


class Platform(StrEnum):
    linux = "Linux"
    macos = "Darwin"
    windows = "Windows"


def get_platform():
    import platform

    return platform.system()


def run_command(command: Callable[[Halo], None], error_message: str):
    with Halo() as spinner:
        try:
            spinner.start()
            command(spinner)
        except subprocess.CalledProcessError as e:
            spinner.fail(text=f"{error_message}: {e}")


def run_process(command: str, use_bash: bool = True, *args, **kwargs):
    if use_bash:
        command = with_bash(command)
    return subprocess.run(command, shell=True, *args, **kwargs)


def run_process_async(command: str, *args, **kwargs):
    return subprocess.Popen(with_bash(command), shell=True, *args, **kwargs)
