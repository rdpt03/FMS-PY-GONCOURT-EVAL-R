# -*- coding: utf-8 -*-

"""
abstract class Person
"""

from abc import ABC
from dataclasses import dataclass
from datetime import datetime


@dataclass
class Person(ABC):
    """Person."""
    first_name: str
    last_name: str
    born_date: datetime

    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}, {self.born_date}"

