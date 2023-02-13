Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C262AC636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 16:04:48 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.18294.1676304283366289035
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 08:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UEWeFats;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 066B810000A;
	Mon, 13 Feb 2023 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676304280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AKZetP5YDms8bZg2RztpLhh8JGD/06ACGsuEfma4kL0=;
	b=UEWeFatslEgUGG+cjSj8Newux0Hb5CXzT+wbtEOOEZqsO9PFnbUKXvQWMxHDjg+5ocIq7x
	Av0WSdiItx+/wfKsjY6H1DNv4e3uMmU/1+e3pOWXFGEyDGpqDUeHdb+tMuGE7dGSXlKknD
	anHiwhU/Tqaayvae9js5mUkMIm408BoAg4zl1iHoO6T5se6aT5MR7x78YogXCied7BtD0O
	y6FsZTXCPKaY3VV8Jruush2Hfib4BoUMTQWiuaCwSs6nUZ74ETm++W/wVkU/9s7r75JvvB
	sn8pWQQOJwHkUw3hD+NetRs/EKmp3TtQrFgPX9N4OWXm76Z3i1x3EBpMgVEBoA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: update patchwork instance URL
Date: Mon, 13 Feb 2023 17:04:37 +0100
Message-Id: <20230213160437.350787-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Feb 2023 16:04:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3675

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

https://patchwork.openembedded.org/ has been since long discontinued
Also better to mention https://patchwork.yoctoproject.org/about/
than the patchwork home page.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/changes.rst       | 2 +-
 documentation/overview-manual/yp-intro.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/changes.rst b/documentation/dev-manual/changes.rst
index 9cb25f3549..9db6ce010c 100644
--- a/documentation/dev-manual/changes.rst
+++ b/documentation/dev-manual/changes.rst
@@ -319,7 +319,7 @@ without using the scripts once the steps in
    command, see ``GIT-SEND-EMAIL(1)`` displayed using the
    ``man git-send-email`` command.
 
-The Yocto Project uses a `Patchwork instance <https://patchwork.openembedded.org/>`__
+The Yocto Project uses a `Patchwork instance <https://patchwork.yoctoproject.org/>`__
 to track the status of patches submitted to the various mailing lists and to
 support automated patch testing. Each submitted patch is checked for common
 mistakes and deviations from the expected patch format and submitters are
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 4c847a09de..35f5345ad4 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -361,7 +361,7 @@ Yocto Project:
    of the :oe_layerindex:`OpenEmbedded Layer Index <>`, which
    is a website that indexes OpenEmbedded-Core layers.
 
--  *Patchwork:* `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`__
+-  *Patchwork:* `Patchwork <https://patchwork.yoctoproject.org/>`__
    is a fork of a project originally started by
    `OzLabs <https://ozlabs.org/>`__. The project is a web-based tracking
    system designed to streamline the process of bringing contributions
-- 
2.37.2


