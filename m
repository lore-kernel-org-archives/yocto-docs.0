Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DFDCA6CA9
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6059.1769501986192419592
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UhyBenvr;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E698C211CD
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95FC2606F5;
	Tue, 27 Jan 2026 08:19:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FC42119A869D;
	Tue, 27 Jan 2026 09:19:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501984; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NCqCo/b1MZa4OC5vrY9VUA8rSKR0GZNy/OoKZ7ZGSD4=;
	b=UhyBenvrZ1UAvzN4dRs/HR6F+D4bWNTutva1YOv8A0cVYU/Kbp43WNy5BSWkGGOmNMxybm
	qxLU0cAX5F1SQbvvfD8AEiYKNsRjUdhTfs/kcgvnv2CC9uPxK0eQGzUJVvsyuXIrSXWQtt
	dM5S7spAn/K5M0FUGjiTbj4x8msgNsf6BlOUCYE8rj6U72cfANbrQ3/qXlOtVLmn3kWx2v
	RSvd2l1N/aB0f0EVZPIKLGqZGje+r1TlMDCf2wOcjKpllPiB+uEuO/HUNigHqUP15fRVIt
	RZMgGMpxBhulqTF8ny8FTBVxd6/FPw10SjywrGLcEaNzaPSogtSFE/6+uyagVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:28 +0100
Subject: [PATCH v2 33/56] README: replace obsolete substitution variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-33-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SSk4gs0Wl+3OcvDgNod04W5CxW+0WvJBuqTPOPWE7TM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUDmzcr/D+YaibhmG4B/TWNONZiz+HprDH6M
 v/uKKAbskaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AwAKCRDRgEFAKaOo
 NlV8D/9McnwvUATzkaRwt7CmgpUdVlCv/e8hFLiYZl+JTL60W8IUvsZmrPufAH+FSMSUpNBldFZ
 VTuTwzto8jMZFKJMmGZMri8e7k/sNdO215uJ41YYCFkDG2wtJjAnxJCpoiXuLZyaVBwT2B0K3W6
 T/HvbCVh/xoU/0P2/aypEAqar24QrCY6Qud3Zss7rCewUdhWGRnwraCUwiJTYGt+1WhaTu8G1BL
 S+tRmLtcH87UKVE8Sj0mXhTkZJZEeb5aVb+k+XSHctKeRkSSWwCsWGVPIyS7+OHnqE2vKPDE1+Z
 LpuaAewoVB16d+smIDqb9DOofxuk4NnICOTDUp2Jk8sYg+RD8+e1LzrDXj/h04cy+GT2vdmzl9Q
 c62bIFHnNBqpwglgiXJIh+hSdQCXh53XBsh00HfDfQ6KuHEqAnhvk4OKAwx9ass4+4pgG7FITCn
 fFtzzw1TnDv9Fg0DXAM/N/UO5idLGhIhqwODq+iEmfd8nmQdEM9yvqOsDL6ztbbFoJBJu2PeMwp
 m2i+gBznHVLBtNNlThCf+xOdMKeDRm6EE0Mid4T/nD3e8asDjcrn/RE2PeFPlog3pUWoKqP8wK9
 7cXVfpPL8G9PTVml74WPDgG47tBsbrS6foYod6F16zfMuPQAnPXE0//VEeXSRljbcHY4QviaSfQ
 iURiZ3v7P+/lV6Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8694

Replace obsolete substitution variables by current ones from
poky.yaml.in.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/README | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/README b/documentation/README
index 5516d71a6..7c4472c73 100644
--- a/documentation/README
+++ b/documentation/README
@@ -244,12 +244,12 @@ content:
   .. code-block::
       $ mkdir bitbake-builds-&DISTRO;
       or
-      $ git clone &YOCTO_GIT_URL;/git/yocto-docs -b &DISTRO_NAME_NO_CAP;
+      $ git clone https://git.yoctoproject.org/yocto-docs -b &DISTRO_NAME_NO_CAP;
 
 Variables can be nested, like it was the case for DocBook:
 
-  YOCTO_HOME_URL : "https://www.yoctoproject.org"
-  YOCTO_DOCS_URL : "&YOCTO_HOME_URL;/docs"
+  DISTRO : "5.2"
+  DISTRO_REL_TAG : "yocto-$DISTRO;"
 
 Note directive
 ==============

-- 
2.52.0


