Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD8EC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:37:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.182204.1698745061662440362
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 02:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ie2T7lWD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE4E72000A;
	Tue, 31 Oct 2023 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698745059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6eT10Hh5Sbq/JO/AV+jjcJiIS2RbGIqJ2rnktXR1SY=;
	b=Ie2T7lWDN53k4sLsqH+2K1Hkp32HLn7Ee31oQaB2q1tOWx9HLo+oEE5Z3QQcUtbxKNtRJP
	CwInFBs0O5+T1swfulT8JUyDrXuQ23ZeFbqcakXMbz6WhcUrt0UQar9VWUaOZISgiCct8n
	QtepdrRhCs61ioYMBFm7hRzspRd7wOc2Jrnr7ZgBQzPDX0VkZ03iRALNbtCO0b6FEZntaf
	iihk6s5lfrjBhC6HBMkFm3Z5qTUBt7CVmJCMkBXCOjlKEe4RFo8v8y0ajsZP9gpk9HndU3
	ryswabncvUaaztKWp+XzGRhQJFNKTyvAowynHr7Y6qOorrIKJMpt4ItXowB2XA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 3/3] test-manual: reproducible-builds: stop mentioning LTO bug
Date: Tue, 31 Oct 2023 10:37:16 +0100
Message-Id: <20231031093716.1792379-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031093716.1792379-1-michael.opdenacker@bootlin.com>
References: <20231031093716.1792379-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:37:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4533

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Now that https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481
is closed.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/reproducible-builds.rst | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 5977366c9e..6994989f7c 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -68,17 +68,6 @@ things we do within the build system to ensure reproducibility include:
 -  Filtering the tools available from the host's ``PATH`` to only a specific set
    of tools, set using the :term:`HOSTTOOLS` variable.
 
-.. note::
-
-   Because of an open bug in GCC, using ``DISTRO_FEATURES:append = " lto"`` or
-   adding ``-flto`` (Link Time Optimization) to ``CFLAGS`` makes the resulting
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


