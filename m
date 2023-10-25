Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71CAC0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 14:56:08 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.175626.1698245764955845631
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 07:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kqypgbi0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E4071C0007;
	Wed, 25 Oct 2023 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698245762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xxhkh0sRoXZpJ2kSWunvJDT314yyJSpeyr48RcU/eSU=;
	b=kqypgbi06Fm8rpte5YqQIKT8RiBmEU9KU1qU2Xxp675/IMLsqOZf8xGq++f/4kaXh1XFXh
	spe4cdECOo0XbCCdr20+Qy260DhPqEBBdzyNeeXn++eihg1umX6WjzVlEHxDtCsKrEtbVN
	NKDX0IvJA50PTDVKZ9TfKIPdEsBh2Q5OzZjGYhpHd89SYKM1hH+ZDjacFgOwGRAeA/NytO
	mcrHetJMi61O+ulg7hxwu7dHZjBtqUo3UMrLZei3icQGNFzp2FTbdiLV15tB/DtCP4e408
	kGK+epzL0GPH0DkV8k8IMY6J33d06Hcopt4JIrqOctp/qf9tEgdQ0oQI/VWrWw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] test-manual: reproducible-builds: stop mentioning LTO bug
Date: Wed, 25 Oct 2023 16:55:58 +0200
Message-Id: <20231025145558.27518-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Oct 2023 14:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4502

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Now that https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481
is closed.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/reproducible-builds.rst | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index d4b828b2d6..91f94a5c74 100644
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


