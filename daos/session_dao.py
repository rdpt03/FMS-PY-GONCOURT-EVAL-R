from typing import Optional, List

from daos.book_dao import BookDao
from daos.dao import Dao
from models.book import Book
from models.session import Session
from models.vote import Vote


class SessionDao(Dao[Session]):

    def session_sql_to_oop(self, session_sql) -> Session:
        """Convert SQL result to Session object"""
        oop_session = None
        if session_sql:
            oop_session = Session(
                session_name=session_sql['session_name'],
                selection_date=session_sql['selection_date'],
                voting=session_sql['voting']
            )
            oop_session.id = session_sql['id_session']
            #get his books
            oop_session.books = self.get_session_books(oop_session)

            #get votes
            oop_session.votes = self.get_session_votes(oop_session)
        return oop_session

    def create(self, session: Session) -> int:
        """Create a session in the database

        :param session: the session to save
        :return: the id of the inserted entity (0 if failed)
        """
        with Dao.connection.cursor() as cursor:
            sql = "INSERT INTO session (session_name, selection_date, voting) VALUES (%s, %s, %s);"
            cursor.execute(sql, (session.session_name, session.selection_date, session.voting))
            Dao.connection.commit()
            session.id = cursor.lastrowid
        return session.id


    def read(self, id_session: int) -> Optional[Session]:
        """Return the Session object for the given id, or None"""
        with Dao.connection.cursor() as cursor:
            sql = "SELECT id_session, session_name, selection_date, voting FROM session WHERE id_session = %s;"
            cursor.execute(sql, (id_session,))
            session_sql = cursor.fetchone()
        return self.session_sql_to_oop(session_sql)


    def read_all(self) -> List[Session]:
        """Return a list of all Session objects"""
        oop_list = []
        with Dao.connection.cursor() as cursor:
            sql = "SELECT id_session, session_name, selection_date, voting FROM session;"
            cursor.execute(sql)
            sql_list = cursor.fetchall()
            if sql_list:
                for sess_sql in sql_list:
                    oop_list.append(self.session_sql_to_oop(sess_sql))
        return oop_list


    def update(self, session: Session) -> bool:
        """Update the Session in the database"""
        with Dao.connection.cursor() as cursor:
            sql = "UPDATE session SET session_name=%s, selection_date=%s, voting=%s WHERE id_session=%s;"
            cursor.execute(sql, (session.session_name, session.selection_date, session.voting, session.id))
            Dao.connection.commit()
            return cursor.rowcount > 0


    def delete(self, session: Session) -> bool:
        """Delete the Session from the database"""
        with Dao.connection.cursor() as cursor:
            sql = "DELETE FROM session WHERE id_session=%s;"
            cursor.execute(sql, (session.id,))
            Dao.connection.commit()
            return cursor.rowcount > 0


    def get_session_books(self, session : Session) -> List[Book]:
        return BookDao().read_by_session_id(session.id)


    def get_session_votes(self, session : Session) -> List[Vote]:
        from daos.vote_dao import VoteDao
        #get votes
        votes = VoteDao().read_all_from_session(session.id)
        #assign this session
        for vote in votes:
            vote.session = session
        return votes