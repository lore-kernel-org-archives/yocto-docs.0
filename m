Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0C0E6FE29
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 13:19:23 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.21425.1695388761700086064
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 06:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jrm05KYx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECA5620002;
	Fri, 22 Sep 2023 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695388760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vLEqL9tRCKCKUa/JKli08PyyJYLqCex7iLYaQJh0MEw=;
	b=Jrm05KYxNXIhMQ3tOS/DB5VFcfOtiKxUDDvaq2UuPbLdfCk3LOXSYfXmF9r/8YVK7HxKJg
	1d7H+QN69FUnB34eXFxkErD41b3hugyBN9uggMLny5FsxBoA4JCzs/etLvpL6dgIzlVeo6
	hs6Zmytn0WVPZMqsWWWX6egXpUP1s5hz9muWSTnPXS3jNaqvQVye0PDQGKQjn6ForBcNdF
	LVTg3PZwUzi+aO4eP5F/VI5IoTp9LAbxhUYXvmy4OO4w5YpnWLbkuMSuNpC7tsReOc7Aon
	u5UWq1jrO8VFpWsewbFIKZPMp/vN681F+cDf88jQtqHua5jZDxHg+P0hz9h6HA==
Message-ID: <fd7baf57-fa9d-5dca-9560-1a3d85f3af2e@bootlin.com>
Date: Fri, 22 Sep 2023 15:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Roland Hieber <rhi@pengutronix.de>
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
 <docs@lists.yoctoproject.org>; Fri, 22 Sep 2023 13:19:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4297

Hi Richard,

The following changes since commit 318261d8ea91c2373709a9c1e82304ab7e9e9a3b:

   sdk-manual: extensible.rst: fix multiple formatting issues 
(2023-09-19 16:31:50 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 4924c900582aaa803b003e10e48fc4a4373f6a77:

   contributor-guide: style-guide: discourage using Pending patch status 
(2023-09-22 15:05:10 +0200)

----------------------------------------------------------------
Michael Opdenacker (2):
       bsp-guide: bsp.rst: replace reference to wiki
       dev-manual: new-recipe.rst: replace reference to wiki

Richard Purdie (2):
       contributor-guide/style-guide: Refer to recipes, not packages
       contributor-guide/style-guide: Add a note about task idempotence

Roland Hieber (5):
       contributor-guide: recipe-style-guide: add more patch tagging 
examples
       contributor-guide: recipe-style-guide: add section about CVE patches
       contributor-guide: discourage marking patches as Inappropriate
       contributor-guide: deprecate "Accepted" patch status
       contributor-guide: style-guide: discourage using Pending patch status

  documentation/bsp-guide/bsp.rst                        |   4 ++--
  documentation/contributor-guide/recipe-style-guide.rst | 127 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------
  documentation/dev-manual/new-recipe.rst                |   6 +++---
  3 files changed, 99 insertions(+), 38 deletions(-)

Thank you in advance
Kind regards
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


