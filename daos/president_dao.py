from typing import Optional, List

from daos.dao import Dao
from models.president import President


class PresidentDao(Dao[President]):
    def president_sql_too_oop(self, president_sql) -> President:
        oop_president = None
        if president_sql:
            # create the oop
            oop_president = President(president_sql['first_name'], president_sql['last_name'],
                                      president_sql['born_date'])
            oop_president.id = president_sql['id_president']
        return oop_president


    def create(self, president: President) -> int:
        """create a president in the database

        :param president: the president to save
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        ...


    def read(self, id_president: int) -> Optional[President]:
        """Renvoit l'objet correspondant à l'entité dont l'id est id_entity
           (ou None s'il n'a pu être trouvé)"""
        # create list
        oop_president = None
        # open connection
        with Dao.connection.cursor() as cursor:
            # command, execute and get
            sql = (
                "SELECT pr.id_president, p.first_name, p.last_name, p.born_date FROM president pr"
                " INNER JOIN jury j ON pr.id_jury = j.id_jury"
                " INNER JOIN person p ON j.id_person = p.id_person"
                " WHERE id_president = %s;")
            cursor.execute(sql, (id_president,))
            president_sql = cursor.fetchall()

        return self.president_sql_too_oop(president_sql)

    def read_all(self) -> List[President]:
        # create list
        oop_president_list = list()
        # open connection
        with Dao.connection.cursor() as cursor:
            #command, execute and get
            sql = (
                "SELECT pr.id_president, p.first_name, p.last_name, p.born_date FROM president pr"
                " INNER JOIN jury j ON pr.id_jury = j.id_jury"
                " INNER JOIN person p ON j.id_person = p.id_person;")
            cursor.execute(sql)
            sql_president_list = cursor.fetchall()

            # transform into oop
            if sql_president_list:
                # for each
                for president_sql in sql_president_list:
                    #convert to oop
                    oop_president_list.append(self.president_sql_too_oop(president_sql))
        return oop_president_list

    def update(self, president: President) -> bool:
        """Met à jour en BD l'entité correspondant à obj, pour y correspondre

        :param president: the president to upate
        :return: True si la mise à jour a pu être réalisée
        """
        ...


    def delete(self, president: President) -> bool:
        """Supprime en BD l'entité correspondant à obj

        :param president: the president to delete
        :return: True si la suppression a pu être réalisée
        """
        ...