from typing import List

from business.goncourt import Goncourt
from daos.book_dao import BookDao
from daos.vote_dao import VoteDao
from models.book import Book
from models.session import Session
from models.vote import Vote
from view import components

class PresidentView:
    def __init__(self, goncourt : Goncourt):
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
                self.create_new_session()

            # option 3 for director
            elif chosen_option == "3":
                menu_main = False

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
            if session.votes:
                ...
                #future to do automatically create from these results the next round
            else:
                print("Pas encore de votes, voulez vous enregistrer des votes? (o/n)")
                reply = input('Reponse ->')
                if reply.lower() in ['o','ouais','oui','y','yes','yessir']:
                    for book in session.books:
                        vote_nb = components.ask_int(f'Inserer la quantité de votes pour  {book.title}')
                        for i in range(1,vote_nb+1):
                            self.gc.create_vote(session,book)



    def create_new_session(self, n_of_winners_param : int = None, books_list_param : List[Book] = None ):
        #ask details
        name = input("Inserer le nom -> ")
        session_n = components.ask_int('Inserer le numero de la session [1,2,3] ',[1,2,3])
        selection_date = components.ask_date("Inserer la date prevue pour le vote ")
        #handle n_of_winners
        n_of_winners = -1
        if not n_of_winners_param:
            #n_of_winners = components.ask_int("Inserer le numero de vainqueurs souhaité\n 8 pour session 1,\n4 pour session 2,\n1 pour session 3",[8,4,1])
            if session_n == 1:
                n_of_winners = 8
            elif session_n == 2:
                n_of_winners = 4
            elif session_n == 3:
                n_of_winners = 1
        else:
            n_of_winners = n_of_winners_param

        voting = False #to be implemented when jury will be, for now is false

        #create session
        session = self.gc.create_session(Session(session_name=name,
                                       session_n=session_n,
                                       selection_date=selection_date,
                                       n_of_winners=n_of_winners,
                                       voting=voting))
        if not books_list_param:
            #handle add books
            list_of_books = self.gc.books

            #print
            for book in list_of_books:
                print(f'{book.title} - {book.id}')
            #get correct participants numbers
            participants = -1
            if session.session_n == 1:
                participants = 15
            elif session.session_n == 2:
                participants = 8
            elif session.session_n == 3:
                participants = 4
            #get result
            books_ids = input(f"Inserer les livres jusqa'a {participants} livres [separé par -] ou TOUT pour touts les livres").split('-')

            #for each turn
            if len(books_ids) == participants:
                for bid in books_ids:
                    #check if correct digit
                    if bid.isdigit():#digit
                        #get book
                        book = self.gc.get_book_by_id(int(bid))
                        #if book is get
                        if book:
                            self.gc.associate_book_session(book,session)
                            print(f'le livre {book.id} à été ajouté')
                        else:
                            print(f'Le livre {bid} n\'existe pas')
                    else:
                        print(f'{bid} n\'est pas un numero valide')
            else:
                print('numero de participants incorrect')
        else:
            for book in books_list_param:
                self.gc.associate_book_session(book, session)
