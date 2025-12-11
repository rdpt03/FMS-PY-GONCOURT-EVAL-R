from typing import Optional, List

from daos.book_dao import BookDao
from daos.dao import Dao
from daos.jury_dao import JuryDao
from daos.session_dao import SessionDao
from models.vote import Vote


class VoteDao(Dao[Vote]):

    def vote_sql_to_oop(self, vote_sql) -> Vote:
        """Convert SQL result to Vote object"""
        oop_vote = None
        if vote_sql:
            oop_vote = Vote(None)
            oop_vote.id = vote_sql['id_vote']
            oop_vote.book=BookDao().read(vote_sql['id_book'])
            oop_vote.jury=JuryDao().read(vote_sql['id_jury'])

        return oop_vote


    def create(self, vote: Vote) -> int:
        """Create a vote in the database"""
        with Dao.connection.cursor() as cursor:
            sql = "INSERT INTO vote (id_jury, id_book, id_session) VALUES (%s, %s, %s);"
            cursor.execute(sql, (vote.jury.id if vote.jury else None,
                                 vote.book.id if vote.book else None,
                                 vote.session.id if vote.session else None))
            Dao.connection.commit()
            vote.id = cursor.lastrowid
        return vote.id


    def read(self, id_vote: int) -> Optional[Vote]:
        """Return the Vote object for the given id, or None"""
        with Dao.connection.cursor() as cursor:
            sql = "SELECT id_vote, id_jury, id_book, id_session FROM vote WHERE id_vote = %s;"
            cursor.execute(sql, (id_vote,))
            vote_sql = cursor.fetchone()
        return self.vote_sql_to_oop(vote_sql)


    def read_all(self) -> List[Vote]:
        """Return a list of all Vote objects"""
        oop_list = []
        with Dao.connection.cursor() as cursor:
            sql = "SELECT id_vote, id_jury, id_book, id_session FROM vote;"
            cursor.execute(sql)
            sql_list = cursor.fetchall()
            if sql_list:
                for v_sql in sql_list:
                    oop_list.append(self.vote_sql_to_oop(v_sql))
        return oop_list


    def update(self, vote: Vote) -> bool:
        """Update the Vote in the database"""
        with Dao.connection.cursor() as cursor:
            sql = "UPDATE vote SET id_jury=%s, id_book=%s, id_session=%s WHERE id_vote=%s;"
            cursor.execute(sql, (vote.jury.id if vote.jury else None,
                                 vote.book.id if vote.book else None,
                                 vote.session.id if vote.session else None,
                                 vote.id))
            Dao.connection.commit()
            return cursor.rowcount > 0


    def delete(self, vote: Vote) -> bool:
        """Delete the Vote from the database"""
        with Dao.connection.cursor() as cursor:
            sql = "DELETE FROM vote WHERE id_vote=%s;"
            cursor.execute(sql, (vote.id,))
            Dao.connection.commit()
            return cursor.rowcount > 0


    def read_all_from_session(self, session_id : int) -> List[Vote]:
        """Return a list of all Vote objects"""
        oop_list = []
        with Dao.connection.cursor() as cursor:
            sql = "SELECT id_vote, id_jury, id_book, id_session FROM vote WHERE id_session = %s;"
            cursor.execute(sql, (session_id,))
            sql_list = cursor.fetchall()
            if sql_list:
                for v_sql in sql_list:
                    oop_list.append(self.vote_sql_to_oop(v_sql))
        return oop_list