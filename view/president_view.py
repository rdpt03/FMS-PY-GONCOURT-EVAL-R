from business.goncourt import Goncourt
from models.session import Session
from view import components

class PresidentView:
    def __init__(self, goncourt):
        self.gc = goncourt
        self.SECOND_SELECTION_PLACES = 8
        self.THIRD_SELECTION_PLACES = 4
    def president_menu(self):
        menu_main = True
        while menu_main:
            # initial
            components.barrier()
            print("---> Bonjour president\n"
                  "1 - Consulter les sessions\n"
                  "2 - Créer une session\n"
                  "3 - Retour <--\n")
            components.barrier()
            chosen_option = input("Choisir une option -> ")

            # option 1 for invited
            if chosen_option == "1":
                self.show_sessions_and_ask()

            # option 2 for jury
            elif chosen_option == "2":
                ...

            # option 3 for director
            elif chosen_option == "3":
                ...

            # default
            else:
                print("Option non valide!")

    def show_sessions_and_ask(self):
        """this function show and ask the session to interact"""
        components.barrier('Liste de sessions')
        #get sessions
        sessions = self.gc.sessions

        #print it
        for session in sessions:
            print(f'----------*Numero session : {session.id}*----------')
            print(session.session_name)
            print(session.selection_date)
            components.barrier()


        #ask
        print('Inserer le numero de session pour afficher details')
        print('Tapez quelque chose pour continuer')
        session_n = input('Reponse ->')

        # get book details:
        if session_n.isdigit():
            # get session books and details by id
            session_n = int(session_n)
            # print all books with this session N
            session = self.gc.get_session_by_id(session_n)
            self.show_session_details(session)

        return

    def show_session_details(self, session : Session):
        components.barrier(f'Session numero {session.id}')
        print(session)
        components.barrier('Livres et votes')
        for book, votes in session.get_book_and_votes_number():
            print(f'{book.title} de {book.author.first_name} {book.author.last_name} possède {votes} votes')

        components.barrier('vainqueurs')
        for book, votes in session.get_winners_books():
            print(f'{book.title} de {book.author.first_name} {book.author.last_name} est vainqueur avec {votes} votes')

        #handle first and second tour
        if len(session.get_winners_books())> 1:
            #go from first selection to second
            next_selection_count = 0

            #handle first
            if session.session_n == '1':
                print("voulez vous créer la 2eme session avec 4 gagnants \n en reprenant les vainqueurs de cette session (o/n)")
                self.create_new_session(4)
            elif session.session_n == '2':
                print("voulez vous créer la 3eme session avec 1 gagnant \n en reprenant les vainqueurs de cette session (o/n)")
                self.create_new_session(1)
            else:
                print('Felicitations')
        else:
            print('Felicitations')

    def create_new_session(self, param):
        pass
