import os
import getpass
import socket
from pathlib import Path
from enum import Enum

DOTFILES_PATH = os.path.expanduser("~/.dotfiles")
PROFILE = f"{getpass.getuser()}@{socket.gethostname()}"
CONFIG_DIR = Path(os.path.expanduser("~/.simbo"))
WINDOWS_SCRIPT_PATH = Path(
    os.path.join(DOTFILES_PATH, "windows", "wsl", "boxstarter.ps1")
)


class SYSTEMS(str, Enum):
    LINUX = "linux"
    MACOS = "macos"
    WINDOWS = "windows"

    def __str__(self):
        return self.value
