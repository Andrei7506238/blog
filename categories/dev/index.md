---
layout: archive
title: "Category: Dev"
permalink: /categories/dev/
---

<ul>
{% assign posts = site.categories['dev'] %}
{% if posts and posts.size > 0 %}
  {% for post in posts %}
    <li><a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
{% else %}
  <li>No posts found in this category.</li>
{% endif %}
</ul>
