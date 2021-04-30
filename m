Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.1105.1619805542026712716
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 10:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.25] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4B9B1240003
	for <docs@lists.yoctoproject.org>; Fri, 30 Apr 2021 17:59:00 +0000 (UTC)
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <c85f57b7-42a4-9d2e-09a8-e97ab7de6ab1@bootlin.com>
Date: Fri, 30 Apr 2021 19:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit cefd66301a40f9048499879674e467543f704c44:

  ref-manual/variables.rst: Add incompatibility warning for
SERIAL_CONSOLES_CHECK (2021-04-23 17:26:15 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to a0fc2e1b4bdc8411b97d02d34bfecfc888b6eb0c:

  sdk-manual: fix broken formatting of sample command (2021-04-30
19:46:12 +0200)

----------------------------------------------------------------
Alexander Kanavin (1):
      dev-manual/common-tasks.rst: correct the documentation for debuginfod

Michael Opdenacker (1):
      dev-manual: update references to Docker installation instructions

Richard Purdie (1):
      test-manual: WIP

Robert P. J. Day (2):
      sdk-manual: "beablebone" -> "beaglebone"
      sdk-manual: fix broken formatting of sample command

 documentation/dev-manual/common-tasks.rst              | 40
++++++++++++++++++++++++----------------
 documentation/dev-manual/start.rst                     | 28
++++++++++------------------
 documentation/ref-manual/variables.rst                 |  6 ------
 documentation/sdk-manual/appendix-obtain.rst           | 10 ++++++----
 documentation/test-manual/index.rst                    |  2 ++
 documentation/test-manual/reproducible-builds.rst      | 56
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 documentation/test-manual/yocto-project-compatible.rst | 52
++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 150 insertions(+), 44 deletions(-)
 create mode 100644 documentation/test-manual/reproducible-builds.rst
 create mode 100644 documentation/test-manual/yocto-project-compatible.rst

Thank you in advance,

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

