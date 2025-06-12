Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47BEC71141
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:17:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.14470.1749737849116023537
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 07:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=MJ7QI60e;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KPQFauuLLz3gQjpYy/FpLzELXWD8NjFlasvGM1UKwio=; b=MJ7QI60eV0vv59HzPE72+FPFAH
	wZjiQTj+9rB3dK/A3p96UHuOlC2K5ctPJ0z+xyu7WqDok0rAzBRvvTj6bRBE2n6tKJJPnx5wnFgfF
	jHnYV0Sw1IZ+OwI2k+EdodAkUPFJQO4PdXeOvdVyvntHq0ZSKgav9gJoarTHEqEwX7aspAOv+Gbho
	2VL6dxeEIYJFu10COUCnNiH1+9xsEjsX4CbiY6ufoVbgqX+QQCGZQNEXGy+1y/UxGqiBbbSRTNMF4
	5G+3aLeaQIfw1sE4BDposbMmaK4AgMg3KL4gxEQH1PrOeMX11z8iELTHt5z9pQwYdJLRJvKGc8udx
	IEQ1z9rw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:60036 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uPikA-00000000ia7-2pCv
	for docs@lists.yoctoproject.org;
	Thu, 12 Jun 2025 10:17:27 -0400
Date: Thu, 12 Jun 2025 10:17:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: small number of pedantic cleanups
Message-ID: <008123f0-0e2a-98b6-ea68-934a857ffd44@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Jun 2025 14:17:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7068


In Sections 4.3.1 and 4.3.2 of the Overview Manual, a bit of tidying
including:

  - provide full list of packaging options
  - add monospaced rendering where appropriate
  - fix broken "ref"
  - make capitalization consistent

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 85dea9fe0..c9405cdd3 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -98,7 +98,7 @@ files, and how to package the compiled output.

 The term "package" is sometimes used to refer to recipes. However, since
 the word "package" is used for the packaged output from the OpenEmbedded
-build system (i.e. ``.ipk`` or ``.deb`` files), this document avoids
+build system (i.e. ``.ipk``, ``.deb`` or ``.rpm`` files), this document avoids
 using the term "package" when referring to recipes.

 Classes
@@ -256,7 +256,7 @@ development environment.
 .. note::

    The
-   scripts/oe-setup-builddir
+   ``scripts/oe-setup-builddir``
    script uses the
    ``$TEMPLATECONF``
    variable to determine which sample configuration files to locate.
@@ -352,7 +352,7 @@ layers the build system uses to further control the build. These layers
 provide Metadata for the software, machine, and policies.

 In general, there are three types of layer input. You can see them below
-the "User Configuration" box in the `general workflow
+the "User Configuration" box in the :ref:`general workflow
 figure <overview-manual/concepts:openembedded build system concepts>`:

 -  *Metadata (.bb + Patches):* Software layers containing
@@ -420,14 +420,14 @@ build.
 Distro Layer
 ~~~~~~~~~~~~

-The distribution layer provides policy configurations for your
+A distribution layer provides policy configurations for your
 distribution. Best practices dictate that you isolate these types of
 configurations into their own layer. Settings you provide in
 ``conf/distro/distro.conf`` override similar settings that BitBake finds
 in your ``conf/local.conf`` file in the :term:`Build Directory`.

 The following list provides some explanation and references for what you
-typically find in the distribution layer:
+typically find in a distribution layer:

 -  *classes:* Class files (``.bbclass``) hold common functionality that
    can be shared among recipes in the distribution. When your recipes
@@ -454,7 +454,7 @@ typically find in the distribution layer:
 BSP Layer
 ~~~~~~~~~

-The BSP Layer provides machine configurations that target specific
+A BSP layer provides machine configurations that target specific
 hardware. Everything in this layer is specific to the machine for which
 you are building the image or the SDK. A common structure or form is
 defined for BSP layers. You can learn more about this structure in the
@@ -465,7 +465,7 @@ defined for BSP layers. You can learn more about this structure in the
    In order for a BSP layer to be considered compliant with the Yocto
    Project, it must meet some structural requirements.

-The BSP Layer's configuration directory contains configuration files for
+A BSP layer's configuration directory contains configuration files for
 the machine (``conf/machine/machine.conf``) and, of course, the layer
 (``conf/layer.conf``).

@@ -477,18 +477,18 @@ formfactors, graphics support systems, and so forth.
 .. note::

    While the figure shows several
-   recipes-\*
+   ``recipes-*``
    directories, not all these directories appear in all BSP layers.

 Software Layer
 ~~~~~~~~~~~~~~

-The software layer provides the Metadata for additional software
+A software layer provides the Metadata for additional software
 packages used during the build. This layer does not include Metadata
 that is specific to the distribution or the machine, which are found in
 their respective layers.

-This layer contains any recipes, append files, and patches, that your
+This layer contains any recipes, append files, and patches that your
 project needs.

 Sources
@@ -560,9 +560,8 @@ source tree used by the group).

 The canonical method through which to include a local project is to use the
 :ref:`ref-classes-externalsrc` class to include that local project. You use
-either the ``local.conf`` or a recipe's append file to override or set the
-recipe to point to the local directory on your disk to pull in the whole
-source tree.
+either ``local.conf`` or a recipe's append file to override or set the
+recipe to point to the local directory from which to fetch the source.

 Source Control Managers (Optional)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

