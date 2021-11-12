Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352ADC433FE
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 13:48:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.15743.1636724874605526058
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 05:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 906A81BF213;
	Fri, 12 Nov 2021 13:47:52 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/4] ref-system-requirements.rst: Add Fedora 33 and 34 to list
 of supported distros
Date: Fri, 12 Nov 2021 14:47:39 +0100
Message-Id: <20211112134741.170835-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112134741.170835-1-michael.opdenacker@bootlin.com>
References: <20211112134741.170835-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 13:48:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2132

From: Steve Sakoman <steve@sakoman.com>

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index eec224d2d2..de55dac542 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -49,6 +49,10 @@ distributions:
 
 -  Fedora 32
 
+-  Fedora 33
+
+-  Fedora 34
+
 -  CentOS 7.x
 
 -  CentOS 8.x
-- 
2.25.1


