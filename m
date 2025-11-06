Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E7DCCFA1A
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 09:11:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10746.1762420302640702238
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 01:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GTYYnhbp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4B462C0FA84
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58EB36068C
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D78A61185064B
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 10:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762420301; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VXeEtP7UQv1EkC9OfkxhS3k1XQimZbs8zCQO2qHuXkg=;
	b=GTYYnhbpJkVAYY/xpL6MLFJJW9unMT6na4g8bMwZPbQfBn9SswV8uG5N6DcdWpntREaMiy
	0QyChqE1xzQVBxnbqqPGwZ2rSS0++0NsPRWYpVidnw4PV4/A7zdwtgvgnmQ9OxEb92ZfHi
	2rgyp3sCu3d/XoTBvpRw9P1D8s7Wu916gwphUdI2/FW+5yO/qrk1CJZmyhfIOlao7SOzw4
	/E9aEWirvuwjrKRg+lsNzJUiT6HZk4B8XDy5RYzRQ2iiO6+K0X2A5wp2Jr9gihaMh4DIMz
	yLPvUmGnB9vR+2UTQcOhtKLHnl1jB/vMeQNBsR0E7RvW9vL3fqj93uIdN4EQOQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 06 Nov 2025 10:11:24 +0100
Subject: [PATCH v3 7/7] ref-manual/terms.rst: update Poky description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-bitbake-setup-v3-7-97db90f85f84@bootlin.com>
References: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
In-Reply-To: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uEHzqAKXqc7JJMqCqzTjRdy94fUsCEFbaZDd6cPSWsI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpDGZHQpYyE39UF7tabMW2p5QQQ3mH79ZOC5FM3
 /+hiFr01XaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQxmRwAKCRDRgEFAKaOo
 Njq+D/9zVUWYFQ8kqK1HAI9GrQZMhpegKLUHGgTsvCuwpOLx3DyciDip4Uvsv7HPyUuTgCXewyF
 Fgp5VGHH8kb8CKwYAMSWYDLKsCvx1sb3+9p4Vuz2Z5jzx4ATDOHq1F4BE0nJjjaBMyJib4qwarp
 LgBI0ZUCaaIXhTbBEOWB83eYFGrIfXl4o6CmJhZQwRqffQJcnyr2Ryeqi3/d5GuVB6YCXE/LMTP
 olQOeQ/GA43LRAF4yzHlXA79Sf5aWqBTSz0BQusGb5MR+uNaP9QsBJjU+eCx3GrsNPiI+yXIvxw
 1Fbt8Q4CR4oKj7VqEBXaHybxQbRsbyH8PvDko/VPD7OMflsnfdkFB+SNpp6rB+Qkpf8WY3n9Xn5
 Hxjw8rJySy5DGaQsKJ07mvoariXn5VZdNc8fg/lDeBXywvSJs2C0MjFYRvc+edxiLBCd00uZYns
 kgsQCoWg1BWjwInKyVA0JDELEoP/rxB4IYkiUdO0cEyCD0J23xcPGx8NdzdoTWVPQd93Y/Vcui/
 CqPadS+CjkCNcJNXjb1aiKd+Aj2rlBY1fGqtAggOcPhTSI0/3m4L7Y4ybzFuG+OO+RfG/rE4K7v
 sVFFSs8yPLvMvcdKaG+Le5KF6UnnJFI0/crQl6qwGKFINmMI84Ua79cN4bHF7WY6BD03l4vrc71
 U1pbtcr+eUk5yYw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 09:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8004

Poky as in the repository will no longer be updated. Update the
description of Poky to remove the last bullet point, and add a note to
say that Poky was used before.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index e25c714d9..6a9f88061 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -461,11 +461,26 @@ universal, the list includes them just in case:
       -  A means by which to test the Yocto Project components (i.e. Poky
          is used to validate the Yocto Project).
 
-      -  A vehicle through which you can download the Yocto Project.
-
       Poky is not a product level distro. Rather, it is a good starting
       point for customization.
 
+      .. note::
+
+         Poky also used to be a repository containing the combination of
+         :term:`BitBake`, :term:`OpenEmbedded-Core (OE-Core)`, the
+         :yocto_git:`meta-yocto </meta-yocto>` repository and the Yocto Project
+         documentation -- which were combined with the :yocto_git:`combo-layer
+         </poky-config>` tool.
+
+         This repository is still hosted at :yocto_git:`/poky` and is still
+         updated for maintained releases that are older than Whinlatter (5.3).
+         Newer releases now use ``bitbake-setup`` to clone and setup the initial
+         :term:`OpenEmbedded Build System` environment. For more information on
+         how to use ``bitbake-setup``, see the :doc:`/brief-yoctoprojectqs/index`
+         document. An alternative can be to setup the above repositories
+         manually, by following the :doc:`/dev-manual/poky-manual-setup`
+         section of the Yocto Project Development Tasks Manual.
+
       .. note::
 
          Poky began as an open-source project initially developed by

-- 
2.51.0


