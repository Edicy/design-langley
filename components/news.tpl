{% for article in site.latest_1_articles %}
<div class="colorbox clearfix" >
            <table class="news">
              <tr>
                <td class="first">{{ "latest_news" |lc }}</td>
                <td><span class="date">{{ article.created_at | format_date:"%d. %B" }}</span> - <a href="{{ article.url }}">{{ article.title }}</a> {{ article.excerpt }}
                </td>
              </tr>
            </table>
          </div>
{% endfor %}