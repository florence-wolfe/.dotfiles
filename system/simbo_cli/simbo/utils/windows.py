import sys
import ctypes
import subprocess
from simbo.utils import get_os
from simbo.utils.constants import SYSTEMS
from .config import SimboConfig, Configuration


def is_windows_initialized() -> bool:
    config = SimboConfig()
    if get_os() != SYSTEMS.WINDOWS:
        return True

    return config.get(key=Configuration.INITIALIZED, default=False)


def is_admin():
    """Check if the script is running with admin privileges."""
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False
