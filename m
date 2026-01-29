Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08001D6103B
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17104.1769700265498762452
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mOlVlOg+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0517E1A2B0C;
	Thu, 29 Jan 2026 15:24:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF397606FD;
	Thu, 29 Jan 2026 15:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2020119A886F;
	Thu, 29 Jan 2026 16:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rLCEHWNGr6eddx+hl7LlMQHNsXNfQRqquwCD6NQ9d7Q=;
	b=mOlVlOg+CjE1AETZX3kc5ft9DSKs8vuJB1D4TPsD+BlJRyVuYARQElCvPA6IG5HwAdTjQD
	kA2Vfr9vkwc+GQmYZOJkDOn2NsuBTbOx0pgWqM+BMYJm1BcdQvIMKBNrWs90ucibClMZgT
	pXon/Csrvc+XThqR4hWtXNCBWhLxdMbxNv6jSViK+WAnLH86vqv7iKVyBapSnyIc247nsp
	90ow1CO/QJrLeBNP00/+8o0Nq5h3/suJ6h+iAtOK0c3k1wxbetocukA2PI1bkrOIyOBj18
	4hUYuPDdQ4JvcGQtadRRzpLZ8rdGXMVfG7Mw3Dkyfu+cCZKCqZZwDmK67HNOjA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:20 +0100
Subject: [PATCH v3 29/57] sdk-manual/appendix-obtain.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-29-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=925;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MafI2AcNdD8TuqwMIDJi8Kd+jdqZA7tLcYjnsEdHX7M=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uNDMuShh+H4E9ih1uR52WydxMwdOwrWRY5E
 fhTZWDiK0qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jQAKCRDRgEFAKaOo
 Np0+EACZIvTy72vqrEKNXSw++Jbldxlm5QXeNh/Er6cmHGwtSpJvgRy3ubVfHX+ympvnNOGS2Er
 jbo5V1nbAMOPTx8efDK3ZIykYMuRp6HKMBenNyp8ODT2JJhaP/FLvsMIFpnfGXDbVljn7RBtgdR
 KFpVIx4sOWi+EWOt/+0UZ+nJVIzwUOOX8n6O+WjBKYwNvMhSCuYbyPGXb7sAx+yA0c74tx7sDh3
 U7gURi04Ls8bxJOIbZSvWnPA+shKNxBjkR0H8ogVA1wJXYySW4RFbidhhi9KEWceIV3e2WfFXWz
 VrGBOG08igWqXeaaPvnAL1+nF8BUuG562Xbk+S92O/yXmY/KywAVf3/YNG1uIueU4JW01CUaEEg
 PjPoC4igUJXgp0OXjAq7wg59hmyqGR+BQZy+RQJlrXHzYorerdoF/9F3WI/9K4epHe1CjnJ3p4E
 efAPgXyDtRK6d6Gss1M0JchxIIi5z7lyWBOFOb8d94+I4uyWOvdgVqwW2k4orTOSYf4PGhbWYax
 j5xx0PKNpBpccBDlrVONDsunqTItiVsQD9rSPgoTt1rTh8Xy4DVsHyADAcdvLymfo9rW6oGPDM5
 j6T1oP5mt3fo5oe7dyBcXzbZYLIWJejVAatvY6AE/NjLDEIbxnkRcEyH/XpUGVeHf3V3xTn2Bwz
 4Qo2RYgmTV0yD3A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8815

Rename the source directory to project, as specified in its new
definition in terms.rst.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/appendix-obtain.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index fb2326fac..a6f2da052 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -166,7 +166,7 @@ build the SDK installer. Follow these steps:
 
    .. code-block:: console
 
-      $ cd poky/build/tmp/deploy/sdk
+      $ cd bitbake-builds/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the

-- 
2.52.0


