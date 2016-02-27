from django.conf.urls import url, include

from . import views

urlpatterns = [
    url(r'^db/', views.db_counter),
    url(r'^cache/', views.cache_counter),
    url(r'^dynamo/', views.dynamo_counter),

]
