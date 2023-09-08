Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F352EE14D8
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 17:00:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.372.1694192397484637393
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 09:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nry/GGlu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 948BF240004;
	Fri,  8 Sep 2023 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694192394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nAP4apkQrTPK8t6qFbMQJg87zFQMBi5j7TY/jXtLuy4=;
	b=nry/GGluKlyM8XBrWvWBSFJqvYQC6J8k3qaGv1PTF5Miemyhoru7A8HXHvrQt7iaNRj358
	IKWxkkYrXTin9clbNY5c8OT/vl4ckqDDKAuhJ6MtvaQHE1ZeHJxxcDCIICK3Yl+dZrCW6G
	Dr2f/M40R3DuIt2DGPvXc2L2A6LZ0vS0wW9NSi1LCR5nn83t1CsV9cgJC4aUp1coNgSxK/
	XWJ+b5sRrwi/MnuLskv6M4IYP0ow9JPRLQupRpKenPsmZaU5I2Xkg26tANQlBvUuYmquzP
	sPhLckH3gZdH/vDuR9VQz55ABz3JBmZ314YdyHWAys6sUOFbw8ibIWcEXDwutQ==
Message-ID: <87380909-a358-4513-5305-86e8cf4c6aa3@bootlin.com>
Date: Fri, 8 Sep 2023 18:59:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
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
 <docs@lists.yoctoproject.org>; Fri, 08 Sep 2023 17:00:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4208

Hi Richard,

The following changes since commit 6c1ef81cce2e211ad2fd2cf5f98ce0cfebbf56f7:

   migration-guides: system-conf -> systemd-conf (2023-08-30 15:55:37 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 7ec90b6af4dc32dbe313b77d17297e19c809bb3c:

   README: Update to point to new contributor guide (2023-09-07 11:27:06 
+0200)

----------------------------------------------------------------
Joshua Watt (1):
       Add libacl to required packages

Lee Chee Yang (2):
       migration-guides: add release notes for 4.2.3
       migration-guides: add release notes for 4.0.12

Richard Purdie (1):
       README: Update to point to new contributor guide

Yoann Congal (1):
       dev-manual: remove unsupported :term: markup inside markup

  README                                                  |  19 +++++------
  documentation/dev-manual/building.rst                   |   4 +--
  documentation/migration-guides/release-4.0.rst          |   1 +
  documentation/migration-guides/release-4.2.rst          |   1 +
  documentation/migration-guides/release-notes-4.0.12.rst | 277 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.2.3.rst  | 263 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/poky.yaml.in                              |   8 ++---
  7 files changed, 557 insertions(+), 16 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.12.rst
  create mode 100644 documentation/migration-guides/release-notes-4.2.3.rst

Thank you in advance,
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


