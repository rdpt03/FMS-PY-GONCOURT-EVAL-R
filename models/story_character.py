# -*- coding: utf-8 -*-

from __future__ import annotations

from typing import Optional, TYPE_CHECKING
from dataclasses import dataclass, field

if TYPE_CHECKING:
    from models.book import Book


@dataclass
class StoryCharacter:
    """publisher class :
    - id            : primary key
    - name          : character's name
    - role          : character's role
    - description   : Description of the character
    """
    id: Optional[int] = field(default=None, init=False)
    name: str
    role: str
    description: str
    book: Optional[Book] = field(default=None, init=False)

    #to complete
    def set_book(self, book: Book) -> None:
        """add :
        - add the character to the given book list
        - set this book to the character"""
        self.book = book
        book.story_characters.append(self)

    def __str__(self):
        return (f"character's name : {self.name}\n"
                f"character's role : {self.role}\n"
                f"chatacter's description : {self.description}\n\n")


