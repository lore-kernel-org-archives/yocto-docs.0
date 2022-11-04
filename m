Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662D8C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 19:01:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.1552.1667588505136142025
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 12:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j0mPmQjK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C8B681BF207;
	Fri,  4 Nov 2022 19:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667588503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DfNKTTyVd/Sl0d0rIz3fSI4Z5TB+JJOS/CcH49mJRkI=;
	b=j0mPmQjKls88Qdc/wZph+CrQRPAr1JIZRkeRrVoyAaYGXBT3qCxrgtUGqce0dy/bCzPy4p
	ysr+AY6RID2JzZrRKYHbcP09zU3DCN16IwN6SYg7yBFbDGztYg3dM57gjjDp3gD7dsPwCc
	TAZU35w6V1AEH8croiuRxOVTc00BlpgzSkgw5g640D1JkEWPXGN24x/HkdH1jRkfWnsen+
	Nz4bKvJOhtvHnldsIGMErDtAh/U99qSbNBjgnOId6JKw9dherqOAFl1qZhIb42OqTfCw7+
	cWP8HGDgEKxrGlqFa+RcRGuLqCTbMlNpp/nWEY8ow6UQYZx0vBf6AcsEyhN+tw==
Message-ID: <bd0a2e76-e20b-ac4d-85ba-af89e253ac17@bootlin.com>
Date: Fri, 4 Nov 2022 20:01:42 +0100
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
 <docs@lists.yoctoproject.org>; Fri, 04 Nov 2022 19:01:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3459

Hello Richard,

The following changes since commit dce50679242d39f133e0cde5c8483b5e69f3eb54:

   manuals: use references to the "Build Directory" term (2022-10-28 
15:25:41 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 47101c15cce156ab71683cac1c42ab94f43bdbee:

   manuals: add shortcut for Wikipedia links (2022-11-04 19:56:04 +0100)

----------------------------------------------------------------
Michael Opdenacker (7):
       ref-manual: terms.rst: add SBOM and SPDX terms
       ref-manual: variables.rst: document spdx-create class variables
       dev-manual: common-tasks.rst: add section about SPDX / SBOM 
generation
       ref-manual: classes.rst: expand documentation of create-spdx class
       ref-manual: terms.rst: add reference to new SBOM/SPDX section in 
dev manual
       manuals: document "mime-xdg" class and MIME_XDG_PACKAGES
       manuals: add shortcut for Wikipedia links

Paulo Neves (1):
       manuals: remove xterm requirements

Ulrich Ölmann (1):
       dev-manual: common-tasks.rst: fix typos

  documentation/bsp-guide/bsp.rst                           |   2 +-
  documentation/conf.py                                     |   1 +
  documentation/dev-manual/common-tasks.rst                 | 153 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------
  documentation/dev-manual/start.rst                        |   2 +-
  documentation/kernel-dev/common.rst                       |   2 +-
  documentation/migration-guides/migration-3.0.rst          |   2 +-
  documentation/migration-guides/migration-3.1.rst          |   2 +-
  documentation/migration-guides/migration-4.0.rst          |   4 ++--
  documentation/migration-guides/release-notes-4.0.rst      |   4 ++--
  documentation/overview-manual/concepts.rst                |   4 ++--
  documentation/overview-manual/development-environment.rst |  15 
++++++--------
  documentation/poky.yaml.in                                |  10 ++++-----
  documentation/ref-manual/classes.rst                      |  49 
++++++++++++++++++++++++++++++++++++++-----
  documentation/ref-manual/features.rst                     |  22 
+++++++++-----------
  documentation/ref-manual/kickstart.rst                    |   2 +-
  documentation/ref-manual/qa-checks.rst                    |   8 +++----
  documentation/ref-manual/terms.rst                        |  28 
+++++++++++++++++++++++++
  documentation/ref-manual/variables.rst                    |  95 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
  documentation/sdk-manual/appendix-customizing.rst         |  10 ++++-----
  documentation/sdk-manual/working-projects.rst             |   6 +++---
  documentation/test-manual/intro.rst                       |   3 +--
  documentation/toaster-manual/reference.rst                |   7 +++----
  22 files changed, 303 insertions(+), 128 deletions(-)

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


