Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCF7D358F7
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17100.1769700259543474988
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=g4xfxJJp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 01189C22F4B
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00473606FD
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CD5F119A8863;
	Thu, 29 Jan 2026 16:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zw5z362SCS2MmxOGx0lZNJkIyC7inkCtimJ+kByb/hQ=;
	b=g4xfxJJpYqyetzahW8YSMkwA1xoy7n3SVIMm3Aj6Vxa2CFMW8zysYb5V2muhYtoGVTmHvN
	CkNLjaXdhMMHrXv2LunxaBZyCbFOAihTw41z5efE+SUgBCN/hykCqqknAe6PDqWpc98TPn
	6/AGjcy7ZNsLa+NCQAnWy4P/goPhFLGzTd79H+bw8kD+rr93uekBPRoWAxN1PDLuh4rB1k
	WQTbRqXEL5YI/c2fkCLZEdWlQQlRyK72qGjjoZD+1DCcqjgG5M3SniSk6zTj5PnVWzdCfX
	uFOdBuVJXeAuFIUdWz8Zo8ckg1uMwWV66pvLZJfVFhvgwmKJCLQR1t5S3bVoWQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:12 +0100
Subject: [PATCH v3 21/57] overview-manual/concepts.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-21-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6357;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5/GzBQr3nvDQh0NwXKMW1M5/hzStC5XgGYpE4kRVnKA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uMMf3obHQs1gYR8OjCd5ZpgfXhNCPjrU9BD
 nuWA3YXuH6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jAAKCRDRgEFAKaOo
 NlWyD/9d0XOXdtq8TlJANLSOwcQ9jdFL/PWJX4JJq6VbWW2G8B+TPkSm3nXwp49PlqBHk+v3l4e
 75CqKDs1RSDcGcVztwsa/SK+d3Z5s/hS9puBDkqqrYe5QgGvNMAcvYutDALvIpKgQbXHJ2yrQ+Q
 aRe9wc53b7QZn0rRN8EnFyMmARkpuYWvAyjQuT/CYz5z/VPxuySOoLBOJfI5QO40VGXW5/jiw2H
 zSShFbjpaD/6dc08Dce+BoifGaQ1HIfmEzXMLrDQqE+o2oNPuKr0B4Ttn63oAKzuCQNSxIvdY32
 feZEOWtv/skAVwtOXoWo0YsVfKtGptXss2KNH5SApyDv7qW65COtqI+p0t86dkehxg329mhjMVy
 11i5U7g8NGxYe3fQ/9GeFsgt6Ct/CYwHc9IoSfc7Q7XwBy71dxX+cIbkfli0DsMqHyr7D8BpCuV
 2kZ0hfemzTp1II9GaaiprV7t3Eir2x4xTWHtxLlWtkw/9cXjdoA0zZpPuY2RQfihthm464mzfg4
 sRHjjjlrxzLO5wDl6jMoFwLSrYjbZULYNBH5q9iFzL2zZbzipiM2UJqXvnm+8UfB9lhvd6X4Nb7
 fzCeaDBtxFSUpssgF2Pyygqc8k0RpRC7Wx+b3u9b/MPH8bZM4LkblbDYt4NOzLfzci5Jh/orenp
 BBUZnhj9mJkfVmA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8807

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 74 ++++++++----------------------
 1 file changed, 20 insertions(+), 54 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 9ca188960..fc67295cf 100644
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
+the Build Environment>`, you can specify which directory will be the
+:term:`Source Directory`.
 
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
+File>` are created only if they do not already exist in the :term:`Build
+Directory` at the time you source the build environment setup script.
 
-   The
-   ``scripts/oe-setup-builddir``
-   script uses the
-   ``$TEMPLATECONF``
-   variable to determine which sample configuration files to locate.
+:term:`Configuration files <Configuration File>` provide many basic variables
+that define a build environment. To show a list of possible variables to
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
+Here is a non-exhaustive list:
 
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


