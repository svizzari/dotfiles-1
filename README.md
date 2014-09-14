dotfiles
======

A collection of the configuration files used on development machines. These are generic, OS agnostic, idempotent configurations that can be used in conjunction with [OS X](https://github.com/tmcinerney/dotfiles-osx) and [Ubuntu](https://github.com/tmcinerney/dotfiles-ubuntu) specific configurations. 

## Getting started

The main assumption is that you will have the corresponding programs installed (i.e. [zsh](http://zsh.sourceforge.net/)). It doesn't matter if you install the dotfiles before or after the programs are installed.

I currently bootstrap my machines using [Boxen](https://boxen.github.com/) for OS X, and [bootstrap-ubuntu](https://github.com/tmcinerney/bootstrap-ubuntu).

### Configuration

Configuration is done using a JSON based [configuration file](https://github.com/tmcinerney/dotfiles/blob/master/install.conf.json) to describe what needs to be done. For example;

```json
[
  {
    "clean": ["~"]
  },
  {
    "shell": [
      ["git update-submodules", "Installing/updating submodules"]
    ]
  },
  {
    "link": {
      "~/.ackrc":     "ackrc",
      "~/.gitignore": "gitignore",
      "~/.npmrc":     "npmrc",
      "~/.oh-my-zsh": "zsh/oh-my-zsh/",
      "~/.rspec":     "rspec",
      "~/.tmux.conf": "tmux.conf",
      "~/.vim":       "vim/",
      "~/.vimrc":     "vimrc",
      "~/.zshrc":     "zshrc"
    }
  }
]
```

In this case it will:

1. Clean the home folder `~`
0. Update any submodules you have within your dotfiles folder (i.e. vim plugins)
0. Link the files and folders specified to the home folder.

For more information, please check out the [dotbot](https://github.com/anishathalye/dotbot) repository.

### Installation

To install your dotfiles, you simply need to run the following command inside your dotfiles folder.

```sh
./install
```

That's it! You should see some output for each of the files/folders configured, including any errors. You can run this as often as you like as the script is idempotent.

## Help?

Feel free to contact me if you have any questions of comments.
