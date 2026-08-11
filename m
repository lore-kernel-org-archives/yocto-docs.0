Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BD3C5CFE7
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:40:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54618.1786455606624140297
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 06:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IwNxmh8J;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E3DD64E411B6
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:40:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1F156033C
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:40:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 110EE11C48C39;
	Tue, 11 Aug 2026 15:40:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786455600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A+kaHYh9Gidt5vinEGaqW7Mxj5ZY9oWrg7Ih3pYx0bM=;
	b=IwNxmh8J7Fr9L+/4n9ksqxVTyAlbru80pXTraVOFYEfJmMgtCdvic5TAYYoFyiSgONaNJY
	6JQXIg//FaYlZIey+IgN6xsrdii/Gf8snttKwCl/qh4qPUTxZumyBXTwvhGH8+ISBl8ZBe
	AKNbljsny371Cqbge4Lxp/U/3fif/6Dw0/Z0darIyT1USnUVDbq5FVmtAqLWy+6x6ZtuoU
	Cu7Zc2IIoP2taQbvLaDTjVl+yARLeWwWjvI+gct2mbKb4qZwDlRduN+hj0Uv4tVIN3hWDz
	gcRAX0wwpwW8sKMPJ74s+PnuPVXSVcfzzRso54AWST7x9XH7OVYnyKCtxGZU2Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Aug 2026 15:39:47 +0200
Subject: [PATCH v2 2/2] brief-yoctoprojectqs/index.rst: fix a replacement
 typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-bitbake-setup-pip-v2-2-3e8ffed354f2@bootlin.com>
References: <20260811-bitbake-setup-pip-v2-0-3e8ffed354f2@bootlin.com>
In-Reply-To: <20260811-bitbake-setup-pip-v2-0-3e8ffed354f2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ORoLN8J1rk4LY149/xD0URp/23jff5dE1ssILgC96/E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqeyYmga5jp4mtQrhiUAwq1OVVyz8aWcJTcOsJ4
 Ekj875IQv6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCansmJgAKCRDRgEFAKaOo
 NhM1EACXDng1t6B6ihcE/cQrEKe79jhBFA1MF3K6zeZy7/9uw02I1guK9/Hdei9KXZ1jNX5fvbe
 anh2x/wCp/mAWjSLs4qHb+tSKxSrjPnZo/OtHORqw3RLfm8jni7QkkDKX1McUU0xQdKOwCAefdu
 17G603X/dsb25euEW2VF19VyOF55oIBvOyJKu6ucnfn9yPREHacev5CvW0dvCd3v0W+7vFiSY1m
 ecwrh/zivA1DkZtwAJRtDFuHvdZ4mXntstS5D0ja2+LiH5GIHF918qw/VfReqxlkK9WWuk66cO7
 bIMfPd8KZnZ0mrrU0f2qwY/1vY5ul26AA+siujNtbOENQTreI+ALbK6T/utVhYDiIrdYyJ9KZdf
 8Th9n0IkD/X+xp6A39lgy7r1G9eVQaPkR1SMwaGZew+Lsf7KlWtfaiw5BZ9ooc6cZzRjc9jmmqK
 efnc0QQGVM0VuuthZzZ8dFPRjwc2NTieSSQ/2/N4zLfKpy5vsv0F4jaEww1KETaq/m9ojWLnhZS
 lZHn3I4dl3XWcC0jWjl8KXUvqWwo65YrHsgpDJzCP4WfpyAgf5FiWI+r5NhaZ4ihR0t5PvGCgDV
 CzzcIuXte8OdrDtNhN09tgJngXSH5OjhM0ozjy2Chaxxck/lxRRR8dZzy/7mw4TiKzmVXty2Jc1
 2pq72ygMM2o8wjw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10267

These two replacements were missing the trailing ";" which made them
appear with their name instead of resolved value.

Fixes: 34eafb89b1e4 ("brief-yoctoprojectqs/index.rst: refresh bitbake-setup outputs")
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index a8837bc96..7186d732e 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -138,9 +138,9 @@ differ from the examples below.
 
       Available Configuration Templates:
       1. oe-nodistro-master   OpenEmbedded - 'nodistro' basic configuration
-      2. oe-nodistro-&DISTRO_NAME_NO_CAP  OpenEmbedded - 'nodistro' basic configuration, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
+      2. oe-nodistro-&DISTRO_NAME_NO_CAP;  OpenEmbedded - 'nodistro' basic configuration, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
       3. poky-master          Poky - The Yocto Project testing distribution configurations and hardware test platforms
-      4. poky-&DISTRO_NAME_NO_CAP         Poky - The Yocto Project testing distribution configurations and hardware test platforms, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
+      4. poky-&DISTRO_NAME_NO_CAP;         Poky - The Yocto Project testing distribution configurations and hardware test platforms, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
 
       Please select one of the above configurations by its number: 3
 

-- 
2.55.0


