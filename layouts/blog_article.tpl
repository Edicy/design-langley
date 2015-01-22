<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{article.title}} &laquo; {{page.title}} | {{site.name}}</title>
</head>

<body>
	
	<div id="wrap">
   
   {% include "Langmenu" %}
   
   <div id="container">
   
     <div id="sidebar">
       <div id="sitename" class="clearfix">{% if editmode %}{% editable site.header %}{%else%}<a href="{{ site.root_item.url }}">{% editable site.header %}</a>{% endif %}</div>
       
       {% include "Search" %}
       {% include "Mainmenu" %}
       
       <div id="sidetext" class="clearfix">
         {% content name="footer" xpage="true" %}
       </div> <!-- //sidetext -->
       
     </div> <!-- //sidebar -->
    
      <div id="content">
        <div id="headerimg"></div>
        <div id="bigtext">{% editable article.title plain="true" %}
<div class="blog-information">{{ article.author.name }} <span class="date">{{ article.created_at | format_date:"long" }}</span></div></div>
        
        <div id="content-inner" class="clearfix">
          <div class="blog" class="clearfix" data-search-indexing-allowed="true">
           {% editable article.excerpt %}
              <div id="articlebody">
              {% editable article.body %}
              <div class="clearer"></div>
              </div>
          </div> <!-- //blog -->
          
          {% unless article.new_record? %}<div class="colorbox clearfix"><a name="comments"></a>
          <span class="colortext">{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></span>
          </div> {% endunless %}
          
          
          <div class="comments">
            {% for comment in article.comments %}
            <div class="comment edy-site-blog-comment">
              {{ comment.body }}
              <div class="comment-information">{{ comment.author }} <span class="date">{{ comment.created_at | format_date:"long" }} {% removebutton %}</span></div>
            </div> <!-- //comment -->
            {% endfor %}
            
            
            <div class="colorbox" id="commentform">
              {% commentform %}
{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
                <table>
                  <tr>
                    <td colspan="2" class="colortext">{{"add_a_comment"|lc}}</td>
                  </tr>
                  <tr>
                    <td>{{"name"|lc}}:</td>
                    <td class="comment_label"><input type="text" name="comment[author]" class="textbox" value="{{comment.author}}" /></td>
                  </tr>
                  <tr>
                    <td>{{"email"|lc}}:</td>
                    <td class="comment_label"><input type="text" name="comment[author_email]" class="textbox" value="{{comment.author_email}}" /></td>
                  </tr>
                  <tr>
                    <td>{{"comment"|lc}}:</td>
                    <td class="comment_label"><textarea cols="40" name="comment[body]" rows="10" class="textbox">{{comment.body}}</textarea></td>
                  </tr>
                  <tr>
                    <td colspan="2" class="comment_label"><input type="submit" class="submit" value="{{"submit"|lc}}" /></td>
                  </tr>
                </table>
              {% endcommentform %} 
            </div> <!-- //colorbox -->
            
          </div> <!-- //comments -->
        </div> <!-- //content-inner -->
        <div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
      </div> <!-- //content -->
      

      <div class="clearer"></div>


      </div> <!-- //container -->
  </div> <!-- //wrap -->
{% unless editmode %}{{ site.analytics }}{% endunless %}
  {% include "JS" %}
</body>
</html>