Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5D5CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 15:35:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39607.1779377711623168804
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 08:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=mQkBHnO3;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pXPsnWR34Ariljp8PtWhrsuRx4r40/oYjr8rEb2sL6A=; b=mQkBHnO3iNLssrT+0fJ6tcQ9cZ
	t+jWz+hgjB0x8F+prDj7BAtKOG0hXRL6oseM14lkg8WNGjBpyfXpzu2zzAm7BTIIeDgdot8LLJ4i3
	EXRrs7LBNrxYTm+zpS9f35o7fqa3gJekR7m2cbJeRCrTC3mrKgHT/GHJUPIWn8CptfI4xBleUqzlC
	D0uM9XcU177W+szDLqOp3pNAG1K3IGjWouBNrCczG+bkaVFC2tQy6V9NBl3V4bCFHaN+M9ljJQ/yN
	eUZSFq3i/B3zukVngAjpMYSRcQj9otogmsXeQ9ujsuZP2S/gdrRtyDFYscIcy2uSVTtnU7ZhH2PwI
	enmx+Tbw==;
Received: from [147.129.179.166] (port=41300 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQ5QR-00000002xf1-1eSo
	for docs@lists.yoctoproject.org;
	Thu, 21 May 2026 11:35:10 -0400
Date: Thu, 21 May 2026 11:38:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp-guide: update "README" to "README.md"
Message-ID: <e7a80285-e53e-d4bd-15dc-a19e5d8fd091@crashcourse.ca>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 15:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9520


Since the standard for BSP layers appears to be top-level "README.md"
files rather than just "README" (and since some of the links are
actually misnamed because of this), do a global replacement throughout
the guide.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index a3b57d29f..5cd27893c 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -103,7 +103,7 @@ layer and from it build an image. Here is an example::

 Some BSPs require or depend on additional layers beyond the BSP's root
 layer in order to be functional. In this case, you need to specify these
-layers in the ``README`` "Dependencies" section of the BSP's root layer.
+layers in the ``README.md`` "Dependencies" section of the BSP's root layer.
 Additionally, if any build instructions exist for the BSP, you must add
 them to the "Dependencies" section.

@@ -171,7 +171,7 @@ section.
 #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
    based on current Intel CPUs and devices, you can leverage this BSP
    layer. For details on the ``meta-intel`` BSP layer, see the layer's
-   :yocto_git:`README </meta-intel/tree/README.md>` file.
+   :yocto_git:`README.md </meta-intel/tree/README.md>` file.

    #. *Navigate to Your Source Directory:* Typically, you set up the
       ``meta-intel`` Git repository next to the other layers in your build.
@@ -274,7 +274,7 @@ individual BSPs could differ. ::

    meta-bsp_root_name/
    meta-bsp_root_name/bsp_license_file
-   meta-bsp_root_name/README
+   meta-bsp_root_name/README.md
    meta-bsp_root_name/README.sources
    meta-bsp_root_name/binary/bootable_images
    meta-bsp_root_name/conf/layer.conf
@@ -462,18 +462,18 @@ developer. For information on how to maintain license compliance, see
 the ":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.

-README File
------------
+README.md File
+--------------

-You can find this file in the BSP Layer at::
+You can find this Markdown-format file in the BSP Layer at::

-   meta-bsp_root_name/README
+   meta-bsp_root_name/README.md

 This file provides information on how to boot the live images that are
-optionally included in the ``binary/`` directory. The ``README`` file
+optionally included in the ``binary/`` directory. The ``README.md`` file
 also provides information needed for building the image.

-At a minimum, the ``README`` file must contain a list of dependencies,
+At a minimum, the ``README.md`` file must contain a list of dependencies,
 such as the names of any other layers on which the BSP depends and the
 name of the BSP maintainer with his or her contact information.

@@ -512,7 +512,7 @@ use these kernels and images to get a system running and quickly get
 started on development tasks.

 The exact types of binaries present are highly hardware-dependent. The
-:ref:`README <bsp-guide/bsp:readme file>` file should be present in the
+:ref:`README.md <bsp-guide/bsp:readme.md file>` file should be present in the
 BSP Layer and it explains how to use the images with the target
 hardware. Additionally, the
 :ref:`README.sources <bsp-guide/bsp:readme.sources file>` file should be
@@ -890,13 +890,13 @@ The requirements for a released BSP that conform to the Yocto Project are:
    file for the Raspberry Pi BSP in the ``meta-raspberrypi`` BSP layer
    as an example.

--  *README File:* You must include a ``README`` file in the
+-  *README.md File:* You must include a ``README.md`` file in the
    ``meta-bsp_root_name`` directory. See the
    :yocto_git:`README.md </meta-raspberrypi/tree/README.md>`
    file for the Raspberry Pi BSP in the ``meta-raspberrypi`` BSP layer
    as an example.

-   At a minimum, the ``README`` file should contain the following:
+   At a minimum, the ``README.md`` file should contain the following:

    -  A brief description of the target hardware.

@@ -943,7 +943,7 @@ The requirements for a released BSP that conform to the Yocto Project are:
    machine configuration files define variations of machine
    configurations that the BSP supports. If a BSP supports multiple
    machine variations, you need to adequately describe each variation in
-   the BSP ``README`` file. Do not use multiple machine configuration
+   the BSP ``README.md`` file. Do not use multiple machine configuration
    files to describe disparate hardware. If you do have very different
    targets, you should create separate BSP layers for each target.


