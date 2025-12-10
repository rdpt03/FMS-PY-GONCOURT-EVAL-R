from typing import Optional, List

from daos.book_dao import BookDao
from daos.dao import Dao
from models.story_character import StoryCharacter


class StoryCharacterDao(Dao[StoryCharacter]):
    def character_sql_too_oop(self, character_sql) -> StoryCharacter:
        oop_character = None
        if character_sql:
            # create the oop
            oop_character = StoryCharacter(character_sql['name'], character_sql['role'],
                                           character_sql['description'])
            oop_character.id = character_sql['id_character']
        return oop_character


    def create(self, character: StoryCharacter) -> int:
        """create a character in the database

        :param character: the character to save
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        ...


    def read(self, id_character: int) -> Optional[StoryCharacter]:
        """Renvoit l'objet correspondant à l'entité dont l'id est id_entity
           (ou None s'il n'a pu être trouvé)"""
        # create list
        oop_character = None
        # open connection
        with Dao.connection.cursor() as cursor:
            # command, execute and get
            sql = (
                "SELECT id_character,id_book,role,description FROM story_character"
                " WHERE id_character = %s;")
            cursor.execute(sql, (id_character,))
            character_sql = cursor.fetchall()


        return self.character_sql_too_oop(character_sql)

    def read_all(self) -> List[StoryCharacter]:
        # create list
        oop_character_list = list()
        # open connection
        with Dao.connection.cursor() as cursor:
            #command, execute and get
            sql = (
                "SELECT id_character, name, id_book, role, description FROM story_character;")
            cursor.execute(sql)
            sql_character_list = cursor.fetchall()

            # transform into oop
            if sql_character_list:
                # for each
                for character_sql in sql_character_list:
                    oop_character_list.append(self.character_sql_too_oop(character_sql))
        return oop_character_list

    def update(self, character: StoryCharacter) -> bool:
        """Met à jour en BD l'entité correspondant à obj, pour y correspondre

        :param character: the character to upate
        :return: True si la mise à jour a pu être réalisée
        """
        ...


    def delete(self, character: StoryCharacter) -> bool:
        """Supprime en BD l'entité correspondant à obj

        :param character: the character to delete
        :return: True si la suppression a pu être réalisée
        """
        ...

    def read_all_by_book(self,book):
        # create list
        oop_character_list = list()
        # open connection
        with Dao.connection.cursor() as cursor:
            #command, execute and get
            sql = (
                "SELECT id_character, name, id_book, role, description FROM story_character WHERE id_book = %s ;")
            cursor.execute(sql,(book.id,))
            sql_character_list = cursor.fetchall()

            # transform into oop
            if sql_character_list:
                # for each
                for character_sql in sql_character_list:
                    # create the oop
                    oop_character = StoryCharacter(character_sql['name'], character_sql['role'], character_sql['description'])
                    oop_character.id = character_sql['id_character']
                    oop_character.book = book
                    # add to list
                    oop_character_list.append(oop_character)
        return oop_character_list
