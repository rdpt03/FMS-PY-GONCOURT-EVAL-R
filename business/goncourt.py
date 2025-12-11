from dataclasses import field
from typing import List, Optional

from daos.book_dao import BookDao
from daos.session_dao import SessionDao
from models.book import Book
from models.session import Session


class Goncourt:
    sessions : List[Session] = field(default_factory=list, init=False)
    books : List[Book] = field(default_factory=list, init=False)

    def __init__(self):
        self.sessions = SessionDao().read_all()
        self.books = BookDao().read_all()

    def print_all_books(self):
        for book in self.books:
            print(f'----------*Book n {book.id}*----------')
            print(f'name : {book.title}')
            print(f'Author : {book.author.first_name} {book.author.last_name}')
        print('----------*End of list*----------')

    def print_all_books_by_session_id(self,session_id : int):
        #get session
        session = self.get_session_by_id(session_id)
        books_id = []
        #print books
        for book in session.books:
            print(f'----------*Book n {book.id}*----------')
            print(f'name : {book.title}')
            print(f'Author : {book.author.first_name} {book.author.last_name}')
            books_id.append(book.id)
        print('----------*End of list*----------')





    #get
    @staticmethod
    def get_book_by_id(id_book: int) -> Optional[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read(id_book)


    @staticmethod
    def get_session_by_id(id_session: int) -> Optional[Session]:
        session_dao: SessionDao = SessionDao()
        return session_dao.read(id_session)


