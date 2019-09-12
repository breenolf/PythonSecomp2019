#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 11 21:17:00 2019

@author: bruno
"""

from Champion import Champion

from PySide2.QtCore import QObject, Property, Signal, Slot
import pandas as pd

class Manager(QObject):

    __champions = []

    def __init__(self, path):
        super().__init__()
        data = pd.read_csv(path)

        for idx,c in data.iterrows():
            self.__champions.append(Champion(
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

    @Slot(int, result=Champion)
    def get(self,index):
        return self.__champions[index]

    champions_changed = Signal()
    @Property('QVariantList', notify=champions_changed)
    def champions(self): return self.__champions