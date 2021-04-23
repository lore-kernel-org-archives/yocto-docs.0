Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.1030.1619192017212778885
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Apr 2021 08:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 66C88240002;
	Fri, 23 Apr 2021 15:33:35 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <b479f7b2-df5b-0ebb-1a64-75ecd1dcdde2@bootlin.com>
Date: Fri, 23 Apr 2021 17:33:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit bed221137de77340280d71b4a8b0f2f60addc566:

  Adding dunfell 3.1.7 to the switcher and release list. (2021-04-21
16:09:17 -0700)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to cefd66301a40f9048499879674e467543f704c44:

  ref-manual/variables.rst: Add incompatibility warning for
SERIAL_CONSOLES_CHECK (2021-04-23 17:26:15 +0200)

----------------------------------------------------------------
Michael Opdenacker (3):
      dev-manual: fix code insertion
      manuals: simplify code insertion
      manuals: code insertion simplification over two lines

Trevor Gamblin (1):
      ref-manual/variables.rst: Add incompatibility warning for
SERIAL_CONSOLES_CHECK

 documentation/brief-yoctoprojectqs/index.rst              |    2 +-
 documentation/bsp-guide/bsp.rst                           |   56 +++----
 documentation/dev-manual/common-tasks.rst                 | 1020
+++++++++++++++++++++++++++++++++++++++-----------------------------------------------------------------------------
 documentation/dev-manual/qemu.rst                         |   24 +--
 documentation/dev-manual/start.rst                        |   30 ++--
 documentation/kernel-dev/advanced.rst                     |   87 ++++------
 documentation/kernel-dev/common.rst                       |  225
+++++++++-----------------
 documentation/kernel-dev/concepts-appx.rst                |    6 +-
 documentation/kernel-dev/faq.rst                          |    6 +-
 documentation/kernel-dev/maint-appx.rst                   |   15 +-
 documentation/overview-manual/concepts.rst                |   51 ++----
 documentation/overview-manual/development-environment.rst |    6 +-
 documentation/profile-manual/intro.rst                    |   10 +-
 documentation/profile-manual/usage.rst                    |  184
++++++++++-----------
 documentation/ref-manual/classes.rst                      |   87 ++++------
 documentation/ref-manual/devtool-reference.rst            |   51 ++----
 documentation/ref-manual/faq.rst                          |   20 +--
 documentation/ref-manual/features.rst                     |    3 +-
 documentation/ref-manual/images.rst                       |    5 +-
 documentation/ref-manual/kickstart.rst                    |    6 +-
 documentation/ref-manual/migration-1.3.rst                |    7 +-
 documentation/ref-manual/migration-1.4.rst                |    6 +-
 documentation/ref-manual/migration-1.6.rst                |    8 +-
 documentation/ref-manual/migration-1.7.rst                |    6 +-
 documentation/ref-manual/migration-1.8.rst                |    6 +-
 documentation/ref-manual/migration-2.0.rst                |    9 +-
 documentation/ref-manual/migration-2.1.rst                |    9 +-
 documentation/ref-manual/migration-2.2.rst                |   14 +-
 documentation/ref-manual/migration-2.3.rst                |   16 +-
 documentation/ref-manual/migration-2.5.rst                |    8 +-
 documentation/ref-manual/migration-2.6.rst                |   15 +-
 documentation/ref-manual/migration-3.1.rst                |    7 +-
 documentation/ref-manual/migration-3.2.rst                |    6 +-
 documentation/ref-manual/qa-checks.rst                    |   19 +--
 documentation/ref-manual/structure.rst                    |   18 +--
 documentation/ref-manual/system-requirements.rst          |   69 +++-----
 documentation/ref-manual/tasks.rst                        |   48 ++----
 documentation/ref-manual/terms.rst                        |    3 +-
 documentation/ref-manual/variables.rst                    |  867
++++++++++++++++++++++++++++++++++----------------------------------------------------------------
 documentation/sdk-manual/appendix-customizing.rst         |   27 ++--
 documentation/sdk-manual/appendix-obtain.rst              |   30 ++--
 documentation/sdk-manual/extensible.rst                   |   81 ++++------
 documentation/sdk-manual/using.rst                        |    6 +-
 documentation/sdk-manual/working-projects.rst             |   60 +++----
 44 files changed, 1134 insertions(+), 2105 deletions(-)

Thanks in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

