#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""The setup script."""

from setuptools import setup, find_packages

with open('README.rst') as readme_file:
    readme = readme_file.read()

with open('HISTORY.rst') as history_file:
    history = history_file.read()

requirements = [
    'Click>=6.0',
    'openpyxl==2.4.8',
    # TODO: put package requirements here
]

setup_requirements = [
    'pytest-runner',
    # TODO(bwghughes): put setup requirements (distutils extensions, etc.) here
]

test_requirements = [
    'pytest',
    # TODO: put package test requirements here
]

setup(
    name='gdprcheck',
    version='0.0.1',
    description="gdprcheck",
    long_description=readme + '\n\n' + history,
    author="Ben Hughes",
    author_email='bwghughes@gmail.com',
    url='https://github.com/bwghughes/gdprcheck',
    packages=find_packages(include=['gdprcheck']),
    entry_points={
        'console_scripts': [
            'gdprcheck=gdprcheck.cli:main'
        ]
    },
    include_package_data=True,
    install_requires=requirements,
    license="MIT license",
    zip_safe=False,
    keywords='gdprcheck',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Natural Language :: English',
        'Programming Language :: Python :: 3.6',
    ],
    test_suite='tests',
    tests_require=test_requirements,
    setup_requires=setup_requirements,
)
