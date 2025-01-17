Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13377C0218A
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:09:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.7552.1737108551563066567
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 02:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=or3aNm9K;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D98640007;
	Fri, 17 Jan 2025 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737108550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q3GgGyGNSfhrP6nweMwZfA7+pArFoTXi/31rtsJROk=;
	b=or3aNm9KpWHeZLQNBYTH76ehyii2m+CB25cFGppv5yZgtIWfDdMrICwUmaJhP2RwBoseKq
	qnWJjo3Q7UiaKuUoC0DEsdSFhCRSyJSaoSQblGjhlDMs+yr4VqOgw2uwKtSiyV0OJPPZbN
	wJu9TSNFeYwEvoS7HEBWvMTM3bbXH9G/32O/qQkcNcVAx+SHYJZ7uELYgJMdCXR4sMc/qK
	o1IYqzQ+tFPHZ/PZsptbMQPAl96/ioT8qrNXgfEc0jyWkdQxTogtRt9XxhOjv9j//QvEzy
	ezuYI+wCisd/jVAdBJU4D4CGeAs2Eej1/nnz9RxHVEkRdqpbybHOpcOOIHEMSg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 17 Jan 2025 11:08:50 +0100
Subject: [yocto-docs][PATCH v2 2/2] test-manual/reproducible-builds: fix
 reproducible links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-update-autobuilder-link-v2-2-3ca2d22ab24a@bootlin.com>
References: <20250117-update-autobuilder-link-v2-0-3ca2d22ab24a@bootlin.com>
In-Reply-To: <20250117-update-autobuilder-link-v2-0-3ca2d22ab24a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rJFDw3jmeNMMfqSrRTTht8rqdmiJSdXM8RgYPonm8jc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBniixFkwekZe0aeZZCoP4Twl09EqJOUkhtiMMGH
 Ph9KCTkKm2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ4osRQAKCRDRgEFAKaOo
 NkwrD/97x0lgqHaBsdojBcesKqBZ/XOCsjdW/fPn9pfJtGiEUWDU7XHtYxau8/QsY8bXarIAnnF
 IYScR5y9gB3hUUtzyHC2Yxw91M3mPHgt+JrmLIfPmHrTYDDcDNbmw1d/OSHnkZAhy7qcTwrLCmO
 B60ilfTKzJsnY7TXI7TDPyuxmoVDpBfyH6+xpzWvVbEDy2yhC1t8alh6gqGFmm+abu9/BwkjKX+
 8Dfbz9syl3FsDie2PzgI3eobJG1hWhDyS4DLvJ69YS6eTlx8SXysIsRBiaYfHrDO414cl1qKgjc
 1NoM/cTRJhYX3epCooaPU1tgy1mW62rv65OtkTvxE1Dd8+6bH5qJvwMMe8m9ob9jU12iMHpYjG1
 Jep+rlAW3r7ZE8sNDMQcvA/ugPZ0GptkSy1/WHA8cpkcqIxP9/Ak4lTdRn2FFyOfMHlDB8UN4J2
 wQMLCap6i4YH1k1WzUYLWe5kA7wJdk9knsyTquG18YURAudsHP07Xt2lb2ijydkLUIMU1VRjvbk
 UOjbx0dCjtDNkfhZpnHliCsy7K3sBZWSoowPlp27gyaZENBfsXEYC3MgfMDFIDM/mawJQWzAJhL
 LYEP3Xp00AyMYQsx7dTzyfBIFJjO7i5+olt0JJRfXxEb8/GRQI1pYRajVadi/ILAD6MwaDJyJjO
 fRUZu1DRg3D+73w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 10:09:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6124

We don't run reproducible-builds on specific distros anymore, but on a
distro at random depending on what is available on the Autobuilder. Fix
the link to this builder and remove distro specific ones.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/reproducible-builds.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 7769a85d515d3fd4b06ad2ef76239aa774eb8af3..aaf2e4541ee69e6f76cc75cbe1512a1b899f001e 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -119,12 +119,8 @@ https://autobuilder.yocto.io/pub/repro-fail/ in the form ``oe-reproducible +
 The project's current reproducibility status can be seen at
 :yocto_home:`/reproducible-build-results/`
 
-You can also check the reproducibility status on supported host distributions:
-
--  CentOS: :yocto_ab:`/valkyrie/#/builders/reproducible-centos`
--  Debian: :yocto_ab:`/valkyrie/#/builders/reproducible-debian`
--  Fedora: :yocto_ab:`/valkyrie/#/builders/reproducible-fedora`
--  Ubuntu: :yocto_ab:`/valkyrie/#/builders/reproducible-ubuntu`
+You can also check the reproducibility status on the Autobuilder:
+:yocto_ab:`/valkyrie/#/builders/reproducible`.
 
 ===============================
 Can I test my layer or recipes?

-- 
2.47.0


