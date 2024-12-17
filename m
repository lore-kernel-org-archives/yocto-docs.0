Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E525AE77189
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.77665.1734427635290036860
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eRd6CuXR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB9BD1C000C;
	Tue, 17 Dec 2024 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vf9Hr1GuiuCvp/uJ/aB1s7xeuPnqXkAROOkiakEtKOU=;
	b=eRd6CuXRoV1v6kbtcG0LNZ9wlm99ngqG2SxHIg+uCMsLFRPF0rb+o3J3Tj+bkQFdJpwm/U
	7RYor7aTjprm03GaHSRCVYR9uECHwGlzITjVHc5NEKNI9wltEGu74VveYAS9wUXidqcA/t
	ga87XYXJwm+vdfSYIN0pS0gJkXLOl6wdai0MUTHpx4wUjz9yQNhHSqrAjte0sUVGOyJBNl
	RgUynbproLLQqy7V1P+3+Spddqtwy28mDS4DYoHhukD3myUY8Ly4+O4euUzSA4efv8cq6i
	gqHkfogevDKp/szmZaDIh4fab901vBXMHjUbb99PwtXtrokV/4EMtCpyTnrreA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:01 +0100
Subject: [yocto-docs PATCH 02/14] ref-manual/classes: drop the
 migrate_localcount class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-2-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=eaw/N+1Wvqf/0mP6KcPd0wuliiGn6eSSg6potcppzt0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPvgtJwt3Jrh6rBloslEo1lbHWqdOTbXJ85e
 VnZvEnHEjKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD7wAKCRDRgEFAKaOo
 Nt1vD/9/pfPohjK3B3/0BSFSpBhUyl9pktqeNTPjlbcLdien/xaPHpOqiP0JhQcTZXF2XpDNo+Z
 puOaYPKMCEO1JBdTnbAKFGnag7lT/+pAZNje7phWyKOCoRfK9eU76Oub8Tn+FhWzjmzhziRb/sz
 Ykg9xSkBx1YeJXIr0VWG7ibr6tWFbgmpEMZpttDFdoajpJc0IEfNbDtMu08xMaBNYeLSzd8W7ED
 tgL7EdvzrOm/u5z5btBTiB5/Prb/+KgXc7EshPejFrxo7fYpBq0q6l9hqx69Kim1+66Jaj0mT2n
 XaQtYACrU/tcB5ZOAjNUXPtLw8glwPxFD+hD3+NBI82z9Z6O+vc4/9TvS4W5sdhTMPeoCMx2Nw0
 +IT2hIgX5EFUPxPiYP/b7VlwMmiwK6bRjyCKQz44RV3OpWBcPDABdkEZD4r4xA/PbTlUz6dVRNW
 ob97XciF6W493fqzvc6seo1RoXw8g8vFDPgJwZyzx7niTJEslfmbKQK02CAMN+tTgfltSfu00sO
 rRHLDDPjRC0AXfuN0FhKBHslwOZea6vrNp8Ah/HhpMeQUC992TYQ6OvVsDY4qQR5u7/0jyJudsM
 9zzZ4YrKCJ7+CkKaYp5yuqp0dhlGSgHdJbxXKP0fE5YCriKaOxVRAdW+dVO6fxFkmqv6B4tfpWg
 OvxVh3xRsKcHa6Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5934

This class is obsolete and was removed from openembedded-core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index e5fe44052d4b05bf1b2b3acfaf2fd368f66fb261..3d61d8d7a00b21fcff82a771f9718013fae36694 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1877,14 +1877,6 @@ each layer before starting every build. The :ref:`ref-classes-metadata_scm`
 class is enabled by default because it is inherited by the
 :ref:`ref-classes-base` class.
 
-.. _ref-classes-migrate_localcount:
-
-``migrate_localcount``
-======================
-
-The :ref:`ref-classes-migrate_localcount` class verifies a recipe's localcount data and
-increments it appropriately.
-
 .. _ref-classes-mime:
 
 ``mime``

-- 
2.47.1


