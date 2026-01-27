Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06EBCA6C89
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6048.1769501970553621088
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SsPsL8pQ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0CEFFC211CE
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1484F606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6255C119A8689;
	Tue, 27 Jan 2026 09:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8P7/HXxrqqJIzc0mRWEQN0+WhKyAmUPJJkdj7JUDoLA=;
	b=SsPsL8pQD7z0GQ+wVhZk/ALDgPgxtZgr5iF63IKCQKdtYFWJ9WSil4yTK/4UZnkVs8sOFv
	xLeLYS9xI6LG6dXHJcF1XGpPu0myeZPFNIwW2YBEBO6zMwOWJn+0nVQtpX970HtD1VbUh1
	y6UnnwgYWgCS4QRYOfqFgy4DjJ1d+CsWCAd+7FbO9KU1kQauhNE07DiMOMSI2Bi6tVXjDY
	+0brAVvWg18l6Ny3mwRfQ/F96TXTAqsHzd2k2HL8Cb77xp3yCIMKNYeiSJWjToXSaMo+Dv
	F+QaJJP4HSabj6QVPXW3BLrCXFkB/3hWKBflrKeYhGUjzgJHL4XiiWrk9vzjyg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:07 +0100
Subject: [PATCH v2 12/56] dev-manual/layers.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-12-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4285;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0O0z3xXUK3PBdiJz/RdxKWh1GNAHX5NoolfAYEKMWmg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUA59Txspm9+LX7jORxqRd+vcQG5SMuSbEuM
 +MTNLHnPs6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AAAKCRDRgEFAKaOo
 NtibEAC/lqTwi6S7WkPjw6mXi24Mag3CccgqrkOH70406F6eJOiKuCn6r4POH6zqlXCvAmuNvYf
 3hkfO+pxJbhgPz1MsVs2B/59B2TF9m3rxUo4HNfA5vRUrNPCs2rxpkzTe4oRUIvofkcTVpaQrpp
 1kFrcwquWArSGwChHaSw5xRyN4zQvNQQhvoCBPmw3DI/RARrfLxv748qgwCFtMmoGd2fHQ800M5
 kc8NSP5iR7sB2BGZAiz/AjUDntOTqzcgsmcDP/XoWSc66Ua/zEedf6KBlarOU9Lh7WFgWl0M8Kf
 v/4c0on/l1zgurHmmy325LAKDR/IvkAUqm+ZqkMiNf7Js6/cgZPVaH3Zto3rGpi5EOB7yprzLpF
 Hwbh79UK6L8BbHrw1SfvaONJlRRlxYWrh+O35o8gW1srSUMcnPIVEMoGzD6514KIsJOKagAHynY
 ihOqwVcku5Ub0RcpE5Ls9NnxJDEb4cwNKiZyF7q3t0ixP0F626RbkmtRzfZx+Z9SJ6xczCLcqKX
 bEA7ke83bHFONrnezAA3b5cLkhBLsLoFVxEuDEPiTASZGI3nLE8X/Gv91kxmK8MluY5t2jRmUld
 az5epZ+mCjfBviot/KnojyER1eeh0/GrFW83rEyNNOZj2Jz9PET7ai8kgxo6CcdIubq8CzfxQb7
 zrvzKp9CWCghVYQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8673

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 456e72f4f..ab5c258f1 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -290,7 +290,7 @@ following list:
    repository that use the ``meta-layer_name`` format.
 
 -  *Group Your Layers Locally:* Clone your repository alongside other
-   cloned ``meta`` directories from the :term:`Source Directory`.
+   layers in your :term:`Source Directory`.
 
 Making Sure Your Layer is Compatible With Yocto Project
 =======================================================
@@ -529,10 +529,10 @@ possible.
 Overlaying a File Using Your Layer
 ----------------------------------
 
-As an example, consider the main formfactor recipe and a corresponding
-formfactor append file both from the :term:`Source Directory`.
+As an example, consider the main ``formfactor`` recipe and a corresponding
+``formfactor`` append file both from :term:`OpenEmbedded-Core (OE-Core)`.
 Here is the main
-formfactor recipe, which is named ``formfactor_0.0.bb`` and located in
+``formfactor`` recipe, which is named ``formfactor_0.0.bb`` and located in
 the "meta" layer at ``meta/recipes-bsp/formfactor``::
 
    SUMMARY = "Device formfactor information"
@@ -609,8 +609,8 @@ Installing Additional Files Using Your Layer
 --------------------------------------------
 
 As another example, consider the main ``xserver-xf86-config`` recipe and a
-corresponding ``xserver-xf86-config`` append file both from the :term:`Source
-Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
+corresponding ``xserver-xf86-config`` append file both from
+:term:`OpenEmbedded-Core (OE-Core)`.  Here is the main ``xserver-xf86-config`` recipe, which is named
 ``xserver-xf86-config_0.1.bb`` and located in the "meta" layer at
 ``meta/recipes-graphics/xorg-xserver``::
 
@@ -897,7 +897,9 @@ Add your layer by using the ``bitbake-layers add-layer`` command::
 Here is an example that adds a
 layer named ``meta-scottrif`` to the configuration file. Following the
 command that adds the layer is another ``bitbake-layers`` command that
-shows the layers that are in your ``bblayers.conf`` file::
+shows the layers that are in your ``bblayers.conf`` file:
+
+.. code-block:: console
 
    $ bitbake-layers add-layer meta-scottrif
    NOTE: Starting bitbake server...
@@ -905,14 +907,13 @@ shows the layers that are in your ``bblayers.conf`` file::
    Parsing of 1441 .bb files complete (0 cached, 1441 parsed). 2055 targets, 56 skipped, 0 masked, 0 errors.
    $ bitbake-layers show-layers
    NOTE: Starting bitbake server...
-   layer                 path                                      priority
-   ==========================================================================
-   meta                  /home/scottrif/poky/meta                  5
-   meta-poky             /home/scottrif/poky/meta-poky             5
-   meta-yocto-bsp        /home/scottrif/poky/meta-yocto-bsp        5
-   workspace             /home/scottrif/poky/build/workspace       99
-   meta-scottrif         /home/scottrif/poky/build/meta-scottrif   6
-
+   layer                 path                                                            priority
+   ==============================================================================================
+   meta                  /home/scottrif/bitbake-builds/layers/openembedded-core/meta           5
+   meta-poky             /home/scottrif/bitbake-builds/layers/meta-yocto/meta-poky             5
+   meta-yocto-bsp        /home/scottrif/bitbake-builds/layers/meta-yocto/meta-yocto-bsp        5
+   workspace             /home/scottrif/bitbake-builds/build/workspace                         99
+   meta-scottrif         /home/scottrif/bitbake-builds/build/meta-scottrif                     6
 
 Adding the layer to this file
 enables the build system to locate the layer during the build.

-- 
2.52.0


