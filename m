Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF24C41513
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 14:25:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.89486.1691591129209565689
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Aug 2023 07:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pnYYEfme;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1236C20007;
	Wed,  9 Aug 2023 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691591127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KhkPO+DFzZduoMfiOzty7UyYdcszbcxsk4BZ7bFAAQ0=;
	b=pnYYEfmem3Sm/8RXIRv/017CY4Z0uoSa0M5gB6UwSpS6cFhB+pJKbGhDOvej6ni4GYTmXp
	+knIIkYurGmMkO8P9LsF/c5tO/lZza42u+svp8VQV/DDcz0l3wkLAPNmKNDM9D2hnBE7ha
	9xNtwMNotaJ0uxOmXwIA9nWizaQ5Wo/BYf7XPdD7+UZZuvKx7+8djOrwXCW2AnOhEFCFxY
	11HaLZrHL8C2cEkLelUafja1nJ5reHycLEEDSXyIKxn5dIbnCkQSMYGj75G8IwcLjJR9rY
	sq/+NYpR5cUteEKF6Th/18AvhlitKP/j+Wy5oOAJ0uLyEQsVtbNlbsy9PQhAmA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/3] contributor-guide: add missing links to mailing lists
Date: Wed,  9 Aug 2023 16:25:18 +0200
Message-Id: <20230809142520.226581-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Aug 2023 14:25:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4120

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

And fix such a link too.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-change.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/submit-change.rst b/documentation/contributor-guide/submit-change.rst
index ba56e5986d..2555767102 100644
--- a/documentation/contributor-guide/submit-change.rst
+++ b/documentation/contributor-guide/submit-change.rst
@@ -52,7 +52,7 @@ varies by component:
 
 For changes to other layers hosted in the Yocto Project source
 repositories (i.e. ``yoctoproject.org``) and tools use the
-:yocto_lists:`Yocto Project </g/yocto/>` general mailing list.
+:yocto_lists:`yocto </g/yocto/>` general mailing list.
 
 .. note::
 
@@ -63,7 +63,8 @@ For additional recipes that do not fit into the core Metadata, you
 should determine which layer the recipe should go into and submit the
 change in the manner recommended by the documentation (e.g. the
 ``README`` file) supplied with the layer. If in doubt, please ask on the
-Yocto general mailing list or on the openembedded-devel mailing list.
+:yocto_lists:`yocto </g/yocto/>` general mailing list or on the
+:oe_lists:`openembedded-devel </g/openembedded-devel>` mailing list.
 
 You can also push a change upstream and request a maintainer to pull the
 change into the component's upstream repository. You do this by pushing
-- 
2.34.1


