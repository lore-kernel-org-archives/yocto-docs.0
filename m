Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EF0ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 13:30:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.6299.1666963837418264071
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 06:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C6DETeO4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7D33520018;
	Fri, 28 Oct 2022 13:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666963835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hYDWCPKx9760ln9kadXIqXHlHWIJVd1hq8ahqEfYHAY=;
	b=C6DETeO4xW7p3/xciSb5g6WNZfHci77aJvTgJn9r/AuB3N1hL/vSp6qYc/PNVdxkaKv2OR
	ZzCqDE/vvaXqUay5d1NYgukMt9ckfW6Jf5ypGH9mIBZi44PLSql6lK+J0276IH+yNoaEHa
	kJMXsEDH+0eQert9gDyZPPAB2dxj0S5U9apXXgVE7Rm7qvPxtVrveHRdCGM3ULymp/RbWt
	lUQZt8K5niu7Ru4jT6lPqUM4st9T6a1TAV/IfgyAjW3Y41FQGmpueMDuTuuPN2/Ge2/yOP
	aUyDYmtFVR44PzAsvdMQlzzcYnnYKCxjf3cjSOC0Ptvpket+fSo8+12e9rD1Hw==
Message-ID: <e468255a-63f2-8491-37ff-41e8e3805d49@bootlin.com>
Date: Fri, 28 Oct 2022 15:30:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 13:30:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3440

Hello Richard,

The following changes since commit dce50679242d39f133e0cde5c8483b5e69f3eb54:

   manuals: use references to the "Build Directory" term (2022-10-28 
15:25:41 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to dce50679242d39f133e0cde5c8483b5e69f3eb54:

   manuals: use references to the "Build Directory" term (2022-10-28 
15:25:41 +0200)

----------------------------------------------------------------
mike@xps:~/work/git/git.yoctoproject.org/yocto-docs/documentation$ git 
request-pull 8e0841c3418caa227c66a60327db09dfbe72054a 
git://git.yoctoproject.org/yocto-docs master-next
The following changes since commit 8e0841c3418caa227c66a60327db09dfbe72054a:

   migration-guides/release-notes-4.1.rst: update Repositories / 
Downloads (2022-10-25 13:49:40 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to dce50679242d39f133e0cde5c8483b5e69f3eb54:

   manuals: use references to the "Build Directory" term (2022-10-28 
15:25:41 +0200)

----------------------------------------------------------------
Adrian Freihofer (1):
       ref-manual: add wic command bootloader ptable option

Michael Opdenacker (5):
       Documentation/README: formalize guidelines for external link syntax
       manuals: replace "_" by "__" in external links
       manuals: stop referring to the meta-openembedded repo from GitHub
       manuals: add missing references to SDKMACHINE and SDK_ARCH
       manuals: use references to the "Build Directory" term

Mikko Rapeli (4):
       ref-manual: variables.rst: add documentation for CVE_VERSION
       ref-manual: classes.rst: improve documentation for cve-check.bbclass
       dev-manual: common-tasks.rst: add regular updates and CVE scans 
to security best practices
       dev-manual: common-tasks.rst: refactor and improve "Checking for 
Vulnerabilities" section

Paul Eggleton (1):
       ref-manual: add info on buildtools-make-tarball

  documentation/README                                      |  13 ++++
  documentation/boilerplate.rst                             |   2 +-
  documentation/brief-yoctoprojectqs/index.rst              |  12 ++--
  documentation/bsp-guide/bsp.rst                           |   3 +-
  documentation/dev-manual/common-tasks.rst                 | 471 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------------------
  documentation/dev-manual/qemu.rst                         |  12 ++--
  documentation/dev-manual/start.rst                        |   4 +-
  documentation/kernel-dev/common.rst                       |  45 
++++++-------
  documentation/kernel-dev/concepts-appx.rst                |   3 +-
  documentation/kernel-dev/intro.rst                        |   4 +-
  documentation/kernel-dev/maint-appx.rst                   |   5 +-
  documentation/migration-guides/migration-1.5.rst          |   7 +--
  documentation/migration-guides/migration-1.6.rst          |   4 +-
  documentation/migration-guides/migration-1.7.rst          |   2 +-
  documentation/migration-guides/migration-2.6.rst          |   3 +-
  documentation/migration-guides/migration-general.rst      |   2 +-
  documentation/overview-manual/concepts.rst                |  85 
+++++++++++--------------
  documentation/overview-manual/development-environment.rst |   8 +--
  documentation/profile-manual/usage.rst                    |   4 +-
  documentation/ref-manual/classes.rst                      |  67 
+++++++++++++++++---
  documentation/ref-manual/faq.rst                          |  17 +++--
  documentation/ref-manual/kickstart.rst                    |  17 +++--
  documentation/ref-manual/structure.rst                    |  33 +++++-----
  documentation/ref-manual/system-requirements.rst          |  26 +++++++-
  documentation/ref-manual/terms.rst                        |  34 +++++-----
  documentation/ref-manual/variables.rst                    |  86 
+++++++++++++------------
  documentation/sdk-manual/appendix-customizing.rst         |   5 +-
  documentation/sdk-manual/appendix-obtain.rst              |  36 
+++++------
  documentation/sdk-manual/extensible.rst                   |   4 +-
  documentation/test-manual/reproducible-builds.rst         |   2 +-
  documentation/test-manual/understand-autobuilder.rst      |   4 +-
  documentation/toaster-manual/reference.rst                |  11 ++--
  documentation/toaster-manual/setup-and-use.rst            |  19 +++---
  33 files changed, 582 insertions(+), 468 deletions(-)

Thanks in advance,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


