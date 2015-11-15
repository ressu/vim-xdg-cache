# VIM script to set cache file locations

By default Vim uses the current directory to store all sorts of temporary files.
These clutter the working directory and are usually disabled by users.

The common way to fix the problem is to use something like this in .vimrc:
```vim
set directory^=~/tmp//
```

This will cause the named directory to be used as storage for swap files. This
is a good step, but there are number of variables that need to be set.

This script sets default directories so that paths are located inside the user
cache directory. Since the directories are forcibly created by the script, there
are no fallbacks set for the default locations.

## XDG Standard

XDG standard says that cache files should be stored by default in
`$HOME/.cache/<programname>` or in a user defined directory set by the variable
$XDG_CACHE_HOME
[XDG Spec](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html)

# Installation

You can use your favorite bundling tool to load the plugin

```vim
NeoBundle 'ressu/vim-xdg-cache'
```

# Current features

The script tries to detect if the user has set the `$XDG_CACHE_HOME` environment
variable or falls back to `$HOME/.cache` directory.

The directory `$XDG_CACHE_HOME/vim/` is created along with separate directories
for backup, undo and swapfiles.

After creating the directories, the respective variables are set

# Options

Setup of a named directory can be disabled by setting the global variable
related to the variable in question

```vim
set g:vim_xdg_cache_backupdir_disabled=1
set g:vim_xdg_cache_directory_disabled=1
set g:vim_xdg_cache_undodir_disabled=1
```

# Credits

This script was inspired by the
[xdg script](https://github.com/kaleb/vim-files/blob/master/xdg.vim) written by
[Kaleb Hornsby](https://github.com/kaleb)

## License

The MIT License (MIT)

Copyright (c) 2015 Sami Haahtinen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
