Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AAED116F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:38:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22600.1764261482227337752
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Nov 2025 08:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hYlXrAGy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B5ED31A1DC7
	for <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:38:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EADC60722
	for <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:38:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08A5B103C8C55;
	Thu, 27 Nov 2025 17:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764261480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=05kj1nbDncbJ1DCpZs+B3k/lQGoMCXZc1MJMmqQQqkg=;
	b=hYlXrAGyqlh6KmTq0H2coGvNTlDx4D5pDpbTpkv5y1zNueMSH6S3UBrrr1ewFPtF3EuSCg
	lHdWRvuqTvT2VXr51O89KwJYVUwrYz8pAzbnjef2FnZObZTSv5d6m+EYee4vx6cwyo9CGb
	7rHF2if8XObfHTuBBOn1Sk2PIU1mgNfICVcHg53Du6ScnoTpdcIkYIs68OHy2NgUhTJA3L
	z5T24V27zzZv97EBX+84WPch3XRyuzsvsuPZdLMgDLQd/GVRnmCK4AWq25GFhYyri7CCW1
	tONgu6MpJ0NiE0hzdF3dfDzJFazD//pqA80P5TO33h6sJOX8q6VN2ungPfWS8w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Nov 2025 17:37:47 +0100
Subject: [PATCH 3/3] brief-yoctoprojectqs/index.rst: switch shell block to
 to console lexer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-bitbake-setup-updates-v1-3-75ac1e490a40@bootlin.com>
References: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
In-Reply-To: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=emqElYsVVfKyF6fB2+oYMF5vOJ19OnjB2GSmdOFNS7U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKH5lXAM82NMPAfSxPfFCTImIGWuuTqH0DVvAu
 FaZi825AgiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSh+ZQAKCRDRgEFAKaOo
 NqPgD/4uGVwCUdeOIj/+ToJUKg+iZVP0itn4X9Wxq/t6XxHVhHtI+jcO/RIqr79i7gZWCf/H5Lf
 bXXX6Q80YxatXEmJ/Lv4RCISXKzsYLlqYV1+R6X9g6mn53Ubms/C301S67lKfzO1T0SKZI+DRLH
 1bf/H+Z2i3mh6fMPO+C+XjS5dcxfQa1/e8IBqWbYbtXIYhxF+PPeI5XChXBWOVV4ojAC5YVRcUt
 7fPeCYEz16yms3tQh2s8NjTStzw07vqj2e+KYsoHzc1NAY1UpBaUbnuemi0ZrA+a+07jyoeze6C
 NXfjNGooZ9HKanVKzmQDLEg2xpq+8CRDTMgKWrwiL2UYoCPQgAPkNohxtzdfG/feHXqmqEHMiNn
 Mqr0PxRTc4q7sVw4+pLRqwk+XVmKUdF+5lpQujLfBoAAgsOOebHcxgLmaUuT+yeKNmRDlWWS2oe
 dloB7+2b+tBYByHyHkopx8FseRp4LNcmXKbI1HctOUQvayxgkTWVQvd12fHR2lPyJSpMQ3/C8Vt
 YVzSvXKeEiO8eRKvEPBRwMvtx56izJhd0PFV1ERS3ZRdT6Nq+sOdDohmYqRSxzxbqyPBcYola5j
 8Deg/TmrXdf0K/hccZPbfrQXsJGyIOQnM9btldQc01Zy5M/rO40yTX7c6qN6xq44UgOav1tOqan
 EhOqTXIOPrPnLfQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 16:38:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8156

Console outputs are more accurately represented with the 'console'
lexer. Visually, it separates the command from the output. Switch shell
block to console blocks.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 36 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 1e0d867d6..b8bd65f4a 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -95,13 +95,13 @@ get a copy of the ``bitbake-setup`` tool to setup the :term:`Poky` reference
 distribution on your build host. Use the following commands to clone
 the bitbake repository.
 
-.. code-block:: shell
+.. code-block:: console
 
    $ git clone https://git.openembedded.org/bitbake
 
 Setup a build environment with the following command:
 
-.. code-block:: shell
+.. code-block:: console
 
    $ ./bitbake/bin/bitbake-setup init
 
@@ -110,7 +110,7 @@ By default, this will setup a top directory in the current directory.
 If you prefer to setup your builds in a different top directory, for example
 ``$HOME/bitbake-builds``, you can set it with the :ref:`bitbake:ref-bbsetup-command-settings` command:
 
-.. code-block:: shell
+.. code-block:: console
 
    $ ./bitbake/bin/bitbake-setup settings set --global default top-dir-prefix $HOME
 
@@ -125,7 +125,7 @@ differ from the examples below.
 
 #. Choose a configuration (for example, ``poky-master``):
 
-   .. code-block:: shell
+   .. code-block:: console
 
       Available configurations:
       1. poky-master  Poky - The Yocto Project testing distribution configurations and hardware test platforms
@@ -140,7 +140,7 @@ differ from the examples below.
    Depending on the choice above, new options can be prompted to further specify
    which configuration to use. For example:
 
-   .. code-block:: shell
+   .. code-block:: console
 
       Available bitbake configurations:
       1. poky Poky - The Yocto Project testing distribution
@@ -151,7 +151,7 @@ differ from the examples below.
 
 #. Choose a target :term:`MACHINE` (for example, ``qemux86-64``):
 
-   .. code-block:: shell
+   .. code-block:: console
 
       Target machines:
       1. machine/qemux86-64
@@ -165,7 +165,7 @@ differ from the examples below.
 
 #. Choose a :term:`DISTRO` (for example, ``poky``):
 
-   .. code-block:: shell
+   .. code-block:: console
 
       Distribution configuration variants:
       1. distro/poky
@@ -177,7 +177,7 @@ differ from the examples below.
 
 #. Choose a :term:`bitbake:setup` directory name:
 
-   .. code-block:: shell
+   .. code-block:: console
 
       Enter setup directory name: [poky-master-poky-distro_poky-machine_qemux86-64]
 
@@ -189,7 +189,7 @@ differ from the examples below.
    If you prefer to run non-interactively, you can run a command like the
    following:
 
-   .. code-block:: shell
+   .. code-block:: console
 
       $ bitbake-setup init --non-interactive poky-master poky-with-sstate distro/poky machine/qemux86-64
 
@@ -248,7 +248,7 @@ an entire Linux distribution, including the toolchain, from source.
     environment setup script within the :term:`bitbake:BitBake build` directory
     to setup the :term:`BitBake` build environment on your host:
 
-    .. code-block:: shell
+    .. code-block:: console
 
        $ source poky-master-poky-distro_poky-machine_qemux86-64/build/init-build-env
        Poky reference distro build
@@ -261,7 +261,7 @@ an entire Linux distribution, including the toolchain, from source.
     With this tool, list the currently enabled :term:`configuration fragments
     <Configuration Fragment>`:
 
-    .. code-block:: shell
+    .. code-block:: console
 
        $ bitbake-config-build list-fragments
 
@@ -288,7 +288,7 @@ an entire Linux distribution, including the toolchain, from source.
     can be useful for development, you can enable the
     :ref:`ref-fragments-root-login-with-empty-password` fragment:
 
-    .. code-block:: shell
+    .. code-block:: console
 
        $ bitbake-config-build enable-fragment root-login-with-empty-password
 
@@ -318,7 +318,7 @@ an entire Linux distribution, including the toolchain, from source.
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
 
-   .. code-block:: shell
+   .. code-block:: console
 
       $ bitbake core-image-sato
 
@@ -332,7 +332,7 @@ an entire Linux distribution, including the toolchain, from source.
    built, you can start QEMU, which is a Quick EMUlator that ships with
    the Yocto Project:
 
-   .. code-block:: shell
+   .. code-block:: console
 
       $ runqemu qemux86-64
 
@@ -378,7 +378,7 @@ layer>`:
 
     For this, the ``bitbake-layers add-layer`` can be used:
 
-    .. code-block:: shell
+    .. code-block:: console
 
        $ bitbake-layers add-layer ../layers/meta-raspberrypi
 
@@ -393,7 +393,7 @@ layer>`:
     machine, so let's make it the :term:`MACHINE` used for the build with
     ``bitbake-config-build``:
 
-    .. code-block:: shell
+    .. code-block:: console
 
        $ bitbake-config-build enable-fragment machine/raspberrypi5
 
@@ -414,7 +414,7 @@ layer>`:
 #. **Start The Build:** The configuration is now set to build for the Raspberry
    Pi 5. Start the build again:
 
-   .. code-block:: shell
+   .. code-block:: console
 
       $ bitbake core-image-sato
 
@@ -441,7 +441,7 @@ configuration file, a ``recipes-example`` subdirectory that contains an
 The following commands run the tool to create a layer named
 ``meta-mylayer``:
 
-.. code-block:: shell
+.. code-block:: console
 
    $ bitbake-layers create-layer ../layers/meta-mylayer
    NOTE: Starting bitbake server...

-- 
2.51.0


