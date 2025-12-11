#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Application de gestion d'une école
"""
from business.goncourt import Goncourt
from daos.book_dao import BookDao
from view import invited_view


def main() -> None:
    """Programme principal."""
    print("""\
--------------------------
Bienvenue dans le logiciel du Goncourt
--------------------------""")

    #get the data
    goncourt = Goncourt()

    menu_main = True
    while menu_main:
        #initial
        print("---> Se connecter comme \n"
              "1 - Invité\n"
              "2 - Jury [pas encore implementé]\n"
              "3 - President\n")
        chosen_option = input("Choisir une option -> ")

        #option 1 for invited
        if chosen_option == "1":
            invited_view.invited_menu_choose_option(goncourt)

        #option 2 for jury
        elif chosen_option == "2":
            print("Fonctionnalité pas implementé!")

        #option 3 for director
        elif chosen_option == "3":
            ...

        #default
        else:
            print("Option non valide!")

if __name__ == '__main__':
    main()
