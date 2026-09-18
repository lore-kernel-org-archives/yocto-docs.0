Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FDEC982E0
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11650.1789739654543404212
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VNm3uPQR;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CCD181A0969
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B98B60649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A2C610329019;
	Fri, 18 Sep 2026 15:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NJY4zu5ypS0zIqqJga5RsR2JByzFFfpUgMvnCqFKrY0=;
	b=VNm3uPQR64m4fMo4r0dIBMe7FQbYF0lpJYWnoRRowPD+3gmaXKXR5PzZhbbyx+g0yvfNWQ
	C4v0NOXOYGPQAg1PNY6FpqLoInSNhvChAS/4L12eR94nzeY4gA07yblEKtDNokCpf0HOoS
	++A6qHc+rSgDNCnO8SCmUOOj3zVRCq89Zuj7IC9IXzptsy1+VoVwZ0EY1ADA3p9bkOhi2q
	q7Z4xATrxZyFbnrow4H1HKR9s6BUtokON1hKg8P9hZ8Q1aMKQ1sBsMr4a+DHGDLEpSrDzN
	GQ7RjlGvqNfdNri1buQ1p7+iZbm10gciBHKMRft4N3A4C9jD7Y6+WV+gi7I4Sw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:36 +0200
Subject: [PATCH 06/20] migration-guides/migration-6.1.rst: add tip to use
 convert-spdx-licenses.py
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-6-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=m9aRgItueSOEtTEo0Ov1IM+3jKxv/nvHBclW4NfhLSE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJjxgafTS22rSR6nU7pYW9zGWKordw7jtnVL
 c+NY7vmi/qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CYwAKCRDRgEFAKaOo
 NvZ4D/0SaWfOhuuKYGubkjW7bto90z0/I1RhEcPyADY+eiPFMC5I5f5NUObHpRoUJ3KPII8PoQ7
 0BqiCov0oDJngA9H5WVOt91u0PBmvRPuXQVrwLz+X85ZsQjhaK7SQZHzDe0YM1WQVI26L5ueds/
 W5a/gdZ0YItB81qalaGGTMfJowAPlpm1kB7p6wFYQ9FuDfKjqtdjwyFJ02WgTV0ZZX0wX+6FCPZ
 UBOFhnjdkyg3dgd4YEtF+PLxxRtBdawOjfOiat60+1sDk5xysuYy84aOGbC3pLLgWEtVkG2kqIg
 v1OGZ9rlFfwSl9zZ2BTwN2jovKDRRRWCvCQ5799gxJmiyoal54lGEO/H9yTUSM6U/boV+hcm3tN
 4udCFX3pDjo3rprm67uAWq5G78qKnkUJvf9k5XBPfiJegpYOWAODPwcrjmkRS8EEWYWaDjk/kEa
 W/N78QLamgFNJ2Up2EzL3b+ckTDSJIZYnjQYRUeNg6clqtAXe0UhpsXPmlm11d5f/Lbqf8yD6kN
 CVyVqL4hI7o9a/+aO8bMAckayn6KF5eRvYN40TsLaXQom+pF44uaD6ucmOeGe6culQ6z9jbdATX
 pxbh+u6el3MVD9mMO9fxSHqZDTP2k6R9pESUxHAlIbcXsFA1lH44alWkdzoXgIiCMQXDXPfmhkv
 uBBGOlPSfedoAfg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10538

The script might be useful to convert LICENSE expressions to the new
format. Mention it in the migration guide.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.1.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index 6a7cda0a3..6a98ee86d 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -140,6 +140,11 @@ automatically converted to a :term:`SPDX License Expression`, but a warning is
 issued when this occurs. This support will eventually be removed and the only
 valid values for these variables will be :term:`SPDX License Expression`.
 
+.. tip::
+
+   The :oecore_path:`scripts/contrib/convert-spdx-licenses.py` script can help
+   converting :term:`LICENSE` expressions in :term:`layers <Layer>`.
+
 Removed recipes
 ---------------
 

-- 
2.55.0


