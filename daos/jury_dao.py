from typing import Optional, List

from daos.dao import Dao
from models.jury import Jury


class JuryDao(Dao[Jury]):

    def jury_sql_too_oop(self, sql_jury) -> Jury:
        oop_jury = None
        if sql_jury:
            # create the oop
            oop_jury = Jury(sql_jury['first_name'], sql_jury['last_name'], sql_jury['born_date'])
            oop_jury.id = sql_jury['id_jury']
        return oop_jury


    def create(self, jury: Jury) -> int:
        """create a jury in the database

        :param jury: the jury to save
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        ...


    def read(self, id_jury: int) -> Optional[Jury]:
        # open connection
        with Dao.connection.cursor() as cursor:
            #command, execute and get
            sql = (
                "SELECT j.id_jury, p.first_name, p.last_name, p.born_date FROM jury j INNER JOIN person p ON j.id_person = p.id_person WHERE id_jury = %s;")
            cursor.execute(sql, (id_jury,))
            sql_jury = cursor.fetchone()

            # transform into oop
        return self.jury_sql_too_oop(sql_jury)


    def read_all(self) -> List[Jury]:
        # create list
        oop_jury_list = list()
        # open connection
        with Dao.connection.cursor() as cursor:
            #command, execute and get
            sql = (
                "SELECT j.id_jury, p.first_name, p.last_name, p.born_date FROM jury j INNER JOIN person p ON j.id_person = p.id_person;")
            cursor.execute(sql)
            sql_jury_list = cursor.fetchall()

            # transform into oop
            if sql_jury_list:
                # for each
                for jury_sql in sql_jury_list:
                    # create the oop
                    oop_jury = Jury(jury_sql['first_name'], jury_sql['last_name'], jury_sql['born_date'])
                    oop_jury.id = jury_sql['id_jury']
                    # add to list
                    oop_jury_list.append(oop_jury)
        return oop_jury_list

    def update(self, jury: Jury) -> bool:
        """Met à jour en BD l'entité correspondant à obj, pour y correspondre

        :param jury: the jury to upate
        :return: True si la mise à jour a pu être réalisée
        """
        ...


    def delete(self, jury: Jury) -> bool:
        """Supprime en BD l'entité correspondant à obj

        :param jury: the jury to delete
        :return: True si la suppression a pu être réalisée
        """
        ...