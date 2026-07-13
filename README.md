# Apache Software Events Website (http://communityovercode.apache.org)

This repository provides the source for the CommunityOverCode website of The Apache Software Foundation. The content and design of the site is the responsibility of VP, Marketing and Publicity. Any proposed improvements or fixes should have issues created first, to be approved by VP, M&P.

- [Production website](http://communityovercode.apache.org)

- [Content](content)
  - **md** pages in GitHub Flavored Markdown (GFM), which can include HTML.
  - **ezmd** pages in a combination of [ezt](https://github.com/gstein/ezt/blob/wiki/Syntax.md) and GFM.
  - **html** files are treated as static files.
  - Static assets of all types.
  - .htaccess files for redirection and rewrite rules.


## Adding An Event

For details on adding an event, see [content/events/README.md](content/events/README.md).

- [Issues](https://github.com/apache/conferences-cc-website/issues)

- [Branches](https://github.com/apache/conferences-cc-website/branches). Note that [.asf.yaml](./.asf.yaml) is set up for autopreview. A branch named `preview/mytest` for example is automatically staged at https://www-mytest.staged.apache.org/

- [Pull requests](https://github.com/apache/conferences-cc-website/pulls)
  - [Creating a pull request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request#creating-the-pull-request)

## Documentation

Read the [ASF-Pelican Getting started guide](https://infra.apache.org/asf-pelican-gettingstarted.html) and the pages it links to.

## Notes

The website is built with [Pelican](https://blog.getpelican.com).

Continuous Integration / Continuous Deployment (CI/CD) is via the [.asf.yaml file](https://github.com/apache/infrastructure-asfyaml/blob/main/README.md)
mechanism, which runs [Buildbot](https://ci2.apache.org/#/builders/3).
The build is triggered by changes to the source, and also every 8 hours (currently 1:22, 9:22, 17:22) to pick up changes to external data. It also rotates the featured projects on the main page.

- [Pelican Configuration](pelicanconf.yaml) -- Pelican configuration.
- [ASF Data Load](asfdata.yaml) -- ASF metadata to be used by ezt and Pelican. See [asfdata.py](https://github.com/apache/infrastructure-pelican/blob/master/plugins/asfdata.py).
- [ASF YAML Pelican Build](.asf.yaml) -- ASF infrastructure instructions.


