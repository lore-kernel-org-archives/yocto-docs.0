Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169E3F9EDDC
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83715.1776867781052106931
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hNQJ2dLH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E90C2C5C3CF
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 218795FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DC42104609C6;
	Wed, 22 Apr 2026 16:22:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pWvgHt6iAl3J3Z3YyyM7GNYCUm0MjWYBlRmXzzOQ+Yc=;
	b=hNQJ2dLHuPR7Go5QmuCsS2UZb2lPx4owvhWWBnDZo4rxwESeUHN71f7oMwUEuYgd3xAmV/
	1hSyl28LzK1CPoIh+7CJ/kQGG5BIxiPUlMzPNTqaST/Mwx8g5GB8uO4MYvpJS3HgXtaAJu
	uoqgoljCz+fDwu1svRMmb1mUnoNmMzFxm6r8t60IbQuWpxRjVP84NjJewD/zylERKDrP6+
	9dhXG3an0eXB7mN0GeTFIIlxlP+71GMOv2uxNm5nyvgyi8PgotkZm68Qzrts7x0PxiFbid
	oqjlDAi18Lo8o4wLTjhv+Dx6wdNmMA5yzPz9yAG6ILUUULFwk013uyBs48amdA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:43 +0200
Subject: [PATCH 10/16] migration-guides/migration-6.0.rst: add migration
 notes on cve-check removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-10-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5204;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3wqSJR3lbo1UUD7IGCMeROZb8FwaYchA+lBV8mNYL7k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm5XVgD4rj5IxbN3Vt+CUgEX5rDRWKHVxnu0
 aEhVZ6MdyCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZuQAKCRDRgEFAKaOo
 NpY0EADJhHuf0LyiWudCdk/U2gWVLjVW+ZikAfXXA4Cz/dkawIcTh8Eee1ctBOpDh+/ZACGHunG
 hxAltvMbm/xIx3I4FcJG1EvSvS+/j79l+ostClZuARH0x64ExLjgJS949MMq4Skl4qF/mAWiKd0
 5evlVIz6y8mFYGkX4o0Kni5aPpJAyuFP1QQd1fzMB0yjri/pEMBBvCbPsBVXad7W5uU6YXBjsn4
 uwbUoLZdgbVKjdcUf+lnkfq9Cgh+25NgHEYfQVz9MA57eOBPpBj9xvCO22YrJufcloFDhzNIPIl
 m/HcE1+/Fx+7URTO725PWU/oEjWC4hGhqP1J758hmktkDIomdztpvfmqMREaZqWhU+Q3uN69Tbn
 F6CZvm+IFrPvOUGdrAfKB0Lp4Kiv/JQE+6cwllgmGCY4V5MTKq+RQFWOmSnHAaB+PuJPQrFs7HT
 6sxLBScZhqbZq/XUXbp6CS8VnkvkRZiQYarsGWS28+bg+7b+KaQF7h2ot+PuiXqEGuDeuHLYW7p
 YzfEbNczXdhNwW2XqltPatDRcHpuxswbCDJ2XfWaTbkVjao4quKQ2M8uvoGnMQOZsgb0+QeaSbw
 ebiXreyMrG0gHKOoYqyWtYxqXxrnZI9sKi693j8OdIDUW3uskDVXqlHaPZAp09GxynhfIhDcdyv
 V470JGXuY/9PMlA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9319

The cve-check class was removed with 00de455f8d3a ("classes/cve-check:
remove class") in OE-Core. Add migration notes to migrate from cve-check
to sbom-cve-check.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst   | 74 ++++++++++++++++++++++
 .../migration-guides/release-notes-6.0.rst         |  3 -
 2 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index d763062da..731f2b990 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -291,6 +291,76 @@ information.
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
+See the :doc:`/security-manual/vulnerabilities` section of the Yocto Project
+Security Manual for more information.
+
 :term:`CVE_PRODUCT` character escaping change
 ---------------------------------------------
 
@@ -410,6 +480,10 @@ The following recipes have been removed in this release:
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


