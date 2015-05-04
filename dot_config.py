import os

HOME = os.getenv("HOME")

confs = {
        'tmux': [
            ('f', '.tmux.conf', os.path.join(HOME, '.tmux.conf')),
            ],
        'vim': [
            ('f', '.vimrc', os.path.join(HOME, '.vimrc')),
            ('f', '.ycm_extra_conf.py', os.path.join(HOME, '.ycm_extra_conf.py')),
            ],
        'git': [
            ('f', '.gitconfig', os.path.join(HOME, '.gitconfig')),
            ('f', '.gitignore_global', os.path.join(HOME, '.gitignore_global')),
            ],
        'zsh': [
            ('f', '.zshrc', os.path.join(HOME, '.zshrc')),
            ('d', '.oh-my-zsh', os.path.join(HOME, '.oh-my-zsh')),
            ],
        }
