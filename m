Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D66C982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11765.1789739654962734142
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0YHc55vr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4F8F21A098F
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2477060649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77FDE1032900F;
	Fri, 18 Sep 2026 15:54:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739652; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JwH63xINPG+HMjMU3/Is5tfm1OdDx0I8OkNLEwiqIs0=;
	b=0YHc55vr/43kL9kMlDlVCKUlXhtWIZI2rb4O3Ciam4UPmGF6JlYgkplp5nqZ/CXoQk03ES
	ltepmsg9xPu6gg+93TGBJE4A4EdOn9SDSPUxwMf2laLiV3cMDPTsmZtWMkIhzUz7p6wlBl
	NYpOT0ODiPpsv8sTgQfohMLVK/cB0IOdbf1SQPBeL2W2XG0rD/XP7uAvoYNpZjykfT8sBS
	U7f+QyF+lCG7CGhAQbuZyDz+YvzWHQ0RcgXD+4ur9jVmHv6rOopnnyG6wptqIUsGLv1/Yj
	HQ2GkUgM8LRE7hPqUb0FswLG+KBsasV6gpzmSbogA1f3iY/xjSf79JE/aex0eQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:37 +0200
Subject: [PATCH 07/20] ref-manual/variables.rst: document the
 KERNEL_TOOLCHAIN variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-7-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qlsN+WmWdm0XqeOwY59jUcW73AGVHvkj3w65PZHOVcw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJkv7tFgyoCdF5NNfm1HgGzM9ykORDX705ZC
 +XUbUSB8mSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZAAKCRDRgEFAKaOo
 NkCQD/9oSayD0qtMaMRDxixfGf4QTgg0SJRK+Kn2P8JTUaqH5I4oKY/v1weslTRNNzkPHlXzED3
 Gu6XznwPUErem6xvGqAT+NBFo3coj8PBe4o1qleu84fGtjpfAl8+PWdYTXCr9oAgJTjmsvsMJS4
 rwPPJY5NgrzCMzf0pw4u7y1vq9Kg8Bt6FTbUyr7qlJ2KFKYgqM1oPZWNBhwjAuJcqXKBGBSWBuq
 LyoYYKAmNwwFN/4FmSBseQmNNlfGpONn1xPxElcKZgdwXvsWs0OYjRV7s0v9FJwi+bhzwlTt67c
 tTBjDGC9bw+p/7CNF6Nw+Xz1l6eEmsuRl2Nu2ic+N9nl55ib9mYb55fx3hcPx+VQGnJkQONHOEW
 6Nky7nz17NnI7wVcg7MljA8T+MmKLHfE3Xee4/NvwlM3CvwjZyIjzsPAWpCjauPWpSzLL5S1don
 JlgXWJfGX6KL5pmL6ODOLDjgDwWd2UpnMXIp+HqXF0V82p/f+V5FSwBnfrG7IX4fS1dnRUrIYTK
 EpwCeg4k39R2bWOyVm9PhMptqnqJuZB3akM555X2H/jtsuvuNdLiz07WjOVb8u6UKxRFE4vXZ1J
 Uk+r5mcCTroU5MhzFjEhiDSHoVTBQZJy3mZ8SKWvmCR/FXwF7tqWTWd+tXPte8D91G3CQtPMEJL
 i4O6JxEqN7dni0g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10539

Added by commit 0e3756efe092 ("kernel-arch: add KERNEL_TOOLCHAIN to
switch the whole kernel toolchain") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 780bde3f1..8ec5cd955 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5758,6 +5758,11 @@ system and gives an overview of their function and contents.
       Allows to specific which ``strip`` command to use to strip the kernel
       binary, typically either GNU binutils ``strip`` or ``llvm-strip``.
 
+   :term:`KERNEL_TOOLCHAIN`
+      The :term:`KERNEL_TOOLCHAIN` variable allows specifying the toolchain to
+      use to build the Linux kernel. Its value can be one of the values
+      supported by the :term:`PREFERRED_TOOLCHAIN_TARGET` variable.
+
    :term:`KERNEL_VERSION`
       Specifies the version of the kernel as extracted from ``version.h``
       or ``utsrelease.h`` within the kernel sources. Effects of setting

-- 
2.55.0


