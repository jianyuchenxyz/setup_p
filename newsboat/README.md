# Newsboat

## Installation

1. Install Newsboat using `apt-get`:

    ```sh
    sudo apt-get install newsboat
    ```

2. Copy file `urls` to directory `~/.newsboat/`.

3. For convenience, add the following line to the shell startup:

    ```sh
    which newsboat # /usr/bin/newsboat
    alias nb="/usr/bin/newsboat"
    ```

    Don't forget to `source` the shell startup file before executing `nb`.

    ```sh
    source ~/.bashrc
    # -- or --
    source ~/.bash_profile
    ```

