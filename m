Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6114BF4487F
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157877.1775832229384677619
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rAvCgn9T;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7FB7CC5C1AC
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C17D26046F
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3305B10450023;
	Fri, 10 Apr 2026 16:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gxbiO+ph9VzFKQUOgeC+dJmrkAmdsypCeAjLaHvL0hQ=;
	b=rAvCgn9Th5h2WVuhXXo7eoH65Ri8595tNq8HqZFnaw3qN8R4m4wzUDIQG7LaT6oWUdZNGo
	wIXe7WnueIEiwh+KL/uM8QPYG/XwcrL6Kg5+MFatJCpi2c3dVk2b2BGJ6JCOEgUSnAjyzd
	qt6+L85aVxacKTpdNrw7muI4y/47BRd8ZxFYoxWS5DbyKUIkd+BDjmmI2FK2C9P9/J9D5G
	eOiqinWLbP7i7Jlw0sy3fkWQBlIpotY3ml2e+bbnTIFtpMOPbyvYlem1+051c6ZYrpOr/+
	MDf+35G8cnvYCviQYwHJ7YxTrjY6vmq3o5spIU4Hz9tI4SSGBeSLhE6sxd8Mmw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:31 +0200
Subject: [PATCH 07/18] dev-manual/sbom.rst: add bullet point on recipe SBOM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-7-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kJkxD1s5X9IcHES2ahrV1wLOZ41dadd9PrcVvgREmhQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyXVvPeowlPQ8CQ2/WpALcTwtBaCMzb8J5lA
 NkrFi9E0p2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlwAKCRDRgEFAKaOo
 NvpvD/9fQAu1LvADtwN5Q5K0r4c5/AHye50H0BF5OwM5s59UymlPYpXbyDk4ysrlYqQ7ynUY8aL
 A8W3BJ+Ars7GTHhobg0NP1LGpN8ytXMWkjy9XRYi73hKjh35YDNMdWA3UwVPHDGVvy81K+ZtjVD
 9Eokzm79720f6za7iYLFindkG4BihWxCok3+Hcb4tAyVgaRdQ4RxESuiGc++87joiUlOtVtBYLv
 JSJk9qw/K8MfUYdoEjxTqwxQkaS1hjnJ7GN/ZmI/BJBmb+XbPnWByLi1y9TGw4Tvy6dFW10ikcd
 9D03B0tpmydsrUg0jZUPawBXjAIO7qYIxz1qRR3M1g2TVj2V63m86jKX9ZX/fmThjW1L7X7RRyc
 SdIEGps2uBb4OM1gPuo8V3LPG+GDfZNFrvVD6SuHjGMqVn/Rb3MOUZC43G2GOpFx+FEJQNHDvJz
 roRlxVOieyR5CjeMP7sgyAwOQpb0wkJA+QorxKjBW3ahJiXmQRi0TEKIA4ARdqDCEs9X1qKMAGQ
 jQEf0vrewwWXuMdDy9fIAa5b1Kqe+ERTQ0EsZqUCbyBCRaOu6i8WVwY/pO+C/rTfbiZ1lxUaawF
 RF7YF/Vr7gtKYD3wg1fH1cIvEiWcEdfDS2TgFJZsbsoSB3dhN6wK7JymKvqIgxaXIRvdExVgyOV
 ZucE9fZ+w2i9TrQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9235

Added by commit d999ac407c86 ("spdx3: Add recipe SPDX data") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/sbom.rst | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index 819340a74..45b63ed8e 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -31,9 +31,20 @@ If needed, it can be disabled from a :term:`configuration file`::
 
    INHERIT_DISTRO:remove = "create-spdx"
 
-Upon building an image, you will then get the :term:`SPDX` output in JSON format
-as an ``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside
-the :term:`Build Directory`.
+There are two ways to generate SBOM metadata:
+
+-  By building an image, you will then get the :term:`SPDX` output in JSON format
+   as an ``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside
+   the :term:`Build Directory`.
+
+-  By generating the SBOM document using the recipe metadata only:
+
+   .. code-block:: console
+
+      $ bitbake <recipe> -c create_recipe_sbom
+
+   Note that recipe SBOM is also included in the image SBOM document (for the
+   recipes involved in the build of the image only).
 
 The :ref:`ref-classes-create-spdx` class offers options to include
 more information in the output :term:`SPDX` data:

-- 
2.53.0


