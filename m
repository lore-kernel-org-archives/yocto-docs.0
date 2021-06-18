Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.10306.1624034136114450004
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 09:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3938E6000B;
	Fri, 18 Jun 2021 16:35:33 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <2eee273f-4529-9c9f-fdfd-c9f3e4e77616@bootlin.com>
Date: Fri, 18 Jun 2021 18:35:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit 78c50ffffb6f4dd38b5097a64c2e284a6177750a:

  README: Tweak as the website isn't really new now (2021-06-16 11:55:55
+0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to 3308b9bebce69cda1b2e0bd69f59b304ea1e367f:

  sdk-manual: add missing index references (2021-06-18 18:22:36 +0200)

----------------------------------------------------------------
Michael Opdenacker (6):
      sdk-manual: fix broken references
      migration guides: remove index reference to
BB_SETSCENE_VERIFY_FUNCTION2
      manuals: fix issues related to trailing dots
      sdk-manual: add missing quoting around "devtool upgrade"
      sdk-manual: fix wrong word
      sdk-manual: add missing index references

Quentin Schulz (1):
      docs: replace ``FOO`` by :term:`FOO` where possible

 documentation/brief-yoctoprojectqs/index.rst               |    2 +-
 documentation/bsp-guide/bsp.rst                            |   16 +-
 documentation/dev-manual/common-tasks.rst                  |  386
++++++++++++++++----------------
 documentation/kernel-dev/advanced.rst                      |   56 ++---
 documentation/kernel-dev/common.rst                        |   52 ++---
 documentation/kernel-dev/faq.rst                           |    2 +-
 documentation/kernel-dev/maint-appx.rst                    |    2 +-
 documentation/migration-guides/migration-1.3.rst           |    4 +-
 documentation/migration-guides/migration-1.4.rst           |   14 +-
 documentation/migration-guides/migration-1.5.rst           |   22 +-
 documentation/migration-guides/migration-1.6.rst           |   12 +-
 documentation/migration-guides/migration-1.7.rst           |    4 +-
 documentation/migration-guides/migration-1.8.rst           |    4 +-
 documentation/migration-guides/migration-2.0.rst           |    4 +-
 documentation/migration-guides/migration-2.1.rst           |    8 +-
 documentation/migration-guides/migration-2.2.rst           |    4 +-
 documentation/migration-guides/migration-2.3.rst           |   16 +-
 documentation/migration-guides/migration-2.4.rst           |    4 +-
 documentation/migration-guides/migration-2.5.rst           |    2 +-
 documentation/migration-guides/migration-2.6.rst           |   22 +-
 documentation/migration-guides/migration-2.7.rst           |    2 +-
 documentation/migration-guides/migration-3.1.rst           |    2 +-
 documentation/migration-guides/migration-3.2.rst           |    6 +-
 documentation/overview-manual/concepts.rst                 |   79 ++++---
 documentation/overview-manual/yp-intro.rst                 |    3 +-
 documentation/ref-manual/classes.rst                       |   74 +++----
 documentation/ref-manual/faq.rst                           |   16 +-
 documentation/ref-manual/features.rst                      |   22 +-
 documentation/ref-manual/qa-checks.rst                     |   26 +--
 documentation/ref-manual/release-process.rst               |    5 +-
 documentation/ref-manual/structure.rst                     |   16 +-
 documentation/ref-manual/tasks.rst                         |   12 +-
 documentation/ref-manual/terms.rst                         |    6 +-
 documentation/ref-manual/variables.rst                     | 1184
+++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------
 documentation/sdk-manual/appendix-customizing-standard.rst |    4 +-
 documentation/sdk-manual/appendix-customizing.rst          |   47 ++--
 documentation/sdk-manual/extensible.rst                    |   69 +++---
 documentation/sdk-manual/working-projects.rst              |   17 +-
 documentation/toaster-manual/setup-and-use.rst             |    2 +-
 documentation/transitioning-to-a-custom-environment.rst    |    2 +-
 40 files changed, 1109 insertions(+), 1121 deletions(-)

Thank you in advance,

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

