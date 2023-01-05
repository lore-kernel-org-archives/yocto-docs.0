Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5E0C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:20:22 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.15372.1672932016550407684
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 07:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VJnJwsPn;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2C263240010;
	Thu,  5 Jan 2023 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672932014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p0mvcbvtDC9bKPrYpxdozvJgsNnBAOrQZue8/zLOYxk=;
	b=VJnJwsPn8Hsnnmxfq8ubh6s6GkG6NCHNIBj8gZg4vi/8EiSYo/p58ieGmsrOeTfMQ2l6hf
	aBHE+NZAv3J5u/zT3kRVZBv5xycl/zu1y2KcV8KjPluw3Dc8ctuHyJs1d02V+7usFZzH1E
	jUukRx6BpXzUq+ub8TDbxjVRnckCwbOSvC17pGQo8xVoSzxEUtqz+p97bDdVALg8RAcgCp
	aUXf0WxRRrXMIo7py4YBMHbijrAsDM/ARLsKyiwe3OShAnDv1QGhH33HSbvGEMDkiGIwjh
	YT01Y0I+iyIcaj7QzyAP6C4O5Fk5qIfgg0EcLkHlTiDFWOVCUxUXbQG/A+YbTw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] ref-manual/system-requirements.rst: recommend buildtools for not supported distros
Date: Thu,  5 Jan 2023 16:20:10 +0100
Message-Id: <20230105152010.2318650-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3593

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also minor correction to supported distribution notes

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 documentation/ref-manual/system-requirements.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 1f9b3b1b58..2bb813b385 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -34,8 +34,7 @@ and conceptual information in the :doc:`/overview-manual/index`.
 Supported Linux Distributions
 =============================
 
-Currently, the Yocto Project is supported on the following
-distributions:
+Currently, the Yocto Project is supported on the following distributions:
 
 -  Ubuntu 18.04 (LTS)
 
@@ -71,7 +70,11 @@ distributions:
       has no plans to support rolling-releases or development
       distributions due to their constantly changing nature. We welcome
       patches and bug reports, but keep in mind that our priority is on
-      the supported platforms listed below.
+      the supported platforms listed above.
+
+   -  If your Linux distribution is not in the above list, we recommend to
+      get the :term:`buildtools` or :term:`buildtools-extended` tarballs
+      containing the host tools required by your Yocto Project release.
 
    -  You may use Windows Subsystem For Linux v2 to set up a build host
       using Windows 10 or later, or Windows Server 2019 or later, but validation
-- 
2.37.2


