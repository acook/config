Dotfile Configuration for OSX and Linux
=======================================

Maintains a (mostly) homogenous configuration setup across Linux and OSX platforms.

*Anthony M. Cook 2013 - http://github.com/acook | @anthony_m_cook | http://anthonymcook.com*


How to Use
----------

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

- **git**       : http://git-scm.com             - Without git the install script will complain at the end and you won't get any of the submodules, but it will still happily do everything else.
- **coreutils** : http://www.gnu.org/s/coreutils - GNU basic utilities, some aliases and functions in the bash configuration may fail. (Preinstalled on Linux)

*Note that my configuration files use GNU syntax, not BSD syntax.*


Recommended
-----------

- **my-scripts** : https://github.com/acook/my-scripts - The included `.bash_profile` will attempt to load the prompt files from this repo.
- **vim**        : http://www.vim.org                  - Several of the configuration files included here are for or involve Vim.
- **homebrew**   : http://mxcl.github.com/homebrew     - Easily compile and install applications from source. Everything in the *Prequisite* and *Recommended* lists can be easily obtained with brew. (OSX Only)
- **RVM**        : http://beginrescueend.com           - Install Ruby, manage sets of gems, manage multiple versions of Ruby.
- **diffutils**  : http://www.gnu.org/s/diffutils      - GNU file diffing utilities come in handy too.
- **ack**        : http://betterthangrep.com           - Grep-like utility excellent for source code.
- **colordiff**  : http://colordiff.sourceforge.net    - I pattern match with color, so this is a must for me.


You can use the script with your own collection of dotfiles
-----------------------------------------------------------

0. Fork this repo.
0. Clear out the dotfiles directory.
0. Clean up any `script/pre_install` or `script/post_install` files you don't want.
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

- `<Control>n`            - Open a new tab.
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

- Non-Apple external keyboard tenkey (number keypad) works in terminal Vim on OSX.
- Mouse and Trackpad scrolling works in any terminal that can send mouse information.
- Bash-like command line navigation in Command mode.
- Automatically enables search highlighting when using the standard search commands (`/`,`?`,`n`,`N`).
- Turn off search highlighting in Normal mode when hitting <Enter> key.

#### Multiple Cursor Editing

Similar to how Sublime Text works, you can have multiple cursors. Hit `<Control>n` to start playing with them.

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

*The "L" set of Search Utilities* (using the "LustyExplorer" plugin currently)

Similar in overall function to the above utils, but using different stategies and interfaces.

- `<Leader>lf`  - Opens filesystem explorer in Vim's working directory.
- `<Leader>lr`  - Opens filesystem explorer at the directory of the current file.

  The above utils do not index files, so do no deep fuzzy matching of file names.
  It can easily delve into directories and match directories and files in a fuzzy manner however.

- `<Leader>lb`  - Opens buffer explorer for switching buffers by name.
- `<Leader>lg`  - Opens buffer grep which searches the contents of all buffers in memory.
- `<Leader>lj`  - Opens buffer juggler for rapidly switching between buffers.

#### Working with Git

The Fugitive and Gitv plugins are used for this functionality.

- `:Gitv`    - Show a Gitk-like view of commits in the current repo in a new tab.
- `:Gblame`  - Show Git's blame on the current file in a vertical split.

#### Ruby and Rails

Rails.vim provides a huge set of helpers for working with Rails projects.

- `:AV`  - Open test/object in vertical split.
- `:AS`  - Open test/object in horizontal split.
- `:A`   - Swap between test/object in current window.

Future
------

- Ignore failures when unable to find files or commands from the `my-scripts` repo.
- Multiple backups when installing.

