Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2053.1792740699187653964
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 00:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BLD7wKrM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C80211A12EC
	for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:31:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CE9F60398
	for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDDA110328EBA;
	Fri, 23 Oct 2026 09:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792740696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/z7DrO4EaS3MrfcL2QH272VI5zS4i+h3VaxeopV2buQ=;
	b=BLD7wKrMw9c+LuvQYzkaeqB5GHPXKituA8E2KE4X1fZ3tEVZa076PE77TpyPiAOFS8jFid
	NLG/7wiuL7T0/67Wn05DgJG1qsPrHM5BAfR2CtUd5aZBDO7nOJkDibB4G6EDHe7+iq0SIe
	towXIVVkxg4MCiaiXoAHJm4sSs/e1BJMlWGXNvXyUmjt+HlgEa3cekBl026zyJRwWIlnO3
	tKszbwK6oTDvFTzdZtTx8TdFZLZOUErp/CF0fA3Hh2CNjMITFcS2iWueZF3DQuLgnF1oVD
	ad/cd5ZBFFuffnnFddP+rjFnCfajGLg35b6Mz7Fi1CzusUoKfIcYezbL1eEEEQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 23 Oct 2026 09:31:19 +0200
Subject: [PATCH] migration-guides: add Garburn release note templates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-releases-notes-templates-6-2-v1-1-06967856aa4e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMBCE4Vche3YTWMNGfRXjocCgNVhItxgSw
 rtT9DKZ//KtZIgeRrdipYivNz+GHNWpoPblwhPsu9wkpWhVypkjBjiDcRhT3oTPNLjjKQvXncp
 FtLlq3VMmpojeLz/+/vi3zc0bbTpM2rYd4iRVoIAAAAA=
X-Change-ID: 20261023-releases-notes-templates-6-2-5d62826b965f
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7146;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/ctI6WA5sXtPbUSZ89RMX9GCPUgtlvdF6rblSWdF77U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq2w1JpKApfat5a6z0qwwd1LOrZxIIsTpC/FeLP
 Mm5ybgULE6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCatsNSQAKCRDRgEFAKaOo
 NkxYEACYiBdUC3QQBfF2+334qfcCD845aJCmAT1aDVTcFMdf8HOXqlKyoDn1vlZlrZxOMB2Ptv0
 0G2gFNfAvzjHE3bTHYta6SBn+laIpOqoJxdmXrH/RkMf9b3DlA2dBzvbptfnbocb5uL1MuLbxEq
 j3UiWu/dq1nTYifAvZvJCwW8KD8BDqy3Eft6BewIKTVt8VqZX52TWUsfDXvrfQ1Z7rI9IpGBUpO
 T5oBRMEXFkPqSeZJPo4BIs7I6mOOL3OeYfnAr5m7zREGivPmWAXsSkBzWqcdI6HK09Mb5dH3RfR
 qE68+nbQHHmkT+Cak//FgQYNN/pBIfUP/A0ZgWHRG/9zfjqrVd96nrgB8OLcTnhdrkCMLabjyuR
 u3tGgXJ23uTkCXXgTmq5PwrLgeref5EVw+33HrzhZPXpIcQ0TZdrHYU/G8cCiaP/Qd3uviT8wZn
 ZDvdsXHIRofDy1biemzg1ZlI29SMuao5RO8JQw2qoMbd7UaoBCJLf643uLBzYam8i6v3zhpOMlN
 qmGt/D7/W4pzOiiTX5h59486UFDNiLO3QCn2QhrKimyHCnxjrH1EnJwJes8smQFNddavH0YrJGm
 2pcCe2b57EivtfvjjT9Z0KWiidqNOKpCV0ykzxcSvz8zNr8EBvzoETsarobUyqb6R799zd39zTd
 GrZXnDWVjP+DDLA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10718

Based on the 6.1 documents.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/index.rst           |   1 +
 documentation/migration-guides/migration-6.2.rst   |  46 ++++++
 documentation/migration-guides/release-6.2.rst     |  10 ++
 .../migration-guides/release-notes-6.2.rst         | 159 +++++++++++++++++++++
 4 files changed, 216 insertions(+)

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index e53215c73..f120387b7 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   release-6.2
    release-6.1
    release-6.0
    release-5.3
diff --git a/documentation/migration-guides/migration-6.2.rst b/documentation/migration-guides/migration-6.2.rst
new file mode 100644
index 000000000..750be4b48
--- /dev/null
+++ b/documentation/migration-guides/migration-6.2.rst
@@ -0,0 +1,46 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: garburn
+.. |yocto-ver| replace:: 6.2
+.. Note: anchors id below cannot contain substitutions so replace them with the
+   value of |yocto-ver| above.
+
+Migration notes for |yocto-ver| (|yocto-codename|)
+**************************************************
+
+This section provides migration information for moving to the Yocto
+Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
+For a list of new features and enhancements, see the
+:doc:`/migration-guides/release-notes-6.2` section.
+
+Supported kernel versions
+-------------------------
+
+The :term:`OLDEST_KERNEL` setting is 5.15 in this release, meaning that
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
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
+
+Removed recipes
+---------------
+
+Removed variables
+-----------------
+
+Removed :term:`PACKAGECONFIG` options
+-------------------------------------
+
+Removed classes
+---------------
+
+Miscellaneous changes
+---------------------
diff --git a/documentation/migration-guides/release-6.2.rst b/documentation/migration-guides/release-6.2.rst
new file mode 100644
index 000000000..b2cab0b60
--- /dev/null
+++ b/documentation/migration-guides/release-6.2.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+*********************
+Release 6.2 (garburn)
+*********************
+
+.. toctree::
+
+   release-notes-6.2
+   migration-6.2
diff --git a/documentation/migration-guides/release-notes-6.2.rst b/documentation/migration-guides/release-notes-6.2.rst
new file mode 100644
index 000000000..a09876441
--- /dev/null
+++ b/documentation/migration-guides/release-notes-6.2.rst
@@ -0,0 +1,159 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: garburn
+.. |yocto-ver| replace:: 6.2
+.. Note: anchors id below cannot contain substitutions so replace them with the
+   value of |yocto-ver| above.
+
+Release notes for |yocto-ver| (|yocto-codename|)
+================================================
+
+This document lists new features and enhancements for the Yocto Project
+|yocto-ver| Release (codename "|yocto-codename|"). For a list of breaking
+changes and migration guides, see the :doc:`/migration-guides/migration-6.2`
+section.
+
+New Features / Enhancements in |yocto-ver|
+------------------------------------------
+
+-  Linux kernel XXX, gcc XXX, glibc XXX, LLVM XXX, and over XXX other
+   recipe upgrades
+
+..
+   Found in meta/lib/oe/sanity.py:check_sanity_everybuild
+
+-  Minimum Python version required on the host: XXX.
+
+-  Kernel-related changes:
+
+-  New core recipes:
+
+-  New core classes:
+
+-  New variables:
+
+-  :term:`OpenEmbedded-Core (OE-Core)` library changes:
+
+-  Global configuration changes:
+
+-  BitBake changes:
+
+-  SPDX-related changes:
+
+-  :ref:`ref-classes-sbom-cve-check`-related changes:
+
+-  Packaging changes:
+
+-  QEMU / ``runqemu`` changes:
+
+-  Documentation changes:
+
+-  Go changes:
+
+-  Testing-related changes:
+
+-  Utility script changes:
+
+-  Clang/LLVM-related changes:
+
+-  Patchtest-related changes:
+
+-  :ref:`ref-classes-insane` / :ref:`ref-classes-sanity` classes-related changes:
+
+-  Security changes:
+
+-  :ref:`ref-classes-sbom-cve-check`-related changes:
+
+-  New :term:`PACKAGECONFIG` options for individual recipes:
+
+-  systemd-related changes:
+
+-  U-Boot-related changes:
+
+-  Busybox-related changes:
+
+-  ``initramfs-framework``-related changes:
+
+-  Miscellaneous changes:
+
+Known Issues in |yocto-ver|
+---------------------------
+
+N/A
+
+Recipe License changes in |yocto-ver|
+-------------------------------------
+
+..
+   Going through commits on OE-Core filtered by License-Update:
+   git log -U0 --patch --grep "License-Update:" yocto-6.1..origin/master
+
+The following changes have been made to the :term:`LICENSE` values set by recipes:
+
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe(s)
+     - Previous value
+     - New value
+   * - recipe
+     - previous
+     - new
+
+Security Fixes in |yocto-ver|
+-----------------------------
+
+..
+   Generated with documentation/tools/gen-cve-release-notes
+   With data from https://git.yoctoproject.org/yocto-metrics/plain/cve-check
+
+The following CVEs have been fixed:
+
+.. list-table::
+   :widths: 30 70
+   :header-rows: 1
+
+   * - Recipe
+     - CVE IDs
+   * - recipe
+     - cve
+
+Recipe Upgrades in |yocto-ver|
+------------------------------
+
+..
+   Generated with https://layers.openembedded.org/layerindex/branch_comparison
+   With "rST" output selected
+
+The following recipes have been upgraded:
+
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe
+     - Previous version(s)
+     - New version(s)
+   * - recipe
+     - previous
+     - new
+
+Contributors to |yocto-ver|
+---------------------------
+
+..
+   List obtained with the following shell snippet:
+
+      authors=""
+      for repo in openembedded-core yocto-docs bitbake meta-yocto; do
+         authors="${authors}\n$(git --no-pager -C $repo log --format="-  %an" yocto-6.1..origin/master)"
+      done
+      echo $authors | sort | uniq
+
+   Email addresses and duplicates removed.
+
+Thanks to the following people who contributed to this release:
+
+Repositories / Downloads for Yocto-|yocto-ver|
+----------------------------------------------

---
base-commit: 04a6651f50f4c1ca9b6c566bba6465d6617a62a9
change-id: 20261023-releases-notes-templates-6-2-5d62826b965f

