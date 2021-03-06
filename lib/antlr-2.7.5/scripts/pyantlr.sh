#!/usr/bin/env python
import os,sys

from distutils.core import setup

## This is where module 'antlr' resides in the installed package
dstdir = '/usr/local/share/antlr-2.7.5'

## This is where module 'antlr' resides in the source distribution'
srcdir = '/home/rodrigob/java/antlr-2.7.5/scripts/../lib/python/antlr'
moddir = None

for d in [ dstdir, srcdir ] :
   moddir = d
   for f in [ '__init__.py','antlr.py' ] :
      if moddir :
         x = "%s/%s" % (moddir,f)
         if not os.path.exists(x) :
            sys.stderr.write('notice: "%s" does not exist - going to skip dir "%s")\n' % (x,moddir))
            sys.stderr.flush()
            moddir = None
   if moddir:
      break

if not moddir:
   sys.stderr.write('error: unable to find module "antlr".\n')
   sys.stderr.flush()
   sys.exit(1)
else:
   sys.stderr.write('notice: module "antlr" found in "%s"\n' % (moddir))

setup(name="antlr",
      version="2.7.5",
      description="Python runtime support for ANTLR-generated parsers",
      author="Wolfgang Haefelinger / Marq Kole",
      author_email="ora.et.labora@web.de",
      url="http://www.antlr.org/",
      packages=['antlr'],
      package_dir={'antlr' : moddir }
     )
