<div align="center">
</div>

This configuration is based on [💤 lazy.nvim](https://github.com/folke/lazy.nvim), modified with the aim of maximizing efficiency when programming and obtaining a minimalistic configuration that allows you to be productive.
![image](https://github.com/JoseMRodriguezM/dotfiles/assets/76118394/6b231519-6721-4ce2-9760-87f242b922f6)

![image](https://github.com/JoseMRodriguezM/dotfiles/assets/76118394/e9a84da2-11f8-4b8f-8336-5cca2c0244e7)

![image](https://github.com/JoseMRodriguezM/dotfiles/assets/76118394/636b3729-85a1-4c69-a430-b85de5933297)


## ⚡️ Requirements

- Neovim >= **0.8.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)

## 🚀 Getting Started

</details>

<details><summary>Installation </summary>

- Make a backup of your current Neovim files:

  ```sh
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  ```

- Clone the repositori

  ```sh
  git clone https://github.com/JoseMRodriguezM/dotfiles.git ~/.config/nvim
  ```

- Remove the `.git` folder, so you can add it to your own repo later

  ```sh
  rm -rf ~/.config/nvim/.git
  ```

- Start Neovim!

  ```sh
  nvim
  ```

</details>

---

## 📂 File Structure

<pre>
~/.config/nvim
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
</pre>
