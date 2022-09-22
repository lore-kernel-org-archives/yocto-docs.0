Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8C5C54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 13:02:16 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.6800.1663851731672300865
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 06:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EMxNz+fY;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 21350100012;
	Thu, 22 Sep 2022 13:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663851729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sEw5GTNyNkXz1WYh/EoX1zvFPtGR1zGjuJSfkia4DpE=;
	b=EMxNz+fY1lb0wpD5sk2hhZ+qdRrhRUKqtC+YM/3yCpubUjSUHiWFKHhOy+L70/9veFV1A9
	p+s7yfQl6+oXuxFfqvGX7hvw6W6vA1IXcUJ55rTYo+n/EBKNQ/4R62zl98eJ7nhE5J6ZbG
	Z7ukKGN1HU38yjQ8lj2973KR585+ABXTV4EwO8V0vBOPganIiqiztYVZBvG3wQpMN6G17n
	ow1fRGe99IKyLo9XlrKszJi4b48DeQA71foLbxyldxL7wWCcfVqDGUcWWFkdNN5ZzrJ2e4
	neUYOy+L8Hi8yAXuS5VyGdjkykjWhPkm5YayibJvrgU/liSQsxn8Y3B09R9cVA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: structure.rst: add reference to the contents of
 the build directory
Date: Thu, 22 Sep 2022 15:02:04 +0200
Message-Id: <20220922130204.2390696-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 13:02:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3208

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Add this to the quick description of build/ in the toplevel
directory structure.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/structure.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 6c6f52e799..f34becddc9 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -68,6 +68,9 @@ information on separating output from your local Source Directory files
 (commonly described as an "out of tree" build), see the
 ":ref:`structure-core-script`" section.
 
+See the ":ref:`The Build Directory --- build/ <structure-build>`" section for details
+about the contents of the :term:`Build Directory`.
+
 .. _handbook:
 
 ``documentation/``
-- 
2.34.1


