# -*- coding: utf-8 -*-

from django.test import TestCase
from series.controller import gen_fibonacci


class FibonacciTests(TestCase):

    def test_negative_num(self):
        """
        Fibonacci with a negative number should throw a value error
        """
        with self.assertRaises(ValueError):
            list(gen_fibonacci(-1))

    def test_length_zero(self):
        """
        Testing with 0 as input should return an empty list
        """
        self.assertListEqual(list(gen_fibonacci(0)), [])

    def test_a_string(self):
        """
        Passing text to the method should raise a TypeError
        """
        with self.assertRaises(TypeError):
            list(gen_fibonacci("I am a piece of text"))

    def test_positive_num(self):
        """
        Calling fibonacci with a positive number should return a list
        """
        self.assertListEqual(list(gen_fibonacci(5)), [0, 1, 1, 2, 3])
        self.assertListEqual(list(gen_fibonacci(10)), [0, 1, 1, 2, 3, 5, 8, 13, 21, 34])

