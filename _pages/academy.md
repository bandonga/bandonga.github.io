---
title: Academy
permalink: "/academy/"
layout: archive
feature_row:
- image_path: "/assets/images/academy/devops.svg"
  alt: sysadmin
  title: DevOps
  excerpt: Notes and resources about DevOps.
  url: "/devops/start/"
  btn_class: btn--primary
  btn_label: Read More
- image_path: "/assets/images/academy/sip.svg"
  alt: sip
  title: SIP
  excerpt: "Notes about VoIP communications and protocols."
  url: "/sip/start/"
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

{% capture written_label %}'None'{% endcapture %}

{% for collection in site.collections %}
{% unless collection.output == false or collection.label == "posts" %}
  {% capture label %}{{ collection.label }}{% endcapture %}
  {% if label != written_label %}
  <h2 id="{{ label | slugify }}" class="archive__subtitle">{{ label }}</h2>
  {% capture written_label %}{{ label }}{% endcapture %}
  {% endif %}
{% endunless %}
{% for post in collection.docs %}
  {% unless collection.output == false or collection.label == "posts" %}
  {% include archive-single.html %}
  {% endunless %}
{% endfor %}
{% endfor %}
