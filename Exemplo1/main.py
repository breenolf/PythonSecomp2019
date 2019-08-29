#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 17:38:17 2019

@author: bruno
"""

with open('champions.csv','r') as f:
    file = f.read()

lines = file.split('\n')

keys = lines[0].split(',')
lines = lines[1:-1]

champions = list(map(lambda line: {key:val for key, val in zip(keys,line.split(','))}, lines))
tanks = list(filter(lambda c: 'Tank' in c['Class'], champions))

champions.sort(key=lambda c: c['Difficulty'])

#%%