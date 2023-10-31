Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D024C4167D
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:39:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.182575.1698745145031511288
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 02:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WGLJlQpG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 048001C0002;
	Tue, 31 Oct 2023 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698745143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnpKekaIXPz7Ciloo8kdLE8vTzSjlciNirksV+3TJqY=;
	b=WGLJlQpGl/P9+ctFCTc2aFhE2/coGiilyhMfgz97A6zTyeYvkdlnsb4D4L5yUF9Ar9pBOY
	X2bDzmHyDjrprBS3Xa+aQSr7Q7tXWQpqpa06gGfjJlYrRqSxCGqQalITNv+0671hSmh1Dd
	hkWMPAKlLkKBmlWnMgRwNBNFZvGOKbzRxJnBgD72uylkJKsoPw8TUoM3tkbhvr17zGvZHK
	idBU1szL95Cdd9jJ/jr+hmuIjJTlw9Fr2AWLis/NHm2OEcwlHP4cNUnZfa/k/nLod92nT3
	U4lmd9utSlI1PyEDGu9Lsal7UhMgX3UaUw004v2sr6F4NxQEyxFlj0akbBix/g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 3/3] test-manual: reproducible-builds: stop mentioning LTO bug
Date: Tue, 31 Oct 2023 10:38:54 +0100
Message-Id: <20231031093854.1792471-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031093854.1792471-1-michael.opdenacker@bootlin.com>
References: <20231031093854.1792471-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:39:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4537

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Now that https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481
is closed.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/reproducible-builds.rst | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 50256fb197..23b6cfe9a4 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -68,17 +68,6 @@ things we do within the build system to ensure reproducibility include:
 -  Filtering the tools available from the host's ``PATH`` to only a specific set
    of tools, set using the :term:`HOSTTOOLS` variable.
 
-.. note::
-
-   Because of an open bug in GCC, using ``DISTRO_FEATURES:append = " lto"`` or
-   adding ``-flto`` (Link Time Optimization) to :term:`CFLAGS` makes the resulting
-   binary non-reproducible, in that it depends on the full absolute build path
-   to ``recipe-sysroot-native``, so installing the Yocto Project in a different
-   directory results in a different binary.
-
-   This issue is addressed by
-   :yocto_bugs:`bug 14481 -  Programs built with -flto are not reproducible</show_bug.cgi?id=14481>`.
-
 =========================================
 Can we prove the project is reproducible?
 =========================================
-- 
2.34.1


