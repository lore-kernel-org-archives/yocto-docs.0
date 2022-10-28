Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B50ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:19:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.4621.1666952393495278250
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 03:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JTXQ1PO8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7CE0B240004;
	Fri, 28 Oct 2022 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666952391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wizpYppE0f/9sVS2bK1K3AqfZzkmEX4Dlw8dVhSK0qc=;
	b=JTXQ1PO8srWUvlOzNw8O4Out8Uzqfczn/E/yaxtG26VjaD4UoUUF0iDO/4iC/EadYDa7+E
	J9FVXomVYKSocye1ttXTJLuLDi+xIpLlkaACJXNdsqqUrpsv+F8X98pFjSmiCuQx5j7c9b
	oTHUoMzjkcd1au31O3nw1WEKygmyfIxAsuQUDsr5oNxoVSJw7YP5TYjt1ZFC5kR1jJ9Q9x
	Fqk5JqRvHoX7FC6Ock3K2M34zNs6bawsYv1FRR0aOtpVZG0Ol4tO7UFQHmFH7C/inrr0eR
	YgMEusc29oGVXO9iQ4J+xkh+A5PziRu3jNyHU3rnapi0VLnKfTnUN8xatkP7Xw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 5/5] ref-manual: terms.rst: add reference to new SBOM/SPDX section in dev manual
Date: Fri, 28 Oct 2022 12:19:39 +0200
Message-Id: <20221028101939.93195-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
References: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 10:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3436

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/terms.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 5aedd08aae..454f46b0b8 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -407,7 +407,9 @@ universal, the list includes them just in case:
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


