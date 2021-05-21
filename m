Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.228.1621617317202523363
 for <docs@lists.yoctoproject.org>;
 Fri, 21 May 2021 10:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 94B45100004;
	Fri, 21 May 2021 17:15:14 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <80c6484c-bd33-270f-ac1b-b7f4c6d9d130@bootlin.com>
Date: Fri, 21 May 2021 19:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit b24cddff0f1367360441e3f9ff59cbed77da28ad:

      releases: update to include 3.2.4 (2021-05-17 14:59:01 -0700)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to d71d8da78285f2314bfd27a821b26434e39622a8:

  ref-manual: add links to some variables in glossary (2021-05-21
19:08:37 +0200)

----------------------------------------------------------------
Armin Kuster (1):
      poky.yaml: fedora33: add missing pkgs

Michael Opdenacker (6):
      ref-manual: simplify style
      kernel-dev manual: simplify style
      dev-manual: simplify style
      sdk-manual: simplify style and fix formating
      overview-manual: simplify style and add missings references
      manuals: simplify style

Robert P. J. Day (1):
      ref-manual: add links to some variables in glossary

Ross Burton (1):
      ref-manual: Ubuntu 20.04 is also LTS

 documentation/README                                      |   2 +-
 documentation/brief-yoctoprojectqs/index.rst              |  10 +++++-----
 documentation/bsp-guide/bsp.rst                           |  36
+++++++++++++++++-------------------
 documentation/dev-manual/common-tasks.rst                 | 139
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------------------------------------
 documentation/dev-manual/qemu.rst                         |   4 ++--
 documentation/dev-manual/start.rst                        |  26
+++++++++-----------------
 documentation/kernel-dev/advanced.rst                     |  12
++++++------
 documentation/kernel-dev/common.rst                       |  12
++++++------
 documentation/kernel-dev/concepts-appx.rst                |   2 +-
 documentation/kernel-dev/intro.rst                        |   6 +++---
 documentation/kernel-dev/maint-appx.rst                   |   4 ++--
 documentation/overview-manual/concepts.rst                |  73
++++++++++++++++++++++++++++++++++---------------------------------------
 documentation/overview-manual/development-environment.rst |  12
++++++------
 documentation/overview-manual/yp-intro.rst                |  14
++++++--------
 documentation/poky.yaml                                   |   3 ++-
 documentation/ref-manual/classes.rst                      |  12
++++++------
 documentation/ref-manual/devtool-reference.rst            |  10 +++++-----
 documentation/ref-manual/faq.rst                          |   2 +-
 documentation/ref-manual/kickstart.rst                    |   2 +-
 documentation/ref-manual/qa-checks.rst                    |   8 ++++----
 documentation/ref-manual/release-process.rst              |   4 ++--
 documentation/ref-manual/resources.rst                    |  12
+++++-------
 documentation/ref-manual/structure.rst                    |   8 ++++----
 documentation/ref-manual/system-requirements.rst          |  10 ++++------
 documentation/ref-manual/tasks.rst                        |   3 +--
 documentation/ref-manual/variables.rst                    |  88
+++++++++++++++++++++++++++++++++++++++++++---------------------------------------------
 documentation/sdk-manual/appendix-customizing.rst         |   7 +++----
 documentation/sdk-manual/extensible.rst                   |  45
+++++++++++++++++++++++----------------------
 documentation/sdk-manual/intro.rst                        |   2 +-
 documentation/toaster-manual/reference.rst                |   6 +++---
 30 files changed, 274 insertions(+), 300 deletions(-)

Thank you in advance,
Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

