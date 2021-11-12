Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E4FC433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 13:47:54 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15919.1636724872533076281
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 05:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E7588240008;
	Fri, 12 Nov 2021 13:47:50 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/4] ref-system-requirements.rst: Add Debian 11 to list of
 supported distros
Date: Fri, 12 Nov 2021 14:47:38 +0100
Message-Id: <20211112134741.170835-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112134741.170835-1-michael.opdenacker@bootlin.com>
References: <20211112134741.170835-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 13:47:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2131

From: Steve Sakoman <steve@sakoman.com>

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index d12e8dfbe3..eec224d2d2 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -59,8 +59,9 @@ distributions:
 
 -  Debian GNU/Linux 10.x (Buster)
 
--  openSUSE Leap 15.1
+-  Debian GNU/Linux 11.x (Bullseye)
 
+-  OpenSUSE Leap 15.1
 
 .. note::
 
-- 
2.25.1


