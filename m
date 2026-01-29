Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756EDD6102C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17095.1769700254498619168
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MZ94tDAe;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0012E1A2B0D
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C56FF606FD;
	Thu, 29 Jan 2026 15:24:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A7F4119A868D;
	Thu, 29 Jan 2026 16:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H+nLSLEZ2vBAjEQ1gjOvryk+9enXap0cDufOE5mnwyo=;
	b=MZ94tDAewK7X08gP8UBJKBiIqNzqt3LL1q98XysklX6zgGDpUqEyp3nf5BcPUlXdZYT2G0
	FZ1W/TUgiO2tO8UQux4BQNoGTvYTWePFI/AaaHKE1O2jpeAl6XlehC3oi8b+vA3+diE9cE
	yYHrMFmSzxy5HbweUJsZPhxNVdSvNQh7x3XArOWuJC9aaCempyc8KVj4HsQI1k5TaUMz4B
	Des5tVSobB1FiDmVrqSRIoAljjB2n43GX1wbeGwp0RST4AsqLDKewTS6P4QtX7oJCjuCCi
	3iqHJHF24+jSVtGpBe/Paojx66vaHxevanoIejl/y38MvCVre3QW+hRASBPXHA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:04 +0100
Subject: [PATCH v3 13/57] dev-manual/libraries.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-13-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JPaNl44+NYCzXwISX+B8zxF55Je4/P+9L5sCi/2m/Z8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uLcho6fujNI8WM2iqvmUXmSaRY7BTPHhSqX
 m23xy88x2qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iwAKCRDRgEFAKaOo
 Ni8wD/9hhpzlRqmlnn2YndwYhq7IVfCo5GxWqteleFIDqixLdTBXXURM2rAvhegW2C7sFMSt+37
 df6I9vfsA7uyhPVkEYomTvvkjmOtcCe3Ux+MBC486us1R9yzeWjcI9JcMcKnMzb3r1bgC6/zPgZ
 aMreUVHGtqgycRDRdxaGujvYEmmFFaFhF2dTNst6LoCmPQU7NdsivibxzeOx5CdlFpkFOzat/ND
 a7pFkWenibdVhQNmZS4uSsGCcmM83qFsbd7DHm/55JuYseVNoycJWvVPalvP7H/0LKm15Ya8tDY
 7Tnz45pBWQSIHoi2uM5YfHGhUQRMjq+VzZ2b5c7jmTjmuW6hE9/zs521uR+m6U1hpYN7iuCEztP
 63VIScye4Qp/z7nM4lhp/yOsOzcX6CeuHEuSusPrRDXzJ2PnnuPf9wKx4C0Bn4gUVaA7GKmkjMS
 q+oayuqJVt8R6Y8EA6FJFwuHXpODEyz8sPKnjI1ETDRUmx0uWfMk11SImDqzsrt+Hw3M70C+ll+
 ru1uJ+aAHKgdBl2L9VvStLpcyD1xeoHJ0P6KNO5Dg/tjCanKfSzm++MDn4YX0ObQgOZs/0OK9i3
 +x/pjYRMzbMMC862Lqr72x6OHum4bcQUx6BNe8Kx7mM9XkIrMcISXNeQfqFtvwFP4hKvV5TMwci
 G3e3dyzzHsh3vOQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8799

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/libraries.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index a8c38128e..697ea48e4 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -68,8 +68,8 @@ libraries and other binaries to use a different set of libraries. The
 libraries could differ in architecture, compiler options, or other
 optimizations.
 
-There are several examples in the ``meta-skeleton`` layer found in the
-:term:`Source Directory`:
+There are several examples in the ``meta-skeleton`` layer found in
+:term:`OpenEmbedded-Core (OE-Core)`:
 
 -  :oe_git:`conf/multilib-example.conf </openembedded-core/tree/meta-skeleton/conf/multilib-example.conf>`
    configuration file.
@@ -90,8 +90,8 @@ meet your needs.
 In order to enable Multilib, you first need to ensure your recipe is
 extended to support multiple libraries. Many standard recipes are
 already extended and support multiple libraries. You can check in the
-``meta/conf/multilib.conf`` configuration file in the
-:term:`Source Directory` to see how this is
+``meta/conf/multilib.conf`` configuration file in
+:term:`OpenEmbedded-Core (OE-Core)` to see how this is
 done using the
 :term:`BBCLASSEXTEND` variable.
 Eventually, all recipes will be covered and this list will not be

-- 
2.52.0


