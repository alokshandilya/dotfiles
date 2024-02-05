#!/usr/bin/env python3

import subprocess


def open_program(program, url=None):
    # Open the program
    if url:
        subprocess.Popen([program, url])
    else:
        subprocess.Popen([program])


# Define the programs to open
programs = ["spotify", "github-desktop"]

# Open each program
for program in programs:
    open_program(program)

open_program("microsoft-edge-stable", "http://www.google.com")

# Open lvim in a new kitty terminal
command_lvim = "kitty -e lvim"
subprocess.Popen(command_lvim.split())

open_program("microsoft-edge-stable", "https://www.bing.com/chat")
