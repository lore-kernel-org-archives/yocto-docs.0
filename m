Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9E1C77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 18:43:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.2825.1683312220476544425
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 11:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X4LPeYBr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 10378240007;
	Fri,  5 May 2023 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683312218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mtde/wTxoE8AgjkhZPRvsPeWi8HScWwJB4+RJedBX+M=;
	b=X4LPeYBrOZ0MG3ZRnQc0KshKQ0tzULazWxeU9mcQ+g2s8wK8iC3pR9Ll8fXP+lCgMveMem
	+AWt0m7GTq6DuomAm1OdNWbfV7BLl/3qViHhOp4i+LBryxFk8DQphUu21H1mk+G9e7hgk2
	qIf2eWEN8kWwHLRnTzgPmN0b6ldDv9xJasuzxJOxRuq3Oa99Vvs+ZmJKIy4s63ldKZqY1b
	UWoVt7a5SXO/y2pQ3Ct03pseZW4+9xXUVcKnuxCfksUieKVHnFK/QtVS4SO23XiMEM4Y73
	Fb91U3aHahh65pirGCL76bRsABC4ypjwgAUg0///fildS4oJY7sEJfaWauFVEw==
Message-ID: <9162f928-45d1-0452-69c6-c968ad6bfd07@bootlin.com>
Date: Fri, 5 May 2023 20:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
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
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 18:43:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3920

Hi Richard,

The following changes since commit d84b771e2ca22fa7dd9525dc515d3972035366eb:

   ref-manual: system-requirements.rst: fix AlmaLinux variable name 
(2023-05-03 06:05:25 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 220b25d7d47d46b0d85c616b88ead75fab917092:

   ref-manual: classes: kernel: document automatic defconfig usage 
(2023-05-05 20:38:37 +0200)

----------------------------------------------------------------
Luca Ceresoli (2):
       ref-manual: classes: kernel: remove incorrect sentence opening
       ref-manual: classes: kernel: document automatic defconfig usage

Michael Halstead (1):
       docs: add support for mickledore (4.2) release

Michael Opdenacker (3):
       ref-manual: variables.rst: don't mention the INIT_MANAGER "none" 
option
       migration-guides: start of 4.3 migration and release notes
       ref-manual: document FIT_ADDRESS_CELLS

Richard Purdie (1):
       migration/release-notes-4.3: Add extra notes

  documentation/migration-guides/index.rst             |   1 +
  documentation/migration-guides/migration-4.3.rst     | 102 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-4.3.rst       |   9 +++++++++
  documentation/migration-guides/release-notes-4.3.rst |  71 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/poky.yaml.in                           |  12 ++++++------
  documentation/ref-manual/classes.rst                 |  20 
++++++++++++++------
  documentation/ref-manual/variables.rst               |  31 
++++++++++++++++++++++++++-----
  documentation/set_versions.py                        |   6 ++++--
  8 files changed, 233 insertions(+), 19 deletions(-)
  create mode 100644 documentation/migration-guides/migration-4.3.rst
  create mode 100644 documentation/migration-guides/release-4.3.rst
  create mode 100644 documentation/migration-guides/release-notes-4.3.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


