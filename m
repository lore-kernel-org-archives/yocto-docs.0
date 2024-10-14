Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26FAD16265
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:45:06 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.55444.1728913501338043232
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 06:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z1bp6oss;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89C5240012;
	Mon, 14 Oct 2024 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728913499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iOMCKQtLr2bhWH/L2ioTSOIpPDNQspQoBmr71IO7uGY=;
	b=Z1bp6ossQA/49dA9ctYGrrA48JoXd9d+E9+ep18E73EZKKskaAoNa21nVPqyekslFg3VHI
	hbRb7RUnm/3bTb5eocl/njUYEKX9hXtb6yTQIjOPJitit1M5t+ViN+xSTUZtkXHqkzbgiZ
	I1wk8rYjd3xEV873Ka4SWn8sk9jXI2d+1GSH/7Mnu+GzmMDqSkdZVQNWcrYQQy0d/Wk1G/
	AaVMf1Jl8QuxE3wsqA5T/jIZzJamKNxkzPUxJYclrjuAc8a4fANCMwrKJTR9FSA0s4T803
	J8wGhLuldU4lSThO1I+NRUx+rAu5X4Ef1jIhbksKYVAFQZaq4fAm4TRqrfW9rw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 14 Oct 2024 15:44:46 +0200
Subject: [PATCH] ref-manual: structure.rst: document missing tmp/ dirs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-bug-14543-v1-1-7c8519be9c9c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAE0gDWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0MT3aTSdF1DE1MTY11Ts7QkEwMLSwMLszQloPqCotS0zAqwWdGxtbU
 AWiHs01sAAAA=
X-Change-ID: 20241014-bug-14543-56fb4089086f
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2851;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fzeGMaJRzJEqfsdrBWBYt+AAJdhPrhpZVIi0+32n690=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnDSBajvKtGMUN7IfQqRf2QmlE4s6zYG2YqOEzQ
 Ao95/+mYk2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZw0gWgAKCRDRgEFAKaOo
 NlYcD/9nXT9D8o+TcDGiM1NKhibLh0yhnbyHCalhladHCqbSUbKP791r75H7oAUkVHWFD4oi8kG
 UJQG4c4y3PqYQ8Zhsxre/OwpDAaX+wEA41hfwwoyGKaEYKOOUROJ/uEH3CaczVOcjNjwWoEWVxi
 kKBJGHrFHrc6LH1uP7gRvP7a5GHc3hI3ujnjzHeKoKXhnz1THeVTZQ+h8Rn+xPUw82a3MtkmpaB
 Ry/2pvSE9xahhTrpsRaB/MffZpLeVpfCT1LwAlYzInvG6TN/RHNzZJ2uyNYKo8ZvJZnYVNHpDmK
 hSFEiyKM347Q7qxoDHhjDPo2JSpU+X+jFMzO4/aZArecPB53JBkxHV4fEIH86An+QC/Ff4m3qyq
 dlcf5AmMDOLnROKXA6WdS9XDWKfkSTfGXyEH0PqFJDyuyU/hqeS7n7+vcew9FrARMcNae0gLqWy
 s8lcM9tinS+n7MZwx/jLmJX9E5VEa4FgrRKKy8dSiU0lRCCmCVIAbFUm3KgSQx0VnMpvkVOfjq3
 7C6eUhKijXMVaywNaE73BRkfxHkFtj41v4o3h3YmADo2tvyNO3YG/Byw3GCtwxmUrpghJUy+uKI
 cdzF+epsMG91Xlg7BWukXA6CJAWMfBvYsHHJ8uvyHp5GeTiWFPmJX/naAselJHMAJrkqxp30zb5
 PN3KuqoGC6/Tt3Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 13:45:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5483

Document `hosttools/`, `pkgdata/` and add some more information on
`work-shared/`.

Adresses [YOCTO #14543].

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 documentation/ref-manual/structure.rst | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index e4d8b54bb9e39ffe344d2db1798e4fe76c742f4e..d13743cc285420b4d24f022ff6134a7ca33edcb2 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -484,6 +484,30 @@ the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual.
 
+.. _structure-build-tmp-hosttools:
+
+``build/tmp/hosttools/``
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+The OpenEmbedded build system uses this directory to create symbolic links to
+some of host components that are allowed to be called within tasks. These are
+basic components usually pre-installed on the :ref:`supported Linux
+distributions <system-requirements-supported-distros>`. These components are
+listed in the :term:`HOSTTOOLS` variable and are limited to this list to prevent
+host contamination.
+
+.. _structure-build-tmp-pkgdata:
+
+``build/tmp/pkgdata/``
+~~~~~~~~~~~~~~~~~~~~~~
+
+The OpenEmbedded build system uses this directory to store package metadata
+generated during the :ref:`ref-tasks-packagedata` task. The files stored in this
+directory contain information about each output package produced by the
+OpenEmbedded build system, and are used in different ways by the build system
+such as ":ref:`dev-manual/debugging:viewing package information with
+\`\`oe-pkgdata-util\`\``".
+
 .. _structure-build-tmp-sstate-control:
 
 ``build/tmp/sstate-control/``
@@ -657,8 +681,11 @@ Here are key subdirectories within each recipe work directory:
 
 For efficiency, the OpenEmbedded build system creates and uses this
 directory to hold recipes that share a work directory with other
-recipes. In practice, this is only used for ``gcc`` and its variants
-(e.g. ``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth).
+recipes. This is for example used for ``gcc`` and its variants (e.g.
+``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth), or by the
+:ref:`ref-classes-kernel` class to store the kernel source code and kernel build
+artifacts as a way to make it common to out-of-tree kernel modules or other
+kernel-dependent recipes.
 
 .. _structure-meta:
 

---
base-commit: 67a239f372ed1667c923e2f407da976627be2039
change-id: 20241014-bug-14543-56fb4089086f

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


