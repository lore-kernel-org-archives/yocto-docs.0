Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C858E776D3
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123196.1766593923739643526
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Brj13uB0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 380541A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08FF16073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22BA710AB137D;
	Wed, 24 Dec 2025 17:32:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593921; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1kduOd3sQSlCuQH3io/fZFv0GxMpftpI6/ieai7rRlU=;
	b=Brj13uB0wmxvsE+sygUhdo9uUooPl959lRHWyK1Tt2DMQhn5Mre6cgbsabaw8UoAQUM4JI
	tvXjXIQmVR/2ocQY7nv1lhiJJQBkrayxG8rwOn4HRZ0O+cWR0MhQ/kJkjWW4sp7Zgz80NF
	om/ITeIsgfsOCeLf4AEiI/IlSRbIGCnYyez5xjxNIoq6gbkwS+vrOGbZypfkdjHAxujppw
	0opnt93kpplOFrAbuL+2KzmsAIRaeQcFowmvrnc1P0/YTzOMkr9gcD4YzIqUNrvfWJeNZK
	0JjmRw1Vn6nyiUq7qTereBlikP0Zco9pJoHAdBTGA9776pKlG9w0wg/XGdgHAg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:47 +0100
Subject: [PATCH 21/53] overview-manual/concepts.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-21-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6437;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hIr24PLfSnEsZplsyjzBVuhC98/jlx7ZHgU6GXvP4zU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVqQgFzMk4iHHyz4ONu9dvyZFAa6LtA8Whtk
 +aW936/3MyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVagAKCRDRgEFAKaOo
 Nn59EAC119tzoh+jGBZzK886UUbN5OqvwZGluCeQYCO+mrBTsI9Zf2u7HZLP/epFIHxmEdY9Gea
 eEPL33y59H6hIC8BQsY8i4dzZ7kTkIrddAvhGVTX3OzTS3Yf4eGlI56sU6CDiLjrp03zknn5afF
 eqXlnLARDuzc/C2TaKiH9lKs3zuSRipA7AYnNxv5wuGR4KSHkg+fJImvKGoDFR9vOFhO3t3NZdm
 RalsUN70zMCulJGRJ30780RuTK+HrxZYVDaK/RQPWjEYKkhn28of7rduAqyiioHLYLsljSB932v
 p2VHo2AymHOfTaoyE5e05Qxlmh2XxDUDXX6reHwCoYgeH/5SnSWDvmWC5ltU2gDimmxFwXuoNYl
 pJUG2URGRAKxX3OkFMwoV71PJEyEK2OXFNnzXt7TdjjHcYHRxHYikLtS42Bo9Dfd+cZcUXsPR8y
 95XoDgf5via2Yw5EijHcraeoBTXQrlrQxl2XU7fhuRmPx2aR0T7BYMGt5zun7H3MD4IACTlwTOg
 Rjg47t5pmuQx2ENmSoPVLgrpZXQo6okM7GzDT1tWn3s09ZjTQLi+anbIz/cP2giDmaIIR8tXmNI
 3hg6EE+7fMpV0fDtZAJ36g6H4Mik9/oDxWPUCty9CwKLXGqqtMBbSZ9j/XPKcroWpE42WJlSFEq
 Aj3z6S7osCZGF2g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8350

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 75 +++++++++---------------------
 1 file changed, 21 insertions(+), 54 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 04a08b7db..ec56031c4 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -211,62 +211,29 @@ figure <overview-manual/concepts:openembedded build system concepts>`:
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
+anything you want. For this discussion, the cloned repository uses the default
+name ``work``.
 
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
@@ -371,18 +338,18 @@ figure <overview-manual/concepts:openembedded build system concepts>`:
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
@@ -840,7 +807,7 @@ This step in the build process consists of the following tasks:
    :term:`PACKAGECONFIG_CONFARGS`
    variables. For information on how this variable works within that
    class, see the :ref:`ref-classes-autotools` class
-   :yocto_git:`here </poky/tree/meta/classes-recipe/autotools.bbclass>`.
+   :oe_git:`here </openembedded-core/tree/meta/classes-recipe/autotools.bbclass>`.
 
 -  *do_compile*: Once a configuration task has been satisfied,
    BitBake compiles the source using the

-- 
2.51.0


