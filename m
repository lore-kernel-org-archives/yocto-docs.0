Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E47C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.18022.1698154053970523383
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ALdqIT97;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81C7560005;
	Tue, 24 Oct 2023 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MNCQXFZqu1MY5YO8vrKSidJ8TU/T8uIn9Pqeb++jahc=;
	b=ALdqIT97j3xNDP/tlRD38ClIgVVNiSt/CuM+Rx4FDmACEL2k41azRZ/frm6RY4MWX+/rjx
	4WI4WOk6ylm0IyTkBfoMkOB0WxXxz9q94X2DXo+CDigv4l8JTMXbAfWBtM/ogHLFersFiW
	xk1KTm+4rW+vqsQ6FxxcWYNVQO/8XrmRx72wJQFOmEIDKLGHza9W1rAENmcIPJhkD/UIJr
	0RieLhJxFZ/p57Zz5krn/sqXkSRdLYgIyNIgvbx5kjXK6sa/b6baLBQRAYiZLJOPG24Y6W
	bnVivKxl2DUbZBxnohXiFAmVk7sJtxtK9PG7n0SXSIlrEwF4xAt1JtcrL2Op9Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [kirkstone][PATCH 14/16] ref-manual: variables: add RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE
Date: Tue, 24 Oct 2023 15:27:10 +0200
Message-Id: <20231024132712.90600-15-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4489

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELHADJ SALEM Talel <bhstalel@gmail.com>

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 38b13ecf8d..517c35d032 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6456,6 +6456,39 @@ system and gives an overview of their function and contents.
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
+   :term:`REPODIR`
+      See :term:`bitbake:REPODIR` in the BitBake manual.
+
    :term:`REQUIRED_DISTRO_FEATURES`
       When inheriting the
       :ref:`features_check <ref-classes-features_check>`
@@ -7690,10 +7723,15 @@ system and gives an overview of their function and contents.
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


