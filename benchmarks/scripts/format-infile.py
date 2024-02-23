#!/usr/bin/env python
#
# Format QUICK input files or xyz files consistently
#
# Written by Andreas Goetz
#

import os
import re
import sys
import argparse

parser = argparse.ArgumentParser(description='Format QUICK input files or xyz files consistently')
parser.add_argument('-i', '--infile', required=True, help="input file (QUICK input or xyz file)")
parser.add_argument('-o', '--outfile', required=True, help="output file (formatted QUICK input or xyz file)")
args = parser.parse_args()


# read
f = open(args.infile, 'r')

s = f.readline()
s += f.readline()

for l in f.readlines():
    if (l.strip() != ''):
        fields = l.split()
#        print(fields)
        atom = fields[0]
        coords = [float(x) for x in fields[1:]]
        s += '{:>2} {:16.8f} {:16.8f} {:16.8f}\n'.format(atom, *coords)

f.close()

# write
f = open(args.outfile, 'w')
f.write(s)
f.close()
