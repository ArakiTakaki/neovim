# neovim

## Getting/Started

```sh
git clone --depth 1 https://github.com/ArakiTakaki/neovim.git
```


## Neovimをセットアップする

### mac

Neovimのインストール

```sh
$ brew install neovim
```

依存パッケージのインストール

```sh
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
$ pip3 install --user pynvim
```

設定ファイルのリンク

```sh
$ ln -fs $PWD ~/.config/nvim
```

#### パッケージのインストール
```sh
:PackerCompile
:PackerInstall
```

### PackerCommand

ref https://github.com/wbthomason/packer.nvim

```
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
:PackerSync
```


