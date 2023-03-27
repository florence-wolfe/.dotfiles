import os
import platform
import zipfile
import tarfile
import urllib.request


def check_darwin():
    return platform.system() == "Darwin"


def check_windows():
    return platform.system() == "Windows"


def update_darwin(pvim):
    print("Updating for Darwin...")
    dir_path = os.path.realpath(pvim)
    print("Downloading latest Neovim")
    nvim_path = os.path.join(dir_path, "nvim-macos", "bin", "nvim")
    if os.path.isfile(nvim_path):
        os.remove(nvim_path)
    url = "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz"
    tar_file_path = f"{dir_path}/nvim-macos.tar.gz"
    urllib.request.urlretrieve(url, tar_file_path)
    with tarfile.open(tar_file_path, "r :gz") as tar:
        # extract all files and directories to the specified extract directory
        tar.extractall(dir_path)
    os.remove(tar_file_path)


def update_windows(pvim):
    print("Updating for Windows...")
    dir_path = os.path.realpath(pvim)
    print("Downloading latest Neovim")
    nvim_path = os.path.join(dir_path, "nvim-windows", "bin", "nvim.exe")
    if os.path.isfile(nvim_path):
        os.remove(nvim_path)
    url = "https://github.com/neovim/neovim/releases/download/nightly/nvim-win64.zip"
    zip_file_path = f"{dir_path}/nvim-win64.zip"
    urllib.request.urlretrieve(url, zip_file_path)
    with zipfile.ZipFile(zip_file_path, "r") as zip_file:
        # extract all files and directories to the specified extract directory
        zip_file.extractall(dir_path)
    # subprocess.run(["unzip", , "-d", dir_path])
    os.remove(zip_file_path)


def update_linux(pvim):
    print("Updating for Linux...")
    dir_path = os.path.realpath(pvim)
    print("Downloading latest Neovim")
    nvim_path = os.path.join(dir_path, "nvim.appimage")
    if os.path.isfile(nvim_path):
        os.remove(nvim_path)
    url = "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"
    urllib.request.urlretrieve(url, nvim_path)
    os.chmod(nvim_path, 0o744)


def update_pvim(darwin=False, windows=False):
    pvim = os.path.dirname(os.path.realpath(__file__))
    if darwin:
        update_darwin(pvim)
    elif windows:
        update_windows(pvim)
    else:
        update_linux(pvim)


if __name__ == "__main__":
    if check_darwin():
        update_pvim(darwin=True)
    elif check_windows():
        update_pvim(windows=True)
    else:
        update_pvim()
