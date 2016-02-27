from django.db import models


class CounterManager(models.Manager):

    def update_count(self, amount, route):
        try:
            counter = self.get(route=route)
            counter.count += amount

        except Counter.DoesNotExist:
            counter = Counter(route=route, count=amount)

        counter.save()
        return counter.count


class Counter(models.Model):
    route = models.CharField(max_length=255, default="/", unique=True)
    count = models.IntegerField(default=0)

    counts = CounterManager()
