Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1140FA3745
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:19:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.4597.1666952390112469888
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 03:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=a9jTAy9h;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A400640009;
	Fri, 28 Oct 2022 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666952388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMK6ESoEG5IXlcK1syeP1dYCG/hfFNDy/U42B5dl6so=;
	b=a9jTAy9huniABLFQf7tWM3L68oqJ1vYsw8z7Ufigxf9D9bbKjN43vTfyKzL8h5E9DOiKUy
	3agRyeiWoDz0tDMAuswT7KSkpmis9oAfmM7pj2p+fcbrO8Yoj1QiWy4yDYdC3ddlDjKDk5
	YwQ0J7MCxQc87Y4I92O9OcTUZiBYS2L13IbaceSSxHwACWX+wZhrZntLXj1HDZrupJQrEc
	il5PCKbmd5pdJDb4Z8tGZMktWEkdbQm97b+Kduo7HOMFwioyGgw97GWVFAJltfWVRE3fI1
	ZR5hW3NirfAXbUi9TWC36jJl7W8cQPAvsd+uHP+Eoggt9Ri/7vxw/6B4TxdfqQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/5] dev-manual: common-tasks.rst: add section about SPDX / SBOM generation
Date: Fri, 28 Oct 2022 12:19:37 +0200
Message-Id: <20221028101939.93195-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
References: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 10:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3434

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also stop refering to the meta-spdxscanner class, no longer
relevant.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 96 ++++++++++++++---------
 1 file changed, 61 insertions(+), 35 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 25d7edbc29..263a1d302b 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11236,8 +11236,6 @@ to be covered by assuming that there are three main areas of concern:
 -  Compilation scripts and modifications to the source code must be
    provided.
 
--  spdx files can be provided.
-
 There are other requirements beyond the scope of these three and the
 methods described in this section (e.g. the mechanism through which
 source code is distributed).
@@ -11429,39 +11427,6 @@ layers (recipes, configuration files, and so forth) enables you to meet
 your requirements to include the scripts to control compilation as well
 as any modifications to the original source.
 
-Providing spdx files
-~~~~~~~~~~~~~~~~~~~~~~~~~
-
-The spdx module has been integrated to a layer named meta-spdxscanner.
-meta-spdxscanner provides several kinds of scanner. If you want to enable
-this function, you have to follow the following steps:
-
-1. Add meta-spdxscanner layer into ``bblayers.conf``.
-
-2. Refer to the README in meta-spdxscanner to setup the environment (e.g,
-   setup a fossology server) needed for the scanner.
-
-3. Meta-spdxscanner provides several methods within the bbclass to create spdx files.
-   Please choose one that you want to use and enable the spdx task. You have to
-   add some config options in ``local.conf`` file in your :term:`Build
-   Directory`. Here is an example showing how to generate spdx files
-   during BitBake using the fossology-python.bbclass::
-
-      # Select fossology-python.bbclass.
-      INHERIT += "fossology-python"
-      # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
-      # Fossology server, you have to create a token.
-      TOKEN = "eyJ0eXAiO..."
-      # The fossology server is necessary for fossology-python.bbclass.
-      FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
-      # If you want to upload the source code to a special folder:
-      FOLDER_NAME = "xxxx" //Optional
-      # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
-      SPDX_DEPLOY_DIR = "${DEPLOY_DIR}" //Optional
-
-For more usage information refer to :yocto_git:`the meta-spdxscanner repository
-</meta-spdxscanner/>`.
-
 Compliance Limitations with Executables Built from Static Libraries
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -11711,6 +11676,67 @@ When analyzing CVEs, it is recommended to:
 -  follow public `open source security mailing lists <https://oss-security.openwall.org/wiki/mailing-lists>`__ for
    discussions and advance notifications of CVE bugs and software releases with fixes.
 
+Creating a Software Bill of Materials
+=====================================
+
+Once you are able to build an image for your project, once the licenses for
+each software component are all identified (see
+":ref:`dev-manual/common-tasks:working with licenses`") and once vulnerability
+fixes are applied (see ":ref:`dev-manual/common-tasks:checking
+for vulnerabilities`"), the OpenEmbedded build system can generate
+a description of all the components you used, their licenses, their dependencies,
+the changes that were applied and the known vulnerabilities that were fixed.
+
+This description is generated in the form of a *Software Bill of Materials*
+(:term:`SBOM`), using the :term:`SPDX` standard.
+
+When you release software, this is the most standard way to provide information
+about the Software Supply Chain of your software image and SDK, and allow your
+users and customers to perform vulnerability and license compliance assessments,
+using the tools of their choice.
+
+The OpenEmbedded build system doesn't generate such information by default.
+To make this happen, you must inherit the
+:ref:`create-spdx <ref-classes-create-spdx>` class from a configuration file::
+
+   INHERIT += "create-spdx"
+
+You then get :term:`SPDX` output in JSON format as an
+``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside the
+:term:`Build Directory`.
+
+This is a toplevel file accompanied by an ``IMAGE-MACHINE.spdx.index.json``
+containing an index of JSON :term:`SPDX` files for individual recipes, together
+with an ``IMAGE-MACHINE.spdx.tar.zst`` compressed archive containing all such
+files.
+
+The :ref:`create-spdx <ref-classes-create-spdx>` class offers options to include
+more information in the output :term:`SPDX` data, such as making the generated
+files more human readable (:term:`SPDX_PRETTY`), adding compressed archives of
+the files in the generated target packages (:term:`SPDX_ARCHIVE_PACKAGED`),
+adding a description of the source files handled by the target recipes
+(:term:`SPDX_INCLUDE_SOURCES`) and adding archives of these source files
+themselves (:term:`SPDX_ARCHIVE_SOURCES`).
+
+Though the toplevel :term:`SPDX` output is available in
+``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
+generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such as:
+
+-  The individual :term:`SPDX` JSON files in the ``IMAGE-MACHINE.spdx.tar.zst``
+   archive.
+
+-  Compressed archives of the files in the generated target packages,
+   in ``packages/packagename.tar.zst`` (when :term:`SPDX_ARCHIVE_PACKAGED`
+   is set).
+
+-  Compressed archives of the source files used to build the host tools
+   and the target packages in ``recipes/recipe-packagename.tar.zst``
+   (when :term:`SPDX_ARCHIVE_SOURCES` is set).
+
+See the `tools page <https://spdx.dev/resources/tools/>`__ on the :term:`SPDX`
+project website for a list of tools to consume and transform the :term:`SPDX`
+data generated by the OpenEmbedded build system.
+
 Using the Error Reporting Tool
 ==============================
 
-- 
2.34.1


