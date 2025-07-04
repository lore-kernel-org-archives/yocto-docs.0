Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0DEC83030
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 08:01:56 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.7636.1751616109063656036
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Jul 2025 01:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GRhE+NgI;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86977442C3;
	Fri,  4 Jul 2025 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751616106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vX2+HMVclGXPHWJYB2KySENIdGEjyhKm6adH7nKyCuo=;
	b=GRhE+NgIV2Uni1TiZ0cl0pA2crpS0vJ8vQDPbFQ3KeAsxvdHhEmsrjDepimyCvQQfKzVXX
	NdOVBjbo7GuPlRXJhEF0PsBa6M1HvjVFW4Zzbbjd+v7U4kiVrJljRf4taVP7pBfZUOy/cy
	X/mGQ/DsazaIBZDRC2Kc62EW6SX3ocJCj6qRfgrzoznfda5TgWyuUoKu/ePzJd5qrhUxyu
	45JeIgXPXCwTUkg9H8cR0mgwuESh3xnphKPKH1SY2yc/PFEB4bWAKpnTbZ4wrkmVLyeqa3
	2xFttxGjj+qfqLmlb1hagwaoPAMfB23MUJADh+4UG1eZb3/2HkZDzL/jCTCP9A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 04 Jul 2025 10:01:39 +0200
Subject: [PATCH v3 2/2] ref-manual/variables.rst: make reference to new
 limiting-resources doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-resource-limiting-v3-2-4feb5e673aa6@bootlin.com>
References: <20250704-resource-limiting-v3-0-4feb5e673aa6@bootlin.com>
In-Reply-To: <20250704-resource-limiting-v3-0-4feb5e673aa6@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3798;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=o9myckC7uEHwFC8SKVjTc6bb50REcbkiCSNNqdY1YqU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoZ4pp0lvjsdZfKPwH6fll4Rz1gJkZ3lru50lpa
 1GrGm1WuwiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaGeKaQAKCRDRgEFAKaOo
 Nq8DD/9ZoWFCgGVn2nCPwebaRJBdCYvmMf3BgCHGpnl/HdpQMbD2+doqOes5hNyl0pizN4E7M0v
 fJqGkiyEC2zQ5k2GLIV5ipV036xkklws8LykCavrT9kRHAZwidArd+4i/z3OIMjU7g9vMcASF1U
 D/vr+6fHfyZREdN1+ATqNcjpyfsPx13+PUGxJhUvqugpBfesWmDDWPbhEkcX9if3lHoaHsWqkBx
 dBeIF6TtexkwVw2N9gjrx/F0bE3ui5U10qZj+Q8kPUKS2Vub1mpEtqYVoCfG1XvvtLwTVBOFVSb
 VdA3A+Obqv8GHbikcq1UwQmNCvoRGnlHhRqrljlCMJRxEkfsHh8iutT1noAgFa9KpWsw825Qboc
 0IH7P+nKWdMsdbOkrbQyvl+eff2JBAysf58pHIh3RLhn8RNGBBlLDROEoDW48M32Wx7JMqgy9K9
 BDw22kiTCQ+Uc6pidPAr5EFemKSWIL1Oj8wjR/MUD0aaA+QPPwn6suJn9FIRLyrkUeGQ+vAMECr
 E9hMzcZcCqTvELlsCUzhxrcOru8Da2YozpuhOJnhVDQy73RrNW5e+7FZb0IHHlMsIwcdMpOrjOK
 8tmE3zLMncWuxp+iGd/PG/70RQYuDz6F7kKY5wgud2WAhGI2ROQUYBFCF3T/VrP1xnjEj5pYnIF
 AKWdNBgJdYj20ug==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjv
 ggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Jul 2025 08:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7263

For host resource limiting variables, make a reference to the new
"Limiting the Host Resources Usage" document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c56418e2a..d079e4b59 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -589,8 +589,12 @@ system and gives an overview of their function and contents.
       See :term:`bitbake:BB_INVALIDCONF` in the BitBake manual.
 
    :term:`BB_LOADFACTOR_MAX`
-      The system load threshold above which BitBake will stop runnig extra
-      tasks.
+      The system load threshold above which :term:`BitBake` will stop running
+      extra tasks.
+
+      For more information on how to limit the resources used during builds, see
+      the :doc:`/dev-manual/limiting-resources` section of the Yocto Project
+      Development Tasks Manual.
 
    :term:`BB_LOGCONFIG`
       See :term:`bitbake:BB_LOGCONFIG` in the BitBake manual.
@@ -649,11 +653,9 @@ system and gives an overview of their function and contents.
       An alternative to using :term:`BB_NUMBER_THREADS` to keep the usage
       of build system resources under control is to use the smarter
       :term:`BB_PRESSURE_MAX_CPU`, :term:`BB_PRESSURE_MAX_IO` or
-      :term:`BB_PRESSURE_MAX_MEMORY` controls. They will prevent BitBake
-      from starting new tasks as long as thresholds are exceeded. Anyway,
-      as with :term:`BB_NUMBER_THREADS`, such controls won't prevent the
-      tasks already being run from using all CPU threads on the system
-      if :term:`PARALLEL_MAKE` is not set to a low value.
+      :term:`BB_PRESSURE_MAX_MEMORY` controls. See the
+      :doc:`/dev-manual/limiting-resources` section of the Yocto Project
+      Development Tasks Manual.
 
    :term:`BB_ORIGENV`
       See :term:`bitbake:BB_ORIGENV` in the BitBake manual.
@@ -664,12 +666,24 @@ system and gives an overview of their function and contents.
    :term:`BB_PRESSURE_MAX_CPU`
       See :term:`bitbake:BB_PRESSURE_MAX_CPU` in the BitBake manual.
 
+      For more information on how to limit the resources used during builds, see
+      the :doc:`/dev-manual/limiting-resources` section of the Yocto Project
+      Development Tasks Manual.
+
    :term:`BB_PRESSURE_MAX_IO`
       See :term:`bitbake:BB_PRESSURE_MAX_IO` in the BitBake manual.
 
+      For more information on how to limit the resources used during builds, see
+      the :doc:`/dev-manual/limiting-resources` section of the Yocto Project
+      Development Tasks Manual.
+
    :term:`BB_PRESSURE_MAX_MEMORY`
       See :term:`bitbake:BB_PRESSURE_MAX_MEMORY` in the BitBake manual.
 
+      For more information on how to limit the resources used during builds, see
+      the :doc:`/dev-manual/limiting-resources` section of the Yocto Project
+      Development Tasks Manual.
+
    :term:`BB_RUNFMT`
       See :term:`bitbake:BB_RUNFMT` in the BitBake manual.
 
@@ -7006,6 +7020,10 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/speeding-up-build:speeding up a build`"
       section in the Yocto Project Development Tasks Manual.
 
+      For more information on how to limit the resources used during builds, see
+      the :doc:`/dev-manual/limiting-resources` section of the Yocto Project
+      Development Tasks Manual.
+
    :term:`PARALLEL_MAKEINST`
       Extra options passed to the build tool install command
       (``make install``, ``ninja install`` or more specific ones)

-- 
2.50.0


