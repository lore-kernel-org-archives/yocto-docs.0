Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1F3CE9D4D
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:22:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92205.1767712947301401833
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Gd+pA31X;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D5918C1E4B2
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:21:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E31E660739
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:22:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4155F103C86DA;
	Tue,  6 Jan 2026 16:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767712944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RnmevPYdaHJh5HDig9AEfeVdFI3lfzkA0c7kFm8vO50=;
	b=Gd+pA31X2USTtYF/hWq6ogz2mh0WW838ZTQIp/NrgrxXbIuE/4BfW8UFzWG5Ex7GLGJUA8
	nboU49HoDYH8R9tH9nCL9cs1Q5PfSJMKdBlxkTeyh6sLPsuCZVzKLgPU4dtflZwT5+AaV3
	ecwTOGDCG1/61wHxfOK9UPP/84U4HbxJ+jK3uECnCU3S2jHs5j9lcnbKBvEVii1ZCyf0pY
	hlF2O3VOavICPq+09+QuKoUhPxlXoccOwGTL1Q1ykUSex217dj6xnZcDzH2AqU/rWrEhXX
	GHP3ZLro6wsy3aV6eyMkk29FSqTnKSHba0AkOVtR1iXXWtNVsfbbPYK3Af2Qtw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 06 Jan 2026 16:22:06 +0100
Subject: [PATCH] ref-manual/variables.rst: document the CCACHE_TOP_DIR
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-ccache-top-dir-v1-1-a4e491160301@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJ0oXWkC/yXMQQ5AQAxA0atI15rMNEG4ilhQRS2QGUQic3eD5
 Vv8f4MXp+KhSm5wcqrXdYmwaQI8tcsoqH00kKHcWJMjc8uT4L5u2KvDkoxQkdFQkoUYbU4Gvb5
 h3fz2RzcL7+8FQngA59pRxnIAAAA=
X-Change-ID: 20260106-ccache-top-dir-920e2752f921
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=n/BHTveESUcoR5Gtj6FXtQcgmt8vG+st2cXJHevvi3I=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpXSivXZPFp8FmwO8bPXMAM4VqFpx6M2949D5Kq
 0+ewTXccpGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaV0orwAKCRDRgEFAKaOo
 NuWID/0UJZB7r8IwMOmoCLyVuFnAGb/mEHQIWCa1rOpCJhHRZytNn/A9EhbvX4hEIQS5Nov9jKo
 K55hb4A1NkU+j0nGSXBtGA+Bi0/2LfgKOVMd53I64E/MolmYyoukX32W1P2+RNWvdg9gMcGoOSb
 bgY7O9quiGgD7Q45nc6p8pIQhlcZnbYc9ecs9cjbc0Lb7tH3ayMmmf1f3WYZytVA0hiqPCwztT1
 WtRQz5CmbcGbiv5E7qDHMEg2gGDbTx6n7X0g//uZdoT6cxryG7zpaPEd3iJsCJ7CmIy6F1gEgMH
 m1MyVxNjJLC/8hk4nLGKFLmm5CmWr1yec3IBz3XLfk5fdfs29YqMMXT8sTIVIK2g02by6Q4EBs/
 FDPQPUccQK6Se9KFTEvchFU2J3tX2NiIkFdBNJ3LFY11fDgHKy/AqfB7fXXq/AzOSES2rV1DbMP
 6hHN+0NlihPvw0UtulS72tIa9fY82gWA7xzY0zVxx87BJA5egNeYofYpIwhjfWmiC0mu1SM1SRY
 OA5JiKpxhRfQ3+h0qbh1SiKeYDQUFw07NPzhbniONST1SoE3GS/eBtR66GC/p+Wy0TvIlPYm23M
 0NWl0bxLBvwZJkzqmmgbsV47Bft5g47XmwK5HEESfZ7c3sTsRJaWVDqYvMfB2YqZW9gGDTh7mKW
 XpeJQKaPrNcVH9A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:22:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8395

Added by commit 35d7fe73bba1 ("ccache.bbclass: Make it can be shared
between different builds") in OE-Core.

Fixes [YOCTO #16052]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ee776c110..3e4b98721 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1531,6 +1531,12 @@ system and gives an overview of their function and contents.
       :term:`CCACHE_DISABLE` variable can be set to "1" in a recipe to disable
       `Ccache` support. This is useful when the recipe is known to not support it.
 
+   :term:`CCACHE_TOP_DIR`
+      When inheriting the :ref:`ref-classes-ccache` class, the
+      :term:`CCACHE_TOP_DIR` variable can be set to the location of where
+      `Ccache` stores its cache files. This directory can be shared between
+      builds.
+
    :term:`CCLD`
       The minimal command and arguments used to run the linker when the C
       compiler is being used as the linker.

---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20260106-ccache-top-dir-920e2752f921


