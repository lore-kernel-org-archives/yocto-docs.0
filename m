Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EF1E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77902.1734427637122843678
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Dypjvsvv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FCB91C0018;
	Tue, 17 Dec 2024 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aWm4UpAh3qP8akh7aLUHfrD1MvIVUjAk/sbV4/YHs8=;
	b=DypjvsvvR7v6SpIWzZc53NmL0R8Lxej3ZGbfcx+hcYzbqWH+QvzEKA35gDfPT1Cjr2IIqY
	EuFvGXSIveNJuV4YQl3mbepYAdYBAf1s+rxYDhog1FNiHmA7028H+1Lf6OnmBBXkhHLz5j
	bzWomQqxAulMmC16g99h9LVarH4RGN25D0uD6d437eN1b261s8Z8XKxeUuva3p/TDR6lQ9
	8YuX9NnT8iSlPtv6XPRXHfAWilOFVsQzt2NTph9oJ7fY87q6S2VPD8v1fEqTeqol5JbCYk
	r0HjZuJzvxO2RsyhqKsIvPff4gvLpsv0AmfxJPOGyfsvbiOsV19ZNDuWJoheAQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:09 +0100
Subject: [yocto-docs PATCH 10/14] ref-manual/variables: document the
 CHECKLAYER_REQUIRED_TESTS variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-10-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lV6Qs6u2X1eWcL2W7rCwRH/jYYJullbVE/DRjCpC7+U=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPwSHpjrd2EV7tkAmozO/tEi2NC3J8TOq59f
 ELgobFac5OJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8AAKCRDRgEFAKaOo
 Ng9JEACDPwNRe8kcYMSk+i5WMyemAXq4PLDwXSoXFjmQDe16RGC8eNQw5Ay3n6QIkXGtMdxSgg0
 5vpdcXtELRRjC1JNUfCjfXs54DeP8jvogMkZcoARshHjr8A5OaOBxv/PYg57h9JK3EJxk0Vsvgy
 I9oqGeJSvWCx5Tfqqv9TBMP1XufQoVl5WfaO5PA113SXgoKOArLSSldzPJ4fGE64c4o5hqqjRwz
 vtOlrQbLBxJ9lQoGvJ8tFaUBarEJhVY6chCu5GQEEIdj3Ywgzu9vSxyT7XFGlD7oekbemGFjMc1
 WE6KAX3Jkn78Ggvwo+XQi80wW+1vrAadhPXyerIkvcvWfo0YcofFv3CnC8FHJ0b7PtxzlXNcRo6
 5XYTRhUA1OtCUx+47iQwP8SCKzlYPlo7MEdv/FyMCGfPrXAZc219eP8q645EXggKho5PwlAb0Yx
 p6b55VaF07QmB5rcil/llsqTJL7UbEujW89q7VPYm3JRrhtz47uSeMeQv8NThi7iKBsvhBxPpCI
 1ToCPhJoABF6WwlwxFomXo/NsZNde0DclXphtJLm1Nnf/LoGBDU6EbuhCZCgzVpVbgHh+cvLYoI
 eM2kXBSSV+bbfAVIACAo033GVCNPwVYXCkcIAKkGAa32cWmUR912qAhc+n59dJ7aEPTP6NrhLrg
 vMmy/xiMAtGe4Wg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5943

This was introduced in oecore by commit
ce2e42ace2d15fb6745437cf0a7f07d28398ca12 ("insane: Split ERROR_QA into
CHECKLAYER_REQUIRED_TESTS").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d54e1365fcf3dabd3868aa80089afda727b1415a..66ecece8b2658b304e17c9c4a1492e42a8a313d4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1251,6 +1251,13 @@ system and gives an overview of their function and contents.
       -  :term:`BUILDSDK_CFLAGS` when building for
          an SDK (i.e. ``nativesdk-``)
 
+   :term:`CHECKLAYER_REQUIRED_TESTS`
+      The :term:`CHECKLAYER_REQUIRED_TESTS` variable lists the QA tests that are
+      required to be enabled to pass the Yocto Project Compatible status for a
+      layer. For more information on the Yocto Project Compatible status, see
+      the :ref:`dev-manual/layers:Making Sure Your Layer is Compatible With
+      Yocto Project` section of the Yocto Project Development Manual.
+
    :term:`CLASSOVERRIDE`
       An internal variable specifying the special class override that
       should currently apply (e.g. "class-target", "class-native", and so

-- 
2.47.1


