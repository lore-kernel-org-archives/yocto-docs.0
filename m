Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1276DC19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 14:34:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11848.1740666863881482141
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 06:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B92482BCA
	for <docs@lists.yoctoproject.org>; Thu, 27 Feb 2025 06:34:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C76753F673
	for <docs@lists.yoctoproject.org>; Thu, 27 Feb 2025 06:34:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-5.2.rst: add information about autotools changes
Date: Thu, 27 Feb 2025 14:34:18 +0000
Message-ID: <20250227143418.3523136-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Feb 2025 14:34:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6466

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/migration-guides/release-notes-5.2.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/docum=
entation/migration-guides/release-notes-5.2.rst
index 417b202cd..75d860aff 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -299,6 +299,16 @@ New Features / Enhancements in |yocto-ver|
       currently prints warning message for every unpatched CVE the
       :ref:`ref-classes-cve-check` class finds.
=20
+-  :ref:`ref-classes-autotools` changes:
+
+   - Changes to how ``aclocal`` is invoked means that ``ACLOCALDIR`` and
+     ``ACLOCALEXTRAPATH`` are no longer used.
+
+   - Directories containing m4 files are no longer found automatically a=
nd
+     passed to ``autoreconf``. If a recipe fails to configure because it=
 cannot find
+     m4 macros, then usually the solution is to set ``EXTRA_AUTORECONF +=
=3D "-I
+     path/to/m4"`` in the recipe.
+
 -  New :term:`PACKAGECONFIG` options for individual recipes:
=20
       -  ``perf``: ``zstd``
--=20
2.43.0


