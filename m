Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.12650.1620403593165524667
 for <docs@lists.yoctoproject.org>;
 Fri, 07 May 2021 09:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.10] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 62876240005;
	Fri,  7 May 2021 16:06:30 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <3b1ea0eb-255f-d5a2-e826-b20456588c7c@bootlin.com>
Date: Fri, 7 May 2021 18:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit 1ffaa1db5a6eba53558b714f6071ea2e9bfe03e6:

  sdk-manual: fix broken formatting of sample command (2021-05-03
13:37:21 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to da9d1cfb5c084d172eff3cb10ec3631dd8266260:

  manuals: reduce verbosity related to "the following" expression
(2021-05-06 19:26:33 +0200)

----------------------------------------------------------------
Daniel Wagenknecht (1):
      kernel-dev: document KCONFIG_MODE

Drew Moseley (1):
      manuals: fix a few incorrect option specifications.

Michael Opdenacker (2):
      manuals: reduce verbosity with "worry about" expression
      manuals: reduce verbosity related to "the following" expression

Robert P. J. Day (4):
      sdk-manual: couple minor fixes in using.rst
      sdk-manual: various cleanups to intro.rst
      ref-manual: delete references to dead LSB compliance
      ref-manual: delete extraneous back quote

 documentation/README                             |  2 +-
 documentation/dev-manual/common-tasks.rst        | 14 +++++++-------
 documentation/dev-manual/qemu.rst                |  6 +++---
 documentation/kernel-dev/common.rst              | 17 +++++++++++++----
 documentation/kernel-dev/concepts-appx.rst       |  3 +--
 documentation/kernel-dev/faq.rst                 |  2 +-
 documentation/overview-manual/intro.rst          |  2 +-
 documentation/overview-manual/yp-intro.rst       | 20 ++++++++------------
 documentation/ref-manual/classes.rst             |  6 +++---
 documentation/ref-manual/features.rst            |  2 +-
 documentation/ref-manual/migration-2.2.rst       |  2 +-
 documentation/ref-manual/structure.rst           | 14 +++-----------
 documentation/ref-manual/system-requirements.rst | 10 +++++-----
 documentation/ref-manual/variables.rst           | 40
+++++++++++++++++++++++++++++++++++++++-
 documentation/sdk-manual/extensible.rst          |  6 +++---
 documentation/sdk-manual/intro.rst               | 48
+++++++++++++++++++++++-------------------------
 documentation/sdk-manual/using.rst               | 13 ++++++-------
 documentation/toaster-manual/reference.rst       | 17 ++++++++---------
 18 files changed, 127 insertions(+), 97 deletions(-)


Thank you in advance :)

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

