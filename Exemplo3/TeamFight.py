#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug 29 20:28:01 2019

@author: bruno
"""


class TeamFight:

    team_a = None
    team_b = None

    def __init__(self, team_a, team_b):
        self.team_a = team_a
        self.team_b = team_b

    def winner(self):
        if self.team_a.total_damage() > self.team_b.total_damage():
            return self.team_a
        else:
            return self.team_b