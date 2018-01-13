# -*- coding: utf-8 -*-

from django.urls import re_path
from series import views

urlpatterns = [
    re_path('(?P<number>-?\w+)', views.fibonacci),
]
