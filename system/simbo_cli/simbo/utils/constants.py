import os
import getpass
import socket
from enum import Enum

DOTFILES_PATH = os.path.expanduser("~/.dotfiles")
PROFILE = f"{getpass.getuser()}@{socket.gethostname()}"


class SYSTEMS(str, Enum):
    LINUX = "linux"
    MACOS = "macos"
    WINDOWS = "windows"

    def __str__(self):
        return self.value
