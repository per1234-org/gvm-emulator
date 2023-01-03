# gvm emulator script

[![Check General Formatting status](https://github.com/per1234/gvm-emulator/actions/workflows/check-general-formatting-task.yml/badge.svg)](https://github.com/per1234/gvm-emulator/actions/workflows/check-general-formatting-task.yml)
[![Check License status](https://github.com/per1234/gvm-emulator/actions/workflows/check-license.yml/badge.svg)](https://github.com/per1234/gvm-emulator/actions/workflows/check-license.yml)
[![Check Markdown status](https://github.com/per1234/gvm-emulator/actions/workflows/check-markdown-task.yml/badge.svg)](https://github.com/per1234/gvm-emulator/actions/workflows/check-markdown-task.yml)
[![Check Prettier Formatting status](https://github.com/per1234/gvm-emulator/actions/workflows/check-prettier-formatting-task.yml/badge.svg)](https://github.com/per1234/gvm-emulator/actions/workflows/check-prettier-formatting-task.yml)
[![Check Shell Scripts status](https://github.com/per1234/gvm-emulator/actions/workflows/check-shell-task.yml/badge.svg)](https://github.com/per1234/gvm-emulator/actions/workflows/check-shell-task.yml)
[![Spell Check status](https://github.com/per1234/gvm-emulator/actions/workflows/spell-check-task.yml/badge.svg)](https://github.com/per1234/gvm-emulator/actions/workflows/spell-check-task.yml)
[![Sync Labels status](https://github.com/per1234/gvm-emulator/actions/workflows/sync-labels-npm.yml/badge.svg)](https://github.com/per1234/gvm-emulator/actions/workflows/sync-labels-npm.yml)

[**gvm**](https://github.com/moovweb/gvm) is a version manager for the Go programming language. Unfortunately **gvm** does not support Windows.

This script provides a partial emulation of the CLI of [**gvm**](https://github.com/moovweb/gvm) to allow the same commands to be used for management of Go version on all platforms.

## Installation

1. Add the path containing the script to the `PATH` environment variable.
1. Add the following line to `~/.bashrc`:
   ```text
   alias gvm="source gvm.sh"
   ```
   **ⓘ** The `source` is a hack to allow the script to modify the environment variables of the shell the script is executed from, as is required for the `gvm use` invocation to work.
