Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B50CCFA0D
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:33:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1842.1762187618411348278
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 08:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hMZsC4Pd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 177381A185F
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0CC860628
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 16:33:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A76510B5009C
	for <docs@lists.yoctoproject.org>; Mon,  3 Nov 2025 17:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187616; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vTvqDLemjD1D0IF7YWy+qpL4NnCshl2wbhDyYZKQR24=;
	b=hMZsC4PdOphdJwgHFyZiO33K4VkmXC9xhMICfiF058wYFufAaZT+NNZwp3OMnEB570t6t+
	QvcTpFKLUearCFmZ0ZjeyAk89w3Sz+rvTbU4A9c9EOH4qgyQC6PC8VwzZ0yhPxsOTGPRdD
	kLRwLf3DasOvYlulyeF6SBJHfecg8Zvj+Ry+LKKRJOmOQmt5wmG9nFfP/AHP02T5RzfPX5
	u8sJptE7fFHEiREi6DeOGUvZHnQ9BimGcneBtWb/Adb9pThbddLDaohrCuwbAW4T8vcoBZ
	8Grnrrla+EyQYeJNdHnhlg7bbszkC+4esUI431XtLo+yoxGl12bzlsJSDvSIvg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 03 Nov 2025 17:33:05 +0100
Subject: [PATCH v2 1/6] ref-manual/structure.rst: update the description of
 local.conf and bblayers.conf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-bitbake-setup-v2-1-89fbb14cfbbd@bootlin.com>
References: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
In-Reply-To: <20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com>
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3807;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=gdbMIaT8ylYo2ppsiz5Rgx8BSjVnTSzjztmlAsSKNhY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpCNle3RJxT2tX1vaO8m6r3tXg9NH0+KvrUk46H
 vjdlXPeWRqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQjZXgAKCRDRgEFAKaOo
 NkcdD/0SmRcHd9hIqyztUOi/dJzNOzzDTbi8JsypTRCJ+xZHmpHZzLAuzuGkVmUoPvdL9Ny308t
 e5+qiw83s+mQCToFWWnni7mjezJaxvflHeJipm65Z5DV023PBRzCNIvhhdedAygfnyiGejGFy4Q
 wVYDUI34OD6ZrlDdkyVjP+FDcMVMoEGPOyh+wmpOXuNczp4e83Nkayqd9q616sP3shQrJU20nue
 IbOQhxmloJgYYLTvy19THBiB/k2/GrU6Ar8DKNvHvRt+IAaaxAEzNGp0Jh4iNeHl+mmQ120aCPY
 NBvnPR/TUe/R1F3k8mbFdbfF+S7ng7+t2kQjsXrWHj4tjwURC/t59qesvfSTngA6eLFDncRboJ3
 +5EpbJxEQDE2F05dpteHH5mP0JCtrbW/x9eTpJY3reoB2YoQOUNpKZROLM4vdfr90Jh2eGSmE+Y
 drXm7oriHt9htKnTJSqP4JX5hz0BhAyRp0dtR+K0Rm/IFSorZQRCv+tv2ndlGbqPHjyV6S/Z5fX
 ZjLwVEgr2NaVPE9Z5LIji6EJiWO3VcBeT+ba/2PjUqaSKG75MIZUkVQEmBwo031R6tx+sQ3ys7o
 pf3GIjdRs+Z9sYjlz52rVrvuRn9KC9ZNZJtEhZfU9hywvEzzIhdk7QW9tIs2KeuMlF/G0iHUH3s
 fDlWT5rQOgi5y5w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 16:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7976

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


