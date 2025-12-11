from business.goncourt import Goncourt
from view import invited_view, components
from view.president_view import PresidentView


def menu_main(goncourt : Goncourt):
    #add invited view
    president_view = PresidentView(goncourt)

    while menu_main:
        # initial
        components.barrier()
        print("---> Se connecter comme :  \n"
              "1 - Invité\n"
              "2 - Jury [pas encore implementé]\n"
              "3 - President\n")
        components.barrier()
        chosen_option = input("Choisir une option -> ")

        # option 1 for invited
        if chosen_option == "1":
            invited_view.invited_menu_choose_option(goncourt)

        # option 2 for jury
        elif chosen_option == "2":
            print("Fonctionnalité pas implementé!")

        # option 3 for director
        elif chosen_option == "3":
            president_view.president_menu()

        # default
        else:
            print("Option non valide!")