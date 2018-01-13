# -*- coding: utf-8 -*-

def gen_fibonacci(number):
    """
    Generator to respond with the fibonacci series until number
    """
    if not isinstance(number, int):
        raise TypeError

    if number < 0:
        raise ValueError

    counter = 0
    first, second = 0, 1

    while counter < number:
        yield first
        tmp = first + second
        first = second
        second = tmp
        counter +=1

