#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 11 21:14:42 2019

@author: bruno
"""

from PySide2.QtCore import QObject, Property, Signal, Slot


class Champion(QObject):
    __name = ''
    __champion_class = ''
    __style = -1
    __difficulty = -1
    __damagetype = ''
    __damage = -1
    __sturdiness = -1
    __crowd_control = -1
    __mobility = -1
    __functionality = -1

    def __init__(self, name, champion_class, style, difficulty, damagetype, damage, sturdiness, crowd_control, mobility, functionality):
        super().__init__()
        self.__name = name
        self.__champion_class = champion_class
        self.__style = style
        self.__difficulty = difficulty
        self.__damagetype = damagetype
        self.__damage = damage
        self.__sturdiness = sturdiness
        self.__crowd_control = crowd_control
        self.__mobility = mobility
        self.__functionality = functionality

    name_changed = Signal()
    @Property(str, notify=name_changed)
    def name(self): return self.__name
    @name.setter
    def set_name(self, val):
        self.__name = val
        self.name_changed.emit()

    champion_class_changed = Signal()
    @Property(str, notify=champion_class_changed)
    def champion_class(self): return self.__champion_class
    @champion_class.setter
    def set_champion_class(self, val):
        self.__champion_class = val
        self.champion_class_changed.emit()

    style_changed = Signal()
    @Property(int, notify=style_changed)
    def style(self): return self.__style
    @style.setter
    def set_style(self, val):
        self.__style = val
        self.style_changed.emit()

    difficulty_changed = Signal()
    @Property(int, notify=difficulty_changed)
    def difficulty(self): return self.__difficulty
    @difficulty.setter
    def set_difficulty(self, val):
        self.__difficulty = val
        self.difficulty_changed.emit()

    damagetype_changed = Signal()
    @Property(str, notify=damagetype_changed)
    def damagetype(self): return self.__damagetype
    @damagetype.setter
    def set_damagetype(self, val):
        self.__damagetype = val
        self.damagetype_changed.emit()

    damage_changed = Signal()
    @Property(int, notify=style_changed)
    def damage(self): return self.__damage
    @damage.setter
    def set_damage(self, val):
        self.__damage = val
        self.damage_changed.emit()

    sturdiness_changed = Signal()
    @Property(int, notify=sturdiness_changed)
    def sturdiness(self): return self.__sturdiness
    @sturdiness.setter
    def set_sturdiness(self, val):
        self.__sturdiness = val
        self.sturdiness_changed.emit()

    crowd_control_changed = Signal()
    @Property(int, notify=crowd_control_changed)
    def crowd_control(self): return self.__crowd_control
    @crowd_control.setter
    def set_crowd_control(self, val):
        self.__crowd_control = val
        self.crowd_control_changed.emit()

    mobility_changed = Signal()
    @Property(int, notify=mobility_changed)
    def mobility(self): return self.__mobility
    @mobility.setter
    def set_mobility(self, val):
        self.__mobility = val
        self.mobility_changed.emit()

    functionality_changed = Signal()
    @Property(int, notify=functionality_changed)
    def functionality(self): return self.__functionality
    @functionality.setter
    def set_functionality(self, val):
        self.__functionality = val
        self.functionality_changed.emit()