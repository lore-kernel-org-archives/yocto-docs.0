Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.456.1626458843915208653
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 11:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0927E1C0007;
	Fri, 16 Jul 2021 18:07:21 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <4a7d8148-5c4f-de24-301f-25f7b73b3d02@bootlin.com>
Date: Fri, 16 Jul 2021 20:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit f45b378eb2cb08c173620cffb17cbcc8b402da0d:

  docs: remove image-mklibs references (2021-07-10 23:38:59 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to c834fab46794233864e6bcb587ab75f2bfa1631c:

  ref-manual: Document BUILDHISTORY_PATH_PREFIX_STRIP (2021-07-12
12:24:51 +0200)

----------------------------------------------------------------
Joshua Watt (1):
      ref-manual: Document BUILDHISTORY_PATH_PREFIX_STRIP

Quentin Schulz (1):
      docs: replace remaining ``FOO`` by :term:`FOO`

 documentation/bsp-guide/bsp.rst                  |  2 +-
 documentation/dev-manual/common-tasks.rst        | 24
++++++++++++------------
 documentation/kernel-dev/common.rst              |  8 ++++----
 documentation/migration-guides/migration-1.5.rst |  4 ++--
 documentation/migration-guides/migration-1.7.rst |  2 +-
 documentation/migration-guides/migration-2.1.rst |  4 ++--
 documentation/migration-guides/migration-2.2.rst |  4 ++--
 documentation/migration-guides/migration-2.3.rst |  2 +-
 documentation/migration-guides/migration-2.4.rst |  6 +++---
 documentation/migration-guides/migration-2.5.rst |  4 ++--
 documentation/migration-guides/migration-2.6.rst |  2 +-
 documentation/migration-guides/migration-2.7.rst |  2 +-
 documentation/migration-guides/migration-3.0.rst |  2 +-
 documentation/overview-manual/concepts.rst       |  6 +++---
 documentation/ref-manual/classes.rst             | 10 +++++-----
 documentation/ref-manual/faq.rst                 |  2 +-
 documentation/ref-manual/kickstart.rst           |  2 +-
 documentation/ref-manual/qa-checks.rst           |  2 +-
 documentation/ref-manual/variables.rst           | 74
++++++++++++++++++++++++++++++++++++++++++++------------------------------
 19 files changed, 88 insertions(+), 74 deletions(-)

Thank you in advance,

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

