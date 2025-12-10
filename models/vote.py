# -*- coding: utf-8 -*-

from __future__ import annotations

from typing import Optional, TYPE_CHECKING
from dataclasses import dataclass, field


if TYPE_CHECKING:
    from models.book import Book
    from models.jury import Jury
    from models.session import Session


@dataclass
class Vote:
    """Books class :
    - id        : primary key
    - session   : vote's session
    - Book      : Vote's book
    - jury      : vote's jury
    - vote_date : is the voting open (for future implementation with future jury)
    """

    id: Optional[int] = field(default=None, init=False)
    session : Optional[Session]
    book: Optional[Book]
    jury: Optional[Jury]

    def set_book(self, book: Book) -> None:
        """
        - set the book to this vote
        - add this vote to the book """
        self.book = book
        book.votes.append(self)


    def set_session(self, session: Session) -> None:
        """
        - set the book to this vote
        - add this vote to the book """
        self.session = session
        session.votes.append(self)


    def set_jury(self, jury: Jury) -> None:
        """
        - set the book to this vote
        - add this vote to the book """
        self.jury = jury
        jury.votes_list.append(self)

