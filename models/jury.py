# -*- coding: utf-8 -*-

from dataclasses import dataclass, field
from typing import Optional, TYPE_CHECKING

if TYPE_CHECKING:
    from models.person import Person
    from models.vote import Vote


@dataclass
class Jury(Person):
    """The jury :
    - id              : primary key of jury
    - votes_list : list of votes
    """
    id: Optional[int] = field(default=None, init=False)
    votes_list: list[Vote] = field(default_factory=list, init=False)

    def add_vote(self, vote: Vote) -> None:
        """
        - add the vote to this jury
        - set this jury to the vote """
        self.votes_list.append(self)
        vote.jury = self

    def __str__(self) -> str:
        person_str = super().__str__()
        return f"{person_str}"
