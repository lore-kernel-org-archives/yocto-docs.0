Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02F1C3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 15:14:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.37783.1672672452694377386
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jan 2023 07:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RAuh6UQP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D599FE0005;
	Mon,  2 Jan 2023 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672672451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=he8oxM+ql1lSwhVW5ndMUVmonD5TFVLTvN6rz5W1Tt0=;
	b=RAuh6UQPpuXVIIToXQsS4wFTM+MDohjOqYS/NW4soqAiUvMoh2c29myux6iQc/MFYg9hvp
	M2YqgEsuuuq7wqV8QCVsl0J2E0G3kZuSC5Vj+PDFAgnXCHJpKv/SMNPsVxJE6UbmoDzd9W
	qenmisbNc5UW5zOyS0RcFlVH/xpXkXMpSt0eZOKg76UtUQUy8uPfQPFOPkFlEdeyboWjj0
	L+YvQCTVBSXT0hbkHv26wCoSuhyHUY0dElIBww0ys5Cmxo1eWeYaPqDyfcYPm703+WLdNY
	B75Iu/ASdXJJ+zSDnwF3uJjrlkO4viwKeDeVB/asa+f2ksRKb3zhbeAkiiQbrg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] toaster-manual: fix description of introduction video
Date: Mon,  2 Jan 2023 16:14:08 +0100
Message-Id: <20230102151408.740030-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jan 2023 15:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3570

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

The video referred to didn't correspond to the latest
Poky releases.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/toaster-manual/intro.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/documentation/toaster-manual/intro.rst b/documentation/toaster-manual/intro.rst
index a324744b7d..046ff88ce8 100644
--- a/documentation/toaster-manual/intro.rst
+++ b/documentation/toaster-manual/intro.rst
@@ -76,9 +76,8 @@ extensive information about the build process.
    -  See performance information such as build time, task time, CPU
       usage, and disk I/O.
 
-For an overview of Toaster shipped with the Yocto Project &DISTRO;
-Release, see the "`Toaster - Yocto Project
-2.2 <https://youtu.be/BlXdOYLgPxA>`__" video.
+For an overview of Toaster, see this
+`introduction video <https://youtu.be/BlXdOYLgPxA>`__.
 
 Installation Options
 ====================
-- 
2.37.2


