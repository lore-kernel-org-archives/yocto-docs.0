Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EFAD2ED18
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:17:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8796.1768922234713096144
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ah2RaV++;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E7ED9C214F5
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:16:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14C2C606AB
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 541A610B6B52D;
	Tue, 20 Jan 2026 16:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768922232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d+eEuacwsq4PxGxOTGPnBbGtE/rfSDLAOSXACwk4CMA=;
	b=ah2RaV++YS2BW6QwarJ79aX+l8/bSjpmKSGY4LRADbnJNhfDpA5jlEuT3kZn6bFJfM91Q+
	XTRU/X8CkLJtyVWcMLvp02S+7Iq5RppWaxcR5NC9pDQWTXka3kIfOpOk3cxkh3Id3siLnb
	BCih1J0aD8CSB0pAqaVfN4FojyIzmHwYjzFi44P36zAxt/2QT6t27hvsomzANYfklrDVhK
	bF5VlnlmO1dd9T3kB8vbHFTGvybhvQ8EfsZjQ+vZ3u1gBNP04Qwe9zUohhewameMnO1bQP
	qXxHm1uP2dUGFjv0KjqSPlDp7B0UZT+jPYWHvRZNk9dTmXFdP0F1wIzMa/a0VA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 20 Jan 2026 16:17:03 +0100
Subject: [PATCH v2 4/5] dev-manual/poky-manual-setup.rst: mention the
 Source Directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-terms-refresh-v2-4-fa49d15b209f@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
In-Reply-To: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iBv+earSHPKCn36BOyId4np6IEWEJXCvhJGP/+G4PoE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpb5x0jBXMmsL6rH6nYvZtzv3hTr3bNuHLHIc6r
 OGET/XXxyWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaW+cdAAKCRDRgEFAKaOo
 NtYUD/4gHSl03vk4t5l6XPJJKHODncBpSlUzTIsP1V6EatO8EUwpJvilsiDe93tTMIFm1RJY7Em
 DFIeVJxIFp7VDRpSgM8o+MwR9ywzPeyh4Yek3nUoglX8e1WpnkCpF6Nt6OeMG707pH5O8qIGM+B
 ETfudgzJtwedZTzYiKM4e6e/wbWoWgRGBTfiZGnQbAqyvOYCf5VxiNSd0l1KcCi8WrEPAbiqXPo
 uLIWBgsvr6yPSS+zlQ5CT0uUvmm2aDgtM83RECfMNkTCCeSJOAAzdjvJ7HhmcREQcciJ+1mehUZ
 roaXkixHTcIO77kiRRioMZ8zMcGj7B+D3h8nKKGcfOUNuqpS+eIDwhYUyMROrqkOft0LcOF/BMQ
 LE58/tPqj8tXDGV7otY1G1VhqhmyHWZSg9AcfgvwqxMmtU+cEslCWcbc4KNRsJRtduOWXM2MaWR
 GN6horgXTi6pdT4lxH4wpXbuii/8QxiTc0WxtXV1FBUhyY56KLVeq68SnRFceWDjupzYIpKyMDE
 D3/cvN3Vv28sUn0FVyTxjS3aJkBuVJjxuh6WnPcxkmtvxXQ1VLzPuFOTs32PXRhlJoPqvx1icIP
 psUx/U64e6xhdHqBR836ujYJYHuLeIPStH4Vx2j5hJ1E9sIx0d8kTWdU0LwLcT/7Stz1/+z+xgz
 bFZQM78IcfMCBVA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8597

After switching to the new definition of "Source Directory", i.e. the
base directory for your project (which used to be poky), mention it in
this document on manually setting up the layers for a project. As stated
in terms.rst, use "project" for the directory name.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/poky-manual-setup.rst | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index bcda9d7e7..9e18dab8e 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -22,7 +22,16 @@ release or a Long Term Support release.
 
 Once you complete the setup instructions for your machine (see the
 :doc:`/ref-manual/system-requirements` section of the Yocto Project Reference
-Manual), you need to get a copy of the different :term:`layers <Layer>` needed
+Manual), create a :term:`Source Directory`: the base directory for your project.
+Throughout the documentation, we will use ``project`` as the name of the
+:term:`Source Directory`. Here's how to create it:
+
+.. code-block:: console
+
+   $ mkdir project
+   $ cd project
+
+You need to get a copy of the different :term:`layers <Layer>` needed
 to setup the :term:`Poky` reference distribution on your build host. Use the
 following commands:
 

-- 
2.52.0


