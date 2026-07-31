Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF66C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:19:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2853.1785489581204448327
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zKP48iiy;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A8E94E41046
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60E236039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D110E11C165EB;
	Fri, 31 Jul 2026 11:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785489575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y3lphF5WQRprPZR8UuSCjNVYOsBL+MMIPXDSWze3JhU=;
	b=zKP48iiyaGKjyuiMT7wfydAeNf7bLkuHZvKDc86HKEAeC3M56WU2yLXb3UV1vpJl8VCMgI
	VaaCJ+dCNiMJjre+qn3/lO1sXqWQgITjS1AuLrs05PsHa699O3Za8Bz2PuZIpPTiyTH8tU
	JoFVywIBRVJB/dthnBOMmQNIoFN8jGscG13Lgl/PJlHtaRlPoY9CK82SCpJUQxE4EJ8do2
	NWxeLj96ma04eLkn18ut431BPuDJ5LbLHKTCqZv9rcGycLHmZ+dYIy2rJPbJzrUOmF6aiR
	yBgoFVtHmeKw+CQ7dtHIaUapMB1WB0Sbn7mmgSUzGx0FlT3mkdE8QQ+L5GtSDw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 31 Jul 2026 11:19:24 +0200
Subject: [PATCH v2 1/5] sdk-manual/appendix-customizing-standard.rst: use
 code block for bitbake assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sdk-clarifications-v2-1-b34f797492b1@bootlin.com>
References: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
In-Reply-To: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tsA/aamya2qdjs78pwYMlZFo7UKJ73+ZilM/YjXv46k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqbGigBdUwGnpEGm1V2haP4eQRamWtqrkYWciDX
 08vfJ2GVUmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamxooAAKCRDRgEFAKaOo
 NrkhD/9KYx8qeq83YFkRJQU46T43o/u+mvRN7pW6E0dcv236KV7SnMhkVvIrsvjfLPydVDWc9Jc
 I0NiKNNenK/uJqSw7dbmtY6ngfvxttivLYESK8QDENR5Dj7HIr5QSRG1rACk6nuL0CsTL6I9DVq
 PHB3SwclHPp302L5/SYQkBRqPaPjN+sh13SnUMhqIaDJzV9jspalVMSZ1TnlE1WYMepuZ2STYA7
 68ws52KqzgvFWGx0abiqdx3Cqu2EjKr4nk2Abx925KgyxdjKDFMWkCZCouNVadSFYfiCl/oN0R0
 X6ULVlTMELR08MFhy/SJqIhnUob2hqvxvcJFMzBgvVS1QaQh2Ts1L2gzjfNMLkgM0AY/DMlOXKH
 kGfCp/G7yv5cN4OS9f08AUyRBEnY467aIN0/Zez3MtEjhPKiZWOTO6pkd2zMO1zfJTR94rOESXp
 YAV1rkGRxDM+q91Yz72O9SZ5bD4AHcbYiUp8BTJAyirXXQv0tJNbaf9HBZlPYz/GEOi9UUkuDJU
 nQ1G3VVZoz11a/QeyPtAnzrXnueErxAVVx6k/R32bPXLtD41qADnEaXcyqwJy8t0w2S314IDF5N
 6Ot18XVgGnVGDg+cIFvoDY06oOKH+rDPnZwf6rw/dtEESi7q4kQWRQ4ycJQW2AGLr04CEQx/pzH
 zp2H2N6ZI2q3Jvg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10207

Use a code block for the DISTRO_FEATURES assignment instead of how it
appears as regular text currently.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/appendix-customizing-standard.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing-standard.rst b/documentation/sdk-manual/appendix-customizing-standard.rst
index c619c15e4..90b73dc20 100644
--- a/documentation/sdk-manual/appendix-customizing-standard.rst
+++ b/documentation/sdk-manual/appendix-customizing-standard.rst
@@ -27,8 +27,9 @@ Adding API Documentation to the Standard SDK
 
 You can include API documentation as well as any other documentation
 provided by recipes with the standard SDK by adding "api-documentation"
-to the
-:term:`DISTRO_FEATURES`
-variable: DISTRO_FEATURES:append = " api-documentation" Setting this
-variable as shown here causes the OpenEmbedded build system to build the
-documentation and then include it in the standard SDK.
+to the :term:`DISTRO_FEATURES` variable::
+
+   DISTRO_FEATURES:append = " api-documentation"
+
+Setting this variable as shown here causes the OpenEmbedded build system to
+build the documentation and then include it in the standard SDK.

-- 
2.55.0


