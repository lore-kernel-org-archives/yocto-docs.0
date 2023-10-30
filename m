Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D460C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 14:49:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.150839.1698677377824857026
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Oct 2023 07:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=T1rwLja1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEC7420007;
	Mon, 30 Oct 2023 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698677375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=58639Ai+ue3oo/ma92TaI9B2frTk20bALfxh0UUqqVw=;
	b=T1rwLja1nUjUyN747UQ0XsHZC0prnDVH8AAFv0agzrdVxHsl/B5kV8JF3UKfByIQxpOjHc
	dBcjXNBgoc3U5dtRI72IYr6NJ6TTUEckk+3zZ4eAMfubr4Euh7QUxvKQb5BFkRtCqYX8an
	5kAiVsU7wY7fgEgXX7xDULpPJrsgqFtg1gyVQJ6Yk056dmB6oFq2YnvxQ6qcmEf7fkLy4M
	PzgXIvHwgDXN2UKhe9GNSOPaC9f6D/iO7FM+wZbx19MOrj/9uG8Ae7LBR/7BXXZIBIM39P
	eVrX+6LUl9hbLkGNfKQ8YU2uIVtkXtDs5jyBn0wKGmkzOoj5UnH8WgW5QPk2RQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH] ref-manual: document cargo_c class
Date: Mon, 30 Oct 2023 15:49:34 +0100
Message-Id: <20231030144934.1757436-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 30 Oct 2023 14:49:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4525

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f1d545f310..3070f13551 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -281,6 +281,19 @@ tool.
 
 This class inherits the :ref:`ref-classes-cargo_common` class.
 
+.. _ref-classes-cargo_c:
+
+``cargo_c``
+===========
+
+The :ref:`ref-classes-cargo_c` class can be inherited by a recipe to generate
+a Rust library that can be called by C/C++ code. The recipe which inherits this
+class has to only replace ``inherit cargo`` by ``inherit cargo_c``.
+
+See the :yocto_git:`rust-c-lib-example_git.bb
+</poky/tree/meta-selftest/recipes-devtools/rust/rust-c-lib-example_git.bb>`
+example recipe.
+
 .. _ref-classes-cargo_common:
 
 ``cargo_common``
-- 
2.34.1


