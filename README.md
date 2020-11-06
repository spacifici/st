This is my take on [st][1] terminal from suckless. As a [tmux][2] user, I do not
like the my terminal emulator to have tons of unneeded features with (sometimes)
conflicting key bindings: i.e. I do not need two ways to scroll, have splits and
multi-tab support as tmux has that already.


## Patches and mods

Below the list of applied patches and mods I made to the original code.

  * **Xresources patch**: this makes st configurable via the Xresources
    (`$HOME/.Xresources`). An example of such a file is
    [here](./examples/Xresources).
  * **program Xresources option** (`st.program`): I like to run tmux on every
    st instance without setting it as my shell, so I added this option and
    changed the st program execution order.
    
    What program is executed by st depends of these precedence rules:
    1. program passed with -e
    2. program passed via the program Xresources option
    3. scroll and/or utmp
    4. SHELL environment variable
    5. value of shell in /etc/passwd
    6. value of shell in config.h
  * **cursor colors** (`st.cursorColor` & `st.cursorColor2`): The original
    cursor color code was not working for me as st was using the default
    foreground color for the normal cursor and the default background color for
    the inverted one. I added an entry for the reverse cursor color and made it
    configurable via Xresources.
  * **netwwmicon patch**: It makes the program have an icon even if launched
    from the terminal.
  * **configurable columns and lines** (`st.cols` & `st.row`): I made the
    number of columns and lines configurable via Xresources.
  * **ligatures patch**
  * **desktop entry patch**
  * **one clipboard patch** + clippaste mod: you can copy from any graphical
    app (i.e. from the browser) with CTRL-C and paste in the shell with the
    middle button, every thing selected via the mouse in the shell can be
    pasted with CTRL-V.
  * **blinking cursor patch**


[1]: https://st.suckless.org/
[2]: https://github.com/tmux/tmux
