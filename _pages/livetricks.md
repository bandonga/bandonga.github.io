---
title: Live Tricks
permalink: "/livetricks/"
layout: archive
---

{% include group-by-array collection=site.posts field="tags" %}

{% for tag in group_names %}
  {% assign posts = group_items[forloop.index0] %}
  <h2 id="{{ tag | slugify }}" class="archive__subtitle">{{ tag }}</h2>
  {% for post in posts %}
    {{post.tag}}
    {{tag}}
    tessst
    {% include archive-single.html %}
  {% endfor %}
{% endfor %}

{% if tag == "livetricks" %}
  <h3 id="{{ tag | slugify }}" class="archive__subtitle">{{ tag }}</h3>
{% endif %}
