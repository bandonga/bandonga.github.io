---
title: Live Tricks
permalink: "/livetricks/"
layout: archive
---

{% assign postsByYear = site.posts | group_by_exp:"post", "post.date | date: '%Y'"  %}
  {% for post in year.items %}
    {% include archive-single.html %}
  {% endfor %}

  {% include group-by-array collection=site.posts field="tags" %}

  {% for tag in group_names %}
    {% assign posts = group_items[forloop.index0] %}
    <h2 id="{{ tag | slugify }}" class="archive__subtitle">{{ tag }}</h2>
    {% for post in posts %}
      {% include archive-single.html %}
    {% endfor %}
  {% endfor %}

{% if tag == "livetricks" %}
  <h3 id="{{ tag | slugify }}" class="archive__subtitle">{{ tag }}</h3>
{% endif %}
