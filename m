Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33650D11181
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 15:48:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16055.1764172107694830671
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 07:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aaAzY+tx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3FFB14E418DF
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 15:48:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 170F560721
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 15:48:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8977C102F08AA;
	Wed, 26 Nov 2025 16:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764172104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tB1ei5iqdycGlLIkTCV1hjfI7Y5s1RF3fnCepyrmvZ8=;
	b=aaAzY+txUYgRBJ4B9CdxJNMtN6yC7yf1a5sYi3D/O3POUtNyzRPdZWVdB50t7a6JVjPLiV
	jnHMyu+ZzPncxSK9AM0eB2kqrwzTalx2EdOyjmmHelqnK3mY69hk8q+3DCTvXcKuiwbMw4
	g/bh0TlhnozDeF+so/10vktYHy49DuNEsv5ry0PteebGLpBP1fjmKraDbiy3CB1iNYrKrC
	OrkD3JV3EpbBS7LDbg6/zjL03baH+PdO9aahcNca/H52eGXY8bfMrRccjRz3nAPOF+JCkf
	vXRIA1QBiGCl+qRhUwzVRVhF/UIcZfg3rNqH6dxnpw5Ugmv8cYOBKSpVzdpzPQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 26 Nov 2025 16:47:43 +0100
Subject: [PATCH] overview-manual/concepts.rst: update the cross-development
 toolchain section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-fix-concepts-toolchains-v1-1-f701b23f0aff@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAB4hJ2kC/yWMQQqDMBAAvyJ77oJJq7X9SunBxFW3lESyqQji3
 7vqcWBmVhBKTALPYoVEMwvHoGAuBfixDQMhd8pgS1sZY2vseUEfg6cpC+YYv6pxEOzdw92ujWn
 vZQ1aT4lUPc6v98nycx/yed/Btv0BqnftHXsAAAA=
X-Change-ID: 20251126-fix-concepts-toolchains-fb9b4381a706
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8635;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JIa3NsS2onWJ3CDICj//VZbZJ3uHQwbYtjTxJEjwEpo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpJyFGSv0MLgr/x4kE33J/8iLigfHJr1UKI+nk7
 kTbUVVwO5KJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSchRgAKCRDRgEFAKaOo
 NlSxD/9rDgmA5JhspT6hnxsT1xHv1jadwb2x0HIAt8JT+Coo5E7WUeukD6vEi7Kv9SVMmg6yWcW
 n9g6tbaH/wpxYAm2zqVGGaQo1WfwSxltizz6I46CdDv2Pq2s29IYvc4TbHGbrlaoNUISkCXmAXv
 duyY0doSZkZv7Tytsoo2wH8aoDTNFQ6WtIXF/uofpTE2uJn1Oh4e/uGbna+JYTBV3O14y2lUkwz
 kAmNLN8hbr8dlfLz0gGF2b6ALanUVzXl4rNGUVcga5M6+k0iqMebxwzjrJxJ9gUi+7fEVNq7Zl+
 QioDjOZ3GckMV59uajzYwobInLKD6ip+RwfE1/xU+bD6HJ7QTjtYYLLzogsl6gSZdZaOuqI1YSz
 Q5wy2OMIdkzE8iWzvFPlI6QpLogrR6SZEsXL06AxXMR2vumiVyBlJOpoxrAkSkM1q9LrPySkU0C
 i4r6W3K3XoF2A8UoxKwm6i/Re7C+wxg2vaokrCEfjxLfTo+Sh3KsAj71xygJMwC2h0gbOeWqRCT
 9TVET2k628Y/bWaT51UAa4cHDG3LgQRXiLdNsBc80qJg/DpZz1WWQ7zOHusKYw6HPDvq4RVQ3Rc
 vHw37puZt9oMd9Y6ptMn4Ltynu3m0gUiicj8gzzykXbwI9g+RXE727iEjG7JXbiLqoQgwANJHBx
 0X7u67INvU9wf9Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 15:48:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8147

Update the cross-development toolchain section of the concepts document
to make it GCC-agnostic as we now have Clang support.

The chain presented to build the relocatable toolchain
(gcc-cross-canadian) was also updated and simplified. `bitbake -g
gcc-cross-canadian-aarch64` was used to understand it better.

Also move the gcc-cross-canadian note after introducing the relocatable
chain of dependencies, as it felt a little too soon to mention it at
this point.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 108 ++++++++++++-----------------
 1 file changed, 43 insertions(+), 65 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 397a8b84d..04a08b7db 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1466,58 +1466,53 @@ build images and generally work within the Yocto Project
 environment. When you run
 :term:`BitBake` to create an image, the
 OpenEmbedded build system uses the host ``gcc`` compiler to bootstrap a
-cross-compiler named ``gcc-cross``. The ``gcc-cross`` compiler is what
-BitBake uses to compile source files when creating the target image. You
-can think of ``gcc-cross`` simply as an automatically generated
+cross-compiler named ``gcc-cross`` (or ``clang-cross`` if Clang is used). This
+compiler is what BitBake uses to compile source files when creating the target
+image. You can think of it simply as an automatically generated
 cross-compiler that is used internally within BitBake only.
 
-.. note::
-
-   The extensible SDK does not use ``gcc-cross-canadian``
-   since this SDK ships a copy of the OpenEmbedded build system and the
-   sysroot within it contains ``gcc-cross``.
-
 The chain of events that occurs when the standard toolchain is bootstrapped::
 
-   binutils-cross -> linux-libc-headers -> gcc-cross -> libgcc-initial -> glibc -> libgcc -> gcc-runtime
+   gcc -> virtual/cross-binutils -> linux-libc-headers -> virtual/cross-cc -> libgcc-initial -> virtual/libc -> libgcc -> virtual/compilerlibs
 
--  ``gcc``: The compiler, GNU Compiler Collection (GCC).
+-  ``gcc``: The compiler, GNU Compiler Collection (GCC), provided by the
+   :term:`Build Host`, or by a :term:`buildtools` tarball.
 
--  ``binutils-cross``: The binary utilities needed in order
-   to run the ``gcc-cross`` phase of the bootstrap operation and build the
-   headers for the C library.
+-  ``virtual/cross-binutils``: The binary utilities needed in order
+   to run the ``virtual/cross-cc`` phase of the bootstrap operation and
+   build the headers for the C library.
 
 -  ``linux-libc-headers``: Headers needed for the cross-compiler and C library build.
 
--  ``libgcc-initial``: An initial version of the gcc support library needed
-   to bootstrap ``glibc``.
-
--  ``libgcc``: The final version of the gcc support library which
-   can only be built once there is a C library to link against.
-
--  ``glibc``: The GNU C Library.
-
--  ``gcc-cross``: The final stage of the bootstrap process for the
+-  ``virtual/cross-cc``: The final stage of the bootstrap process for the
    cross-compiler. This stage results in the actual cross-compiler that
    BitBake uses when it builds an image for a targeted device.
 
    This tool is a "native" tool (i.e. it is designed to run on
    the build host).
 
--  ``gcc-runtime``: Runtime libraries resulting from the toolchain
-   bootstrapping process. This tool produces a binary that consists of
-   the runtime libraries need for the targeted device.
+-  ``libgcc-initial``: An initial version of the GCC support library needed
+   to bootstrap ``virtual/libc``.
+
+-  ``virtual/libc``: An provider of the C Standard Library (for example, the GNU C Library).
+
+-  ``libgcc``: The final version of the GCC support library which
+   can only be built once there is a C library to link against.
+
+-  ``virtual/compilerlibs``: Runtime libraries resulting from the toolchain
+   bootstrapping process. This tool produces a binary that consists of the
+   runtime libraries need for the targeted device.
 
 You can use the OpenEmbedded build system to build an installer for the
 relocatable SDK used to develop applications. When you run the
 installer, it installs the toolchain, which contains the development
-tools (e.g., ``gcc-cross-canadian``, ``binutils-cross-canadian``, and
-other ``nativesdk-*`` tools), which are tools native to the SDK (i.e.
-native to :term:`SDK_ARCH`), you need to cross-compile and test your
-software. The figure shows the commands you use to easily build out
-this toolchain. This cross-development toolchain is built to execute on the
-:term:`SDKMACHINE`, which might or might not be the same machine as
-the Build Host.
+tools (e.g., ``gcc-cross-canadian``, ``clang-cross-canadian``,
+``binutils-cross-canadian``, and other ``nativesdk-*`` tools), which are tools
+native to the SDK (i.e. native to :term:`SDK_ARCH`), you need to cross-compile
+and test your software. The figure shows the commands you use to easily build
+out this toolchain. This cross-development toolchain is built to execute on the
+:term:`SDKMACHINE`, which might or might not be the same machine as the Build
+Host.
 
 .. note::
 
@@ -1527,43 +1522,26 @@ the Build Host.
 
 Here is the bootstrap process for the relocatable toolchain::
 
-   gcc -> binutils-crosssdk -> gcc-crosssdk-initial -> linux-libc-headers -> glibc-initial -> nativesdk-glibc -> gcc-crosssdk -> gcc-cross-canadian
-
--  ``gcc``: The build host's GNU Compiler Collection (GCC).
-
--  ``binutils-crosssdk``: The bare minimum binary utilities needed in
-   order to run the ``gcc-crosssdk-initial`` phase of the bootstrap
-   operation.
+   gcc -> virtual/cross-binutils -> linux-libc-headers -> virtual/cross-cc -> libgcc-initial -> virtual/libc -> gcc-cross-canadian/clang-cross-canadian
 
--  ``gcc-crosssdk-initial``: An early stage of the bootstrap process for
-   creating the cross-compiler. This stage builds enough of the
-   ``gcc-crosssdk`` and supporting pieces so that the final stage of the
-   bootstrap process can produce the finished cross-compiler. This tool
-   is a "native" binary that runs on the build host.
+The chain is the same as the standard toolchain, except for the last item:
+``gcc-cross-canadian`` (or ``clang-cross-canadian``) is the final relocatable
+cross-compiler. When run on the :term:`SDKMACHINE`, this tool produces
+executable code that runs on the target device. Only one cross-canadian compiler
+is produced per architecture since they can be targeted at different processor
+optimizations using configurations passed to the compiler through the compile
+commands. This circumvents the need for multiple compilers and thus reduces the
+size of the toolchains.
 
--  ``linux-libc-headers``: Headers needed for the cross-compiler.
-
--  ``glibc-initial``: An initial version of the Embedded GLIBC needed to
-   bootstrap ``nativesdk-glibc``.
+.. note::
 
--  ``nativesdk-glibc``: The Embedded GLIBC needed to bootstrap the
-   ``gcc-crosssdk``.
+   The extensible SDK does not use ``gcc-cross-canadian`` or ``clang-cross-canadian``
+   since this SDK ships a copy of the OpenEmbedded build system and the
+   sysroot within it contains ``gcc-cross``.
 
--  ``gcc-crosssdk``: The final stage of the bootstrap process for the
-   relocatable cross-compiler. The ``gcc-crosssdk`` is a transitory
-   compiler and never leaves the build host. Its purpose is to help in
-   the bootstrap process to create the eventual ``gcc-cross-canadian``
-   compiler, which is relocatable. This tool is also a "native" package
-   (i.e. it is designed to run on the build host).
+.. note::
 
--  ``gcc-cross-canadian``: The final relocatable cross-compiler. When
-   run on the :term:`SDKMACHINE`,
-   this tool produces executable code that runs on the target device.
-   Only one cross-canadian compiler is produced per architecture since
-   they can be targeted at different processor optimizations using
-   configurations passed to the compiler through the compile commands.
-   This circumvents the need for multiple compilers and thus reduces the
-   size of the toolchains.
+   To learn how to use Clang for the SDK, see :term:`PREFERRED_TOOLCHAIN_SDK`.
 
 .. note::
 

---
base-commit: bcb6a7c8a401ceadf69a4c0c14dbc89f85ffdebe
change-id: 20251126-fix-concepts-toolchains-fb9b4381a706


