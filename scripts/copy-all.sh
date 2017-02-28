#!/bin/bash
for m in /media/* ; do rm -rf $m/* ; done
for m in /media/* ; do cp -rv * $m &  done

