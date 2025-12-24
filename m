Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460C0E776D8
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123193.1766593920756845286
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VT19K6Uv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 403681A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11B636073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D50710AB1375;
	Wed, 24 Dec 2025 17:31:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hShQj0ajX7yakaZ9a8Q8qmsSW6JV8k9jW/Aw3tsqYJ4=;
	b=VT19K6Uv4IZAD0YDtOcYBOghE0uYYghrufWreoXnSUmzBctRGU+cgwThLgLDOSgfK0AV9z
	Q89UXpoCLYd3Dsr8dT6Swlju1w/lPZ7lliGXI5yZoBjXo8MPES/ZeTz4aO/MjZVG19njGn
	xfpBFxV7otHPkWUPVKp3ubsin2GeOX3Mc50iRXklerV3etigUhvOm9zm8jXjc+NHfoMOrk
	ikAIMj0nL9iDW8mBf+id7+qRMjeYjJJfWCybp3xekxfOQobupdY7xPuDsndaoJ1ZcjDIwH
	ncAa9N/UPn0UCD+c8a2u5Y2nZbtNIcFyoDAd48eRloC02CiGlurcWM53JAvaIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:43 +0100
Subject: [PATCH 17/53] dev-manual/wayland.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-17-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=l5x8Azoxn1j61Nhg5mcFN7odGREhusIhwsltmvNoQ38=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVpA2RhbA31l62PbkyzpmL16srAueWI0aYCp
 Nn3cHVdCBuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaQAKCRDRgEFAKaOo
 NvBeD/wP/QtyuruUCRBGok+bS/sCyDxtEjyFIS4KgZMqWxKhBluFXM9QSc9G4WBwRaWrTSodoy0
 jpDQOvUoTgtvdhPdJF7gAdtURXhpE58hxOM72++xIXmzjOqHigu8Rs6DhParwqpiQqpW6640V+W
 mmPQIIBKf9vFoVfxNaIu+gZE+/EE3k7ec35njzki5GGs39nwyVlbtImYGD4EjA8fURypyXUE/lL
 Q+TFJ0Xne02+ECJiwcxj6a5HgQ5KN18dorUs3QEyi2t/hvYWImOdP4jeyiWKA8evdfDDAEcfbzJ
 jKt3Akiw+LPK3buTeJui0g8kIY/H2FnQwdyyDxv9ofGp9fBwrxyZmZqX4j///Rd3cmGXScmpu++
 mL6rxpxxktsiTtN4XeOE9baik48YvocUH/bEz0C6TydrbtNmO2BaOp0mRoPlM7k8dBju4VQSp+M
 HtBQBTyXc/9EcPZVe4eCBuKRfETupYg5j2il/Jove2dhSeQ91bacmqmWA7KaeYEMc/5dGymgzLq
 IZgeI/oW7i8KnWHBWjxkdU3FdD2dq6WG5rtAC12MO0yAMt1k6g02ZADX0Ap1nnNACZcnUpOPqms
 lySf2z9+pnQB5oe7KtZJXZvr+19GbbhOvBYrdjoLiqixPNgK0Fo82FdEJdFxntxVwY4TajBUty+
 ZplBJ4RNEY8zuDQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8346

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wayland.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
index 097be9cbde..18d1bfb0a6 100644
--- a/documentation/dev-manual/wayland.rst
+++ b/documentation/dev-manual/wayland.rst
@@ -14,7 +14,7 @@ might otherwise achieve.
 The Yocto Project provides the Wayland protocol libraries and the
 reference :wikipedia:`Weston <Wayland_(display_server_protocol)#Weston>`
 compositor as part of its release. You can find the integrated packages
-in the ``meta`` layer of the :term:`Source Directory`.
+in the ``meta`` layer of :term:`OpenEmbedded-Core (OE-Core)`.
 Specifically, you
 can find the recipes that build both Wayland and Weston at
 ``meta/recipes-graphics/wayland``.

-- 
2.51.0


