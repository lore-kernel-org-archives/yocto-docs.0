Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E02AC00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.147618.1698153818515018826
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VkSKcaZ2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB928FF818;
	Tue, 24 Oct 2023 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jU8xAKVcWYUAEM4iH3nzQwOhJpy1vJWWLGhMBNoU67k=;
	b=VkSKcaZ2pNJnWVisPwP2lUwrHa1JU3VoeZD8gIeaCTvqpjxe3Whb2wyyC+8aWtET/tzOMG
	TxczRzcwW8CrP7izghAoO3pD3Rqkw2M7A65+iXqWoso6EYxsEU6nqm1gSYJeOR3bf+lH84
	yqXA4H7jsWo/32Kl68BwETRAVl5c8876S9egk2/pAYJ54whT3vrUtLSkGlqWr75gc9G/fN
	Gcs3pFYIunbuBc175HOTStv9OK0Dsd8zu/DMxXdqkscPbXQ4Hkmaka7cAnB26wxhpJB1Bv
	+dYAhgO2RHDkN8gLTtZiQfACWU+latbMZniWXhsZUsIoCoLRn+ckyAJIK1pnPA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Arne Schwerdt <arne.schwerdt@elbbits.com>
Subject: [mickledore][PATCH 01/13] ref-manual: Warn about COMPATIBLE_MACHINE skipping native recipes
Date: Tue, 24 Oct 2023 15:23:06 +0200
Message-Id: <20231024132318.90209-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
References: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4462

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Arne Schwerdt <arne.schwerdt@elbbits.com>

Signed-off-by: Arne Schwerdt <arne.schwerdt@elbbits.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5722376815..445274f62f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1362,6 +1362,13 @@ system and gives an overview of their function and contents.
       speed since the build system skips parsing recipes not compatible
       with the current machine.
 
+      .. note::
+
+         When :term:`COMPATIBLE_MACHINE` is set in a recipe inherits from
+         native, the recipe is always skipped. All native recipes must be
+         entirely target independent and should not rely on :term:`MACHINE`.
+
+
    :term:`COMPLEMENTARY_GLOB`
       Defines wildcards to match when installing a list of complementary
       packages for all the packages explicitly (or implicitly) installed in
-- 
2.34.1


