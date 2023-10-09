Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D390AE95A91
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 13:22:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.61631.1696857774594230561
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 06:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oBkBfKaQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 205971BF208;
	Mon,  9 Oct 2023 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696857772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ayeL2q8qP5531KsrrU8gkHQ91CCMqcYTgdD8m0qA8Lw=;
	b=oBkBfKaQS2OcIKRmHfiDF62obRtdLe5zosmzyIYtY8LCdIiJTKYOE5j9NOANtihR8vtbpv
	cIvNCkJYf9rEF3TdYYL+zV+1ovko3Zt4wisbSot4PYP8OMQw5Xy1id7LU8wmB8KBUm54RH
	YtyCN8Snz8wGuTNn4F9fZOiVQxEI+TG5mncAD40tGMpfe5P02dpRLPuXiUqdEXvG7yMziW
	ydODsJPrDeMUOvW+VihjxoxURNveTmH/LXCCsAwp0Ug+qCQ1m7n0dOaYXBb2ED6opnilNQ
	wxA49EkGJjy3TCX5l7VJ9xt8JJ9oEKBTNsCYSCsaZhYLsCzE1+mwfx9nA4IXwQ==
Message-ID: <7005259b-70ac-4fff-9d7d-830ee784879f@bootlin.com>
Date: Mon, 9 Oct 2023 15:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <docs@lists.yoctoproject.org>; Mon, 09 Oct 2023 13:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4333

Hi Richard

The following changes since commit 4924c900582aaa803b003e10e48fc4a4373f6a77:

   contributor-guide: style-guide: discourage using Pending patch status 
(2023-09-22 15:05:10 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to ceb1812e63b9fac062f886c2a1dde23137c0e1ed:

   migration-guides: add release notes for 4.0.13 (2023-10-06 09:59:00 
+0200)

----------------------------------------------------------------
Joshua Watt (1):
       overview: Add note about non-reproducibility side effects

Lee Chee Yang (1):
       migration-guides: add release notes for 4.0.13

Michael Opdenacker (1):
       ref-manual: releases.svg: Scarthgap is now version 5.0

Trevor Gamblin (1):
       dev-manual: fix testimage usage instructions

  documentation/dev-manual/runtime-testing.rst            |   4 +-
  documentation/dev-manual/upgrading-recipes.rst          |   2 +-
  documentation/migration-guides/release-4.0.rst          |   1 +
  documentation/migration-guides/release-notes-4.0.13.rst | 271 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/overview-manual/concepts.rst              |   9 ++++
  documentation/ref-manual/svg/releases.svg               |   2 +-
  6 files changed, 285 insertions(+), 4 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.13.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


