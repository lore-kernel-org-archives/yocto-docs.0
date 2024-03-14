Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8E2C54E69
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:14:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8366.1710407653913476240
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hs116Jqj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ED8B24000C;
	Thu, 14 Mar 2024 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxlJscNJvEv9EPqEmVoz3eH6Qa2VzNEpFVqX2LLVhvY=;
	b=Hs116JqjkyXffrMEXhGARyQmDsf5/ThNHydhOaH+I8E2rYdxOeodsSR7e9MG6LJ8WwCCMC
	p22yRwXmZyer8ooapdkY6i6+X2L76Owz5MvTR5wZiNHYeb+ApOV+SwLZ3ajHUQinQkMpJy
	UrAAOKCxkFvSrW/P6CawZj9CMc2yNPG9VWZ/ZxLN/AU6fcjpkiMPG7BC6yWr8pqhs9yLMR
	HdSSi35J4Few3U4Nt+HN1vZAPnedpJQHc49S5JjIgwyx6HFZ9QYSXbLFPq0VI/4l52yKUo
	5Ec5jPdT1nATjWHs5w1oYXOI/yJAAdFxLtt6eLhM87iN6CvFg9PmjCsW0pVzYw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [kirkstone][PATCH 7/8] contributor-guide: add notes for tests
Date: Thu, 14 Mar 2024 10:13:57 +0100
Message-Id: <20240314091358.84025-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
References: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4966

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Simone Weiß <simone.p.weiss@posteo.com>

This adds some hints that and how changes should be tested when contributing.

Fixes [YOCTO #15412]

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/submit-changes.rst      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 319f41b51f..c0f2aa7cb4 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -221,6 +221,38 @@ to add the upgraded version.
    <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>`__
    in the Linux kernel documentation.
 
+Test your changes
+-----------------
+
+For each contributions you make, you should test your changes as well.
+For this the Yocto Project offers several types of tests. Those tests cover
+different areas and it depends on your changes which are feasible. For example run:
+
+   -  For changes that affect the build environment:
+
+      -  ``bitbake-selftest``: for changes within BitBake
+
+      -  ``oe-selftest``: to test combinations of BitBake runs
+
+      -  ``oe-build-perf-test``: to test the performance of common build scenarios
+
+   -  For changes in a recipe:
+
+      - ``ptest``: run package specific tests, if they exist
+
+      - ``testimage``: build an image, boot it and run testcases on it
+
+      - If applicable, ensure also the ``native`` and ``nativesdk`` variants builds
+
+   -  For changes relating to the SDK:
+
+      - ``testsdk``: to build, install and run tests against a SDK
+
+      - ``testsdk_ext``: to build, install and run tests against an extended SDK
+
+Note that this list just gives suggestions and is not exhaustive. More details can
+be found here: :ref:`test-manual/intro:Yocto Project Tests --- Types of Testing Overview`.
+
 Creating Patches
 ================
 
-- 
2.34.1


