#!/usr/bin/python3

#############################################################
# mkdb.py, by Emily <elishikawa at jagudev dot net>         #
# creates a packages.db (CSV) file that contains all pkgs   #
# with metadata, alphabetically sorted                      #
#############################################################

import os
import csv

print("Searching for packages...")
pkgs = os.listdir("packages")
pkgindex = {}
print(f'Found {str(len(pkgs))} packages!')

print("Parsing package.conf files...")
for package in pkgs:
    with open("packages/" + package + "/package.conf", "r") as pkgf:
        lines = [i.strip() for i in pkgf.readlines()]
        pkgindex[package] = {}
        for line in lines:
            pkgindex[package][line[:line.find('=')]] = line[line.find('=')+1:]
print(f'Parsed {str(len(pkgindex))} package.conf files!')

print("Writing packages.db...")
pkgc = 0
with open('packages.db', 'w') as pkgdbfile:
    writer = csv.DictWriter(pkgdbfile, fieldnames=['NAME', 'DESCRIPTION', 'VERSION', 'ARCHIVEURL', 'MAINTAINER', 'DEPENDS', 'CONFLICTS', 'CONFIGURECMD', 'CONFIGUREOPTS', 'TYPE', 'SEPBUILD', 'UNINSTALLCMD', 'LICENSE', 'SCRIPTS'], delimiter=';')
    for pkgobj in list(pkgindex.values()):
        writer.writerow(pkgobj)
        pkgc += 1
print(f'Wrote {str(pkgc)} packages to packages.db!')
        
