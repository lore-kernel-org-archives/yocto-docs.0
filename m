Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DC8C48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 21:16:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.114.1708550213913835912
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 13:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=djYHDyWC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC59920002;
	Wed, 21 Feb 2024 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708550212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9YCpBT9t0bU8489tMvBmpkN3hh5S7fQjr/dcladsRXE=;
	b=djYHDyWCApgHvwOkKKyJEEuEma2W/E0AbAsnJmVj06rKonLXHD+1Tua15dXQYer4d1WpS0
	BmxuOJjgUMcjiNs/qdFm6Hl1nUHBJxByryPA0rINjIDLUGvld85uMft/cEpdCcMrQiXMnr
	XMoho3Cg8j51by+s8/6knUUHJMuQAQHIatr5ZIEBALwn4tfs81o7O29ImgcuiI/Iv7FUZS
	Igucm0/zYhUbo3Z86OA9/OC6iPde1jGUYfw+nHLc4XIx9cZwH2pspDyjBaIMnsnlXaoiUL
	R0QLshysu5Gni3z7hta1R+Tzg2vqB+GjyOaJ8QSHFT+GObTwRohhfJf6/QLlNw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: packages: clarify shared PR service constraint
Date: Wed, 21 Feb 2024 22:16:48 +0100
Message-Id: <20240221211648.104003-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Feb 2024 21:16:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4855

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Explicit the problems previous described as "obvious".

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/packages.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 0e991e409a..d90ff7110e 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -205,9 +205,14 @@ history, see the
    The OpenEmbedded build system does not maintain :term:`PR` information as
    part of the shared state (sstate) packages. If you maintain an sstate
    feed, it's expected that either all your building systems that
-   contribute to the sstate feed use a shared PR Service, or you do not
-   run a PR Service on any of your building systems. Having some systems
-   use a PR Service while others do not leads to obvious problems.
+   contribute to the sstate feed use a shared PR service, or you do not
+   run a PR Service on any of your building systems.
+
+   That's because if you had multiple machines sharing a PR service but
+   not their sstate feed, you could end up with "diverging" hashes for
+   the same output artefacts. When presented to the share PR service,
+   each would be considered as new and would increase the revision
+   number, causing many unnecessary package upgrades.
 
    For more information on shared state, see the
    ":ref:`overview-manual/concepts:shared state cache`"
-- 
2.34.1


