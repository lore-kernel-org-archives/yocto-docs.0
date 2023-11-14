Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0C3C41535
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 16:50:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.17592.1699980597967507875
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 08:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GV8tgBkm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CB2C20005;
	Tue, 14 Nov 2023 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699980596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pjj7RrhjcWxEVMKtpimeePVwpAZXoliVoQ3Y7TmcjlI=;
	b=GV8tgBkm3Fgw1uKhoS4Bn6BkRXoxZs3nyDKyjg2IzVbXNUJSq6onTW2hE2dxnRgVOoSIwL
	WGgfWn1Z7i5Pj1FUykQFHhBJ6EpuPyVnFls1hPbtELnzo46l5/qdix5qKk806Vrcr188a8
	RYyrL9v++M0r4PIrLS2nZDXWy9ofbRNJ/fF+YUpVjCeO28bp1TrnAUmDYOdHEqvse93vbX
	LSnBIWaJo85GWoPlnoPdZekr2X96vJ5b7Zs4HERYg2Uy+bRrnS8hgmi4rgYA9oM8ES5K/b
	pYCg3sA7dlDrOaII4V76BBqBV0a8D6kvYbM0Mz1jqkZpFH2REJvphA1VoHYvkA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Paul Eggleton <bluelightning@bluelightning.org>
Subject: [kirkstone][PATCH 5/7] ref-manual: update SDK_NAME variable documentation
Date: Tue, 14 Nov 2023 17:49:40 +0100
Message-Id: <20231114164942.133472-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
References: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 16:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4625

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Paul Eggleton <bluelightning@bluelightning.org>

Update for changes in nanbield. Note that I am documenting what is set
by poky.conf here (since this is Yocto Project documentation), which is
slightly different from what is done in meta/conf/bitbake.conf.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a75581f2fd..5163abf559 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6880,13 +6880,16 @@ system and gives an overview of their function and contents.
       :term:`SDK_EXT_TYPE` is set to "full".
 
    :term:`SDK_NAME`
-      The base name for SDK output files. The name is derived from the
-      :term:`DISTRO`, :term:`TCLIBC`,
-      :term:`SDK_ARCH`,
-      :term:`IMAGE_BASENAME`, and
-      :term:`TUNE_PKGARCH` variables::
-
-         SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${IMAGE_BASENAME}-${TUNE_PKGARCH}"
+      The base name for SDK output files. The default value (as set in
+      ``meta-poky/conf/distro/poky.conf``) is derived from the
+      :term:`DISTRO`,
+      :term:`TCLIBC`,
+      :term:`SDKMACHINE`,
+      :term:`IMAGE_BASENAME`,
+      :term:`TUNE_PKGARCH`, and
+      :term:`MACHINE` variables::
+
+         SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 
    :term:`SDK_OS`
       Specifies the operating system for which the SDK will be built. The
-- 
2.34.1


