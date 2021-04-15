Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.8336.1618498959060861394
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 08:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3B7711C0002;
	Thu, 15 Apr 2021 15:02:36 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <4e94350e-b762-b1bc-417e-4bc3c382a3b4@bootlin.com>
Date: Thu, 15 Apr 2021 17:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit 4f7f451df266a307b34bf145b29291ca85eb882f:

  docs: add a top level page for bitbake documentation (2021-04-09
09:00:53 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to 0823237e6f4b9dbdf48500b3c1e8cc61696fa2d2:

  ref-manual: add mention of DISTUTILS_SETUP_PATH (2021-04-15 22:10:07
+1200)

----------------------------------------------------------------
Paul Eggleton (14):
      ref-manual: add METADATA_REVISION and METADATA_BRANCH
      Use variables for minimum host versions and bump Python to 3.6
      ref-manual: update/fix text for SDK_VERSION
      overview-manual: fix git command line
      ref-manual: and SDK_CUSTOM_TEMPLATECONF to glossary
      ref-manual: add REQUIRED_VERSION and adjust PREFERRED_VERSION entry
      ref-manual: add python3targetconfig class and remove python 2
references
      ref-manual: add passwd-expire to EXTRA_USERS_PARAMS
      ref-manual: add FIT_KERNEL_COMP_ALG*
      ref-manual: fix reference to build-essential
      ref-manual: tweak buildtools section
      ref-manual: add migration section for 3.3 release
      ref-manual: migration guide: add release codenames
      ref-manual: add mention of DISTUTILS_SETUP_PATH

 documentation/brief-yoctoprojectqs/index.rst              |   8 ++++----
 documentation/dev-manual/start.rst                        |   8 ++++----
 documentation/overview-manual/development-environment.rst |   2 +-
 documentation/poky.yaml                                   |   4 ++++
 documentation/ref-manual/classes.rst                      |  67
++++++++++++++++-------------------------------------------------
 documentation/ref-manual/faq.rst                          |   2 +-
 documentation/ref-manual/migration-1.3.rst                |   6 +++---
 documentation/ref-manual/migration-1.4.rst                |   6 +++---
 documentation/ref-manual/migration-1.5.rst                |   6 +++---
 documentation/ref-manual/migration-1.6.rst                |   6 +++---
 documentation/ref-manual/migration-1.7.rst                |   6 +++---
 documentation/ref-manual/migration-1.8.rst                |   6 +++---
 documentation/ref-manual/migration-2.0.rst                |   6 +++---
 documentation/ref-manual/migration-2.1.rst                |   6 +++---
 documentation/ref-manual/migration-2.2.rst                |   6 +++---
 documentation/ref-manual/migration-2.3.rst                |   6 +++---
 documentation/ref-manual/migration-2.4.rst                |   6 +++---
 documentation/ref-manual/migration-2.5.rst                |   6 +++---
 documentation/ref-manual/migration-2.6.rst                |   8 ++++----
 documentation/ref-manual/migration-2.7.rst                |   6 +++---
 documentation/ref-manual/migration-3.0.rst                |   6 +++---
 documentation/ref-manual/migration-3.1.rst                |   6 +++---
 documentation/ref-manual/migration-3.2.rst                |   6 +++---
 documentation/ref-manual/migration-3.3.rst                | 168
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 documentation/ref-manual/migration.rst                    |   1 +
 documentation/ref-manual/system-requirements.rst          |  19
++++++++++++-------
 documentation/ref-manual/variables.rst                    |  89
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------
 27 files changed, 337 insertions(+), 135 deletions(-)
 create mode 100644 documentation/ref-manual/migration-3.3.rst

Thanks in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

