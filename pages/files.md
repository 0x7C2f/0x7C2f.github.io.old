---
layout: page
title: Files
permalink: /files/
---

## PDF Files
<ul>
{% for pdf in site.data.pdf %}
  <li>
    <a href="./pdfs/{{ pdf.file }}">{{ pdf.name }}</a>
  </li>
{% endfor %}
</ul>