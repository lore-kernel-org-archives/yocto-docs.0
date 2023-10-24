Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB00C25B71
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.18020.1698154051357995893
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jrwibCAJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2988B6000A;
	Tue, 24 Oct 2023 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1D4DPzGZYrE0sp98RddOEoh9NhnMa6Ny4gJmDFdnux0=;
	b=jrwibCAJVKNa5WdSZu6iJKyyapsvwuNeRvKMpLYUPOZ0taMmMV/bt6jpmR8dCB4dTXFY+g
	efUekRr7yjJB2gcr3pOzrUvsfJm/j4GRXg0Tqbn3Hq6sgerKpR5Bp/hDNKnlXdOu9pLj0k
	9Tr+AqEGSJz4IGOkVOgKX8zffKZjFkyi+a/AfhCI7H5viCay9npa6zWsD4HEdLuwRVBmyL
	ZyK/Ci5YQs2E4StfOfUsH8HRMABpCQmJ7DNZc5lyoz2BI0q0InhIevHbP89Wrb9rK+PbhF
	K66FVNJN5l88aVxsdGLuc43zOGZdburgXGYiYBfsC2wbcx0YWSWTv5fN8d5fDA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [kirkstone][PATCH 08/16] ref-manual: Fix PACKAGECONFIG term and add an example
Date: Tue, 24 Oct 2023 15:27:04 +0200
Message-Id: <20231024132712.90600-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4484

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELHADJ SALEM Talel <bhstalel@gmail.com>

PACKAGECONFIG's first and second flag value will be added to PACKAGECONFIG_CONFARGS
and then it will be added to the appropriate variable (EXTRA_OECMAKE, or ...)
So we need to only mention PACKAGECONFIG_CONFARGS and it will lead to other variables.

I added a custom example that can help understanding very well PACKAGECONFIG.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 50 ++++++++++++++++++++------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0c573194e9..5d45f4a9f9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5548,25 +5548,23 @@ system and gives an overview of their function and contents.
       omit any argument you like but must retain the separating commas. The
       order is important and specifies the following:
 
-      1. Extra arguments that should be added to the configure script
-         argument list (:term:`EXTRA_OECONF` or
-         :term:`PACKAGECONFIG_CONFARGS`) if
-         the feature is enabled.
+      #. Extra arguments that should be added to :term:`PACKAGECONFIG_CONFARGS`
+         if the feature is enabled.
 
-      2. Extra arguments that should be added to :term:`EXTRA_OECONF` or
-         :term:`PACKAGECONFIG_CONFARGS` if the feature is disabled.
+      #. Extra arguments that should be added to :term:`PACKAGECONFIG_CONFARGS`
+         if the feature is disabled.
 
-      3. Additional build dependencies (:term:`DEPENDS`)
+      #. Additional build dependencies (:term:`DEPENDS`)
          that should be added if the feature is enabled.
 
-      4. Additional runtime dependencies (:term:`RDEPENDS`)
+      #. Additional runtime dependencies (:term:`RDEPENDS`)
          that should be added if the feature is enabled.
 
-      5. Additional runtime recommendations
+      #. Additional runtime recommendations
          (:term:`RRECOMMENDS`) that should be added if
          the feature is enabled.
 
-      6. Any conflicting (that is, mutually exclusive) :term:`PACKAGECONFIG`
+      #. Any conflicting (that is, mutually exclusive) :term:`PACKAGECONFIG`
          settings for this feature.
 
       Consider the following :term:`PACKAGECONFIG` block taken from the
@@ -5613,6 +5611,38 @@ system and gives an overview of their function and contents.
 
             PACKAGECONFIG:append:pn-recipename = " f4"
 
+      Consider the following example of a :ref:`ref-classes-cmake` recipe with a systemd service
+      in which :term:`PACKAGECONFIG` is used to transform the systemd service
+      into a feature that can be easily enabled or disabled via :term:`PACKAGECONFIG`::
+
+         example.c
+         example.service
+         CMakeLists.txt
+
+      The ``CMakeLists.txt`` file contains::
+
+         if(WITH_SYSTEMD)
+            install(FILES ${PROJECT_SOURCE_DIR}/example.service DESTINATION /etc/systemd/systemd)
+         endif(WITH_SYSTEMD)
+
+      In order to enable the installation of ``example.service`` we need to
+      ensure that ``-DWITH_SYSTEMD=ON`` is passed to the ``cmake`` command
+      execution.  Recipes that have ``CMakeLists.txt`` generally inherit the
+      :ref:`ref-classes-cmake` class, that runs ``cmake`` with
+      :term:`EXTRA_OECMAKE`, which :term:`PACKAGECONFIG_CONFARGS` will be
+      appended to.  Now, knowing that :term:`PACKAGECONFIG_CONFARGS` is
+      automatically filled with either the first or second element of
+      :term:`PACKAGECONFIG` flag value, the recipe would be like::
+
+         inherit cmake
+         PACKAGECONFIG = "systemd"
+         PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF"
+
+      A side note to this recipe is to check if ``systemd`` is in fact the used :term:`INIT_MANAGER`
+      or not::
+
+         PACKAGECONFIG = "${@'systemd' if d.getVar('INIT_MANAGER') == 'systemd' else ''}"
+
    :term:`PACKAGECONFIG_CONFARGS`
       A space-separated list of configuration options generated from the
       :term:`PACKAGECONFIG` setting.
-- 
2.34.1


