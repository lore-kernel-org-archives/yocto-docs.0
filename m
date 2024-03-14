Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0106CC54E68
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:15:25 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8373.1710407719646989293
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P2Av8Mt6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D28220002;
	Thu, 14 Mar 2024 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d0i+58X2Lf183VKlkly0UFB/pQFAw3+hoKPbLs8rE44=;
	b=P2Av8Mt6ay0QBCI/WKMEXTmTB4am24J7OxLcBc/99QU92QEcmez0OQB5UrkE90lNdZLLeb
	IA18i/fKCH6Xtgiufcwkjh9g1DhPeqXGe/2OMvgXEPOgQ19ZCNQlWarZpS/ervxEQQRPvl
	T7q2UpcI5Y0ArfB0etvl8xU1tZFDV1AiAKlmAl+Vd+wMlob87yL+588U8UbNl29D3YyEzZ
	7Ek3JbgMTUqH0QoPJX/wWc/3sWih7yos6o6fa6qVIwFkNmxt2cK75kmWyY9lwv+5kfaCLV
	KGkOVs8vH0uvhMBYgqbMpPO0ssHBTxv1p9dpWn9Ulb+f7qhS0E7SVD7AMrR3iA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [nanbield][PATCH 6/7] contributor-guide: add notes for tests
Date: Thu, 14 Mar 2024 10:15:07 +0100
Message-Id: <20240314091508.84166-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
References: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4974

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Simone Weiß <simone.p.weiss@posteo.com>

This adds some hints that and how changes should be tested when contributing.

Fixes [YOCTO #15412]

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/submit-changes.rst      | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 61f3157d60..59f3c1e406 100644
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
 
@@ -285,8 +317,9 @@ Validating Patches with Patchtest
 ``patchtest`` is available in ``openembedded-core`` as a tool for making
 sure that your patches are well-formatted and contain important info for
 maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
-tags. Currently, it only supports testing patches for
-``openembedded-core`` branches. To setup, perform the following::
+tags. Note that no functional testing of the changes will be performed by ``patchtest``.
+Currently, it only supports testing patches for ``openembedded-core`` branches.
+To setup, perform the following::
 
     pip install -r meta/lib/patchtest/requirements.txt
     source oe-init-build-env
-- 
2.34.1


