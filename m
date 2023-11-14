Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36324C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 16:49:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.17621.1699980590913967658
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 08:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HdfH4a6Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3B841BF206;
	Tue, 14 Nov 2023 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699980589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJm5YiogIAOcRDuHowBijcCL6DA4ujzKsy7PkgBswd4=;
	b=HdfH4a6Qmupm6eANvOS2XVP98ZApmtrEz4D34jD0nmuU9HctQBkLz0mp/6lMEvNcktMecF
	LUpNDfLe1hD6HKGQrpjBF2lSJBT0OCjUWbdg3IvziUIt0kYw7r99ntYn5ht3+iZdjc99yr
	CBZX7yP+ZwfHPRM/X8SXZqB42eBFm+UC0iVuwXOeg7mqHEn86J1yY/LGFzR7zGv2WUWZbq
	KIskDoLh23BGqFB9iLkoWhxedFLNFxpnGBcWrupFakSo/ESc2nZKkTPNw2+crHNZxgV53f
	/4rxRjhBjgpPbEqD1hBYPdcNwz2z0aC3zahoBl250rAAIgxkIPbozJjfB7saVg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 1/7] ref-manual: variables: document OEQA_REPRODUCIBLE_* variables
Date: Tue, 14 Nov 2023 17:49:36 +0100
Message-Id: <20231114164942.133472-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
References: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 16:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4621

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 827c94acd4..58a763cb3a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5185,6 +5185,20 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
+      Set the package manager(s) for build reproducibility testing.
+      See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`
+      and :doc:`/test-manual/reproducible-builds`.
+
+   :term:`OEQA_REPRODUCIBLE_TEST_TARGET`
+      Set build target for build reproducibility testing. By default
+      all available recipes are compiled with "bitbake world", see also :term:`EXCLUDE_FROM_WORLD`
+      and :doc:`/test-manual/reproducible-builds`.
+
+   :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`
+      Set build targets which can be rebuilt using :ref:`shared state <overview-manual/concepts:shared state cache>`
+      when running build reproducibility tests. See :doc:`/test-manual/reproducible-builds`.
+
    :term:`OLDEST_KERNEL`
       Declares the oldest version of the Linux kernel that the produced
       binaries must support. This variable is passed into the build of the
-- 
2.34.1


