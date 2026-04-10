Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566CAF459ED
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158226.1775832229481285589
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HVi7wfIu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A81A3C5C1B0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A62B603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDFE510450023;
	Fri, 10 Apr 2026 16:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qmaclajVVbo7TqOiri6ukyJETnHi2YvdMz0AFzub17M=;
	b=HVi7wfIurxvoF/fDLAZY1txiFtTH1BhY8JuGRUqfRiH93TAMS07BBeLMkA7oLDN9QLk3D8
	Fb0pBm6F5+6Mw2gFpqo8BwIW1dZLCD8LvrWbxrUgh7QCWhkl5Aiu1rEgcljmo3a489IQuY
	XoZi2tjzneXPMcRHeK0Bvfw7hAnjjPqJ1ReEMEDIF+HBDOTgnf8R7ogQjik44Kd+xRleDn
	mnVD0Wt2bUOnofxSlGpBVqwkwQ9En9KdQwYZmnYpDWUmjh+D2fnrTBCIRy0uqAPx5aiCXO
	bndr5NDNgRKtecE3mg/1uqHzI9Ji770DFLEdFheIMZonzNx9aAe7dlL8xfOKDQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:36 +0200
Subject: [PATCH 12/18] ref-manual: document the sbom-cve-check class,
 fragment, and variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-12-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6684;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1BkXV85LRrwqEgqA3plYgwDGcRO2Ya3OrPZUfJvp8Yo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyYT8Wknt38YHcFJzwifiIbw5qUjTopnm3zC
 pYGYbT0ibqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMmAAKCRDRgEFAKaOo
 NhN4EAC+Y3VimySoDxbZn6Ro7qRvHI/MKAaRhfFV03j7PS4Vq5WiZhzwTQTyl0U0pTzFe69w/QW
 DFj5YNe1DSnv8/EO1PfhytLpI8tKONMGmgNXwx3kwMpSLb/+uSUWKGLfsLuyXnkfptdaunAUB/c
 zSntfNiY4b67QhD6r98plx5Nimso+JmfOmr5tFGIt6gs8dHmAiE/BSmvHcrt7xwQE0yXKwQ3AHt
 tDnhIGH6K/8PUuUNAnhXd9Y0uXtpkwl5rBypgELAE+X3XGCes9wFvkWmEP8TlLkqKKQID0sAw5x
 HQFfB6VD5EEviWQDUkh/Uo33gKiDGyKDzHyfbkeaE8gGDybWY3zjLkHHzWU+IN1PaY4V6peEKwH
 Vc3OtwBN+ZdSfNoRdm48wHZ0mZtjnEQrnNpBhZ9idFeUdrnfM8ATU5rFaMhTkZYYcKH7Fx20w1i
 sHem07oTJXu0f/30o4PpAoyuKMk+inm4bg0rYy1GpSTsRzVzPuH1YZYapSox00bq8bLAHxP3eUg
 guW8FbnIcaRAGiw9ktfbk+9rtn19HxOh4AcfIeiw5BlOB393eWVGbfrsOYJx262GJe2hR7VCKrV
 yg3r9fh/SojN3B3WB8CTsDWhNPL3mCYy7kAL7h5HqQjgs/m+lydks8++xpr2gZZZLg9TebNtEoS
 Rn5q81CIosyv2bA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9243

Added by commit 8ef22ad9e302 ("sbom-cve-check: Add class for
post-build CVE analysis") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 55 ++++++++++++++++++++++++++++++++++
 documentation/ref-manual/fragments.rst | 20 +++++++++++++
 documentation/ref-manual/variables.rst | 38 +++++++++++++++++++++++
 3 files changed, 113 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index d29339491..5a119da71 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2760,6 +2760,61 @@ configuration checks from the ``local.conf`` configuration file to
 prevent common mistakes that cause build failures. Distribution policy
 usually determines whether to include this class.
 
+.. _ref-classes-sbom-cve-check:
+
+``sbom-cve-check``
+==================
+
+The :ref:`ref-classes-sbom-cve-check` class uses the `sbom-cve-check
+<github.com/bootlin/sbom-cve-check>`__ command-line tool for post-build CVE
+analysis. It relies on the :ref:`ref-classes-create-spdx` class as SPDX files
+are the input of this tool.
+
+This class should be enabled through the :ref:`ref-fragments-core-yocto-sbom-cve-check`
+fragment:
+
+.. code-block:: console
+
+   $ bitbake-config-build enable-fragment core/yocto/sbom-cve-check
+
+After building an image, ``sbom-cve-check`` will generate one or more reports in
+the :term:`DEPLOY_DIR_IMAGE` directory depending on the current value of
+:term:`SBOM_CVE_CHECK_EXPORT_VARS`.
+
+See the variables starting with ``SBOM_CVE_CHECK_`` in the :doc:`Yocto Project
+Reference Manual glossary </ref-manual/variables>` to learn more on how to
+configure the behavior of this class.
+
+.. _ref-classes-sbom-cve-check-recipe:
+
+``sbom-cve-check-recipe``
+=========================
+
+The :ref:`ref-classes-sbom-cve-check-recipe` class uses the `sbom-cve-check
+<github.com/bootlin/sbom-cve-check>`__ command-line tool for post-build CVE
+analysis of a recipe. It relies on the :ref:`ref-classes-create-spdx` class as
+SPDX files are the input of this tool.
+
+This class can be inherited in any recipe. Compared to the
+:class:`ref-classes-sbom-cve-check` class, this class only uses the SBOM of the
+recipe (after the ``create_recipe_sbom`` is run) to determine which is the
+underlying software and do the analysis, meaning that building the recipe itself
+isn't necessary.
+
+To use this class, inherit it in the recipe and run:
+
+.. code-block:: console
+
+   $ bitbake <recipe> -c sbom_cve_check_recipe
+
+After running the command, ``sbom-cve-check`` will generate one or more reports
+in the :term:`DEPLOY_DIR_IMAGE` directory depending on the current value of
+:term:`SBOM_CVE_CHECK_EXPORT_VARS`.
+
+See the variables starting with ``SBOM_CVE_CHECK_`` in the :doc:`Yocto Project
+Reference Manual glossary </ref-manual/variables>` to learn more on how to
+configure the behavior of this class.
+
 .. _ref-classes-scons:
 
 ``scons``
diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index 9449f4648..8da14a038 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -204,6 +204,26 @@ The ``core/yocto/root-login-with-empty-password`` :term:`configuration fragment`
 can be used to allow to login as the ``root`` user to login without a password
 on the serial console and over SSH.
 
+.. _ref-fragments-core-yocto-sbom-cve-check:
+
+``core/yocto/sbom-cve-check``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``core/yocto/sbom-cve-check`` :term:`configuration fragment` can be used
+to set up the build to use the :ref:`ref-classes-sbom-cve-check` class .
+
+This configuration fragment does multiple things:
+
+-  Add the :ref:`ref-classes-create-spdx` class to the list of globally
+   inherited classes, as it depends on it.
+
+-  Sets the source revision (:term:`SRCREV`) of the input CVE databases to
+   :term:`AUTOREV`, so these databases are automatically fetched and updated
+   when starting a build.
+
+-  Include the VEX statements to the input SPDX document using the
+   :term:`SPDX_INCLUDE_VEX` variable.
+
 Yocto Project Autobuilder Fragments
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b698e865f..d8cadef3e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8742,6 +8742,44 @@ system and gives an overview of their function and contents.
       list, then the build system reports a warning that indicates the
       current host distribution has not been tested as a build host.
 
+   :term:`SBOM_CVE_CHECK_EXPORT_VARS`
+      When inheriting the :ref:`ref-classes-sbom-cve-check` class, this variable
+      holds the list of variables that declare export files to generate.
+
+      Each variable must have a ``type`` and an ``ext`` flag set:
+
+      -  The ``type`` flag contains the value that is passed to the
+         ``--export-type`` command line argument of ``sbom-cve-check``.
+
+      -  The ``ext`` flag contains the filename extension (suffix). The output
+         filename is going will be ``${IMAGE_NAME}${ext}``.
+
+      For example::
+
+         SBOM_CVE_CHECK_EXPORT_VARS = "SBOM_CVE_CHECK_EXPORT_SPDX3"
+         SBOM_CVE_CHECK_EXPORT_SPDX3[type] = "spdx3"
+         SBOM_CVE_CHECK_EXPORT_SPDX3[ext] = ".sbom-cve-check.spdx.json"
+
+   :term:`SBOM_CVE_CHECK_EXTRA_ARGS`
+      When inheriting the :ref:`ref-classes-sbom-cve-check` class, this variable
+      can be used to pass extra arguments to the ``sbom-cve-check`` command-line
+      tool.
+
+      See the `documentation <https://sbom-cve-check.readthedocs.io/en/latest/index.html>`__
+      of ``sbom-cve-check`` for more information.
+
+   :term:`SBOM_CVE_CHECK_SCAN_SCOPE`
+      When inheriting the :ref:`ref-classes-sbom-cve-check` class, this
+      variable controls whether to scan target and native, just target, or just
+      native recipes.
+
+      Valid values are:
+
+      -  ``target`` (default): recipes are scanned in their target context
+      -  ``native``: recipes are scanned in their :ref:`ref-classes-native` context
+      -  ``both``: recipes are scanned in both their target and
+         :ref:`ref-classes-native` context
+
    :term:`SDK_ARCH`
       The target architecture for the SDK. Typically, you do not directly
       set this variable. Instead, use :term:`SDKMACHINE`.

-- 
2.53.0


