Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BB0CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 09:11:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10740.1762420299874534541
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 01:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KBtt2B4S;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 190CBC0FA84
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 256526068C
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 894031185079E
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 10:11:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762420297; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vTvqDLemjD1D0IF7YWy+qpL4NnCshl2wbhDyYZKQR24=;
	b=KBtt2B4SrT9kKTKgLOBieluTgrGL32kVf1May58FkY8n4dqpr4dTO6sFdl2+GYKwdYeeXo
	I20oTeYGQGyu6a3v6X/o/UrNYDe9yl7UJGYzG/xXpzpsvqrEWPeqQ3CvYc/qdmCS5jTSUo
	ng7v1vcPdlQKlD3ij699TBcSgaAwLLbE9LKrjJEihFEGnkiAbEOr4CdPxq7uC7A1AlXfmC
	xT8pKB+lB6qEGNLEa3xJYPCFxzE3jDjMyj6BTLwNhCevMaxLHIF7JPfyQ5QMDXynT0v2qr
	x8wieR1o4dV0WJJVpgWDeRiGtA6qWr01dajguuJ9RbUyD374QPk4fDRYFdMPrw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 06 Nov 2025 10:11:18 +0100
Subject: [PATCH v3 1/7] ref-manual/structure.rst: update the description of
 local.conf and bblayers.conf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-bitbake-setup-v3-1-97db90f85f84@bootlin.com>
References: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
In-Reply-To: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3807;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=gdbMIaT8ylYo2ppsiz5Rgx8BSjVnTSzjztmlAsSKNhY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpDGZGtRhfi6jjXbmZXuKWkC3Xts9SXOBz8ri4i
 eNMoSelPvuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQxmRgAKCRDRgEFAKaOo
 NkhTEACP3skaMvho2e62pYC2PdMVYapSB68/qPJ+KWSXrv/Tg7ipLaBaN7GVSvuo2FHVQKDijWi
 7C53f4cdKSjREckV2EutAwXHECWc8wLzYKCeBdgXDtHz4UkTe0eyAUzaGjtMd60rcFmIyuPZmNc
 GxPTbrqybmFVyRR2CDPItUvoFQLk5GeEX/VLpRlE9M52CH/e2fqQQo8CCQqhoZ7Xn91d+KgLRG/
 YPQUyoEvnOo43CZomX4UefMkoV0DRaegN6+NARalzTADxOgHN2LB2+iuKeQR7WYhCMpHiLUzCIT
 kw775BbCE0SIpyMwbVee+NqtvaZnNzfpCPvOmSjcSS1xOOuupUUfuL8bV8Ql/qZAVHbn++E0j8X
 fpgrPpEif/d42DDimatO862YwYrqfZsCXRa5PdlhGFCBgfITKqsrN+uLzWlhopVxKxqOwE/bsOH
 Alj+nXMP1ZVHwxQjRd4U8cAJvkk/dGlKG0pVxDXJ1dsPl2cBmetIOnxwKDWWKSRvpHglDzm7ADn
 LXtIlbgSwgWWzSQGM0U3kuCRAzhEWAyQjKPHKlwejFJDCHMuiLIeXR9DGPsC3rTIhpN/uD850GK
 DFxdP31RwMFLCwdIrdL4a7OOS/cA2AoSdwpn8g4GjacX2NO4NtMUHthQ/GsAMzZ06eIj142Nd4W
 Fbg/n4QjWRKgo9g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 09:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7998

The local.conf file is now mostly empty with the default way of setting
up the environment (with bitbake-setup), and this file is meant to hold
local user configurations, rather than an extensive list of variables.
Adjust the description to reflect the intended way of using this
configuration file.

Also, for both local.conf and bblayers.conf, rephrase the current
usage of the template files (.sample files) to _not_ imply that it is
the default way the OpenEmbedded build system sets things up.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/structure.rst | 36 +++++++++++++++-------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 2640f461d..a2f2fd450 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -269,22 +269,19 @@ This directory should not be shared between builds.
 ``build/conf/local.conf``
 -------------------------
 
-This configuration file contains all the local user configurations for
-your build environment. The ``local.conf`` file contains documentation
-on the various configuration options. Any variable set here overrides
-any variable set elsewhere within the environment unless that variable
-is hard-coded within a file (e.g. by using '=' instead of '?='). Some
-variables are hard-coded for various reasons but such variables are
-relatively rare.
-
-At a minimum, you would normally edit this file to select the target
-:term:`MACHINE`, which package types you wish to use
-(:term:`PACKAGE_CLASSES`), and the location from
-which you want to access downloaded files (:term:`DL_DIR`).
-
-If ``local.conf`` is not present when you start the build, the
-OpenEmbedded build system creates it from ``local.conf.sample`` when you
-``source`` the top-level build environment setup script
+This configuration file contains the local user configurations for the build
+environment.
+
+You could for example experiment with setting (or adding to)
+:term:`DISTRO_FEATURES` or :term:`IMAGE_FEATURES`, or adjust build
+configurations for specific recipes by setting the :term:`PACKAGECONFIG`
+variables for them. If you would like to publish and share changes made to this
+file, it is recommended to put them into a distro :term:`configuration file`, or
+to create layer :term:`configuration fragments <Configuration Fragment>` from
+changes made here.
+
+The :term:`OpenEmbedded Build System` can create it from a ``local.conf.sample``
+file when you ``source`` the top-level build environment setup script
 :ref:`structure-core-script`.
 
 The source ``local.conf.sample`` file used depends on the
@@ -321,12 +318,11 @@ which are directory trees, traversed (or walked) by BitBake. The
 ``bblayers.conf`` file uses the :term:`BBLAYERS`
 variable to list the layers BitBake tries to find.
 
-If ``bblayers.conf`` is not present when you start the build, the
-OpenEmbedded build system creates it from ``bblayers.conf.sample`` when
-you ``source`` the top-level build environment setup script (i.e.
+The OpenEmbedded build system can create it from a ``bblayers.conf.sample`` file
+when you ``source`` the top-level build environment setup script (i.e.
 :ref:`structure-core-script`).
 
-As with the ``local.conf`` file, the source ``bblayers.conf.sample``
+As with the :ref:`structure-build-conf-local.conf` file, the source ``bblayers.conf.sample``
 file used depends on the :term:`TEMPLATECONF` script variable, which
 defaults to ``meta-poky/conf/templates/default`` when you are building from the Yocto
 Project development environment, and to ``meta/conf/templates/default`` when you are

-- 
2.51.0


