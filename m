Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.13256.1628102072487250384
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 11:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A61B6E0003;
	Wed,  4 Aug 2021 18:34:30 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/6] overrides syntax updates
Date: Wed,  4 Aug 2021 20:34:20 +0200
Message-Id: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the result of automatically converting the YP manual
through the scripts/contrib/convert-overrides.py script
in oe-core.

As suggested by Quentin, these changes are also available
on a dedicated temporary branch:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=contrib/michaelo/overrides-migration

Your reviews are most welcome. There are probably errors,
that we can either fix manual or through script updates.

Thank you in advance,
Michael.

*** BLURB HERE ***

Michael Opdenacker (6):
  bsp-guide: overrides syntax updates
  dev-manual: overrides syntax updates
  kernel-dev manual: overrides syntax updates
  ref-manual: overrides syntax updates
  sdk-manual: overrides syntax updates
  test-manual: overrides syntax updates

 documentation/bsp-guide/bsp.rst               |  52 ++---
 documentation/dev-manual/common-tasks.rst     | 196 +++++++++---------
 documentation/kernel-dev/advanced.rst         |   6 +-
 documentation/kernel-dev/common.rst           |  60 +++---
 documentation/ref-manual/classes.rst          |  14 +-
 documentation/ref-manual/faq.rst              |   4 +-
 documentation/ref-manual/qa-checks.rst        |   4 +-
 documentation/ref-manual/variables.rst        | 134 ++++++------
 .../appendix-customizing-standard.rst         |   2 +-
 documentation/sdk-manual/appendix-obtain.rst  |   2 +-
 documentation/sdk-manual/extensible.rst       |   2 +-
 .../test-manual/understand-autobuilder.rst    |   2 +-
 12 files changed, 239 insertions(+), 239 deletions(-)

-- 
2.25.1

