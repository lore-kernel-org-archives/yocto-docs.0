Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.65.1627921820880170177
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 09:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6A714240006;
	Mon,  2 Aug 2021 16:30:17 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <937e5ecd-1198-93ba-cd50-c6284c44d5f3@bootlin.com>
Date: Mon, 2 Aug 2021 18:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit a6441aa5765be4a121a45ede94ca6d4c6fedf4ef:

  common-tasks: Fix conversion error in npm example (2021-07-30 22:52:05
+0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to 12dd3ecb054c1668cdccc220ca21b88635531784:

  profile-manual: document how to build perf manpages on target
(2021-08-02 18:19:45 +0200)

----------------------------------------------------------------
Michael Opdenacker (3):
      manuals: initial documentation for CVE management
      ref-manual: remove example recipe source files
      profile-manual: document how to build perf manpages on target

Stefan Wiehler (1):
      dev-manual: fix source release example script

 documentation/dev-manual/common-tasks.rst                         | 47
++++++++++++++++++++++++++++++++++++++++++++++-
 documentation/profile-manual/usage.rst                            | 11
++++++-----
 documentation/ref-manual/examples/hello-autotools/hello_2.10.bb   |  9
---------
 documentation/ref-manual/examples/hello-single/files/helloworld.c |  8
--------
 documentation/ref-manual/examples/hello-single/hello.bb           | 17
-----------------
 documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb          | 14
--------------
 documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb | 15
---------------
 documentation/ref-manual/variables.rst                            | 12
++++++++++++
 8 files changed, 64 insertions(+), 69 deletions(-)
 delete mode 100644
documentation/ref-manual/examples/hello-autotools/hello_2.10.bb
 delete mode 100644
documentation/ref-manual/examples/hello-single/files/helloworld.c
 delete mode 100644 documentation/ref-manual/examples/hello-single/hello.bb
 delete mode 100644 documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
 delete mode 100644
documentation/ref-manual/examples/mtd-makefile/mtd-utils_1.0.0.bb


This would allow me to close a bug, and migrating the repository to the
new overrides syntax will be easier, as the recipe example files will be
gone.
Thank you in advance
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

