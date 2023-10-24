Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F68EC25B6C
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.17908.1698153824471544068
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A+QclLEd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04DEA1BF20E;
	Tue, 24 Oct 2023 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kRReMtct+dhI6n7zr9xqK6SupOEmNNLnvAlq6dU612A=;
	b=A+QclLEd+RzqESQCaJ7A0U/ndSMnuT69vvpJFS0Glh7Dk4bjZV9rdPRaVqf+nTnOoWu9n1
	Jo+jAZy1HCdqykTyNwRfSkE6pnkhA9R399JWb5qKlP7cp4Y/1XK3bVsD8bkvCFisR9ilbb
	PnAL4Z7uuE15TLpmNrsuz5lgGxRRXPjNNjY63ZlZF2hy2A8uMIbElOMXZYEs7JcTKhrB7T
	CPufMftoX2Z2YUYEwKf9ASB4doYx/NBobnn14zCjX49hcYOWrkC/KqT27TgRFrbFAqqgJd
	YEamSdFeeY4GVjhQPKPA4aSN6n/R66blQkEL/QVxIAsVFV4lRPmRehdlspaMBg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [mickledore][PATCH 11/13] ref-manual: variables: add RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE
Date: Tue, 24 Oct 2023 15:23:16 +0200
Message-Id: <20231024132318.90209-12-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
References: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4472

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELHADJ SALEM Talel <bhstalel@gmail.com>

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index eb19048db2..aab41fedb2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6832,6 +6832,36 @@ system and gives an overview of their function and contents.
       in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
       section.
 
+   :term:`RECIPE_SYSROOT`
+      This variable points to the directory that holds all files populated from
+      recipes specified in :term:`DEPENDS`. As the name indicates,
+      think of this variable as a custom root (``/``) for the recipe that will be
+      used by the compiler in order to find headers and other files needed to complete
+      its job.
+
+      This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
+      according to the type of the recipe and the build target.
+
+      To better understand this variable, consider the following examples:
+
+      -  For ``#include <header.h>``, ``header.h`` should be in ``"${RECIPE_SYSROOT}/usr/include"``
+
+      -  For ``-lexample``, ``libexample.so`` should be in ``"${RECIPE_SYSROOT}/lib"``
+         or other library sysroot directories.
+
+      The default value is ``"${WORKDIR}/recipe-sysroot"``.
+      Do not modify it.
+
+   :term:`RECIPE_SYSROOT_NATIVE`
+      This is similar to :term:`RECIPE_SYSROOT` but the populated files are from
+      ``-native`` recipes. This allows a recipe built for the target machine to
+      use ``native`` tools.
+
+      This variable is related to :term:`STAGING_DIR_NATIVE`.
+
+      The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
+      Do not modify it.
+
    :term:`REPODIR`
       See :term:`bitbake:REPODIR` in the BitBake manual.
 
@@ -8071,10 +8101,15 @@ system and gives an overview of their function and contents.
             for ``-native`` recipes, as they make use of host headers and
             libraries.
 
+      Check :term:`RECIPE_SYSROOT` and :term:`RECIPE_SYSROOT_NATIVE`.
+
    :term:`STAGING_DIR_NATIVE`
       Specifies the path to the sysroot directory used when building
       components that run on the build host itself.
 
+      The default value is ``"${RECIPE_SYSROOT_NATIVE}"``,
+      check :term:`RECIPE_SYSROOT_NATIVE`.
+
    :term:`STAGING_DIR_TARGET`
       Specifies the path to the sysroot used for the system for which the
       component generates code. For components that do not generate code,
-- 
2.34.1


