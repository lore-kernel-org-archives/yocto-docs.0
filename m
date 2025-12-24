Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C42BE776CF
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:31:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123715.1766593911672020465
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LCuWPvwP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1BF1D1A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7A206073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40DE9102F0CD4;
	Wed, 24 Dec 2025 17:31:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kkraAZueWcGsZEJC6hjLmE5GZNu3+wuX38UIxVi1YQw=;
	b=LCuWPvwPAdzYS3izhAWTTsvxNxojVaAJz7DBwHoQC7EtnKGayC/lX5NBwzf2YCFjBRemwQ
	FTOLk0wJAsC9UA4f4hHD+HeWM2pYaOf7/5IupN7Quko+DtSyX8I8SlqkJcPVDaNWAIHLAK
	QZEJMlqDuRI/u0Lz7LLazvpjYSBo+ozXkfsd+4YsY/uhoHUvJTGYKT0sj3WmYPczdCvd9y
	+oGrO604Ab34QdI5lDvjpoOT8cfRtV6Df2xx0j10bG9z13aPZab/49cRl50OXqSxedjEWH
	o8t2XWXdv1v1prJcRLOjntRzGh7M38P8ysqkL1SbwVU3uZCyFAIJdU32c3ibkw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:31 +0100
Subject: [PATCH 05/53] kernel-dev/advanced.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-5-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qjh2FEXVqCBX2EsrJwdx2mtrwJ8Z4McFcnh3cBpk0No=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVndZy0sJTzgYYt/Plb3P/y/pnd2m1NmJGpl
 QN13YrKEfGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVZwAKCRDRgEFAKaOo
 NgAwD/0cQz2PJaNF9gJCh/oaIcGKVuKaCIRqQP1RlVa9n9jA+e0+vxOtk1mce9msijyBDXF/dxe
 aciRRLR2HMsaWlPqjBt5vPixg1kiKH2chcBpo07LqmuL6oNadyiPxkU71gYJvFaFbqKyMI7zxuh
 ixQz8G38l9RLlVtkeMlCcku7t4Wl3HYuWdHzi9z8UcSEu4+ANWR4XFsbEMVFTfDt3h1eMRRFcDk
 RHtqaRJPh9iaEDQjIlzuILN6KJeMwUBkP6+iPTorX3XDizcOJBgUdZZBJgAh92j6vcV+wB+5gwc
 FlzcpoP8s8EPyxvLXqJ7VI72eKXvCKY0RVDPRvbxncxj7Q0j5MKWFb89D7oiyHFmJndFSunkQOV
 f2ptCnMsETL1CnMXSje+OnrnhlU1KF21bss6fvnEAvXdTEgX7oMyv4HnPUdWgI/ATvR9QQ/LcHH
 +mU8PkNjXNeAIdoO5RNXuzEndRcLtHlawychbXgXo9hzr7mQzxwA1iK0XOBdY7DMIzZoHhoEspP
 jDOBgX9J2se6GHU35KbTm77vx8I2ha8L/MHbr8M/DajNWkv6xlyGhq5dWWb8OSmopYHzSi8hUDR
 D67skGLm+fwpiqXIoEy/FfKqEe3I+85zpkGKUVW0vfjeka8GkUDeFfwiF3VtUqmLVHtnqG49/Up
 NDoZpJc1Wg00DpQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8334

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases, and refer to bitbake-setup or the manual setup in the
intro.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/kernel-dev/advanced.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 4c463503f6..97cb663222 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -24,9 +24,8 @@ grouped under the "Yocto Linux Kernel" heading in the
 Kernel development tools ("kern-tools") are also available in the Yocto Project
 Source Repositories under the "Yocto Linux Kernel" heading in the
 ``yocto-kernel-tools`` Git repository. The recipe that builds these
-tools is ``meta/recipes-kernel/kern-tools/kern-tools-native_git.bb`` in
-the :term:`Source Directory` (e.g.
-``poky``).
+tools is ``recipes-kernel/kern-tools/kern-tools-native_git.bb`` in
+:term:`OpenEmbedded-Core (OE-Core)`.
 
 Using Kernel Metadata in a Recipe
 =================================
@@ -357,9 +356,9 @@ kernel of a specific type (e.g. a real-time kernel). Syntactically, kernel
 types are no different than features as described in the
 ":ref:`kernel-dev/advanced:features`" section. The :term:`LINUX_KERNEL_TYPE`
 variable in the kernel recipe selects the kernel type. For example, in the
-``linux-yocto_4.12.bb`` kernel recipe found in ``poky/meta/recipes-kernel/linux``, a
+``linux-yocto_4.12.bb`` kernel recipe found in ``meta/recipes-kernel/linux``, a
 :ref:`require <bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>`
-directive includes the ``poky/meta/recipes-kernel/linux/linux-yocto.inc`` file,
+directive includes the ``meta/recipes-kernel/linux/linux-yocto.inc`` file,
 which has the following statement that defines the default kernel type::
 
    LINUX_KERNEL_TYPE ??= "standard"
@@ -373,8 +372,7 @@ type as follows::
 .. note::
 
    You can find kernel recipes in the ``meta/recipes-kernel/linux`` directory
-   of the :ref:`overview-manual/development-environment:yocto project source repositories`
-   (e.g. ``poky/meta/recipes-kernel/linux/linux-yocto_4.12.bb``). See the
+   of the :ref:`overview-manual/development-environment:yocto project source repositories`. See the
    ":ref:`kernel-dev/advanced:using kernel metadata in a recipe`"
    section for more information.
 

-- 
2.51.0


