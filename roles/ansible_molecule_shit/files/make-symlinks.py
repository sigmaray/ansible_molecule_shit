#!/usr/bin/python3

import os
import pathlib
from datetime import date
import uuid

folders_links = [
    [".config/google-chrome", "r/symlinks/.config/google-chrome"],
    [".config/google-chrome-beta", "r/symlinks/.config/google-chrome-beta"],
    [".ViberPC", "r/symlinks/.ViberPC"],
    # ["_", "r/symlinks/_"],
]

for from_to in folders_links:
    h = os.getenv('HOME') + "/"
    hfrom = h + from_to[0]
    hto = h + from_to[1]

    # if from path is not a symlink
    if not (os.path.islink(hfrom)):
        # create parent dir if it does not exist
        path = pathlib.Path(hfrom)
        parent = path.parent
        parent.mkdir(parents=True, exist_ok=True)

        # create destination dir if it does not exist
        pathlib.Path(hto).mkdir(parents=True, exist_ok=True)

        # If file/dir exists and it's not a symink, make a backup (rename file/dir)
        if os.path.exists(hfrom):
            os.rename(hfrom, hfrom + ".bak." +
                      date.today().strftime("%Y-%b-%d") + "." + uuid.uuid4().hex)

        # create symlink
        os.symlink(hto, hfrom)

files_links = [
    [".gitconfig", "r/symlinks/.gitconfig"],
    [".gitignore", "r/symlinks/.gitignore"],
    [".git-credentials", "r/symlinks/.git-credentials"],
    # ["__", "r/symlinks/__"]
]

for from_to in files_links:
    h = os.getenv('HOME') + "/"
    hfrom = h + from_to[0]
    hto = h + from_to[1]

    # if from path is not a symlink
    if not (os.path.islink(hfrom)):
        # create parent dir if it does not exist
        path = pathlib.Path(hfrom)
        parent = path.parent
        parent.mkdir(parents=True, exist_ok=True)

        # create destination file if it does not exist
        pathlib.Path(hto).touch()

        # If file/dir exists and it's not a symink, make a backup (rename file/dir)
        if os.path.exists(hfrom):
            os.rename(hfrom, hfrom + ".bak." +
                      date.today().strftime("%Y-%b-%d") + "." + uuid.uuid4().hex)

        # create symlink
        os.symlink(hto, hfrom)
