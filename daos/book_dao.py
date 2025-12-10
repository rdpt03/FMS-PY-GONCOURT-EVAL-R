from typing import Optional, List, TYPE_CHECKING

from models.author import Author
from models.book import Book
from daos.dao import Dao
from daos.author_dao import AuthorDao




class BookDao(Dao[Book]):
    def book_sql_too_oop(self, sql_book) -> Book:
        book_oop = None
        if sql_book:
            # create the oop
            book_oop = Book(sql_book['title'], sql_book['summary'], sql_book['release_date'], sql_book['pages_nb'],
                            sql_book['ISBN'], sql_book['publisher_price'])
            book_oop.id = sql_book['id_book']
        return book_oop


    def create(self, book: Book) -> int:
        """create a book in the database

        :param book: the book to save
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        ...


    def read(self, id_book: int) -> Optional[Book]:
        """Renvoit l'objet correspondant à l'entité dont l'id est id_entity
           (ou None s'il n'a pu être trouvé)"""
        # open connection
        with Dao.connection.cursor() as cursor:
            # command, execute and get
            sql = (
                "SELECT id_book, title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher FROM book"
                " WHERE id_book = %s;")
            cursor.execute(sql, (id_book,))
            book_sql = cursor.fetchall()



        return self.book_sql_too_oop(book_sql)

    def read_all(self) -> List[Book]:
        # create list
        oop_book_list = list()
        # open connection
        with Dao.connection.cursor() as cursor:
            #command, execute and get
            sql = (
                "SELECT id_book, title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher FROM book;")
            cursor.execute(sql)
            sql_book_list = cursor.fetchall()

            # transform into oop
            if sql_book_list:
                # for each
                for book_sql in sql_book_list:
                    # add to list
                    oop_book_list.append(self.book_sql_too_oop(book_sql))
        return oop_book_list

    def update(self, book: Book) -> bool:
        """Met à jour en BD l'entité correspondant à obj, pour y correspondre

        :param book: the book to upate
        :return: True si la mise à jour a pu être réalisée
        """
        ...


    def delete(self, book: Book) -> bool:
        """Supprime en BD l'entité correspondant à obj

        :param book: the book to delete
        :return: True si la suppression a pu être réalisée
        """
        ...

    def read_by_author(self, author : Author) -> List[Book]:
        # create list
        oop_book_list = list()
        # open connection
        with Dao.connection.cursor() as cursor:
            # command, execute and get
            sql = (
                "SELECT id_book, title, summary, release_date, pages_nb, ISBN, publisher_price, id_author, id_publisher FROM book WHERE id_author = %s;")
            cursor.execute(sql, (author.id,))
            sql_book_list = cursor.fetchall()

            # transform into oop
            if sql_book_list:
                # for each
                for book_sql in sql_book_list:
                    # add to list
                    oop_book_list.append(self.book_sql_too_oop(book_sql))
        return oop_book_list