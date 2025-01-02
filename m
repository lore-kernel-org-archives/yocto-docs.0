Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CA5E77194
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.5187.1735810867074813923
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jan 2025 01:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HR9yadyo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1CB91C0005;
	Thu,  2 Jan 2025 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735810865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anvHjHObOQ79sVSeZti1dO7/AJCIFEw1xSCVVO5bVQo=;
	b=HR9yadyo6mnQK9w8L4XPd5DfZCRuZnXSY7pP0Br2ArVitoTvQhV3aMnFPypX7d8bMv/LZt
	sUdd3H/V3KY6yuslHQtDwe0+4X1MQwWPt5W3KiQ7xIUukgpK2h1cXOB19phAg8IFPRatmc
	Nz/zO6y37cY/QxcjdSl2MkB9jj6BmB74+ZBBHNHwxvLCGcvMgUyVPPKCi/wzjCA0Xxw4Jm
	GFFHjg8TqCQoSalMsaNx3MyGthqrS/t2UcxDQHN6RCkvhE8XlU0AGn2xduQR+EOgH46HiE
	LT6PmCInVTapYKoacSc0rLt9yAiA081aY7x9GrBwbX9nuYgL3wLPPKxUJJdeoA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 02 Jan 2025 10:40:43 +0100
Subject: [PATCH v2 2/2] dev-manual/devtool: remove reference to the
 extensible SDK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-devtool-dev-manual-v2-2-db3fcb81b938@bootlin.com>
References: <20250102-devtool-dev-manual-v2-0-db3fcb81b938@bootlin.com>
In-Reply-To: <20250102-devtool-dev-manual-v2-0-db3fcb81b938@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3004;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6IE51eeYLRlECRoFF5Wec5+3Dim8Iw0MNGccfQsrxXc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBndl8wX3hLOPd0xGJauGMP87sUSsmxEQgNpsO+i
 vdIx0PnWLOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ3ZfMAAKCRDRgEFAKaOo
 Ngn3EAC9f2CdbdUYfK5eyWKE2b/scofkt5xv+WMorcewAfLykWa1u3e1QRz2fmABeSUragkrZpQ
 zuvAZxbsW5Qff7DcZVnuC2EPnUiuuR0wH7EvnmydgsRlhs9mJbU2PtRGTnSiW7N9ABVcQgG9jUB
 qof2ZUV3wojeDQku36ViERBNZmcXDOjjr8Y5o1bslT23rda7tqlqDTxjvi1tGxwnCmRCBNtmnrE
 q2RNNYaAgySeHBEOckGGC+ZKWkYR2JGw3pPnaS7Ktgu6T15SmwsF6OP+Ftc1nOr93X4+Yux2CtJ
 XbrYmoYTKHmpoOC7tku3NGRBri2cPDQ9tyeSqTb9lt4VgADDQ88kMQJzbUHlQaOVkxNrgAFKKvI
 HZ9vY4n/gMBoJ5ejAIpe8YiHbMmfbcR4EUhCh29ElZmbnivdLkRdsuWMBD3Dhy+bpceZAJgpDwI
 E2E7oD6jSzpNEtEbPQTnIsK+fEgp+eRUlKfh46YMlUbDiUFbVcy9laDIMUWYKKB8BspAiErxZ8Z
 3ry0QSZy3AU8tBjEpMxj4j/DKjaIMQiA0zHsNkFcEFNxsrSGFQgakWI21N0iZk/lnh2JBRlvGKk
 ngxxQSqATLkT7KdliQ/P7qpJbEyr6Bespvm0/RPDbg7TgSREIDhp2WhzY7KQA1dYnhWBNxlnIpl
 bs5hDfOq2fR5n5Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jan 2025 09:41:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6052

There were leftover references to the extensible SDK after moving the
devtool documentation from the Extensible SDK document to its own
devtool document.

This patch follows the bulk move to make it clear what was modified in
the document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/devtool.rst | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index 4b91cf0f47201679b1db93261060b04db3ac53d6..f8820bbe17dd26e16ce713e3704745e802608335 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -678,7 +678,8 @@ mind:
 
 -  The environment in which Make runs is set up with various standard
    variables for compilation (e.g. :term:`CC`, :term:`CXX`, and so forth) in a
-   similar manner to the environment set up by the SDK's environment
+   similar manner to the environment set up by an :ref:`SDK
+   <overview-manual/concepts:Application Development SDK>`'s environment
    setup script. One easy way to see these variables is to run the
    ``devtool build`` command on the recipe and then look in
    ``oe-logs/run.do_compile``. Towards the top of this file, there is
@@ -764,9 +765,6 @@ these behaviors ensure the reproducibility and integrity of the build.
       ``devtool add`` does not receive the other parts, which results in
       several "command not found" errors.
 
-   -  In order to support adding Node.js modules, a ``nodejs`` recipe
-      must be part of your SDK.
-
 As mentioned earlier, you can also add Node.js modules directly from a
 repository or local source tree. To add modules this way, use
 ``devtool add`` in the following form::
@@ -874,10 +872,8 @@ Recipes often need to use files provided by other recipes on the
 :term:`Build Host`. For example,
 an application linking to a common library needs access to the library
 itself and its associated headers. The way this access is accomplished
-within the extensible SDK is through the sysroot. There is one sysroot per
-"machine" for which the SDK is being built. In practical terms, this
-means there is a sysroot for the target machine, and a sysroot for
-the build host.
+is through the :term:`Sysroot`. There is a sysroot for the target machine, and a
+sysroot for the build host.
 
 Recipes should never write files directly into the sysroot. Instead,
 files should be installed into standard locations during the
@@ -891,8 +887,7 @@ remain free from stale files.
 Packaging
 ---------
 
-Packaging is not always particularly relevant within the extensible SDK.
-However, if you examine how build output gets into the final image on
+If you examine how build output gets into the final image on
 the target device, it is important to understand packaging because the
 contents of the image are expressed in terms of packages and not
 recipes.

-- 
2.47.1


