Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEB1C88E4F
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5797.1769501962979373907
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nsnKAXJr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6FFA74E422CB
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 477A8606F5;
	Tue, 27 Jan 2026 08:19:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6432F119A867D;
	Tue, 27 Jan 2026 09:19:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wjl4d53mc6wCO/qGfxZ93rzrOZHOvIp3vm+zpMsjDDE=;
	b=nsnKAXJrjrKc0Ud5mzF80BNUxH1XFJKAvns2Y9oFAyPmZNKK9AvQSOzJjK2i2Ep3HsWFJV
	f3rDy1dWE4PegrXUafDL+gmfEBEWPu7uJ0o3kUpD6IuhemEfzSguC1WuAOzK9H2zmEcx3I
	8zn8cPz34VI5eTZnRcfLKldgC7yc2j5khTTEREa4sGWXNKsSjcEHCaJWr8cxFTCQWhNLzv
	WxOPSQrjPRzJRHEx9o7S+XuUjbjCABViejap/dyTHELRVGEu1llelm33Wrn/N+62x+iiBz
	Ke2HhETOSs3dOI+w5AR6l23aY8wmknhdQK8vi22H9ROMvqqMIw7uevHTFJQh+w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:18:56 +0100
Subject: [PATCH v2 01/56] transitioning-to-a-custom-environment.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-1-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3401;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0F4IHnBzDvWpK8t8LkLBteRlMMQt3d8H4EbekxMvrKY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHT+I/siF6BPOn3VtCdtUaAKD89KFsqp+QE7C
 /+FNiuAIweJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh0/gAKCRDRgEFAKaOo
 Nh4TEADApzvzqQA6SziqYGAmiwLwNXJ+MSGEAVZXND5+2hhgebNZeDHbmnTxGVPzzE1HE+YylLM
 Bo7zkgqnYEpT0gtbYhPZ83b9HNi9SwYAexpKxVlKCfD0GCpWupcIa50qgxh6t8lJKO3/1wM1WBi
 JosZrHTE4BvspKEerpgLgkpcFB5ctCuZit0/ckjc1WGbA3UtVf9/iPJoRWIVuv94ZYCCW9lat+i
 eFxcVdrwTue559a0jy0rFsJErYCqJKnQ4ifTPaYSP0aTvxT+HCeQ09yeyuq2AtohKZpY2KYzX4h
 6QrbW8HLbm3nDdfSJWjPLKZi+Yz8sQJ8h9lZvWJGNVxxNS5JX9dTrUq/bltHqBeD5WXuuklgANe
 ZNMEzhJ90OYVH5rqu3b6mavGb2xlswMdsU2k3hTkh6PEIxuffy5HKVAbVXdtrYyHQJu+zJd6dDk
 XzLjrodRU1L9XSeyAgYPoxXcH4K1/QniNuXIWUbWLEsyuNT5z/toGHtRtuGOTZDm2LoQ7WKh5lo
 HoVs9t0Hq+fen6zFaebZ4R4pqmaEG/STGcdpm+rUyE3LDGJSj5P0vhpGySCtODKjjF3DVyIitus
 Gmwvhx6RyPSPuT+LyIEg7Jism5vAY8vrhheE77PcymjI3isOFtvg1WDCloamObsFih9OhAYAntP
 Ya37E38fw9dPoYQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8661

- Use :term: for Poky.
- Mention use of fragments instead of local.conf.
- Remove Yocto < 2.4 reference.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../transitioning-to-a-custom-environment.rst          | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index a5f55c567..e292399f4 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -39,7 +39,7 @@ Transitioning to a custom environment for systems development
    that you've downloaded. Be aware that some BSPs may not be immediately
    supported on the very latest release, but they will be eventually.
 
-   You might want to start with the build specification that Poky provides
+   You might want to start with the build specification that :term:`Poky` provides
    (which is reference embedded distribution) and then add your newly chosen
    layers to that. Here is the information :ref:`about adding layers
    <dev-manual/layers:Understanding and Creating Layers>`.
@@ -48,16 +48,14 @@ Transitioning to a custom environment for systems development
    configuration**.
    For instance, you've chosen a machine type and added in the corresponding BSP
    layer. You'll then need to change the value of the :term:`MACHINE` variable in your
-   configuration file (build/local.conf) to point to that same machine
-   type. There could be other layer-specific settings you need to change as
-   well. Each layer has a ``README`` document that you can look at for this type of
-   usage information.
+   configuration (using the :ref:`ref-fragments-builtin-core-machine`
+   fragment) to point to that same machine type. There could be other
+   layer-specific settings you need to change as well. Each layer has a
+   ``README`` document that you can look at for this type of usage information.
 
 #. **Add a new layer for any custom recipes and metadata you create**.
-   Use the ``bitbake-layers create-layer`` tool for Yocto Project 2.4+
-   releases. If you are using a Yocto Project release earlier than 2.4, use the
-   ``yocto-layer create`` tool. The ``bitbake-layers`` tool also provides a number
-   of other useful layer-related commands. See
+   Use the ``bitbake-layers create-layer`` command. The ``bitbake-layers`` tool
+   also provides a number of other useful layer-related commands. See
    :ref:`dev-manual/layers:creating a general layer using the
    \`\`bitbake-layers\`\` script` section.
 
@@ -99,7 +97,7 @@ Transitioning to a custom environment for systems development
 
    Distribution settings define the packaging back-end (e.g. rpm or other) as
    well as the package feed and possibly the update solution. You would create
-   your own distribution in a new layer inheriting from Poky but overriding what
+   your own distribution in a new layer inheriting from :term:`Poky` but overriding what
    needs to change for your distribution. If you find yourself adding a lot of
    configuration to your local.conf file aside from paths and other typical
    local settings, it's time to :ref:`consider creating your own distribution

-- 
2.52.0


