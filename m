Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA084CA6CA7
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5809.1769501977484565207
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=beuv6Pbd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EA21B4E422CB
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBC2C606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E45D0119A868E;
	Tue, 27 Jan 2026 09:19:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Pk7uiweiuH52z9GmDq9QvN882iE5EZWWlxWLg73HIT8=;
	b=beuv6Pbd6IiH1306LcCl+AxROFn6mySVuUfXGI6XpaHcu8XauqClrx4IUgafBIraIKgQUG
	HH5uJYDq6fd/4trwLW85UIIMCTAYkAvBcGJaS5gc5GsM340XYFuZJYXTKlV91LR4fGgvwC
	wtGo1N/I49ST/X9BewhNuu2xdEROrR6YFonPiBY5GQz/ftiHfvyF/jIh7AAKC5EjnrcNsb
	VDSBd9VpBY94yB0pdSZKN3w4XdIATJfbIKtyUNFpALQ5ZHncRo0nJDp8vYpQABREHwo9yw
	jczF92SbIg8Qd0m+cL7f3HQZb22/nNQtK8Peg5Ic8f59YhSJ3axt5r/qeniKYw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:16 +0100
Subject: [PATCH v2 21/56] overview-manual/concepts.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-21-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6360;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0S2EpHaGIDkeA74ZjeDU3b0lZt5pWkgB+5QUbTp47TY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUB2QuOYMpZmcsCehb/BsgvUw2wn+Y29brjo
 ZvCECq9m5yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AQAKCRDRgEFAKaOo
 NuI+D/0UH7m9Ciz0LOmoIElU8FSWvidvEgoPCMLZBFQkI3zoPTO+8mWzlf3W3q9wq17K+6klMpE
 eeyo8uaMdIiMjbW7Y5vBqdyc/8HFCHkJBkAeEjgI5z6U03b0eqPaFx0mwQTkAluxu9eVK4MuXIG
 Op+SCX09FFNQcx16v+6zBwmuQNIzFapiEQjrJQQ01BuKBstVnCLFfkffglBRJeV0OvtkLF5eLZV
 qNHoLtgTpf7Vh73xElAVWE1BiWtnuFwaoex8Az7o9Tw+QDC6BfZbZvJmEaCppMg9MW/CO1APzQt
 bfR5q+PMZqeGUE0QdcfNMAK/f6H7SGH9n/wwYXUwXTdNZDNfs2YOHP0Hs9ZGGKfIakRQtnYQNWe
 EKOigrRuBXroFtfy9aA5459RkuXTwhzRTmz4BsFY3ulKxZPEn+qoMQEMDmt50g73R3I/+68IOMQ
 +Yx4URz7BASmwF0+yWNnozN9MOY7Q5c1K/97y5Ine9bWsU930Ua2vrtWbOH6HNCq832TpL5Gt9M
 YvjaLU7l+DHVzauONvnvunuASJehOyfrcf0N7OzGTkP5tW6l0y045adiIzCRrXvA5gjGH/dR4nW
 XjbCKpUyFFTS6UoSg7jpQPm3k4yftD/FDvsXJn+blyIhLVWRCOvX/R6AMaBi2f0SqN9kcg1RY3w
 uPSaWMB2mt3///A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8682

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 74 ++++++++----------------------
 1 file changed, 20 insertions(+), 54 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 9ca188960..757ea05cb 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -211,62 +211,28 @@ figure <overview-manual/concepts:openembedded build system concepts>`:
 BitBake needs some basic configuration files in order to complete a
 build. These files are ``*.conf`` files. The minimally necessary ones
 reside as example files in the ``build/conf`` directory of the
-:term:`Source Directory`. For simplicity,
-this section refers to the Source Directory as the "Poky Directory."
+:term:`Build Directory`.
 
-When you clone the :term:`Poky` Git repository
-or you download and unpack a Yocto Project release, you can set up the
-Source Directory to be named anything you want. For this discussion, the
-cloned repository uses the default name ``poky``.
+When you :ref:`initialize the build environment <dev-manual/start:Initializing
+the Build Environment>`, you can set up the :term:`Source Directory` to be named
+anything you want.
 
-.. note::
-
-   The Poky repository is primarily an aggregation of existing
-   repositories. It is not a canonical upstream source.
-
-The ``meta-poky`` layer inside Poky contains a ``conf`` directory that
-has example configuration files. These example files are used as a basis
-for creating actual configuration files when you source
-:ref:`structure-core-script`, which is the
-build environment script.
-
-Sourcing the build environment script creates a :term:`Build Directory`
+Setting up the build environment creates a :term:`Build Directory`
 if one does not already exist. BitBake uses the :term:`Build Directory`
 for all its work during builds. The Build Directory has a ``conf`` directory
 that contains default versions of your ``local.conf`` and ``bblayers.conf``
-configuration files. These default configuration files are created only
-if versions do not already exist in the :term:`Build Directory` at the time you
-source the build environment setup script.
-
-Because the Poky repository is fundamentally an aggregation of existing
-repositories, some users might be familiar with running the
-:ref:`structure-core-script` script in the context of separate
-:term:`OpenEmbedded-Core (OE-Core)` and BitBake
-repositories rather than a single Poky repository. This discussion
-assumes the script is executed from within a cloned or unpacked version
-of Poky.
-
-Depending on where the script is sourced, different sub-scripts are
-called to set up the :term:`Build Directory` (Yocto or OpenEmbedded).
-Specifically, the script ``scripts/oe-setup-builddir`` inside the poky
-directory sets up the :term:`Build Directory` and seeds the directory (if
-necessary) with configuration files appropriate for the Yocto Project
-development environment.
-
-.. note::
+configuration files. These default :term:`configuration files <Configuration
+File>` are created only if versions do not already exist in the :term:`Build
+Directory` at the time you source the build environment setup script.
 
-   The
-   ``scripts/oe-setup-builddir``
-   script uses the
-   ``$TEMPLATECONF``
-   variable to determine which sample configuration files to locate.
+:term:`Configuration files <Configuration File>` provide many basic variables
+that define a build environment.  To see a list of possible variables to
+configure from :term:`configuration files <Configuration File>`, see the
+:yocto_git:`local.conf.sample
+</meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample>` in the
+``meta-poky`` layer:
 
-The ``local.conf`` file provides many basic variables that define a
-build environment. Here is a list of a few. To see the default
-configurations in a ``local.conf`` file created by the build environment
-script, see the
-:yocto_git:`local.conf.sample </poky/tree/meta-poky/conf/templates/default/local.conf.sample>`
-in the ``meta-poky`` layer:
+Here is a list of a few:
 
 -  *Target Machine Selection:* Controlled by the
    :term:`MACHINE` variable.
@@ -371,18 +337,18 @@ figure <overview-manual/concepts:openembedded build system concepts>`:
    configurations. This type of information is specific to a particular
    target architecture. A good example of a BSP layer from the
    :ref:`overview-manual/yp-intro:reference distribution (poky)` is the
-   :yocto_git:`meta-yocto-bsp </poky/tree/meta-yocto-bsp>`
+   :yocto_git:`meta-yocto-bsp </meta-yocto/tree/meta-yocto-bsp>`
    layer.
 
 -  *Policy Configuration:* Distribution Layers (i.e. "Distro Layer" in
    the following figure) providing top-level or general policies for the
    images or SDKs being built for a particular distribution. For
    example, in the Poky Reference Distribution the distro layer is the
-   :yocto_git:`meta-poky </poky/tree/meta-poky>`
+   :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`
    layer. Within the distro layer is a ``conf/distro`` directory that
    contains distro configuration files (e.g.
-   :yocto_git:`poky.conf </poky/tree/meta-poky/conf/distro/poky.conf>`
-   that contain many policy configurations for the Poky distribution.
+   :yocto_git:`poky.conf </meta-yocto/tree/meta-poky/conf/distro/poky.conf>`
+   that contain many policy configurations for the :term:`Poky` distribution.
 
 The following figure shows an expanded representation of these three
 layers from the :ref:`general workflow figure
@@ -840,7 +806,7 @@ This step in the build process consists of the following tasks:
    :term:`PACKAGECONFIG_CONFARGS`
    variables. For information on how this variable works within that
    class, see the :ref:`ref-classes-autotools` class
-   :yocto_git:`here </poky/tree/meta/classes-recipe/autotools.bbclass>`.
+   :oe_git:`here </openembedded-core/tree/meta/classes-recipe/autotools.bbclass>`.
 
 -  *do_compile*: Once a configuration task has been satisfied,
    BitBake compiles the source using the

-- 
2.52.0


