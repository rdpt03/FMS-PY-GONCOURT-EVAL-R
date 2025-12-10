# -*- coding: utf-8 -*-


from __future__ import annotations

from typing import Optional, TYPE_CHECKING
from dataclasses import dataclass, field
from datetime import date

if TYPE_CHECKING:
    from models.story_character import StoryCharacter
    from models.book import Book
    from models.vote import Vote


@dataclass
class Session:
    """Books class :
    - id                : primary key
    - selection_date    : book's title
    - session_name      : summary of book
    - voting            : is the voting open (for future implementation with future jury)
    """

    id: Optional[int] = field(default=None, init=False)
    session_name: str
    selection_date: date
    voting : bool
    books: list[Book] = field(default_factory=list, init=False)
    votes: list[Vote] = field(default_factory=list, init=False)

    def add_book(self, book: Book) -> None:
        """set :
        - add this session to book
        - add  book to this session"""
        self.books.append(book)
        book.sessions.append(self)

    def add_vote(self, vote : Vote) -> None:
        """set :
        - the publisher to this book
        - add this book to the publisher"""
        self.votes.append(vote)
        vote.session = self

    def add_story_character(self, character: StoryCharacter) -> None:
        """
        - add the character to this book
        - set this book to the character"""
        self.story_characters.append(character)
        character.book = self



    def __str__(self):
        return (f"Book's name  : {self.title}\n"
                f"Summary: {self.summary}\n"
                f"Release date : {self.release_date}\n"
                f"N of pages : {self.pages_nb}\n"
                f"ISBN : {self.ISBN}\n"
                f"Publisher price : {self.publisher_price}\n"
                f"Publisher : {self.publisher.name}\n")


