Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98421C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 09:33:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.11463.1752053622938479852
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 02:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OqdT8kKy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A84243AE0;
	Wed,  9 Jul 2025 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752053621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vX2+HMVclGXPHWJYB2KySENIdGEjyhKm6adH7nKyCuo=;
	b=OqdT8kKy4T11evQCimbHoIS8c85HbLLEygEgzsA4MUMtaIrN/EG8TWeVbymDL9lPvKwaLd
	juDWYYFFgv0vPNAEvhPHsMVZL3pYw+NDZLJhuVpvzIrsTNzb7PqW/G9NMn6pYQO3b0jKPv
	uDISqYPuaDpgNY4zpMFAYmVT+XpVA25HY7tp3ZBWk3Vi85GQ3uyyvdKRlXve67+sOB6yH5
	TpWEDZ1xAWVmVkFi/V5WzvM8KjntV9m6Hr0bEXK8AqMwofBwXrwVFsDcaE5cWZ+7MiBMDc
	LQYrOFzi1LbWZwDlCp6tO33fAHVHFzWV7/AEMwc18CC+xThcWve6X/pJliR3nA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Jul 2025 11:33:32 +0200
Subject: [PATCH v4 2/2] ref-manual/variables.rst: make reference to new
 limiting-resources doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-resource-limiting-v4-2-c35cbc4c7d14@bootlin.com>
References: <20250709-resource-limiting-v4-0-c35cbc4c7d14@bootlin.com>
In-Reply-To: <20250709-resource-limiting-v4-0-c35cbc4c7d14@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3798;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=o9myckC7uEHwFC8SKVjTc6bb50REcbkiCSNNqdY1YqU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBobjd0a75b/HxsH1y0LA+aKNbn8/+DiAHVjQqpn
 m9PAnVZ+k+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaG43dAAKCRDRgEFAKaOo
 Nm57EADG0pxsDGVUjlwssbUZYog4ZzI5MtNhg+frf4xTwNuk7gVL9R/CmdilRHMAV1VIUaHnnwz
 MdM0YVveNfvDji+kXT5nMMHoFr2/XspWU6zBWPZXZUeaAzb4u5NdYOSvlDp7igD/9REr3MOsjnK
 t8RbSvyE7tksUQ6mKOc9khgqSlXh5KsrHtyJyJWZlPqWIxDzlJ7EqaI0SGtyzWEhZKUNJxa1k3D
 8MtidZ7CFR1+JKi/FvMMe3cRd5tcET7ROQo66DXYn+z3t9XtGvnC+TxgFHN05QAykgOebDtVBgo
 yyyL4DC6HCOnXIUseXGw5IzVIXQMBfliWYKxJgUp6xjMPlPhbEXYW4JnZbRiLafSLYXJiyO6qVN
 EMP4snnPC7Fg0BPwsWLRy9x5tSQL4AMVQdv5Ksri3XDUy1ehe/FG9kE5+xh50FJR2uGQvCh/Z+9
 R88jfyQG9Han/AnCF3bUvGnU3doIbtpO/sanmQ+P1SQns8XtP5OqdQ/WjRC+LrYp+q3pL4Z1TF5
 lMyB6EzPhihZyEgBIL24+uKOkBp42DSWsQb2DZ9kULaRZj6iKNG+tTAubpA7ch0ykWWOvJ9KbaD
 9420p492tEZQbuG8rSAfMB1Z7YQsHI2T4gUyRAJFABXkgLj591zOZQmINK69x/4cjnyHuaLnNXl
 jgWvKIsZaQdS/Hw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjv
 ggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 09:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7291

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


