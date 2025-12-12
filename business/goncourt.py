from dataclasses import field
from typing import List, Optional

from daos.book_dao import BookDao
from daos.session_dao import SessionDao
from daos.vote_dao import VoteDao
from models.book import Book
from models.session import Session
from models.vote import Vote


class Goncourt:
    sessions : List[Session]
    books : List[Book]

    def __init__(self):
        self.sessions = SessionDao().read_all()
        self.books = BookDao().read_all()


    def refresh(self):
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

    def create_session(self, session : Session) -> Optional[Session]:
        #create session on db
        result = SessionDao().create(session)

        #refresh local
        self.refresh()

        #return correct session
        for s in self.sessions:
            if session.id == s.id:
                return s
        return None

    def create_vote(self, session : Session, book : Book):
        # create vote
        vote = Vote()
        # set the data inside
        vote.set_session(session)
        vote.set_book(book)

        # insert to db
        VoteDao().create(vote)

        self.refresh()

    def associate_book_session(self, book : Book, session : Session):
        BookDao().associate_book_to_session(book,session)





    #get
    @staticmethod
    def get_book_by_id(id_book: int) -> Optional[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read(id_book)


    @staticmethod
    def get_session_by_id(id_session: int) -> Optional[Session]:
        session_dao: SessionDao = SessionDao()
        return session_dao.read(id_session)


