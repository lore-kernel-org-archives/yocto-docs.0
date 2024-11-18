Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4640D49209
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 10:57:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.38312.1731927424789859728
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 02:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AoR9zykE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C642BC0009;
	Mon, 18 Nov 2024 10:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731927423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q5oCWwNPtKt/iiX5qzny4Bh8R652IaLUhwDl12rodCU=;
	b=AoR9zykE65e3eXDiaLjfGojIu3eIStDv+z0tQbteC3tNUcUu5LuG92sfruOjpOMMQ7B9rN
	6fWQRkK7x8p5HQT8wtmsCWvBtu50plCbbO+0dybXNJsqQBe4RkCSqFKTU0+Q1SslL+UeJ8
	4D3sXTL6k4sbNI+gw9zHZc4mQWIFkcPptLNXCHcAiT635sqjz9/nrrM0kVs02e6z/VxTSe
	U3vmyIfo3JU9uD7//4Rf4Az0ODyzbuSNp6r6Jn8YATYolXaXZThuD7+AY1A8Ydcb3AnYHd
	9BFklz3IqRDLHq73YOHlQ4MzGeCIzAhjyFJ3IiAB0aWlOt/NDt2RE+xBlZo5Sw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 18 Nov 2024 11:56:56 +0100
Subject: [yocto-docs PATCH] Update the documentation for SRCPV
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-deprecated-srcpv-v1-1-bdab9da44267@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHcdO2cC/x2MQQqAMAzAviI9W1jVifoV8SBbp72otCKC+HeHx
 xCSB4xV2GAoHlC+xGTfMlBZQFjnbWGUmBkqVzVE5DHyoRzmkyOahuPCzvV1Q671ISbIWdZJ7n8
 5Tu/7AXj3XSpiAAAA
X-Change-ID: 20241115-deprecated-srcpv-809341065cdf
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11090;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fnufZ4lC3NVJ087aWCdwPRh7SOEryfxn0u+sJjiESfI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnOx1+T4J0bYD4LiS0SV+kQIiugmjI+Du+cHINk
 TFZ0KzEnCeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzsdfgAKCRDRgEFAKaOo
 Nt95EACDdxaC9I2KS8JJT7IlX5Dpf6WUhhb0Atqos58mFuKR8AjBN3z7cnlJvahXa1Oo/0l2OmF
 jVI6bkj9uOOnhdO83rvoOt0qeUSfBWyn+hJZbkfKwFp0bzXRlNopqH2LfcjXJ6qCFSRiUQjK7Tx
 G/8ipmtKi/fG5y3SqDt5i07sDYQM7V07q4NtZO/w5794kaCDQPYheo0KXUoQW8KU5IusXDnfJqQ
 yV9hjdM4Rgo+d5Z5IJIkoNeUsqwJ/UGJan6KexRFJxBVf9bPH1ylB18QZjoxk4W6tGx/O3mJrGS
 XGsmn6U28ZnAF74tThNYG/uMcg1ap0aJdhtF14XV5BluA0W6oiF6PqlO1R4BwS7Neg/J8p0Mg9T
 qd2lXIuaULNs9H0KaNBenlHfF5GZnXNUu6VQjt/GKYewecrIEWxFz2JzVLkIDSfLyNJUjTf1DwD
 GlWmkSCBRuURloBDGknlSTmeYcEjpcMo88+IX4JBzlvcfQeFRw6mI8bpW9r+3hKkfJDy5006nvp
 ur2WCZ/migxn3Aal2/foxtGWGjMQQFaJtJDuJ/u1Bu5CmBxKcklkW+z/kgDTUA858/TdVcv7cMP
 DEk3qDEfHE92L+uUg1coO1fqPhtgLcsWtqxBZdD9+vorlQWjkl3BFWVt+pY7D/2mR7+mRrM3QsL
 b53zOzzooPdj3LA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 10:57:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5757

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
 .../contributor-guide/recipe-style-guide.rst       |  6 ++--
 documentation/dev-manual/external-scm.rst          |  9 +++--
 documentation/dev-manual/new-recipe.rst            | 10 +++---
 documentation/dev-manual/packages.rst              | 13 +++----
 documentation/kernel-dev/common.rst                | 12 ++-----
 documentation/ref-manual/variables.rst             | 42 +++++++++++-----------
 6 files changed, 42 insertions(+), 50 deletions(-)

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
index 97a7e63e366a5f510762e4e62742ef3df5fceda6..92cbadd08e6ab70a984dae3138a1f34e7d41e1d2 100644
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
+:term:`Bitbake` later include the source control information in :term:`PKGV` in
+the packaging phase.
 
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
index fda41694dc60fa738262a2cce33523708c7ce4ab..44c3e32b2a0e74213b1ff1ea3522fd1f59d19ffb 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1562,16 +1562,8 @@ Here are some basic steps you can use to work with your own sources:
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
+      assignment is typically adequate. It uses the value of
+      :term:`LINUX_VERSION`.
 
    -  :term:`COMPATIBLE_MACHINE`:
       A list of the machines supported by your new recipe. This variable
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 43f4d79663bb118f56c2e1b69fb9782357074e65..ef0d0a3c34c2985c587cbbd41ac7df8c24b2a4c4 100644
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
+      software, you need to be sure :term:`PV` contains the ``+`` sign so
+      :term:`bitbake` includes source control information to :term:`PKGV` when
+      packaging the recipe. For example::
+
+        PV = "6.10.y+git"
 
       For more information see the
       ":ref:`dev-manual/packages:automatically incrementing a package version number`"
@@ -5152,7 +5151,7 @@ system and gives an overview of their function and contents.
       The :term:`LINUX_VERSION` variable is used to define :term:`PV`
       for the recipe::
 
-         PV = "${LINUX_VERSION}+git${SRCPV}"
+         PV = "${LINUX_VERSION}+git"
 
    :term:`LINUX_VERSION_EXTENSION`
       A string extension compiled into the version string of the Linux
@@ -6720,9 +6719,10 @@ system and gives an overview of their function and contents.
       For example, consider two recipes ``foo_1.2.bb`` and ``foo_git.bb``
       where ``foo_git.bb`` contains the following assignment::
 
-         PV = "1.1+git${SRCPV}"
+         PV = "1.1+git${@bb.fetch2.get_srcrev(d)}"
 
-      In this case, the correct way to select
+      Here, the variable :term:`PV: will contain source control information that
+      is not possible to predict. In this case, the correct way to select
       ``foo_git.bb`` is by using an assignment such as the following::
 
          PREFERRED_VERSION_foo = "1.1+git%"
@@ -8317,21 +8317,23 @@ system and gives an overview of their function and contents.
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
base-commit: 7d5eb0cee5b2b7096969819d7d7ce569a3c92f27
change-id: 20241115-deprecated-srcpv-809341065cdf

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


