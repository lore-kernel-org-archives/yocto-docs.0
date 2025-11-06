Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3ACCCFA1B
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 09:11:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10708.1762420301174363852
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 01:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=unUVmlJP;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D0721C0FA8B
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDE036068C
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58D85102F2506
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 10:11:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762420299; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+IbYeqlfN3V4UrCV8hiGnDA+2KS9TgYNSO68ppOEd84=;
	b=unUVmlJP7j/M1bnPjYLBh4NMQeSahepmUIb4+v8zuVIKvq8S8GMh3+WFIjojA/rFyrqkYY
	WQF748xN7htAnufEIoAuF+fYi3LbF4mJeCcjeQ0iMonw7mKbNkSHKvOwHmdMtszJCUdWnO
	kCivXrM/eZVGhwXPqHj2MKw5IlvplgTs4/AQWWdDf7R4EnRXUqiVDXvBV6gYQwIB6tVJK9
	dfu2PgCkAGPpGDqHCD3vOe3mshKmdJPSD76RaeEvQqaIwJuytbp7tBMywXxPNG/5gASmn+
	ZxIBUD4oUxjJRKNgp1h224KsLnJ8CdosaV0dewBc0OqTxIh8h26Od3RFTt42kA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 06 Nov 2025 10:11:21 +0100
Subject: [PATCH v3 4/7] ref-manual/fragments.rst: document
 core/yocto/root-login-with-empty-password fragment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-bitbake-setup-v3-4-97db90f85f84@bootlin.com>
References: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
In-Reply-To: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YkOzAjJTrHymWCf8zYPfiYwQCtyNO97gRDZzECSA1uE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpDGZGi06VYygxeh9MyGsRt51WWIcQ9L6Yr0OlF
 +fCJDkq/0eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQxmRgAKCRDRgEFAKaOo
 NuyJEAClBzmUNjVfeonyZoctRTMOvQ8T6IHvlUu32q3/yr50D/wcCvlVejW/fWSXJhaZ5Tmvtan
 sXxyiQz/+HfR1VbKPlKzksZ5KH2cqX3OfyLU6NHZmOtJ+itlvgfSPWT+KRuvt4USWN/QxBoB0JE
 f0EHJp0F/SCQYhdb35DFzUHOIUL6EBVrgEsbibtG3PSB3Tmk5rtlZY2N+yiwQAxL/rk5uGvKsDR
 RSLlO+V7Nvwsb97TupaV/OmI319k4I2Loqdw8PdPXaTV9csjnYhaoQyqNCOzOnGVjME+cW4OdZG
 fjQx46dHafwS5lWfv7q8owXrkRNhoB2gytdDRVNOJfDEiLVq3SIrzd48nhr4dyB+EAIeSuDcaVs
 W632S2VJmNKtqfcFl8boYjSkqkiO44CSkCMbt5wgyQD2G88gN0P0jCRlMkvbVH9MHMgYDBB8GUZ
 bgIrp1LGQft3jZJ4AZDG3u5+pyXjVn7zUL1I8ImcxvtSLWDQqFPBr/R8kPSxtno1GVie71SL2YT
 r82LB7eDQrL8uzJ+t3Uk9e9NZUbIftv1kyszNSq0i2Uw5u6F8+139o0cQXADpW4LD/KSRW9tnn3
 q94pk6QUjuUk0F0jCL1Lyy5+P9OmLuU2vbCOpEXm3q8rjJGS2c4e0lZJQRn6wS1ohPGfnnD1lwP
 b1cQf4EpBit0zHQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 09:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8001

Added by commit e135458415de ("fragments: add a
'root-login-with-empty-password' fragment") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/fragments.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index 520cf783a..42fba41e9 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -193,6 +193,15 @@ then speed up the builds by not having to build things if they are present in
 the cache. It assumes you can download something faster than you can build it
 which will depend on your network configuration.
 
+.. _ref-fragments-root-login-with-empty-password:
+
+``core/yocto/root-login-with-empty-password``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``core/yocto/root-login-with-empty-password`` :term:`configuration fragment`
+can be used to allow to login as the ``root`` user to login without a password
+on the serial console and over SSH.
+
 Yocto Project Autobuilder Fragments
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.51.0


