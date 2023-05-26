Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30367C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 09:25:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.4245.1685093129402955105
 for <docs@lists.yoctoproject.org>;
 Fri, 26 May 2023 02:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Tqx6spOL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685093127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zB0v7j+G6o6gv/Lme9bMBPGzRKFak1VdMQBVJx5Z69M=;
	b=Tqx6spOLA47o/8WFFfNWBLYi52TM2ZdP+M15p/fOnbh8JBqJw5qCtrLT1CkhYYqij1UPJR
	wKnmRgJXjJOWYtzaXiC82mrepDIe+K6eDEGOl9iZddjk3vNOmBxdbh8LDdIFDfAWDLzbz5
	1Bq3MePerzWGeysT9Za3pvexaePxZLqlH1aDQ5PQJJg83XTCXc/7aiFJq8qyeUJ/Aza/CB
	Gr3wBtEmxemfpS+Uhq5mQ70xnzafcoP9/gqTZLd81ows/h+IsaTS1AF9SWqfoDawjF2RsN
	2ftlr9pIuB0GI6wQSegWa8qVz1T7XxEk7wLGSXmlKaCmDAJUvOqhi5WXgl4APQ==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E4241C000F;
	Fri, 26 May 2023 09:25:25 +0000 (UTC)
Message-ID: <bd546c0f-490a-a5c2-b1eb-b80b3be02d80@bootlin.com>
Date: Fri, 26 May 2023 11:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
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
 <docs@lists.yoctoproject.org>; Fri, 26 May 2023 09:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3968

Hi Richard,

The following changes since commit 220b25d7d47d46b0d85c616b88ead75fab917092:

   ref-manual: classes: kernel: document automatic defconfig usage 
(2023-05-05 20:38:37 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 084ba9fad50d9903f520d0333e6a7d5ed4f40cc9:

   migration-guides: release-notes-4.0.4.rst: fix typo (2023-05-25 
15:39:10 +0200)

----------------------------------------------------------------
Lee Chee Yang (3):
       release-notes-4.2: update known issues and Repositories/Downloads
       migration-guides: add release-notes for 4.1.4
       migration-guides: add release notes for 4.0.10

Michael Opdenacker (11):
       migration-guides: release-notes-4.2: add doc improvement highlights
       migration-guides: release-notes-4.3: add stub section for 
documentation changes
       releases.svg: update according to latest release
       ref-manual: improve description of kernel-fitimage variables
       ref-manual: document uboot-sign class and variables
       ref-manual: improve documentation for kernel-devicetree class
       migration-guides: update 4.3 release notes
       releases.svg: fix and explain duration of Hardknott 3.3
       conf.py: add macro for Mitre CVE links
       migration-guides: use new cve_mitre macro
       migration-guides: release-notes-4.0.4.rst: fix typo

Peter Kjellerstedt (1):
       manuals: kernel-dev: Use protocol=https in a SRC_URI example

Petr Kubizňák (1):
       ref-manual: document devicetree class variables

  documentation/conf.py                                   |   1 +
  documentation/dev-manual/new-recipe.rst                 |   2 +
  documentation/kernel-dev/advanced.rst                   |   7 ++--
  documentation/migration-guides/release-4.0.rst          |   1 +
  documentation/migration-guides/release-4.1.rst          |   1 +
  documentation/migration-guides/release-notes-4.0.10.rst | 180 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.0.4.rst  |   2 +-
  documentation/migration-guides/release-notes-4.0.7.rst  |   4 +-
  documentation/migration-guides/release-notes-4.1.3.rst  |   4 +-
  documentation/migration-guides/release-notes-4.1.4.rst  | 254 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.2.rst    |  85 
+++++++++++++++++++++++++++++++++++--
  documentation/migration-guides/release-notes-4.3.rst    |  19 ++++++++-
  documentation/ref-manual/classes.rst                    |  59 
++++++++++++++++++++++++--
  documentation/ref-manual/svg/releases.svg               |  77 
+++++++++++++++++++++-------------
  documentation/ref-manual/system-requirements.rst        |   2 +
  documentation/ref-manual/variables.rst                  | 283 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
  16 files changed, 891 insertions(+), 90 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.10.rst
  create mode 100644 documentation/migration-guides/release-notes-4.1.4.rst

Thank you in advance :)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


