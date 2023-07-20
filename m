Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7E3EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 13:13:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.12592.1689858811356190620
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 06:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dB0xgNrJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B73660018;
	Thu, 20 Jul 2023 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689858809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ONUHk5ZA2C4SIuZap8GieWCwSXmg+sRUEdptdf7h5mU=;
	b=dB0xgNrJ3uo7jlHiNB7BmqrpwBXwqln2y6NDVjLdBlb8YBx0kBOBNqn6R1WIj3iQO67sfp
	OzVxEYD6OTYUxg3PFhkKGpF+r2MqJpqpWJtCfZMjoUYjU1owzU4Na5n1WrrFDmgWqsBiLl
	DGQ/oUBZ67N03OTt3zKOaMEtJRcSbPl0MNS0I+5cxPJR2Y4xVBrfwJhMrBvJG3RdbmXlpA
	2HrfO8gDujpgr52TOI208coxoTEJPnB34lYClNglZVSQ09Y3okn//yB6mPA0hLh5KDJ1g8
	oDcdgi4D9MAc1l2pVxcVseeYgxx+mVkzUNY6IuaoXyMFBjzUKkoCpveRyY2E+w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] [kirkstone] ref-manual: add LTS and Mixin terms
Date: Thu, 20 Jul 2023 15:13:24 +0200
Message-Id: <20230720131325.336321-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Jul 2023 13:13:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4073

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/terms.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index d94fa4a5c9..ba13f77f19 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -211,6 +211,12 @@ universal, the list includes them just in case:
       Layers`" section in the Yocto Project Board Support Packages (BSP)
       Developer's Guide.
 
+   :term:`LTS`
+      This term means "Long Term Support", and in the context of the Yocto
+      Project, it corresponds to selected stable releases for which bug and
+      security fixes are provided for at least four years. See
+      the :ref:`ref-long-term-support-releases` section for details.
+
    :term:`Metadata`
       A key element of the Yocto Project is the Metadata that
       is used to construct a Linux distribution and is contained in the
@@ -230,6 +236,12 @@ universal, the list includes them just in case:
       :yocto_git:`yocto-kernel-cache </yocto-kernel-cache>`
       Git repository.
 
+   :term:`Mixin`
+      A :term:`Mixin` layer is a layer which can be created by the community to
+      add a specific feature or support a new version of some package for an
+      :term:`LTS` release. See the :ref:`ref-long-term-support-releases`
+      section for details.
+
    :term:`OpenEmbedded-Core (OE-Core)`
       OE-Core is metadata comprised of
       foundational recipes, classes, and associated files that are meant to
-- 
2.34.1


