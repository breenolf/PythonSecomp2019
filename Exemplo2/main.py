#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 18:15:45 2019

@author: bruno
"""

import pandas as pd

champions = pd.read_csv('champions.csv')
tanks = champions[champions['Class'].str.contains('Tank')]
champions = champions.sort_values('Difficulty')

#%%


