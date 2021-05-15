Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.3378.1621062771705292470
 for <docs@lists.yoctoproject.org>;
 Sat, 15 May 2021 00:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DE103240002;
	Sat, 15 May 2021 07:12:49 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC 0/3] add support for diagrams generated from SVG sources
Date: Sat, 15 May 2021 09:12:16 +0200
Message-Id: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC proposes modifications to the Makefile and the Sphinx
configuration (conf.py file) to support:

- The generation of PNG diagrams from SVG sources for the generation
  of the EPUB manual. Directly using SVG in EPUB shows at least
  font size and alignment issues.

  The conf.py file has been modified to let the EPUB builder know
  that it should prefer PNG over SVG when both formats are available.

- The generation of PDF diagrams from SVG sources for the generation
  of the PDF manual. PDF output cannot use SVG, and needs PDF diagrams
  instead.

New diagrams are stored in separate "svg" directories so that generated
.png and .pdf files can be "gitignored" without ignoring the original
.png files that have no .svg source.

In the source .rst files, new diagrams can now be included as, for example:
image:: svg/git-workflow.*

Note that the way the Makefile was modified can most probably be improved,
as my "make" skills are pretty limited. I'm interested in your suggestions!

My goal is to progressively replace PNG diagrams with SVG ones:
   - To get high quality definition output documents, in all output formats
   - To Have the ability to update diagrams
I would indeed do this very progressively, a little bit every week,
not at the expense of other tasks.

Michael Opdenacker (3):
  Makefile: allow epub and latexpdf outputs to use diagrams from SVG
    sources
  conf.py: prefer PNG to SVG in EPUB output
  overview-manual: SVG diagram for the git workflow

 documentation/.gitignore                      |    2 +
 documentation/Makefile                        |   29 +-
 documentation/conf.py                         |    4 +
 .../development-environment.rst               |    4 +-
 .../overview-manual/figures/git-workflow.png  |  Bin 26586 -> 0 bytes
 .../overview-manual/svg/git-workflow.svg      | 1205 +++++++++++++++++
 6 files changed, 1239 insertions(+), 5 deletions(-)
 delete mode 100644 documentation/overview-manual/figures/git-workflow.png
 create mode 100644 documentation/overview-manual/svg/git-workflow.svg

-- 
2.25.1

