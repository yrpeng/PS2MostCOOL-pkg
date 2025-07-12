#!/usr/bin/env python
# This is the main exe for PS2Mostcool

import sys
from core.PSCore import PSEnv

if __name__ == "__main__":  
    print("----------------------PowerSynth MOSTCOOL----------------------")
    if len(sys.argv)<2:
        from PySide6.QtWidgets import QApplication
        from gui.PS2MostcoolGUI import MainWindow
        print("----------------------GUI version------------------")
        app = QApplication(sys.argv)
        window = MainWindow()
        window.show()
        sys.exit(app.exec())
    else:
        from PySide6.QtWidgets import QApplication
        from gui.PS2MostcoolGUI import MainWindow
        app = QApplication(sys.argv)
        window = MainWindow()
        #window.show()
        sys.exit(app.exec())

