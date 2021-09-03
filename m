Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.771.1630689611031236843
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Sep 2021 10:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3C21860008;
	Fri,  3 Sep 2021 17:20:08 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <1613f16c-5401-ee93-8aae-a21a0859e6af@bootlin.com>
Date: Fri, 3 Sep 2021 19:20:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit 9f64931308f73607c40ed1eb8cf915666b6ff90a:

  dev-manual/common-tasks: sync libxpm fragment with the recipe
(2021-09-03 14:29:41 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 0ce9097728dbdca926fdf7065490207d09a34cb0:

  README: update manual list and names, online docs URL (2021-09-03
19:16:54 +0200)

----------------------------------------------------------------
Michael Opdenacker (1):
      dev-manual: explicit that devpyshell is a task

Robert P. J. Day (7):
      dev-manual: pass False to d.getVar() for devpyshell example
      ref-manual: add missing "${PN}-src" to default PACKAGES list
      dev-manual: small number of minor aesthetic tweaks
      dev-manual: various pedantic nitpickery
      dev-manual: drop "three" since there are four requirements
      ref-manual: update SYSROOT_DIRS_* variable entries
      README: update manual list and names, online docs URL

 documentation/README                      | 27 +++++++++++----------------
 documentation/dev-manual/common-tasks.rst | 32
+++++++++++++++++---------------
 documentation/dev-manual/intro.rst        | 24 ++++++++++++------------
 documentation/dev-manual/start.rst        |  2 +-
 documentation/ref-manual/variables.rst    | 11 +++++++++--
 5 files changed, 50 insertions(+), 46 deletions(-)

Thanks in advance,
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

