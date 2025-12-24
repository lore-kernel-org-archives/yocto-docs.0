Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D42AE776DA
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123192.1766593920344891774
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yskUYDOh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BD20F1A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 958366073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88C9C10AB1376;
	Wed, 24 Dec 2025 17:31:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kZjamFuUo+c8/fIQjVlrN5ziCHXULm2JdPyKNfaNbow=;
	b=yskUYDOhYlrJizYcYLDSAo6AHrI0XRAdvjzaqS78Iyc6cfEGggVktElJLhW0X6tCOcb2eT
	q5b8308HzQVwZfxxKL7+qE6RQ0iQhGrQszA+9i3IqnujNee80sjNvkx+xFs2Cg4qb7dWar
	DC9FS7AX+UOJp1dmE7SW3WLDkChrdezAgrlAdhvN9zsaOAc5HutZat1BNVBgUTMRvQ6X6P
	m6qX8E/B6jnIaEEMwW/puOQqqvtyuWFZHtlD9qWAWGHTkbZyQldBZa2pDRNlIr+yZQSasz
	QRrfF0k4aqy0uIC2WP+s5BhKm/zJp/mF2+ZS+b5s82mxKslgADxLJVJnKSkmAQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:42 +0100
Subject: [PATCH 16/53] dev-manual/temporary-source-code.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-16-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0YY3dfY1jC83tdYBcBJtKiK8BumJMfizXZjvaJN1zeQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVpNmLRELEMVNJ365P+onVSfRlpek2JjHn4L
 491BJ8uDYeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaQAKCRDRgEFAKaOo
 Nv+QD/4xEmGGJNvycZnA90mw1baRBTCt9+0O5y3z81WA2pGyQcaqECUDHc4s+9V3EakOVbI9+8Y
 yI6Z0IxWYK/JKC8hbFleTncNCzbSuKPyvCO+YccpPClDo1KgYSUwXACR1welEHyN497d97Lofz0
 Lbqtlwc6wUhQMmsG+n2Qaf13kfTGhMCphwjA6v/8iO1JNMgEfinJG4bCtcoxiKYFX6qr4wCwg5p
 NinmnmfB3Bbt1rG6vqCneM/NDgLNrP0uelBz6aYqYS2IfK3X8kJT6uK6ccg180ZJlmqRWa1VAyF
 /u+LemDkdSKbc7MDht75fHNVz+XJ6a/88IZJQrB0rCEWyRJDXEDtogK+V3WLB2dtnmxUtt/CnKb
 k8QUvBlOO30pFu3X6EzGWJcDjb1nrSqIA5eow1pPkN3bD9eVlcf1D7E01/mAXopO9NqOXaOiR93
 e5bLCka6++DpwPodlvfgc6279UDzWlHmLW21YqCcgBjSIL7frTxy6jdPDrVaEclOmUfBP0ZIwrA
 AKNn3j69lANr2UUZC029jFplfjBja/OIl4Wr85vcqRwQYNjEa0/Dd4AccKX6eUwjFcntQ4Yvh3V
 gp9FGWMe04GmhxpJikLR1X9zGLEbMoOUtd+Mch9mrpE/uTi0YXbvA6G/+jg5k8Gmi+aMi2zYiLg
 d9KIlriDGKUVLVA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8345

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/temporary-source-code.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/temporary-source-code.rst b/documentation/dev-manual/temporary-source-code.rst
index 977edbc3f..aecd34099 100644
--- a/documentation/dev-manual/temporary-source-code.rst
+++ b/documentation/dev-manual/temporary-source-code.rst
@@ -15,8 +15,8 @@ your changes in the form of patches.
 During a build, the unpacked temporary source code used by recipes to
 build packages is available in the :term:`Build Directory` as defined by the
 :term:`S` variable. Below is the default value for the :term:`S` variable as
-defined in the ``meta/conf/bitbake.conf`` configuration file in the
-:term:`Source Directory`::
+defined in the ``meta/conf/bitbake.conf`` configuration file in
+:term:`OpenEmbedded-Core (OE-Core)`::
 
    S = "${UNPACKDIR}/${BP}"
 

-- 
2.51.0


