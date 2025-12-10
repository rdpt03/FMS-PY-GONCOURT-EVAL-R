# -*- coding: utf-8 -*-

from dataclasses import dataclass, field
from typing import Optional, TYPE_CHECKING
from models.jury import Jury



@dataclass
class President(Jury):
    """President of the goncourt :
    - id              : primary key of president
    """
    id: Optional[int] = field(default=None, init=False)

    def __str__(self) -> str:
        jury_str = super().__str__()
        return f"{jury_str}"
