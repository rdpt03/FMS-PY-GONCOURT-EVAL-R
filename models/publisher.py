# -*- coding: utf-8 -*-

from __future__ import annotations

from typing import Optional, TYPE_CHECKING
from dataclasses import dataclass, field

if TYPE_CHECKING:
    from models.book import Book


@dataclass
class Publisher:
    """publisher class :
    - id            : primary key
    - name          : publisher's name
    - books_list    : publisher's book list
    """
    id: Optional[int] = field(default=None, init=False)
    name: str
    books_list: list[Book] = field(default_factory=list, init=False)

    def add_book(self, book: Book) -> None:
        """add :
        - the book to this publisher list
        - the publisher to this book"""
        self.books_list.append(book)
        book.publisher = self

    def __str__(self):
        return f"publisher's name : {self.name}"


