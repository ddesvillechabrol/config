# .dotfiles

To easily install, clone the repository to your home directory and run the installation script:

```
git clone --recurse-submodules https://github.com/ddesvillechabrol/.dotfiles.git
```

# Change flavour

You can use the following Python script to switch the flavour:
```
python path/to/.dotfiles/change_flavour.py --flavour latte
```

Note that any opened instances of nvim will not be updated. However, you can change the flavour on the fly using:
```
:Catppuccin latte
```

