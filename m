Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF81F327DB
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 17:24:30 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40393.1776792268549421169
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 10:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KWI4O5Y+;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8acb3dab8dfso29622886d6.1
        for <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 10:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792267; x=1777397067; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MO9qFQi3RpGDbnkDFwmdxXig2fFrSIzroacTqGbMHB4=;
        b=KWI4O5Y+FGvp9i4TUo7y8y5Td4+/joOoDemix/t9Boo8cQYDbCgVFgKFgtRg7DSbCb
         r90bpixJnoRblwYuT3s+KT6DrdKgXRBoWSrPzZ7TiI5S6nBQbNAMR6GcGWNhsMBuXew2
         P14y6BUr9GDyOnM9eEK8omkuBXKFwldOiY8e9wrkbP/hO6KeaCtw/0ZIAJtQfAuAC0oF
         lqw7z2bOUPNWKV2M3db1uD17EjwrSxHKmUTHZJsPHVRmOW9PtzgVc130hZh0+VCPsByf
         rdLwylpu0uLaZcqUUDla2kPD/cGs2v3CgyDXx9VJ/J6AE/mrsMoTBlDlzjkww8Q+Hfvw
         zNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792267; x=1777397067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MO9qFQi3RpGDbnkDFwmdxXig2fFrSIzroacTqGbMHB4=;
        b=klKrBx2pOJ9kaH8H5ru6rLM2fCB7A6pgpb0FZEHPIy8WTh7mUK06xabYjXUr4bXORb
         S57JPWDe9e7RgIKNoXKRku4zkpijtiuzy2GL+ZY6pohXR/9ppeUWUabgjhn9wdQLbbVG
         kqkngzR4bK12l85ceM2+bLWNgH900T78LZ3LiLnEJ1JmFr1PnZ1EAkG89ILUwzQUYVKR
         rHxU+jtwCWGtlJ0Iy/jf6AO4V9PT4XaLsOOw8QzQ+M8Sivz2jFOMBnRpmqMcjgcU4a9X
         8oG1AcXNuMwU2VqLw0N4cGc9c6bfsXa9Tne9q2uiokffGTKP1DxQNaHMO3W2pWzOnGqY
         M0Xw==
X-Gm-Message-State: AOJu0Yw4DXpVl5OWRRufH/lGUXF7ZAl77iyJ7gMWirl5c0L9iALzQgUW
	FI/j4LkaBZd++K5fmxoQJ/k7yfcW+XHUGfrwG+CMTv52mHTNROZzJqS/pnNAxw==
X-Gm-Gg: AeBDiesNIQrAq2KVRMusrEzMmazwdtv0/bbKfNVTfSrzr80UFeISvcBdkcrkXjzzGsm
	CuSElUgRE5+FYSqe7Ukoi9ctLjGWSjorfggFEJn4dEZaIzcVQg5H4YyjLchz4U/VqRf9qgKDGCH
	B071zJuC6CZJBrW/maLnrLhV3EIGfptFKGCIpEqHl0Yj1mGAHGdadrTjtvCuZFUkX3N1LLQ3Dcu
	0GBVZ0UHm0Yq3wFM0eWGlF2nCp/VJQ3NPxb48Ra+pLdVL+2Yxg0Z/WYsrx40m9jmNoc0SD44p1h
	QW4iO5/wMAMRLL+nCTZOkqQT0Nex72EOTqmufNdmbDC6MlkYk47L5mnIG3buw4MLKPxJL4YJ6LD
	VtQPN6MT0BPEB4xisn3hxH835zM7WiecUjL2izVNX5EqKChvL6bohSEW2w6bpgPCs9EZDS+MzDq
	4XrKzOYL8tjDf8RZSsJLot/fUgzMsNjf+emB5z0LKm0+wLx/k7paLVHzlg6O34Zecw0p8QLubGz
	GzxDwvbXzMvuoM=
X-Received: by 2002:a05:6214:27ef:b0:8a6:1216:fb78 with SMTP id 6a1803df08f44-8b02815a617mr303430036d6.46.1776792266832;
        Tue, 21 Apr 2026 10:24:26 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac429ffsm109150036d6.2.2026.04.21.10.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:24:25 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Trevor Woerner <trevor.woerner@amd.com>
Subject: [RFC PATCH 2/2] BSP dev guide: update to use bitbake lexer
Date: Tue, 21 Apr 2026 13:24:16 -0400
Message-ID: <20260421172416.1801567-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421172416.1801567-1-twoerner@gmail.com>
References: <20260421172416.1801567-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 17:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9302

From: Trevor Woerner <trevor.woerner@amd.com>

Identify all bitbake blocks, re-categorize them as "code-blocks" and set
their language as "bitbake".

10 highlighted BitBake blocks emitted in the rendered HTML, matching
the 10 code-block:: bitbake directives now in bsp.rst. Build completed
with the same 189 pre-existing warnings (all intersphinx / cross- ref
related, none from these changes).

Edits

In documentation/bsp-guide/bsp.rst, I converted every snippet that
is actually BitBake metadata from a plain literal block (::) to ..
code-block:: bitbake. Shell transcripts, directory listings, and prose-
following :: blocks were left alone. The 10 converted blocks are:

  1. BBLAYERS ?= ... example near the BSP-layer overview.
  2. The expanded BBLAYERS example covering container layers like
     meta-openembedded/meta-oe.
  3. The boilerplate conf/layer.conf (BBPATH, BBFILES,
     BBFILE_COLLECTIONS, LAYERDEPENDS_bsp).
  4. The Raspberry Pi conf/layer.conf excerpt with LICENSE_PATH.
  5. The include conf/machine/include/rpi-base.inc directive in
     raspberrypi3.conf.
  6. The PREFERRED_PROVIDER_virtual/kernel /
     PREFERRED_VERSION_linux-yocto snippet in the kernel-recipe section.
  7. The FILESEXTRAPATHS:prepend := "${THISDIR}/files:" example in the
     customizing-a-recipe walkthrough.
  8. The Beaglebone conf/layer.conf shown in "BSP Layer Configuration
     Example".
  9. The Beaglebone PREFERRED_PROVIDER_virtual/kernel /
     PREFERRED_VERSION_linux-yocto snippet in "BSP Kernel Recipe Example".
 10. The linux-yocto_6.1.bbappend body (KBRANCH:*, KMACHINE:*,
     SRCREV_machine:*, COMPATIBLE_MACHINE:*, LINUX_VERSION:*).

The directory-listing block at line 290 stays as code-block:: none
(it is a filesystem tree, not BitBake), and the formfactor machconfig
snippet (HAVE_TOUCHSCREEN=0 etc.) is intentionally left as a plain
literal block since it is shell-style key=value, not BitBake syntax.

Verification

  make (python3 -m sphinx -b html ... . _build/html) completes with
  exit 0 and build succeeded, 189 warnings, identical to the pre-change
  baseline; none of those warnings reference bsp.rst line numbers I
  touched, the new bitbake extension, or Pygments lexing. Spot-checking
  the rendered HTML shows 10 highlight-bitbake Pygments-highlighted
  blocks in documentation/_build/html/bsp-guide/bsp.html, matching the 10
  directives.

AI-Generated: codex/claude-opus 4.7 (xhigh)
Signed-off-by: Trevor Woerner <trevor.woerner@amd.com>
---
 documentation/bsp-guide/bsp.rst | 40 ++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index a3b57d29f9e6..67dd9a67d651 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -84,7 +84,9 @@ established after you run the OpenEmbedded build environment setup
 script (i.e. :ref:`structure-core-script`).
 Adding the root directory allows the :term:`OpenEmbedded Build System`
 to recognize the BSP
-layer and from it build an image. Here is an example::
+layer and from it build an image. Here is an example:
+
+.. code-block:: bitbake
 
    BBLAYERS ?= " \
       /usr/local/src/yocto/meta \
@@ -112,7 +114,9 @@ are known as ":term:`container layers <Container Layer>`". An example of
 this type of layer is OpenEmbedded's :oe_git:`meta-openembedded </meta-openembedded>`
 layer. The ``meta-openembedded`` layer contains many ``meta-*`` layers.
 In cases like this, you need to include the names of the actual layers
-you want to work with, such as::
+you want to work with, such as:
+
+.. code-block:: bitbake
 
    BBLAYERS ?= " \
      /usr/local/src/yocto/meta \
@@ -531,7 +535,9 @@ identifies the contents of the layer, and contains information about how
 the build system should use it. Generally, a standard boilerplate file
 such as the following works. In the following example, you would replace
 "bsp" with the actual name of the BSP (i.e. "bsp_root_name" from the example
-template). ::
+template).
+
+.. code-block:: bitbake
 
    # We have a conf and classes directory, add to BBPATH
    BBPATH .= ":${LAYERDIR}"
@@ -546,7 +552,9 @@ template). ::
    LAYERDEPENDS_bsp = "intel"
 
 To illustrate the string substitutions, here are the corresponding
-statements from the Raspberry Pi ``conf/layer.conf`` file::
+statements from the Raspberry Pi ``conf/layer.conf`` file:
+
+.. code-block:: bitbake
 
    # We have a conf and classes directory, append to BBPATH
    BBPATH .= ":${LAYERDIR}"
@@ -603,7 +611,9 @@ For example, many ``tune-*`` files (e.g. ``tune-arm1136jf-s.inc``,
 
 To use an include file, you simply include them in the machine
 configuration file. For example, the Raspberry Pi BSP
-``raspberrypi3.conf`` contains the following statement::
+``raspberrypi3.conf`` contains the following statement:
+
+.. code-block:: bitbake
 
    include conf/machine/include/rpi-base.inc
 
@@ -674,7 +684,9 @@ Suppose you are using the ``linux-yocto_6.12.bb`` recipe to build the
 kernel. In other words, you have selected the kernel in your
 ``"bsp_root_name".conf`` file by adding
 :term:`PREFERRED_PROVIDER` and :term:`PREFERRED_VERSION`
-statements as follows::
+statements as follows:
+
+.. code-block:: bitbake
 
    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ?= "6.12%"
@@ -1027,7 +1039,9 @@ BSP-specific configuration file named ``interfaces`` to the
 also supports several other machines:
 
 #. Edit the ``init-ifupdown_1.0.bbappend`` file so that it contains the
-   following::
+   following:
+
+   .. code-block:: bitbake
 
       FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
@@ -1195,7 +1209,9 @@ BSP Layer Configuration Example
 -------------------------------
 
 The layer's ``conf`` directory contains the ``layer.conf`` configuration
-file. In this example, the ``conf/layer.conf`` file is the following::
+file. In this example, the ``conf/layer.conf`` file is the following:
+
+.. code-block:: bitbake
 
    # We have a conf and classes directory, add to BBPATH
    BBPATH .= ":${LAYERDIR}"
@@ -1375,7 +1391,9 @@ BSP Kernel Recipe Example
 -------------------------
 
 The kernel recipe used to build the kernel image for the BeagleBone
-device was established in the machine configuration::
+device was established in the machine configuration:
+
+.. code-block:: bitbake
 
    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ?= "6.1%"
@@ -1386,7 +1404,9 @@ metadata used to build the kernel. In this case, a kernel append file
 kernel recipe (i.e. ``linux-yocto_6.1.bb``), which is located in
 :oe_git:`/openembedded-core/tree/meta/recipes-kernel/linux`.
 
-The contents of the append file are::
+The contents of the append file are:
+
+.. code-block:: bitbake
 
    KBRANCH:genericx86  = "v6.1/standard/base"
    KBRANCH:genericx86-64  = "v6.1/standard/base"
-- 
2.50.0.173.g8b6f19ccfc3a


