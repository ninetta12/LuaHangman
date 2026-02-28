# LuaHangman
A hangman game that can be played in the terminal, made in Lua!

<p align="center">
  <img src="https://i.imgur.com/8m0b3ZP.png">
</p>


# Install dependencies
ascii-image-converter (https://github.com/TheZoraiz/ascii-image-converter)

ascii-image-converter has some extra steps to installing it for some package managers (see the ascii-image-converter repository)
It's not required to run the game. If you don't install it, the game still works, but you won't see the hangman ascii art.

----
**DNF** (for Fedora, etc)
```
sudo dnf install lua luarocks && sudo luarocks install dkjson
```
install ascii-image-converter here: https://github.com/TheZoraiz/ascii-image-converter

----
**APT** (for Debian, Ubuntu, Mint, etc)
```
sudo apt install lua luarocks && sudo luarocks install dkjson
echo 'deb [trusted=yes] https://apt.fury.io/ascii-image-converter/ /' | sudo tee /etc/apt/sources.list.d/ascii-image-converter.list
sudo apt update
sudo apt install -y ascii-image-converter
```
----
**BREW** (for Linux, macOS, etc)
```
brew install TheZoraiz/ascii-image-converter/ascii-image-converter lua luarocks && luarocks install dkjson
```
----
# Installation
Do the following terminal commands in the correct order.

Make a clone of this repository.
```
git clone https://github.com/ninetta12/LuaHangman
cd LuaHangman
```

Run the game
```
sh LuaHangman.sh
```
-----
Run the game without ascii-image-generator
```
lua LuaHangman.lua
```
# How to play
type the letter you want to try at the end of the command that launches the game. Like this!
```
sh LuaHangman.sh a
```


You can give up with -giveup . This resets the game, and you'll get a new word.
```
sh LuaHangman.sh -giveup
```

To see more things you can do, use -help .
```
sh LuaHangman.sh -help
```
