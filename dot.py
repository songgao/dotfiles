#!/usr/bin/env python2.7

import commands
import sys
import os
import shutil

from dot_config import confs

def print_help():
    tab = '    '
    print
    print 'Usage:'
    print tab, sys.argv[0], 'help'
    print tab, tab, 'Show this help document'
    print
    print tab, sys.argv[0], 'update'
    print tab, tab, 'Update .config from git source'
    print
    print tab, sys.argv[0], 'list'
    print tab, tab, 'List available confs'
    print
    print tab, sys.argv[0], 'show [conf]'
    print tab, tab, 'Show information on [conf]'
    print
    print tab, sys.argv[0], 'install [conf]'
    print tab, tab, 'Install [conf] to its destination'
    print

def update():
    commands.getstatusoutput("git pull origin master")
    commands.getstatusoutput("git submodule update --init --recursive")

def show(argv):
    for conf in argv:
        print
        print conf
        if conf in confs:
            for entry in confs[conf]:
                print   entry[0], entry[1].rjust(16), '-->', entry[2]
        else:
            print       '! conf name not found.'
    print

def show_list():
    print
    s = ''
    for conf in confs:
        s = s + conf + ' '
    print s
    print

def _bak(conf):
    cwd = os.getcwd()
    bakdir = os.path.join(cwd, 'bak')
    if not os.path.exists(bakdir):
        os.mkdir(bakdir)
    print 'Moving old files into ./bak/ (if there\'re any):'
    for entry in confs[conf]:
        if os.path.exists(entry[2]):
            bakname = os.path.join(bakdir, entry[1] + '.')
            index = 0
            while os.path.exists(bakname + str(index)):
                index = index + 1
            print entry[2], '-->', bakname + str(index)
            shutil.move(entry[2], bakname + str(index))

def install(argv):
    print
    cwd = os.getcwd()
    conf_dir = os.path.join(cwd, 'confs')
    for conf in argv:
        print '*', conf
        bak_hist = _bak(conf)
        print 'Installing', conf
        for entry in confs[conf]:
            src = os.path.join(conf_dir, entry[1])
            dst = entry[2]
            if entry[0] == 'f':
                shutil.copy(src, dst)
            elif entry[0] == 'd':
                shutil.copytree(src, dst)
            print src, '-->', dst
        print

def main():
    if len(sys.argv) == 1 or sys.argv[1] == 'help':
        print_help()
    elif sys.argv[1] == 'update':
        update()
    elif sys.argv[1] == 'list':
        show_list()
    elif sys.argv[1] == 'show' and len(sys.argv) > 2:
        show(sys.argv[2:])
    elif sys.argv[1] == 'install' and len(sys.argv) > 2:
        install(sys.argv[2:])
    else:
        print_help()

if __name__ == '__main__':
    main()
