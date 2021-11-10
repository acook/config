Dotfile Configuration for OSX and Linux
=======================================

Maintains a (mostly) homogenous configuration setup across Linux and OSX platforms.

*Anthony M. Cook 2006-2021 - http://github.com/acook | @anthony_m_cook | http://anthonymcook.com*


How to Install
--------------

0. Open a terminal in the same directory as this file.
0. Run `./install.sh`
0. `source ~/.bash_profile`
0. Enjoy!


What the `install.sh` script does
---------------------------------

- Asks you for info to set up your git config.
- Backs up any existing configuration files.
- Creates symlinks to the dotfiles in the repo.
- Pulls all the submodules contained in this repo.


Prerequisites
-------------

- **bash**      : http://www.gnu.org/s/bash      - The install scripts were written for `bash`, but there are configuration files for `fish` and `zsh` as well.
- **git**       : http://git-scm.com             - Without git the install script will complain at the end and you won't get any of the submodules, but it will still happily do everything else.
- **coreutils** : http://www.gnu.org/s/coreutils - GNU basic utilities, some aliases and functions in the bash configuration may fail. (Preinstalled on Linux), use Homebrew to install on macOS)

*Note that my configuration files use GNU syntax, not BSD syntax.*


Recommended
-----------

- **my-scripts** : https://github.com/acook/my-scripts - The included `.bash_profile` will attempt to load the prompt files from this repo.
- **neovim**        : https://neovim.io/               - Several of the configuration files included here are for or involve NeoVim (and Vim).
- **diffutils**  : http://www.gnu.org/s/diffutils      - GNU file diffing utilities come in handy too.
- **colordiff**  : http://colordiff.sourceforge.net    - I pattern match with color, so this is a must for me.
- **ripgrep**       : https://github.com/BurntSushi/ripgrep               - A fast and powerful alternative to grep.
- **homebrew**   : http://mxcl.github.com/homebrew     - Easily compile and install applications from source. Everything in the *Prequisite* and *Recommended* lists can be easily obtained with brew.

You can use the script with your own collection of dotfiles
-----------------------------------------------------------

0. Fork this repo.
0. Clear out the dotfiles directory.
0. Clean up any `script/pre_install` or `script/post_install` files you don't want or add your own.
0. Drop in your own configuration files.
0. Commit and push to your repo.
0. Run with `./install.sh`.

Cheatsheet
----------

### Vim Commands

Unless otherwise specified, these commands are invoked from Normal mode.

The colon (`:`) prefix indicates Command mode.

The `<Leader>` is backslash (`\`) by default.

#### Shoftcuts, Macros, and Functions

*General Helpers*

- `<Leader>d`   - Diff current buffer with associated file on disk.
  Good for seeing what you've changed before you save, or comparing changes from recovered vim sessions.
- `<Leader>cd`  - Change Vim's working directory to that of the parent directory of the current buffer's file.

*Tab Management*

- `<Control>t`            - Open a new tab.
- `<Control><Tab>`        - Change to next tab.
- `<Control><Shift<Tab>`  - Change to previous tab.

*Window Navigation*

- `<Control>h`  - Go to window left of current.
- `<Control>j`  - Go to window below current.
- `<Control>k`  - Go to window above current.
- `<Control>l`  - Go to window right of current.

*Search*

- `<Leader>/`  - Toggle search highlighting.

*Other Niceties*

- Tenkey (number keypad) on non-Apple keyboards works in terminal Vim on macOS.
- Mouse and Trackpad scrolling works in any terminal that can send mouse information.
- Bash-like command line navigation in Command mode.
- Automatically enables search highlighting when using the standard search commands (`/`,`?`,`n`,`N`).
- Turn off search highlighting in Normal mode when hitting <Enter> key.

#### Buffer Changeset Exploration

Far beyond just undo/redo, Vim stores the entire tree of your changes whether you save or not in an SCM-like system in memory.
I use the Undotree plugin to open this functionality up to explore the changes and undo tree of your current Vim buffer.

- `<Leader>u`  - Toggles the changeset tree in a left-side vertical split.

#### File/Directory/Buffer Navigation

*The "F" set of Search Utilities* (using the "CtrlP" plugin currently)

- `<Leader>ff`  - Opens fuzzy file search to open files.

  This indexes all the files to be searched when triggered, with pros and cons.
  This will pull the file list from Git by default, which is very fast.
  However, if Git doesn't know about your file, it won't show up here.
  If you use it in a large non-Git directory (like / or ~) it might lag.
  See below for the "L" set of file search utilities for an alternate method.

- `<Leader>ft`  - Opens fuzzy tag search to search Ctags tag lists.
- `<Leader>fb`  - Opens fuzzy buffer search to find named buffers.
- `<Leader>fd`  - Opens fuzzy directory search to change directories.
- `<Leader>fm`  - Opens fuzzy MRU search to pick from recent files.
- `<Leader>fq`  - Opens fuzzy quickfix search if connected to your debugger.

When the search window is enabled you can also do a few more things:

- `<F5>`        - refreshes the cache
- `<Control>d`  - disables full path search, does filename only matching
- `:<...>`      - a colon at the end of a file can be followed by a vim command

#### Working with Git

The Fugitive and Gitv plugins are used for this functionality.

- `:Gitv`    - Show a Gitk-like view of commits in the current repo in a new tab.
- `:Gblame`  - Show Git's blame on the current file in a vertical split.
