About
=====
This site is built with Jekyll and React. The static content uses a slightly-
modified version of the [Cayman theme](https://pages-themes.github.io/cayman/) for GitHub Pages. Details of my environment, toolchain, and dependencies are given below. Mainly, this helps me reproduce functionality (and remember bugs!) when working from a different computer.

My goal is a plaintext workflow that keeps me focused on writing and researching. For excellent guidance--aimed at humanists--on this subject, see Nicholas Cifuentes-Goodbody's [YouTube channel](https://www.youtube.com/channel/UCYspUZGexLdDLjHRkuERQlg) and [this article](https://programminghistorian.org/lessons/sustainable-authorship-in-plain-text-using-pandoc-and-markdown) by Dennis Tenen and Grant Wythoff.

Since Jekyll and Kramdown do not support citations and image captions, I use Pandoc to generate my research articles. These take advantage of [Pandoc-flavored Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown) and are built with a very simple shell script. Before pushing to GitHub, I refresh my Zotero bibliography, export it to `/assets/bib/references.bib` and then run `/scripts/article-md-to-html.sh MARKDOWN_FILE`. The various Pandoc extensions are invoked within this script. As works-in-progress, the articles are unstyled (excepting some minimal CSS to keep image sizes reasonable).

In building the site, I was revisiting my own efforts (circa 2015) but with a better understanding of both web programming as well as templating frameworks. While I was inspired to do this by Chris Olah's blog (and the Distill platform), using Haskell's Stack and Hakyll with the Windows subsystem for Linux (WSL) is not workable yet.

Even installing Ruby and Node on WSL Ubuntu was unexpectedly complex, as `rbenv` and `nvm` either do not work or load extremely slowly (as of Summer 2017). Credit to Microsoft for maintaining a clear [issues tracker](https://github.com/Microsoft/BashOnWindows/issues), however. 


System
======

Environment (as of August 2017)
-------------------------------
* Windows 10, Insider Preview Build 15063.540
* Windows Subystem for Linux, Ubuntu 16.04.3 "xenial"

Tools
-----
* Pandoc
* Sublime Text 3 (registration key not versioned but kept in Dropbox)
* Vim (copy customized `.vimrc` from my [config repo](https://github.com/StephenKrewson/config) to `$HOME`)
* Zotero

Previewing the site with Jekyll
-------------------------------
Jekyll has `make` and `gcc` as [dependencies](https://jekyllrb.com/docs/installation/), so the very first step is to make sure these basic C tools are installed: `sudo apt-get install build-essential`. In general, we will try to NOT use `sudo` privileges when installing packages. My goal of minimal setup overhead means preferring Ubuntu's own package manager whenver possible. But as we will see with Ruby, this is not always possible.

Jekyll [requires] Ruby 2.1+ and Ubuntu 16.04 ships with `ruby` 2.3.1 and `gem` 2.5.1. However, the `apt-get` package comes with insufficient privileges for installing `bundler` (even as superuser):

```
Fetching: bundler-1.15.3.gem (100%)
ERROR:  While executing gem ... (Gem::FilePermissionError)
You don't have write permissions for the /var/lib/gems/2.3.0 directory.
```

The workaround is to install the latest stable Ruby from Brightbox Networks. See [this guide](https://ntsystems.it/post/Jekyll-on-WSL). In my case, after adding the Brightbox repo, Ruby 2.4 was the latest version. 

From the top-level directory, run `bundle exec jekyll serve`; navigate to `localhost:4000` in a browser.


Jekyll
------
* Dependencies: `ruby`, `gem`, `bundler`
* Install: `gem install jekyll`
* Flavor: GitHub Pages, Cayman Theme, Liquid templating


Packages
--------
* `apt-get`: haskell, pandoc, pandoc-citeproc


Text
----
* Vim (`git clone https://github.com/StephenKrewson/config.git` for easy access to customized `.vimrc`)
* Sublime Text 3 (licensed), mostly for the incredible distraction-free mode (`Shift+F11`) and linewrapping
* Pandoc with extensions `citations`, `
* `[pandoc-citeproc]` to power the citations extension

Bibliography
------------
* Zotero (once I committed to pushing my writing to the web in real-time, I was able to abandon EndNote and craft a completely plaintext workflow)
* ZotFile and BetterBib(La)TeX extensions


TODO
====

Research
--------
* Reception of Maria Edgeworth in USA
* Import Hawthorne chapter into markdown
* Type up outline for third chapter
* PDFs into Zotero

Site
----
* ~~Add PDF and DOCX links for all articles~~
* ~~Abstract poetry into "poems" Jekyll collection~~
* Style research articles using SASS from gh-pages themes (low priority)
* ~~Make header button link to first heading of README~~
