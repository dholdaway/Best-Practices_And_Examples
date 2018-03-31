#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `gdprcheck` package."""

import os
import pytest
from unittest.mock import Mock, MagicMock, patch
from gdprcheck.errors import AdapterError


@pytest.fixture
def fake_excel_filepath():
    return "/Users/bwghughes/fake_excel.xls"


def test_excel_adapter(fake_excel_filepath):
    """Ensure returns list of dicts.
       Also mock out exists.
    """
    with patch('os.path.exists') as exists:
        exists.return_value = True

        from gdprcheck.adapters import ExcelAdapter

        ex = ExcelAdapter(fake_excel_filepath)
        assert ex.filepath == fake_excel_filepath
        # Set it back again as patching a builtin breaks subsequent tests
        exists.return_value = False



def test_excel_adapter_bombs_with_dodgy_file(fake_excel_filepath):
    """Ensure bombs with dodgy file.
    """
    with pytest.raises(AdapterError) as e:
        from gdprcheck.adapters import ExcelAdapter
        ex = ExcelAdapter(fake_excel_filepath)
