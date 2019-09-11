#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 11 08:52:45 2019

@author: george
"""

from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine

import sys
import os

app = QApplication(sys.argv)

os.environ["QT_QUICK_CONTROLS_STYLE"] = "Material"
engine = QQmlApplicationEngine()
engine.load('main.qml')

sys.exit(app.exec_())
#%%