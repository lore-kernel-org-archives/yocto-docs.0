Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB854C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:20:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2772.1785489600159640741
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LzPhN9Em;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5A3B61A134B
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 301A36039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2166011C165EF;
	Fri, 31 Jul 2026 11:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785489593; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jEYPR4SjwCGZELpS5EFQH+oDehq/pdILuzfbTH82jqw=;
	b=LzPhN9EmV2MCpPN/J8bBXpXkMCdyumsVYP3HoB380m5w7n7735tS3I/piUuZWexmRusqCe
	OOv+IKvxTVPgymct70mrScSFCuOt5L07oDrUvdzaCrfKiF/OvM/2egf25VeLcMN4ovRRHY
	tJ7p4HTXz5iel1fdaBzSo2ILOUYHwYQlVQGTQKgn2ewx31fbkETpFTY8qttmVlQx5EhqE/
	RiACBSNon9sS2m0SaEF+r8UETuA2lDENK4g+3W/3yp8x3e0z6eA11JEC11WGTST9FtaIFQ
	J28rKdeJn52wltMbChkCrE0ELHkWsTU1pyHqETdH45avt/NisPZ8Fz/6xzQ9hA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 31 Jul 2026 11:19:28 +0200
Subject: [PATCH v2 5/5] sdk-manual/intro.rst: detail differences between
 standard and extensible sysroots
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sdk-clarifications-v2-5-b34f797492b1@bootlin.com>
References: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
In-Reply-To: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iwG4qSAeq4CxgC/K1ZCE+C1IZfmFdnZF+gDrXHrAWQ8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqbGihcR8kelf4Dv7JXkUj93SiCAy5GNH46piq7
 UE6FLMTqv2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamxooQAKCRDRgEFAKaOo
 NmlmD/4sHdBijkjo/36k+X83yxoLR3YFoMPVl4Um1xdgitYuXpN5SD+cJ+fPqRoRJv/uOfhTANH
 o07gilgqfcwCkCjVWZlNIKsFRxJS7obs7UPOnL7yBIWqDP0M0Dm8XaEwgrsnJ7atOuWJU92bEym
 ytuc6p0fKEZ1+5RHt5lAdL/fth6PmNtKH/J3XYFge9GJ2lhsdK+o9I+3/7StXIVJWIe/bHh+93A
 fi2Q6RANJ4kn84dg0LWKj/URWkAq43IBY7p5zqHyqwsn8Sbl9dKC+2nWduf1GtU7ygzLl3MMfj7
 /cKOPy/KWlM/3uOQLnZYh8g9rFnCjJpx1AU4FpBss5tVsqL3vovR5Rq0c8Ue1R600yf57Z5psBX
 mZDvkWdBKCF31jaNrqpWt3RYGOw9+FjNI0i6J/ckspCJQ9e1uAxG6CTdYiiLuJSpA9TANxqyPj/
 b9xpjYXlIIpyZWZRQDQUOOVlAzE582Nu4jJZzKePgxLhsB2qZFKk06vTDoO1UaAN+yMgRRdF/ke
 KROOK26yMtUzYIqr30LJDh/dsSvftjofc7IWd6gew7fb6haqUkh5XlkhxukNb/EVnsW6XEOv7rA
 ylKvrtmGQReio10o92h9NELk05KxmbWFsm36jxy/4it8FebO6ED9+Xc8EM4ubGNj8QWb3wDjMuc
 MK1++Lz4hnjuI6Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:20:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10211

The sysroot in the standard and the extensible SDKs are managed
differently. Detail this in the Sysroots section.

[YOCTO #14830]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index b78248d54..c8fa8d619 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -123,6 +123,25 @@ sysroot is based on the target root filesystem image that is built by
 the OpenEmbedded build system and uses the same metadata configuration
 used to build the cross-toolchain.
 
+However, the extensible and standard SDKs :term:`sysroots <Sysroot>` differ in content:
+
+-  The standard SDK :term:`sysroot` only contains libraries and headers for the packages
+   --- and their dependencies --- found in the :term:`TOOLCHAIN_TARGET_TASK`
+   and :term:`TOOLCHAIN_HOST_TASK` definitions, for the target and host
+   :term:`sysroots <sysroot>` respectively.
+
+   See :doc:`/sdk-manual/appendix-obtain` to learn how to build it and
+   :doc:`/sdk-manual/appendix-customizing-standard` to learn how to customize
+   it.
+
+-  The extensible SDK :term:`sysroot` is completely managed by the :doc:`devtool
+   </ref-manual/devtool-reference>` command-line tool, and its content is the
+   same as the :term:`sysroot` of the image recipe for which the SDK was built.
+
+   See :doc:`/sdk-manual/appendix-obtain` to learn how to build it and
+   :doc:`/sdk-manual/appendix-customizing` to learn how to customize
+   it.
+
 The QEMU Emulator
 -----------------
 

-- 
2.55.0


