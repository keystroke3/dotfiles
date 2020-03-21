# Dotfiles
## About
This repo contains my most frequently used config files. If you use the same programs as I do
then they may be useful to you. Please make sure you read through the config files to know if
they will be useful to you and what you may want to change.

![Colorful Theme Desktop](https://raw.githubusercontent.com/keystroke3/dotfiles/master/screenshots/Colorful%20Theme.jpg)
**Colorful Theme**

![Stripes Theme Desktop](https://raw.githubusercontent.com/keystroke3/dotfiles/master/screenshots/Stripes%20Desktop.png)
**Stripes Theme**

![Kitty/Prompt](https://raw.githubusercontent.com/keystroke3/dotfiles/master/screenshots/kitty.png)
Kitty with Powerlevel10k themed prompt.

![ranger](https://raw.githubusercontent.com/keystroke3/dotfiles/master/screenshots/ranger.png)

## Prerequisites
Before you attempt to install these dots, you must first make sure your system is ready. Otherwise
they may not work as intended.

#### Fonts
For a basic install, you will need to have [Powerline](https://github.com/powerline/powerline) and [Font Awesome](https://github.com/FortAwesome/Font-Awesome) which will work fine for most of the
symbols to be visible. There are however, some widgets in polybar that will not load properly
and I would highly recommend getting the [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) and Noto Fonts packages. For polybar specifically, the necessary
fonts are `UbuntuMono Nerd` and `Noto Fonts Symbols`. These can be installed individually or as part of the previously
mentioned packages.

#### Colors
Colors are not that important to get right and you can go with whatever color scheme you wish. To manage
and control colors I use a [Pywal](https://github.com/dylanaraps/pywal). This program can be used to generate colors schemes and palettes which can 
the be integrated into other programs like terminals and Polybar. It is not a must you use it, but if you
want a consistent color scheme throughout your setup, it is recommended to use it.

#### Shell
I had used Bash since I began using Linux, and had been told many great things about Zsh. After using it
I can now say that I am a firm believer in Zsh. If you are still using Bash, you can use the bash files that
I have here, but keep in mind that the screenshots you see are all with Zsh. The outcome will therefor not look exactly the same.
For my Zsh install I use [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh) to manage my configuration. Visit their Wiki to find out how to use it. To get the prompt
bling, you will need a theme called [Powerlevel10k](https://github.com/romkatv/powerlevel10k). This is a reimplementation of the Powerlevel9k theme with a few additions to it.
You can view their respective Wikis to find out how to install them. If you already have 9k, you can just "upgrade" to 10k:

>For Powerlevel9k users  
If you've been using Powerlevel9k before, **do not remove the configuration options**. Powerlevel10k
will pick them up and provide you with the same prompt UI you are used to. Powerlevel10k recognized
all configuration options used by Powerlevel9k. See Powerlevel9k
[configuration guide](https://github.com/Powerlevel9k/powerlevel9k/blob/master/README.md#prompt-customization).
To go beyond the functionality of Powerlevel9k, type `p10k configure` and explore the unique styles
and features Powerlevel10k has to offer. You can further customize your prompt by editing
`~/.p10k.zsh`.

#### Vim
There's nothing much going on with Vim. The only extra thing you need [Plugged](https://github.com/junegunn/vim-plug). This will
allow you to get the plugins that are in `.vimrc`. I am not using Powerline status here but [vim-airline](https://github.com/vim-airline/vim-airline) instead.

#### Icons
You may notice that file names have been prepended by small icons. This does not come by default to get the icons, you will need to use a tool called `lsd` which is a replacement for the traditional `ls` command. You can find out about how to install and use it in the [here](https://github.com/Peltoche/lsd)


## Installation
If you have all things set up correctly, you can start copying the files. First, clone the repo:  
`git clone --recursive https://github.com/keystroke3/dotfiles.git`  
Note that `--recursive` is necessary if you want to get Polybar files.
After cloning, you can copy the files to their respective locations and then logout and log back in apply changes.
