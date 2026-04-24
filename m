Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD83FB44D4
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16689.1777019336463915404
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TmgQl+8S;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D403A4E42AE9
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB1F9604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE2CD1072073C;
	Fri, 24 Apr 2026 10:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i8D+u+sgbjanTqf59uJEH1qcp5/GG2BaPpi3OKmBVYY=;
	b=TmgQl+8SI9EmqIR2TplKwgK5ZDLmX9A5EAtOTgUqG0qQ0bGm7RyimY1P8/4sjKSBApLzmv
	Lx9g+2DZS5NgVoowameDiTDXSX7vodtmY4m6dLDXxQ0hLalVLBJLsBlel/M+8oLLcInJzw
	z/LLB00vECj9EFNNRhKplRWRx0mAPPd0jOUVadJKl6MsV18ZQl6L9jbTcCG5MXw3iSMqba
	8vkfFYa4/8E6KmEJ+g3vZ6AlIglTxInq132Agavx6OtO3vxcIenelBxw0IWIqR4D8l0WzW
	1dfOX3HfCiU72zdD/mK0Tuw0QgbBlizf+scqFvHNzG1CpAVDxHIhvCt49+Xf9Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:35 +0200
Subject: [PATCH v2 07/18] docs-wide: drop documentation for cve-check and
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-7-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=30000;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1SMgdHljK07tjbRDv3E8vhhIEf8Kg0M0GwoqTPbyyx8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym+NbCVCHcrudG36GWEStOMW4U+uT7FbkbU7
 VURkXCfXTWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvgAKCRDRgEFAKaOo
 Ng/aD/9tHFD/YnMqcWbjHbY+g9IBpjr7QRBtfCOkft6oxzPp3R0Qxp9DIeXxh9um+jJ++oLf51x
 6L3KHPu+YrGI6jw1tGiq7gnwUVUqWroHxDd73suny1dhDU43sHuvoDdfCSrdTd7XLYVXaJb2k8g
 mqji7c8sd5O5MtNxMfiPtikKWFo4rDEUInDGfxxs4jKUE92DS+Q5YtZI1mRdj+R5GvM7iJdlMg1
 +js8jnDzWcJ5edLtGwnoG5Y2ucTlNl6pFmB21cMaVnxk0Dj/KPUxNoKZeTh4Fsc7PhhsEQdj79i
 nmGZiNmGq59/tCXXU4s/c+/kiQwerIU3BL+GKPsF6NO5Viuw3kT9YDdhI1Fx/ojaBcZ23AIsIJU
 zAymfpLGFK5jz2+Ceca234w/qYVy0J6ZPbwDbN29V9Nt7zvEZpL+sQ++r73cmslBkFz3GRabwe1
 0MFT+3dfLgUNKQHOKUpdMRnjfu+DUaPYA/zc8p+UukxAetlOSv2GhEsicQet35aGPeId86TBH7p
 FkNDJfcZ/HHHC40Qbt37EhfbPdT1xQ7S8c2aMnOUXr3wWpkAcf0kpPA6F05+BIFL375/h2lhoV/
 B16hvAil1Ts9vpwAdgZsu6/RtqAL11tmLL5V9OkyTF6T1G/VSzqyKDSKVJtxP0HRBmgpvryYDZc
 JaM0PNvABO7Iexw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9345

Drop the cve-check class documentation and all variable strictly tied to
the class. The vex class is still there and uses the same namespace to
name its variables, so keep the variables that are still used in the vex
class. The current vulnerabilities document is out-of-date, but
references to cve-check are still removed there for bisectability, and
is rewritten in the next commits.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-3.0.rst   |  4 +-
 documentation/migration-guides/migration-5.0.rst   |  2 +-
 .../migration-guides/release-notes-4.0.23.rst      |  2 +-
 .../migration-guides/release-notes-4.1.1.rst       |  4 +-
 .../migration-guides/release-notes-4.1.rst         |  4 +-
 .../migration-guides/release-notes-5.0.5.rst       |  2 +-
 .../migration-guides/release-notes-5.0.rst         |  4 +-
 .../migration-guides/release-notes-5.1.3.rst       |  2 +-
 .../migration-guides/release-notes-5.1.rst         |  8 +--
 .../migration-guides/release-notes-5.2.rst         | 24 +++----
 .../migration-guides/release-notes-5.3.rst         |  2 +-
 .../migration-guides/release-notes-6.0.rst         |  2 +-
 documentation/ref-manual/classes.rst               | 78 +---------------------
 documentation/ref-manual/variables.rst             | 77 +++------------------
 documentation/security-manual/vulnerabilities.rst  | 12 ++--
 15 files changed, 47 insertions(+), 180 deletions(-)

diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 67fcac41f..f5201dcac 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -49,7 +49,7 @@ The following recipes have been removed.
 -  ``core-image-lsb-sdk``: Part of removed LSB support.
 
 -  ``cve-check-tool``: Functionally replaced by the ``cve-update-db``
-   recipe and :ref:`ref-classes-cve-check` class.
+   recipe and ``cve-check`` class.
 
 -  ``eglinfo``: No longer maintained. ``eglinfo`` from ``mesa-demos`` is
    an adequate and maintained alternative.
@@ -144,7 +144,7 @@ CVE Checking
 ------------
 
 ``cve-check-tool`` has been functionally replaced by a new
-``cve-update-db`` recipe and functionality built into the :ref:`ref-classes-cve-check`
+``cve-update-db`` recipe and functionality built into the ``cve-check``
 class. The result uses NVD JSON data feeds rather than the deprecated
 XML feeds that ``cve-check-tool`` was using, supports CVSSv3 scoring,
 and makes other improvements.
diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index cf413300c..a0d0cc2df 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -186,7 +186,7 @@ Miscellaneous changes
 -  ``recipetool`` now prefixes the names of recipes created for Python modules
    with ``python3-``.
 
--  The :ref:`ref-classes-cve-check` class no longer produces a warning for
+-  The ``cve-check`` class no longer produces a warning for
    remote patches --- it only logs a note and does not try to fetch the patch
    in order to scan it for issues or CVE numbers. However, CVE number
    references in remote patch file names will now be picked up.
diff --git a/documentation/migration-guides/release-notes-4.0.23.rst b/documentation/migration-guides/release-notes-4.0.23.rst
index abf7c6975..271a6340f 100644
--- a/documentation/migration-guides/release-notes-4.0.23.rst
+++ b/documentation/migration-guides/release-notes-4.0.23.rst
@@ -80,7 +80,7 @@ Fixes in Yocto-4.0.23
 -  ref-manual: add missing :term:`OPKGBUILDCMD` variable
 -  ref-manual: devtool-reference: document missing commands
 -  ref-manual: devtool-reference: refresh example outputs
--  ref-manual: introduce :term:`CVE_CHECK_REPORT_PATCHED` variable
+-  ref-manual: introduce ``CVE_CHECK_REPORT_PATCHED`` variable
 -  ref-manual: release-process: add a reference to the doc's release
 -  ref-manual: release-process: refresh the current LTS releases
 -  ref-manual: release-process: update releases.svg
diff --git a/documentation/migration-guides/release-notes-4.1.1.rst b/documentation/migration-guides/release-notes-4.1.1.rst
index 8393bc532..23ea4727c 100644
--- a/documentation/migration-guides/release-notes-4.1.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.1.rst
@@ -131,8 +131,8 @@ Fixes in Yocto-4.1.1
 -  ref-manual/faq.rst: update references to products built with OE / Yocto Project
 -  ref-manual/variables.rst: clarify sentence
 -  ref-manual: add a note to ssh-server-dropbear feature
--  ref-manual: add :term:`CVE_CHECK_SHOW_WARNINGS`
--  ref-manual: add :term:`CVE_DB_UPDATE_INTERVAL`
+-  ref-manual: add ``CVE_CHECK_SHOW_WARNINGS``
+-  ref-manual: add ``CVE_DB_UPDATE_INTERVAL``
 -  ref-manual: add :term:`DEV_PKG_DEPENDENCY`
 -  ref-manual: add :term:`DISABLE_STATIC`
 -  ref-manual: add :term:`FIT_PAD_ALG`
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index 3ad3611b8..81d541fac 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -47,11 +47,11 @@ New Features / Enhancements in 4.1
 
 - CVE checking enhancements:
 
-  - New :term:`CVE_DB_UPDATE_INTERVAL` variable to allow specifying the CVE database minimum update interval (and default to once per day)
+  - New ``CVE_DB_UPDATE_INTERVAL`` variable to allow specifying the CVE database minimum update interval (and default to once per day)
   - Added JSON format to summary output
   - Added support for Ignored CVEs
   - Enable recursive CVE checking also for ``do_populate_sdk``
-  - New :term:`CVE_CHECK_SHOW_WARNINGS` variable to disable unpatched CVE warning messages
+  - New ``CVE_CHECK_SHOW_WARNINGS`` variable to disable unpatched CVE warning messages
   - The :ref:`ref-classes-pypi` class now defaults :term:`CVE_PRODUCT` from :term:`PYPI_PACKAGE`
   - Added current kernel CVEs to ignore list since we stay as close to the kernel stable releases as we can
   - Optimisations to avoid dependencies on fetching
diff --git a/documentation/migration-guides/release-notes-5.0.5.rst b/documentation/migration-guides/release-notes-5.0.5.rst
index c8cf9a85d..7aadaeae4 100644
--- a/documentation/migration-guides/release-notes-5.0.5.rst
+++ b/documentation/migration-guides/release-notes-5.0.5.rst
@@ -83,7 +83,7 @@ Fixes in Yocto-5.0.5
 -  ref-manual: devtool-reference: document missing commands
 -  ref-manual: devtool-reference: refresh example outputs
 -  ref-manual: faq: add q&a on class appends
--  ref-manual: introduce :term:`CVE_CHECK_REPORT_PATCHED` variable
+-  ref-manual: introduce ``CVE_CHECK_REPORT_PATCHED`` variable
 -  ref-manual: merge patch-status-* to patch-status
 -  ref-manual: release-process: add a reference to the doc's release
 -  ref-manual: release-process: refresh the current LTS releases
diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index de11bd174..31b1d3da7 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -10,7 +10,7 @@ New Features / Enhancements in 5.0
 
 -  New variables:
 
-   -  :term:`CVE_DB_INCR_UPDATE_AGE_THRES`: Configure the maximum age of the
+   -  ``CVE_DB_INCR_UPDATE_AGE_THRES``: Configure the maximum age of the
       internal CVE database for incremental update (instead of a full
       redownload).
 
@@ -277,7 +277,7 @@ New Features / Enhancements in 5.0
 
    -  Improve incremental CVE database download from NVD. Rejected CVEs are
       removed, configuration is kept up-to-date. The age threshold for
-      incremental update can be configured with :term:`CVE_DB_INCR_UPDATE_AGE_THRES`
+      incremental update can be configured with ``CVE_DB_INCR_UPDATE_AGE_THRES``
       variable.
 
 -  Toaster Web UI improvements:
diff --git a/documentation/migration-guides/release-notes-5.1.3.rst b/documentation/migration-guides/release-notes-5.1.3.rst
index 641cb8d50..13cf48bae 100644
--- a/documentation/migration-guides/release-notes-5.1.3.rst
+++ b/documentation/migration-guides/release-notes-5.1.3.rst
@@ -40,7 +40,7 @@ Fixes in Yocto-5.1.3
 -  cmake: apply parallel build settings to ptest tasks
 -  contributor-guide/submit-changes: add policy on AI generated code
 -  cve-check: fix cvesInRecord
--  cve-check: restore :term:`CVE_CHECK_SHOW_WARNINGS` functionality
+-  cve-check: restore ``CVE_CHECK_SHOW_WARNINGS`` functionality
 -  dev-manual/building: document the initramfs-framework recipe
 -  devtool: ide-sdk recommend :term:`DEBUG_BUILD`
 -  devtool: ide-sdk remove the plugin from eSDK installer
diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index bab0c1458..2f049690a 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -11,7 +11,7 @@ New Features / Enhancements in 5.1
 
 -  New variables:
 
-   -  :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`: suffix for the CVE JSON manifest file.
+   -  ``CVE_CHECK_MANIFEST_JSON_SUFFIX``: suffix for the CVE JSON manifest file.
 
    -  :term:`PRSERV_UPSTREAM`: Upstream PR service (``host:port``) for the local
       PR server to connect to.
@@ -235,12 +235,12 @@ New Features / Enhancements in 5.1
 
    -  Fetch release tarballs instead of git checkouts to reduce disk usage.
 
--  :ref:`ref-classes-cve-check` changes:
+-  ``cve-check`` changes:
 
-   -  The class :ref:`ref-classes-cve-check` now uses a local copy of the NVD
+   -  The class ``cve-check`` now uses a local copy of the NVD
       database during builds.
 
-   -  New statuses can be reported by :ref:`ref-classes-cve-check`:
+   -  New statuses can be reported by ``cve-check``:
 
       -  ``fix-file-included``: when a fix file has been included (set automatically)
       -  ``version-not-in-range``: version number NOT in the vulnerable range (set automatically)
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 5fc426c05..b5483c903 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -35,8 +35,8 @@ New Features / Enhancements in |yocto-ver|
       install tags (``--tags``) to the ``meson install`` command during the
       :ref:`ref-tasks-install` task.
 
-   -  :ref:`ref-classes-cve-check`: :term:`NVD_DB_VERSION` to allow choosing the
-      CVE feed when using the :ref:`ref-classes-cve-check` class.
+   -  ``cve-check``: ``NVD_DB_VERSION`` to allow choosing the
+      CVE feed when using the ``cve-check`` class.
 
    -  The :term:`BB_USE_HOME_NPMRC` controls whether or not BitBake uses the
       user's ``.npmrc`` file within their home directory within the npm fetcher.
@@ -479,7 +479,7 @@ New Features / Enhancements in |yocto-ver|
    -  ``openssh``: be more restrictive on private key file permissions by
       setting them from the :ref:`ref-tasks-install` task.
 
--  :ref:`ref-classes-cve-check` changes:
+-  ``cve-check`` changes:
 
    -  Update the :term:`DL_DIR` database location name
       (``${DL_DIR}/CVE_CHECK2``).
@@ -490,15 +490,15 @@ New Features / Enhancements in |yocto-ver|
 
    -  Fix malformed cve status description with ``:`` characters.
 
-   -  Restore the :term:`CVE_CHECK_SHOW_WARNINGS` variable and functionality. It
+   -  Restore the ``CVE_CHECK_SHOW_WARNINGS`` variable and functionality. It
       currently prints warning message for every unpatched CVE the
-      :ref:`ref-classes-cve-check` class finds.
+      ``cve-check`` class finds.
 
-   -  Users can control the NVD database source using the :term:`NVD_DB_VERSION`
+   -  Users can control the NVD database source using the ``NVD_DB_VERSION``
       variable with possible values ``NVD1``, ``NVD2``, or ``FKIE``.
 
    -  The default feed for CVEs is now ``FKIE`` instead of ``NVD2`` (see
-      :term:`NVD_DB_VERSION` for more information).
+      ``NVD_DB_VERSION`` for more information).
 
 -  New :term:`PACKAGECONFIG` options for individual recipes:
 
@@ -621,8 +621,8 @@ New Features / Enhancements in |yocto-ver|
 
    -  ``cve-update-nvd2-native``: updating the database will now result in an
       error if :term:`BB_NO_NETWORK` is enabled and
-      :term:`CVE_DB_UPDATE_INTERVAL` is not set to ``-1``. Users can control the
-      NVD database source using the :term:`NVD_DB_VERSION` variable with
+      ``CVE_DB_UPDATE_INTERVAL`` is not set to ``-1``. Users can control the
+      NVD database source using the ``NVD_DB_VERSION`` variable with
       possible values ``NVD1``, ``NVD2``, or ``FKIE``.
 
    -  ``systemtap``: add ``--with-extra-version="oe"`` configure option to
@@ -714,10 +714,10 @@ New Features / Enhancements in |yocto-ver|
 Known Issues in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  The :ref:`ref-classes-cve-check` class is based on the `National
+-  The ``cve-check`` class is based on the `National
    Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). Since the beginning
    of 2024, the maintainers of this database have stopped annotating CVEs with
-   the affected CPEs. This prevents the :ref:`ref-classes-cve-check` class to
+   the affected CPEs. This prevents the ``cve-check`` class to
    properly report CVEs as CPEs are used to match Yocto recipes with CVEs
    affecting them. As a result, the current CVE reports may look good but the
    reality is that some vulnerabilities are just not reported.
@@ -726,7 +726,7 @@ Known Issues in |yocto-ver|
    <https://www.cve.org/>'__ for entries concerning software they use, or follow
    release notes of such projects closely.
 
-   Please note, that the :ref:`ref-classes-cve-check` tool has always been a
+   Please note, that the ``cve-check`` tool has always been a
    helper tool, and users are advised to always review the final result. Results
    of an automatic scan may not take into account configuration options,
    compiler options and other factors.
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index 0ba0fbe98..1655ca90f 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -778,7 +778,7 @@ New Features / Enhancements in |yocto-ver|
       branch is no longer updated <migration-guides/migration-5.3:The Poky
       repository master branch is no longer updated>`.
 
--  :ref:`ref-classes-cve-check` class changes:
+-  ``cve-check`` class changes:
 
    -  ``cve-update-db-native``: FKIE: use Secondary metric if there is no
       Primary metric.
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 2ae182c8c..31d4cdfce 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -572,7 +572,7 @@ New Features / Enhancements in |yocto-ver|
       :doc:`/security-reference/index`. It is intended to document how to report
       vulnerabilities to the Yocto Project security team.
 
--  :ref:`ref-classes-cve-check`-related changes:
+-  :ref:`ref-classes-sbom-cve-check`-related changes:
 
    -  ``cve-update-nvd2-native``: Use maximum CVSS score when extracting it from
       multiple sources (:oecore_rev:`4f6192f3165de0bc2499e045607c7e7ffd878a4b`)
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index d66c9c68b..2905af5ed 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -596,78 +596,6 @@ cross-compilation tools used for building SDKs. See the
 section in the Yocto Project Overview and Concepts Manual for more
 discussion on these cross-compilation tools.
 
-.. _ref-classes-cve-check:
-
-``cve-check``
-=============
-
-The :ref:`ref-classes-cve-check` class looks for known CVEs (Common Vulnerabilities
-and Exposures) while building with BitBake. This class is meant to be
-inherited globally from a configuration file::
-
-   INHERIT += "cve-check"
-
-To filter out obsolete CVE database entries which are known not to impact
-software from :term:`OpenEmbedded-Core (OE-Core)`, add the following line to the
-build configuration file::
-
-   include cve-extra-exclusions.inc
-
-You can also look for vulnerabilities in specific packages by passing
-``-c cve_check`` to BitBake.
-
-After building the software with Bitbake, CVE check output reports are available in ``tmp/deploy/cve``
-and image specific summaries in ``tmp/deploy/images/*.json`` files.
-
-When building, the CVE checker will emit build time warnings for any detected
-issues which are in the state ``Unpatched``, meaning that CVE issue seems to affect the software component
-and version being compiled and no patches to address the issue are applied. Other states
-for detected CVE issues are: ``Patched`` meaning that a patch to address the issue is already
-applied, and ``Ignored`` meaning that the issue can be ignored.
-
-The ``Patched`` state of a CVE issue is detected from patch files with the format
-``CVE-ID.patch``, e.g. ``CVE-2019-20633.patch``, in the :term:`SRC_URI` and using
-CVE metadata of format ``CVE: CVE-ID`` in the commit message of the patch file.
-
-.. note::
-
-   Commit message metadata (``CVE: CVE-ID`` in a patch header) will not be scanned
-   in any patches that are remote, i.e. that are anything other than local files
-   referenced via ``file://`` in SRC_URI. However, a ``CVE-ID`` in a remote patch
-   file name itself will be registered.
-
-If the recipe adds ``CVE-ID`` as flag of the :term:`CVE_STATUS` variable with status
-mapped to ``Ignored``, then the CVE state is reported as ``Ignored``::
-
-   CVE_STATUS[CVE-2020-15523] = "not-applicable-platform: Issue only applies on Windows"
-
-If CVE check reports that a recipe contains false positives or false negatives, these may be
-fixed in recipes by adjusting the CVE product name using :term:`CVE_PRODUCT` and :term:`CVE_VERSION` variables.
-:term:`CVE_PRODUCT` defaults to the plain recipe name :term:`BPN` which can be adjusted to one or more CVE
-database vendor and product pairs using the syntax::
-
-   CVE_PRODUCT = "flex_project:flex"
-
-where ``flex_project`` is the CVE database vendor name and ``flex`` is the product name. Similarly
-if the default recipe version :term:`PV` does not match the version numbers of the software component
-in upstream releases or the CVE database, then the :term:`CVE_VERSION` variable can be used to set the
-CVE database compatible version number, for example::
-
-   CVE_VERSION = "2.39"
-
-Any bugs or missing or incomplete information in the CVE database entries should be fixed in the CVE database
-via the `NVD feedback form <https://nvd.nist.gov/info/contact-form>`__.
-
-Users should note that security is a process, not a product, and thus also CVE checking, analyzing results,
-patching and updating the software should be done as a regular process. The data and assumptions
-required for CVE checker to reliably detect issues are frequently broken in various ways.
-These can only be detected by reviewing the details of the issues and iterating over the generated reports,
-and following what happens in other Linux distributions and in the greater open source community.
-
-You will find some more details in the
-":ref:`security-manual/vulnerabilities:checking for vulnerabilities`"
-section in the Development Tasks Manual.
-
 .. _ref-classes-cython:
 
 ``cython``
@@ -3818,8 +3746,7 @@ using the Vala programming language.
 ========
 
 The :ref:`ref-classes-vex` class is used to generate metadata needed by external
-tools to check for vulnerabilities, for example CVEs. It can be used as a
-replacement for :ref:`ref-classes-cve-check`.
+tools to check for vulnerabilities, for example CVEs.
 
 In order to use this class, inherit the class in the ``local.conf`` file and it
 will add the ``generate_vex`` task for every recipe::
@@ -3830,9 +3757,6 @@ If an image is built it will generate a report in :term:`DEPLOY_DIR_IMAGE` for
 all the packages used, it will also generate a file for all recipes used in the
 build.
 
-Variables use the ``CVE_CHECK`` prefix to keep compatibility with the
-:ref:`ref-classes-cve-check` class.
-
 Example usage::
 
    bitbake -c generate_vex openssl
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e713204e3..0fcf81299 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1977,42 +1977,22 @@ system and gives an overview of their function and contents.
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
-   :term:`CVE_CHECK_CREATE_MANIFEST`
-      Specifies whether to create a CVE manifest to place in the deploy
-      directory. The default is "1".
-
    :term:`CVE_CHECK_IGNORE`
       This variable is deprecated and should be replaced by :term:`CVE_STATUS`.
 
    :term:`CVE_CHECK_MANIFEST_JSON`
-      Specifies the path to the CVE manifest in JSON format. See
-      :term:`CVE_CHECK_CREATE_MANIFEST`.
-
-   :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`
-      Allows to modify the JSON manifest suffix. See
-      :term:`CVE_CHECK_MANIFEST_JSON`.
-
-   :term:`CVE_CHECK_REPORT_PATCHED`
-      Specifies whether or not the :ref:`ref-classes-cve-check`
-      class should report patched or ignored CVEs. The default is "1", but you
-      may wish to set it to "0" if you do not need patched or ignored CVEs in
-      the logs.
-
-   :term:`CVE_CHECK_SHOW_WARNINGS`
-      Specifies whether or not the :ref:`ref-classes-cve-check`
-      class should generate warning messages on the console when unpatched
-      CVEs are found. The default is "1", but you may wish to set it to "0" if
-      you are already examining/processing the logs after the build has
-      completed and thus do not need the warning messages.
+      When inheriting the :ref:`ref-classes-vex` class, this variable specifies
+      the path to the CVE manifest in JSON format.
 
    :term:`CVE_CHECK_SKIP_RECIPE`
-      The list of package names (:term:`PN`) for which
-      CVEs (Common Vulnerabilities and Exposures) are ignored.
+      When inheriting the :ref:`ref-classes-vex` class, the variable specifies
+      the list of package names (:term:`PN`) for which CVEs (Common
+      Vulnerabilities and Exposures) are ignored.
 
    :term:`CVE_CHECK_STATUSMAP`
       Mapping variable for all possible reasons of :term:`CVE_STATUS`:
       ``Patched``, ``Unpatched`` and ``Ignored``.
-      See :ref:`ref-classes-cve-check` or ``meta/conf/cve-check-map.conf`` for more details::
+      See :oecore_path:`meta/conf/cve-check-map.conf` for more details::
 
          CVE_CHECK_STATUSMAP[cpe-incorrect] = "Ignored"
 
@@ -2023,18 +2003,6 @@ system and gives an overview of their function and contents.
 
          CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] = "vulnerableCodeNotPresent"
 
-   :term:`CVE_DB_INCR_UPDATE_AGE_THRES`
-      Specifies the maximum age of the CVE database in seconds for an
-      incremental update (instead of a full-download). Use "0" to force a
-      full-download.
-
-   :term:`CVE_DB_UPDATE_INTERVAL`
-      Specifies the CVE database update interval in seconds, as used by
-      ``cve-update-db-native``. The default value is "86400" i.e. once a day
-      (24*60*60). If the value is set to "0" then the update will be forced
-      every time. Alternatively, a negative value e.g. "-1" will disable
-      updates entirely.
-
    :term:`CVE_PRODUCT`
       In a recipe, defines the name used to match the recipe name
       against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
@@ -2085,12 +2053,14 @@ system and gives an overview of their function and contents.
    :term:`CVE_VERSION`
       In a recipe, defines the version used to match the recipe version
       against the version in the `NIST CVE database <https://nvd.nist.gov/>`__
-      when usign :ref:`ref-classes-cve-check`.
+      when using the :ref:`ref-classes-vex` or :ref:`ref-classes-create-spdx`
+      class.
 
       The default is ${:term:`PV`} but if recipes use custom version numbers
       which do not map to upstream software component release versions and the versions
       used in the CVE database, then this variable can be used to set the
-      version number for :ref:`ref-classes-cve-check`. Example::
+      version number for :ref:`ref-classes-vex` or
+      :ref:`ref-classes-create-spdx`. Example::
 
           CVE_VERSION = "2.39"
 
@@ -6548,33 +6518,6 @@ system and gives an overview of their function and contents.
 
          NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
 
-   :term:`NVD_DB_VERSION`
-      The :term:`NVD_DB_VERSION` variable allows choosing the CVE feed when
-      using the :ref:`ref-classes-cve-check` class. It can be one of:
-
-      -  ``FKIE`` (default): the `FKIE-CAD <https://github.com/fkie-cad/nvd-json-data-feeds>`__
-         feed reconstruction
-      -  ``NVD2``: the NVD feed with API version 2
-      -  ``NVD1``: the NVD JSON feed (deprecated)
-
-      In case of a malformed feed name, the ``NVD2`` feed is selected and an
-      error is printed.
-
-   :term:`NVDCVE_API_KEY`
-      The NVD API key used to retrieve data from the CVE database when
-      using :ref:`ref-classes-cve-check`.
-
-      By default, no API key is used, which results in larger delays between API
-      requests and limits the number of queries to the public rate limits posted
-      at the `NVD developer's page <https://nvd.nist.gov/developers/start-here>`__.
-
-      NVD API keys can be requested through the
-      `Request an API Key <https://nvd.nist.gov/developers/request-an-api-key>`__
-      page. You can set this variable to the NVD API key in your ``local.conf`` file.
-      Example::
-
-          NVDCVE_API_KEY = "fe753&7a2-1427-347d-23ff-b2e2b7ca5f3"
-
    :term:`OBJCOPY`
       The minimal command and arguments to run :manpage:`objcopy <objcopy(1)>`.
 
diff --git a/documentation/security-manual/vulnerabilities.rst b/documentation/security-manual/vulnerabilities.rst
index e6135a525..983e1548c 100644
--- a/documentation/security-manual/vulnerabilities.rst
+++ b/documentation/security-manual/vulnerabilities.rst
@@ -28,7 +28,7 @@ Vulnerability check at build time
 =================================
 
 To enable a check for CVE security vulnerabilities using
-:ref:`ref-classes-cve-check` in the specific image or target you are building,
+``cve-check`` in the specific image or target you are building,
 add the following setting to your configuration::
 
    INHERIT += "cve-check"
@@ -58,7 +58,7 @@ analysis, it has been deemed to ignore the issue as it for example affects
 the software component on a different operating system platform.
 
 By default, no NVD API key is used to retrieve data from the CVE database, which
-results in larger delays between NVD API requests. See the :term:`NVDCVE_API_KEY`
+results in larger delays between NVD API requests. See the ``NVDCVE_API_KEY``
 documentation on how to request and set a NVD API key.
 
 After a build with CVE check enabled, reports for each compiled source recipe will be
@@ -145,7 +145,7 @@ It is also possible to check the CVE status of individual packages as follows::
 Fixing CVE product name and version mappings
 ============================================
 
-By default, :ref:`ref-classes-cve-check` uses the recipe name :term:`BPN` as CVE
+By default, ``cve-check`` uses the recipe name :term:`BPN` as CVE
 product name when querying the CVE database. If this mapping contains false positives, e.g.
 some reported CVEs are not for the software component in question, or false negatives like
 some CVEs are not found to impact the recipe when they should, then the problems can be
@@ -288,7 +288,7 @@ the :term:`CVE_CHECK_SKIP_RECIPE` variable.
 Implementation details
 ======================
 
-Here's what the :ref:`ref-classes-cve-check` class does to find unpatched CVE IDs.
+Here's what the ``cve-check`` class does to find unpatched CVE IDs.
 
 First the code goes through each patch file provided by a recipe. If a valid CVE ID
 is found in the name of the file, the corresponding CVE is considered as patched.
@@ -389,7 +389,7 @@ Don't forget to update your kernel recipe with::
    include cve-exclusion_6.12.inc
 
 Then the CVE information will automatically be added in the
-:ref:`ref-classes-cve-check` or :ref:`ref-classes-vex` report.
+``cve-check`` or :ref:`ref-classes-vex` report.
 
 ``improve_kernel_cve_report.py``
 --------------------------------
@@ -402,7 +402,7 @@ CVEs by analyzing the files used to build the kernel. The script is decoupled fr
 the build and can be run outside of the :term:`BitBake` environment.
 
 The script uses the output from the :ref:`ref-classes-vex` or
-:ref:`ref-classes-cve-check` class as input, together with CVE information from
+``cve-check`` class as input, together with CVE information from
 the Linux kernel CNA to enrich the ``cve-summary.json`` file with updated CVE
 information.
 

-- 
2.53.0


