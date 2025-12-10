from typing import Optional, List

from daos.dao import Dao
from models.publisher import Publisher


class PublisherDao(Dao[Publisher]):

    def publisher_sql_to_oop(self, publisher_sql) -> Publisher:
        """Convert SQL result to Publisher object"""
        oop_publisher = None
        if publisher_sql:
            oop_publisher = Publisher(
                name=publisher_sql['name']
            )
            oop_publisher.id = publisher_sql['id_publisher']
        return oop_publisher

    def create(self, publisher: Publisher) -> int:
        """Create a publisher in the database

        :param publisher: the publisher to save
        :return: the id of the inserted entity (0 if failed)
        """
        # Example implementation
        with Dao.connection.cursor() as cursor:
            sql = "INSERT INTO publisher (name) VALUES (%s);"
            cursor.execute(sql, (publisher.name,))
            Dao.connection.commit()
            return cursor.lastrowid

    def read(self, id_publisher: int) -> Optional[Publisher]:
        """Return the Publisher object for the given id, or None"""
        with Dao.connection.cursor() as cursor:
            sql = "SELECT id_publisher, name FROM publisher WHERE id_publisher = %s;"
            cursor.execute(sql, (id_publisher,))
            publisher_sql = cursor.fetchone()
        return self.publisher_sql_to_oop(publisher_sql)

    def read_all(self) -> List[Publisher]:
        """Return a list of all Publisher objects"""
        oop_list = []
        with Dao.connection.cursor() as cursor:
            sql = "SELECT id_publisher, name FROM publisher;"
            cursor.execute(sql)
            sql_list = cursor.fetchall()
            if sql_list:
                for pub_sql in sql_list:
                    oop_list.append(self.publisher_sql_to_oop(pub_sql))
        return oop_list

    def update(self, publisher: Publisher) -> bool:
        """Update the Publisher in the database"""
        with Dao.connection.cursor() as cursor:
            sql = "UPDATE publisher SET name=%s WHERE id_publisher=%s;"
            cursor.execute(sql, (publisher.name, publisher.id))
            Dao.connection.commit()
            return cursor.rowcount > 0

    def delete(self, publisher: Publisher) -> bool:
        """Delete the Publisher from the database"""
        with Dao.connection.cursor() as cursor:
            sql = "DELETE FROM publisher WHERE id_publisher=%s;"
            cursor.execute(sql, (publisher.id,))
            Dao.connection.commit()
            return cursor.rowcount > 0
