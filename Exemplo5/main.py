#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 11 21:01:45 2019

@author: bruno
"""

from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine

import pandas as pd
import sys
import os

from Manager import Manager

app = QApplication(sys.argv)

manager = Manager('champions.csv')

engine = QQmlApplicationEngine()
ctx = engine.rootContext()
ctx.setContextProperty('manager', manager)
engine.load('main.qml')

sys.exit(app.exec_())
#%%


