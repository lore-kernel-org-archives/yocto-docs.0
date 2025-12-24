Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40003E776FD
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123212.1766593938944278309
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qJwtpfnc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 607294E41D90
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34FE16073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F13910AB1379;
	Wed, 24 Dec 2025 17:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CrLdO16+ZlVWFx2yVL0Qq3Y5tGe8wVpIXmeVgaL28MA=;
	b=qJwtpfnc4i3nXiYc8TvIkxPahQBwUQoAyAgFNlY0hILl+PxhIhRQpY0XUh1KF8eET6fz0/
	3nrsu3hAkUTptpYPBqD29Y+NLGXPgD2kX5+rCkLjMbI1QBiJRuD08zGfhNyOfVAEr73n0+
	Isx4HNAjkX1fBl5unX7W8Pycx3rnbtepRO40ExFsdJzvwE6DAeihdTP+plC1Ev13VWoR5I
	05mwlIPquOTvVa6VuXct/baNtzUUsbCsh9OR9Q+Wwz5KHKtjNyuatfmyHpqFVcuV6LuRVn
	sYYfeA5ESwrB3d9uCsY6R4MJTFG3D60qVDdw349hPyF2u382qeMWBeOubnwGIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:08 +0100
Subject: [PATCH 42/53] dev-manual/qemu.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-42-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WamXF01pwAU1SpCueL5dT7JowofkF5ezglIbLsVqU1Q=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVuksZ8RmLYdYlIqC9lmI0nt2hlPBc5QHiIR
 0tCaaRF2TeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbgAKCRDRgEFAKaOo
 NlIoEACTZIPjXma6TTZhGEbKW6i1jXuAqNjF6E3kz18HYTsqSscN1ri1xGn4W5a8/uV1D1z9lzu
 Fwbkjt1x6PUIPWBJ/d46Awj5cWcogjblgHGyebLzi9uZL9GGYasQ0Z3MPTZXgeovznTTOncjDrI
 Qjb55/wwieAsJiqfihkPV5WxKBfpO+R7DcfWds4sli4SzYnovj16YK2S3WSrhm+wSJtYJeL36CQ
 fsbzQYpGowy5h+nMR7GfIDnH7mvghQqeUiFqNhVUn+pGLpl92KRzr34SDzvXmVS+umH8XgAVWF2
 vgOeIInGQTnOHzaR7JQFRSQQ6+lANY79odO+FxvauBnQTkJIz5BRDvMNCIxkWAnO3icxKjaYTKV
 gPin5xc15q2GrsnzWdqvwUTmjEYz9Qyjp2AAX1FHmxfRt9y7LER5bAS3/CkH6ZY51r9AH/ZaI10
 vkYzPW/DEGd+RFEITGlTJAP1wGqUVy8BA0Nsih/ZyqCUV5iqX4cfeGy+oO79oML5HBuQIm5J+ei
 6MT75lQjBZNz9S6tbfg1NxBgzZr7TsfeIR4Scblk2dvZTPBikrBgya3b4a3uJwxgTjkuYF9me7R
 saeUKceEOcLENlRXrqNan3iRaIFGnllI7OPXB8VKg4xYHjK7zd5w4EvcYMvfCcPMguhEUa9PPjO
 w+D07aShxKqVwdg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8371

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/qemu.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 9e0b8b813..2442b6dac 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -53,12 +53,13 @@ available. Follow these general steps to run QEMU:
 #. *Setting Up the Environment:* How you set up the QEMU environment
    depends on how you installed QEMU:
 
-   -  If you cloned the ``poky`` repository or you downloaded and
-      unpacked a Yocto Project release tarball, you can source the build
-      environment script (i.e. :ref:`structure-core-script`)::
+   -  If you followed :doc:`/dev-manual/start`, use ``bitbake-setup`` or source
+      the environment setup script manually::
 
-         $ cd poky
-         $ source oe-init-build-env
+      .. code-block:: console
+
+         $ cd project
+         $ source layers/openembedded-core/oe-init-build-env
 
    -  If you installed a cross-toolchain, you can run the script that
       initializes the toolchain. For example, the following commands run

-- 
2.51.0


