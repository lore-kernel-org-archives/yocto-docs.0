Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296A7CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:19:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.14922.1758284343215299779
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 05:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LSOmXWY3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE4F84E40D67
	for <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 12:19:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6CDC606A8;
	Fri, 19 Sep 2025 12:19:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 078C6102F1D63;
	Fri, 19 Sep 2025 14:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758284341; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/RYtgCy+j+S/DFpJ0dUP0DN9xBJcVc22RsU+uPo6kMQ=;
	b=LSOmXWY35Qy5svIuxSJQa5G4cGzvCBtPuMpWj87UqcISG1GD6mzE8PKkc7t7mcVWAcYcAl
	6pRo9jAwwq1qVHdhxdEORumbBr7St8yGjNFuSl8IgKxY6ydN2ftbJIm6aiIJtlbqzkhiws
	zTdELrsYmYthJitGCVGc+CSR0J4RwONxF2rnOShfYXeq869yKsDrbpTV8XPU27a96LB1vb
	wQ6O2GSGOlPdyh4jxjyFdiVtAgV2MsBl3nbsfpNIRP1W6VbXSBuJO6b21ypUpqXg96Jr3z
	xmaNQk1q3xyEq02schmwinGxWjmwxMEvdvPM+ANuI9Ea9t8MszI1veraGSjq6Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 19 Sep 2025 14:18:43 +0200
Subject: [PATCH v2 1/2] dev-manual/layers.rst: yocto-check-layer: mention
 --machines and --dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-update-compatible-doc-v2-1-c428da260487@bootlin.com>
References: <20250919-update-compatible-doc-v2-0-c428da260487@bootlin.com>
In-Reply-To: <20250919-update-compatible-doc-v2-0-c428da260487@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=m9ojDRSjTqtVps87cXjKBdNP+n71W3mzw4AS46V7Z3c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBozUox30BcuNawDb8DhWrMz+2uIDzaoLvb6YOT9
 NXw+VSysuWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaM1KMQAKCRDRgEFAKaOo
 NsbJEACrVKkYFg3j7h4mlpRRPl+CNUET+pdFbkAbFrHQrPlCcmiXywkHHUC2c8hmjzGGFOKZUzR
 TO/THBKJSlfeZYt5edcJv+DBk6tRVoXngQf41u6RQQESKjqCQypbLhni3KSRLS6oY17xV/RRdJt
 j29VIV+ZdsWSs8HEcz9WUmTyb/UAqxcyCMXtZZhB4caTYThtjWvUwL160BoND6vbI08rtP3lswA
 xNjvLdKs2hKZlBPrLjwV7obuE8Wl8LZev3P8YQ+rowHt0BdOB4zJiZc6iHxhTWF0wnBXooLeR5p
 DVOwmQcSwtqDs5zoYy47Mo4PGobsgCI9IMpibFvasStvWsKd6WkHNYVnq+kmxkslgQF+NqpnTQs
 CxPskHc9TG7Ey9rDwb3fI0WLSo0sPJfOEJS4Kz+4eaCZQ4FraeN9NMT30+4UEXX5xyCnK4rrHRy
 1dhMRDczuIiTz2Y3CxhIledZ4PHg36lZdvSKlX1Ws8mHtcG3o/1YgRKJBpI8WVnJVTJmvLNM2y+
 vPlqxVPm2sb+iv22uI743XkBa+t8DLvWKe+Crj6vPsTtkr+afaIUtLZ2bO1RNLlhI9b256a2XGp
 VXRHvUlyrWDacjPLMdwswMj272dCJI0ptWrNOhDLJJy2+0gdN0AokRvJZqUGEd2jVTmUo0SxYej
 a7SZt1cbSlLIJSg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 12:19:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7562

The yocto-check-layer script should be run with the --machines arguments
to test the different machines present in a BSP layer. Mention it in the
documentation. The --dependency can also be used so also mention that.

[YOCTO #15974]

Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index fbf3f1a33..bba46b1d6 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -376,6 +376,21 @@ directory::
 Be sure to provide the actual directory for your
 layer as part of the command.
 
+For :term:`BSP <Board Support Package (BSP)>` layers, the ``--machines``
+argument should be passed as part of the command::
+
+   $ source oe-init-build-env
+   $ yocto-check-layer --machines <machine1> <machine2> ... -- your_layer_directory
+
+These machines are the ones present in your BSP layer, in the ``conf/machine/``
+directory.
+
+You should also pass the dependencies of your layer using the ``--dependency``
+argument::
+
+   $ source oe-init-build-env
+   $ yocto-check-layer --dependency <layer1_directory> <layer2_directory> ... -- your_layer_directory
+
 Entering the command causes the script to determine the type of layer
 and then to execute a set of specific tests against the layer. The
 following list overviews the test:

-- 
2.51.0


