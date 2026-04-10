Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC4BF459E5
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157881.1775832229521382016
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NZy5eqFz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 40CDAC5C1B1
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12C0C603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62AA710450026;
	Fri, 10 Apr 2026 16:43:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=517tpXbmt0dmf8yBaG/6zSfRDK8obDhUgXkkXevwROA=;
	b=NZy5eqFzxWwnlsbD6MjlpfInlguPk9zm0ltiWeq2bH8kQ/NVlmEcAMWz2QEJP3LfyYXkrG
	7C3PBicpcp+WMuUYoKcr1sSyUUbD0s2enKuIU1Q+TVAGz9MXmmukvis+GgIJMurhACuc88
	ruWPUHisaxklDI5NrYfZO8cwNTZzuSizTwrzFOoVntUoaOaFkkuHrWMOPOGRCxHPPuaukH
	vX/OIm+uCxF6z9idFlTeJC4wwpWBqRp+MnvHEmx1oEr7ZK66acjTHtNOcDDoUxDS92CUYf
	/Sb7c5jp/ERAGtBGBE2QZJzOauQC6kpVIa3vEE8dsXQ/3YOnNnmjIxhwmxvnYw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:37 +0200
Subject: [PATCH 13/18] docs-wide: adapt to the new
 {DISTRO,MACHINE}_FEATURES mechanism
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-13-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=18977;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9NsRIiqqxOoTuM7s8k2CklXEK/HbD/P1t+H1Fd63cZE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyYRvfXUVcsplxysndHDtaXsv2AKYG3aCZcQ
 gWdasDq2dSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMmAAKCRDRgEFAKaOo
 Nlv5D/9kRqmefwMJNCmgvwMNWptoxUEZ8Y4gVrvpbFD/VrYl3LOqv+nuN/is+z1UuOrb9huZHJ1
 UPDFRYAIFcRYZ1HCcJ4zcKpMyH6E1hZlkNgED18jUbYhWRoeJLZq9S8whxp4fAv+DH5u6BjCiHD
 itb685cXCAzpCDGsfEVvLhAww3Cx001rayo6tHcITvJCF7Va3ESXeahtME8R0hAyzVPwNJ+OS7t
 PBawzm/cNCik5DcoEF69vJiEhtunh3nIb+BAxwELiANtjvks0afa0LDBJyGf3PxfwpF463OT5TC
 TF4gN+bbDUSwJFCasR8pK8TO6F9HLNJz+S7H91hLSHjV1lkXsUImZEaI5r5rlrTi81wWALiMK1L
 tSlFbuPUCjeE0imS2z+WrPUI5+4DVv9SHg4P6wPZClsjqZYdRo2lDYzGObHUM+f5m+zOIrjrOsL
 CA9xTGmCuWEZ/lCJvffb754iUaKmXKJPAHBwojjW0pDTVrRenp3/vpLOql9bI6oCirvMmFF3tWw
 HZLadyknDqtGuQPtH9eTAwWfk6BQvHWYKni+a0JGqf1k/P7L2fRFLpCKUn5BUlqlcwZtq22C/l0
 GiGJML3WZB2JbBn81lR5dnIfuOM3cToFxg/hZw+dwS4B+RFRvV7euLhPtL1OODSvBV19nWn3bVj
 abN06mNOYW6IlLA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9240

The way DISTRO_FEATURES and MACHINE_FEATURES defaults are provided and
the way you can opt out of it has changed in OE-Core. Adapt the
documentation to these changes, which includes remove some previous
definitions (all the *BACKFILL* variables) and documenting the new
variables.

Note that DISTRO_FEATURES_DEFAULT was also removed. There is a new
DISTRO_FEATURES_DEFAULTS variable and MACHINE_FEATURES_DEFAULTS,
however.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/gobject-introspection.rst |  12 +--
 documentation/migration-guides/migration-6.0.rst   |  51 +++++++++++
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/features.rst              | 101 +++++++++++----------
 documentation/ref-manual/variables.rst             |  91 +++++++------------
 5 files changed, 150 insertions(+), 113 deletions(-)

diff --git a/documentation/dev-manual/gobject-introspection.rst b/documentation/dev-manual/gobject-introspection.rst
index f7206e6fa..8203f17f0 100644
--- a/documentation/dev-manual/gobject-introspection.rst
+++ b/documentation/dev-manual/gobject-introspection.rst
@@ -44,9 +44,9 @@ library package involves the following:
 #. Make sure introspection is not disabled anywhere in the recipe or
    from anything the recipe includes. Also, make sure that
    "gobject-introspection-data" is not in
-   :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
+   :term:`DISTRO_FEATURES_OPTED_OUT`
    and that "qemu-usermode" is not in
-   :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`.
+   :term:`MACHINE_FEATURES_OPTED_OUT`.
    In either of these conditions, nothing will happen.
 
 #. Try to build the recipe. If you encounter build errors that look like
@@ -84,7 +84,7 @@ disable GIR file generations:
 
 -  Add the following to your distro configuration::
 
-      DISTRO_FEATURES_BACKFILL_CONSIDERED = "gobject-introspection-data"
+      DISTRO_FEATURES_OPTED_OUT = "gobject-introspection-data"
 
    Adding this statement disables generating introspection data using
    QEMU but will still enable building introspection tools and libraries
@@ -92,7 +92,7 @@ disable GIR file generations:
 
 -  Add the following to your machine configuration::
 
-      MACHINE_FEATURES_BACKFILL_CONSIDERED = "qemu-usermode"
+      MACHINE_FEATURES_OPTED_OUT = "qemu-usermode"
 
    Adding this statement disables the use of QEMU when building packages for your
    machine. Currently, this feature is used only by introspection
@@ -115,9 +115,9 @@ Use the following procedure to test if generating introspection data is
 working in an image:
 
 #. Make sure that "gobject-introspection-data" is not in
-   :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
+   :term:`DISTRO_FEATURES_OPTED_OUT`
    and that "qemu-usermode" is not in
-   :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`.
+   :term:`MACHINE_FEATURES_OPTED_OUT`.
 
 #. Build ``core-image-sato``.
 
diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index 16046dad8..18cb62f1d 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -89,6 +89,57 @@ Reverting to :wikipedia:`SysVinit <UNIX_System_V>` can be done by specifying the
 
 See commit :oecore_rev:`0b4061c5d50261f826d0edb4b478d2d305274b7c` for more information.
 
+Changes in how default :term:`DISTRO_FEATURES` and :term:`MACHINE_FEATURES` are provided
+----------------------------------------------------------------------------------------
+
+The way default :term:`DISTRO_FEATURES` and :term:`MACHINE_FEATURES` are
+provided by the :term:`OpenEmbedded Build System` has changed.
+
+The ``DISTRO_FEATURES_BACKFILL``, ``DISTRO_FEATURES_BACKFILL_CONSIDERED``,
+``DISTRO_FEATURES_DEFAULT``, ``MACHINE_FEATURES_BACKFILL`` and
+``MACHINE_FEATURES_BACKFILL_CONSIDERED`` variables are now obsolete.
+
+Instead, these are replaced by the :term:`DISTRO_FEATURES_DEFAULTS`,
+:term:`DISTRO_FEATURES_OPTED_OUT`, :term:`MACHINE_FEATURES_DEFAULTS` and
+:term:`MACHINE_FEATURES_OPTED_OUT` variables.
+
+Users are advised to migrate to these variables the following way:
+
+-  For :term:`DISTRO_FEATURES`:
+
+   -  If you have previously assigned :term:`DISTRO_FEATURES` without using
+      ``DISTRO_FEATURES_DEFAULT``, you will now get the default features added
+      automatically (from :term:`DISTRO_FEATURES_DEFAULTS`). You will need to
+      review these and add any features you do not want to use to
+      :term:`DISTRO_FEATURES_OPTED_OUT`.
+
+   -  ``DISTRO_FEATURES_DEFAULT`` is now unused, the new variable name is
+      slightly different (:term:`DISTRO_FEATURES_DEFAULTS`) to ensure that it is
+      not accidentally used if a layer hasn't been modified to adapt to the new
+      naming.
+
+   -  If you previously set ``DISTRO_FEATURES_BACKFILL_CONSIDERED``, use the new
+      :term:`DISTRO_FEATURES_OPTED_OUT` variable instead.
+
+   -  If you previously modified ``DISTRO_FEATURES_BACKFILL``, remove these
+      assignments and follow the above instructions.
+
+-  For :term:`MACHINE_FEATURES`:
+
+   -  :term:`MACHINE_FEATURES` will now get the default features added
+      automatically (from :term:`MACHINE_FEATURES_DEFAULTS`). You will need to
+      review these and add any features you do not want to use to
+      :term:`MACHINE_FEATURES_OPTED_OUT`.
+
+   -  If you previously set ``MACHINE_FEATURES_BACKFILL_CONSIDERED``, use the new
+      :term:`MACHINE_FEATURES_OPTED_OUT` variable instead.
+
+   -  If you previously modified ``MACHINE_FEATURES_BACKFILL``, remove these
+      assignments and follow the above instructions.
+
+See commit :oecore_rev:`159148f4de2595556fef6e8678578df83383857b` and
+:oecore_rev:`3194d6868dd14e40ae670db089e5bf6f862d3044` for more information.
+
 Changes to the list of :term:`DISTRO_FEATURES` enabled by default
 -----------------------------------------------------------------
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5a119da71..d66c9c68b 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1071,10 +1071,10 @@ introspection. This functionality is only enabled if the
 
 .. note::
 
-   This functionality is :ref:`backfilled <ref-features-backfill>` by default
-   and, if not applicable, should be disabled through
-   :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` or
-   :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`, respectively.
+   This functionality is :ref:`enabled <ref-manual/features:Default Features>`
+   by default and, if not applicable, should be disabled through
+   :term:`DISTRO_FEATURES_OPTED_OUT` or
+   :term:`MACHINE_FEATURES_OPTED_OUT`, respectively.
 
 .. _ref-classes-grub-efi:
 
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index be67bc0ea..5fda7ac9a 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -6,7 +6,7 @@ Features
 
 This chapter provides a reference of shipped machine and distro features
 you can include as part of your image, a reference on image features you
-can select, and a reference on :ref:`ref-features-backfill`.
+can select, and a reference on :ref:`ref-manual/Features:Default Features`.
 
 Features provide a mechanism for working out which packages should be
 included in the generated images. Distributions can select which
@@ -419,55 +419,62 @@ these valid features is as follows:
 
 -  *x11-sato:* Installs the OpenedHand Sato environment.
 
-.. _ref-features-backfill:
-
-Feature Backfilling
-===================
+Default Features
+================
 
-Sometimes it is necessary in the OpenEmbedded build system to
+Sometimes it is necessary in the :term:`OpenEmbedded Build System` to
 add new functionality to :term:`MACHINE_FEATURES` or
 :term:`DISTRO_FEATURES`, but at the same time, allow existing
 distributions or machine definitions to opt out of such new
 features, to retain the same overall level of functionality.
 
-To make this possible, the OpenEmbedded build system has a mechanism to
-automatically "backfill" features into existing distro or machine
-configurations. You can see the list of features for which this is done
-by checking the :term:`DISTRO_FEATURES_BACKFILL` and
-:term:`MACHINE_FEATURES_BACKFILL` variables in the
-``meta/conf/bitbake.conf`` file.
-
-These two variables are paired with the
-:term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
-and :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED` variables
-which allow distro or machine configuration maintainers to `consider` any
-added feature, and decide when they wish to keep or exclude such feature,
-thus preventing the backfilling from happening.
-
-Here are two examples to illustrate feature backfilling:
-
--  *The "pulseaudio" distro feature option*: Previously, PulseAudio support was
-   enabled within the Qt and GStreamer frameworks. Because of this, the feature
-   is now backfilled and thus enabled for all distros through the
-   :term:`DISTRO_FEATURES_BACKFILL` variable in the ``meta/conf/bitbake.conf``
-   file. However, if your distro needs to disable the feature, you can do so
-   without affecting other existing distro configurations that need PulseAudio
-   support. You do this by adding "pulseaudio" to
-   :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` in your distro's ``.conf``
-   file. So, adding the feature to this variable when it also exists in the
-   :term:`DISTRO_FEATURES_BACKFILL` variable prevents the build system from
-   adding the feature to your configuration's :term:`DISTRO_FEATURES`,
-   effectively disabling the feature for that particular distro.
-
--  *The "rtc" machine feature option*: Previously, real time clock (RTC)
-   support was enabled for all target devices. Because of this, the
-   feature is backfilled and thus enabled for all machines through the
-   :term:`MACHINE_FEATURES_BACKFILL` variable in the ``meta/conf/bitbake.conf``
-   file. However, if your target device does not have this capability, you can
-   disable RTC support for your device without affecting other machines
-   that need RTC support. You do this by adding the "rtc" feature to the
-   :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED` list in your machine's ``.conf``
-   file. So, adding the feature to this variable when it also exists in the
-   :term:`MACHINE_FEATURES_BACKFILL` variable prevents the build system from
-   adding the feature to your configuration's :term:`MACHINE_FEATURES`,
-   effectively disabling RTC support for that particular machine.
+To make this possible, the OpenEmbedded build system provides a default list of
+features through the :term:`DISTRO_FEATURES_DEFAULTS` and
+:term:`MACHINE_FEATURES_DEFAULTS` variables. You can see the default definition
+of these variable in the :oecore_path:`meta/conf/distro/include/default-distrovars.inc`
+and :oecore_path:`meta/conf/bitbake.conf` files.
+
+.. note::
+
+   This does not apply to image features (there is no
+   ``IMAGE_FEATURES_DEFAULTS`` definition).
+
+The :term:`DISTRO_FEATURES_OPTED_OUT` and :term:`MACHINE_FEATURES_OPTED_OUT`
+variables can be used to remove a feature provided by one of the
+:term:`DISTRO_FEATURES_DEFAULTS` of :term:`MACHINE_FEATURES_DEFAULTS` variables.
+
+For example, the two following assignments::
+
+   DISTRO_FEATURES_DEFAULTS = "a b c"
+   DISTRO_FEATURES_OPTED_OUT = "b"
+
+Would result in feature ``a`` and feature ``c`` making it to the final value of
+:term:`DISTRO_FEATURES`, but not feature ``b``. This also applies for
+:term:`MACHINE_FEATURES_DEFAULTS` and :term:`MACHINE_FEATURES_OPTED_OUT`.
+
+You can also opt out of all default features by setting
+:term:`DISTRO_FEATURES_OPTED_OUT` or :term:`MACHINE_FEATURES_OPTED_OUT` to
+``*``::
+
+   DISTRO_FEATURES_OPTED_OUT = "*"
+
+.. tip::
+
+   You can verify the value of :term:`DISTRO_FEATURES` or
+   :term:`MACHINE_FEATURES` with the following commands:
+
+   .. code-block:: console
+
+      $ bitbake-getvar DISTRO_FEATURES
+      NOTE: Starting bitbake server...
+      [...]
+      DISTRO_FEATURES=" sysvinit      acl alsa bluetooth debuginfod ext2 ipv4 ipv6     wifi xattr nfs zero
+      conf pci 3g nfc x11 vfat seccomp pulseaudio     gobject-introspection-data ldconfig opengl ptest mul
+      tiarch wayland vulkan     "
+
+   .. code-block:: console
+
+      $ bitbake-getvar MACHINE_FEATURES
+      NOTE: Starting bitbake server...
+      [...]
+      MACHINE_FEATURES="alsa bluetooth usbgadget screen vfat rtc qemu-usermode"
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d8cadef3e..9ce2803b3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2481,41 +2481,13 @@ system and gives an overview of their function and contents.
       list of features that ships with the Yocto Project and that you can
       provide with this variable, see the ":ref:`ref-features-distro`" section.
 
-   :term:`DISTRO_FEATURES_BACKFILL`
-      A space-separated list of features to be added to :term:`DISTRO_FEATURES`
-      if not also present in :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`.
-
-      This variable is set in the ``meta/conf/bitbake.conf`` file. It is
-      not intended to be user-configurable. It is best to just reference
-      the variable to see which distro features are being
-      :ref:`backfilled <ref-features-backfill>` for all distro configurations.
-
-   :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
-      A space-separated list of features from :term:`DISTRO_FEATURES_BACKFILL`
-      that should not be :ref:`backfilled <ref-features-backfill>` (i.e. added
-      to :term:`DISTRO_FEATURES`) during the build.
-
-      This corresponds to an opt-out mechanism. When new default distro
-      features are introduced, distribution maintainers can review (`consider`)
-      them and decide to exclude them from the
-      :ref:`backfilled <ref-features-backfill>` features. Therefore, the
-      combination of :term:`DISTRO_FEATURES_BACKFILL` and
-      :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` makes it possible to
-      add new default features without breaking existing distributions.
+   :term:`DISTRO_FEATURES_DEFAULTS`
+      Specifies a space-separated list of default distro features provided by
+      the :term:`OpenEmbedded Build System`. This list should not be modified
+      directly, but instead :term:`DISTRO_FEATURES_OPTED_OUT` should be used to
+      prevent default distro features from being enabled.
 
-
-   :term:`DISTRO_FEATURES_DEFAULT`
-      A convenience variable that gives you the default list of distro
-      features with the exception of any features specific to the C library
-      (``libc``).
-
-      When creating a custom distribution, you might find it useful to be
-      able to reuse the default
-      :term:`DISTRO_FEATURES` options without the
-      need to write out the full set. Here is an example that uses
-      :term:`DISTRO_FEATURES_DEFAULT` from a custom distro configuration file::
-
-         DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} myfeature"
+      See :ref:`ref-manual/features:Default Features` for more information.
 
    :term:`DISTRO_FEATURES_FILTER_NATIVE`
       Specifies a list of features that if present in the target
@@ -2547,6 +2519,17 @@ system and gives an overview of their function and contents.
       in addition to the features filtered using the
       :term:`DISTRO_FEATURES_FILTER_NATIVESDK` variable.
 
+   :term:`DISTRO_FEATURES_OPTED_OUT`
+      Specifies a space-separated list of distro features to opt out from
+      when they are provided by the :term:`DISTRO_FEATURES_DEFAULTS` variable.
+
+      You can also opt out of all default features by setting
+      :term:`DISTRO_FEATURES_OPTED_OUT` to ``*``::
+
+         DISTRO_FEATURES_OPTED_OUT = "*"
+
+      See :ref:`ref-manual/features:Default Features` for more information.
+
    :term:`DISTRO_NAME`
       The long name of the distribution. For information on the short name
       of the distribution, see the :term:`DISTRO` variable.
@@ -6250,28 +6233,24 @@ system and gives an overview of their function and contents.
       For a list of hardware features supported by the Yocto Project as
       shipped, see the ":ref:`ref-features-machine`" section.
 
-   :term:`MACHINE_FEATURES_BACKFILL`
-      A list of space-separated features to be added to
-      :term:`MACHINE_FEATURES` if not also present in
-      :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`.
-
-      This variable is set in the ``meta/conf/bitbake.conf`` file. It is not
-      intended to be user-configurable. It is best to just reference the
-      variable to see which machine features are being
-      :ref:`backfilled <ref-features-backfill>` for all machine configurations.
-
-   :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`
-      A list of space-separated features from :term:`MACHINE_FEATURES_BACKFILL`
-      that should not be :ref:`backfilled <ref-features-backfill>` (i.e. added
-      to :term:`MACHINE_FEATURES`) during the build.
-
-      This corresponds to an opt-out mechanism. When new default machine
-      features are introduced, machine definition maintainers can review
-      (`consider`) them and decide to exclude them from the
-      :ref:`backfilled <ref-features-backfill>` features. Therefore, the
-      combination of :term:`MACHINE_FEATURES_BACKFILL` and
-      :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED` makes it possible to
-      add new default features without breaking existing machine definitions.
+   :term:`MACHINE_FEATURES_DEFAULTS`
+      Specifies a space-separated list of default machine features provided by
+      the :term:`OpenEmbedded Build System`. This list should not be modified
+      directly, but instead :term:`MACHINE_FEATURES_OPTED_OUT` should be used to
+      prevent default machine features from being enabled.
+
+      See :ref:`ref-manual/features:Default Features` for more information.
+
+   :term:`MACHINE_FEATURES_OPTED_OUT`
+      Specifies a space-separated list of machine features to opt out from
+      when they are provided by the :term:`MACHINE_FEATURES_DEFAULTS` variable.
+
+      You can also opt out of all default features by setting
+      :term:`MACHINE_FEATURES_OPTED_OUT` to ``*``::
+
+         MACHINE_FEATURES_OPTED_OUT = "*"
+
+      See :ref:`ref-manual/features:Default Features` for more information.
 
    :term:`MACHINEOVERRIDES`
       A colon-separated list of overrides that apply to the current

-- 
2.53.0


