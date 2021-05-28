Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.11208.1622221039176796920
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 09:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5386540004;
	Fri, 28 May 2021 16:57:16 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <5212e5a5-0f6e-dd04-3c23-855e3ee24190@bootlin.com>
Date: Fri, 28 May 2021 18:57:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit db80bb70d9bea7008cb6b2795c8f617b1486ca03:

  releases: update to include 3.3.1 (2021-05-24 15:20:32 -0700)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to 2bcc29dc7fd0747e65b861b1579a9d2900a622b0:

  ref-manual: add glossary entry for NON_MULTILIB_RECIPES (2021-05-28
18:42:17 +0200)

----------------------------------------------------------------
Nicolas Dechesne (3):
      index: remove the link/section to 'mega manual' from main page
      index: remove links to releases manual and index
      index: split releases manuals and indexes into two sections in the
tree

Richard Weinberger (1):
      Document erofs filesystem targets

Robert P. J. Day (2):
      ref-manual: add SRCTREECOVEREDTASKS to variable glossary
      ref-manual: add glossary entry for NON_MULTILIB_RECIPES

 documentation/index.rst                | 12 +++++-------
 documentation/ref-manual/kickstart.rst |  8 +++++---
 documentation/ref-manual/variables.rst | 34
++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 10 deletions(-)

Thanks in advance,
Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

