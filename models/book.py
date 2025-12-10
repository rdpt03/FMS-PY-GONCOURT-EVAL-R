# -*- coding: utf-8 -*-




from __future__ import annotations

from typing import Optional, TYPE_CHECKING
from dataclasses import dataclass, field
from datetime import date

if TYPE_CHECKING:
    from models.publisher import Publisher
    from models.story_character import StoryCharacter
    from models.author import Author
    from models.session import Session
    from models.vote import Vote

@dataclass
class Book:
    """Books class :
    - id                : primary key
    - title             : book's title
    - summary           : summary of book
    - release_date      : book's release date
    - pages_nb          : book's total pages
    - ISBN              : ISBN number of book
    - publisher_price   : Book's publisher price
    - story_characters  : characters of story
    - sessions           : session participating
    - publisher         : publisher of this book
    """
    id: Optional[int] = field(default=None, init=False)
    title: str
    summary: str
    release_date: date
    pages_nb: int
    ISBN: str
    publisher_price: float
    story_characters: list[StoryCharacter] = field(default_factory=list, init=False)
    sessions: list[Session] = field(default_factory=list, init=False)
    publisher: Optional[Publisher]
    author: Optional[Author]
    votes: list[Vote] = field(default_factory=list, init=False)

    def set_publisher(self, publisher: Publisher) -> None:
        """set :
        - the publisher to this book
        - add this book to the publisher"""
        self.publisher = publisher
        publisher.books_list.append(self)

    def set_author(self, author : Author) -> None:
        """set :
        - the publisher to this book
        - add this book to the publisher"""
        self.author = author
        author.books_list.append(self)

    def add_story_character(self, character: StoryCharacter) -> None:
        """
        - add the character to this book
        - set this book to the character"""
        self.story_characters.append(character)
        character.book = self

    def add_vote(self, vote: Vote) -> None:
        """
        - add the vote to this jury
        - set this jury to the vote """
        self.votes.append(vote)
        vote.book = self

    def add_session(self, session: Session) -> None:
        """
        - add the vote to this jury
        - set this jury to the vote """
        self.sessions.append(session)
        session.books.append(self)



    def __str__(self):
        return (f"Book's name  : {self.title}\n"
                f"Summary: {self.summary}\n"
                f"Release date : {self.release_date}\n"
                f"N of pages : {self.pages_nb}\n"
                f"ISBN : {self.ISBN}\n"
                f"Publisher price : {self.publisher_price}\n"
                f"Publisher : {self.publisher.name}\n")


