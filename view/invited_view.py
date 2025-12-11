from business.goncourt import Goncourt
from daos.book_dao import BookDao

#logic: op1 invited_menu_choose_option -> goncours.print_all_books && ask_book_detals <---
#       op2 invited_menu_choose_option -> menu_choose_session -> ask_session_books -> goncourt.print_all_books_by_session_id && ask_book_details <---
def invited_menu_choose_option(goncourt : Goncourt):
    """
    static function to show initial menu to invited
    :param goncourt: the goncourt general instance
    """
    invited_menu_v = True
    while invited_menu_v:
        print("Options d'invité \n"
              "1 - Consulter tous les livres\n"
              "2 - Consulter par session\n"
              "3 - Retour\n")
        chosen_option = input("Choisir une option -> ")

        if chosen_option == "1":
            goncourt.print_all_books()
            ask_book_details(goncourt)

        elif chosen_option == "2":
            menu_chose_session(goncourt)

        elif chosen_option == "3":
            invited_menu_v = False

        else:
            print("Option non valide!")


def ask_book_details(goncourt : Goncourt):
    """
    function to ask and show book details
    :param goncourt: the goncourt general instance
    """
    print('Type book number to check details')
    print('Type something else to exit')
    book_n = input('Reply ->')

    #get book details:
    if book_n.isdigit():
        book_n = int(book_n)
        book = goncourt.get_book_by_id(book_n)
        if book:

            print(f'\n\n----------*Book n {book.id}*----------')
            print(book)
            print(f'Author : {book.author.first_name} {book.author.last_name}')
            print(f'Publisher : {book.publisher.name}')
            print(f'----------*End of book*----------\n\n')
        else:
            print('No book with this number')
        return
    else:
        return



# ---------------------------SESSION-------------------------------------------
def menu_chose_session(goncourt : Goncourt):
    print(f'\n\n----------*Liste de sessions*----------')
    sessions = goncourt.sessions
    for session in sessions:
        print(f'----------*session n {session.id}*----------')
        print(session.session_name)
        print(session.selection_date)
        print(f'----------* end of this session *----------')
    print(f'----------*Fin de la liste*----------\n\n')
    ask_session_books(goncourt)


def ask_session_books(goncourt : Goncourt):
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
        goncourt.print_all_books_by_session_id(session_n)
        ask_book_details(goncourt)

        return
    #no number
    else:
        return