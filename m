Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7194C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:50:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.7149.1676382617476597291
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 05:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ePDywW5X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2269B1C000E;
	Tue, 14 Feb 2023 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676382615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ApJlSExIiRmDQ/JxWQJeBGvLH3k6mLMVyyiAUfnVWPo=;
	b=ePDywW5XHVJMTZwjwzSDjhiHp45iVVjtGsYpuFIibON/e/Os+kOmANWemnqkrYYJKhOsTc
	c+7CiceilxRU/SZW1oq1frU5U4SMAAqrIvYSjzsWTVLxZkWwdFTl/9XcHXEdFftrmW3j6G
	tnjpadJFSh039XSnDzIgXQz/fRuyZGUgdDa0E2Tsw6iuGMdUZ35xwd6HLl2XKyaxIMxr+R
	so9tRQ1OmU8pEU4FRwcXfzdqVO2C5IbdQ7yRDlCkhwHMW+jG2gl6TIz0Yyw6K7jSSjuAFd
	WC2wwPy0o2K6QBqwnsr2WPfxXgp5gK3rIi0oGnmffYnB97sNmpGg7qQUrw0cYw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [langdale] manuals: update patchwork instance URL
Date: Tue, 14 Feb 2023 14:50:08 +0100
Message-Id: <20230214135008.45028-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Feb 2023 13:50:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3680

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

https://patchwork.openembedded.org/ has been since long discontinued
Also better to mention https://patchwork.yoctoproject.org/about/
than the patchwork home page.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst  | 2 +-
 documentation/overview-manual/yp-intro.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 9bc65b722e..67018e6517 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10734,7 +10734,7 @@ without using the scripts once the steps in
    command, see ``GIT-SEND-EMAIL(1)`` displayed using the
    ``man git-send-email`` command.
 
-The Yocto Project uses a `Patchwork instance <https://patchwork.openembedded.org/>`__
+The Yocto Project uses a `Patchwork instance <https://patchwork.yoctoproject.org/>`__
 to track the status of patches submitted to the various mailing lists and to
 support automated patch testing. Each submitted patch is checked for common
 mistakes and deviations from the expected patch format and submitters are
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 8b476f43c4..8a571176dc 100644
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


