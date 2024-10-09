Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5038ACED625
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10717.1728459694138155070
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SeWeOiyd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A02161BF209;
	Wed,  9 Oct 2024 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ASUhdlBChjb5VUvWFESamebClcpmhTJeWZmShVXsH0=;
	b=SeWeOiydTFyFJ0B5O5BcmO6yFTLMpJIghJ5KFi3xyZSMUvl6sGQfSEH3o7qrwpE3VN6koj
	VdHMGe5EGUE4CbmTkcTlbz8UEqe7zfnbomzSOohg5oBPoqdMEFQK18qc2+eb3qI6iKN3jL
	3rPBchHAhKRFAoz6gSHA23HI5GTVOkYreTvPGc5UpvNejKmG11LQ7479vtfB0GQRC8qD+Q
	wpdtkqO2ccmZGfaZkLJVAhLU8lHWzEo0B/Mx8/LHpHWmdi6Z71kvXXbmAqbMZY3bz/A08i
	MXgJDvRuOrKjTzIO52zx1Tja8qh+kjXd3uWMldIQdnlZFOgQF3bmAxHO173ptA==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 04/16] ref-manual: add missing nospdx class
Date: Wed,  9 Oct 2024 09:41:02 +0200
Message-ID: <20241009074120.866786-5-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5411

From: Antonin Godard <antonin.godard@bootlin.com>

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9f6e42725..14aa0f3a3 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2049,6 +2049,14 @@ and the target. All common parts of the recipe are automatically shared.
 Disables packaging tasks for those recipes and classes where packaging
 is not needed.
 
+.. _ref-classes-nospdx:
+
+``nospdx``
+==========
+
+The :ref:`ref-classes-nospdx` allows a recipe to opt out of SPDX
+generation provided by :ref:`ref-classes-create-spdx`.
+
 .. _ref-classes-npm:
 
 ``npm``
-- 
2.46.0


