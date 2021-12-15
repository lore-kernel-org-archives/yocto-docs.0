Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA9AC433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 09:16:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.38067.1639559808061315758
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 01:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 38034400D3;
	Wed, 15 Dec 2021 09:16:45 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/1] Initial documentation for hash equivalence
Date: Wed, 15 Dec 2021 10:16:30 +0100
Message-Id: <20211215091631.1989314-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Dec 2021 09:16:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2264

Greetings,

Here's some content I posted earlier this year, with the
improvements that Richard proposed.

Since this content has already been reviewed, I'd propose
to merge it in "master-next" pretty quickly, and submit further
details this week about hash equivalence starting from this base.

Not too late to cast your reviews though!

Michael Opdenacker (1):
  overview-manual: initial documentation for hash equivalence

 documentation/overview-manual/concepts.rst | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

-- 
2.25.1


