"""Ladder Counter Views
"""
from django.core.cache import cache
from django.http import HttpResponse
from django.shortcuts import render

from . import models


def cache_counter(request):
    key = "cacheCounter"
    result = cache.get(key)
    if result is None:
        newcount = 1
        cache.set(key, 1)
    else:
        newcount = result + 1
        cache.set(key, newcount)

    context = {"count": newcount}
    return render(request, "counter.html", context)


def db_counter(request):
    result = models.Counter.counts.update_count(1, "db")
    return render(request, "counter.html", {"count": result})


def dynamo_counter(request):
    return HttpResponse("Not implemented")
