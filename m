Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792F3F364CD
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157874.1775832226505252720
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=smWSLA1R;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 75A16C5C1A8
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0614F60434
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6900210450072;
	Fri, 10 Apr 2026 16:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832220; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iIXXCB8Gif2+bAjWlVcWP80LjEo96Zvvb1qSGmYMAZc=;
	b=smWSLA1RDjGrsVMgSNIpRlMInAcNoqNuchW8YFHyWIDPZOWWHPdaF1N0N8UH3jW5uv/K7T
	tv7EcFU9cLWgJz1tNsm9sZIcV0F/eh9mrQME11lMznGQiEUKop9kwkLx/IFOfsM4SVYVit
	Djd1Tz7d7rCgYTZxuOkhg+WoC/afEQ1W0VaAQc5fU8bA/i8zdNZU9crrye8xDoIIDCKZT4
	TUEnZpXqccwGnnCmhpG1lxUI9XbNpONjcE9SMVyUBdc2FOKH2xKuPXEnLI8T6hIQF+Jm+U
	2/mmz7suNpoHd7Hxdrz2Mdafigxw3Ymgsfk5nmj4BLUO3z9m14dgrEB4puOb+g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:28 +0200
Subject: [PATCH 04/18] ref-manual/classes.rst: document the
 KCONFIG_CONFIG_ROOTDIR variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-4-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0c4OD3GB5pdVUTPXYYlU4Ok4fzdhmyo8ZsVwfenjldU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyXYhD+M6KCXL3o2+ZwNoLfo0mDCHoREdVZ0
 39UNbOIo1iJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlwAKCRDRgEFAKaOo
 NrlSD/wLNjtQ2kwlddL5qF3amYM0fUmGsYJShIWvK3dxdISPnijjZeaiUZE4kmZ5I+Dvxdx/GQT
 GYS3gFDHJW/lFAFy/JdMeZTmpEAlo9MBvfjgLBZGShBNkaO5i+2RBJDAyF0wtewEnlJEDvEFKNs
 /8/4RTCeTEhxmMVFTPKystmBeJmAmuWPd//WPm7kTGpzborZUa+L/3PA7Ot8LV7fseuwzj9I2NA
 XkXmdi0dAZTTz/n1z8gAExCj2Ajqfh14HZKFtrIIPhBCyNNEYDaPhwq7VCaiESo4lrKDha0CzR/
 OJEvNiV2C2KGfYSntN6SquL8qOI+1KrnPEzc/IFb/xn5shi/M47Ao6kHNex9TDRx/WeDyeWnXf9
 MCp+WhGUE1wl8qCGlhs3Eqgszyob4Mlr3Zw60gqXOLEvrdv2ZtijIXsU1AjbgSf4RAlNnit1Ryc
 eCg9ZM2ET5U10wAwjOGzncD1GBRpjPiKGLV+0s1cMtm3okCOuuZpsH+0nw8Uo5j1pCuQRQegYQ4
 rt/UKg7yvrj4A05SwoY2fXsMUe5+s2c0/F977IP58CKrdp7/RGIcGox7+IC3WiOpdSWT3Smofqa
 o7Jp1tKvqYY9P7GBizz2/iCi29V+lDklZ/+z+ADg99gzLQTzI7TZnLITIs1uO5e6jz+gFrOf1U6
 LVAQo4Rawe5PLdw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9234

Added by commit f86282ad2c66 ("cml1: Add the option to choose the
.config root dir") in OE-core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 4 ++++
 documentation/ref-manual/variables.rst | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2fa888e15..acdbe9935 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -476,6 +476,10 @@ build configuration system. "cml" stands for "Configuration Menu Language", whic
 originates from the Linux kernel but is also used in other projects such as U-Boot
 and BusyBox. It could have been called "kconfig" too.
 
+The CML configuration file location (``.config``) is by default expected to be
+in the build directory (:term:`B`). This can be overridden with the
+:term:`KCONFIG_CONFIG_ROOTDIR` variable.
+
 .. _ref-classes-compress_doc:
 
 ``compress_doc``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 60e608c0c..20e4893d6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5337,6 +5337,11 @@ system and gives an overview of their function and contents.
       :yocto_git:`symbol_why.py </yocto-kernel-tools/tree/tools/symbol_why.py>`
       script in :yocto_git:`yocto-kernel-tools </yocto-kernel-tools>`.
 
+   :term:`KCONFIG_CONFIG_ROOTDIR`
+      The :term:`KCONFIG_CONFIG_ROOTDIR` variable allows overriding the default
+      location of the ``.config`` file for recipes using the
+      :ref:`ref-classes-cml1` class.
+
    :term:`KCONFIG_MODE`
       When used with the :ref:`ref-classes-kernel-yocto`
       class, specifies the kernel configuration values to use for options

-- 
2.53.0


