Sitemap Xml
===

About
---

An XML Sitemap is used to give search engines information about your site. The [Radiant SitemapXML Extension][rse] by [Aissac][ai] creates a XML sitemap for your site.

Features
---

* Allows you to specify in Radiant admin which pages appear in the sitemap;
* Gives you the possibility to set the `changed_frequency` and `priority` per page.

Installation
---

All you have to do is install the [Radiant Sitemap XML Extension][rse]:

    git clone git://github.com/Aissac/radiant-sitemap-xml-extension.git vendor/extensions/sitemap_xml

and run the migration 

    rake radiant:extensions:sitemap_xml:migrate
    
Configuration
---

The `<loc>` XML tag holds the URL of the page. This URL must begin with the protocol (such as http) and end with a trailing slash. Radiant Sitemap extension automatically creates this tag for you, but you have the possibility to override it by setting `Radiant::Config["sitemap_xml_domain"]` to something like `'http://your-site.com'`.

Usage
---

You can set if a particular page will make it to the sitemap by checking or unchecking the `Appear in sitemap` checkbox on each page.

The Sitemap protocol format consists of XML tags:

1.  The `<loc>` required tag:
  
    -  URL of the page. This URL must begin with the protocol (such as http) and end with a trailing slash.
    -  You can override the host name by setting the `Radiant::Config["sitemap_xml_domain"] = 'http://your-site.com'`
    -  Will be automatically created from the url of each page.
    
2.  The `<lastmod>` optional tag:
  
    -  The date of last modification of the file. This date is in W3C Datetime format (YYYY-MM-DD).
    -  Will be automatically created from the `updated_at` attribute of each page.

3.  The `<changefreq>` optional tag:
  
    -  How frequently the page is likely to change.
    -  You can set the `changefreq` from the `Change frequency` drop down on each page.

4.  The `<priority>` optional tag:  
  
    -  The priority of this URL relative to other URLs on your site. The default priority of a page is 0.5.
    -  You can set the `priority` from the `Priority` drop down on each page.

5.  Visit `http://yoursite.com/sitemap.xml`

For more information on sitemaps, visit [sitemaps.org][sitemaps].

Contributors
---

* Cristi Duma ([@cristi_duma][cd])
* Istvan Hoka ([@ihoka][ih])

[sitemaps]: http://www.sitemaps.org/
[ai]: http://www.aissac.ro/
[rd]: http://radiantcms.org/
[rse]: http://blog.aissac.ro/radiant/sitemap-xml-extension/
[cd]: http://twitter.com/cristi_duma
[ih]: http://twitter.com/ihoka