---
title: Academy
permalink: "/academy/"
layout: archive
feature_row:
- image_path: "/assets/images/academy/sre.png"
  alt: sysadmin
  title: SRE
  excerpt: "A guide to help you be a better System Administrator."
  url: "/academy/sre/"
  btn_class: btn--primary
  btn_label: Read More
- image_path: "/assets/images/academy/networking.png"
  alt: networking
  title: Networking
  excerpt: "A guide to help you know more about networking."
  url: "/academy/networking/"
  btn_class: btn--primary
  btn_label: Read More
- image_path: "/assets/images/academy/telephony.png"
  alt: telephony
  title: Telephony
  excerpt: A guide to help you know more about Telephony.
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
