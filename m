Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA18CCAC5BB
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:54:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.12287.1758873284061892745
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 00:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U56MYD9o;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C46C31A0FD4
	for <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:54:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90B4C606B5;
	Fri, 26 Sep 2025 07:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85911102F186D;
	Fri, 26 Sep 2025 09:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758873281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G4MCfUZh7silxSNgpgvulx/PQEkuWr3tXTE12p7SqS4=;
	b=U56MYD9oM8EHs6QE1IEsMri1mu1f3XHDc29gfalCxzVdgh5uMaIQkbyWBCDgE/zG8csTjH
	gIJ5gpFOhEhb6tzaGwYVBmO9/qc8yoiiF3mpt0fXGhb3vT5+FY4WfAcMAxe9NRWLb7g8ul
	hwBjqkr3xe/iBCRZ3FXFWkgMz120TaT/GNWtr4vUFtasMjAOhVFzpOfvwfiIUeeUH72f69
	sx0JkGFungudIsGgd8I2SMVuu3AAeWgonY8YVQg1KhMImKzzP+PntgQhP8QV55w3K7ikYt
	N6ch3dyPiuRZNwjTK/kCf/MHRgQGbSFBHvHbX0P3H6wdjAT2EGCHCr7YdaU1zg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 26 Sep 2025 09:54:23 +0200
Subject: [PATCH v3 1/3] dev-manual/layers.rst: yocto-check-layer: mention
 --machines and --dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-update-compatible-doc-v3-1-3740c44e49b2@bootlin.com>
References: <20250926-update-compatible-doc-v3-0-3740c44e49b2@bootlin.com>
In-Reply-To: <20250926-update-compatible-doc-v3-0-3740c44e49b2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Vr54e87Eu+nHtqkPiLBamc6JP+LmQMwdjDM8OTPF9Xg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo1ka7LNcwCT53lQxP+0YNukvak7efTplecyRP5
 fjwYTgAe1WJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaNZGuwAKCRDRgEFAKaOo
 NtmKD/4kREBgQc4IQEUhnk8DZK1O+f+iIkG9/+9AcSs/5sYljMFpaO/7FO21fxdPgnHzGQXIrmx
 a46cS4obG1WAr9UHOFCMvDlvtitqnr8jaDNLhwl3ASP5/RXDHWvZ7anCD8KZRhCQlwXhdWA+qRd
 p5UWhBvGAR9SvY5B4+PYIJ4qFWYT1S0BT+ZiERdKvmj6DwI6vRypeNvpRRm5CWw2V9fGCj2+tqK
 ydQ03y8YwOi5lrM3kPhL1D8HhSQ6xbRfPwEApmiLQUlscUCF0QDbwt6Ekxy+wjU07eH8BStVhV6
 hmPoTj8Z9t+5K9pWjsvE8wnMzcDPK/4OI3Bx2Ofqmkud9yRShjGKF9L/xETB4DJ+b+djXOn+ggV
 VkIT0J7Z/XzDr37hBsYEiEaW1ZQwYugTeZVTlGN3HEruEs0MLpGqlGOsskB8ZOitKcHt6nSouFD
 fqDQcyfqNF3GW8NKlimZ2zaNBAO/On1AZe2PtQKzkCPpkVTwdUKyAMI4LBuznOGpBRM+x7XAWV0
 h3lL2LIFOvmYSL20lEesaMNluDjnboqbwlOVkicB+PCi04JqSAqvrBs29lZmB7WvbkPLGsKKuNe
 oK8ofrIY26cNOMqETGtvDHutto7fqU9OWxqfQiNrsdif9ugE1nXJU1uMiuzr1oHzqHNuoq4BheP
 VnNT/X4/bTnjIcQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7607

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
index fbf3f1a33..4224a02b2 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -376,6 +376,21 @@ directory::
 Be sure to provide the actual directory for your
 layer as part of the command.
 
+You should pass the dependencies of your layer using the ``--dependency``
+argument::
+
+   $ source oe-init-build-env
+   $ yocto-check-layer --dependency <layer1_directory> <layer2_directory> ... -- your_layer_directory
+
+For :term:`BSP <Board Support Package (BSP)>` layers, the ``--machines``
+argument should be passed as part of the command::
+
+   $ source oe-init-build-env
+   $ yocto-check-layer --machines <machine1> <machine2> ... -- your_layer_directory
+
+These machines are the ones present in your BSP layer, in the ``conf/machine/``
+directory.
+
 Entering the command causes the script to determine the type of layer
 and then to execute a set of specific tests against the layer. The
 following list overviews the test:

-- 
2.51.0


