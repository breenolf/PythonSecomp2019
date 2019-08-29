#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 20:07:27 2019

@author: bruno
"""

import pandas as pd
from Champion import Champion
from Team import Team
from TeamFight import TeamFight

data = pd.read_csv('champions.csv')

champions = []

for idx,c in data.iterrows():
    champions.append(Champion(
            c.Name,
            c.Class,
            c.Style,
            c.Difficulty,
            c.DamageType,
            c.Damage,
            c.Sturdiness,
            c['Crowd-Control'],
            c.Mobility,
            c.Functionality))

team_a = Team('Avengers', champions[0],champions[10],champions[20],champions[30],champions[40])
team_b = Team('Liga da Justiça', champions[5],champions[15],champions[25],champions[35],champions[45])

fight1 = TeamFight(team_a, team_b)
fight1.winner().team_name

#%%
