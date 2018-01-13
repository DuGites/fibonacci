# Fibonacci

A Django Project with a RESTful API to get the fibonacci series for a given number.

This project provides a RESTful API for getting back the first n fibonacci
numbers. It is located at ``/fibonacci/numeric_value`` from the root url and returns a JSON response

The api can be invoked using the following url. The numeric parameter denotes the number
of fibonacci values that you want. For e.g.

    curl  http://hostname:port/fibonacci/5

will return to you the first 5 fibonacci numbers. If you request the series for a negative number or any
text besides a positive integer the API will respond with a bad request code.

## Installation

Make sure you have pip and virtualenv on your local system. Create and activate a virtualenv 
using the following commands

    make install-requirements

Run Migrations: 
  
  We are not having any database models at the moment, but to avoid django warnings while developing
  code run the following command.

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

    -- create a virtualenv and install the dependencies using
    make install-requirements

    make start-uwsgi


This will allow uwsgi to accept all incoming requests on port 9090.


For Developing locally you have to do the steps mentioned above to create the virtualenv and also run migrations but you  do not need a production app server like uwsgi, instead you can start the development server.

Start the development web server:

    make start-dev-server

This will start the Django development server running at 127.0.0.1:8000

## Tests

If you add more functionality please add unit tests and run make coverage-reports to check if 100% coverage is maintained

    make coverage-reports

## SAAS Deployment

  Further work would include making a docker image from the django project and exposing it over port 80. 
  We would need a Dockerfile and a docker-compose.yml to automate the deployment process. This is further work.


