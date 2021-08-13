Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.36472.1628860339359293838
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 06:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8CAB6FF803;
	Fri, 13 Aug 2021 13:12:17 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <fb8fbd50-e736-b058-db60-cac4837b24e1@bootlin.com>
Date: Fri, 13 Aug 2021 15:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit 86b44b72c366f56d6977e7462aca8821721d89bd:

  releases: update to include 3.1.10 (2021-08-10 15:29:44 -0700)

are available in the Git repository at:

  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to 6b1d7d102ed3b509dfb3e43a3d7a27226f504df5:

  kickstart: document which options accept units (2021-08-13 15:03:47 +0200)

----------------------------------------------------------------
Daniel Gomez (1):
      docs: fix typo in releases

Michael Opdenacker (9):
      bsp-guide: overrides syntax updates
      dev-manual: overrides syntax updates
      kernel-dev manual: overrides syntax updates
      ref-manual: overrides syntax updates
      sdk-manual: overrides syntax updates
      test-manual: overrides syntax updates
      sdk-manual: reference obsolete reference to ADT
      Manuals: replace "file name" by "filename"
      dev-manual: fix grammar in post-install script explanations

Olaf Mandel (1):
      kickstart: document which options accept units

Quentin Schulz (2):
      docs: fix new override syntax migration
      docs: overview-manual: concepts: remove long-gone BBHASHDEPS variable

Tom Rini (2):
      common-tasks: Add a summary to the end of the bbappend example
      manuals: Rename the "Using .bbappend Files in Your Layer" section

 documentation/bsp-guide/bsp.rst                            |  52
++++++++---------
 documentation/dev-manual/common-tasks.rst                  | 301
+++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------
 documentation/kernel-dev/advanced.rst                      |   6 +-
 documentation/kernel-dev/common.rst                        |  74
++++++++++++-------------
 documentation/kernel-dev/faq.rst                           |   4 +-
 documentation/migration-guides/migration-1.4.rst           |   2 +-
 documentation/migration-guides/migration-1.5.rst           |   2 +-
 documentation/overview-manual/concepts.rst                 |   7 +--
 documentation/overview-manual/yp-intro.rst                 |   2 +-
 documentation/ref-manual/classes.rst                       |  22 ++++----
 documentation/ref-manual/faq.rst                           |   4 +-
 documentation/ref-manual/kickstart.rst                     |  30 ++++++----
 documentation/ref-manual/qa-checks.rst                     |  22 ++++----
 documentation/ref-manual/variables.rst                     | 182
++++++++++++++++++++++++++++++------------------------------
 documentation/releases.rst                                 |   4 +-
 documentation/sdk-manual/appendix-customizing-standard.rst |   2 +-
 documentation/sdk-manual/appendix-customizing.rst          |   6 +-
 documentation/sdk-manual/appendix-obtain.rst               |   2 +-
 documentation/sdk-manual/extensible.rst                    |   4 +-
 documentation/sdk-manual/intro.rst                         |  10 ----
 documentation/test-manual/reproducible-builds.rst          |   2 +-
 documentation/test-manual/understand-autobuilder.rst       |   2 +-
 22 files changed, 374 insertions(+), 368 deletions(-)

Thank you in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

