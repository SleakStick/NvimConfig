I use this Neovim config for Latex (among others) on my Arch machine

# Installation

1. Firstly install Neovim and NodeJS on your system with your default package manager
 
  **Windows:** `winget install Neovim.Neovim` Windows does not have a winget NodeJS package so get it from the [installer](https://nodejs.org/en/#home-downloadhead).

   **Archlinux** `pacman -S neovim nodejs npm`

  **Ubuntu** `apt install nodejs npm`

2. Clone the dotfiles in the `/.config/nvim` folder

`mkdir ~/.config/nvim`

`cd ~/.config/nvim`

`git clone https://github.com/SleakStick/NvimConfig.git`

For windows you should put the config in `AppData/Local/nvim/`. It should work however i have found the NvimTree to be pretty slow on Windows

3. Launch neovim using the `nvim`, type in `:Lazy` to open the LazyNvim package manager, the press `I` to install all and finally `:q` to quit the LazyNvim package manager and enjoy your new IDE.

# Usage

## Keybinds

The exhastive list of keybinds can be found by pressing `v`to enter visual mode, and the quick binds set up by this config can be seen by pressing space when in normal mode. Here are some Basic keybinds though.
1. `j-k` exit to normal mode, this keybind is very useful but getting it right can be tricky at the beginning.
   
The leader key is Space, so the following keybinds must be preceded by space.

2. `<l-c>` Compile latex document
3. `<e-e>` Open neovim File tree
4. `<f-f>` Fuzzy file finder
5. `<w-s>` Save current nvim session
6. `<w-r>` Open last saved nvim session
7. `<t-o>` Open new tab
8. `<t-n>` Switch Tabs
9. `<t-x>` Close current Tab
10. `<s-v>` Split layout vertically
11. `<s-h>` Split layout horizontally
12. `<s-x>` Close current split

I strongly encourage getting used to all the keybinds and shortcuts neovim has to offer, it can make editing code/documents a lot faster.

## Snippets

The whole list of snippets for latex can be found in `/luasnip/tex.lua` if you wish to find a specific snippet, simply search the command the snippet should fill, the description of each snippet contains exactly what it does. For example, looking for `\varepsilon` in the tex tells you that the snippet is `veps` and it will autofill (typing `veps` as a whole word will type `\varepsilon`).

Snippets that don't contain the `snippetType="autosnippet"` line, need to be expanded with the enter key. And points of interest (for example `\frac{ here }{ and here}` can be navigated through using `alt+j/k`.

There is a snippet for adding new snippets too, type `ns` and enter, then fill in your new snippet. Adding snippets is fast and easy and I really recommend doing so to better match your own workflow.

