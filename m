Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.2022.1622826483462798732
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Jun 2021 10:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9414940005;
	Fri,  4 Jun 2021 17:08:01 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <f632cb13-5848-1a7e-cbba-5cc2f42a6bcb@bootlin.com>
Date: Fri, 4 Jun 2021 19:08:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit 6ed8e747265df899d8ce464d83281b0e0f04f9b2:

  ref-manual: add glossary entry for NON_MULTILIB_RECIPES (2021-06-02
23:31:52 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to adab5d0047354b5a1b11c2ece48abd8f295f69b0:

  Remove Clutter references (2021-06-04 11:00:55 +0200)

----------------------------------------------------------------
Quentin Schulz (2):
      docs: ref-manual: migration-3.0: remove reference to non-existing
BB_SETSCENE_VERIFY_FUNCTION2
      docs: ref-manual: variables: add missing links to terms glossary

Ross Burton (1):
      Remove Clutter references

 documentation/ref-manual/classes.rst       | 15 ---------------
 documentation/ref-manual/images.rst        |  4 ----
 documentation/ref-manual/migration-3.0.rst |  7 +++----
 documentation/ref-manual/variables.rst     |  4 ++--
 4 files changed, 5 insertions(+), 25 deletions(-)


Thanks for everything!

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

