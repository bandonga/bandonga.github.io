---
title: Live Tricks
permalink: "/livetricks/"
layout: archive
tag: livetricks
---

{% include group-by-array collection=site.posts field="tags" %}

{% for tag in group_names %}
  {% assign posts = group_items[forloop.index0] %}
  <h2 id="{{ tag | slugify }}" class="archive__subtitle">{{ tag }}</h2>
  {% for post in posts %}
    {{post.tag}}
    {% if tag == page.tag %}
      asdasdasd1
    {% include archive-single.html %}
      asdasdasd2
    {% endif %}
    tessst1
    {% include archive-single.html %}
    tessst2
  {% endfor %}
{% endfor %}
