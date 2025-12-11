# -*- coding: utf-8 -*-


from __future__ import annotations

from typing import Optional, TYPE_CHECKING, Counter
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
    n_of_winners : int
    session_n: int
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

    def get_winners_books(self) -> list[tuple[Book, int]]:
        """
        Function to get the winners of this session.
        Returns the top n_of_winners books based on votes.
        Uses a safe approach since Book objects are unhashable.
        """
        # Get votes count as a list of tuples (Book, count)
        book_votes = self.get_book_and_votes_number()

        # Sort by vote count descending
        book_votes_sorted = sorted(book_votes, key=lambda x: x[1], reverse=True)

        # Return only the top n_of_winners
        return book_votes_sorted[:self.n_of_winners]

    def get_book_and_votes_number(self):
        """
        Safely count votes per book while keeping the full Book object.
        Returns a list of tuples (Book, vote_count).
        Regroups books with the same id to sum votes correctly.
        """
        book_counter = []

        for vote in self.votes:
            if vote.book is None:
                continue

            # Look for the book in the current counter by unique id
            for entry in book_counter:
                if entry[0].id == vote.book.id:  # Compare by book ID
                    entry[1] += 1
                    break
            else:
                # Not found yet, add new entry
                book_counter.append([vote.book, 1])

        # Convert inner lists to tuples
        return [(book, count) for book, count in book_counter]

    def __str__(self):
        return (f"Session's name  : {self.session_name}\n"
                f"Selection date: {self.selection_date}\n"
                f"Voting state : {'Active' if self.voting else 'Ended'}\n"
                f"Number of winners : {self.n_of_winners}")


