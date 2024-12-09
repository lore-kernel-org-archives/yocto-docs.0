Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F261E77180
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 16:44:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.106523.1733762635350574890
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 08:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R1rJws9E;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34B4A20003;
	Mon,  9 Dec 2024 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733762633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yHviZ6/i2Usb8awhltnn1TUQNfhXZuUtv6XYG71zhsM=;
	b=R1rJws9Eg6pPOPLBHVMJjELVzmW08WCKdze7+5Vw4Ud1lKhDuquNwVFmrvLX4VhjMjuNVh
	VgdxCnljXG2Sl6KjEox7TJbXHBfn31DzB3ejjWktd4TzegzG0YjHwT5Z2xXO7zn+6cnAcd
	Yoeu9Nr/0FhhRzbc4afpo7hMWkYfqY01PkhRYAo+N4WvyLW8LM1w2FU2fo6ExXjoaauHxr
	G0g7ysWFHW4dF0QARsBJY3whzBxhdoIXkneaSPWUMSAGeCR5KFrxj+jaYRLFASdkqXrtgU
	VTbc/6UufstLmeSRE18ApY6PTgh+pem7heDjktGgjjfGHemsKdgSw21xiPyCFw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 09 Dec 2024 17:43:43 +0100
Subject: [yocto-docs PATCH v4] Update the documentation for SRCPV
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-deprecated-srcpv-v4-1-26a6f91ee902@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAD4eV2cC/23OTQqDMBAF4KtI1k0xP5rYVe9RukgmsQZaI4mEF
 vHujULBoss3w/tmJhRtcDaiSzGhYJOLzvc58FOBoFP9w2Jncka0pJwQUmFjh2BBjdbgGGBIWJY
 N46SsKzAtyrW8bt17JW/3nDsXRx8+64VElukPk3ssEUywNko3RnFOa3HV3o9P15/Bv9DCJboh6
 ME/iWZCNhqYakFIo/cE2xLigGCZ4FYTAVXNgTb/xDzPX3kTadw4AQAA
X-Change-ID: 20241115-deprecated-srcpv-809341065cdf
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13109;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BfqAZwcu6HZlYQlxL6BmhKKG131eSN3rTeQOINPwS5g=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnVx5ISzNFed0yWpLh+/VVRKV/s4AH0EL5CXCow
 tfsXeJlHx+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1ceSAAKCRDRgEFAKaOo
 Nom8EAC9T0Y235udPTo1OOczbj4a7t/UfdoQ/p5yn84GBgWHn2dQuzRMqvOAgRFLhYAdV1ysRlT
 2wxX7o/XdWUxeC6LiGx9L4Df0Rxj48hpJ5WtHXIjIojLWKV1vKK1jgz9Zofpg1QrBdRxuORuS4h
 43YcZE1POm4mQ7rmhKDUnxmFyCyNnb39HQi1dVilq8FH6K2UQNQXnr/ATW7C2a6rMLVEoMYHuhi
 fKrYKV6OCY8mGK7fXJZPiv4ZLEm5iAAcocwHplvheG73kDcKOb8TboRifBYlDMr/bD+9tPsIwSj
 kufr8oJhOSvR6nEpsoT2FLLn6N+2jN5tYilxmmigN7nmr2MM+VCw0mAjQZoT6WGwfw5OxPirAiA
 X5byVsKx/YKhMEhQiYC2JWqmyNNYgM/TrfYcx7o/NSNT0rNIKphJ7QVMfOLAGzblZ5xoHXVlA0I
 0Pj0xVzhHRwcKMQyucC6JerzBP1uKBwsZFTWKaSpaDeplky2wRd0kcYgaqdo7W1HSCy6eSYEkN9
 1RIOLElHHvmdPEwL57BLMUnQtUMugL+HjBCBfwb1XvJWBY3nMLhUgy1yNopySfopjc6MVWIq/bi
 hsB/R1cQ5SN8++rfGbFF6znt2RkxjrP/T8KEx6I09HAXHzq4Lu48VJ8sHCJL38f7WyqujqOQRZL
 S1JXt/BboiFjYTQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 16:44:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5902

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
Changes in v4:
- Add "specifying versions that contains..." sentence back, as it is
  useful and still valid information. (thanks to Quentin)
- s/simply using/simply setting ``PREFERRED_VERSION_foo`` to/  (thanks to Quentin)
- ``PV`` -> :term:`PV` (thanks to Quentin)
- Link to v3: https://lore.kernel.org/r/20241127-deprecated-srcpv-v3-1-4eb17c564c29@bootlin.com

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
 documentation/ref-manual/variables.rst             | 59 ++++++++++------------
 6 files changed, 47 insertions(+), 63 deletions(-)

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
index 1eee617d59ccddc9af0ffb95ea3635a707718152..e8db89f8c9642b1e36c574e1369093a7a2ce30a4 100644
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
@@ -5157,7 +5156,7 @@ system and gives an overview of their function and contents.
       The :term:`LINUX_VERSION` variable is used to define :term:`PV`
       for the recipe::
 
-         PV = "${LINUX_VERSION}+git${SRCPV}"
+         PV = "${LINUX_VERSION}+git"
 
    :term:`LINUX_VERSION_EXTENSION`
       A string extension compiled into the version string of the Linux
@@ -6720,22 +6719,14 @@ system and gives an overview of their function and contents.
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
+      to ``1.2.3%`` (i.e. simply setting ``PREFERRED_VERSION_foo`` to ``git``
+      will not work as the name of the recipe isn't used, but rather its
+      :term:`PV` definition).
 
       Sometimes the :term:`PREFERRED_VERSION` variable can be set by
       configuration files in a way that is hard to change. You can use
@@ -8321,21 +8312,23 @@ system and gives an overview of their function and contents.
       (SCM).
 
    :term:`SRCPV`
-      Returns the version string of the current package. This string is
-      used to help define the value of :term:`PV`.
+      The variable :term:`SRCPV` is deprecated. It was previously used to
+      include source control information in :term:`PV` for :term:`bitbake` to
+      work correctly but this is no longer a requirement. Source control
+      information will be automatically included by :term:`bitbake` in the
+      variable :term:`PKGV` during packaging if the ``+`` sign is present in
+      :term:`PV`.
 
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
base-commit: 30002019198a168e48537407bb928facb26af82a
change-id: 20241115-deprecated-srcpv-809341065cdf

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


