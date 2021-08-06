Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.115.1628269746523036503
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 10:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BAECEFF803;
	Fri,  6 Aug 2021 17:09:04 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <87ed47a8-9fd3-e507-41fc-4e5688c75640@bootlin.com>
Date: Fri, 6 Aug 2021 19:09:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello Richard,

The following changes since commit 3c98afb0fefd889e8036639d9a2c775b73b237c2:

  releases: update to include 3.3.1 (2021-08-03 12:48:32 -0700)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to a21137ed4bbf53ca2dbaaf1beb0155eac3dbfba5:

  manuals: further documentation for cve-check (2021-08-06 19:05:30 +0200)

----------------------------------------------------------------
Michael Opdenacker (2):
      manuals: mention license information in footer
      manuals: further documentation for cve-check

Richard Purdie (2):
      test-manual: Add extra detail to YP Compatible section
      migration-3.4: Add extra notes to override syntax changes

 documentation/conf.py                                  |  2 +-
 documentation/dev-manual/common-tasks.rst              | 73
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 documentation/migration-guides/migration-3.4.rst       |  7 +++++++
 documentation/ref-manual/classes.rst                   | 16
++++++++++++++++
 documentation/ref-manual/variables.rst                 | 13 ++++++++++++-
 documentation/test-manual/yocto-project-compatible.rst |  5 +++++
 6 files changed, 112 insertions(+), 4 deletions(-)

Thank you in advance,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

