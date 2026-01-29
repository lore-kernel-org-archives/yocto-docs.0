Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49525D61026
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17084.1769700246846626626
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oOuOj1ev;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 417204E42322;
	Thu, 29 Jan 2026 15:24:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 179B5606FD;
	Thu, 29 Jan 2026 15:24:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66EE8119A8853;
	Thu, 29 Jan 2026 16:24:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GwcAqsT3CCWattMGmOQVIEWGWB1ZE/tE+p7pfbtMkKY=;
	b=oOuOj1evZlmALeanv3dibv4DqHFRYgSq0/z6rlaDJuTpIJw/xy/MevCuzVUWLEmJ0mTZLT
	yhsqq5dJwx0pIMJlqwOll3Du9C+Tz/XZLUW672enbRx3ol4CONNg9nSDcpJ4d6RrM/lmW+
	Yn+bYDPCPnPHUvnxmX7JGqe74+9wsBHxpSsM38k0L5h8gUar0Ve1VuDG6DIglU+C5bFvR3
	k4rK2lrsllNk4miFR0web0pRpyoimsaxMrF8tFltb5m4Loy+8m5fXG7ka/Hvz3skL6bxcs
	B3napjGXqIFILcAv89wIMh0QG67mLmI87/8HRKHyKgjbyK+b0cPmUw6B6NSLgA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:22:53 +0100
Subject: [PATCH v3 02/57] dev-manual/poky-manual-setup.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-2-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2723;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3JeE1CqZb1jfR3PeVpUqB3svHxZO0jjsVs41yTlWxRM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uJSMzwjzjhZ0rr7zR9SzRjqW7/plt027BC9
 raBJPCjjoGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iQAKCRDRgEFAKaOo
 Nm63EAC89V3B+WP717HABRXqUQX9E7sv8/+ikQ3ngVawM8oYWPGjI3DasDFIRnF2Hyt0nE429Mo
 82K34tTds1SyfhdrlZl9DxVdFYiEJ+qyeJjUe0t6+p1T1+jAkPtzKXNBWZDyjfZ0z0E/Qg4HwU8
 nJC9gEynVPWg46M6HuEjmbxD2he3bKN3rWvNsTnaq8z1DOJ9GgkKe5GZOoybigthqRi/HLVR25x
 6uOp6WBYnbGvywGPzqIXY3lWcZ6BFOc/nPLz0lBbW5fXKFHMw3NWaRzv2BJ9wVwr7AHkCkTRBAs
 ym3D69LeSbO0VkHodzu4Q1RC59nxA/2ZXH7kBGeOHVYdcLAsZwFquB+S0MG2CzsqI3qVnRrzs9L
 3u8XFjnthJ7N/KUIvcAW6T0uL8xVpLYL1uZJmlmgOocFJ+rM6ceLGr7hg+9yfMGS1eBidi+51Li
 esUuSG3rH+iZXD2c8TsIKiuS0mYezPv1nU4vzUsanTEunzagYvLRAIopanwv/OiQ52u6HfVlg/I
 JDLu7ZcKFePkw7RHKO/ixE8K/KXxt+FlOIZ+VpfcXkUNN71DLsM/wBan5fCsUG6kJdxeTBj14vG
 w/t73o6w1G2LcexonxVOJzMptuwMxYDPMC9/b5xDLVhNH1q+E5JxpEredgeMoa7CjM8JMUM1+hx
 wFeuSdVanPaaqgw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8788

The commit "dev-manual/start.rst: simplify the document after poky
obsolescence" removed some of the information related to source archives
published on downloads.yoctoproject.org. Mention it in this document as
it makes sense to use those when manually setting up a Poky build.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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


