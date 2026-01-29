Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44977D6B065
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17199.1769700261377471922
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Lbe2xS+7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF33E4E4231D;
	Thu, 29 Jan 2026 15:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6950606FD;
	Thu, 29 Jan 2026 15:24:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A4CF119A8864;
	Thu, 29 Jan 2026 16:24:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p0q60Zgi2Za6WpCV3SrI8Yn0tnU0wwhYq73/McZdq44=;
	b=Lbe2xS+7C+NrxJ2OI5cm4SEgxE1DX1pu7YoQh5Da++8q3d63gTFf91xqcFXxFt6yrHcT4F
	JWYI61oO5q8q4iFuFLiTCUIKP2oG9s6tOxK87t+oXmK8TtgnTsEXK3L8oVay1mSMtvapyw
	T3h0QymhsiBhfVTsVqazU0pYW8gM6iq5ENRvtHg19chQzr9W7rUh6ru6krNMrct4JS7BoT
	p54k39jA94HLSghONBcBJQ1SheG6hppgtLGe8nMbPNY+ppSGLk4KAXNmoqP0fNUVC0etyx
	MJS4L+jnzJAbaJTeH7obUaQCI2fhc6CKgwbTmorxhSrsPaiYFeNg8U1hXyS2ag==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:14 +0100
Subject: [PATCH v3 23/57] overview-manual/yp-intro.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-23-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=43627;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tauxRzgQxvBp1LsRJXR4IQjrdU5CwnZRtaQPtAD264c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uMhAxbB0AdUZZeYhxuGONz7mnjbVWRE+/3W
 4ZTBAKnMvOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jAAKCRDRgEFAKaOo
 NtyFEAChD0bFd8vmVGOFdkjkxVwz7WHUYZxLI/X5Q59eNpqkxKJUFqne5uDXNVcu/NKivhBYP7k
 heibw+Q27wEh+AmytSHTfG86aaGpXfh2dFDiyRixZ/8JYWbkaA8rl7Din+wqVitTfg6KQ2KhK5v
 ugbHpMzZWtcAK9QCZ34lvyUC5UGD/wN7UXS9RaadSUGdGnirJxKArKgE96B4EUDCaWGK6/l7EEY
 f0gBcvsutL1K1PY1VeZmaGfABGMl4Ho6JXN/sBF6qjIbtLEgnDX85C2fyPCSoSH16A0sros+vdz
 gVidyjTW8wuCQiqge98aSZwlZMV1BOmYgt7g3ZdxQtu8sXYc2oAwYkr51cFoo4vtc2GxpCAWnBg
 iloc8xg4xqhWEhVS/QEN7yj17WNROTiOA3p256qs9GJDZykt3nGRRcFzjNwKshEIqVcr7LNIqmT
 kWsTXELHLhCHo7yXaDO9qCbqzZTbS1j0d0G/Z0PzvRzn9IXP2JNjhlSPlACKH9MwiBTuSQVNzc3
 rxRC0RVgAMRsNhlsOfyOHND4x9sf6eRBe+Vs0idnsDoqj+sBXNm2vW7CHoJKA8H/1SiYRl6pD3V
 yJ4OWTzWZJBISd19GE81kbHZuuVebNAsgCOFb741+ZN3FfzNOaafmj8Y7gKvWwTETyvbIKq+Mlj
 FXmka1uIFRbBNUA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8809

Remove references to the Poky repository. This document had a lot of
reference to it, so a lot was removed. The "Reference Distribution
(Poky)" section was removed as there already was a "Reference Embedded
Distribution (Poky)" below. This section was simplified as now Poky is
just a distro, not a repo. The historical section was also updated to
mention the obsolete Poky repo.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |   2 +-
 .../figures/poky-reference-distribution.png        | Bin 23784 -> 0 bytes
 documentation/overview-manual/yp-intro.rst         | 155 +++------------------
 3 files changed, 21 insertions(+), 136 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index fc67295cfa..2655b0d3a3 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -336,7 +336,7 @@ figure <overview-manual/concepts:openembedded build system concepts>`:
    "BSP Layer" in the following figure) providing machine-specific
    configurations. This type of information is specific to a particular
    target architecture. A good example of a BSP layer from the
-   :ref:`overview-manual/yp-intro:reference distribution (poky)` is the
+   :ref:`overview-manual/yp-intro:reference embedded distribution (Poky)` is the
    :yocto_git:`meta-yocto-bsp </meta-yocto/tree/meta-yocto-bsp>`
    layer.
 
diff --git a/documentation/overview-manual/figures/poky-reference-distribution.png b/documentation/overview-manual/figures/poky-reference-distribution.png
deleted file mode 100644
index 1be89ae68e36c6e37a4903d0688d5bd1ad36b87a..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 23784
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

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index fe80e18796..85e78dc574 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -264,10 +264,9 @@ with the string ``meta-``.
    ``meta-``, but it is a commonly accepted standard in the Yocto Project
    community.
 
-For example, if you were to examine the :yocto_git:`tree view </poky/tree/>`
-of the ``poky`` repository, you will see several layers: ``meta``,
-``meta-skeleton``, ``meta-selftest``, ``meta-poky``, and
-``meta-yocto-bsp``. Each of these repositories represents a distinct
+For example, if you were to examine the :oe_git:`tree view </openembedded-core/tree/>`
+of the ``openembedded-core`` repository, you will see several layers: ``meta``,
+``meta-skeleton``, and ``meta-selftest``. Each of these repositories represents a distinct
 layer.
 
 For procedures on how to create layers, see the
@@ -385,7 +384,8 @@ Yocto Project:
 
 -  *AutoBuilder:* AutoBuilder is a project that automates build tests
    and quality assurance (QA). By using the public AutoBuilder, anyone
-   can determine the status of the current development branch of Poky.
+   can determine the status of the current development branch of the core
+   repositories (:term:`OpenEmbedded-Core (OE-Core)` and :term:`BitBake`).
 
    .. note::
 
@@ -437,12 +437,12 @@ Here are components associated with the :term:`OpenEmbedded Build System`:
    You can learn more about BitBake in the :doc:`BitBake User
    Manual <bitbake:index>`.
 
--  *OpenEmbedded-Core:* OpenEmbedded-Core (OE-Core) is a common layer of
+-  *OpenEmbedded-Core:* :term:`OpenEmbedded-Core (OE-Core)` is a common layer of
    metadata (i.e. recipes, classes, and associated files) used by
    OpenEmbedded-derived systems, which includes the Yocto Project. The
    Yocto Project and the OpenEmbedded Project both maintain the
-   OpenEmbedded-Core. You can find the OE-Core metadata in the Yocto
-   Project :yocto_git:`Source Repositories </poky/tree/meta>`.
+   OpenEmbedded-Core. You can find the OE-Core metadata in the OpenEmbedded
+   :oe_git:`Source Repositories </openembedded-core/>`.
 
    Historically, the Yocto Project integrated the OE-Core metadata
    throughout the Yocto Project source repository reference system
@@ -455,34 +455,10 @@ Here are components associated with the :term:`OpenEmbedded Build System`:
    Project objective of achieving a smaller number of fully featured
    tools as compared to many different ones.
 
-   Sharing a core set of metadata results in Poky as an integration
-   layer on top of OE-Core. You can see that in this
-   :ref:`figure <overview-manual/yp-intro:what is the yocto project?>`.
-   The Yocto Project combines various components such as BitBake, OE-Core,
-   script "glue", and documentation for its build system.
-
-Reference Distribution (Poky)
------------------------------
-
-Poky is the Yocto Project reference distribution. It contains the
-:term:`OpenEmbedded Build System`
-(BitBake and OE-Core) as well as a set of metadata to get you started
-building your own distribution. See the figure in
-":ref:`overview-manual/yp-intro:what is the yocto project?`"
-section for an illustration that shows Poky and its relationship with
-other parts of the Yocto Project.
-
-To use the Yocto Project tools and components, you can download
-(``clone``) Poky and use it to bootstrap your own distribution.
-
-.. note::
-
-   Poky does not contain binary files. It is a working example of how to
-   build your own custom Linux distribution from source.
-
-You can read more about Poky in the
-":ref:`overview-manual/yp-intro:reference embedded distribution (poky)`"
-section.
+   Nowadays, the :term:`Poky` **repository** is no longer updated as
+   :doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
+   became the preferred way of setting up the repositories in order to build the
+   :term:`Poky` distro.
 
 Packages for Finished Targets
 -----------------------------
@@ -631,103 +607,18 @@ Reference Embedded Distribution (Poky)
 ======================================
 
 "Poky", which is pronounced *Pock*-ee, is the name of the Yocto
-Project's reference distribution or Reference OS Kit. Poky contains the
-:term:`OpenEmbedded Build System` (:term:`BitBake` and
-:term:`OpenEmbedded-Core (OE-Core)`) as well as a set of
-:term:`Metadata` to get you started building your own distro. In other
-words, Poky is a base specification of the functionality needed for a
-typical embedded system as well as the components from the Yocto Project
-that allow you to build a distribution into a usable binary image.
-
-Poky is a combined repository of BitBake, OpenEmbedded-Core (which is
-found in ``meta``), ``meta-poky``, ``meta-yocto-bsp``, and documentation
-provided all together and known to work well together. You can view
-these items that make up the Poky repository in the
-:yocto_git:`Source Repositories </poky/tree/>`.
-
-.. note::
-
-   If you are interested in all the contents of the
-   poky
-   Git repository, see the ":ref:`ref-manual/structure:top-level core components`"
-   section in the Yocto Project Reference Manual.
-
-The following figure illustrates what generally comprises Poky:
-
-.. image:: figures/poky-reference-distribution.png
-    :width: 100%
+Project's reference distribution or Reference OS Kit. This reference
+distribution is represented by a :term:`DISTRO` configuration file found in
+:yocto_git:`meta-poky </meta-yocto>`.
 
--  BitBake is a task executor and scheduler that is the heart of the
-   OpenEmbedded build system.
-
--  ``meta-poky``, which is Poky-specific metadata.
-
--  ``meta-yocto-bsp``, which are Yocto Project-specific Board Support
-   Packages (BSPs).
-
--  OpenEmbedded-Core (OE-Core) metadata, which includes shared
-   configurations, global variable definitions, shared classes,
-   packaging, and recipes. Classes define the encapsulation and
-   inheritance of build logic. Recipes are the logical units of software
-   and images to be built.
-
--  Documentation, which contains the Yocto Project source files used to
-   make the set of user manuals.
-
-.. note::
+.. warning::
 
    While Poky is a "complete" distribution specification and is tested
    and put through QA, you cannot use it as a product "out of the box"
    in its current form.
 
-To use the Yocto Project tools, you can use Git to clone (download) the
-Poky repository then use your local copy of the reference distribution
-to bootstrap your own distribution.
-
-.. note::
-
-   Poky does not contain binary files. It is a working example of how to
-   build your own custom Linux distribution from source.
-
-Poky has a regular, well established, six-month release cycle under its
-own version. Major releases occur at the same time major releases (point
-releases) occur for the Yocto Project, which are typically in the Spring
-and Fall. For more information on the Yocto Project release schedule and
-cadence, see the ":doc:`/ref-manual/release-process`" chapter in the
-Yocto Project Reference Manual.
-
-Much has been said about Poky being a "default configuration". A default
-configuration provides a starting image footprint. You can use Poky out
-of the box to create an image ranging from a shell-accessible minimal
-image all the way up to a Linux Standard Base-compliant image that uses
-a GNOME Mobile and Embedded (GMAE) based reference user interface called
-Sato.
-
-One of the most powerful properties of Poky is that every aspect of a
-build is controlled by the metadata. You can use metadata to augment
-these base image types by adding metadata :ref:`layers
-<overview-manual/yp-intro:the yocto project layer model>` that extend
-functionality.
-These layers can provide, for example, an additional software stack for
-an image type, add a board support package (BSP) for additional
-hardware, or even create a new image type.
-
-Metadata is loosely grouped into configuration files or package recipes.
-A recipe is a collection of non-executable metadata used by BitBake to
-set variables or define additional build-time tasks. A recipe contains
-fields such as the recipe description, the recipe version, the license
-of the package and the upstream source repository. A recipe might also
-indicate that the build process uses autotools, make, distutils or any
-other build process, in which case the basic functionality can be
-defined by the classes it inherits from the OE-Core layer's class
-definitions in ``./meta/classes``. Within a recipe you can also define
-additional tasks as well as task prerequisites. Recipe syntax through
-BitBake also supports both ``:prepend`` and ``:append`` operators as a
-method of extending task functionality. These operators inject code into
-the beginning or end of a task. For information on these BitBake
-operators, see the
-":ref:`bitbake-user-manual/bitbake-user-manual-metadata:appending and prepending (override style syntax)`"
-section in the BitBake User's Manual.
+Poky has a regular, well established, six-month release cycle detailed in the
+:doc:`/ref-manual/release-process` of the Yocto Project Reference Manual.
 
 The OpenEmbedded Build System Workflow
 ======================================
@@ -869,21 +760,15 @@ helpful for getting started:
 -  *Poky:* Poky is a reference embedded distribution and a reference
    test configuration. Poky provides the following:
 
-   -  A base-level functional distro used to illustrate how to customize
-      a distribution.
+   -  A base-level functional distro (:term:`DISTRO`) used to illustrate how to
+      customize a distribution.
 
    -  A means by which to test the Yocto Project components (i.e. Poky
       is used to validate the Yocto Project).
 
-   -  A vehicle through which you can download the Yocto Project.
-
    Poky is not a product level distro. Rather, it is a good starting
    point for customization.
 
-   .. note::
-
-      Poky is an integration layer on top of OE-Core.
-
 -  *Recipe:* The most common form of metadata. A recipe contains a list
    of settings and tasks (i.e. instructions) for building packages that
    are then used to build the binary image. A recipe describes where you

-- 
2.52.0


