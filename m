Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630D2CE7AED
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 11:18:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15748.1763119122986342717
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 03:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k5I6CqzV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A7F621A1AA3
	for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:18:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 801EB6060E
	for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:18:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F2EF102F292F;
	Fri, 14 Nov 2025 12:18:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763119121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aOnGpiT1boy1QdgHflCdgnA8DOC/QoD4+JNme5tKQLU=;
	b=k5I6CqzVAzSqlegzzsNHFYas33F/o0BBJMp6TFAMcCyuXxJQUxl0nC2Enm8HBwwQtjstfD
	jRsJQgC8CAAZp4PhzktMqsAu3XxRN7zH/i4eDRDBq4/gbuia2IC4Um6gUytnnOhSDM7FiI
	thTpnU8F/t24VfTHkhmsEVqfhENtJ0FBKByFsNbUEeDlHfzxk7Zb3cfA9kMYBvXuxS2puT
	a7ZK6lh7jy0bVZJMpdoFUS12p6x0nG2wRpVLQP89PkNjNN2HYXpHN6elqP45Nas2tiyb6c
	LsCVlJPTQDiRBtvuW43cVsvvTr1JTodxVjFXyxrWrZEDvFiEl3JXg2cCBCY53w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 14 Nov 2025 12:18:24 +0100
Subject: [PATCH 2/2] brief-yoctoprojectqs/index.rst: refresh after
 bitbake-setup updates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-update-bbsetup-doc-v1-2-07e623b8ad2a@bootlin.com>
References: <20251114-update-bbsetup-doc-v1-0-07e623b8ad2a@bootlin.com>
In-Reply-To: <20251114-update-bbsetup-doc-v1-0-07e623b8ad2a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3807;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QXB7jzv0J/12pXCigMRbVkWs6gXqddQ+L+7BaM4Hc8E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpFxAPihJqPj4zxeWSp2HmfeDIFxVb77lJZDGOQ
 cZF94P5ejeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaRcQDwAKCRDRgEFAKaOo
 NsbSD/wMRYw3f8yiMEiJnz1wmRiXgKayj3o2/VKtxqv2SFTix9yFvsB90NQGcB/b1epi3mjoy2g
 GMr/uX+h2yNZNGjH/FE7nybIOPjkIb5Tbtxv11XUejQqjCZ3IwQxW6vWsj1rvA0Mdd6qkpMwtHJ
 ucV7UbuR3xMSPzLHMP5bPRkL7Qmj0svOfB/N22sw0XT9JJR5t3TPHUSWVepBN2FxD+nA6GhkR4E
 boh3l+h5UuhoJgLOyFoCKW9noqtsSqX47S2CcnC+SvUyespXM6wn9fC7CqfNVt5bDjKE6Gz7hJt
 0ZOOSKIFAsNnKdlgM2iy9++BVH4+mpiD7E6aAbA/B+OQ8Jqt++ylG9h4PNxwlTZ9jMsDEIt/MQ9
 IBFX00l4lCmJRaX2ymbHIOnCZx+2l5oFObcicUCa5hQy0diioeqovo2F989wRHLrU4HQXqOcvpJ
 2EqJaGrpJ7I2T/3EozEIvh756qPET29aL+fKPiym8yBbnukYQcGc//9JKl5lAu3rZAp7/y4zy0T
 Ab9ImMtLtv6bLOn1JHVuCA4pnl3O3BTkF/Lsw3Hr6aYmKmk6PXhwU6W+eKuabBC46L23UuJK+GG
 XnZ0m+WW4MGfHuiodqKHHUBYWiAXPKt/RGx998td23hDLdbnH41C0jdz8EOJPGQcgrwbJdxX4Tf
 wcDyAETMJwYig2g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:18:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8043

Refresh the brief-yoctoprojectqs document after changes in upstream
bitbake-setup:

- Choices are now indexed starting from 1.
- Users can now choose the setup dir name during the init.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 43 +++++++++++++++++-----------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 2a7bd575c..211b6d70f 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -127,11 +127,11 @@ differ from the examples below.
    .. code-block:: shell
 
       Available configurations:
-      0. poky-master  Poky - The Yocto Project testing distribution configurations and hardware test platforms
-      1. oe-nodistro  OpenEmbedded - 'nodistro' basic configuration
+      1. poky-master  Poky - The Yocto Project testing distribution configurations and hardware test platforms
+      2. oe-nodistro  OpenEmbedded - 'nodistro' basic configuration
 
       Please select one of the above configurations by its number:
-      0
+      1
 
    Depending on the choice above, new options can be prompted to further specify
    which configuration to use. For example:
@@ -139,37 +139,46 @@ differ from the examples below.
    .. code-block:: shell
 
       Available bitbake configurations:
-      0. poky Poky - The Yocto Project testing distribution
-      1. poky-with-sstate     Poky - The Yocto Project testing distribution with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.
+      1. poky Poky - The Yocto Project testing distribution
+      2. poky-with-sstate     Poky - The Yocto Project testing distribution with internet sstate acceleration. Use with caution as it requires a completely robust local network with sufficient bandwidth.
 
       Please select one of the above bitbake configurations by its number:
-      0
+      1
 
 #. Choose a target :term:`MACHINE` (for example, ``qemux86-64``):
 
    .. code-block:: shell
 
       Target machines:
-      0. machine/qemux86-64
-      1. machine/qemuarm64
-      2. machine/qemuriscv64
-      3. machine/genericarm64
-      4. machine/genericx86-64
+      1. machine/qemux86-64
+      2. machine/qemuarm64
+      3. machine/qemuriscv64
+      4. machine/genericarm64
+      5. machine/genericx86-64
 
       Please select one of the above options by its number:
-      0
+      1
 
 #. Choose a :term:`DISTRO` (for example, ``poky``):
 
    .. code-block:: shell
 
       Distribution configuration variants:
-      0. distro/poky
-      1. distro/poky-altcfg
-      2. distro/poky-tiny
+      1. distro/poky
+      2. distro/poky-altcfg
+      3. distro/poky-tiny
 
       Please select one of the above options by its number:
-      0
+      1
+
+#. Choose a :term:`bitbake:setup` directory name:
+
+   .. code-block:: shell
+
+      Enter setup directory name: [poky-master-poky-distro_poky-machine_qemux86-64]
+
+   Press Enter to leave it to the default value shown in the brackets, or type a
+   custom directory name.
 
 .. note::
 
@@ -181,7 +190,7 @@ differ from the examples below.
       $ bitbake-setup init --non-interactive poky-master poky-with-sstate distro/poky machine/qemux86-64
 
 The ``init`` command creates a new :term:`bitbake:Setup` in the
-:term:`bitbake:top directory`. Its name is derived from the selected
+:term:`bitbake:top directory`. The default name is derived from the selected
 configuration above.
 
 For the selected options in the above example, this would be::

-- 
2.51.0


