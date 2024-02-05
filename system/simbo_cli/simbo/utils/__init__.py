import shutil
from typing import Literal
import rich_click as click


def with_bash(command: str) -> str:
    return f'bash -c "{command}"'


def check_exists(command: str) -> bool:
    exists = shutil.which(command)
    return bool(exists)


def get_os() -> Literal["linux"] | Literal["macos"] | Literal["windows"]:
    import platform

    system = platform.system()
    if system == "Linux":
        return "linux"
    elif system == "Darwin":
        return "macos"
    elif system == "Windows":
        return "windows"
    else:
        raise ValueError


GLYPHS = {
    "info": ["ℹ", "blue"],
    "success": ["✔", "green"],
    "warning": ["⚠", "yellow"],
    "error": ["✖", "red"],
}


def log(text: str, level: Literal["info", "success", "warning", "error"] = "info"):
    [glyph, color] = GLYPHS[level]
    styled_glyph = click.style(glyph, fg=color)
    click.echo(f"{styled_glyph} {text}")
