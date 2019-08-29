#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 20:10:21 2019

@author: bruno
"""


class Champion:
    name = ''
    champion_class = ''
    style = -1
    difficulty = -1
    damagetype = ''
    damage = -1
    sturdiness = -1
    crowd_control = -1
    mobility = -1
    functionality = -1

    def __init__(self, name, champion_class, style, difficulty, damagetype, damage, sturdiness, crowd_control, mobility, functionality):
        self.name = name
        self.champion_class = champion_class
        self.style = style
        self.difficulty = difficulty
        self.damagetype = damagetype
        self.damage = damage
        self.sturdiness = sturdiness
        self.crowd_control = crowd_control
        self.mobility = mobility
        self.functionality = functionality

    def attack(self):
        print(f'O campeão {self.name} atacou!')