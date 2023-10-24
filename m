Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5773AC25B6E
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.147629.1698153825555260903
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DV6TwRCe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF2E0C000C;
	Tue, 24 Oct 2023 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BY999GfuIf3FnCYTal75ONyBKvUeJnJ3Ibxse+B3MBA=;
	b=DV6TwRCe3bbQoAIMFWQRf1NSAj+A22nOAkBdEFx+A7Y2vsk0kGM36EQkhAkkTnnpE13lVz
	LN+zqsZdeR+3EVgL6P8psclSOm0WQLAdb5pTi7/vFt3iayqEUorHl7HXwMaqNNhQMCyUJ3
	EcRByan1vN6hLRiBorGUWyxqBveIX86balgy/IHO+xHBw6IhasJi4wnidD+qHqlElp7/3u
	nIq8WKmJ05+5KHwhnGCLtCstn2UKqQzMJqdb6PFmBZ/QakQuDNK8RaCH937zVh8IA+ND1z
	mOBZESvnRkbwn4q8QRMezWRizUmTOlJY9ieLiuqdcqQAJb0z5qsREQd100j0Gg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [mickledore][PATCH 12/13] ref-manual: variables: add TOOLCHAIN_OPTIONS variable
Date: Tue, 24 Oct 2023 15:23:17 +0200
Message-Id: <20231024132318.90209-13-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
References: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4473

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELHADJ SALEM Talel <bhstalel@gmail.com>

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index aab41fedb2..3529b6f47c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8931,6 +8931,16 @@ system and gives an overview of their function and contents.
       portion of an eSDK. This is similar to :term:`TOOLCHAIN_HOST_TASK`
       applying to SDKs.
 
+   :term:`TOOLCHAIN_OPTIONS`
+      This variable holds extra options passed to the compiler and the linker
+      for non ``-native`` recipes as they have to point to their custom
+      ``sysroot`` folder pointed to by :term:`RECIPE_SYSROOT`::
+
+         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
+
+      Native recipes don't need this variable to be set, as they are
+      built for the host machine with the native compiler.
+
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
-- 
2.34.1


