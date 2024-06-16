---
layout: page
permalink: /research/
title: Research
description: Publications and preprints in reversed chronological order.
years: [2024, 2023, 2022, 2021, 2020, 2019, 2018]
---

{% for y in page.years %}
  <h3 class="year">{{y}}</h3>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}
