Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36ECCC44502
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:46:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93802.1782744384363681404
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kLO1r6T+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B4E3E1A0CF1
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8AE4B5FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 510B2106F1841;
	Mon, 29 Jun 2026 16:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+U+En4RVEbNw68Hk1vLHrhHHJCbnBOc/vlOx9GHTkVk=;
	b=kLO1r6T+1pP93X5xDzP9RkfTXGPcIOZmkFr5gUOB4Hkqo/axfDa/x1k83U1EmGYdAMpZ9M
	OVCpNszVVL94b3bry/Twv9AEuwjQDTQdCqIv6RWGKl+gZ/v1JIuBbKuXKi/AmvhDGGY++9
	D0cXyqXDSjCFTQGnoFg8OY7ImVI1tZazG2GPpe0aEhjkLn0Kf0+dSAZM1vGrSJAIEHZqES
	iwE20oAgDUz4UZgdlfYo/tddl+pT6Liqc1lVP2nomM1WFsAe+PHl0jZCXYvs6BbO8/LHgC
	ozKJVxsbmdrGZeaB7sb7W+oKmCcpqVco/a6dcKY1zpb/13x+lNN3w1+oWXOA7w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Jun 2026 16:46:14 +0200
Subject: [PATCH 5/7] migration-guides/migration-6.1.rst: add note on
 oe.utils.*_distro_features() removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-master-updates-1-v1-5-ad9b047f9ff0@bootlin.com>
References: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
In-Reply-To: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=O29K11wnyXX9724FuKdqdxPb3GwEQgVi3wRWkTXkLAI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQoU4aMuZ3jJ++DXuJiAIY+GIoE8+hKUqT8XZF
 uNui/212NuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakKFOAAKCRDRgEFAKaOo
 NmiID/93bnuE2rCWH8MJWhFV7F+nElL3STSjYN8Ap6KGfFpMdXX2U86bohCC6HFs5pu5Oat9Ju1
 VOJytUXUhkkshYuN/hdTYzFqC5QyW67Dw9QdvalU46hC0pCiX7L+H+RQQb0lXUJv6yBuT/IDGUI
 6x4Fm/vbIcqJ6tIGSOR8cEvkwNq3gm051joxzu4emLYAIcs9NHg2AGuiHuiYPHw2wD2nFr6dtBh
 0+NiG+pHoItDxDNpKbNn/0Anjsd/n/2513c9JgCMNrx+oiCZAFmMX8Rt0wGjEFYK9xwOaUqK445
 o1T8oKVtzqDvolfxXk6/1n5AxGvFnf3bJyd+mR92xr8n2gRYdsrFc7Hy+nXG2D1YtBMOF42bx1+
 8bApY/bwpaCOqnYGBMbKlVIzz1Pro1I3X/1lbnLqt+82Y/mtyJ3GgpQYWa8of0ZLAbHqCvvGBws
 u1wt2fvKonwXMrSf7INw5ExjvfrbR9E56gqDMb8UNE45zRN9kys1EJuJ2dhYEHYn4E5C2UaeDcS
 8Xodrq4Ys9bMXK5IU/6Y8eDSMH/xt9Z6K9/ywEIF0u0QiScyrBWJPgiHeX2rxSYJ4ywxkojF3Ft
 lTz5PeCrGnmydE5TlBj/NBGI/FR5ZZ4qePgfIc5H5xBBakG3yKMy4FICys8vDS+ZboUPXX+PYH0
 jsj/KHCSv3bebxg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9978

After commit d37813614b44 ("oe/utils: Drop any_distro_features") in
OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.1.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index a73c4e34a..d39c9072a 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -60,6 +60,21 @@ Or written more simply as::
 
 See (:oecore_rev:`b8da733ab12c64503a353d5ceb2eb63fed95d851`) for more details.
 
+Removal of ``oe.utils.all_distro_features()`` and ``oe.utils.any_distro_features()``
+------------------------------------------------------------------------------------
+
+The ``oe.utils.all_distro_features()`` and ``oe.utils.any_distro_features()``
+functions have been removed from :term:`OpenEmbedded-Core (OE-Core)`.
+
+Those can be replaced by ``bb.utils.contains()`` and ``bb.utils.contains_any()``
+calls::
+
+   oe.utils.all_distro_features("x y", ...) -> bb.utils.contains("DISTRO_FEATURES", "x y", ...)
+
+And::
+
+   oe.utils.any_distro_features("x y", ...) -> bb.utils.contains_any("DISTRO_FEATURES", "x y", ...)
+
 Removed recipes
 ---------------
 

-- 
2.54.0


