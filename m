Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.5668.1617952665729288798
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 00:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D022E1C0003;
	Fri,  9 Apr 2021 07:17:43 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] pull-request
Organization: Bootlin
Message-ID: <89e22992-fcd4-f895-7895-0c437496ce98@bootlin.com>
Date: Fri, 9 Apr 2021 09:17:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit 38bae8f6067bc12f3617ed38587737d22dd7b32c:

  manuals: fix suspicious newlines (2021-04-06 22:29:14 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to 4f7f451df266a307b34bf145b29291ca85eb882f:

  docs: add a top level page for bitbake documentation (2021-04-09
09:00:53 +0200)

----------------------------------------------------------------
Nicolas Dechesne (1):
      docs: add a top level page for bitbake documentation

Quentin Schulz (1):
      docs: replace anchor links

Ulrich Ölmann (1):
      sdk-manual: fix typo

 documentation/README                                      |   3 ++
 documentation/bitbake.rst                                 |  19
+++++++++++++
 documentation/dev-manual/common-tasks.rst                 | 241
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------------------------------------------------------
 documentation/dev-manual/qemu.rst                         |   6 ++--
 documentation/dev-manual/start.rst                        |  13 ++++-----
 documentation/index.rst                                   |   2 +-
 documentation/kernel-dev/advanced.rst                     |  42
++++++++++++++--------------
 documentation/kernel-dev/common.rst                       |  44
++++++++++++++----------------
 documentation/kernel-dev/intro.rst                        |   3 +-
 documentation/overview-manual/concepts.rst                |  93
++++++++++++++++++++++++++++++++------------------------------
 documentation/overview-manual/development-environment.rst |  15 +++++-----
 documentation/overview-manual/intro.rst                   |  13 ++++-----
 documentation/overview-manual/yp-intro.rst                |  45
++++++++++++++++--------------
 documentation/ref-manual/devtool-reference.rst            |   4 +--
 documentation/ref-manual/migration-1.5.rst                |   2 +-
 documentation/ref-manual/migration-2.1.rst                |   5 ++--
 documentation/ref-manual/migration-2.2.rst                |   8 +++---
 documentation/ref-manual/migration-2.6.rst                |   2 +-
 documentation/ref-manual/release-process.rst              |   5 ++--
 documentation/sdk-manual/appendix-customizing.rst         |  25
++++++++---------
 documentation/sdk-manual/appendix-obtain.rst              |  18
++++++------
 documentation/sdk-manual/extensible.rst                   |  11 ++++----
 documentation/sdk-manual/intro.rst                        |   4 +--
 documentation/sdk-manual/using.rst                        |  22
+++++++--------
 documentation/test-manual/test-process.rst                |   2 +-
 25 files changed, 322 insertions(+), 325 deletions(-)
 create mode 100644 documentation/bitbake.rst

Thank you in advance

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

