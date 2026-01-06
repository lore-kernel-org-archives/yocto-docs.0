Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A2ECE9D63
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:34:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92537.1767713683259880884
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=o92e64XN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8BA33C1E4B7
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:34:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B87F60739
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:34:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B828103C86DD;
	Tue,  6 Jan 2026 16:34:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767713681; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JX+206UFF6NSW35yFlUNJni8/aSpxae999sQtyP6Oh4=;
	b=o92e64XNYSXv35SwNFuWZOSQdJ1TkzsR8veS8jg3aSfinc8s2BSKCP2T7umP7Rg2fS/TC2
	UK86h36J2d4DX1rDUgRd3L51qjQt9LCmuOZ2YWKeYo4Q+FRQOhW3A7T8FtjUdACoit4mwT
	riXryd09aNp5lCO0OmBnlaEMOOX4XYLD4uUEyuD1jz/JCVvbpjffwfc7UzxqzC6geOAx+R
	aH7xNy6x3vzMOEOra0QEclLBJLL+/HkAeP7nVhQR/RjW0YcyRz4Kuuw3NSSJDkXgujXOt5
	f/KdR/0YeXRsHmNlcZiSib8wUjZsU5G2i/lTjuDLVOUQ4kngVx1GzGM8RW7zUA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 06 Jan 2026 16:34:32 +0100
Subject: [PATCH 2/3] Move security related manuals to the security manual
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-security-manual-v1-2-500fe611a4d0@bootlin.com>
References: <20260106-security-manual-v1-0-500fe611a4d0@bootlin.com>
In-Reply-To: <20260106-security-manual-v1-0-500fe611a4d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10776;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PtkhsmsC0lJevGIehsihchuiFuIfDp8z7Bfo9t4SCA4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpXSuPxJorVpK2ti0/BAgTg4RAA5tvzduD5UKRL
 RgIhsnLnk2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaV0rjwAKCRDRgEFAKaOo
 NpQ5D/428OlejQ8Ga065qXAF5StEp+gSuyiKOkJOlhBl7a5eGUWL0iYSSltbGWJ8RjDOLkB170G
 iavTjLEsLpp1iJcPr0J9BVz1sRD6zzckxgLpygCzRBF1BVjs9/QzECZAFbylUWCBjOzIdATViuO
 eZFYCNxcCH03PkveNVRp1dppmKXtvc8vHHHjZygBlBF+drKdkQSqF3IsddbprXcMuHJx4/NPspu
 XyhPkSup45mqGQbIeQvR/490VemBpqd8UdstaX0Elv9CbbpIb8IBCH2IJ8oNHBxmwExok5u2owz
 rmjyulQ2H50oPtB/qGBpZtYHY24eZH5KMuv9Vn4mw/K4Ev9EklKwFvlpWpGHtOTSVo9iIMXpUuL
 KI69/6LCpBMqnk+wePWaFkfH9rPA2z1e7p+nyI1pCnT/8NSfd/wUQQBKNNRdbKU95DAB+r6aKSL
 xnAue5kq1wmuiEB86m/ECR25Ul8q2fxNnaIMW9LIwPNeT0hqgOsJ22SpmLEUYJWkKg627CyH/bp
 uCp7+hrCgypPWSfVMfaBufeFZQFc1Pp3SwVTCaJM6NJfleTiP0tIfDNR0xYvgeZ4BnGZIcd+/58
 wPOtvTKsCo7YVOA/YTG8R3k8LnB9jEFS934aDWGDVDYaZ3SgsNnUq2xwSs9svZj0o9bs66pzpfs
 36ptBK+my/Lealw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8399

Move the vulnerabilities, read-only-rootfs, and securing-images sections
to the security manual. Update references to these documents to fix
Sphinx reference errors.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst                 | 2 +-
 documentation/dev-manual/index.rst                                 | 3 ---
 documentation/dev-manual/sbom.rst                                  | 2 +-
 documentation/migration-guides/release-notes-4.2.rst               | 2 +-
 documentation/overview-manual/concepts.rst                         | 2 +-
 documentation/ref-manual/classes.rst                               | 2 +-
 documentation/ref-manual/faq.rst                                   | 2 +-
 documentation/ref-manual/features.rst                              | 2 +-
 documentation/ref-manual/variables.rst                             | 4 ++--
 documentation/security-manual/index.rst                            | 3 +++
 documentation/{dev-manual => security-manual}/read-only-rootfs.rst | 0
 documentation/{dev-manual => security-manual}/securing-images.rst  | 4 ++--
 documentation/{dev-manual => security-manual}/vulnerabilities.rst  | 0
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 6306ed45b0..07989d7b6e 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -711,7 +711,7 @@ follows:
 #. *Identify the bug or CVE to be fixed:* This information should be
    collected so that it can be included in your submission.
 
-   See :ref:`dev-manual/vulnerabilities:checking for vulnerabilities`
+   See :ref:`security-manual/vulnerabilities:checking for vulnerabilities`
    for details about CVE tracking.
 
 #. *Check if the fix is already present in the master branch:* This will
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index e786ddf8f8..e9bf17bdcc 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -33,7 +33,6 @@ Yocto Project Development Tasks Manual
    external-toolchain
    wic
    bmaptool
-   securing-images
    custom-distribution
    custom-template-configuration-directory
    disk-space
@@ -42,11 +41,9 @@ Yocto Project Development Tasks Manual
    init-manager
    device-manager
    external-scm
-   read-only-rootfs
    build-quality
    debugging
    licenses
-   vulnerabilities
    sbom
    error-reporting-tool
    wayland
diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index d54a33a470..8452fb12bb 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -6,7 +6,7 @@ Creating a Software Bill of Materials
 Once you are able to build an image for your project, once the licenses for
 each software component are all identified (see
 ":ref:`dev-manual/licenses:working with licenses`") and once vulnerability
-fixes are applied (see ":ref:`dev-manual/vulnerabilities:checking
+fixes are applied (see ":ref:`security-manual/vulnerabilities:checking
 for vulnerabilities`"), the OpenEmbedded build system can generate
 a description of all the components you used, their licenses, their dependencies,
 their sources, the changes that were applied to them and the known
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index 8da42a4390..529be7da29 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -273,7 +273,7 @@ New Features / Enhancements in 4.2
 
 -  Prominent documentation updates:
 
-   -  Substantially expanded the ":doc:`/dev-manual/vulnerabilities`" section.
+   -  Substantially expanded the ":doc:`/security-manual/vulnerabilities`" section.
    -  Added a new ":doc:`/dev-manual/sbom`" section about SPDX SBoM generation.
    -  Expanded ":ref:`init-manager`" documentation.
    -  New section about :ref:`ref-long-term-support-releases`.
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 04a08b7db7..c68a94e75a 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1041,7 +1041,7 @@ stage of package installation, post installation scripts that are part
 of the packages are run. Any scripts that fail to run on the build host
 are run on the target when the target system is first booted. If you are
 using a
-:ref:`read-only root filesystem <dev-manual/read-only-rootfs:creating a read-only root filesystem>`,
+:ref:`read-only root filesystem <security-manual/read-only-rootfs:creating a read-only root filesystem>`,
 all the post installation scripts must succeed on the build host during
 the package installation phase since the root filesystem on the target
 is read-only.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index eae15fd62e..2e219a59c3 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -659,7 +659,7 @@ These can only be detected by reviewing the details of the issues and iterating
 and following what happens in other Linux distributions and in the greater open source community.
 
 You will find some more details in the
-":ref:`dev-manual/vulnerabilities:checking for vulnerabilities`"
+":ref:`security-manual/vulnerabilities:checking for vulnerabilities`"
 section in the Development Tasks Manual.
 
 .. _ref-classes-cython:
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 406b2c3887..6c5b9d4e7f 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -320,7 +320,7 @@ the vulnerabilities using the SPDX document as input.
 These third-party tools have the responsibility of providing support for
 integrating with the Yocto Project SBOMs.
 
-Also see the :doc:`/dev-manual/vulnerabilities` section of the Yocto Project
+Also see the :doc:`/security-manual/vulnerabilities` section of the Yocto Project
 Development Tasks Manual for more information on dealing with vulnerabilities.
 
 Customizing generated images
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 40651a4c91..df37830893 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -333,7 +333,7 @@ The image features available for all images are:
 
 -  *read-only-rootfs:* Creates an image whose root filesystem is
    read-only. See the
-   ":ref:`dev-manual/read-only-rootfs:creating a read-only root filesystem`"
+   ":ref:`security-manual/read-only-rootfs:creating a read-only root filesystem`"
    section in the Yocto Project Development Tasks Manual for more
    information.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ee776c1109..b3c3fd0b26 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2070,7 +2070,7 @@ system and gives an overview of their function and contents.
 
       It has the format "reason: description" and the description is optional.
       The Reason is mapped to the final CVE state by mapping via
-      :term:`CVE_CHECK_STATUSMAP`. See :ref:`dev-manual/vulnerabilities:fixing vulnerabilities in recipes`
+      :term:`CVE_CHECK_STATUSMAP`. See :ref:`security-manual/vulnerabilities:fixing vulnerabilities in recipes`
       for details.
 
    :term:`CVE_STATUS_GROUPS`
@@ -2919,7 +2919,7 @@ system and gives an overview of their function and contents.
           useful if you want to develop against the libraries in the image.
         - "read-only-rootfs" --- creates an image whose root filesystem is
           read-only. See the
-          ":ref:`dev-manual/read-only-rootfs:creating a read-only root filesystem`"
+          ":ref:`security-manual/read-only-rootfs:creating a read-only root filesystem`"
           section in the Yocto Project Development Tasks Manual for more
           information
         - "tools-debug" --- adds debugging tools such as gdb and strace.
diff --git a/documentation/security-manual/index.rst b/documentation/security-manual/index.rst
index 92a883f006..3453940f5d 100644
--- a/documentation/security-manual/index.rst
+++ b/documentation/security-manual/index.rst
@@ -11,6 +11,9 @@ Yocto Project Security Manual
    :numbered:
 
    intro
+   securing-images
+   vulnerabilities
+   read-only-rootfs
 
 .. include:: /boilerplate.rst
 
diff --git a/documentation/dev-manual/read-only-rootfs.rst b/documentation/security-manual/read-only-rootfs.rst
similarity index 100%
rename from documentation/dev-manual/read-only-rootfs.rst
rename to documentation/security-manual/read-only-rootfs.rst
diff --git a/documentation/dev-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
similarity index 96%
rename from documentation/dev-manual/securing-images.rst
rename to documentation/security-manual/securing-images.rst
index f4b528e559..c66dde7f71 100644
--- a/documentation/dev-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -64,7 +64,7 @@ more secure:
    especially applies when your device is network-enabled.
 
 -  Regularly scan and apply fixes for CVE security issues affecting
-   all software components in the product, see ":ref:`dev-manual/vulnerabilities:checking for vulnerabilities`".
+   all software components in the product, see ":ref:`security-manual/vulnerabilities:checking for vulnerabilities`".
 
 -  Regularly update your version of Poky and OE-Core from their upstream
    developers, e.g. to apply updates and security fixes from stable
@@ -72,7 +72,7 @@ more secure:
 
 -  Ensure you remove or disable debugging functionality before producing
    the final image. For information on how to do this, see the
-   ":ref:`dev-manual/securing-images:considerations specific to the openembedded build system`"
+   ":ref:`security-manual/securing-images:considerations specific to the openembedded build system`"
    section.
 
 -  Ensure you have no network services listening that are not needed.
diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/security-manual/vulnerabilities.rst
similarity index 100%
rename from documentation/dev-manual/vulnerabilities.rst
rename to documentation/security-manual/vulnerabilities.rst

-- 
2.52.0


