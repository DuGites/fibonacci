# -*- coding: utf-8 -*-

from django.http import JsonResponse
from django.http import HttpResponseBadRequest, HttpResponseNotAllowed
from series.controller import gen_fibonacci


error = "Please provide positive integers as input\n"

def fibonacci(request, number):

    req_method = request.META['REQUEST_METHOD']
    if req_method != 'GET':
        return HttpResponseNotAllowed([req_method])

    try:
        number = int(number)
    except ValueError:
        return HttpResponseBadRequest(content=error)

    if number < 0:
        return HttpResponseBadRequest(content=error)
    return JsonResponse(list(gen_fibonacci(number)), safe=False)
