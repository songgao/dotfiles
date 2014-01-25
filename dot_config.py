import os

HOME = os.getenv("HOME")

confs = {
        'tmux': [
            ('f', '.tmux.conf', HOME + '/.tmux.conf'),
            ('d', '.tmux', HOME + '/.tmux'),
            ],
        'vim': [
            ('f', '.vimrc', HOME + '/.vimrc'),
            ('d', '.vim', HOME + '/.vim'),
            ],
        'git': [
            ('f', '.gitconfig', HOME + '/.gitconfig'),
            ('f', '.gitignore_global', HOME + '/.gitignore_global')
            ],
        'zsh': [
            ('f', '.zshrc', HOME + '/.zshrc'),
            ('d', '.oh-my-zsh', HOME + '/.oh-my-zsh'),
            ],
        }
