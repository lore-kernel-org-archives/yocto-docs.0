Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.303.1618595759956380759
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 10:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from localhost (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 35D31240003;
	Fri, 16 Apr 2021 17:55:57 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 0/3] manuals: simplify colon usage
Date: Fri, 16 Apr 2021 19:55:46 +0200
Message-Id: <20210416175549.161851-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following yesterday's discussions, here is an update to the
changes I propose:

- The first patch fixes an alignment issue
  Without this fix, the 3rd patch doesn't generate
  exactly identical HTML code

- The second patch (replacing ": ::" by "::")
  is unmodified

- The third patch was suggested by Quentin Schulz,
  and applies similarly on two consecutive lines.
  It was applied automatically.

Same HTML code from fewer bytes!

Michael Opdenacker (3):
  dev-manual: fix code insertion
  manuals: simplify code insertion
  manuals: code insertion simplification over two lines

 documentation/brief-yoctoprojectqs/index.rst  |    2 +-
 documentation/bsp-guide/bsp.rst               |   56 +-
 documentation/dev-manual/common-tasks.rst     | 1020 ++++++-----------
 documentation/dev-manual/qemu.rst             |   24 +-
 documentation/dev-manual/start.rst            |   30 +-
 documentation/kernel-dev/advanced.rst         |   87 +-
 documentation/kernel-dev/common.rst           |  225 ++--
 documentation/kernel-dev/concepts-appx.rst    |    6 +-
 documentation/kernel-dev/faq.rst              |    6 +-
 documentation/kernel-dev/maint-appx.rst       |   15 +-
 documentation/overview-manual/concepts.rst    |   51 +-
 .../development-environment.rst               |    6 +-
 documentation/profile-manual/intro.rst        |   10 +-
 documentation/profile-manual/usage.rst        |  184 +--
 documentation/ref-manual/classes.rst          |   87 +-
 .../ref-manual/devtool-reference.rst          |   51 +-
 documentation/ref-manual/faq.rst              |   20 +-
 documentation/ref-manual/features.rst         |    3 +-
 documentation/ref-manual/images.rst           |    5 +-
 documentation/ref-manual/kickstart.rst        |    6 +-
 documentation/ref-manual/migration-1.3.rst    |    7 +-
 documentation/ref-manual/migration-1.4.rst    |    6 +-
 documentation/ref-manual/migration-1.6.rst    |    8 +-
 documentation/ref-manual/migration-1.7.rst    |    6 +-
 documentation/ref-manual/migration-1.8.rst    |    6 +-
 documentation/ref-manual/migration-2.0.rst    |    9 +-
 documentation/ref-manual/migration-2.1.rst    |    9 +-
 documentation/ref-manual/migration-2.2.rst    |   14 +-
 documentation/ref-manual/migration-2.3.rst    |   16 +-
 documentation/ref-manual/migration-2.5.rst    |    8 +-
 documentation/ref-manual/migration-2.6.rst    |   15 +-
 documentation/ref-manual/migration-3.1.rst    |    7 +-
 documentation/ref-manual/migration-3.2.rst    |    6 +-
 documentation/ref-manual/qa-checks.rst        |   19 +-
 documentation/ref-manual/structure.rst        |   18 +-
 .../ref-manual/system-requirements.rst        |   69 +-
 documentation/ref-manual/tasks.rst            |   48 +-
 documentation/ref-manual/terms.rst            |    3 +-
 documentation/ref-manual/variables.rst        |  861 +++++---------
 .../sdk-manual/appendix-customizing.rst       |   27 +-
 documentation/sdk-manual/appendix-obtain.rst  |   30 +-
 documentation/sdk-manual/extensible.rst       |   81 +-
 documentation/sdk-manual/using.rst            |    6 +-
 documentation/sdk-manual/working-projects.rst |   60 +-
 44 files changed, 1129 insertions(+), 2104 deletions(-)

-- 
2.25.1

