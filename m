Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E647BD2F024
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:06:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10276.1769519218599443405
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 05:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wRGXKxUn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1B4691A2A86
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:06:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5FF5606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:06:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6195F119A864D;
	Tue, 27 Jan 2026 14:06:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769519216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=shPBMgJBw0S68TuZ2yGQTiNp0MN+sAx+H+DKx8AJmyQ=;
	b=wRGXKxUnNxMrBSsAfyjNNTX7Czo6MAn8yOsMtoy2yv86QwMcQLHT6N1uYa6VIF/FBoM03Q
	9UDz+N8KOeXb5QL/jYj5JZ8GvIJucCP7jwvmIReB4c3Dp0+fdd1ZQ2uFOIiTAe50jgxDWm
	n30kTQ09iLrUiyqKnN9550dwsqM2fX/BfQKAgZ8qDpDWCdQl88qY4N9CxXm3VacVsdrbdF
	Ynb4luxKwM7JOCuXT0ZNIzhU1Ep+mfG/VCayjwBwtv2w/a4q9EfS/2COuP/RSeUaXYnco6
	x5nmGhwksA/4lXsj7ZPtsVrJ0QKClk1zR0LDzCjPyPS6pwR+i956G/SHxqWQ0Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 14:06:45 +0100
Subject: [PATCH v2 2/3] dev-manual/packages.rst: rename r0.0 to r0 when PR
 server is not enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-pr-server-increment-details-v2-2-b46f91df002b@bootlin.com>
References: <20260127-pr-server-increment-details-v2-0-b46f91df002b@bootlin.com>
In-Reply-To: <20260127-pr-server-increment-details-v2-0-b46f91df002b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fNRLqgUKEsOhuA6eYNBRRC6g0CxY0qgztDov+MEPb0g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeLhtQeYjWZp4DqR8jb4BFR84kNS1ZR0hHtOs+
 cEeRXCQ/puJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXi4bQAKCRDRgEFAKaOo
 Nj7AD/4yL3XER6LzBYyOH9iGYiY4msDxPlp+SRxvcRd4p3TH4sQGgnVvtFi4wq4xQOIc4uVjaxS
 sQcre1ZFeZKytKgeGMHBdGRZ9MX3cQcdkfoPmrgjBt77u5+yrm1tM7TSLEew1E/WU2oqlvE4lMj
 H3I9M4ItDzt8ffv267wUFXHRTrF2l1NwZQRxAayr57ksS0nnDgq1w+IEnOBaUEGoEizJHNbsGIF
 99qmtQZrv3HTM48se7LjZKbSFCoAaz5E5wo6Jd8ok6Lmyvjd7zaGxHA6XaKuKBH6K0ZIoIBe/ay
 j6lFfwLZZS/w8fNNBFaxj4e5CRskOeuR2OQ15zQlnizvLtwXjLrufh9ikmKuHdihNxNw080egbw
 9w2t9TZuUz5yj+9+goO2HJNYlCoP/um24LCJNBDB8s1Cpf7z+wsxI85fkaCQfP2HQ94gOmvOCsg
 ejHwp80WhseNic5q3f671MTKursClpR9no0sF7fPFpu+DLZKSsGa90pexUMMz0mdzB+MSWhHDCe
 aRz1aoO8Pq+SCjFfzh/DqJIZP3ylD8TVjS+aP0Pu68SwCQbu1C1oWTJKHp3aYrlyjCY8v5lbHp+
 RMf2iftivhepKFTxdf8qfFXpwDa6nWuHeEHUg7ODHJlg+XsBgXh8UAoaDykjmZBAY+K7azoc6dE
 vVhy+RYSKtdv4GQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:06:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8734

When we don't have a PR server enabled, we don't have leading ".0" to
the PKGR variable, as this is added by the PR server.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/packages.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 86a569b67..383c93131 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -300,8 +300,8 @@ with a number. The number used depends on the state of the PR Service:
 
    .. code-block:: none
 
-      hello-world-git_0.0+git0+b6558dd387-r0.0_armv7a-neon.ipk
-      hello-world-git_0.0+git0+dd2f5c3565-r0.0_armv7a-neon.ipk
+      hello-world-git_0.0+git0+b6558dd387-r0_armv7a-neon.ipk
+      hello-world-git_0.0+git0+dd2f5c3565-r0_armv7a-neon.ipk
 
 In summary, the OpenEmbedded build system does not track the history of
 binary package versions for this purpose. ``AUTOINC``, in this case, is

-- 
2.52.0


