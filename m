Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8D8C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 18:54:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.4494.1691002460819908920
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Aug 2023 11:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AG5Qfi3V;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49615FF805;
	Wed,  2 Aug 2023 18:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691002459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RftkTp5xlqCsoG3wbvIl1grDt32cZgA1aWxBUrkem1U=;
	b=AG5Qfi3VhfaGIbd2r6NI4SF68YGPxb3cvHH1NCkxP+Okl8h82NX9+7Wq50RxbbG+D5yyAh
	TOPzirHGrp2SGpAM5wmuKIDi+zSh7dOQyN9B5eFt87IDdhblUYIoM9gvLQvEqAKKYGth1u
	clBebvJNjzPc4Wh0x80zoC+N+QD9uE/KvlkF6BMDL+mbdyrM8W7L99kxYD9keTf4wvBZnA
	WHPlKJhOc+KLRqyMlXhIWyTOLhABEUBG5/JPiUI0zZyTL6SfFonvTt9KWKQUc6GUO2eH37
	Q2uDBre4CmZQ+QdvdECpt5a8LZ2emVuIiivwxlM2pg7hOQqXIDs6BQD7QovqwQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: classes.rst: fix location of _ref-classes-ccache
Date: Wed,  2 Aug 2023 20:54:17 +0200
Message-Id: <20230802185417.194134-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 300
X-GND-Status: SPAM
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Aug 2023 18:54:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4102

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 973070dfb1..3f0d4844e8 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -293,8 +293,6 @@ An exception is the "rust" recipe, to build the Rust compiler and runtime
 library, which is built by Cargo but cannot use the :ref:`ref-classes-cargo`
 class. This is why this class was introduced.
 
-.. _ref-classes-ccache:
-
 .. _ref-classes-cargo-update-recipe-crates:
 
 ``cargo-update-recipe-crates``
@@ -319,6 +317,8 @@ recipe::
 That's also something you can achieve by using the
 `cargo-bitbake <https://crates.io/crates/cargo-bitbake>`__ tool.
 
+.. _ref-classes-ccache:
+
 ``ccache``
 ==========
 
-- 
2.34.1


