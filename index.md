---
title: Home
layout: home
permalink: /
tweets:
  - https://twitter.com/dhh/status/1162426045405921282
  - https://twitter.com/rails/status/1205565185739673600
---

# Welcome!

Welcome to my little slice of the internet! I post interesting, funny, annoying, and disturbing links I find from all over the web.

{% for tweet in page.tweets %}
  {% twitter tweet align=right width=350 %}
{% endfor %}