Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47BDE776CB
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:24:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123071.1766593485444851778
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HO1ODLW2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EC9421A23E4
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C36556073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30E3710AB135D;
	Wed, 24 Dec 2025 17:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593483; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rEitk5z1VAMYfX30u6WaqEOe1o/j3KaG4m5FNo0ENBI=;
	b=HO1ODLW2Cf0gaynqB2JOACc/P3tR2DMx1gwhtcNjw9FHIQEFU6P6ejMeB9yh+1p9fdPFPp
	eyMvBgZ6eR2LeSfrZgOfsSfcAIK/1zFB+CP/kxIC+Xnm2JM1h6bW+bNzGqHQGOTZzvQro9
	St58WsjipSB+JTr9Q7iBdrPp/Qxx7muu3TV+aYX6AVY9LXl4ShNGpKATZQt5B2co3ANt7P
	P89qdmMJD9a63QGFi0OfobB3h/iGa8jn2GlCdb4oS8rCPpSxSEh5PCIkhKa4nLjYTfIDv1
	DM/k0MxgOF/u9XvQO3BVkCNFxia737YamGQZ02Fw2d3zg+kASlt9OH/+Rnr+Qw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:24:18 +0100
Subject: [PATCH 3/5] ref-manual/terms.rst: simplify the Source Directory
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-terms-refresh-v1-3-691329fd038f@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
In-Reply-To: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5914;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=aBApjWJIBSkYBq3VKvk32ebKatNE+tEVei8LMUC0DRo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBPHQOq9bNoaTEPaubdCoZeOJY9TQhCREQ8Fy
 o7cJeb8c9KJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwTxwAKCRDRgEFAKaOo
 NjP+D/96iBLszei10EDcBJmlMezLwBlK0sZSK0tvNjKaEZcZHJtVipaFN7yCODOV1iUStnlJMpX
 CP1yvh0q/DQaQdR++VHgYDjG/2Xj4sTvg1zu6FecP38QNR94TbXaTTthdO1DMX8rpaN8FNj22uB
 6tY84AI3yhFOFDo3AZcydPEFvmvG5XhJY040bLbsEmBAVveX/wXOtnpdV4LPRPaXndhuDPXGY+n
 UWF5RSVWfw4l2AZGK+fvk+hlpQiATGLQ7FsWMoZ7p+OKJcyVI6CqGxPyn/va2Fmw+2RRK8lPv25
 bea4dR69ycoP6JZJ3mbaDrmxIHgLCm/CnU/sAW5p2OJVVxR1m96zgx9dZuxlscOw1T0W0pA35fc
 XAirRkRQfCsEl+GwHCjS+coEs245xvSWk6gmqEFdPHDzUI/gEKGJJwv2N9y1tkKf+qcEbl2E3wr
 ApkPOqP/qwcThpMKinQjOAvUMgJHa+XJ+aQ4B5TmKai1mBzP4EBGTeI9nAqfA2NNCtdHBUJW3GG
 S2qrj0YjilVEN+MLOtb6KmbcXshaJR0D3zaqqLDZWaTLPYWYqEcGXU+m2OHMTFfA8gU8h2JwvK2
 cbxdNuKY7SPMKFX5Gn7wAfTQEO2Z3QiAJh1kGqIEO0VCl1wtRaQl6q2pt7TJouggPQGZl+ml+CI
 qc4gnmHWg0juSIA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8326

Now that we no longer have Poky around, simplify the Source Directory
definition:

- Make references to existing documents that show how to create this
  Source Directory.

- This directory contains sources, the layout in which they are
  presented does not matter so much, as it can be different and/or
  freeform depending on whether we use bitbake-setup or not.

  The definition chooses "project" as the name of the source directory
  and is the one that should be used when showing examples in the
  documentation.

Other parts of the documentation referencing to this as the Poky
repository still have to be updated.

This will also mean that this definition will be used a lot less across
the documentation: in most cases, when the "Source Directory" is
referenced as the Poky repository, it can be replaced by
OpenEmbedded-Core, Bitbake, the documentation, or meta-yocto. We'll keep
this definition around regardless, as it can be useful to denote this
group of directories in a more general sense.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 66 +++++++++++---------------------------
 1 file changed, 18 insertions(+), 48 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index b7a7679ae..21e30de96 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -526,20 +526,23 @@ universal, the list includes them just in case:
       a software bill of materials`" section of the Development Tasks manual.
 
    :term:`Source Directory`
-     This term refers to the directory structure
-     created as a result of creating a local copy of the ``poky`` Git
-     repository ``git://git.yoctoproject.org/poky`` or expanding a
-     released ``poky`` tarball.
+     This term refers to the directory structure created as a result of setting
+     up your environment to build images with the Yocto Project, which can be
+     done in two ways:
 
-     .. note::
+     -  Using the ``bitbake-setup`` command-line utility (see :doc:`Setting Up
+        The Environment With bitbake-setup
+        <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`).
+
+     -  Manually setting up the :term:`Layers <Layer>` (see
+        :doc:`/dev-manual/poky-manual-setup`).
 
-        Creating a local copy of the
-        poky
-        Git repository is the recommended method for setting up your
-        Source Directory.
+     In either case, the result will be a set of :term:`Layers <Layer>` and a
+     :term:`Build Directory`: this is the Source Directory for your build. The
+     documentation usually denotes this directory with the name "project".
 
-     Sometimes you might hear the term "poky directory" used to refer to
-     this directory structure.
+     We present a :term:`Source Directory` structure and its components in the
+     :doc:`/ref-manual/structure` section of the Yocto Project Reference Manual.
 
      .. note::
 
@@ -547,43 +550,10 @@ universal, the list includes them just in case:
         names that contain spaces. Be sure that the Source Directory you
         use does not contain these types of names.
 
-     The Source Directory contains BitBake, Documentation, Metadata and
-     other files that all support the Yocto Project. Consequently, you
-     must have the Source Directory in place on your development system in
-     order to do any development using the Yocto Project.
-
-     When you create a local copy of the Git repository, you can name the
-     repository anything you like. Throughout much of the documentation,
-     "poky" is used as the name of the top-level folder of the local copy
-     of the poky Git repository. So, for example, cloning the ``poky`` Git
-     repository results in a local Git repository whose top-level folder
-     is also named "poky".
-
-     While it is not recommended that you use tarball extraction to set up
-     the Source Directory, if you do, the top-level directory name of the
-     Source Directory is derived from the Yocto Project release tarball.
-     For example, downloading and unpacking poky tarballs from
-     :yocto_dl:`/releases/yocto/&DISTRO_REL_LATEST_TAG;/`
-     results in a Source Directory whose root folder is named poky.
-
-
-     It is important to understand the differences between the Source
-     Directory created by unpacking a released tarball as compared to
-     cloning ``git://git.yoctoproject.org/poky``. When you unpack a
-     tarball, you have an exact copy of the files based on the time of
-     release --- a fixed release point. Any changes you make to your local
-     files in the Source Directory are on top of the release and will
-     remain local only. On the other hand, when you clone the ``poky`` Git
-     repository, you have an active development repository with access to
-     the upstream repository's branches and tags. In this case, any local
-     changes you make to the local Source Directory can be later applied
-     to active development branches of the upstream ``poky`` Git
-     repository.
-
-     For more information on concepts related to Git repositories,
-     branches, and tags, see the
-     ":ref:`overview-manual/development-environment:repositories, tags, and branches`"
-     section in the Yocto Project Overview and Concepts Manual.
+     The Source Directory contains BitBake, OpenEmbedded-Core (OE-Core),
+     Documentation, Metadata and other files that all support the Yocto Project.
+     Consequently, you must have the Source Directory in place on your
+     development system in order to do any development using the Yocto Project.
 
    :term:`SPDX`
       This term means *Software Package Data Exchange*, and is used as an open

-- 
2.51.0


