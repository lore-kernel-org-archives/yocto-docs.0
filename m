Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCD0F459E9
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158223.1775832229404368534
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GRIJgQMT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7E5F1C5C1AA
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A84860439
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9807110450025;
	Fri, 10 Apr 2026 16:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832221; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GtZsVHefQ2AXJKPaNipso0AZDtnYmdXyFmxOrl1isXo=;
	b=GRIJgQMTUtWsS2KgdTl816dMEyAElbpXZUmaEytV9UT/YTbzrnZyYebFkFtR0WlboCZm6z
	B9uAJbVhZBsAdBhBFFhMFhYzQjMFQRK19HPgsW2w2Za6YJJy0TsB0I14ovi9XkZ72bBzBG
	5GcmRFzO8VGH6rzHrUW5U7BPhFqMlCKF2yhl0yRTx5K/MTJkcIX3XSUx7drel+RGsxBX7Z
	Ui0nStJKTmuTmnRUysRYJo8nBZtg5E+Gd2iH9BtAj/fCEDJXdAmVqC7UEdMdmI25zWxRTY
	235SCsa4RwMHRnQUmiVwAV1mMWJWXPCurgWP8KA5HoATF7D6gMBBPleJgTzc5g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:30 +0200
Subject: [PATCH 06/18] docs-wide: refresh SBOM documentation after SPDX2.2
 removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-6-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7594;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=gpiwZXJuLI0cUOefJnTabTY9Tkd0Kg7n4eKfm1WmCTg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyXH5wdVjBPuazJzkP7EosNkPd0VRVXc1Slw
 dXQ2UAl+ueJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlwAKCRDRgEFAKaOo
 NlpSD/9PJvB6TmbLsLwF5FULavb7DoLuwzCegsONacs6BY7ILkFVPmiCZVyxWpdRLKG4xYocbFz
 Qq5rElKXzlSOVTq2NJPho5JAi+4omNhjxB/CQ5TzuE89F5N3wd5+qEFZ0SMfRD+97dHYgTYT5Zm
 DuXB/a+i3S4TACP4oMp11PFKS9bgiTFo9Nj0g8tGIRSSOlaB/hgAqikWltKlI4F5RektxZWAmsf
 FsmVdtRCwq41HMy83nvJt5pQ1l0E6kDFK4EQeP9kbu3t+jBfGbTZ30hXwu9RHmVSfE+Y+CSYEcn
 hQtbQfQnDszZWGCLrBAdJm+rQZVHsO6TNa/V2mPpdHroiCvoUmNP2f87vJQcFyyoQJLC34A+ZhY
 STkDGEMJCzqRcIrpPBEE9yFaTv3sGXAbmDRbAQmhcqJIN44T7qTuFDwv7PxTYysn2XKdZzrI1HU
 YeZh1fF7vavlioFYJK4cQsm0CC7o0ZOCVNKAztdKdfAn569VJ1tSEJ+96Tkxh5Q80gSQ31msIh5
 YbPyt3DybWTJ7UDFbvZjuu/4UBMW9ihSZB0uCIdWB6AC8h/OHG7NrzLaPxwmBC/vb6HvPjJEziF
 q3YbwxrEriLsfqH1+Cp50GGllYZExxykjh97EuTlpskBJODJ96TQuDwwDHYmHEXjWEY1XXNra68
 DmQdXq6/Nmf6JdQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9242

SPDX2.2 was removed in [1]. Refresh the documentation surrounding SDPX
SBOMs to removed obsolete variables and output files.

[1]: https://git.openembedded.org/openembedded-core/commit/?id=12abd0574c267bade0962ecb39d9e8da8c56842b

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/sbom.rst      | 38 +++++---------------------
 documentation/ref-manual/classes.rst   |  4 +--
 documentation/ref-manual/variables.rst | 50 ----------------------------------
 3 files changed, 9 insertions(+), 83 deletions(-)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index e0c3ed6d1..819340a74 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -31,25 +31,15 @@ If needed, it can be disabled from a :term:`configuration file`::
 
    INHERIT_DISTRO:remove = "create-spdx"
 
-Upon building an image, you will then get:
-
--  :term:`SPDX` output in JSON format as an ``IMAGE-MACHINE.spdx.json`` file in
-   ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`.
-
--  This toplevel file is accompanied by an ``IMAGE-MACHINE.spdx.index.json``
-   containing an index of JSON :term:`SPDX` files for individual recipes.
-
--  The compressed archive ``IMAGE-MACHINE.spdx.tar.zst`` contains the index
-   and the files for the single recipes.
+Upon building an image, you will then get the :term:`SPDX` output in JSON format
+as an ``IMAGE-MACHINE.spdx.json`` file in ``tmp/deploy/images/MACHINE/`` inside
+the :term:`Build Directory`.
 
 The :ref:`ref-classes-create-spdx` class offers options to include
 more information in the output :term:`SPDX` data:
 
 -  Make the json files more human readable by setting (:term:`SPDX_PRETTY`).
 
--  Add compressed archives of the files in the generated target packages by
-   setting (:term:`SPDX_ARCHIVE_PACKAGED`).
-
 -  Add a description of the source files used to generate host tools and target
    packages (:term:`SPDX_INCLUDE_SOURCES`)
 
@@ -62,8 +52,6 @@ more information in the output :term:`SPDX` data:
 -  Export the recipe's ``PACKAGECONFIG`` features (enabled/disabled) into the
    SPDX document (:term:`SPDX_INCLUDE_PACKAGECONFIG`).
 
--  Add archives of these source files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
-
 -  Exclude specific files from the SPDX output using Python regular expressions
    (:term:`SPDX_FILE_EXCLUDE_PATTERNS`).
 
@@ -82,28 +70,16 @@ more information in the output :term:`SPDX` data:
    (:term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD`, :term:`SPDX_INVOKED_BY`,
    :term:`SPDX_ON_BEHALF_OF`).
 
-Though the toplevel :term:`SPDX` output is available in
-``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
-generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such as:
-
--  The individual :term:`SPDX` JSON files in the ``IMAGE-MACHINE.spdx.tar.zst``
-   archive.
-
--  Compressed archives of the files in the generated target packages,
-   in ``packages/packagename.tar.zst`` (when :term:`SPDX_ARCHIVE_PACKAGED`
-   is set).
-
--  Compressed archives of the source files used to build the host tools
-   and the target packages in ``recipes/recipe-packagename.tar.zst``
-   (when :term:`SPDX_ARCHIVE_SOURCES` is set). Those are needed to fulfill
-   "source code access" license requirements.
-
 See also the :term:`SPDX_CUSTOM_ANNOTATION_VARS` variable which allows
 to associate custom notes to a recipe.
 See the `tools page <https://spdx.dev/resources/tools/>`__ on the :term:`SPDX`
 project website for a list of tools to consume and transform the :term:`SPDX`
 data generated by the OpenEmbedded build system.
 
+See the definition of the variables starting with ``SPDX_`` in the
+:doc:`Yocto Project Reference Manual glossary </ref-manual/variables>` for more
+information.
+
 See also Joshua Watt's presentations
 `Automated SBoM generation with OpenEmbedded and the Yocto Project <https://youtu.be/Q5UQUM6zxVU>`__
 at FOSDEM 2023 and
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 38b16c0f9..d29339491 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -559,8 +559,8 @@ The toplevel :term:`SPDX` output file is generated in JSON format as a
 as well as in ``tmp/deploy/spdx``.
 
 The exact behaviour of this class, and the amount of output can be controlled
-by the :term:`SPDX_PRETTY`, :term:`SPDX_ARCHIVE_PACKAGED`,
-:term:`SPDX_ARCHIVE_SOURCES` and :term:`SPDX_INCLUDE_SOURCES` variables.
+by the :term:`SPDX_PRETTY`, :term:`SPDX_INCLUDE_SOURCES` and other variables
+starting with with ``SPDX_``.
 
 See the description of these variables and the
 ":ref:`dev-manual/sbom:creating a software bill of materials`"
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7606d7a42..bb39ceaaf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9324,56 +9324,6 @@ system and gives an overview of their function and contents.
 
             SOURCE_MIRROR_URL = "http://example.com/my_source_mirror;user=<user>;pswd=<password>"
 
-   :term:`SPDX_ARCHIVE_PACKAGED`
-      This option allows to add to :term:`SPDX` output compressed archives
-      of the files in the generated target packages.
-
-      Such archives are available in
-      ``tmp/deploy/spdx/MACHINE/packages/packagename.tar.zst``
-      under the :term:`Build Directory`.
-
-      Enable this option as follows::
-
-         SPDX_ARCHIVE_PACKAGED = "1"
-
-      According to our tests on release 4.1 "langdale", building
-      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling this
-      option multiplied the size of the ``tmp/deploy/spdx`` directory by a
-      factor of 13 (+1.6 GiB for this image), compared to just using the
-      :ref:`ref-classes-create-spdx` class with no option.
-
-      Note that this option doesn't increase the size of :term:`SPDX`
-      files in ``tmp/deploy/images/MACHINE``.
-
-   :term:`SPDX_ARCHIVE_SOURCES`
-      This option allows to add to :term:`SPDX` output compressed archives
-      of the sources for packages installed on the target. It currently
-      only works when :term:`SPDX_INCLUDE_SOURCES` is set.
-
-      This is one way of fulfilling "source code access" license
-      requirements.
-
-      Such source archives are available in
-      ``tmp/deploy/spdx/MACHINE/recipes/recipe-packagename.tar.zst``
-      under the :term:`Build Directory`.
-
-      Enable this option as follows::
-
-         SPDX_INCLUDE_SOURCES = "1"
-         SPDX_ARCHIVE_SOURCES = "1"
-
-      According to our tests on release 4.1 "langdale", building
-      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
-      these options multiplied the size of the ``tmp/deploy/spdx``
-      directory by a factor of 11 (+1.4 GiB for this image),
-      compared to just using the :ref:`ref-classes-create-spdx`
-      class with no option.
-
-      Note that using this option only marginally increases the size
-      of the :term:`SPDX` output in ``tmp/deploy/images/MACHINE/``
-      (+ 0.07\% with the tested image), compared to just enabling
-      :term:`SPDX_INCLUDE_SOURCES`.
-
    :term:`SPDX_BUILD_HOST`
       The base variable name describing the build host on which the build is
       running. The value must name a key from ``SPDX_IMPORTS``, allowing

-- 
2.53.0


