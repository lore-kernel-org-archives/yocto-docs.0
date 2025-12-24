Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7134E776C0
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:24:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123571.1766593486082073174
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Fk7gfncD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 90A521A23E5
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68C676073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF77410AB1361;
	Wed, 24 Dec 2025 17:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593484; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mycUxQGR4nIueQ8liozywLuvHmCSjFFAXHZQZ3aELDo=;
	b=Fk7gfncDR9OlV1Wxu47K3GIV+1f2XhJ3D936S7NBYhYPSd69olAcRx46h1arVvDU7wn56S
	0A1YM2NkFIKUPtNkx8gleJvZcBMdfxzwtLCf5LJLq7888cuyrgtrgau26miZp+0yOSwScd
	E4MMNVg6ypGt/pDGhvCaeT4xpMDsnM9zpu4YelAMli4TJKu8Uk9yeLfTi+FK/g25vbFL1F
	dwxQYFMObOfizRK5nxZQlf67Ln5u2yzQEHlDycXCPQ0TPEVYLw1h3J3SdfPh7ozF9UsGQs
	2lWmZoQ03zLwdHDmK2eMIDtH9E6tWRo+/nv8STY62XYp8LvtBgv4WDK3pyDYRQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:24:19 +0100
Subject: [PATCH 4/5] dev-manual/poky-manual-setup.rst: mention the Source
 Directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-terms-refresh-v1-4-691329fd038f@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
In-Reply-To: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/NHLOlHpjd2FVObLdUgfTk2G4D/nw19z+cO6zo7jM6g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBPIOy2ZmwYgLLOceD7luUt0IXduOe1ks0j28
 p/b1ewuTGiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwTyAAKCRDRgEFAKaOo
 Nk5DD/wKXkoBUOowh+5pjgEFovBSHyXcO1TJeSVh4PT29I+26LZ5Yx1mGDDB+G1y3ESU3FpFT52
 OXr/cC1BIgvmB+LWxEMC45GhXBaHOx365h4kSY8Mc0dCVCwCr4XWDH3o7W/0qGSxPXkTwQ58ILR
 sPEYAappOR2jg0h84nkw7VZZ+GMnk9VcEtejHBf2YWgWEMSl5ff0iYWg2FlEn7jjcM3Tc2Mt5og
 YFvGv/2PBFGueead/RCguwLbXwoEnnGUHD445VW8AWIjX6blOfUF5VXnJZXyU9h0wVCQhAzOSds
 +QDdQBDnr2bLQkEKugfldpe4LmCMl6THJxP/kTrM5Lyn9qJruZj1h5jM6wgjs8qyd/cEPvxwAAD
 EgbzDrNmaDk3Z4qoOrCycZ682RszAiC4E831jYFI1Lqx39fWHUjhAr+1X3tpiQc8TFDuet6iYi+
 7TgU/RJM6nrCJGPcyqohAzN2J5Di2d0WufO+zrKwGVJmujDYJ2K/jKOqR2/xzdmehrf+WfajbBL
 erSg2nGNNoH80CnGoyUyIG9OMfeNXWyi0Fixs3Q9CDP8mMmfHRKjFt1dJQUIq9JxK7J3RDC+LGW
 tljCi0rbUoX8j7KvgXJscRcPaCgs05S4hPLRSMl04AirU1j4wfABpnBP52fU03t1CnG893DwwSD
 rfS435/zWB5ebzA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8327

After switching to the new definition of "Source Directory", i.e. the
base directory for your project (which used to be poky), mention it in
this document on manually setting up the layers for a project. As stated
in terms.rst, use "project" for the directory name.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/poky-manual-setup.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index bcda9d7e7..7ee084007 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -22,7 +22,15 @@ release or a Long Term Support release.
 
 Once you complete the setup instructions for your machine (see the
 :doc:`/ref-manual/system-requirements` section of the Yocto Project Reference
-Manual), you need to get a copy of the different :term:`layers <Layer>` needed
+Manual), create a :term:`Source Directory`: the base directory for your project.
+We will name it ``project`` in the following sections:
+
+.. code-block:: console
+
+   $ mkdir project
+   $ cd project
+
+You need to get a copy of the different :term:`layers <Layer>` needed
 to setup the :term:`Poky` reference distribution on your build host. Use the
 following commands:
 

-- 
2.51.0


