---
title: Academy
permalink: "/academy/"
layout: archive
feature_row:
- image_path: "/assets/images/academy/devops.svg"
  alt: sysadmin
  title: DevOps
  excerpt: Notes and resources about DevOps.
  url: "/academy/de/"
  btn_class: btn--primary
  btn_label: Read More
- image_path: "/assets/images/academy/telephony.svg"
  alt: telephony
  title: Telephony
  excerpt: Notes and resources about Telephony.
  url: "/academy/telephony/"
  btn_class: btn--primary
  btn_label: Read More
tag: academy
---

{% include feature_row id="feature_row" type="left" %}

# Latest Posts

{% include group-by-array collection=site.posts field="tags" %}

{% for tag in group_names %}
  {% assign posts = group_items[forloop.index0] %}
  {% for post in posts %}
    {% if tag == page.tag %}
      {% include archive-single.html %}
    {% endif %}
  {% endfor %}
{% endfor %}
