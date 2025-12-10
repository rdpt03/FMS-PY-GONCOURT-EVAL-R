# -*- coding: utf-8 -*-



from dataclasses import dataclass, field
from typing import Optional, TYPE_CHECKING
from datetime import date

if TYPE_CHECKING:
    from models.book import Book
    from models.person import Person


@dataclass
class Author(Person):
    """Author of one or more books :
    - id        : primary key of jury
    - biography : author's biography
    """
    id: Optional[int] = field(default=None, init=False)
    biography: date
    books_list: list[Book] = field(default_factory=list, init=False)


    def add_book(self, book: Book) -> None:
        """add :
        - the book to this publisher list
        - the publisher to this book"""
        self.books_list.append(book)
        book.author = self


    def __str__(self) -> str:
        person_str = super().__str__()
        return (f"{person_str}\n"
                f"Biography : {self.biography}")
