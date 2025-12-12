from datetime import datetime
from typing import List


def barrier(text = ""):
    print(('-'*30) + text + ('-'*30))


def ask_date(msg : str):
    while True:
        date_str = input(f"{msg} [Format souhaité : jj/mm/aaaa] ")
        date_split = date_str.split("/")

        if len(date_split) != 3:
            print("Format de la date incorrecte")
            continue

        try:
            # Conversion correcte : jour, mois, année
            date = datetime(int(date_split[2]), int(date_split[1]), int(date_split[0]))
            return date
        except ValueError:
            print("Format de la date incorrecte")

def ask_int(msg : str, desired_numbers : List[int] = None):
    while True:
        #ask number
        int_str = input(f'{msg} [Inserer uniquement des numeros]')

        #convert to int
        if int_str.isdigit():
            #check if desired number
            if desired_numbers:
                if int(int_str) in desired_numbers:
                    return int(int_str)
            #no given desired numbers
            else:
                return int(int_str)
        else:
            print('Numero non valide')
