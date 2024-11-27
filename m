Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FE2D6ACF2
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 16:24:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.75700.1732724644200372630
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 08:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ihAuUrpH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 594F6FF80C;
	Wed, 27 Nov 2024 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732724642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2tB4E+3AsB+2lkmEmUTAHHU2jxmfwTWsztBifUtZx5U=;
	b=ihAuUrpHVccB0EQkAt9UrM33FvDqtqz3P02BiAYaW9XqsqmHuVsbj6bVBENhxSQKCF22sN
	g6P9rUAL4ATS71mVTMTSiItqfysMlpv1kBOLeF+QygK3C5NnLjnaNhGMd/RuMcUAFUzdZ9
	9hhSL6HMwQnPf19Djn/0VHa7Wxzxy/cB6MtSLb+MsQt/xDj7XqcfRNzrCnI9ackG25JSC1
	6bfoxJh5Wi7CyC3mgfDl3tVwZKKCjHD+nZpiS3d8dP9SXijffzSUj4nmZExCTzMUYl7F77
	//iuPgdPv6kkSS91CxXh9E6HXKODprCWlfFHR24qzy7swFsxbsCod0ewegF/AQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 27 Nov 2024 17:23:59 +0100
Subject: [yocto-docs][PATCH v3] Update the documentation for SRCPV
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-deprecated-srcpv-v3-1-4eb17c564c29@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJ5HR2cC/23OwQrCMAwG4FeRnq0sXbd1nnwP8dCmmSvoOtpRl
 LF3txsIih7/hP9LZhYpOIrsuJtZoOSi80MO5X7HsNfDlbizOTNRCAkAFbc0BkI9keUx4Ji4Ktp
 SQlFXaDuWa3nducdGni859y5OPjy3CwnW6RtTv1gCDtxYbVqrpRR1czLeTzc3HNDf2col8UGIP
 /8kkQnVGix1h42y5ptYluUFd09Zo/UAAAA=
X-Change-ID: 20241115-deprecated-srcpv-809341065cdf
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13264;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LCN+yEe8UW055dRPIQurtNcF6i17YASIrV5KkTCN7Tg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnR0ehbV/ko8v6a/IlZw9SATErQeb0/UpTiFJRE
 06qnN/X/qyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ0dHoQAKCRDRgEFAKaOo
 NidwD/9zzkJhfy/HS3DSqJvj0P5Y3uwVijVFTFKowFzzqyK3yT2iAaLi9bRMrECZlcveqjIpZxg
 qY9WPX+uHgx3AwcyBSQYLwJoW0KJhhTHuf2Zhx1+0QuuCDFZeA8dNTZZmAzJuBjNrSASimtf8LV
 k/MI/HQ0h5mJe2Pr76nG0w8IW43D3gk2DLFnqRDLiH6HKmrw26ZeHquH2xXUlu7TZ/oNgVnFjKb
 QXR/8lsh24d/NaNn22YcPPEIpo087qQlRxY2yo53FCUq9bL8+tzjJlRRxdfuBHfnlBwNPtfrnWc
 ZRjLuDUJJyJtL3aR9wGCVFpty5lGD+zRiPOiNVgTn3KsJB9BUzHAWSp2LzvkzjsLEVcwoqR/25+
 nKzqkoK9jZkbutIKFotsphENQwAQA0CCYXa4QwLImUT0WlzFJfqo0kk81xRU+5V1mzLYMFWWunx
 fHSLIIX0Hrk48zrh01JYrgMLhyl16I+usfGmzBm4xv1FlhiVAQEVtdMHmD2qTiOpXHECe7xKSkO
 cuwpwKSpvDg1PQTlOU/7uHDBK0QNMGNmx4UfX4otRhfuFEZFPdMuuuMNQ5t5MkL68gWfwZESyac
 AouEuVSDRlXQaX74gtC2LBtCCc8AE5l839Pt5WCkJc8piaamEBhxaBOGPziHoqLNADC6A+DMpGg
 K0ZIj3g8fc2I6ow==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 16:24:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5840

The variable SRCPV is deprecated since 4.3. Instead of including SRCPV
in PV, including the sign "+" is enough for bitbake to add the source
control information to PKGV during the packaging phase.

Update the documentation for SRCPV and the places where it was used.
When instructions previously referred to SRCPV, replace by mentioning to
include "+" in the assignment.

In most examples, "+git" is added to PV as it is the most popular SCM.
Simply adding "+" is also possible, although it is better practice to
include the SCM name, so give that example.

Update the gcompat example with l3afpad as it didn't include "+git" in
its PV definition anymore.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Fix indent on "PV = ..."
- Remove "which can be useful when specifying versions that contain long
  revision numbers that potentially change", since it's no longer
  relevant.
- Explain that the filename version is not what is to be matched but
  rather the PV variables with an example. (and remove previous srcrev
  hash example).
- Link to v2: https://lore.kernel.org/r/20241125-deprecated-srcpv-v2-1-89bc3afc78db@bootlin.com

Changes in v2:
- Fix typos reported by Quentin.
- kernel-dev/common: mention that `+git` is combined to LINUX_VERSION.
- Link to v1: https://lore.kernel.org/r/20241118-deprecated-srcpv-v1-1-bdab9da44267@bootlin.com
---
 .../contributor-guide/recipe-style-guide.rst       |  6 +--
 documentation/dev-manual/external-scm.rst          |  9 ++--
 documentation/dev-manual/new-recipe.rst            | 10 ++--
 documentation/dev-manual/packages.rst              | 13 ++---
 documentation/kernel-dev/common.rst                | 13 ++---
 documentation/ref-manual/variables.rst             | 62 +++++++++-------------
 6 files changed, 47 insertions(+), 66 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 6a3eec3a0e3d3d6148d3ecf1738721d7dd5079a1..806bf23848114304192dadc3efcb9288f8dbb504 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -47,10 +47,10 @@ Debian policy closely.
 
 When a recipe references a git revision that does not correspond to a released
 version of software (e.g. is not a tagged version), the :term:`PV` variable
-should include the Git revision using the following to make the
-version clear::
+should include the sign ``+``, so :term:`bitbake` automatically includes package
+version information during the packaging phase::
 
-    PV = "<version>+git${SRCPV}"
+    PV = "<version>+git"
 
 In this case, ``<version>`` should be the most recently released version of the
 software from the current source revision (``git describe`` can be useful for
diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index 97a7e63e366a5f510762e4e62742ef3df5fceda6..896b1b5ac70528848204a636ed7b63ac3bc99c5c 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -12,10 +12,13 @@ revision number for changes. Currently, you can do this with Apache
 Subversion (SVN), Git, and Bazaar (BZR) repositories.
 
 To enable this behavior, the :term:`PV` of
-the recipe needs to reference
-:term:`SRCPV`. Here is an example::
+the recipe needs to include a ``+`` sign in its assignment.
+Here is an example::
 
-   PV = "1.2.3+git${SRCPV}"
+   PV = "1.2.3+git"
+
+:term:`Bitbake` later includes the source control information in :term:`PKGV`
+during the packaging phase.
 
 Then, you can add the following to your
 ``local.conf``::
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 61fc2eb1222d38fd9dfb575523688460622f2e0f..944b9627f93fd7a6aafd69482efbb76e90249d8c 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -291,13 +291,13 @@ another example that specifies these types of files, see the
 
 Another way of specifying source is from an SCM. For Git repositories,
 you must specify :term:`SRCREV` and you should specify :term:`PV` to include
-the revision with :term:`SRCPV`. Here is an example from the recipe
-``meta/recipes-core/musl/gcompat_git.bb``::
+a ``+`` sign in its definition. Here is an example from the recipe
+:oe_git:`meta/recipes-sato/l3afpad/l3afpad_git.bb </openembedded-core/tree/meta/recipes-sato/l3afpad/l3afpad_git.bb>`::
 
-   SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current"
+   SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
 
-   PV = "1.0.0+1.1+git${SRCPV}"
-   SRCREV = "af5a49e489fdc04b9cf02547650d7aeaccd43793"
+   PV = "0.8.18.1.11+git"
+   SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
 If your :term:`SRC_URI` statement includes URLs pointing to individual files
 fetched from a remote server other than a version control system,
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index e5028fffdc825aeeec00e3ef256e1583211d5b02..33cf78747d1bc62268811321ad7a40397268e13f 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -84,10 +84,6 @@ the following:
 
 -  :term:`PR`: The recipe revision.
 
--  :term:`SRCPV`: The OpenEmbedded
-   build system uses this string to help define the value of :term:`PV` when
-   the source code revision needs to be included in it.
-
 -  :yocto_wiki:`PR Service </PR_Service>`: A
    network-based service that helps automate keeping package feeds
    compatible with existing package manager applications such as RPM,
@@ -256,15 +252,14 @@ the software::
 
    SRCREV = "${AUTOREV}"
 
-Furthermore, you need to reference :term:`SRCPV` in :term:`PV` in order to
+Furthermore, you need to include a ``+`` sign in :term:`PV` in order to
 automatically update the version whenever the revision of the source
 code changes. Here is an example::
 
-   PV = "1.0+git${SRCPV}"
-
-The OpenEmbedded build system substitutes :term:`SRCPV` with the following:
+   PV = "1.0+git"
 
-.. code-block:: none
+The OpenEmbedded build system will automatically add the source control
+information to the end of the variable :term:`PKGV`, in this format::
 
    AUTOINC+source_code_revision
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index fda41694dc60fa738262a2cce33523708c7ce4ab..28ef3b22c343413fcd092f63e6b77ee156d3d7d7 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1562,16 +1562,9 @@ Here are some basic steps you can use to work with your own sources:
       changed.
 
    -  :term:`PV`: The default :term:`PV`
-      assignment is typically adequate. It combines the
-      :term:`LINUX_VERSION` with the Source Control Manager (SCM) revision
-      as derived from the :term:`SRCPV`
-      variable. The combined results are a string with the following
-      form::
-
-         3.19.11+git1+68a635bf8dfb64b02263c1ac80c948647cc76d5f_1+218bd8d2022b9852c60d32f0d770931e3cf343e2
-
-      While lengthy, the extra verbosity in :term:`PV` helps ensure you are
-      using the exact sources from which you intend to build.
+      assignment is typically adequate. It combines the value of
+      :term:`LINUX_VERSION` and the value ``+git`` which adds source control
+      information to :term:`PKGV` later during the packaging phase.
 
    -  :term:`COMPATIBLE_MACHINE`:
       A list of the machines supported by your new recipe. This variable
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ec4d7ab73fe3ac1bc64f5378c65d19ae0b749809..9bc07336a750beaf5c1cda8272f39803eb53901e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -209,12 +209,11 @@ system and gives an overview of their function and contents.
          SRCREV = "${AUTOREV}"
 
       If you use the previous statement to retrieve the latest version of
-      software, you need to be sure :term:`PV` contains
-      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a kernel
-      recipe that inherits the :ref:`ref-classes-kernel` class and you
-      use the previous statement. In this example, ``${SRCPV}`` does not
-      automatically get into :term:`PV`. Consequently, you need to change
-      :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
+      software, you need to make sure :term:`PV` contains the ``+`` sign so
+      :term:`bitbake` includes source control information to :term:`PKGV` when
+      packaging the recipe. For example::
+
+         PV = "6.10.y+git"
 
       For more information see the
       ":ref:`dev-manual/packages:automatically incrementing a package version number`"
@@ -5152,7 +5151,7 @@ system and gives an overview of their function and contents.
       The :term:`LINUX_VERSION` variable is used to define :term:`PV`
       for the recipe::
 
-         PV = "${LINUX_VERSION}+git${SRCPV}"
+         PV = "${LINUX_VERSION}+git"
 
    :term:`LINUX_VERSION_EXTENSION`
       A string extension compiled into the version string of the Linux
@@ -6702,9 +6701,7 @@ system and gives an overview of their function and contents.
 
       The :term:`PREFERRED_VERSION` variable supports limited wildcard use
       through the "``%``" character. You can use the character to match any
-      number of characters, which can be useful when specifying versions
-      that contain long revision numbers that potentially change. Here are
-      two examples::
+      number of characters. Here are two examples::
 
          PREFERRED_VERSION_python = "3.4.0"
          PREFERRED_VERSION_linux-yocto = "5.0%"
@@ -6715,22 +6712,13 @@ system and gives an overview of their function and contents.
          string. You cannot use the wildcard character in any other
          location of the string.
 
-      The specified version is matched against :term:`PV`, which
-      does not necessarily match the version part of the recipe's filename.
-      For example, consider two recipes ``foo_1.2.bb`` and ``foo_git.bb``
-      where ``foo_git.bb`` contains the following assignment::
-
-         PV = "1.1+git${SRCPV}"
-
-      In this case, the correct way to select
-      ``foo_git.bb`` is by using an assignment such as the following::
-
-         PREFERRED_VERSION_foo = "1.1+git%"
+      The specified version is matched against :term:`PV`, which does not
+      necessarily match the version part of the recipe's filename.
 
-      Compare that previous example
-      against the following incorrect example, which does not work::
-
-         PREFERRED_VERSION_foo = "git"
+      If you want to select a recipe named ``foo_git.bb`` which has :term:`PV`
+      set to ``1.2.3+git``, you can do so by setting ```PREFERRED_VERSION_foo``
+      to ``1.2.3%`` (i.e. simply using ``git`` will not work as the name of the
+      recipe isn't used, but rather its :term:`PV` definition).
 
       Sometimes the :term:`PREFERRED_VERSION` variable can be set by
       configuration files in a way that is hard to change. You can use
@@ -8316,21 +8304,23 @@ system and gives an overview of their function and contents.
       (SCM).
 
    :term:`SRCPV`
-      Returns the version string of the current package. This string is
-      used to help define the value of :term:`PV`.
+      The variable :term:`SRCPV` is deprecated. It was previously used to
+      include source control information in :term:`PV` for :term:`bitbake` to
+      work correctly but this is no longer a requirement. Source control
+      information will be automatically included by :term:`bitbake` in the
+      variable :term:`PKGV` during packaging if the ``+`` sign is present in
+      ``PV``.
 
-      The :term:`SRCPV` variable is defined in the ``meta/conf/bitbake.conf``
-      configuration file in the :term:`Source Directory` as
-      follows::
+      .. note::
 
-         SRCPV = "${@bb.fetch2.get_srcrev(d)}"
+         The :term:`SRCPV` variable used to be defined in the
+         ``meta/conf/bitbake.conf`` configuration file in the :term:`Source
+         Directory` as follows::
 
-      Recipes that need to define :term:`PV` do so with the help of the
-      :term:`SRCPV`. For example, the ``ofono`` recipe (``ofono_git.bb``)
-      located in ``meta/recipes-connectivity`` in the Source Directory
-      defines :term:`PV` as follows::
+            SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 
-         PV = "0.12-git${SRCPV}"
+         The ``get_srcrev`` function can still be used to include source control
+         information in variables manually.
 
    :term:`SRCREV`
       The revision of the source code used to build the package. This

---
base-commit: f064af984c491707dd5a0917e68a033f6c2104f6
change-id: 20241115-deprecated-srcpv-809341065cdf

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


