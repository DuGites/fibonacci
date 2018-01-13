# Fibonacci

A Django Project with RESTful API to get the fibonacci numbers.

This project provides a RESTful API for getting back the first n fibonacci
numbers. It is located at ``/fibonacci/-\w+`` from the root url and returns a JSON
serialized response

The api can be invoked using the following url. The numeric parameter denotes the number
of fibonacci values that you want. For e.g.

    GET /fibonacci/5

will return to you the first 5 fibonacci numbers

## Installation

Make sure you have pip on your local system. Create and activate a virtualenv 
using the following commands

    make install-requirements

Run Migrations:

    make run-migrations

## Deployment

When deploying to production, I would suggest using uwsgi as an app server. Not the Django
development server.

    Make sure you have pip installed on the centos/ubuntu instance
    sudo yum update
    sudo yum install -y python-devel python-setuptools python-pip
    sudo pip install --upgrade

    If you are doing this on Ubuntu make sure you are using apt-get to install the packages

    -- Make sure you have virtualenv installed on the instance.
    sudo pip install virtualenv

    -- create a virtualenv to install the packages
    make install-requirements

    export VIRTUAL_ENV='PATH_TO_VIRTUAL_ENV'
    uwsgi --http :9090 --wsgi-file fibonacci/wsgi.py --virtualenv $VIRTUAL_ENV


This will allow uwsgi to accept all incoming requests on port 9090.


For Developing locally you have to do the steps mentioned above to create the virtualenv and also run migrations but you  do not need a production app server like uwsgi, instead you can start the development server.

Start the development web server:

    make start-dev-server

This will start the Django development server running at 127.0.0.1:8000

## Tests

If you add more functionality please add unit tests and run make coverage-reports to check if 100% coverage is maintained

