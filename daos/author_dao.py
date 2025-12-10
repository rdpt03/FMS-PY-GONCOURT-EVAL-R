from typing import Optional, List

from daos.dao import Dao
from models.author import Author


class AuthorDao(Dao[Author]):

    def author_sql_to_oop(self, author_sql) -> Author:
        oop_author = None
        if author_sql:
            # create the oop
            oop_author = Author(author_sql['first_name'], author_sql['last_name'], author_sql['born_date'],
                                author_sql['biography'])
            oop_author.id = author_sql['id_author']
        return oop_author


    def create(self, author: Author) -> int:
        """create a author in the database

        :param author: the author to save
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        ...


    def read(self, id_author: int) -> Optional[Author]:
        """Renvoit l'objet correspondant à l'entité dont l'id est id_entity
           (ou None s'il n'a pu être trouvé)"""
        # open connection
        with Dao.connection.cursor() as cursor:
            # command, execute and get
            sql = (
                "SELECT a.id_author, p.first_name, p.last_name, p.born_date, a.biography FROM author a INNER JOIN person p ON a.id_person = p.id_person WHERE a.id_author = %s ;")
            cursor.execute(sql,(id_author,))
            author_sql = cursor.fetchone()

        return self.author_sql_to_oop(author_sql)


    def read_all(self) -> List[Author]:
        # create list
        oop_author_list = list()
        # open connection
        with Dao.connection.cursor() as cursor:
            #command, execute and get
            sql = (
                "SELECT a.id_author, p.first_name, p.last_name, p.born_date, a.biography FROM author a INNER JOIN person p ON a.id_person = p.id_person;")
            cursor.execute(sql)
            sql_author_list = cursor.fetchall()

            # transform into oop
            if sql_author_list:
                # for each
                for author_sql in sql_author_list:
                    # add to list
                    oop_author_list.append(self.author_sql_to_oop(author_sql))
        return oop_author_list


    def update(self, author: Author) -> bool:
        """Met à jour en BD l'entité correspondant à obj, pour y correspondre

        :param author: the author to upate
        :return: True si la mise à jour a pu être réalisée
        """
        ...


    def delete(self, author: Author) -> bool:
        """Supprime en BD l'entité correspondant à obj

        :param author: the author to delete
        :return: True si la suppression a pu être réalisée
        """
        ...