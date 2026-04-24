Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22098FB44D8
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:29:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16696.1777019341225807745
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WXNMLxeX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9F2CD4E42AE9
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77670604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B05BD10720740;
	Fri, 24 Apr 2026 10:28:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/gLMCD/yPKsUcO+agwmciAlSEFpPkk80DpeikpwU+Lo=;
	b=WXNMLxeX2eIVisodyIWEvR7IriE73oBA1TYQpFGUDlwI+CM+nb1n2HLhbn7Y4PCdauK+y4
	bxqE+tk8s1tPs1EhMVdWEWbVobnXx/gSBPKQpQtNxqrW6sfzo/hq7PusMlkrlzs5jrXF1L
	v8HeZpPKLfrTk2/oYHvWWOwwW2a1ZeQrzPU04lOo4C8aREq4mdnQSjnlLtm6vVVQ5rpi6e
	ABnC/Txkp/ZP/PbzouNDRux4vHdVoZMIyRau9YTpY7xyqighySkrOH0DTGMF+NYgw9xBVp
	y/Vb9gZK8njtnadD83eBl5jPvAGALFkY9ybF7AkzSCfdiWT8oMTdtwV7/Xeg2Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:39 +0200
Subject: [PATCH v2 11/18] migration-guides/migration-6.0.rst: add migration
 notes on cve-check removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-11-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5476;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZqPC8RnG+OPGnFC/ZPrDG+lslkErjM8VWpVuH1svv5k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym/cvrwBvlPdk3mhhVYfd60UngA5iIVXcIj3
 T4hyHMv4u2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvwAKCRDRgEFAKaOo
 No6HD/9Q3iUwTRcsVEV0/jgXahmVGvAhpPs7ahiSnEP68ZkC5SkMgFy6LSnlrRVCI+LLn7/2LYg
 B3OS1HzCf+5uhaaGc+OApR4KmRT6hgytSOwOvMj/sskzVQPAUseLVhBGTx69d1TUh3/57XZrDKs
 kildPhLS7gN1VaikI0/7CkxZAxJmdDb3dpulid2HHdQMHBuvwG9eemAQTnAqf3jwED9i4/JtcGf
 u7cSxH+H+fuXAnWxLJmJJwI7OMwhQ2ubYHbyPBQZTr0fpBB3MWROEH+oRLJfnx8sQDGwrF0fFq3
 /L7QvBJULRmCs6/W7EzKH87AwaWqUhhRzO5PTi4t2QtsTRnnQ4BDWRmFsBa83xhMgWQRP2t2LmM
 XuRlmNi0qtXr9wLHNmHC4KyU+oQNMuNBXbuW4Bh9D6oxKWZa5iLwkEWiYv7OnWWvTZN052UuTCf
 Juuo/asL+J0pyJB9T0B9s7E87tDztpXaecd9uVwVocrxEE8rGv5NOw1j/SgomK3yLbjIQxAywGW
 ga8DGJMLWL1Z9qd8gKDEryuGaJ/nIIYBRjt9VpvVppFa2n2hz6nq+9Id/diAvfeL6gbqh5DYRBB
 Apvwn5Bu3BvC48cFY9wc7ytSHDSr2XVKif0VS+UPJOAboOxWgk6F7VDQHy47TudepZxJy1tJ74G
 YkYcfFMT2bgl4ag==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9349

The cve-check class was removed with 00de455f8d3a ("classes/cve-check:
remove class") in OE-Core. Add migration notes to migrate from cve-check
to sbom-cve-check.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst   | 79 ++++++++++++++++++++++
 .../migration-guides/release-notes-6.0.rst         |  3 -
 2 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index d763062da..ecb124a93 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -291,6 +291,81 @@ information.
 Users are advised to transition to SDPX 3.0, which is provided by the
 :ref:`ref-classes-create-spdx` class.
 
+``cve-check`` class removed
+---------------------------
+
+The ``cve-check`` class was removed and replaced by the
+:ref:`ref-classes-sbom-cve-check` class. Quoting the commit removing the class
+(:oecore_rev:`00de455f8d3aeca880129d23e8cfb7e246404699`):
+
+.. code-block:: text
+
+   It's been long known that the cve-check class in oe-core is not that
+   usable in the real world, for more details see "Future of CVE scanning
+   in Yocto"[1].  This mail proposed an alternative direction that included
+   a CVE scanning tool that can be ran both during the build and afterwards,
+   so that periodic scans of a previously build image is possible.
+
+   Last year, Bootlin wrote sbom-cve-check[2] and I compared this to my
+   proposal in "Comparing cve-check with sbom-cve-check"[3], concluding
+   that this is likely the missing piece.
+
+   Support for sbom-cve-check has been merged into oe-core, and the
+   cve-check class is now obsolete. So that we don't have to maintain it for
+   the four-year lifecycle of the Wrynose release, delete it.
+
+   This patch also deletes the database fetcher recipes, and the test cases
+   that were specific to cve-check.  Note that the oe.cve_check library
+   still exists as this is used by the SPDX classes.
+
+   [1] https://lore.kernel.org/openembedded-core/7D6E419E-A7AE-4324-966C-3552C586E452@arm.com/
+   [2] https://github.com/bootlin/sbom-cve-check
+   [3] https://lore.kernel.org/openembedded-core/2CD10DD9-FB2A-4B10-B98A-85918EB6B4B7@arm.com/
+
+Users currently using the ``cve-check`` class are advised to switch to
+:ref:`ref-classes-sbom-cve-check`:
+
+-  The following assignment::
+
+      INHERIT += "cve-check"
+
+   Should be removed and replaced by::
+
+      OE_FRAGMENTS += "core/yocto/sbom-cve-check"
+
+   This will enable the :ref:`ref-classes-sbom-cve-check` class along with the recommended
+   settings.
+
+   This will deploy two files to the deployment directory
+   (:term:`DEPLOY_DIR_IMAGE`) after building an image:
+
+   -  A file ending with ``.sbom-cve-check.yocto.json``: this is the output JSON
+      report in the same format as the one deployed by the ``cve-check`` class.
+
+   -  A file ending with ``.sbom-cve-check.spdx.json``: this is an output SPDX
+      report annonated with vulnerable CVEs.
+
+-  The ``cve-check`` class output summary file (deployed in the
+   :term:`DEPLOY_DIR_IMAGE`) ending with ``.cve.txt`` is no longer
+   deployed by default but can be added back by adding the following statement
+   to a configuration file::
+
+      SBOM_CVE_CHECK_EXPORT_VARS:append = " SBOM_CVE_CHECK_EXPORT_SUMMARY"
+
+   This will deploy a new file ending with ``.cve.txt``, which uses the same
+   format as the summary previously deployed by the ``cve-check`` class.
+
+   See the documentation of :term:`SBOM_CVE_CHECK_EXPORT_VARS` for more
+   details.
+
+-  The ``CVE_CHECK_SHOW_WARNINGS`` variable, which was used to control whether
+   the ``cve-check`` would print warning when unpatched CVEs were found, is now
+   removed and replaced by the :term:`SBOM_CVE_CHECK_SHOW_WARNINGS` variable,
+   which does the same.
+
+See the :doc:`/security-manual/vulnerabilities` section of the Yocto Project
+Security Manual for more information.
+
 :term:`CVE_PRODUCT` character escaping change
 ---------------------------------------------
 
@@ -410,6 +485,10 @@ The following recipes have been removed in this release:
    (OE-Core)` and Python 3.14 now has built-in support for zstd
    (:oecore_rev:`55061de857657ea01babc5652caa062e8d292c44`)
 
+-  ``cve-update-db-native``, ``cve-update-nvd2-native``: removed with the
+   ``cve-check`` class removal as it was the only user of these recipes.
+   (:oecore_rev:`00de455f8d3aeca880129d23e8cfb7e246404699`)
+
 Removed :term:`PACKAGECONFIG` options
 -------------------------------------
 
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 31d4cdfce..9d611d70a 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -574,9 +574,6 @@ New Features / Enhancements in |yocto-ver|
 
 -  :ref:`ref-classes-sbom-cve-check`-related changes:
 
-   -  ``cve-update-nvd2-native``: Use maximum CVSS score when extracting it from
-      multiple sources (:oecore_rev:`4f6192f3165de0bc2499e045607c7e7ffd878a4b`)
-
    -  Escape special characters in CPE 2.3 strings
       (:oecore_rev:`9dd9c0038907340ba08ff4c8ee06a8748c1ac00a`)
 

-- 
2.53.0


