Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABA0C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 11:40:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.8293.1751370028652020211
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 04:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QkA1gmCu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C292F43B12;
	Tue,  1 Jul 2025 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751370025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vX2+HMVclGXPHWJYB2KySENIdGEjyhKm6adH7nKyCuo=;
	b=QkA1gmCuKhjlJ0y7hmEH7vRyvEEeiDjxLnR/vVi0oTae46vRRgnihjO0r6uBHuUMtvrtUU
	qX0oRhHc2FiuHpeqV1Ykulx/pYP5X9SHnN1M2Gt9aWGMZQXjAs3+kVGQhyDeCGvsJb+iJm
	5c5zVbnEe8zfpxYdB1qv6TqseH59P9d0ypaq/20XDuNDq3vrbdq/gB3XfKvNhAY0LIeQlI
	tMAu9MYnnkwN4sXkX/s6klUMDGA2/wXz87C0qWjzm6HZ91U4usQgm6s7faWtvN95FsAJJx
	C2bz3cmJHtlJS3qegsgIf/DMRrWKf/1uxk3IYUwY8I+/DXKQ+kN4/Xoj/7fG5w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 01 Jul 2025 13:40:21 +0200
Subject: [PATCH v2 2/2] ref-manual/variables.rst: make reference to new
 limiting-resources doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-resource-limiting-v2-2-827077c4420d@bootlin.com>
References: <20250701-resource-limiting-v2-0-827077c4420d@bootlin.com>
In-Reply-To: <20250701-resource-limiting-v2-0-827077c4420d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3798;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=o9myckC7uEHwFC8SKVjTc6bb50REcbkiCSNNqdY1YqU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoY8koz50mhLhAgbZ94E0AqQYPwfQrKz4nkc+Xz
 e2lW4PBbPWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaGPJKAAKCRDRgEFAKaOo
 No8ZEACjYRBYY3LKaiF7Vakoz2BGkeDfuDs1K5MWVERe+f37tPWSWX3V846+Wcvb6d1TXRrCS/G
 QnjSFxa14CjhTqwKxAJjImjxDBX1aVjw/dgeMZKfyzSezMRJHsQ7XGpXYopoqPilRcVshcvvyIK
 7roOKLOw4isbE/AxgIya8EB2C3l4kz09nsh2u6fZUj0I2DMKiFO/iJzRYYeFEe1DGQ+zZAxd98k
 aiqrpiT0nW2z6deE1NOVUbzmD8UMbxBwG3ZE06DekxQAHGaaMLGBa9oVLGLKjUIHbiJbhQTdh4c
 8GrIcFsbeH0uLv8nZf9IkcfMQdPp/ln9NNpULdmr4Loo0u1sv6NgzUDClVOcwYuT6Obpj+LnnY0
 tRkP+Egzy3JSDovwLSSE1mjbkfvxB8J6yhdl9dhiUZf+KuNTNMMy/i1vfbZfzSGAfnbH5QxCK1h
 uNKsNpZ7ATGUEmYAyMEyshSiq+Pq12OxR4ldaP//v/UOfAI4Sb2lEEf3RiVbJthdHcBnHd5ao0C
 qSp0rmCVscLwKd8I93FPFrbh9Icvcctl72oK/HU+jjX+nESJHT6S7tnsEJ1gNkYV+Bu07WdeLK9
 G3xo/w9Uxg4cbN34DhSunRSwJsbLOTo+rDM5kKseKzvFLWv9nN/cqqhwA597A3HPikF0jcvsBKY
 PsNpeX6WCW/wSoA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 11:40:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7255

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


