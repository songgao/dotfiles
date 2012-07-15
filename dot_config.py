import os

HOME = os.getenv("HOME")

confs = {
        'tmux': [('f', '.tmux.conf', HOME + '/.tmux.conf'), ],
        'vim': [('f', '.vimrc', HOME + '/.vimrc'), ('d', '.vim', HOME + '/.vim'), ],
        'git': [('f', '.gitconfig', HOME + '/.gitconfig'), ],
        }
