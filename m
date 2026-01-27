Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CD1D19512
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6042.1769501963520654289
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ShEpgtci;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F1F314E422CC
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8421606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23951119A867E;
	Tue, 27 Jan 2026 09:19:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lWREOdQ/SsgfmbXYG4okbZ3IWJjnvyRYMk23z4p/v4A=;
	b=ShEpgtciL0F6zLPka8g//yvVofeZScwEe1NitDHoFkhj6OcUjpvvscBLd2Yh4r21dIN7xw
	xNiapts2jQvDJdjSB1BgeJsRVxXTXkGyobkdrfJGtvotpFZQ3Cj+7TigCwTiL0dhA08v9j
	oActRtBYfw5RfYK1d4+wawCyWtdeyqm1YpzVv6HwY2w+7+vXoLbW5gAGztM0vo1IPV8/vK
	/cXbEVrW9/pAREEDg5+dBgQQ2013iCHahLcYxnjGxO0RnLLqJ7P2ZvPM3XGdEkl43jieC0
	zR4EgaESmnD3D6hYZnJCYMzXsUUSQNWSHs7Vyk7cYXzdZdSzmXmEVgNgfIzZHg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:18:57 +0100
Subject: [PATCH v2 02/56] dev-manual/poky-manual-setup.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-2-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2667;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7W2zZLNN3UAifWKQ2mPa4sgGKGz9nEtCgf+mCVKXzSI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHT+4K3FQBLaog8GylkYON292NwovqW8bmxTf
 5ldJ2st8p6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh0/gAKCRDRgEFAKaOo
 NmC2D/9w6ZQNUJARTV2rA73Zy6Nyy6GYvUD31GHGTWnuSRYUFXaM4ocWK81j3+XWl6ZRw12/Z2F
 NSlxUXfIRJlkat//m7u0EW2O1cGmDmUwSoqKLvx0nATDwf+PJ/i41jsKJJnOd82ShhpoMmWnel6
 rdzXeDFJQ33AYBjRH1wLPFFFCsQsuifyZIjKvlLYyy9XRVO/ZPMZAs+aG4txuAaWbiJXzJbQmtQ
 8b5lAeIRQUI7AqN9kVuvcmviJ860E/2/EmG2s6p4V0ETC3jqrW6m/9+d6inf4vsGX6rgcUh+foR
 HUEFWhGHiW9ddfi0vBbI0/CAtPkfONtx2dqZsoxxqut2v8B8OmtXnK9/3cko0FZiCAoKtU40uVo
 Rv5mb9/QgDTL1blTvxjm/4hKILSvU6kHivRJCL/SHbdowFw00v9mqIRZRXEZXaL4yCaue8R8fWG
 UUCW73YZGm0R+Axv3DwSrHWl7+rCGzIThwtZHBDALdl+2d4u6ZrUQLMP4By7FFIP/BkaNmJsPqd
 iaqOC/kGoKUXeB4n9ENniw2Y8XmYTGik4YbNU2PDvVYdqZOiTWuCuI1bU06czDGewC5KAoYtuXF
 ryrOtbFeTQNrmDwsC/ksZzOw1lU11I/4SImHetkh+Db0iPKqmwFuoUhoSj6wLPge8XSEBHN/MtR
 44SoQToscWKQHRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8663

The commit "dev-manual/start.rst: simplify the document after poky
obsolescence" removed some of the information related to source archives
published on downloads.yoctoproject.org. Mention it in this document as
it makes sense to use those when manually setting up a Poky build.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/poky-manual-setup.rst | 29 +++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index 4bc9b97b6..2b1c3f63d 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -13,8 +13,17 @@ document guides through this setup step-by-step.
    :doc:`/brief-yoctoprojectqs/index`, which shows how to setup :term:`Poky`
    with ``bitbake-setup``.
 
+Obtaining The Source Repositories
+=================================
+
+You can obtain the source repositories required to build the Poky reference
+distro in two ways described below: :ref:`cloning the repositories with Git
+<dev-manual/poky-manual-setup:Use Git to Clone The Layers>`, or
+:ref:`downloading the released archives <dev-manual/poky-manual-setup:Using the
+Source Archives>`.
+
 Use Git to Clone The Layers
-===========================
+---------------------------
 
 Go to the :yocto_home:`Releases </development/releases/>` page, and choose a release
 (such as ``&DISTRO_REL_LATEST_TAG;``), corresponding to either the latest stable
@@ -42,6 +51,24 @@ following commands:
    $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.openembedded.org/openembedded-core ./layers/openembedded-core
    $ git clone -b &DISTRO_REL_LATEST_TAG; https://git.yoctoproject.org/meta-yocto ./layers/meta-yocto
 
+
+Using the Source Archives
+-------------------------
+
+The Yocto Project also provides source archives of its releases, which
+are available at :yocto_dl:`/releases/yocto/`. Then, choose the subdirectory
+containing the release you wish to use, for example
+:yocto_dl:`&DISTRO_REL_LATEST_TAG; </releases/yocto/&DISTRO_REL_LATEST_TAG;/>`.
+
+You will find there source archives of :term:`OpenEmbedded-Core (OE-Core)`,
+:term:`BitBake`, and :yocto_git:`meta-yocto </meta-yocto>`.
+
+.. note::
+
+   The recommended method for accessing Yocto Project components is to :ref:`use
+   Git to clone the upstream repository <dev-manual/poky-manual-setup:Use Git to
+   Clone The Layers>` and work from within the locally cloned repositories.
+
 Building Your Image
 ===================
 

-- 
2.52.0


