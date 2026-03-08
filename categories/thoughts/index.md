---
layout: archive
title: "Category: Thoughts"
permalink: /categories/thoughts/
entries_layout: grid
---

<ul>
{% assign posts = site.categories['thoughts'] %}
{% if posts and posts.size > 0 %}
  {% for post in posts %}
    <li><a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
{% else %}
  <li>No posts found in this category.</li>
{% endif %}
</ul>
