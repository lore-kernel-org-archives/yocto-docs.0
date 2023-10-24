Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19ACC00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:29 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.147722.1698154045240717653
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=de95Fuck;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3171240008;
	Tue, 24 Oct 2023 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8lRcjR60CG5Ldh1m64+wFxN5AWUxOqkzpyuHv4Pu5k=;
	b=de95FucksrZpd2T8VbpEMC7OM94TB7E5e9ZOrvDwkQLabo9Ij4b+6zGQgkLWdGCY97gfgO
	rM0lMawY6anU/6njJu75Imm4/tVmfhvowFv8VFJKro/tfs6psD/ah2l3F/F/q396DDj4Yo
	0rHetUbkjogdwUXJCNPJtkgnYFlD1sCRGK1QP/2CrstOwpMmpRc0A3kjASbjkKwEd6RYfv
	zsdZWdsTsjmrOeUOWadqSKiyxpFQ2LY7wQtkyekAjlaePU/f1KyrDpGsSJgxnMplzJgJ5k
	fyOkGxW0Y5RuwqoHuAgBej8q2cSULMKp0IrofmHOpLCroIRvt/q4M6YFuex9+w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Arne Schwerdt <arne.schwerdt@elbbits.com>
Subject: [kirkstone][PATCH 01/16] ref-manual: Warn about COMPATIBLE_MACHINE skipping native recipes
Date: Tue, 24 Oct 2023 15:26:57 +0200
Message-Id: <20231024132712.90600-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4476

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Arne Schwerdt <arne.schwerdt@elbbits.com>

Signed-off-by: Arne Schwerdt <arne.schwerdt@elbbits.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6fa400a574..148eebf56a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1202,6 +1202,13 @@ system and gives an overview of their function and contents.
       speed since the build system skips parsing recipes not compatible
       with the current machine.
 
+      .. note::
+
+         When :term:`COMPATIBLE_MACHINE` is set in a recipe inherits from
+         native, the recipe is always skipped. All native recipes must be
+         entirely target independent and should not rely on :term:`MACHINE`.
+
+
    :term:`COMPLEMENTARY_GLOB`
       Defines wildcards to match when installing a list of complementary
       packages for all the packages explicitly (or implicitly) installed in
-- 
2.34.1


