Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2896DE7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 15:28:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.15367.1734967693569155146
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Dec 2024 07:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AhtZn/lN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 551F3FF803;
	Mon, 23 Dec 2024 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734967691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fO4a2MqmvG7P9yGVv0y/1KoAFBeWlg5GbzFip/rviQs=;
	b=AhtZn/lNWgqwFGVdqYp5EHd2WqoeSaNMVEq8tkDhJBkvyNIke+UpLLGYlSxE5A8NaIh3o0
	j7usGtb9bOda00HZ2lqMejP6sQW2nOFoCLYeNbDLvg5Ppo+22q3b8TZFjD6xV1GpT9W3kC
	+FKrMSvIEFfkyZvAF2/AH9W5KudbXzMCKa9lTd+bdKtmyNnf3Ug/uBcd1UFSEVnmbld6wU
	uN9EoQOZzsD+eCQ4MJdarMZ7LEuyO1T8yoJ1JY/oqYPWIL8FlaFe6qGztSf/1+IRt+gq5X
	a/KX+JplNiiXfllMffNMect43Za059TRyAYyWmMRGaX3zm6gjgOcCe8/G4xOVw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Dec 2024 16:27:56 +0100
Subject: [PATCH] ref-manual/devtool-reference: add warning note on
 deploy-target and shared objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-devtool-deploy-target-v1-1-ee00beb47691@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHuBaWcC/x2MywqAIBAAfyX2nFDbu1+JDpJbLYiGihThvyedh
 jnMvODJMXmYixccRfZsTZa6LGA7pTlIsMoOWGFbIzZCUQzW6sxL20cE6Q4KAgc17T2NErsKcns
 52vn+v8ua0gc+b/q7ZwAAAA==
X-Change-ID: 20241223-devtool-deploy-target-27d9f6e8a250
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Robert Berger <pokylinux@reliableembeddedsystems.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2790;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YzWcdClb546/CXL8A+zWwRRTpQrynB8MRShwe3ZfRw0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnaYGL00ZN9vPe0Yk3ojqsExQBhsl6k4SJuT3wh
 eYIyYip5syJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2mBiwAKCRDRgEFAKaOo
 NhrSEACHz8wu+LroCd09a6tSezbo8q2RhDQgQa6VBMjUzKCrCU3kN5SiAtgAYR+iLUhhsrAeMLC
 ejVLmJjt3chMvjgNF+LD1/zqYsJ1OjVK+V78xIk1cX03/MPja4D+G7wNJUQvFFOr0iZc9G52SyI
 aUcPk7xoUMilKGWC9wLKEcB7O2kBHZP3CaWbam3z5V8BKlraRV5zNTL2SkMIOGft/qI/zwwMoos
 V/50ln7ON7+R0039S8bKhBDFaDsiYimyMl/Z97JIEeO/gGGxIAWnZ9Jyu/g9hdOk7PX7riciJgD
 7WRBViLZKKdyQ7SlVzO1PfYKDxJm3j0XgFpY01O/u93te34M58UKAdz/9Rl8uTC5vu7TJ3E9vIY
 kPnZY4DZ3gVetxHuSW5sf26LZ+eevbX3FakaeEwBhpRC4ihOVttyawdPIbOxDHEmmq68QClbvBl
 IGj6kDF2JR5GR6YiU0/cQN8COhofoC/XuZ5knyWOpGd0mCFc/FvDm9Tcfy4V5FWBm3xTZc6k3Jz
 uL9VVM/6yuyTCWA+MV67OJyw11AKqHJF6crvyUzAl+++p0a+UzBqnhR9l9IowAJm5SgAejnahwZ
 J54iZNHxJCV0W6SJzfVw2Bdg8U89eQAt4bjfEv84whit2/RGA0j+dT4S8C8Hvh9/axNTHUEUYIU
 6KD/ZQ5FcOGI5EQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Dec 2024 15:28:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6015

The command `devtool deploy-target` does not handle any dependency of
the application, even when properly listed in DEPENDS or RDEPENDS. While
the current documentation was clear on that, it felt needed to add a
note on the fact that build-time dependencies may also result in
runtime dependencies, especially for people new to the project.

Add a warning block below the existing deploy-target documentation.
Also, link to the Overview and Concepts page, which explains it
thoroughly.

[ YOCTO #14377 ]

Reported-By: Robert Berger <pokylinux@reliableembeddedsystems.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index d74d5c29aedb9541a5b0dc337a4780c2a59c04be..a6ea00c2103109397ef08ba896f2bf51577c1563 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -553,6 +553,26 @@ the packages are already on the target. Consequently, when a runtime
 call is made in the application for a dependent function (e.g. a library
 call), the function cannot be found.
 
+.. warning::
+
+   Runtime dependencies can be explicitly listed in the :term:`RDEPENDS`
+   variable, but may also be the result of a :term:`DEPENDS` assignment in your
+   application's recipe. This is usually the case when your application depends
+   on libraries for compilation: these libraries are listed as build-time
+   dependencies in the :term:`DEPENDS` variable in your application's recipe.
+   However these may also be runtime dependencies if they install shared objects
+   on which your application will dynamically link to at runtime (e.g. shared
+   libraries ending with ``.so``).
+
+   These runtime dependencies are automatically resolved by the
+   :term:`OpenEmbedded Build System` during the packaging phase. Since
+   ``devtool`` ignores packaging dependencies, they will not be installed
+   automatically with ``devtool deploy-target``.
+
+   For more information on how the :term:`OpenEmbedded Build System` handles
+   packaging, see the :ref:`overview-manual/concepts:Automatically Added Runtime
+   Dependencies` section of the Yocto Project Overview and Concepts Manual.
+
 To be sure you have all the dependencies local to the target, you need
 to be sure that the packages are pre-deployed (installed) on the target
 before attempting to run your application.

---
base-commit: 4b904539d05fdac123ed96c3952613fbbe612c39
change-id: 20241223-devtool-deploy-target-27d9f6e8a250

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


