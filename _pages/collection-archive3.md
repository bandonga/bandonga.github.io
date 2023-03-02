---
layout: archive
title: "Posts by Collection"
permalink: /collection-archive3/
author_profile: true
---

{% capture written_label %}'None'{% endcapture %}

{% for collection in site.collections %}
  {% unless collection.output == false or collection.label != "sip" %}
    {% capture label %}{{ collection.label }}{% endcapture %}
    {% if label != written_label %}
    {% capture written_label %}{{ label }}{% endcapture %}
    {% endif %}
  {% endunless %}
  {% for post in collection.docs %}
    {% unless collection.output == false or collection.label == "sip" %}
      {% include archive-single.html %}
    {% endunless %}
  {% endfor %}
{% endfor %}
