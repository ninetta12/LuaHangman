# LuaHangman
A hangman game that can be played in the terminal, made in Lua!

<p align="center">
  <img src="https://i.imgur.com/8m0b3ZP.png">
</p>


# Install dependencies
ascii-image-converter (install it here: https://github.com/TheZoraiz/ascii-image-converter)

ascii-image-converter is not required to run the game. If you don't install it, the game still works, but you won't see the hangman ascii art.

DNF (for fedora)
```
sudo dnf install lua luarocks && sudo luarocks install dkjson
```
APT (for debian, ubuntu, mint, etc)
```
sudo apt install lua luarocks && sudo luarocks install dkjson
```

# Installation
Do the following terminal commands in the correct order.

Make a clone of this repository inside your home directory
```
git clone https://github.com/ninetta12/LuaHangman
```

```
cd LuaHangman
```

Run the game
```
sh LuaHangman.sh
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
