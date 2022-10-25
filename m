Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A8FC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 16:00:50 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.8866.1666713642696624995
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 09:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U6AJCusx;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C7C85100010;
	Tue, 25 Oct 2022 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666713640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RjCZBshd1XIXFYBWEoXV7R5PZ+FBIqJHFN1lA1tSCNg=;
	b=U6AJCusxYbtYYIzzlxOyL9X4SeynvTcZso5Z/Wfyq4tpDK5OscqH1l8+9VUHyiivL/iaRX
	pIZHfQ/Btb5itfykI/EmQQaW8v7SI6ZwRRXuMt0wUjeTfL/qw0eMsDPJ2vqEdw6Wn+A1WX
	sFW3GnNpe/j0WUSz1kAAZNEBpzOpqwG3R97VcRGqylyfW1MdK5/pDZcHak1JYQV5gk9+SA
	KaHHXhMGiN0TCGXa+LpoBJzjJVgn8PSBAGPjaaKJzuLDFXLfXp4cTkZXvsgAnUgDXncmxZ
	1FfZt9CNifL5QtI3GUtm+S36AkUISCy3a/oOR2zZNXRIK97rEESzp5zTHg5BvA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC PATCH] ref-manual: document create-spdx class and variables
Date: Tue, 25 Oct 2022 18:00:14 +0200
Message-Id: <20221025160014.2858893-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 16:00:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3401

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 11 ++++
 documentation/ref-manual/variables.rst | 71 ++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 1880e44486..5274dd20bd 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -376,6 +376,17 @@ support.
 The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for automatically creating
 SPDX SBoM documents based upon image and SDK contents.
 
+This class is meant to be inherited globally from a configuration file::
+
+   INHERIT += "create-spdx"
+
+The output files are generated in ``tmp/deploy/spdx`` under the
+:term:`Build Directory`.
+
+The exact behaviour of this class can be controlled by the :term:`SPDX_PRETTY`,
+:term:`SPDX_ARCHIVE_PACKAGED`, :term:`SPDX_ARCHIVE_SOURCES` and
+:term:`SPDX_INCLUDE_SOURCES` variables.
+
 .. _ref-classes-cross:
 
 ``cross.bbclass``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71e8c272a7..60d801932e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7278,6 +7278,77 @@ system and gives an overview of their function and contents.
 
          You can specify only a single URL in :term:`SOURCE_MIRROR_URL`.
 
+   :term:`SPDX_ARCHIVE_PACKAGED`
+      This option allows to add to the SPDX output directory
+      compressed archives of the files in the generated target packages.
+
+      Such archives are available in
+      ``tmp/deploy/spdx/MACHINE/packages/packagename.tar.zst``
+      under the :term:`Build Directory`.
+
+      Enable this option as follows::
+
+         SPDX_ARCHIVE_PACKAGED = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      this option multiplied the size of the ``tmp/deploy/spdx``
+      directory by a factor of 13 (+1.6 GiB for this image),
+      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
+      class with no option.
+
+   :term:`SPDX_ARCHIVE_SOURCES`
+      This option allows to add to the SPDX output directory compressed archives
+      of the sources for packages installed on the target. It currently
+      only works when :term:`SPDX_INCLUDE_SOURCES` is set.
+
+      Such archives are available in
+      ``tmp/deploy/spdx/MACHINE/recipes/recipe-packagename.tar.zst``
+      under the :term:`Build Directory`.
+
+      Enable this option as follows::
+
+	 SPDX_INCLUDE_SOURCES = "1"
+         SPDX_ARCHIVE_SOURCES = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      these options multiplied the size of the ``tmp/deploy/spdx``
+      directory by a factor of 11 (+1.4 GiB for this image),
+      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
+      class with no option.
+
+   :term:`SPDX_INCLUDE_SOURCES`
+      This option allows to add a description of the source
+      files handled by the target recipes, to the ``spdx.json`` files in
+      ``tmp/deploy/spdx/MACHINE/recipes/`` under the
+      :term:`Build Directory`. As a consequence, the ``spdx.json`` files
+      under the ``by-namespace`` and ``packages`` subdirectories
+      in ``tmp/deploy/spdx/MACHINE`` are also modified to include
+      references to such source file descriptions.
+
+      Enable this option as follows::
+
+         SPDX_INCLUDE_SOURCES = "1"
+
+      According to our tests on release 4.1 "langdale", building
+      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
+      this option multiplied the size of the ``tmp/deploy/spdx``
+      directory by a factor of 3  (+291 MiB for this image),
+      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
+      class with no option.
+
+   :term:`SPDX_PRETTY`
+      This option makes the SPDX output more human-readable, using
+      identation and newlines, instead of the default output in a
+      single line::
+
+         SPDX_PRETTY = "1"
+
+      The generated SPDX files are approximately 20% bigger, but
+      this option is recommended if you want to inspect the SPDX
+      output files with a text editor.
+
    :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
       ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
-- 
2.34.1


