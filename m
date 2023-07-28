Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E1EC0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 12:49:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.31303.1690548553985957553
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jul 2023 05:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m61DTQ3l;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC492C000B;
	Fri, 28 Jul 2023 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690548552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FZsXLjVu3RNUE+G8T1Fe4G5XyMDzTk8q/4DjJtE4saE=;
	b=m61DTQ3lk/fBqhkCCn4SrJPtun+RDoGl6gOfe6ssVHupOgQq3knS2Klt0wANSoCKCkK7MI
	fIABGw4Ykbftg1nMDQYnANyMcQ6VbifiKAHs7+WV9agnBTXTEAfGvijm1W7ASBz/tjKPdv
	r8rBdPpmA4YwsCaWhdPIpLe33E+r+vPMFInsnDEkikS5rdrHEWdc4CAT6QRBJztvQvpWji
	Xg1U+nLhqM8pre1dde4C4XUvtgIfCBfvElmVCIaZ2xzhxRxUd2cCEcCY1J2JEKq2/JdFHl
	tx8Khr9SouuT+qYaJEV1+bAXp0fXsTB3XcT0bMS5jfLZ+umGwwhLk7vZS3fSiA==
Message-ID: <ab94a5ad-0d64-1170-ff18-f82b431d7bac@bootlin.com>
Date: Fri, 28 Jul 2023 14:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Jul 2023 12:49:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4081

Hi Richard

The following changes since commit cbacc8a77aca68c5b25c8cad42bc4c88275cfc09:

   ref-manual: classes: devicetree: fix sentence saying the same thing 
twice (2023-06-23 19:34:37 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 8b8054977f31e2d6090521a0102f066b6d563733:

   ref-manual: document CVE_STATUS and CVE_CHECK_STATUSMAP (2023-07-21 
16:51:34 +0200)

----------------------------------------------------------------
Andrej Valek (1):
       ref-manual: document CVE_STATUS and CVE_CHECK_STATUSMAP

Lee Chee Yang (2):
       migration-guides: add release notes for 4.0.11
       migration-guides: add release notes for 4.2.2

Michael Opdenacker (2):
       ref-manual: releases.svg: updates
       ref-manual: LTS releases now supported for 4 years

Quentin Schulz (1):
       docs: sdk-manual: appendix-obtain: fix literal block content

Ulrich Ölmann (3):
       ref-manual: classes: kernel-fitimage: fix source of imagetype
       ref-manual: classes: kernel-fitimage: fix typos
       ref-manual: classes: kernel-fitimage: refine role of 
INITRAMFS_IMAGE_BUNDLE

  documentation/dev-manual/new-recipe.rst                 |   3 +-
  documentation/dev-manual/vulnerabilities.rst            |  13 ++-
  documentation/migration-guides/release-4.0.rst          |   1 +
  documentation/migration-guides/release-4.2.rst          |   1 +
  documentation/migration-guides/release-notes-4.0.11.rst | 214 
+++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.2.2.rst  | 330 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/ref-manual/classes.rst                    |  24 +++---
  documentation/ref-manual/release-process.rst            |  21 +++--
  documentation/ref-manual/svg/releases.svg               | 677 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------
  documentation/ref-manual/terms.rst                      |   2 +-
  documentation/ref-manual/variables.rst                  |  34 ++++++--
  documentation/sdk-manual/appendix-obtain.rst            |   7 +-
  12 files changed, 1197 insertions(+), 130 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.11.rst
  create mode 100644 documentation/migration-guides/release-notes-4.2.2.rst

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


