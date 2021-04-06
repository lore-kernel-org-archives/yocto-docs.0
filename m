Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.638.1617742567228010523
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 13:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.20] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 60D5520006;
	Tue,  6 Apr 2021 20:56:04 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master-next] Pull request
Organization: Bootlin
Message-ID: <03e26f4b-2dfe-33a2-3eea-607a0f088cc0@bootlin.com>
Date: Tue, 6 Apr 2021 22:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit 5036fea7854c3152a0c148d8ab1668e01b38697d:

  poky.yaml: change gcc-multilib to gcc (2021-04-06 15:07:42 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to 67d5fb17f31292abb1e2dec7e436a7d8a534e63d:

  manuals: fix suspicious newlines (2021-04-06 22:18:03 +0200)

----------------------------------------------------------------
Janne Kiiskila (1):
      UBUNTU sudo apt git instead of git-core

Michael Opdenacker (7):
      Spellcheck and capitalization fixes
      SDK manual: fix reference to appendix
      Quick build: checkout a branch instead of a fixed tag
      Fix typos and spacing
      overview-manual: style improvements
      ref-manual: fix typo
      manuals: fix suspicious newlines

 documentation/README                                 |  2 +-
 documentation/boilerplate.rst                        |  2 +-
 documentation/brief-yoctoprojectqs/index.rst         | 65
++++++++++++++++++++++++++++++++++++++++-------------------------
 documentation/bsp-guide/bsp.rst                      |  6 +++---
 documentation/dev-manual/common-tasks.rst            | 33
++++++++++++++-------------------
 documentation/kernel-dev/common.rst                  |  2 +-
 documentation/kernel-dev/maint-appx.rst              |  2 +-
 documentation/overview-manual/concepts.rst           |  3 +--
 documentation/overview-manual/yp-intro.rst           | 88
+++++++++++++++++++++++++++++++++++++++++++---------------------------------------------
 documentation/poky.yaml                              |  2 +-
 documentation/profile-manual/usage.rst               | 30
+++++++++++++++---------------
 documentation/ref-manual/TODO                        |  6 +++---
 documentation/ref-manual/classes.rst                 |  2 +-
 documentation/ref-manual/faq.rst                     |  2 +-
 documentation/ref-manual/kickstart.rst               |  4 ++--
 documentation/ref-manual/migration-1.7.rst           |  2 +-
 documentation/ref-manual/migration-2.1.rst           |  2 +-
 documentation/ref-manual/migration-3.2.rst           |  2 +-
 documentation/ref-manual/release-process.rst         |  2 +-
 documentation/ref-manual/resources.rst               |  4 ++--
 documentation/ref-manual/structure.rst               |  2 +-
 documentation/ref-manual/system-requirements.rst     |  4 ++--
 documentation/ref-manual/variables.rst               | 18
++++++++----------
 documentation/sdk-manual/appendix-customizing.rst    |  2 +-
 documentation/sdk-manual/extensible.rst              |  8 +++-----
 documentation/sdk-manual/working-projects.rst        |  9 ++-------
 documentation/test-manual/intro.rst                  | 10 +++++-----
 documentation/test-manual/test-process.rst           |  4 ++--
 documentation/test-manual/understand-autobuilder.rst | 16 ++++++++--------
 documentation/toaster-manual/reference.rst           |  2 +-
 documentation/toaster-manual/setup-and-use.rst       |  8 ++++----
 31 files changed, 171 insertions(+), 173 deletions(-)

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

