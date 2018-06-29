# Aliases
Have you ever gotten tired of typing `git status` every time you want to know what changes you have made in your project? How about having to write `mkdir example` and `cd example` just to create and check out into a folder?

**Aliases** as the name suggests, creates aliases for you that you can use instead of having to type the entire command.
To get you started, I have some default aliases set up for you. you can edit them and change them any time to suit your need.

**Aliases** currently contains git and bash aliases.

# Prequisities
- You need to have `nano` text editor installed. you can find out whether you have it installed by typing `nano --version` in your terminal. For most linux distributions, it is installed by default. However, if you don't have it installed, you can quicky do that by typing `sudo apt-get install nano` in your terminal.

# Installation
- Clone the repository [Aliases](https://github.com/newtonkiragu/aliases/) in the root directory.
```$
cd && git clone https://github.com/newtonkiragu/aliases/
```
- Checkout into the cloned repository
```$
cd aliases
```
- Make the install script excecutable
```$
chmod +x install.sh
```
- Run the script
```$
./install.sh
```
- Open a new instance of your terminal emulator to start using aliases
- To view your aliases, run `alias` in your terminal

# adding aliases
To add a new alias, on the terminal, type `na` then edit the file appropriately.
## licence
MIT (c)Newton Kiragu [LICENCE](https://github.com/newtonkiragu/aliases/LICENCE)
