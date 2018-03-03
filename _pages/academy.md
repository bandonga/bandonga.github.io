---
title: Live Tricks
permalink: "/livetricks/"
layout: archive
---

{% assign postsByYear = site.posts | group_by_exp:"post", "post.date | date: '%Y'"  %}
  {% for post in year.items %}
    {% include archive-single.html %}
  {% endfor %}
