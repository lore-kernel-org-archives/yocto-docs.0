Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF11C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 10:09:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.19576.1701425382365467761
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Dec 2023 02:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nFVgEuEa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E83A1C0002;
	Fri,  1 Dec 2023 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701425380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=645nKOn9HV9h9xAc4FFS+Mv45grvaVkfm9l/82L7x8g=;
	b=nFVgEuEa+BQxWGJ9U6zgpWQGgukDapnoOKbVHWMnrBvLBcaGecg0/qbHNjX0qSHvNWoaaq
	tDWH2RPbs/8qC4AUwO/kg22IV+2gMK5zBQa9RKqjNDjFd30tU5OPW/H/Ti1SVMC0cA7dBd
	8OOsnc0VtM8r8AgojYh5eb4MB8kgDSYMBeqTH9Tu2VOQy3nKo1fORkxZoaEw8xzbqlLK0L
	jaBCsIwEo/YrJnmiB3rGkPFGCU32sp/ZCRvJkyjt1f3Z+Qe2aj5rQpBnpGC1NmbbM9X90c
	kSwHzzkD9CXAnHpqgHCkplF/rCsRnh+Ld0g5/VBuI3dXIb4baJIO56mjahMCtA==
Message-ID: <08ff66a3-5259-48d8-9aab-05999acde4cf@bootlin.com>
Date: Fri, 1 Dec 2023 11:09:39 +0100
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
 <docs@lists.yoctoproject.org>; Fri, 01 Dec 2023 10:09:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4654

Hi Richard,

The following changes since commit de4fb1f877ae9994c61dfc60447446da317bee0f:

   migration-guide: add release notes for 4.2.4 (2023-11-16 10:29:02 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 7107e18bfa4cf24b912df6c60d8ffb8c74152bca:

   migration-guides: release 3.5 is actually 4.0 (2023-11-30 15:45:49 +0100)

----------------------------------------------------------------
Justin Bronder (1):
       contributor-guide: add License-Update tag

Lee Chee Yang (1):
       migration-guides: add release notes for 4.3.1

Michael Opdenacker (3):
       dev-manual: layers: update link to YP Compatible form
       contributor-guide: fix command option
       migration-guides: release 3.5 is actually 4.0

  documentation/contributor-guide/recipe-style-guide.rst |  12 ++++++++
  documentation/contributor-guide/submit-changes.rst     |   2 +-
  documentation/dev-manual/layers.rst                    |   4 +--
  documentation/migration-guides/migration-2.2.rst       |   2 +-
  documentation/migration-guides/migration-3.0.rst       |   2 +-
  documentation/migration-guides/migration-3.4.rst       |   2 +-
  documentation/migration-guides/release-4.3.rst         |   1 +
  documentation/migration-guides/release-notes-4.3.1.rst | 237 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  8 files changed, 256 insertions(+), 6 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.3.1.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


