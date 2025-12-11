from business.goncourt import Goncourt
from daos.book_dao import BookDao
from view import components

class InvitedView:
    def __init__(self,goncourt):
        self.goncourt = goncourt
    #logic: op1 invited_menu_choose_option -> goncours.print_all_books && ask_book_detals <---
    #       op2 invited_menu_choose_option -> menu_choose_session -> ask_session_books -> goncourt.print_all_books_by_session_id && ask_book_details <---
    def invited_menu_choose_option(self):
        """
        static function to show initial menu to invited
        :param goncourt: the goncourt general instance
        """

        invited_menu_v = True
        while invited_menu_v:
            components.barrier()
            print("Options d'invité \n"
                  "1 - Consulter tous les livres\n"
                  "2 - Consulter par session\n"
                  "3 - Retour <--\n")
            components.barrier()
            chosen_option = input("Choisir une option -> ")

            if chosen_option == "1":
                self.goncourt.print_all_books()
                self.ask_book_details()

            elif chosen_option == "2":
                self.menu_chose_session()

            elif chosen_option == "3":
                invited_menu_v = False

            else:
                print("Option non valide!")


    def ask_book_details(self):
        """
        function to ask and show book details
        :param goncourt: the goncourt general instance
        """
        print('Inserer le numero de livre pour afficher les details')
        print('Tapez quelque chose pour continuer')
        book_n = input('Reponse ->')

        #get book details:
        if book_n.isdigit():
            book_n = int(book_n)
            book = self.goncourt.get_book_by_id(book_n)
            if book:

                print(f'\n\n----------*n livre {book.id}*----------')
                print(book)
                print(f'Auteur : {book.author.first_name} {book.author.last_name}')
                print(f'Editeur : {book.publisher.name}')
                print(f'----------*Fun du livre*----------\n\n')
            else:
                print('Pas de livre trouvé')
            return
        else:
            return



    # ---------------------------SESSION-------------------------------------------
    def menu_chose_session(self):
        print(f'\n\n')
        components.barrier('Liste de sessions')
        sessions = self.goncourt.sessions
        for session in sessions:
            print(f'----------*session n {session.id}*----------')
            print(session.session_name)
            print(session.selection_date)
            print(f'----------* end of this session *----------')
        components.barrier('Fin de la liste')
        self.ask_session_books()


    def ask_session_books(self):
        """
        function to ask and show book details
        :param goncourt: the goncourt general instance
        """
        print('Type session number to session books')
        print('Type something else to exit')
        session_n = input('Reply ->')

        #get book details:
        if session_n.isdigit():
            #get session books and details by id
            session_n = int(session_n)
            #print all books with this session N
            self.goncourt.print_all_books_by_session_id(session_n)
            self.ask_book_details()

        return