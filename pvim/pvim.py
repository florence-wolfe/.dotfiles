#!/usr/bin/env python3

import os
import sys
import shutil
from pvim_update import update_pvim, check_darwin, check_windows

is_darwin = check_darwin()
is_windows = check_windows()

# Get the current environment variables of the host system
env = os.environ.copy()
# Update the environment variables of the current process with the host system variables
os.environ.update(env)

if is_darwin:
    pvim = os.path.dirname(os.path.realpath(__file__))
    bin_path = "/nvim-macos/bin/nvim"
elif is_windows:
    pvim = os.path.dirname(os.path.abspath(__file__))
    bin_path = "/nvim-win64/bin/nvim.exe"
else:
    pvim = os.path.dirname(os.path.realpath(__file__))
    bin_path = "/nvim.appimage"

def set_nv():
    os.environ['PVIM'] = pvim
    if os.path.isfile(pvim + bin_path):
        return pvim + bin_path
    elif (
        shutil.which("nvim")
        and os.path.realpath(shutil.which("nvim")) != os.path.join(pvim, "pvim")
    ):
        return "nvim"
    else:
        print("Initializing PVIM")
        if is_darwin:
            update_pvim(darwin=True)
        elif is_windows:
            update_pvim(windows=True)
        else:
            update_pvim()
        return pvim + bin_path


nv = set_nv()

update_flag = False
args = sys.argv[1:]

if "--update" in args:
    update_flag = True
    args.remove("--update")

if update_flag:
    if is_darwin:
        update_pvim(darwin=True)
    elif is_windows:
        update_pvim(windows=True)
    else:
        update_pvim()
else:
    if is_windows:
        cmd = f"{nv} --clean -i \"{os.path.join(pvim, 'clutter', 'shada', 'state')}\" -u \"{os.path.join(pvim, 'pvim.lua')}\" {' '.join(args)}"
    else:
        cmd = f"{nv} --clean -i '{os.path.join(pvim, 'clutter', 'shada', 'state')}' -u '{os.path.join(pvim, 'pvim.lua')}' {' '.join(args)}"
    exit_code = os.system(cmd)
