#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 20:22:20 2019

@author: bruno
"""

class Team:

    adc  = None
    sup  = None
    bot  = None
    top  = None
    jung = None
    team_name = ''
    champions = None

    def __init__(self,team_name ,adc, sup, bot, top, jung):
        self.adc  = adc
        self.sup  = sup
        self.bot  = bot
        self.top  = top
        self.jung = jung

        self.team_name = team_name

        self.champions = [adc, sup, bot, top, jung]

    def total_damage(self):
        damage = 0

        for c in self.champions:
            damage += c.damage

        return damage

