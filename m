Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8957CFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18696.1764344120220357373
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WvDootaU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B87A41A1DEC
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 908A560706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0362D10B02061;
	Fri, 28 Nov 2025 16:35:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O5kNvjfBDO7/oHU6pm/02Egqxw/0bjukl2ukT4ns5IA=;
	b=WvDootaUcOI7rXL8vUiHNXAW1SxJ2g7Ie5DTAfqVot3tdUJQWH/111cNgePzvTM83RhB4m
	ltLGGitVUDal1WUEMl32Zz6DsRiNgNzvQdSsTjnCtB+mht0DJUQXSLQFF70fkK5TZMoz4j
	fHJw96GBxMocCUDfVw0YE2lD66EJ94HmAguyWdsoUzHpZg6UE2fuClH9PACT+0kM+gTkzq
	3YdUIy6goDmTedJ2u6eLbJ3UeHujMWcrrBVJ3ltkMRb+NJ6ipDH/c2EcxMIzLWRIgU4jby
	VHCaXWv5MdSyfxqN+dtT+5zrRPO/lcMHcFNUMlUKkpYslMqsG/v5H19lMsekaw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Nov 2025 16:35:04 +0100
Subject: [PATCH 7/9] migration-guides/release-notes-5.3.rst: add license
 updates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-release-note-5-3-updates-v1-7-6ef679198e80@bootlin.com>
References: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
In-Reply-To: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2366;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ySebVtz8P2dBb20qhw++D3pby863nI/fbspULk544ns=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEu1A02WViubvezNM7asbN8JOYbsl4e5bY7C
 292AEwk0mmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLgAKCRDRgEFAKaOo
 Nr7YD/wK4YoXAzHfQVHFWaV05wYKiWgXlTP1F9HTVPJXQrZlfQYcMf0iLcacfUyNUxJ0ursF+V4
 Q65Jl6B1WsFz1oacVCkfMWlDci4CytSKZYxSpje00FKclHqpRgX88aTWqCX44/p8vZ/LOVSjfIa
 KPPkusFGB/gl4Ux98qteMbIQpbJPO4jqcd6LyWGV194BTkKr7Z3UVQed5Hva8FvSjHB0sKyC+h9
 yz3CoRYOG4k88aIWUs4Fk23M9b9aaPbUbzGUZy0AvYfToMsUl85mTglnNhrbc9Exxc5w52uMNfZ
 2eLpGJCwnEgg6iKsgDF142DXsNOLzc+2igBuspBccb6UWDdM43nhFgxqbQrZk2OOqTbTCjAB4gh
 6Wnh0hWdIFeyPQ4a6w22/jKh+1LPEmwX+ZFBQzwqGX2Y1SA+SmvXwsDRCwQj5cBSJg8um1MAxHH
 r+PFpnfFNBWVN3Mn48YlGRDXt+OWObxVnqv6r+2YAjp/jnWibOwVzpoMsqLdQIUSxI6um0C0PFn
 5YWWdO93BQT83YBROQMOB1B4xtL1Bm+0YPDy1hcEeZ63kKSFWVmNpNVXAw2WP1aD8iKjjNOcPgI
 INzIhsg4Mbau+ibGktQSJ/5QEgKBFClw4F0SFR/FFpmhe8/82jrqGeBzIJlEgAzEr77wSIu067l
 X8NKzhncYzlR96Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8170

Update license changes section by going through commits with
the License-Update: mentioned in the body.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.3.rst         | 31 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index f36104770..ef1a0b4fb 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -965,6 +965,10 @@ Known Issues in |yocto-ver|
 Recipe License changes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+..
+   Going through commits on OE-Core filtered by License-Update:
+   git log -U0 --patch --grep "License-Update:" yocto-5.2..origin/master
+
 The following changes have been made to the :term:`LICENSE` values set by recipes:
 
 .. list-table::
@@ -974,9 +978,30 @@ The following changes have been made to the :term:`LICENSE` values set by recipe
    * - Recipe
      - Previous value
      - New value
-   * - ``recipe name``
-     - Previous value
-     - New value
+   * - ``flac``
+     - ``GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause``
+     - ``GFDL-1.3 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause``
+   * - ``rust``
+     - ``(MIT | Apache-2.0) & Unicode-TOU``
+     - ``(MIT | Apache-2.0) & Unicode-3.0``
+   * - ``vulkan-validation-layers``
+     - ``Apache-2.0 & MIT``
+     - ``Apache-2.0 & MIT & BSL-1.0``
+   * - ``util-linux``
+     - ``GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & B SD-3-Clause & BSD-4-Clause-UC & MIT``
+     - ``GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & B SD-3-Clause & BSD-4-Clause-UC & MIT & EUPL-1.2``
+   * - ``python3-docutils``
+     - ``CC0-1.0 & ZPL-2.1 & BSD-2-Clause & GPL-3.0-only``
+     - ``CC0-1.0 & BSD-2-Clause & GPL-3.0-only``
+   * - ``tiff``
+     - ``libtiff``
+     - ``libtiff & BSD-4.3TAHOE``
+   * - ``gawk``
+     - ``GPL-3.0-only``
+     - ``GPL-3.0-or-later & AGPL-3.0-or-later``
+   * - ``go-helloworld``
+     - ``MIT``
+     - ``BSD-3-Clause``
 
 Security Fixes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
2.51.0


