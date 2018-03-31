# -*- coding: utf-8 -*-

"""Console script for gdprcheck."""

import click
from .gdprcheck import scantree, PiiAnalyzer

@click.command()
@click.argument('path')
def main(path):
    """Console script for gdprcheck."""
    if path:
        for entry in scantree(path):
            if entry.path.endswith('xlsx'):
                print(entry.path)
                from .adapters import ExcelAdapter
                e = ExcelAdapter(entry.path)
                p = PiiAnalyzer(e.parse())
                print(p.analyse())


if __name__ == "__main__":
    main()
