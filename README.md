# vim-go-ide

This repository aims to provide a basic `.vimrc` file and instructions to set up Vim as a productive environment to develop programs esp. using the Go Programming Language. It leverages the great plugin [Vim-Go](https://github.com/fatih/vim-go) developed by [@fatih](https://github.com/fatih).

It also includes additional plugins that I often use to make Vim yet more productive. Please see list below.

This material is provided for free. These plugins and configurations work for me but there's no guarantee they will work for you. Use at your own risk!! You can also use the provided `.vimrc` file as a starting point and make changes according to your preferences.

## Plugins

The following plugins are used:
* [Vim-Go] (https://github.com/fatih/vim-go) : Go (golang) support for vim
* [Completor] (https://github.com/maralla/completor.vim.git): Keyboard completion support for Vim8
* [Neocomplete] (https://github.com/Shougo/neocomplete.vim): Keyboard completion support for Vim
* [TagBar] (https://github.com/majutsushi/tagbar.git): Outline tree for Vim
* [Neosnippet] (https://github.com/Shougo/neosnippet.vim): Code snippets support for Vim
* [vim-airline] (https://github.com/vim-airline/vim-airline): Status line plugin with support for a variety of features
* [Fugitive] (https://github.com/tpope/vim-fugitive): Best Git wrapper plugin for Vim
* [Vim-gitgutter] (https://github.com/airblade/vim-gitgutter): Enables git diff status on the gutter (side column)
* [Ctrl-p] (https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file finder for Vim
* [Nerdcommenter] (https://github.com/scrooloose/nerdcommenter): Easy code commenter plugin
* [Vim-autopairs] (https://github.com/jiangmiao/auto-pairs): Insert or delete brackets, parens, quotes in pair.
* [Numbers] (https://github.com/myusuf3/numbers.vim): Quickly switch line numbers on/off or set relative numbers
* [Surround] (https://github.com/tpope/vim-surround): Quickly add/delete/change surrounding brackets, quotes, tags, etc.
* [NERDTree] (https://github.com/scrooloose/nerdtree): Filesystem tree for Vim

## How to use

This repository assumes you're using either Linux or Mac OSX with Go and Git already installed.

In order to use this repository, simply follow the instructions to install the plugins and use the provided `.vimrc` file to start. You can clone this repository and link or copy the provided `.vimrc` file to your home directory.

TODO: Windows instructions

## Installing Vim
### Mac OSX
The Vim provided by Apple is the old 7.4 version and does not support features like Lua which would be required by the completion plugin. For this guide we will use Vim 8 installed using Homebrew. If you don't want to use Homebrew, you can always download and compile Vim from source.

Assuming Homebrew is installed, run the following command to install Vim 8:
```
brew update
brew install vim
```

*Note*:This command will install Vim8 but it will not overwrite the default Vim. I don't like to overwrite the default one so I just add an alias to the new installed version of Vim in the `.bash_profile` file, like this:
```
### Replacing default vim/vi
alias vim='/usr/local/bin/vim'
alias vi='/usr/local/bin/vim'
```

### Ubuntu Linux
For Ubuntu, I recommend using vim-nox which comes with support to several additional features, including Lua required by Neocomplete. Installing using the command below will install Vim 7.4 and the required pre-requisites:
```
sudo apt-get update
sudo apt-get install vim-nox
```

## Installing Pathogen

[Pathogen] (https://github.com/tpope/vim-pathogen) is a very simple and easy to use plugin manager for Vim. Pathogen allows plugin installation directly under the `.vim` directory by simply copying the plugin to the `bundle` directory. 

To install Pathogen, use the following commands:
```
mkdir -p ~/.vim/bundle/
git clone https://github.com/tpope/vim-pathogen.git ~/.vim/autoload/
```

Use the provided `.vimrc` file or add the following lines at the top of your `.vimrc` file:
```vim
execute pathogen#infect()
syntax on
filetype plugin indent on
```

## Installing Vim-Go

Clone vim-go
```
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
```

Start Vim and run the commands:
```vim
:Helptags
:GoInstallBinaries
```
The `:Helptags` command is used to create the help page for the plugin.

The `:GoInstallBinaries` command is used to download and install the Go utilities used by Vim-Go such as `gocode`, `golint`, etc.


*Optional*: Adding color schema (molokai):

I use the modified version of molokai [fatih/molokai](https://github.com/fatih/molokai) as color schema.

To use it, simply download the file `molokai.vim` from the link above and copy it to the `~/.vim/colors/` directory.

If you are not using the provided `.vimrc` file, add the following line to your `.vimrc` to enable the color schema:
```vim
colo molokai
```


## Installing a Keyboard Completion plugin

Automatic Keyboard completion (or context based suggestions) is one of the major features of an IDE. Vim provides autocompletion by pressing `<C-x><C-o>` keys but some plugins make the experience more real time and closer to the feelings of an IDE.

For autocomplete there are two options:
- For Vim 8, I recommend the [Completor] (https://github.com/maralla/completor.vim.git) plugin which works async and it's fast.
- For Vim 7, [Neocomplete] (https://github.com/Shougo/neocomplete.vim) works well for me.

### For Vim8 - Autocompletion - Completor

Just clone the Completor plugin:
```
git clone https://github.com/maralla/completor.vim.git ~/.vim/bundle/completor/
```

Completor should just work for Go completion based on gocode. For other languages, please check their Github for further instructions.


### For Vim 7 - Neocomplete
Neocomplete required Vim compiled with the Lua option so if you may need to reinstal Vim to enable it. If you are running Ubuntu and installed Vim according to the procedure above you're good to go. For other versions of Vim, please check their Github for details.

Clone the plugin:
```
git clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/bundle/neocomplete/
```

Add the following line to the `.vimrc` file to enable Neocomplete automatically (or uncomment it in the provided `.vimrc`):
```vim
let g:neocomplete#enable_at_startup = 1
```


## Installing Extra Plugins

* TagBar:

Tagbar leverages the `ctags` command to create the tags required to display the outline tree. It has to be installed before using TagBar.

For Mac OSX, using Homebrew:
```
brew update
brew install ctags
```

For Ubuntu:
```
sudo apt-get update
sudo apt-get install ctags
```

Install TagBar:
```
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar/
```

Add the following line to `.vimrc`:
```
nnoremap <silent> <F9> :TagbarToggle<CR>
```


* Neosnippet

Install neopsnippet:
```
git clone https://github.com/Shougo/neosnippet.vim.git ~/.vim/bundle/neosnippet/
```


Install default snippets:
```
git clone https://github.com/Shougo/neosnippet-snippets.git ~/.vim/bundle/neosnippet-snippets/
```


Add to `.vimrc`:
```vim
let g:go_snippet_engine = "neosnippet"
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
```


* vim-airline

Install vim-airline:
```
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
```

Add to `.vimrc`:
```
set laststatus=2
```


* Fugitive

Install Fugitive:
```
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive/
```

Execute the following command to generate the help for Fugitive:
```
vim -u NONE -c "helptags vim-fugitive/doc" -c q
```


* Nerd Commenter
```
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter/
```


* Vim-gitgutter
```
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter/
```


* Ctrl-p
```
git clone https://github.com/ctrlpvim/ctrlp.vim ~/.vim/bundle/ctrlp/
```


* Vim-autopairs
```
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
```


* Numbers plugin
```
git clone https://github.com/myusuf3/numbers.vim.git ~/.vim/bundle/numbers
```

Add to `.vimrc`:
```vim
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
```


* Surround:
```
git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround/
```


* NERDTree
```
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
```
