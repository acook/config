Dotfile Configuration for OSX and Linux
================

Maintains a (mostly) homogenous configuration setup across Linux and OSX platforms.

*Anthony M. Cook 2012 - http://github.com/acook | @anthony_m_cook | http://anthonymcook.com*


How to Use
----------

0. Open a terminal in the same directory as this file.
0. Run `./install.sh`
0. Enjoy!


What the `install.sh` script does
---------------------------------

- Asks you for info to set up your git config.
- Backs up any existing configuration files.
- Creates symlinks to the dotfiles in the repo.
- Pulls all the submodules contained in this repo.
- Sources your `.bash_profile` script.


Prerequisites
-------------

- **git** : http://git-scm.com - Without git the install script will complain at the end and you won't get any of the submodules, but it will still happily do everything else.
- **vim** : http://www.vim.org - Several of the configuration files included here are for or involve Vim.
- **coreutils** : http://www.gnu.org/s/coreutils - GNU basic utilities, some aliases and functions in the bash configuration may fail.
- **fileutils** : http://www.gnu.org/s/fileutils - GNU file manipulation utilities, some aliases and functions in the bash configuration may fail.

Note that my configuration files use GNU syntax, not BSD syntax.


Recommended
-----------

- **homebrew** : http://mxcl.github.com/homebrew - Easily compile and install applications from source. Everything in the **Prequisite** and **Recommended** lists can be easily obtained with brew, even brew itself, sort of. (OSX Only)
- **RVM** : http://beginrescueend.com - Install Ruby, manage sets of gems, manage multiple versions of Ruby.
- **ack** : http://betterthangrep.com - Grep-like utility excellent for source code.
- **colordiff** : http://colordiff.sourceforge.net - I pattern match with color, so this is a must for me.


You can use the script with your own collection of dotfiles
-------------

0. Fork this repo.
0. Clear out the dotfiles directory.
0. Drop in your own configuration files.
0. Commit and push to your repo.
0. Run with `./install.sh`.

Cheatsheet
----------

### Vim Commands

There are three File Navigation related plugins, they each have a different use case.

#### CtrlP

Full tree fuzzy file, tag, buffer, quickfix, and MRU file matching. Its amazing. It replaces FuzzyFinder.
Just don't use the file finder in a massive directory like / or ~, because it will lag on startup.

- <Leader>ff  - Opens fuzzy file finder.
- <Leader>ft  - Opens fuzzy tag finder.
- <Leader>fb  - Opens fuzzy buffer finder.
- <Leader>fd  - Opens fuzzy directory finder.
- <Leader>fm  - Opens fuzzy MRU finder.
- <Leader>fq  - Opens fuzzy quickfix finder.

When its open you can also do a few more things:

- <f5>   - refreshes the cache
- <c-d>  - disables full path search, does filename only matching
- :45    - a colon at the end of a file can be followed by a vim command

#### Lusty Explorer

Quick open files, does fuzzy matching per directory. Very fast, no startup lag.
Also includes some Buffer Navigation commands.

- <Leader>lf  - Opens filesystem explorer.
- <Leader>lr  - Opens filesystem explorer at the directory of the current file.
- <Leader>lb  - Opens buffer explorer.
- <Leader>lg  - Opens buffer grep.
- <Leader>lj  - Opens buffer juggler.

#### NERDtree

Useful for exploring directory structures, or keeping open on the side like a project window.

- :NERDtree
- :e .


Future
------

- Ignore failures when unable to find files or commands from my personal script repo.
- Multiple backups.
- Support mercurial.

