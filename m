Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD249C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 11:25:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10844.1709119523848592694
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 03:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BAsVKVRb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 544C71BF211;
	Wed, 28 Feb 2024 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709119521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EI01ZzLEHGcZ6x9H5f14ILp94M8Wi6Zl4P1IosQ2PFw=;
	b=BAsVKVRbz3byziXIBgBTCC9Q5vSZJic4FD0jaBe49fEkKZIglNGTBtyTWW37icEVJyB1MQ
	8JhnQfUUeyQnHn7lNh3Fi8LtjAwm5F8bi4tzoG+jnCWJD5ta1DdJny3xrQ9KBdfBfYwBvQ
	tGBmaoIoqq5pjzb301TXwg0PXX8NMdWDF6ISdOD+zXQnGI1bjPJSXvS5Joc+VhXMFD5jBv
	Fji8bctZEFcJEkWtCgDAjLeyap4ssbXGRNZjUcCij6v4+mGgbsXaLpE+M7e2MQbD3VC26M
	8ivParqtD21mn3jQ8yaP2Pg8g/SdFnl12U6AaFEMY6CXeloFQ9Pc+Q9+5vnH9w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 0/2] Discourage using do_cleansstate and do_cleanall
Date: Wed, 28 Feb 2024 12:25:13 +0100
Message-Id: <20240228-clean-tasks-notes-v3-0-368af5e1aa0e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABkY32UC/32NQQ6CMBBFr0Jm7ZhmEBBX3sOwKGWQidiaTkM0h
 LtbOYDL95L//grKUVjhUqwQeRGV4DOUhwLcZP2dUYbMQIZOhqhBN7P1mKw+FH1IrFjV57a1le2
 HsYa8e0Ue5b03b13mSTSF+NkvFvrZf7WF0GBZjX1NDbfOmmsfQprFH114Qrdt2xeyUBmMtAAAA
 A==
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Feb 2024 11:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4912

do_cleansstate and do_cleanall can generate build failures. Document this
and discourage using them.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- fix typos
- add missing '-c'
- mention DL_DIR and SSTATE_DIR
- reword sentence using the version proposed by Quentin
- Link to v2: https://lore.kernel.org/r/20240227-clean-tasks-notes-v2-0-35fb627e9ca0@bootlin.com

Changes in v2:
- improved the do_cleanall patch to show it applies also without a
  shared DL_DIR
- add new patch for do_cleansstate
- Link to v1: https://lore.kernel.org/yocto-docs/20240219155513.76738-1-luca.ceresoli@bootlin.com

---
Luca Ceresoli (2):
      ref-manual: tasks: do_cleanall: recommend using '-f' instead
      ref-manual: tasks: do_cleansstate: recommend using '-f' instead for a shared sstate

 documentation/ref-manual/tasks.rst | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)
---
base-commit: 6571eb02cbd5c2b96df0f279f25b63255ab7eac4
change-id: 20240227-clean-tasks-notes-56899a5abdf6

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


