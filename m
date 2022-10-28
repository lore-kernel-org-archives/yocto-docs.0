Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCC8C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:11:16 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.611.1666969873809037366
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 08:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kbNIe4RP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2E5A220005;
	Fri, 28 Oct 2022 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666969872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqGe6md57Xufarycij7K84bymV8Axu2ZvOQI+2U29Go=;
	b=kbNIe4RPTsZ8lfT/KwH1Fu5lWtulwzZllyJNVETuanyDM6YK5+z7Cq0BqN7vkGDyykcvxX
	SogioiTuV1kueQmoX5AZwDCdGAu2X4e2jvDm2nFiVAiv6hjWpIPHaqNVOmr8FErx8/HQX7
	GlXtSllDzx8Slg8OJ8g18Dk8v+iancJKY1/Y5HiAMAfD+v9mkHpCOppFHRH9jWzm3e51d8
	uZ8QRi8bUTr8Q9j039mLqfnl/7KtfXkMQPKMN2GM+fojE1CtK0UyZhYiULQRfOeRI5s0TZ
	UrHU7ZDOrQoGDleewn/Y/RF9ewLZJk8y9eQfOa2upQvdQnFLPkTZ2vc158Zxjg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: JPEWhacker@gmail.com,
	mikko.rapeli@linaro.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 5/5] ref-manual: terms.rst: add reference to new SBOM/SPDX section in dev manual
Date: Fri, 28 Oct 2022 17:10:33 +0200
Message-Id: <20221028151033.383087-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028151033.383087-1-michael.opdenacker@bootlin.com>
References: <17224368BE5A21CF.6604@lists.yoctoproject.org>
 <20221028151033.383087-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 15:11:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3447

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/terms.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 4711d7df7b..b4a78efad3 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -405,7 +405,9 @@ universal, the list includes them just in case:
       <https://spdx.dev/>`__ and is used by the OpenEmbedded Build System to
       provide an :term:`SBOM` associated to each a software image.
 
-      For details, see Wikipedia's `SPDX page <https://en.wikipedia.org/wiki/Software_Package_Data_Exchange>`__.
+      For details, see Wikipedia's `SPDX page <https://en.wikipedia.org/wiki/Software_Package_Data_Exchange>`__
+      and the ":ref:`dev-manual/common-tasks:creating a software bill of materials`"
+      section of the Development Tasks manual.
 
    :term:`Sysroot`
       When cross-compiling, the target file system may be differently laid
-- 
2.34.1


