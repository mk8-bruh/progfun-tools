# progfun-tools

Simple toolset for automatically creating the standardized skeleton and testing programs
for the RUG CS Programming Fundamentals course

## Install

```bash
git clone https://github.com/mk8-bruh/progfun-tools ~/progfun-tools
bash ~/progfun-tools/install.sh
```

If the installer warns that `~/.local/bin` is not in `PATH`:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Requirements: bash, `gcc`
Optional: VSCode (`code`)

## progfun-templ

Creates a program skeleton

```
progfun-templ <filename> [-version V] [-date D] [-name N] [-email E]
```

First run asks for a default name and email, you can change them later:

```bash
progfun-templ --set-name "new name" --set-email "new@email.com"
```

Default version is `1.0` and default date is the current system date.

Description is multi-line, lines are inserted exactly as entered.
Finish by entering an empty line or pressing `Ctrl+D`.

## progfun-test

Compiles a file into a temporary binary and runs it

```
progfun-test <path/to/program.c> [args passed to the program...]
```

Compiler flags are `-std=c99 -Wall -pedantic -lm`

> The build directory is `/tmp/progfun-test`