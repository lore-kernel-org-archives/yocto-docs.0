Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6225EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 08:06:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.37483.1687507589426122636
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jun 2023 01:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z7i/c9IY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687507587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wyfKVOdBcYBysj5+rVdGXN5TnsD+8iKAtcQ6IoRhIlA=;
	b=Z7i/c9IYVueLpjwuW/HUNymgMEOzX2xhz4jHcEFkh6p2kuVJg2YD+mlt3el0xDmOrKqpzZ
	GQQ4IClwBvciJTb7CduvJEVYEb0WZSI3Ehj8LCD9JILFH5Ui7rWyrAGkBe694mWk8+iEYm
	mQ9i5TlmeYXV8kXELMWGskZ+mFYUnUT3r0+TkTQLadVuu9Pb5NeAA7BAnt/oOaLuW7DnXt
	xAlT1t6XS5IrEkEml2Il+7A1nLVgITGq64O41s5GBy6v+5NVxbZf7Ozn217V80sFusrWPt
	0NfIe9G2zVVFpN0CQ59kvrPMAIefGfMDA8gDgM0AE/NG1iR3s+/QlOeVy2zi/Q==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id BD743FF807;
	Fri, 23 Jun 2023 08:06:26 +0000 (UTC)
From: luca.ceresoli@bootlin.com
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] ref-manual: classes: devicetree: fix sentence saying the same thing twice
Date: Fri, 23 Jun 2023 10:06:03 +0200
Message-Id: <20230623080603.3249960-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jun 2023 08:06:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4036

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

This sentence was originally written based on the comments in the .bbclass
file, but further editing led to saying the same thing twice. Remove the
duplication and also reword it to make it generally better.

Fixes: f65816f5ea62 ("ref-manual: classes.rst: document devicetree.bbclass")
Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 documentation/ref-manual/classes.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 11e70006e5ac..e555a80b5af9 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -600,12 +600,12 @@ The :ref:`ref-tasks-compile` task will compile two kinds of files:
 - Device tree overlays, detected from the presence of the ``/plugin/;``
   string in the file contents.
 
-This class behaves in a similar way as the :ref:`ref-classes-kernel-devicetree`
-class, also deploying output files into ``/boot/devicetree``. However, this
-class stores the deployed device tree binaries into the ``devicetree``
-subdirectory. This avoids clashes with the :ref:`ref-classes-kernel-devicetree`
-output. Additionally, the device trees are populated into the sysroot for
-access via the sysroot from within other recipes.
+This class deploys the generated device tree binaries into
+``${``\ :term:`DEPLOY_DIR_IMAGE`\ ``}/devicetree/``.  This is similar to
+what the :ref:`ref-classes-kernel-devicetree` class does, with the added
+``devicetree`` subdirectory to avoid name clashes. Additionally, the device
+trees are populated into the sysroot for access via the sysroot from within
+other recipes.
 
 By default, all device tree sources located in :term:`DT_FILES_PATH` directory
 are compiled. To select only particular sources, set :term:`DT_FILES` to
-- 
2.34.1


