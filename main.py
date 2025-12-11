#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Application de gestion d'une école
"""
from business.goncourt import Goncourt
from view import main_view


def main() -> None:
    """Programme principal."""
    print("""\
--------------------------
Bienvenue dans le logiciel du Goncourt
--------------------------""")

    #get the data
    goncourt = Goncourt()

    menu_main = True
    main_view.menu_main(goncourt)

if __name__ == '__main__':
    main()
