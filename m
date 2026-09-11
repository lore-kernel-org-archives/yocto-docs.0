Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D65C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:12:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41863.1789139519367470000
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=YCAD0g6C;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87F8CC63A0F
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:12:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6DC3601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97BEE11C7AFBA;
	Fri, 11 Sep 2026 17:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q8heGsFVgylSciLgqKZ5+l3pjz6jFHI2rA9x2KdY+Sc=;
	b=YCAD0g6C1mp6tjVH5pbUHRyW2ZBKeIMId2Zs6vcumlRX2+mdnakOAHqU5WtZZ0GROIruGM
	K5BAK9jfV12MKaCCUOzfCSwRlH57gpRZ9nlDtZauyOVDpvBxb37QuNMnpZVlrGw6e4SJir
	Bdkbzbf43PlyyIYQJwFA5LN82HYXQWPP5Z6buFOvlNk73O7+Cy1YgH3PiM5sAa1Bxoll5H
	3B1f4+BxELb2YdUPJvx3xT28E6x3+hbVF32vLsotx0F/aDOtadM1UlmGTg9wc2ioTweWG9
	w+7z/Cg5GPGXol/k6qQdk6nzd10575cZl/dQtwL7TcLeCXT03CtqGoDIxzZJUg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 17:11:14 +0200
Subject: [PATCH 8/8] docs-wide: replace hardcoded conf paths to
 structure.rst refs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260911-remove-local-conf-refs-v1-8-322e1e9a232d@bootlin.com>
References: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
In-Reply-To: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=86148;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PFzOxuMOqoWQ+AlcsauNX3uaZOS13rTSBSh2QORUlJ0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBoYlxLz+TMfrrNMUZdDXYQm2ICrFyLrLy7BR
 DgFmBN4v3qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQaGAAKCRDRgEFAKaOo
 Ntq5D/0WenUphG4hIpV3A0sGzJzXpf+pPrmPB6RJ6nPgJ1UbqYOOhWvT4FJ5iX2s1htaqPz4Sjy
 9Ui/xwFQh4TXHMeg6FHYQS+/yRtUmEvLrTzajHzwWwCRyYdLT8vjYKALi/DXOf6153eWO4vC9QE
 jlQRIAjB6vAVMNfn1Pg25Izg5W3JbI5IVGlavkjZYA3KwkI/uF0BikUfNU4x8LYv/HSrk5emXqD
 ZkFsBSenmI9zkvXyNqSXpaXMhnj2QU/Lgt8badxbCeAfHdd86jKr/6aZ1Xlsg7Cd/LzsjBRWd2S
 E69cxH4MadVe7rhAt4qJVmSJdRgsaxRAG5xR8RsdUcc9afDUtmBPCKI2Pyj0c9ZMRqatAgOsjHh
 /Phxlw9HSy/iRGfSHHy75tnGg95qQLknT5VaWX8I+x+JWcwhofyty5tgsS5BRKPC7ZQqXVvUWjn
 lEhVXvUwqGULm9sMV3q6XWq6sXqrgAaIUOgqW66QeXZikh4HluREonao7TTvOE4dH9S/IbXMGnf
 KK3HtmIzUCCw/O1wzpi3BITbVv/zTeDZdHxAwjtVYA1Di4tfWkpPfFtC2cuf3pGkA2HyaWpI43v
 T6z0HeFxjf5EUdy5QkZKE5n22KiSQxYMLVfXkFGHhHTxGAhzs2dLemUHyX7B6ZfVw80ZAyUiuFa
 p26NLhPVVb5n3mA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:12:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10477

Locate the hardcoded strings for configuration files such as local.conf,
bblayers.conf and such, and replace them with a reference link to our
structure.rst document, which contains information about the purpose of
these files.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst       |  4 +--
 documentation/bsp-manual/bsp.rst                   |  6 ++--
 documentation/dev-manual/bblock.rst                |  2 +-
 documentation/dev-manual/build-quality.rst         |  4 +--
 documentation/dev-manual/building.rst              |  6 ++--
 documentation/dev-manual/custom-distribution.rst   |  8 ++---
 .../custom-template-configuration-directory.rst    |  8 ++---
 documentation/dev-manual/customizing-images.rst    |  6 ++--
 documentation/dev-manual/debugging.rst             | 16 ++++-----
 documentation/dev-manual/device-manager.rst        |  4 +--
 documentation/dev-manual/devtool.rst               |  4 +--
 documentation/dev-manual/disk-space.rst            |  2 +-
 documentation/dev-manual/error-reporting-tool.rst  |  6 ++--
 documentation/dev-manual/external-toolchain.rst    |  2 +-
 documentation/dev-manual/layers.rst                | 22 ++++++------
 documentation/dev-manual/licenses.rst              |  8 ++---
 documentation/dev-manual/limiting-resources.rst    |  2 +-
 documentation/dev-manual/multiconfig.rst           | 10 +++---
 documentation/dev-manual/packages.rst              |  4 +--
 documentation/dev-manual/poky-manual-setup.rst     |  2 +-
 documentation/dev-manual/upgrading-recipes.rst     |  4 +--
 documentation/dev-manual/x32-psabi.rst             |  2 +-
 documentation/kernel-dev/common.rst                | 16 ++++-----
 documentation/migration-guides/migration-1.3.rst   |  4 +--
 documentation/migration-guides/migration-1.6.rst   |  6 ++--
 documentation/migration-guides/migration-1.7.rst   |  4 +--
 documentation/migration-guides/migration-2.0.rst   |  2 +-
 documentation/migration-guides/migration-2.1.rst   |  2 +-
 documentation/migration-guides/migration-4.1.rst   |  2 +-
 documentation/migration-guides/migration-4.2.rst   |  4 +--
 .../migration-guides/release-notes-4.2.rst         |  2 +-
 .../migration-guides/release-notes-5.2.rst         |  2 +-
 .../migration-guides/release-notes-6.0.rst         |  2 +-
 documentation/overview-manual/concepts.rst         | 36 +++++++++-------=
---
 documentation/profile-manual/intro.rst             |  8 ++---
 documentation/ref-manual/classes.rst               |  2 +-
 documentation/ref-manual/devtool-reference.rst     |  2 +-
 documentation/ref-manual/structure.rst             | 12 +++----
 documentation/ref-manual/terms.rst                 |  6 ++--
 documentation/ref-manual/variables.rst             | 42 +++++++++++-----=
------
 documentation/ref-manual/varlocality.rst           |  2 +-
 documentation/sdk-manual/appendix-customizing.rst  |  6 ++--
 documentation/security-manual/securing-images.rst  |  2 +-
 documentation/test-manual/runtime-testing.rst      | 14 ++++----
 .../test-manual/understand-autobuilder.rst         |  4 +--
 documentation/toaster-manual/reference.rst         |  2 +-
 .../transitioning-to-a-custom-environment.rst      |  2 +-
 47 files changed, 159 insertions(+), 159 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation=
/brief-yoctoprojectqs/index.rst
index 4adec9714..f7e4606f1 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -376,7 +376,7 @@ layer>`:
       git clone -b &DISTRO_NAME_NO_CAP; https://git.yoctoproject.org/met=
a-raspberrypi ../layers/meta-raspberrypi
=20
 #.  **Add Your Layer to the Layer Configuration File:** Before you can u=
se
-    it, you must add the layer and its dependencies to your ``bblayers.c=
onf``
+    it, you must add the layer and its dependencies to your :ref:`struct=
ure-build-conf-bblayers.conf`
     file, which is found in the :term:`Build Directory` (``conf/``) dire=
ctory.
=20
     For this, the ``bitbake-layers add-layer`` command can be used:
@@ -410,7 +410,7 @@ layer>`:
     `Synaptics` license. See the :yocto_git:`ipcompliance.md
     </meta-raspberrypi/tree/docs/ipcompliance.md>` document for more inf=
ormation.
     Add the ``synaptics-killswitch`` value to the :term:`LICENSE_FLAGS_A=
CCEPTED`
-    variable, in the ``conf/local.conf`` file of your build directory::
+    variable, in the :ref:`structure-build-conf-local.conf` file of your=
 build directory::
=20
        LICENSE_FLAGS_ACCEPTED =3D "synaptics-killswitch"
=20
diff --git a/documentation/bsp-manual/bsp.rst b/documentation/bsp-manual/=
bsp.rst
index 8eb4f470b..dd6133269 100644
--- a/documentation/bsp-manual/bsp.rst
+++ b/documentation/bsp-manual/bsp.rst
@@ -78,7 +78,7 @@ section in the Yocto Project Development Tasks Manual.
 The BSP layer's base directory (``meta-bsp_root_name``) is the root
 directory of that Layer. This directory is what you add to the
 :term:`BBLAYERS` variable in the
-``conf/bblayers.conf`` file found in your
+:ref:`structure-build-conf-bblayers.conf` file found in your
 :term:`Build Directory`, which is
 established after you run the OpenEmbedded build environment setup
 script (i.e. :ref:`structure-core-script`).
@@ -802,7 +802,7 @@ workflow.
    need to get the build environment ready by sourcing an environment
    setup script (i.e. ``oe-init-build-env``) and you need to be sure two
    key configuration files are configured appropriately: the
-   ``conf/local.conf`` and the ``conf/bblayers.conf`` file. You must
+   :ref:`structure-build-conf-local.conf` and the :ref:`structure-build-=
conf-bblayers.conf` file. You must
    make the OpenEmbedded build system aware of your new layer. See the
    ":ref:`dev-manual/layers:enabling your layer`"
    section in the Yocto Project Development Tasks Manual for information
@@ -1098,7 +1098,7 @@ list describes them in order of preference:
=20
 #. *Use the LICENSE_FLAGS Variable to Define the Recipes that Have Comme=
rcial or
    Other Types of Specially-Licensed Packages:* For each of those recipe=
s, you can
-   specify a matching license string in a ``local.conf`` variable named
+   specify a matching license string in a :ref:`structure-build-conf-loc=
al.conf` variable named
    :term:`LICENSE_FLAGS_ACCEPTED`.
    Specifying the matching license string signifies that you agree to
    the license. Thus, the build system can build the corresponding
diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-manu=
al/bblock.rst
index 605bb7565..b9d6606a9 100644
--- a/documentation/dev-manual/bblock.rst
+++ b/documentation/dev-manual/bblock.rst
@@ -72,7 +72,7 @@ To unlock all recipes, do not specify any recipe::
 Configuration file
 ------------------
=20
-``bblock`` will dump the signatures in the ``build/conf/bblock.conf`` fi=
le,
+``bblock`` will dump the signatures in the :ref:`structure-build-conf-bb=
lock.conf` file,
 included by default in :oe_git:`meta/conf/bitbake.conf </openembedded-co=
re/tree/meta/conf/bitbake.conf>`.
=20
 To dump the file, use the ``-d`` option::
diff --git a/documentation/dev-manual/build-quality.rst b/documentation/d=
ev-manual/build-quality.rst
index 37d18efd2..dc10d1f05 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -304,8 +304,8 @@ The following list shows the files produced for SDKs:
    specific to the extensible SDK although you can set it differently if
    you would like to pull in specific files from the standard SDK.
=20
-   The default files are ``conf/local.conf``, ``conf/bblayers.conf``,
-   ``conf/auto.conf``, ``conf/locked-sigs.inc``, and
+   The default files are :ref:`structure-build-conf-local.conf`, :ref:`s=
tructure-build-conf-bblayers.conf`,
+   :ref:`structure-build-conf-auto.conf`, ``conf/locked-sigs.inc``, and
    ``conf/devtool.conf``. Thus, for an extensible SDK, these files get
    copied into the ``sdk-files`` directory.
=20
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-ma=
nual/building.rst
index 705bad6ed..d36a523f5 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -708,7 +708,7 @@ the external directory and use it as is, not copy it.
 To build from software that comes from an external source, all you need =
to do
 is inherit the :ref:`ref-classes-externalsrc` class and then set
 the :term:`EXTERNALSRC` variable to point to your external source code. =
Here
-are the statements to put in your ``local.conf`` file::
+are the statements to put in your :ref:`structure-build-conf-local.conf`=
 file::
=20
    INHERIT +=3D "externalsrc"
    EXTERNALSRC:pn-myrecipe =3D "path-to-your-source-tree"
@@ -758,7 +758,7 @@ Follow these steps to populate your Downloads directo=
ry:
    an empty location or one that does not yet exist.
=20
 #. *Generate Tarballs of the Source Git Repositories:* Edit your
-   ``local.conf`` configuration file as follows::
+   :ref:`structure-build-conf-local.conf` configuration file as follows:=
:
=20
       DL_DIR =3D "/home/your-download-dir/"
       BB_GENERATE_MIRROR_TARBALLS =3D "1"
@@ -793,7 +793,7 @@ any machine and at any time.
 Follow these steps to build your target using the files in the downloads
 directory:
=20
-#. *Using Local Files Only:* Inside your ``local.conf`` or distro
+#. *Using Local Files Only:* Inside your :ref:`structure-build-conf-loca=
l.conf` or distro
    :term:`configuration file`, add the :term:`SOURCE_MIRROR_URL` variabl=
e,
    inherit the :ref:`ref-classes-own-mirrors` class, and add the
    :term:`BB_NO_NETWORK` variable::
diff --git a/documentation/dev-manual/custom-distribution.rst b/documenta=
tion/dev-manual/custom-distribution.rst
index 365bfa8f7..7129439dd 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -26,7 +26,7 @@ layer. The following steps provide some more detail:
    so that you can keep your Metadata and code for the distribution
    separate. It is strongly recommended that you create and use your own
    layer for configuration and code. Using your own layer as compared to
-   just placing configurations in a ``local.conf`` configuration file
+   just placing configurations in a :ref:`structure-build-conf-local.con=
f` configuration file
    makes it easier to reproduce the same build configuration when using
    multiple build machines. See the
    ":ref:`dev-manual/layers:Creating Your Own Layer`"
@@ -39,7 +39,7 @@ layer. The following steps provide some more detail:
=20
    .. note::
=20
-      The :term:`DISTRO` variable in your ``local.conf`` file determines=
 the
+      The :term:`DISTRO` variable in your :ref:`structure-build-conf-loc=
al.conf` file determines the
       name of your distribution. You can also use the
       :ref:`ref-fragments-builtin-core-distro` configuration fragment.
=20
@@ -81,10 +81,10 @@ layer. The following steps provide some more detail:
 -  *Provide miscellaneous variables:* Be sure to define any other
    variables for which you want to create a default or enforce as part
    of the distribution configuration. You can include nearly any
-   variable from the ``local.conf`` file. The variables you use are not
+   variable from the :ref:`structure-build-conf-local.conf` file. The va=
riables you use are not
    limited to the list in the previous bulleted item.
=20
--  *Point to Your distribution configuration file:* In your ``local.conf=
``
+-  *Point to Your distribution configuration file:* In your :ref:`struct=
ure-build-conf-local.conf`
    file in the :term:`Build Directory`, set your :term:`DISTRO` variable=
 to
    point to your distribution's configuration file. For example, if your
    distribution's configuration file is named ``mydistro.conf``, then
diff --git a/documentation/dev-manual/custom-template-configuration-direc=
tory.rst b/documentation/dev-manual/custom-template-configuration-directo=
ry.rst
index 597772f7f..7febc8c4a 100644
--- a/documentation/dev-manual/custom-template-configuration-directory.rs=
t
+++ b/documentation/dev-manual/custom-template-configuration-directory.rs=
t
@@ -5,8 +5,8 @@ Creating a Custom Template Configuration Directory
=20
 If you are producing your own customized version of the build system for
 use by other users, you might want to provide a custom build configurati=
on
-that includes all the necessary settings and layers (i.e. ``local.conf``=
 and
-``bblayers.conf`` that are created in a new :term:`Build Directory`) and=
 a custom
+that includes all the necessary settings and layers (i.e. :ref:`structur=
e-build-conf-local.conf` and
+:ref:`structure-build-conf-bblayers.conf` that are created in a new :ter=
m:`Build Directory`) and a custom
 message that is shown when setting up the build. This can be done by
 creating one or more template configuration directories in your
 custom distribution layer.
@@ -21,7 +21,7 @@ This can be done by using ``bitbake-layers save-build-c=
onf``::
    TEMPLATECONF=3D/srv/bitbake-builds/layers/meta-alex/conf/templates/te=
st-1 . /srv/bitbake-builds/layers/openembedded-core/oe-init-build-env bui=
ld-try-test-1
=20
 The above command takes the config files from the currently active :term=
:`Build Directory` under ``conf``,
-replaces site-specific paths in ``bblayers.conf`` with ``##OECORE##``-re=
lative paths, and copies
+replaces site-specific paths in :ref:`structure-build-conf-bblayers.conf=
` with ``##OECORE##``-relative paths, and copies
 the config files into a specified layer under a specified template name.
=20
 To use those saved templates as a starting point for a build, users shou=
ld point
@@ -44,7 +44,7 @@ would be::
 If you look at a configuration template directory, you will
 see the ``bblayers.conf.sample``, ``local.conf.sample``, ``conf-summary.=
txt`` and
 ``conf-notes.txt`` files. The build system uses these files to form the
-respective ``bblayers.conf`` file, ``local.conf`` file, and show
+respective :ref:`structure-build-conf-bblayers.conf` file, ``local.conf`=
` file, and show
 users usage information about the build they're setting up
 when running the ``oe-init-build-env`` setup script. These can be
 edited further if needed to improve or change the build configurations
diff --git a/documentation/dev-manual/customizing-images.rst b/documentat=
ion/dev-manual/customizing-images.rst
index 9a345c8bb..ab12e342b 100644
--- a/documentation/dev-manual/customizing-images.rst
+++ b/documentation/dev-manual/customizing-images.rst
@@ -10,7 +10,7 @@ Customizing Images Using ``local.conf``
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Probably the easiest way to customize an image is to add a package by
-way of the ``local.conf`` configuration file. Because it is limited to
+way of the :ref:`structure-build-conf-local.conf` configuration file. Be=
cause it is limited to
 local use, this method generally only allows you to add packages and is
 not as flexible as creating your own customized image. When you add
 packages using local variables this way, you need to realize that these
@@ -56,7 +56,7 @@ high-level image features by using the
 variables. Although the functions for both variables are nearly
 equivalent, best practices dictate using :term:`IMAGE_FEATURES` from wit=
hin
 a recipe and using :term:`EXTRA_IMAGE_FEATURES` from within your
-``local.conf`` for temporary changes (which is found in the :term:`Build
+:ref:`structure-build-conf-local.conf` for temporary changes (which is f=
ound in the :term:`Build
 Directory`) and a distro :term:`configuration file` for permanent change=
s.
=20
 To understand how these features work, the best reference is
@@ -91,7 +91,7 @@ image does not contain an SSH server.
=20
 You can customize your image and change these defaults. Edit the
 :term:`IMAGE_FEATURES` variable in your recipe or use the
-:term:`EXTRA_IMAGE_FEATURES` in your ``local.conf`` file (or distro
+:term:`EXTRA_IMAGE_FEATURES` in your :ref:`structure-build-conf-local.co=
nf` file (or distro
 :term:`configuration file`) so that it configures the image you are work=
ing with
 to include ``ssh-server-dropbear`` or ``ssh-server-openssh``.
=20
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-m=
anual/debugging.rst
index 1718b90d2..4995ba73f 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -113,7 +113,7 @@ variables>` did not work out as expected.
=20
 BitBake's ``bitbake-getvar`` command is used to display variable values =
after
 parsing. The following command displays the variable value for :term:`OV=
ERRIDES`
-after the configuration files (i.e. ``local.conf``, ``bblayers.conf``,
+after the configuration files (i.e. ``local.conf``, :ref:`structure-buil=
d-conf-bblayers.conf`,
 ``bitbake.conf`` and so forth) have been parsed::
=20
    $ bitbake-getvar OVERRIDES
@@ -787,7 +787,7 @@ In this example, compiling the "neard" package is cau=
sing the problem.
 So the first thing to do is build "neard" locally. Before you start the
 build, set the
 :term:`PARALLEL_MAKE` variable
-in your ``local.conf`` file to a high number (e.g. "-j 20"). Using a
+in your :ref:`structure-build-conf-local.conf` file to a high number (e.=
g. "-j 20"). Using a
 high value for :term:`PARALLEL_MAKE` increases the chances of the race
 condition showing up::
=20
@@ -943,7 +943,7 @@ To run a ``debuginfod`` server, you need to do the fo=
llowing:
    (it already is in :term:`OpenEmbedded-Core (OE-Core)` defaults and
    :term:`Poky` reference distribution).
=20
-   If not, set in your distro :term:`configuration file` or in ``local.c=
onf``::
+   If not, set in your distro :term:`configuration file` or in :ref:`str=
ucture-build-conf-local.conf`::
=20
       DISTRO_FEATURES:append =3D " debuginfod"
=20
@@ -1010,7 +1010,7 @@ debugger.
 #. *Configure your build system to construct the companion debug
    filesystem:*
=20
-   In your ``local.conf`` file, set the following::
+   In your :ref:`structure-build-conf-local.conf` file, set the followin=
g::
=20
       IMAGE_GEN_DEBUGFS =3D "1"
       IMAGE_FSTYPES_DEBUGFS =3D "tar.bz2"
@@ -1029,7 +1029,7 @@ debugger.
=20
 #. *Configure the system to include gdbserver in the target filesystem:*
=20
-   Make the following addition in your ``local.conf`` file::
+   Make the following addition in your :ref:`structure-build-conf-local.=
conf` file::
=20
       EXTRA_IMAGE_FEATURES:append =3D " tools-debug"
=20
@@ -1165,7 +1165,7 @@ debug on the target hardware.
 To support this kind of debugging, you need do the following:
=20
 -  Ensure that GDB is on the target. You can do this by making
-   the following addition to your ``local.conf`` file::
+   the following addition to your :ref:`structure-build-conf-local.conf`=
 file::
=20
       EXTRA_IMAGE_FEATURES:append =3D " tools-debug"
=20
@@ -1174,7 +1174,7 @@ To support this kind of debugging, you need do the =
following:
=20
       IMAGE_INSTALL:append =3D " packagename-dbg"
=20
-   Alternatively, you can add the following to ``local.conf`` to include
+   Alternatively, you can add the following to :ref:`structure-build-con=
f-local.conf` to include
    all the debug symbols::
=20
       EXTRA_IMAGE_FEATURES:append =3D " dbg-pkgs"
@@ -1183,7 +1183,7 @@ To support this kind of debugging, you need do the =
following:
=20
    To improve the debug information accuracy, you can reduce the level
    of optimization used by the compiler. For example, when adding the
-   following line to your ``local.conf`` file, you will reduce optimizat=
ion
+   following line to your :ref:`structure-build-conf-local.conf` file, y=
ou will reduce optimization
    from :term:`FULL_OPTIMIZATION` of "-O2" to :term:`DEBUG_OPTIMIZATION`
    of "-O -fno-omit-frame-pointer"::
=20
diff --git a/documentation/dev-manual/device-manager.rst b/documentation/=
dev-manual/device-manager.rst
index 757b23d1a..cc27b667a 100644
--- a/documentation/dev-manual/device-manager.rst
+++ b/documentation/dev-manual/device-manager.rst
@@ -32,7 +32,7 @@ Table file. The
 :term:`IMAGE_DEVICE_TABLES`
 variable defines the Device Table to use and should be set in the
 machine or distro :term:`configuration file`. Alternatively, you can set=
 this
-variable in your ``local.conf`` configuration file.
+variable in your :ref:`structure-build-conf-local.conf` configuration fi=
le.
=20
 If you do not define the :term:`IMAGE_DEVICE_TABLES` variable, the defau=
lt
 ``device_table-minimal.txt`` is used::
@@ -64,7 +64,7 @@ To have more control over the device nodes, you can use=
 a device manager like
 ``udev`` or ``busybox-mdev``. You choose the device manager by defining =
the
 :term:`VIRTUAL-RUNTIME_dev_manager <VIRTUAL-RUNTIME>` variable in your m=
achine
 or distro :term:`configuration file`. Alternatively, you can set this va=
riable in
-your ``local.conf`` configuration file::
+your :ref:`structure-build-conf-local.conf` configuration file::
=20
    VIRTUAL-RUNTIME_dev_manager =3D "udev"
=20
diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-man=
ual/devtool.rst
index d67f22277..242ea9dd9 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -445,7 +445,7 @@ installers.
 functionality of the SDK and the eSDK installers. Compared to the instal=
lers,
 however, the SDK created with ``devtool ide-sdk`` is much more flexible.
 For example, it is very easy to change the :term:`MACHINE` in the
-``local.conf`` file, update the layer meta data and then regenerate the =
SDK.
+:ref:`structure-build-conf-local.conf` file, update the layer meta data =
and then regenerate the SDK.
=20
 Let's take a look at an example of how to use ``devtool ide-sdk`` in eac=
h of
 the two modes:
@@ -454,7 +454,7 @@ the two modes:
=20
    In order to use the ``devtool ide-sdk``, a few settings are needed. A=
s a
    starting example, the following lines of code can be added to the
-   ``local.conf`` file::
+   :ref:`structure-build-conf-local.conf` file::
=20
       # Build the companion debug file system
       IMAGE_GEN_DEBUGFS =3D "1"
diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-=
manual/disk-space.rst
index ba3afa5a2..5516f793e 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -7,7 +7,7 @@ Conserving Disk Space During Builds
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 To help conserve disk space during builds, you can add the following
-statement to your project's ``local.conf`` configuration file found in
+statement to your project's :ref:`structure-build-conf-local.conf` confi=
guration file found in
 the :term:`Build Directory`::
=20
    INHERIT +=3D "rm_work"
diff --git a/documentation/dev-manual/error-reporting-tool.rst b/document=
ation/dev-manual/error-reporting-tool.rst
index 30d1ce2b3..dabade078 100644
--- a/documentation/dev-manual/error-reporting-tool.rst
+++ b/documentation/dev-manual/error-reporting-tool.rst
@@ -27,7 +27,7 @@ Enabling and Using the Tool
=20
 By default, the error reporting tool is disabled. You can enable it by
 inheriting the :ref:`ref-classes-report-error` class by adding the
-following statement to the end of your ``local.conf`` file in your
+following statement to the end of your :ref:`structure-build-conf-local.=
conf` file in your
 :term:`Build Directory`::
=20
    INHERIT +=3D "report-error"
@@ -35,7 +35,7 @@ following statement to the end of your ``local.conf`` f=
ile in your
 By default, the error reporting feature stores information in
 ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 However, you can specify a directory to use by adding the following to
-your ``local.conf`` file::
+your :ref:`structure-build-conf-local.conf` file::
=20
    ERR_REPORT_DIR =3D "path"
=20
@@ -69,7 +69,7 @@ Disabling the Tool
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 To disable the error reporting feature, simply remove or comment out the
-following statement from the end of your ``local.conf`` file in your
+following statement from the end of your :ref:`structure-build-conf-loca=
l.conf` file in your
 :term:`Build Directory`::
=20
    INHERIT +=3D "report-error"
diff --git a/documentation/dev-manual/external-toolchain.rst b/documentat=
ion/dev-manual/external-toolchain.rst
index ea196b67a..94b4e67a8 100644
--- a/documentation/dev-manual/external-toolchain.rst
+++ b/documentation/dev-manual/external-toolchain.rst
@@ -12,7 +12,7 @@ follows:
    steps to build and install the toolchain.
=20
 -  Make sure you add the layer that contains the toolchain to your
-   ``bblayers.conf`` file through the
+   :ref:`structure-build-conf-bblayers.conf` file through the
    :term:`BBLAYERS` variable.
=20
 -  Set the :term:`EXTERNAL_TOOLCHAIN` variable in your
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manu=
al/layers.rst
index 49dc7a6e9..50e276cc0 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -75,7 +75,7 @@ Follow these general steps to create your layer without=
 using tools:
       Add your new layer with 'bitbake-layers add-layer meta-scottrif'
=20
    In order to use a layer with the :term:`OpenEmbedded Build System`, y=
ou
-   need to add the layer to your ``bblayers.conf`` configuration
+   need to add the layer to your :ref:`structure-build-conf-bblayers.con=
f` configuration
    file, as hinted by the previous command. See the
    ":ref:`dev-manual/layers:adding a layer using the \`\`bitbake-layers\=
`\`
    script`" section for more information.
@@ -219,7 +219,7 @@ following list:
       The dependency is created during any
       build that includes the layer ``meta-one``. However, you might not
       want this dependency for all machines. For example, suppose you
-      are building for machine "two" but your ``bblayers.conf`` file has
+      are building for machine "two" but your :ref:`structure-build-conf=
-bblayers.conf` file has
       the ``meta-one`` layer included. During the build, the
       ``base-files`` for machine "two" will also have the dependency on
       ``foo``.
@@ -267,7 +267,7 @@ following list:
       The build for machine "one" will pick up your machine-specific fil=
e as
       long as you have the file in
       ``meta-one/recipes-core/base-files/base-files/``. However, if you
-      are building for a different machine and the ``bblayers.conf``
+      are building for a different machine and the :ref:`structure-build=
-conf-bblayers.conf`
       file includes the ``meta-one`` layer and the location of your
       machine-specific file is the first location where that file is
       found according to :term:`FILESPATH`, builds for all machines will
@@ -466,7 +466,7 @@ Enabling Your Layer
=20
 Before the OpenEmbedded build system can use your new layer, you need to
 enable it. To enable your layer, simply add your layer's path to the
-:term:`BBLAYERS` variable in your ``conf/bblayers.conf`` file, which is
+:term:`BBLAYERS` variable in your :ref:`structure-build-conf-bblayers.co=
nf` file, which is
 found in the :term:`Build Directory`. The following example shows how to
 enable your new ``meta-mylayer`` layer (note how your new layer exists
 outside of the official ``poky`` repository which you would have checked
@@ -485,7 +485,7 @@ out earlier)::
        "
=20
 BitBake parses each ``conf/layer.conf`` file from the top down as
-specified in the :term:`BBLAYERS` variable within the ``conf/bblayers.co=
nf``
+specified in the :term:`BBLAYERS` variable within the :ref:`structure-bu=
ild-conf-bblayers.conf`
 file. During the processing of each ``conf/layer.conf`` file, BitBake
 adds the recipes, classes and configurations contained within the
 particular layer to the source directory.
@@ -822,9 +822,9 @@ The following list describes the available commands:
 -  ``show-cross-depends:`` Lists dependency relationships between
    recipes that cross layer boundaries.
=20
--  ``add-layer:`` Adds a layer to ``bblayers.conf``.
+-  ``add-layer:`` Adds a layer to :ref:`structure-build-conf-bblayers.co=
nf`.
=20
--  ``remove-layer:`` Removes a layer from ``bblayers.conf``
+-  ``remove-layer:`` Removes a layer from :ref:`structure-build-conf-bbl=
ayers.conf`
=20
 -  ``flatten:`` Flattens the layer configuration into a separate
    output directory. Flattening your layer configuration builds a
@@ -870,13 +870,13 @@ The following list describes the available commands=
:
=20
 -  ``layerindex-fetch``: Fetches a layer from a layer index, along
    with its dependent layers, and adds the layers to the
-   ``conf/bblayers.conf`` file.
+   :ref:`structure-build-conf-bblayers.conf` file.
=20
 -  ``layerindex-show-depends``: Finds layer dependencies from the
    layer index.
=20
 -  ``save-build-conf``: Saves the currently active build configuration
-   (``conf/local.conf``, ``conf/bblayers.conf``) as a template into a la=
yer.
+   (:ref:`structure-build-conf-local.conf`, :ref:`structure-build-conf-b=
blayers.conf`) as a template into a layer.
    This template can later be used for setting up builds via :term:`TEMP=
LATECONF`.
    For information about saving and using configuration templates, see
    ":ref:`dev-manual/custom-template-configuration-directory:creating a =
custom template configuration directory`".
@@ -893,7 +893,7 @@ Adding a Layer Using the ``bitbake-layers`` Script
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
 Once you create your general layer, you must add it to your
-``bblayers.conf`` file. Adding the layer to this configuration file
+:ref:`structure-build-conf-bblayers.conf` file. Adding the layer to this=
 configuration file
 makes the OpenEmbedded build system aware of your layer so that it can
 search it for metadata.
=20
@@ -904,7 +904,7 @@ Add your layer by using the ``bitbake-layers add-laye=
r`` command::
 Here is an example that adds a
 layer named ``meta-scottrif`` to the configuration file. Following the
 command that adds the layer is another ``bitbake-layers`` command that
-shows the layers that are in your ``bblayers.conf`` file:
+shows the layers that are in your :ref:`structure-build-conf-bblayers.co=
nf` file:
=20
 .. code-block:: console
=20
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-ma=
nual/licenses.rst
index b5091087e..fc23871c8 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -134,7 +134,7 @@ In order for a component restricted by a
 :term:`LICENSE_FLAGS` definition to be enabled and included in an image,=
 it
 needs to have a matching entry in the global
 :term:`LICENSE_FLAGS_ACCEPTED`
-variable, which is a variable typically defined in your ``local.conf``
+variable, which is a variable typically defined in your :ref:`structure-=
build-conf-local.conf`
 file. For example, to enable the
 ``meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly`` package =
of
 :term:`OpenEmbedded-Core (OE-Core)`, you
@@ -251,7 +251,7 @@ defined in the
    COMMERCIAL_VIDEO_PLUGINS ?=3D ""
=20
 If you want to enable these components, you can do so by making sure you=
 have
-statements similar to the following in your ``local.conf`` configuration=
 file::
+statements similar to the following in your :ref:`structure-build-conf-l=
ocal.conf` configuration file::
=20
    COMMERCIAL_AUDIO_PLUGINS =3D "gst-plugins-ugly-mad \
        gst-plugins-ugly-mpegaudioparse"
@@ -361,7 +361,7 @@ create them with various levels of compliance in mind=
.
=20
 One way of doing this (but certainly not the only way) is to release
 just the source as a tarball. You can do this by adding the following to
-the ``local.conf`` file found in the :term:`Build Directory`::
+the :ref:`structure-build-conf-local.conf` file found in the :term:`Buil=
d Directory`::
=20
    INHERIT +=3D "archiver"
    ARCHIVER_MODE[src] =3D "original"
@@ -473,7 +473,7 @@ One thing a development organization might want to co=
nsider for end-user
 convenience is to provide its own version of the
 :oecore_path:`meta/conf/templates/default/bblayers.conf.sample` file to =
ensure that when
 the end user utilizes the released build system to build an image, the
-development organization's layers are included in the ``bblayers.conf`` =
file
+development organization's layers are included in the :ref:`structure-bu=
ild-conf-bblayers.conf` file
 automatically::
=20
    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblaye=
rs.conf
diff --git a/documentation/dev-manual/limiting-resources.rst b/documentat=
ion/dev-manual/limiting-resources.rst
index 9b3db0a59..892b0069a 100644
--- a/documentation/dev-manual/limiting-resources.rst
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -38,7 +38,7 @@ details.
=20
    If you want to have a different limit from the rest of the build for =
a
    recipe, it is also possible to achieve with the following line added =
to your
-   ``local.conf`` :term:`configuration file`::
+   :ref:`structure-build-conf-local.conf` :term:`configuration file`::
=20
       PARALLEL_MAKE:pn-linux-yocto =3D "-j4"
=20
diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev=
-manual/multiconfig.rst
index 71fe542ef..58ff95c17 100644
--- a/documentation/dev-manual/multiconfig.rst
+++ b/documentation/dev-manual/multiconfig.rst
@@ -20,7 +20,7 @@ To accomplish a multiple configuration build, you must =
define each
 target's configuration separately using a parallel :term:`configuration =
file` in
 the :term:`Build Directory` or configuration directory within a layer, a=
nd you
 must follow a required file hierarchy. Additionally, you must enable the
-multiple configuration builds in your ``local.conf`` file.
+multiple configuration builds in your :ref:`structure-build-conf-local.c=
onf` file.
=20
 Follow these steps to set up and execute multiple configuration builds:
=20
@@ -74,7 +74,7 @@ Follow these steps to set up and execute multiple confi=
guration builds:
 -  *Add the BitBake Multi-configuration Variable to the Local
    Configuration File*: Use the
    :term:`BBMULTICONFIG`
-   variable in your ``conf/local.conf`` configuration file to specify
+   variable in your :ref:`structure-build-conf-local.conf` configuration=
 file to specify
    each multiconfig. Continuing with the example from the previous
    figure, the :term:`BBMULTICONFIG` variable needs to enable two
    multiconfigs: "x86" and "arm" by specifying each configuration file::
@@ -85,7 +85,7 @@ Follow these steps to set up and execute multiple confi=
guration builds:
=20
       A "default" configuration already exists by definition. This
       configuration is named: "" (i.e. empty string) and is defined by
-      the variables coming from your ``local.conf``
+      the variables coming from your :ref:`structure-build-conf-local.co=
nf`
       file. Consequently, the previous example actually adds two
       additional configurations to your build: "arm" and "x86" along
       with "".
@@ -107,7 +107,7 @@ Follow these steps to set up and execute multiple con=
figuration builds:
    -  A ``core-image-sato`` image that is configured through the ``arm.c=
onf``
       configuration file
=20
-   -  A ``core-image-base`` that is configured through your ``local.conf=
``
+   -  A ``core-image-base`` that is configured through your :ref:`struct=
ure-build-conf-local.conf`
       configuration file
=20
 .. note::
@@ -178,7 +178,7 @@ Suggested best practices
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 -  :term:`TMPDIR` (other than the default set in bitbake.conf) is only s=
et in
-   ``local.conf`` by the user. This means that we should **not** manipul=
ate
+   :ref:`structure-build-conf-local.conf` by the user. This means that w=
e should **not** manipulate
    :term:`TMPDIR` in any way within the Machine or Distro :term:`configu=
ration
    file`.
=20
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-ma=
nual/packages.rst
index 95488c761..0271cca10 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -163,7 +163,7 @@ be consistent and correct with the latest changes.
 The simplest form for a PR Service is for a single host development syst=
em
 that builds the package feed (building system). For this scenario, you c=
an
 enable a local PR Service by setting :term:`PRSERV_HOST` in your
-``local.conf`` file in the :term:`Build Directory`::
+:ref:`structure-build-conf-local.conf` file in the :term:`Build Director=
y`::
=20
    PRSERV_HOST =3D "localhost:0"
=20
@@ -959,7 +959,7 @@ NPM packages:
    part of the OpenEmbedded environment. You need to get the package by
    cloning the :oe_git:`meta-openembedded </meta-openembedded>`
    repository. Be sure to add the path to your local copy
-   to your ``bblayers.conf`` file.
+   to your :ref:`structure-build-conf-bblayers.conf` file.
=20
 -  ``devtool`` cannot detect native libraries in module dependencies.
    Consequently, you must manually add packages to your recipe.
diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentati=
on/dev-manual/poky-manual-setup.rst
index 5e65763d5..ca8539b6b 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -103,7 +103,7 @@ an entire Linux distribution, including the toolchain=
, from source.
     Directory` contains all the files created during the build.
=20
 #.  **Examine Your Local Configuration File:** When you set up the build
-    environment, a local configuration file named ``local.conf`` becomes
+    environment, a local configuration file named :ref:`structure-build-=
conf-local.conf` becomes
     available in a ``conf`` sub-directory of the :term:`Build Directory`=
. For
     this example, the defaults are set to build for a ``qemux86-64`` tar=
get,
     which is suitable for emulation. The package manager used is set to =
the RPM
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentati=
on/dev-manual/upgrading-recipes.rst
index 5c4e7df5d..0bdc1351e 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -96,14 +96,14 @@ The following steps describe how to set up the AUH ut=
ility:
    undesirably.
=20
 #. *Make Configurations in Your Local Configuration File:* Several
-   settings are needed in the ``local.conf`` file in the build
+   settings are needed in the :ref:`structure-build-conf-local.conf` fil=
e in the build
    directory you just created for AUH. Make these following
    configurations:
=20
    -  If you want to enable :ref:`Build
       History <dev-manual/build-quality:maintaining build output quality=
 with \`\`buildhistory\`\`>`,
       which is optional, you need the following lines in the
-      ``conf/local.conf`` file::
+      :ref:`structure-build-conf-local.conf` file::
=20
          INHERIT =3D+ "buildhistory"
          BUILDHISTORY_COMMIT =3D "1"
diff --git a/documentation/dev-manual/x32-psabi.rst b/documentation/dev-m=
anual/x32-psabi.rst
index 0a19d2823..4ee5a5379 100644
--- a/documentation/dev-manual/x32-psabi.rst
+++ b/documentation/dev-manual/x32-psabi.rst
@@ -38,7 +38,7 @@ follows:
=20
 -  There is support for large images.
=20
-To use the x32 psABI, you need to edit your ``conf/local.conf``
+To use the x32 psABI, you need to edit your :ref:`structure-build-conf-l=
ocal.conf`
 configuration file as follows::
=20
    MACHINE =3D "qemux86-64"
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-d=
ev/common.rst
index af06e8dcd..2a65055e2 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -93,7 +93,7 @@ section:
 #. *Inform the BitBake Build Environment About Your Layer:* As directed
    when you created your layer, you need to add the layer to the
    :term:`BBLAYERS` variable in the
-   ``bblayers.conf`` file as follows::
+   :ref:`structure-build-conf-bblayers.conf` file as follows::
=20
       $ cd bitbake-builds/build
       $ bitbake-layers add-layer ../../meta-mylayer
@@ -148,7 +148,7 @@ section:
 #. *Prepare Your local.conf File:* By default, the :term:`MACHINE` varia=
ble is
    set to "qemux86-64", which is fine if you are building for the QEMU e=
mulator
    in 64-bit mode. However, if you are not, you need to set the :term:`M=
ACHINE`
-   variable appropriately in your ``conf/local.conf`` file found in the
+   variable appropriately in your :ref:`structure-build-conf-local.conf`=
 file found in the
    :term:`Build Directory` (i.e.  ``bitbake-builds/build`` in this examp=
le).
=20
    Also, since you are preparing to work on the kernel image, you need
@@ -189,7 +189,7 @@ section:
 #. *Inform the BitBake Build Environment About Your Layer:* As directed
    when you created your layer, you need to add the layer to the
    :term:`BBLAYERS` variable in the
-   ``bblayers.conf`` file as follows::
+   :ref:`structure-build-conf-bblayers.conf` file as follows::
=20
       $ cd bitbake-builds/build
       $ bitbake-layers add-layer ../../meta-mylayer
@@ -835,16 +835,16 @@ Section.
    pick up the changes.
=20
 #. *Update Your local.conf File to Point to Your Source Files:* In
-   addition to your ``local.conf`` file specifying to use
+   addition to your :ref:`structure-build-conf-local.conf` file specifyi=
ng to use
    "kernel-modules" and the "qemux86" machine, it must also point to the
    updated kernel source files. Add
    :term:`SRC_URI` and
    :term:`SRCREV` statements similar
-   to the following to your ``local.conf``::
+   to the following to your :ref:`structure-build-conf-local.conf`::
=20
       $ cd bitbake-builds/build/conf
=20
-   Add the following to the ``local.conf``::
+   Add the following to the :ref:`structure-build-conf-local.conf`::
=20
       SRC_URI:pn-linux-yocto =3D "git:///path-to/linux-yocto-4.12;protoc=
ol=3Dfile;name=3Dmachine;branch=3Dstandard/base; \
                                 git:///path-to/yocto-kernel-cache;protoc=
ol=3Dfile;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.12;destsuffix=3D${KME=
TA}"
@@ -859,7 +859,7 @@ Section.
       example, the branch is ``standard/base`` and the machine is ``qemu=
x86``.
=20
 #. *Build the Image:* With the source modified, your changes staged and
-   committed, and the ``local.conf`` file pointing to the kernel files,
+   committed, and the :ref:`structure-build-conf-local.conf` file pointi=
ng to the kernel files,
    you can now use BitBake to build the image::
=20
       $ cd bitbake-builds/build
@@ -1193,7 +1193,7 @@ information on how to use the output as a configura=
tion fragment.
 Where do you put your configuration fragment files? You can place these
 files in an area pointed to by
 :term:`SRC_URI` as directed by your
-``bblayers.conf`` file, which is located in your layer. The OpenEmbedded
+:ref:`structure-build-conf-bblayers.conf` file, which is located in your=
 layer. The OpenEmbedded
 build system picks up the configuration and adds it to the kernel's
 configuration. For example, suppose you had a set of configuration
 options in a file called ``myconfig.cfg``. If you put that file inside a
diff --git a/documentation/migration-guides/migration-1.3.rst b/documenta=
tion/migration-guides/migration-1.3.rst
index 594320d5e..0c378aabe 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -12,7 +12,7 @@ Local Configuration
 -------------------
=20
 Differences include changes for
-:term:`SSTATE_MIRRORS` and ``bblayers.conf``.
+:term:`SSTATE_MIRRORS` and :ref:`structure-build-conf-bblayers.conf`.
=20
 .. _migration-1.3-sstate-mirrors:
=20
@@ -42,7 +42,7 @@ The ``meta-yocto`` layer consists of two parts that cor=
respond to the
 Poky reference distribution and the reference hardware Board Support
 Packages (BSPs), respectively: ``meta-yocto`` and ``meta-yocto-bsp``.
 When running BitBake for the first time after upgrading, your
-``conf/bblayers.conf`` file will be updated to handle this change and
+:ref:`structure-build-conf-bblayers.conf` file will be updated to handle=
 this change and
 you will be asked to re-run or restart for the changes to take effect.
=20
 .. _1.3-recipes:
diff --git a/documentation/migration-guides/migration-1.6.rst b/documenta=
tion/migration-guides/migration-1.6.rst
index b052a43a3..e55924e38 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -247,15 +247,15 @@ the :ref:`ref-classes-autotools` or ``autotools_sta=
ge`` classes.
=20
 ``qemu-native`` now builds without SDL-based graphical output support by
 default. The following additional lines are needed in your
-``local.conf`` to enable it::
+:ref:`structure-build-conf-local.conf` to enable it::
=20
    PACKAGECONFIG_pn-qemu-native =3D "sdl"
    ASSUME_PROVIDED +=3D "libsdl-native"
=20
 .. note::
=20
-   The default ``local.conf`` contains these statements. Consequently, i=
f you
-   are building a headless system and using a default ``local.conf``
+   The default :ref:`structure-build-conf-local.conf` contains these sta=
tements. Consequently, if you
+   are building a headless system and using a default :ref:`structure-bu=
ild-conf-local.conf`
    file, you will need comment these two lines out.
=20
 .. _migration-1.6-core-image-basic:
diff --git a/documentation/migration-guides/migration-1.7.rst b/documenta=
tion/migration-guides/migration-1.7.rst
index 1a5704fd4..8527213b8 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -14,10 +14,10 @@ Changes to Setting QEMU ``PACKAGECONFIG`` Options in =
``local.conf``
 The QEMU recipe now uses a number of
 :term:`PACKAGECONFIG` options to enable various
 optional features. The method used to set defaults for these options
-means that existing ``local.conf`` files will need to be modified to
+means that existing :ref:`structure-build-conf-local.conf` files will ne=
ed to be modified to
 append to :term:`PACKAGECONFIG` for ``qemu-native`` and ``nativesdk-qemu=
``
 instead of setting it. In other words, to enable graphical output for
-QEMU, you should now have these lines in ``local.conf``::
+QEMU, you should now have these lines in :ref:`structure-build-conf-loca=
l.conf`::
=20
    PACKAGECONFIG_append_pn-qemu-native =3D " sdl"
    PACKAGECONFIG_append_pn-nativesdk-qemu =3D " sdl"
diff --git a/documentation/migration-guides/migration-2.0.rst b/documenta=
tion/migration-guides/migration-2.0.rst
index 13be9846d..b98f2277e 100644
--- a/documentation/migration-guides/migration-2.0.rst
+++ b/documentation/migration-guides/migration-2.0.rst
@@ -195,7 +195,7 @@ configuration are now automatically removed from sysr=
oot as well as
 removed from any other place managed by shared state. This automatic
 cleanup means that the build system now properly handles situations such
 as renaming the build system side of recipes, removal of layers from
-``bblayers.conf``, and :term:`DISTRO_FEATURES`
+:ref:`structure-build-conf-bblayers.conf`, and :term:`DISTRO_FEATURES`
 changes.
=20
 Additionally, work directories for old versions of recipes are now
diff --git a/documentation/migration-guides/migration-2.1.rst b/documenta=
tion/migration-guides/migration-2.1.rst
index 4d7aa15af..473dd10ff 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -251,7 +251,7 @@ The following changes have been made for the Poky dis=
tribution:
    distribution. The ``meta-yocto-bsp`` layer retains its original name
    since it provides reference machines for the Yocto Project and it is
    otherwise unrelated to Poky. References to ``meta-yocto`` in your
-   ``conf/bblayers.conf`` should automatically be updated, so you should
+   :ref:`structure-build-conf-bblayers.conf` should automatically be upd=
ated, so you should
    not need to change anything unless you are relying on this naming
    elsewhere.
=20
diff --git a/documentation/migration-guides/migration-4.1.rst b/documenta=
tion/migration-guides/migration-4.1.rst
index 86721b987..2daaffb1d 100644
--- a/documentation/migration-guides/migration-4.1.rst
+++ b/documentation/migration-guides/migration-4.1.rst
@@ -87,7 +87,7 @@ existing ``classes`` subdirectory will continue to work=
 in any context as before
 Other than knowing where to look when manually browsing the class files,=
 this is
 not likely to require any changes to your configuration. However, if in =
your
 configuration you were using some classes in the incorrect context, you =
will now
-receive an error during parsing. For example, the following in ``local.c=
onf`` will
+receive an error during parsing. For example, the following in :ref:`str=
ucture-build-conf-local.conf` will
 now cause an error::
=20
    INHERIT +=3D "testimage"
diff --git a/documentation/migration-guides/migration-4.2.rst b/documenta=
tion/migration-guides/migration-4.2.rst
index f5f12c887..990e16e8f 100644
--- a/documentation/migration-guides/migration-4.2.rst
+++ b/documentation/migration-guides/migration-4.2.rst
@@ -164,7 +164,7 @@ Additionally, the :term:`LAYERSERIES_COMPAT` value fo=
r the devtool workspace
 layer is now set at the time of creation, thus if you upgrade with the
 workspace layer enabled and you wish to retain it, you will need to manu=
ally
 update the :term:`LAYERSERIES_COMPAT` value in ``workspace/conf/layer.co=
nf``
-(or remove the path from :term:`BBLAYERS` in ``conf/bblayers.conf`` and
+(or remove the path from :term:`BBLAYERS` in :ref:`structure-build-conf-=
bblayers.conf` and
 delete/move the ``workspace`` directory out of the way if you no longer
 need it).
=20
@@ -183,7 +183,7 @@ possibly Internet reachable network interfaces. Thus,=
 in this
 release we limit qemu port forwarding to localhost (127.0.0.1).
=20
 However, if you need the qemu machine to be reachable from the
-network, then it can be enabled via ``conf/local.conf`` or machine
+network, then it can be enabled via :ref:`structure-build-conf-local.con=
f` or machine
 config variable ``QB_SLIRP_OPT``::
=20
    QB_SLIRP_OPT =3D "-netdev user,id=3Dnet0,hostfwd=3Dtcp::2222-:22"
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/docum=
entation/migration-guides/release-notes-4.2.rst
index 529be7da2..f50ef180a 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -242,7 +242,7 @@ New Features / Enhancements in 4.2
 -  bitbake-layers improvements:
=20
    -  ``layerindex-fetch``: checkout layer(s) branch when clone exists
-   -  ``create``: add ``-a``/``--add-layer option`` to add layer to ``bb=
layers.conf`` after creating layer
+   -  ``create``: add ``-a``/``--add-layer option`` to add layer to :ref=
:`structure-build-conf-bblayers.conf` after creating layer
    -  ``show-layers``: improve output layout
=20
 -  Other BitBake improvements:
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/docum=
entation/migration-guides/release-notes-5.2.rst
index b5483c903..111162bc9 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -383,7 +383,7 @@ New Features / Enhancements in |yocto-ver|
          was left off in the previous execution.
=20
    -  ``knotty`` now hints the user if :term:`MACHINE` was not set in
-      the ``local.conf`` file.
+      the :ref:`structure-build-conf-local.conf` file.
=20
    -  ``utils``: add Go mod h1 checksum support, specific to Go modules.=
 Use
       with ``goh1``.
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/docum=
entation/migration-guides/release-notes-6.0.rst
index 1ce7d5120..5ae78daf0 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -451,7 +451,7 @@ New Features / Enhancements in |yocto-ver|
=20
       -  Share :ref:`overview-manual/concepts:Shared State` by default b=
etween
          builds, by adding a definition for :term:`SSTATE_DIR` and
-         :term:`BB_HASHSERVE_DB_DIR` in the ``site.conf`` file created b=
y
+         :term:`BB_HASHSERVE_DB_DIR` in the :ref:`structure-build-conf-a=
uto.conf` file created by
          :ref:`bitbake:ref-bbsetup-command-init`
          (:bitbake_rev:`a70c336790a9188aae67975fac6ca13579ad1d3e`)
=20
diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
index e0e3c0398..3bf672c78 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -273,23 +273,23 @@ Here is a non-exhaustive list:
=20
 .. note::
=20
-   Configurations set in the ``conf/local.conf`` file can also be set
-   in the ``conf/site.conf`` and ``conf/auto.conf`` configuration files.
+   Configurations set in the :ref:`structure-build-conf-local.conf` file=
 can also be set
+   in the :ref:`structure-build-conf-site.conf` and :ref:`structure-buil=
d-conf-auto.conf` configuration files.
=20
-The ``bblayers.conf`` file tells BitBake what layers you want considered
+The :ref:`structure-build-conf-bblayers.conf` file tells BitBake what la=
yers you want considered
 during the build. By default, the layers listed in this file include
 layers minimally needed by the build system. However, you must manually
 add any custom layers you have created. You can find more information on
-working with the ``bblayers.conf`` file in the
+working with the :ref:`structure-build-conf-bblayers.conf` file in the
 ":ref:`dev-manual/layers:enabling your layer`"
 section in the Yocto Project Development Tasks Manual.
=20
-The files ``site.conf`` and ``auto.conf`` are not created by the
-environment initialization script. If you want the ``site.conf`` file,
-you need to create it yourself. The ``auto.conf`` file is typically
+The files ``site.conf`` and :ref:`structure-build-conf-auto.conf` are no=
t created by the
+environment initialization script. If you want the :ref:`structure-build=
-conf-auto.conf` file,
+you need to create it yourself. The :ref:`structure-build-conf-auto.conf=
` file is typically
 created by an autobuilder:
=20
--  *site.conf:* You can use the ``conf/site.conf`` configuration
+-  *site.conf:* You can use the :ref:`structure-build-conf-site.conf` co=
nfiguration
    file to configure multiple build directories. For example, suppose
    you had several build environments and they shared some common
    features. You can set these default build properties here. A good
@@ -298,7 +298,7 @@ created by an autobuilder:
=20
 -  *auto.conf:* The file is usually created and written to by an
    autobuilder. The settings put into the file are typically the same as
-   you would find in the ``conf/local.conf`` or the ``conf/site.conf``
+   you would find in the :ref:`structure-build-conf-local.conf` or the :=
ref:`structure-build-conf-site.conf`
    files.
=20
 You can edit all configuration files to further define any particular
@@ -309,16 +309,16 @@ When you launch your build with the ``bitbake targe=
t`` command, BitBake
 sorts out the configurations to ultimately define your build
 environment. It is important to understand that the
 :term:`OpenEmbedded Build System` reads the
-configuration files in a specific order: ``site.conf``, ``auto.conf``,
-and ``local.conf``. And, the build system applies the normal assignment
+configuration files in a specific order: ``site.conf``, :ref:`structure-=
build-conf-auto.conf`,
+and :ref:`structure-build-conf-local.conf`. And, the build system applie=
s the normal assignment
 statement rules as described in the
 ":doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata`" chapte=
r
 of the BitBake User Manual. Because the files are parsed in a specific
 order, variable assignments for the same variable could be affected. For
-example, if the ``auto.conf`` file and the ``local.conf`` set variable1
-to different values, because the build system parses ``local.conf``
-after ``auto.conf``, variable1 is assigned the value from the
-``local.conf`` file.
+example, if the :ref:`structure-build-conf-auto.conf` file and the ``loc=
al.conf`` set variable1
+to different values, because the build system parses :ref:`structure-bui=
ld-conf-local.conf`
+after :ref:`structure-build-conf-auto.conf`, variable1 is assigned the v=
alue from the
+:ref:`structure-build-conf-local.conf` file.
=20
 Metadata, Machine Configuration, and Policy Configuration
 ---------------------------------------------------------
@@ -389,7 +389,7 @@ Repositories <>` also shows layers categorized under =
"Yocto Metadata Layers."
    found in the OpenEmbedded Layer Index. Such layers are either
    deprecated or experimental in nature.
=20
-BitBake uses the ``conf/bblayers.conf`` file, which is part of the user
+BitBake uses the :ref:`structure-build-conf-bblayers.conf` file, which i=
s part of the user
 configuration, to find what layers it should be using as part of the
 build.
=20
@@ -400,7 +400,7 @@ A distribution layer provides policy configurations f=
or your
 distribution. Best practices dictate that you isolate these types of
 configurations into their own layer. Settings you provide in
 ``conf/distro/distro.conf`` override similar settings that BitBake finds
-in your ``conf/local.conf`` file in the :term:`Build Directory`.
+in your :ref:`structure-build-conf-local.conf` file in the :term:`Build =
Directory`.
=20
 The following list provides some explanation and references for what you
 typically find in a distribution layer (recall that
@@ -538,7 +538,7 @@ source tree used by the group).
=20
 The canonical method through which to include a local project is to use =
the
 :ref:`ref-classes-externalsrc` class to include that local project. You =
use
-either ``local.conf`` or a recipe's append file to override or set the
+either :ref:`structure-build-conf-local.conf` or a recipe's append file =
to override or set the
 recipe to point to the local directory from which to fetch the source.
=20
 Source Control Managers (Optional)
diff --git a/documentation/profile-manual/intro.rst b/documentation/profi=
le-manual/intro.rst
index 6241dffcb..e0c7fd5e5 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -43,7 +43,7 @@ an ``sdk`` image, perhaps one of::
    $ bitbake core-image-rt-sdk
=20
 Alternatively,  you can add ``tools-profile`` to the :term:`EXTRA_IMAGE_=
FEATURES` line in
-your ``local.conf`` file::
+your :ref:`structure-build-conf-local.conf` file::
=20
    EXTRA_IMAGE_FEATURES:append =3D " tools-profile"
=20
@@ -59,7 +59,7 @@ the tracing and profiling tools will be included in non=
-sdk images as well e.g.:
=20
    You can prevent that by setting the
    :term:`INHIBIT_PACKAGE_STRIP`
-   variable to "1" in your ``local.conf`` when you build the image::
+   variable to "1" in your :ref:`structure-build-conf-local.conf` when y=
ou build the image::
=20
       INHIBIT_PACKAGE_STRIP =3D "1"
=20
@@ -69,11 +69,11 @@ If you've already built a stripped image, you can gen=
erate debug
 packages (xxx-dbg) which you can manually install as needed.
=20
 To generate debug info for packages, you can add ``dbg-pkgs`` to
-:term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::
+:term:`EXTRA_IMAGE_FEATURES` in :ref:`structure-build-conf-local.conf`. =
For example::
=20
    EXTRA_IMAGE_FEATURES:append =3D " dbg-pkgs"
=20
 Additionally, in order to generate the right type of debug info, we also=
 need to
-set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file::
+set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the :ref:`structure-build-conf-=
local.conf` file::
=20
    PACKAGE_DEBUG_SPLIT_STYLE =3D 'debug-file-directory'
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index ec768b755..eb28c794d 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2708,7 +2708,7 @@ It is used to generate a JSON specification file fr=
om the features listed in
 The :ref:`ref-classes-sanity` class checks to see if prerequisite softwa=
re is present
 on the host system so that users can be notified of potential problems
 that might affect their build. The class also performs basic user
-configuration checks from the ``local.conf`` configuration file to
+configuration checks from the :ref:`structure-build-conf-local.conf` con=
figuration file to
 prevent common mistakes that cause build failures. Distribution policy
 usually determines whether to include this class.
=20
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentati=
on/ref-manual/devtool-reference.rst
index 6b21d302f..d2e80611a 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -312,7 +312,7 @@ the layer into which to write an append file::
=20
 The ``*.bbappend`` file is created at the
 appropriate path within the specified layer directory, which may or may
-not be in your ``bblayers.conf`` file. If an append file already exists,
+not be in your :ref:`structure-build-conf-bblayers.conf` file. If an app=
end file already exists,
 the command updates it appropriately.
=20
 .. _devtool-checking-on-the-upgrade-status-of-a-recipe:
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
index ff103a55e..676d274c9 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -116,7 +116,7 @@ and so forth.)
=20
 This directory adds additional recipes and append files used by the
 OpenEmbedded selftests to verify the behavior of the build system. You
-do not have to add this layer to your ``bblayers.conf`` file unless you
+do not have to add this layer to your :ref:`structure-build-conf-bblayer=
s.conf` file unless you
 want to run the selftests.
=20
 .. _structure-meta-skeleton:
@@ -310,7 +310,7 @@ file, it is recommended to put them into a distro :te=
rm:`configuration file`, or
 to create layer :term:`configuration fragments <Configuration Fragment>`=
 from
 changes made here.
=20
-The :term:`OpenEmbedded Build System` can create the ``local.conf`` file=
 from a
+The :term:`OpenEmbedded Build System` can create the :ref:`structure-bui=
ld-conf-local.conf` file from a
 ``local.conf.sample`` file when you ``source`` the top-level build envir=
onment
 setup script :ref:`structure-core-script`.
=20
@@ -343,7 +343,7 @@ file, it uses ``sed`` to substitute final
 This configuration file defines
 :ref:`layers <dev-manual/layers:understanding and creating layers>`,
 which are directory trees, traversed (or walked) by BitBake. The
-``bblayers.conf`` file uses the :term:`BBLAYERS`
+:ref:`structure-build-conf-bblayers.conf` file uses the :term:`BBLAYERS`
 variable to list the layers BitBake tries to find.
=20
 The OpenEmbedded build system can create it from a ``bblayers.conf.sampl=
e`` file
@@ -382,7 +382,7 @@ want to access downloaded files (:term:`DL_DIR`).
 This file can be shared for multiple build directories. For example,
 :doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-env=
ironment-setup>`
 makes the :ref:`structure-build-conf-site.conf` file a symbolic link to =
a common
-``site.conf`` file::
+:ref:`structure-build-conf-auto.conf` file::
=20
    =E2=94=9C=E2=94=80=E2=94=80 poky-master-poky-distro_poky-machine_qemu=
x86-64/
    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 build/
@@ -831,9 +831,9 @@ For reference information on classes, see the
 This directory contains the core set of configuration files that start
 from ``bitbake.conf`` and from which all other configuration files are
 included. See the include statements at the end of the ``bitbake.conf``
-file and you will note that even ``local.conf`` is loaded from there.
+file and you will note that even :ref:`structure-build-conf-local.conf` =
is loaded from there.
 While ``bitbake.conf`` sets up the defaults, you can often override
-these by using the (``local.conf``) file, machine file or the
+these by using the (:ref:`structure-build-conf-local.conf`) file, machin=
e file or the
 distribution configuration file.
=20
 .. _structure-meta-conf-machine:
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
index 7c2ae896f..0310d27f8 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -266,11 +266,11 @@ universal, the list includes them just in case:
    :term:`Container Layer`
       A flexible definition that typically refers to a single Git checko=
ut
       which contains multiple (and typically related) sub-layers which c=
an
-      be included independently in your project's ``bblayers.conf`` file=
.
+      be included independently in your project's :ref:`structure-build-=
conf-bblayers.conf` file.
=20
       In some cases, such as with OpenEmbedded's :oe_git:`meta-openembed=
ded </meta-openembedded>`
       layer, the top level ``meta-openembedded/`` directory is not itsel=
f an actual layer,
-      so you would never explicitly include it in a ``bblayers.conf`` fi=
le;
+      so you would never explicitly include it in a :ref:`structure-buil=
d-conf-bblayers.conf` file;
       rather, you would include any number of its layer subdirectories, =
such as
       :oe_git:`meta-oe </meta-openembedded/tree/meta-oe>`, :oe_git:`meta=
-python
       </meta-openembedded/tree/meta-python>` and so on.
@@ -279,7 +279,7 @@ universal, the list includes them just in case:
       :yocto_git:`meta-security </meta-security>`)
       have a top-level directory that is itself an actual layer, as well=
 as
       a variety of sub-layers, both of which could be included in your
-      ``bblayers.conf`` file.
+      :ref:`structure-build-conf-bblayers.conf` file.
=20
       In either case, the phrase "container layer" is simply used to des=
cribe
       a directory structure which contains multiple valid OpenEmbedded l=
ayers.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index c04b24ce0..8e67acaaf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -432,7 +432,7 @@ system and gives an overview of their function and co=
ntents.
       you to control the build based on these parameters.
=20
       Disk space monitoring is disabled by default. To enable monitoring=
,
-      add the :term:`BB_DISKMON_DIRS` variable to your ``conf/local.conf=
`` file
+      add the :term:`BB_DISKMON_DIRS` variable to your :ref:`structure-b=
uild-conf-local.conf` file
       found in the :term:`Build Directory`. Use the
       following form:
=20
@@ -480,7 +480,7 @@ system and gives an overview of their function and co=
ntents.
=20
       The first example works only if you also provide the
       :term:`BB_DISKMON_WARNINTERVAL`
-      variable in the ``conf/local.conf``. This example causes the build
+      variable in the :ref:`structure-build-conf-local.conf`. This examp=
le causes the build
       system to immediately stop when either the disk space in
       ``${TMPDIR}`` drops below 1 Gbyte or the available free inodes dro=
ps
       below 100 Kbytes. Because two directories are provided with the
@@ -501,7 +501,7 @@ system and gives an overview of their function and co=
ntents.
=20
    :term:`BB_DISKMON_WARNINTERVAL`
       Defines the disk space and free inode warning intervals. To set th=
ese
-      intervals, define the variable in your ``conf/local.conf`` file in
+      intervals, define the variable in your :ref:`structure-build-conf-=
local.conf` file in
       the :term:`Build Directory`.
=20
       If you are going to use the :term:`BB_DISKMON_WARNINTERVAL` variab=
le, you
@@ -721,7 +721,7 @@ system and gives an overview of their function and co=
ntents.
       server due to inactivity. Set :term:`BB_SERVER_TIMEOUT` to determi=
ne how
       long the BitBake server stays resident between invocations.
=20
-      For example, the following statement in your ``local.conf`` file
+      For example, the following statement in your :ref:`structure-build=
-conf-local.conf` file
       instructs the server to be unloaded after 20 seconds of inactivity=
::
=20
          BB_SERVER_TIMEOUT =3D "20"
@@ -885,7 +885,7 @@ system and gives an overview of their function and co=
ntents.
=20
    :term:`BBLAYERS`
       Lists the layers to enable during the build. This variable is defi=
ned
-      in the ``bblayers.conf`` configuration file in the :term:`Build Di=
rectory`.
+      in the :ref:`structure-build-conf-bblayers.conf` configuration fil=
e in the :term:`Build Directory`.
       Here is an example::
=20
          BBLAYERS =3D " \
@@ -1981,7 +1981,7 @@ system and gives an overview of their function and =
contents.
    :term:`COREBASE_FILES`
       Lists files from the :term:`COREBASE` directory that
       should be copied other than the layers listed in the
-      ``bblayers.conf`` file. The :term:`COREBASE_FILES` variable allows
+      :ref:`structure-build-conf-bblayers.conf` file. The :term:`COREBAS=
E_FILES` variable allows
       to copy metadata from the OpenEmbedded build system
       into the extensible SDK.
=20
@@ -2626,7 +2626,7 @@ system and gives an overview of their function and =
contents.
       variable.
=20
       You can set this directory by defining the :term:`DL_DIR` variable=
 in the
-      ``conf/local.conf`` file. This directory is self-maintaining and y=
ou
+      :ref:`structure-build-conf-local.conf` file. This directory is sel=
f-maintaining and you
       should not have to touch it. By default, the directory is
       ``downloads`` in the :term:`Build Directory`::
=20
@@ -2819,7 +2819,7 @@ system and gives an overview of their function and =
contents.
       Directs BitBake to exclude a recipe from world builds (i.e.
       ``bitbake world``). During world builds, BitBake locates, parses a=
nd
       builds all recipes found in every layer exposed in the
-      ``bblayers.conf`` configuration file.
+      :ref:`structure-build-conf-bblayers.conf` configuration file.
=20
       To exclude a recipe from a world build using this variable, set th=
e
       variable to "1" in the recipe.
@@ -3868,7 +3868,7 @@ system and gives an overview of their function and =
contents.
          If you specifically remove the locale ``en_US.UTF-8``, you must=
 set
          :term:`IMAGE_LINGUAS` appropriately.
=20
-      You can set :term:`GLIBC_GENERATE_LOCALES` in your ``local.conf`` =
file for
+      You can set :term:`GLIBC_GENERATE_LOCALES` in your :ref:`structure=
-build-conf-local.conf` file for
       local testing or in your distro :term:`configuration file`.
=20
       By default, all locales are generated::
@@ -4327,7 +4327,7 @@ system and gives an overview of their function and =
contents.
    :term:`IMAGE_FEATURES`
       The primary list of features to include in an image. Typically, yo=
u
       configure this variable in an image recipe. Although you can use t=
his
-      variable from your ``local.conf`` file, which is found in the
+      variable from your :ref:`structure-build-conf-local.conf` file, wh=
ich is found in the
       :term:`Build Directory`, best practices dictate that you do
       not.
=20
@@ -4415,7 +4415,7 @@ system and gives an overview of their function and =
contents.
=20
          -  Using :term:`IMAGE_INSTALL` with the
             :ref:`+=3D <bitbake-user-manual/bitbake-user-manual-metadata=
:appending (+=3D) and prepending (=3D+) with spaces>`
-            BitBake operator within the ``/conf/local.conf`` file or fro=
m
+            BitBake operator within the :ref:`structure-build-conf-local=
.conf` file or from
             within an image recipe is not recommended. Use of this opera=
tor in
             these ways can cause ordering issues. Since
             :ref:`ref-classes-core-image` sets :term:`IMAGE_INSTALL` to =
a
@@ -4423,7 +4423,7 @@ system and gives an overview of their function and =
contents.
             :ref:`?=3D <bitbake-user-manual/bitbake-user-manual-metadata=
:setting a default value (?=3D)>`
             operator, using a ``+=3D`` operation against :term:`IMAGE_IN=
STALL`
             results in unexpected behavior when used within
-            ``conf/local.conf``. Furthermore, the same operation from wi=
thin an
+            :ref:`structure-build-conf-local.conf`. Furthermore, the sam=
e operation from within an
             image recipe may or may not succeed depending on the specifi=
c
             situation. In both these cases, the behavior is contrary to =
how
             most users expect the ``+=3D`` operator to work.
@@ -7074,7 +7074,7 @@ system and gives an overview of their function and =
contents.
=20
       Consider the following example where the :term:`PACKAGE_FEED_URIS`=
,
       :term:`PACKAGE_FEED_BASE_PATHS`, and :term:`PACKAGE_FEED_ARCHS` va=
riables are
-      defined in your ``local.conf`` file::
+      defined in your :ref:`structure-build-conf-local.conf` file::
=20
          PACKAGE_FEED_URIS =3D "https://example.com/packagerepos/release=
 \
                               https://example.com/packagerepos/updates"
@@ -7103,7 +7103,7 @@ system and gives an overview of their function and =
contents.
=20
       Consider the following example where the :term:`PACKAGE_FEED_URIS`=
,
       :term:`PACKAGE_FEED_BASE_PATHS`, and :term:`PACKAGE_FEED_ARCHS` va=
riables are
-      defined in your ``local.conf`` file::
+      defined in your :ref:`structure-build-conf-local.conf` file::
=20
          PACKAGE_FEED_URIS =3D "https://example.com/packagerepos/release=
 \
                               https://example.com/packagerepos/updates"
@@ -7132,7 +7132,7 @@ system and gives an overview of their function and =
contents.
=20
       Consider the following example where the :term:`PACKAGE_FEED_URIS`=
,
       :term:`PACKAGE_FEED_BASE_PATHS`, and :term:`PACKAGE_FEED_ARCHS` va=
riables are
-      defined in your ``local.conf`` file::
+      defined in your :ref:`structure-build-conf-local.conf` file::
=20
          PACKAGE_FEED_URIS =3D "https://example.com/packagerepos/release=
 \
                               https://example.com/packagerepos/updates"
@@ -7507,7 +7507,7 @@ system and gives an overview of their function and =
contents.
       places you in the right location so that you can manually resolve =
the
       conflicts.
=20
-      Set this variable in your ``local.conf`` file.
+      Set this variable in your :ref:`structure-build-conf-local.conf` f=
ile.
=20
    :term:`PATCHTOOL`
       Specifies the utility used to apply patches for a recipe during th=
e
@@ -7898,7 +7898,7 @@ system and gives an overview of their function and =
contents.
=20
       Typically, you could add a specific server for the build system to
       attempt before any others by adding something like the following t=
o
-      the ``local.conf`` configuration file in the
+      the :ref:`structure-build-conf-site.conf` configuration file in th=
e
       :term:`Build Directory`::
=20
          PREMIRRORS:prepend =3D "\
@@ -8629,7 +8629,7 @@ system and gives an overview of their function and =
contents.
          ROOT_HOME ?=3D "/root"
=20
       You can also override the default by setting the variable in your =
distro
-      configuration or in the ``local.conf`` file.
+      configuration or in the :ref:`structure-build-conf-local.conf` fil=
e.
=20
    :term:`ROOTFS`
       Indicates a filesystem image to include as the root filesystem.
@@ -9382,7 +9382,7 @@ system and gives an overview of their function and =
contents.
       build the recipe.
=20
       To prevent a recipe from being built, use the :term:`SKIP_RECIPE`
-      variable in your ``local.conf`` file or distribution configuration=
.
+      variable in your :ref:`structure-build-conf-local.conf` file or di=
stribution configuration.
       Here is an example which prevents ``myrecipe`` from being built::
=20
          SKIP_RECIPE[myrecipe] =3D "Not supported by our organization."
@@ -10961,8 +10961,8 @@ system and gives an overview of their function an=
d contents.
=20
       The layer's ``README`` file contains information on how to use the
       Sourcery G++ Toolchain as an external toolchain. You will have to
-      add the layer to your ``bblayers.conf`` file and then set the
-      :term:`EXTERNAL_TOOLCHAIN` variable in your ``local.conf`` file to
+      add the layer to your :ref:`structure-build-conf-bblayers.conf` fi=
le and then set the
+      :term:`EXTERNAL_TOOLCHAIN` variable in your :ref:`structure-build-=
conf-local.conf` file to
       the location of the toolchain.
=20
       The fundamentals used for this example apply to any external
diff --git a/documentation/ref-manual/varlocality.rst b/documentation/ref=
-manual/varlocality.rst
index 29ab6081c..855bd6938 100644
--- a/documentation/ref-manual/varlocality.rst
+++ b/documentation/ref-manual/varlocality.rst
@@ -74,7 +74,7 @@ Local
 -----
=20
 This section lists variables whose configuration context is the local
-configuration through the ``local.conf`` file.
+configuration through the :ref:`structure-build-conf-local.conf` file.
=20
 -  :term:`DISTRO` (can also be set by the :ref:`ref-fragments-builtin-co=
re-distro`
    :term:`built-in fragment`)
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/document=
ation/sdk-manual/appendix-customizing.rst
index 65fd4af9f..5392b1200 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -53,7 +53,7 @@ build system applies them against :ref:`structure-build=
-conf-local.conf` and
    class.
=20
 Additionally, the contents of ``conf/sdk-extra.conf``, when present, are
-appended to the end of ``conf/local.conf`` within the produced SDK,
+appended to the end of :ref:`structure-build-conf-local.conf` within the=
 produced SDK,
 without any filtering. The ``sdk-extra.conf`` file is particularly
 useful if you want to set a variable value just for the SDK and not the
 OpenEmbedded build system used to create the SDK.
@@ -114,7 +114,7 @@ adjustments:
=20
 -  If you have adjusted the list of files and directories that appear in
    :term:`COREBASE` (other than
-   layers that are enabled through ``bblayers.conf``), then you must
+   layers that are enabled through :ref:`structure-build-conf-bblayers.c=
onf`), then you must
    list these files in
    :term:`COREBASE_FILES` so
    that the files are copied into the SDK.
@@ -287,7 +287,7 @@ source, you need to do a number of things:
       SDK and the SDK itself (i.e. the mirror is accessible in both
       places or it will fail quickly on the OpenEmbedded build system
       side, and its contents will not interfere with the build), then
-      you can set the variable in your ``local.conf`` or custom distro
+      you can set the variable in your :ref:`structure-build-conf-local.=
conf` or custom distro
       configuration file. You can then pass the variable to the SDK by
       adding the following:
=20
diff --git a/documentation/security-manual/securing-images.rst b/document=
ation/security-manual/securing-images.rst
index 9772b52d3..3aa55c2aa 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -80,7 +80,7 @@ your build output more secure. The security flags are i=
n the
    Depending on the recipe, certain security flags are enabled and
    disabled by default.
=20
-Use the following line in your ``local.conf`` file or in your custom
+Use the following line in your :ref:`structure-build-conf-local.conf` fi=
le or in your custom
 distro :term:`configuration file` to enable the security compiler and
 linker flags for your build::
=20
diff --git a/documentation/test-manual/runtime-testing.rst b/documentatio=
n/test-manual/runtime-testing.rst
index 4eef9d059..55c19900f 100644
--- a/documentation/test-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -223,7 +223,7 @@ The final thing you need to do when setting :term:`TE=
ST_TARGET` to
 "SystemdbootTarget" is to set up the test image:
=20
 #. *Set up your local.conf file:* Make sure you have the following
-   statements in your ``local.conf`` file::
+   statements in your :ref:`structure-build-conf-local.conf` file::
=20
       IMAGE_FSTYPES +=3D "tar.gz"
       IMAGE_CLASSES +=3D "testimage"
@@ -244,7 +244,7 @@ power:
    :term:`TEST_POWERCONTROL_EXTRA_ARGS` as a command that runs on the ho=
st
    and does power cycling. The test code passes one argument to that
    command: off, on or cycle (off then on). Here is an example that
-   could appear in your ``local.conf`` file::
+   could appear in your :ref:`structure-build-conf-local.conf` file::
=20
       TEST_POWERCONTROL_CMD =3D "powercontrol.exp test 10.11.12.1 nuc1"
=20
@@ -318,7 +318,7 @@ You can start the tests automatically or manually:
=20
 -  *Automatically running tests:* To run the tests automatically after t=
he
    OpenEmbedded build system successfully creates an image, first set th=
e
-   :term:`TESTIMAGE_AUTO` variable to "1" in your ``local.conf`` file in=
 the
+   :term:`TESTIMAGE_AUTO` variable to "1" in your :ref:`structure-build-=
conf-local.conf` file in the
    :term:`Build Directory`::
=20
       TESTIMAGE_AUTO =3D "1"
@@ -330,7 +330,7 @@ You can start the tests automatically or manually:
=20
 -  *Manually running tests:* To manually run the tests, first globally
    inherit the :ref:`ref-classes-testimage` class by editing your
-   ``local.conf`` file::
+   :ref:`structure-build-conf-local.conf` file::
=20
       IMAGE_CLASSES +=3D "testimage"
=20
@@ -346,7 +346,7 @@ individual tests. Tests are usually grouped together =
by the area tested
=20
 You can add tests to any layer provided you place them in the proper
 area and you extend :term:`BBPATH` in
-the ``local.conf`` file as normal. Be sure that tests reside in
+the :ref:`structure-build-conf-local.conf` file as normal. Be sure that =
tests reside in
 ``layer/lib/oeqa/runtime/cases``.
=20
 .. note::
@@ -356,7 +356,7 @@ the ``local.conf`` file as normal. Be sure that tests=
 reside in
=20
 You can change the set of tests run by appending or overriding
 :term:`TEST_SUITES` variable in
-``local.conf``. Each name in :term:`TEST_SUITES` represents a required t=
est
+:ref:`structure-build-conf-local.conf`. Each name in :term:`TEST_SUITES`=
 represents a required test
 for the image. Test modules named within :term:`TEST_SUITES` cannot be
 skipped even if a test is not suitable for an image (e.g. running the
 RPM tests on an image without ``rpm``). Appending "auto" to
@@ -401,7 +401,7 @@ test execution off to a scheduler. You can only expor=
t tests that are
 defined in :term:`TEST_SUITES`.
=20
 If your image is already built, make sure the following are set in your
-``local.conf`` file::
+:ref:`structure-build-conf-local.conf` file::
=20
    IMAGE_CLASSES +=3D "testexport"
    TEST_TARGET_IP =3D "IP-address-for-the-test-target"
diff --git a/documentation/test-manual/understand-autobuilder.rst b/docum=
entation/test-manual/understand-autobuilder.rst
index 0015c2e57..e65490607 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -58,7 +58,7 @@ Combining these two entries you can see that ``qemux86-=
64`` is a three step
 build where ``bitbake BBTARGETS`` would be run, then ``bitbake SANITYTAR=
GETS``
 for each step; all for ``MACHINE=3D"qemux86-64"`` but with differing
 :term:`SDKMACHINE` settings. In step 1, an extra variable is added to th=
e
-``auto.conf`` file to enable wic image generation.
+:ref:`structure-build-conf-auto.conf` file to enable wic image generatio=
n.
=20
 While not every detail of this is covered here, you can see how the
 template mechanism allows quite complex configurations to be built up
@@ -222,7 +222,7 @@ following:
    ``bitbake-layers add-layer`` command (logging as stepXa)
=20
 #. Call the ``scripts/setup-config`` script to generate the necessary
-   ``auto.conf`` configuration file for the build
+   :ref:`structure-build-conf-auto.conf` configuration file for the buil=
d
=20
 #. Run the ``bitbake BBTARGETS`` command (logging as stepXb)
=20
diff --git a/documentation/toaster-manual/reference.rst b/documentation/t=
oaster-manual/reference.rst
index 08e8a12e0..d0c63a084 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -32,7 +32,7 @@ through a :wikipedia:`REST <Representational_state_tran=
sfer>`
 API, store the information about the layers in the Toaster database, and
 then show the information to users. Users are then able to view that
 information and build layers from Toaster itself without having to
-clone or edit the BitBake layers configuration file ``bblayers.conf``.
+clone or edit the BitBake layers configuration file :ref:`structure-buil=
d-conf-bblayers.conf`.
=20
 Tying a layer source into Toaster is convenient when you have many
 custom layers that need to be built on a regular basis by a community of
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/do=
cumentation/transitioning-to-a-custom-environment.rst
index 13f906eea..4b54be804 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -66,7 +66,7 @@ Transitioning to a custom environment for systems devel=
opment
    64-bit x86-based machine, copy the conf/intel-corei7-64 definition an=
d give
    the machine a relevant name (think board name, not product name). Mak=
e sure
    the layer configuration is dependent on the ``meta-intel`` layer (or =
at least,
-   ``meta-intel`` remains in your ``bblayers.conf`` file). Now you can p=
ut your custom BSP
+   ``meta-intel`` remains in your :ref:`structure-build-conf-bblayers.co=
nf` file). Now you can put your custom BSP
    settings into your layer and you can re-use it for different applicat=
ions.
=20
 #. **Write your own recipe to build additional software support that isn=
't

--=20
2.55.0


