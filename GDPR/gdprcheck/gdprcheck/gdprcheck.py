# -*- coding: utf-8 -*-

"""Main module."""
import os
import logging
from commonregex import CommonRegex
logging.basicConfig(level=logging.INFO)
log = logging.getLogger(__name__)


def scantree(path):
    """Recursively yield DirEntry objects for given directory."""
    for entry in os.scandir(path):
        if entry.is_dir(follow_symlinks=False):
            yield from scantree(entry.path)  # see below for Python 2.x
        else:
            yield entry

class PiiAnalyzer(object):
    def __init__(self, data):
        self.data = data
        self.parser = CommonRegex()

    def analyse(self):
        people = []
        organizations = []
        locations = []
        emails = []
        phone_numbers = []
        street_addresses = []
        credit_cards = []
        ips = []
        results = []

        for text in self.data:
            emails.extend(self.parser.emails(text))
            phone_numbers.extend(self.parser.phones("".join(text.split())))
            street_addresses.extend(self.parser.street_addresses(text))
            credit_cards.extend(self.parser.credit_cards(text))
            ips.extend(self.parser.ips(text))

        return {'people': people, 'locations': locations, 'organizations': organizations,
                'emails': emails, 'phone_numbers': phone_numbers, 'street_addresses': street_addresses,
                'credit_cards': credit_cards, 'ips': ips
                }
