Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0ECDCD1280
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:29:42 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.52098.1711373373982068634
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WjZRRcgC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B650240008;
	Mon, 25 Mar 2024 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mLwmvm6F6lpr7DWl42+h3zGPr+V5lGnZFrKP2Z7R/L4=;
	b=WjZRRcgCFhCLDtZaZI04krFjaukP2sqDD1lQPWrFxfhJ4jTFkbP5PyNT3h/nzumDY3GvwN
	mBbsytxoDszlzYn9TRPbKvadDyRZeLzJovwfoHQTL2XtRlLeskL6wvpQzLvmodzx85w7YK
	Cmf1+cgKbUluaCdkqz4DQk3uiIlpvhJRDDSmGZfRhE/YE7DYzbKlqt4zakgemEyHFXT+Is
	JEl0OcFyCMrWizbopvKt3mX41ucppffeB1zwz/ufkawC82R5De9SfcNjajLw9fyIxQOUEf
	X8+g5m6XZKpV3nOpS20VnOdlj0jsJ3rT6I3HbED7Z6DBkBZKnwoIqv7jJD1xfw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [nanbield][PATCH 09/11] ref-manual: add documentation of the variable SPDX_NAMESPACE_PREFIX
Date: Mon, 25 Mar 2024 14:29:24 +0100
Message-Id: <20240325132926.3018186-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
References: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:29:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5017

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

The documentation of the variable SPDX_NAMESPACE_PREFIX does not exist.
This variable is used to change the prefix of some links in SPDX docs.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8af233004f..7ae61ad0ff 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7925,6 +7925,11 @@ system and gives an overview of their function and contents.
       image), compared to just using the :ref:`ref-classes-create-spdx` class
       with no option.
 
+   :term:`SPDX_NAMESPACE_PREFIX`
+      This option could be used in order to change the prefix of ``spdxDocument``
+      and the prefix of ``documentNamespace``. It is set by default to
+      ``http://spdx.org/spdxdoc``.
+
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
       identation and newlines, instead of the default output in a
-- 
2.34.1


