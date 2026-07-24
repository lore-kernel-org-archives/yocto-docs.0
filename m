Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996F2C53200
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19154.1784899517885235231
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=byWktWD2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 449991A11E5
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 199A960395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E01FA11C103CD;
	Fri, 24 Jul 2026 15:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oasjMiKaMFqGfTrRjkLGl8tKxjnP0dzDq8Ij+IcKmjc=;
	b=byWktWD2NqZr/OgKn2dZefcmhxlusnw12vY0bJ5Ltfq+go25+PPHBmSln8f1C45TYY1KKq
	02MX2bSOkun0RQg5cnFaNs0as3mWPJ4L08eL7UzpuqdABYbRvcVf7wTJ+YMvhX6kPoKho2
	sfKobPY868ziB7foNHlM3KJCT3B0AnwGoOWY62o/obJ45Nz9naNctOyzRhR09k97gJGujm
	kahNsYdGAvj1nhfnaBmXj71RxUIVJrFdrDcD8DJ51HEfRoLU6xVOoltGcyAwXb2Dnyws09
	vZU4pxSUppt/E4t3m9xcObPhm11w9BBnmcy+B6Kt9pu8APb1WBc4IT+RJwVk9g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:25:05 +0200
Subject: [PATCH 8/9] bitbake.rst: rename section to "BitBake User Manual"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rework-welcome-page-v1-8-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wE/IyA9wGWONHKNoDQ4SIrjqz2ub0zsvc6/DbzKBrYE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2eyTYuGfgy1RCeNMSg0QNKX+QIKc0mlSv2H6
 bQtXXROoMKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnsgAKCRDRgEFAKaOo
 NnObEADDbrPgotF+pwuU2LFZspiF2pHlJUzHI+j3etbFfwQydFYVX6wBX7wBY8nLp+R/3XteMQp
 4OC3cc4bA5G8GVW+B4Gpu5Yr9Dx0OP+kEvV5W3GZfr03OFUJMnWDOBPyatwvPAc5oxOPLxJ+qMy
 hZbRsKVgt+l+v3S+Lr6OBCFbv6psz+b0RvP5s2dEfuGl+C7ElD+3ntnX63Vs/U1aXGaQUkj8LiO
 30hFmaidO26Ed/6MSEodqWuWMlWdUz0q6MzgslQYITStkh2g33QCJ3bvC5sZfQUq4cW92AxdgTi
 D7ymv8OLJciz3JtdQHVg3UAZ9JvwAxBJKroByu2GvEwWqVmCUFo1+v2it6yJ6JSkTYdOGclBHnX
 3Xo8CBEeiq+5nrJ+dwS1z81hhQRaojEh6jTsn1hNJDYyP/pNvwKcMnYYKK5XWaEOuYnB0ZiVyYB
 NQ1fGUqv2PKbzB4pMMa9szhFkBShmxxBLSfYPMJtxdME65JMO0Bx9sFbEeIXed1+r4RgjHeWieU
 vkIpD2GojumA3vjIH2L/1vWNE2mY1A78SdPOhyxgIGCiQkMiGthBi36U3PbQnfsdlN8QKJeCbbl
 rJz/rtwYsjXEshIGISzZxeghnebSFaljb01iI27+BZxXtCZtf3W6qtwF5iFVRw7dZrenhxwP0u5
 kGg5LY8s1cc77Qg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10136

This is how the documentation manual is called in the external BitBake
documentation so call it that way. Moreover this aligns better with the
other subsections of the "Manuals" section.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/bitbake.rst | 6 +++---
 documentation/index.rst   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/bitbake.rst b/documentation/bitbake.rst
index 7702f9322..c9ce8a0fd 100644
--- a/documentation/bitbake.rst
+++ b/documentation/bitbake.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-=====================
-BitBake Documentation
-=====================
+===================
+BitBake User Manual
+===================
 
 |
 
diff --git a/documentation/index.rst b/documentation/index.rst
index a1a4b5048..c1b577fa2 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -70,7 +70,7 @@ infrastructure.
    Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
    Toaster Manual <toaster-manual/index>
    Test Environment Manual <test-manual/index>
-   bitbake
+   BitBake User Manual <bitbake>
 
 Security Reference
 ==================

-- 
2.55.0


