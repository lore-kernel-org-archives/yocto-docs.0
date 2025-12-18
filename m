Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61AAD6ACDB
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:40:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38188.1766050847892785963
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 01:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HBsHIrnw;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F721C1A5AC
	for <docs@lists.yoctoproject.org>; Thu, 18 Dec 2025 09:40:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0EFF606B6
	for <docs@lists.yoctoproject.org>; Thu, 18 Dec 2025 09:40:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1691102F0AF5;
	Thu, 18 Dec 2025 10:40:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766050843; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=t94N41tQrKlp5zl+QXIPijEzO/uDlDwLJB7XBt5M4xc=;
	b=HBsHIrnw8ODmbZI4SjONfFnv9PRY6oJVHcXUj133PQENtPA5R4qgLanrnYboBJFcOnk4Uf
	/IQO/f2ldrXGaJ7UXrxEfbaZbWfQU2fAP120P4iqZ5lKw4oBuc6SiPLMVWfrAZCZtea+xt
	LjIiTe1spfLNfG9hnsZDV1b0ZPUfGUvV/jGk/ymH6sBJ2bhYQP0t5h24HaaxzWKHc57Ytu
	/CnxGQ3bELmgBxDNQj567GOxZExYEJmW3BkgOM9pVT4fumWa49aX5JPl7jCTCTNHq4Ydqf
	kRUknADRmyHoJiFjg+0uMiIcpf7l28jjROO6wUPM7ko/uaWHITskIT7z2smJBg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 18 Dec 2025 10:40:05 +0100
Subject: [PATCH] migration-guides: add Wrynose release note templates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-release-notes-templates-6-0-v1-1-61690583cef2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPTLQ2kC/yXMQQrCMBBG4auUWTvQCbQRryIupvGvRmpaMlGE0
 rub6u59m7eSIUcYnZqVMt7R4pwq5NBQuGu6geO1mlzrOnFy5IwJauA0FxgXPJdJ9+q5Za/Sd94
 PY1Chelgyxvj53c+Xv+01PBDKvqRt+wLUt+ZUfwAAAA==
X-Change-ID: 20251218-release-notes-templates-6-0-7a16577bfca1
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6695;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rIFNOs50yE/3kRNy7UMunBmfml6IVVY8G5nNzve7LIc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpQ8warEpFoyD4lq3kCpaMrKqVC/fZOCz3WRmyw
 dvKqhEGJmmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUPMGgAKCRDRgEFAKaOo
 Ntk6EACsftFawvYlOH31fV/eNM3Kzt1fSkUKc5Og8POu1a5tgThTf0057YfzK8sP0gkJ2Qnh/ce
 V8Zgb6jlNkb2ZPTCseaFjDQST4TrMmPmzvHPKFyQpQlRlE6w8ayQtDHqkdac8EODRJWJsVNL6Gi
 yL5dmWYjHygf4T5VQZt2G++ouhps3Xmed1HAPvby9GoADW3T+31bnyrM9aHRUjfNcxXcqZn3NWT
 1IhuQsBzrD4M9XzlxRO1W8+AJ0yrlcOaEs3R5czSISpb4OV4w7ZTWS8UvxMsX/WkdDvW2f/V96b
 VtZF7TYqDQnog4gdfilIg7jY56uF9+Q0egGUu7c6SH4HvPQ/G05EDB9dpYXGFf0WMx2pEiPZjbQ
 P+7aSUgkXmTfDlMLosOILApJefsF/ZGrTca4Q3J9bZrQjDEau/KIR+kVWjcIdlD0Wu55iq9Gw9H
 PK1fM1uNuLtRNnLmoUHkb8dlGy9abF1wzt3z8xD5fFa5BJ2UERokY5eUJucrchXhu8OiRxhtgOi
 6LWKoLYiK2dNC5RmlaGg9Q3/b2ZYemKBs7DQnbbYiUoNlkYPE5gYFWgYcwA8B6ud2sMg2CJ2nU4
 gRafaQMX+oRKUJObzVF+yzYZUFhQhQauuBvoo0rhzlA632rOcdSICRB305baMBDq9VN3ZZyF13I
 KWwB8bkK6+e8mXg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Dec 2025 09:40:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8301

Add templates for the next release, Wrynose, coming out in April 2026.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/index.rst           |   1 +
 documentation/migration-guides/migration-6.0.rst   |  67 +++++++++++
 documentation/migration-guides/release-6.0.rst     |  10 ++
 .../migration-guides/release-notes-6.0.rst         | 131 +++++++++++++++++++++
 4 files changed, 209 insertions(+)

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index 81227ad56..f71144dd3 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   release-6.0
    release-5.3
    release-5.2
    release-5.1
diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
new file mode 100644
index 000000000..f5b7da1dc
--- /dev/null
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: wrynose
+.. |yocto-ver| replace:: 6.0
+.. Note: anchors id below cannot contain substitutions so replace them with the
+   value of |yocto-ver| above.
+
+Migration notes for |yocto-ver| (|yocto-codename|)
+**************************************************
+
+This section provides migration information for moving to the Yocto
+Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
+For a list of new feature and enhancements, see the
+:doc:`/migration-guides/release-notes-6.0` section.
+
+Supported kernel versions
+-------------------------
+
+The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
+out the box, older kernels are not supported. See :ref:`4.3 migration notes
+<migration-4.3-supported-kernel-versions>` for details.
+
+Supported distributions
+-----------------------
+
+Compared to the previous releases, running BitBake is supported on new
+GNU/Linux distributions:
+
+-  XXX
+
+On the other hand, some earlier distributions are no longer supported:
+
+-  XXX
+
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
+
+Rust language changes
+---------------------
+
+systemd changes
+---------------
+
+Recipe changes
+--------------
+
+Removed variables
+-----------------
+
+The following variables have been removed:
+
+Removed recipes
+---------------
+
+The following recipes have been removed in this release:
+
+Removed classes
+---------------
+
+The following classes have been removed in this release:
+
+Removed features
+----------------
+
+The following features have been removed in this release:
+
+Miscellaneous changes
+---------------------
diff --git a/documentation/migration-guides/release-6.0.rst b/documentation/migration-guides/release-6.0.rst
new file mode 100644
index 000000000..6d8226129
--- /dev/null
+++ b/documentation/migration-guides/release-6.0.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+*********************
+Release 6.0 (wrynose)
+*********************
+
+.. toctree::
+
+   release-notes-6.0
+   migration-6.0
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
new file mode 100644
index 000000000..cfc51fc3a
--- /dev/null
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -0,0 +1,131 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: wrynose
+.. |yocto-ver| replace:: 6.0
+.. Note: anchors id below cannot contain substitutions so replace them with the
+   value of |yocto-ver| above.
+
+Release notes for |yocto-ver| (|yocto-codename|)
+================================================
+
+This document lists new features and enhancements for the Yocto Project
+|yocto-ver| Release (codename "|yocto-codename|"). For a list of breaking
+changes and migration guides, see the :doc:`/migration-guides/migration-6.0`
+section.
+
+New Features / Enhancements in |yocto-ver|
+------------------------------------------
+
+-  Linux kernel XXX, gcc XXX, glibc XXX, LLVM XXX, and over XXX other
+   recipe upgrades.
+
+-  Minimum Python version required on the host: XXX.
+
+-  New variables:
+
+-  Kernel-related changes:
+
+-  New core recipes:
+
+-  New core classes:
+
+-  Architecture-specific changes:
+
+-  QEMU / ``runqemu`` changes:
+
+-  Documentation changes:
+
+-  Go changes:
+
+-  Rust changes:
+
+-  Wic Image Creator changes:
+
+-  SDK-related changes:
+
+-  Testing-related changes:
+
+-  Utility script changes:
+
+-  BitBake changes:
+
+-  Packaging changes:
+
+-  LLVM related changes:
+
+-  SPDX-related changes:
+
+-  ``devtool`` changes:
+
+-  Patchtest-related changes:
+
+-  :ref:`ref-classes-insane` class related changes:
+
+-  Security changes:
+
+-  :ref:`ref-classes-cve-check` changes:
+
+-  New :term:`PACKAGECONFIG` options for individual recipes:
+
+-  Systemd related changes:
+
+-  :ref:`ref-classes-sanity` class changes:
+
+-  Miscellaneous changes:
+
+Known Issues in |yocto-ver|
+---------------------------
+
+Recipe License changes in |yocto-ver|
+-------------------------------------
+
+The following changes have been made to the :term:`LICENSE` values set by recipes:
+
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe
+     - Previous value
+     - New value
+   * - ``recipe name``
+     - Previous value
+     - New value
+
+Security Fixes in |yocto-ver|
+-----------------------------
+
+The following CVEs have been fixed:
+
+.. list-table::
+   :widths: 30 70
+   :header-rows: 1
+
+   * - Recipe
+     - CVE IDs
+   * - ``recipe name``
+     - :cve_nist:`xxx-xxxx`, ...
+
+Recipe Upgrades in |yocto-ver|
+------------------------------
+
+The following recipes have been upgraded:
+
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe
+     - Previous version
+     - New version
+   * - ``recipe name``
+     - Previous version
+     - New version
+
+Contributors to |yocto-ver|
+---------------------------
+
+Thanks to the following people who contributed to this release:
+
+Repositories / Downloads for Yocto-|yocto-ver|
+----------------------------------------------

---
base-commit: d84d916d4fc505e8386693306b6a90b0064c0518
change-id: 20251218-release-notes-templates-6-0-7a16577bfca1


