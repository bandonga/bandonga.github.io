---
title: Notepad
permalink: "/notepad/"
layout: archive
tag: lifetricks
---

{% include group-by-array collection=site.posts field="tags" %}

{% for tag in group_names %}
  {% assign posts = group_items[forloop.index0] %}
  {% for post in posts %}
    {% if tag == page.tag %}
      {% include archive-single.html  %}
    {% endif %}
  {% endfor %}
{% endfor %}
