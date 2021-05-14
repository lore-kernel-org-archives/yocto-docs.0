Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.6087.1620981334939028406
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 01:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id D6F73200005;
	Fri, 14 May 2021 08:35:32 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/6] Simplify style around the use of the "exist" verb
Date: Fri, 14 May 2021 10:35:21 +0200
Message-Id: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset, split by manual (or small group of manuals) to
ease the review process, addresses the excess use of the verb
"exist", which is either vague at best, or yields expressions
which can be replaced by much simpler and natural ones.

The resulting text is not always shorter, but should at least
be easier to read.

By trying to simplify such expressions, further style simplifications
are sometimes implemented on the corresponding text, as well as a few formating
fixes, together with missing reference additions.

Note that many paragraphs modified this way could further be simplified,
as well as other ones. However, this will have to be addressed in an
iterative and progressive way.

Michael Opdenacker (6):
  ref-manual: simplify style
  kernel-dev manual: simplify style
  dev-manual: simplify style
  sdk-manual: simplify style and fix formating
  overview-manual: simplify style and add missings references
  manuals: simplify style

 documentation/README                          |   2 +-
 documentation/brief-yoctoprojectqs/index.rst  |  10 +-
 documentation/bsp-guide/bsp.rst               |  36 +++--
 documentation/dev-manual/common-tasks.rst     | 139 +++++++++---------
 documentation/dev-manual/qemu.rst             |   4 +-
 documentation/dev-manual/start.rst            |  26 ++--
 documentation/kernel-dev/advanced.rst         |  12 +-
 documentation/kernel-dev/common.rst           |  12 +-
 documentation/kernel-dev/concepts-appx.rst    |   2 +-
 documentation/kernel-dev/intro.rst            |   6 +-
 documentation/kernel-dev/maint-appx.rst       |   4 +-
 documentation/overview-manual/concepts.rst    |  73 +++++----
 .../development-environment.rst               |  12 +-
 documentation/overview-manual/yp-intro.rst    |  14 +-
 documentation/ref-manual/classes.rst          |  12 +-
 .../ref-manual/devtool-reference.rst          |  10 +-
 documentation/ref-manual/faq.rst              |   2 +-
 documentation/ref-manual/kickstart.rst        |   2 +-
 documentation/ref-manual/qa-checks.rst        |   8 +-
 documentation/ref-manual/release-process.rst  |   4 +-
 documentation/ref-manual/resources.rst        |  12 +-
 documentation/ref-manual/structure.rst        |   8 +-
 .../ref-manual/system-requirements.rst        |   8 +-
 documentation/ref-manual/tasks.rst            |   3 +-
 documentation/ref-manual/variables.rst        |  76 +++++-----
 .../sdk-manual/appendix-customizing.rst       |   7 +-
 documentation/sdk-manual/extensible.rst       |  45 +++---
 documentation/sdk-manual/intro.rst            |   2 +-
 documentation/toaster-manual/reference.rst    |   6 +-
 29 files changed, 265 insertions(+), 292 deletions(-)

-- 
2.25.1

