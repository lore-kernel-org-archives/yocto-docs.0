Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8299EC5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:14:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8362.1710407652365099037
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JSBMeG1N;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF64E24000A;
	Thu, 14 Mar 2024 09:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sBt4mAkDVekm4rqoP4r4HhxR6W60rHBq1nBRZSFZ9Ak=;
	b=JSBMeG1NMayhM672P1QUR+XYNSPlV3d441NTI64bJGiWZN9yR9KrkBOfOlisyKL6jOzxVh
	Rg4dJaSdCSu2RORtn/NzV5dvRW6tLKmNy4zUYPqXCVagBsDaB1zMa4mG/q9TftJVND4WFt
	kmOqgMBl+PgIBJC2cavlaAVYcb1ZgwPxo10UF6ZNnavb2hkS7EcIRjoXl6kj9eia1yXEKs
	VyIp/BRqOMM03Fa1hDEjNWH1Wz4OnQyfy4pIMIzj2QrD62GcdtwPRd3L6N3CwmvLzbTvoJ
	wWb6738FdDBU6waXCQVqb8tbVijTkV3APbrJjZB2QUoLthgmlmEx1Y1hH/iePQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [kirkstone][PATCH 4/8] ref-manual: variables: adding multiple groups in GROUPADD_PARAM
Date: Thu, 14 Mar 2024 10:13:54 +0100
Message-Id: <20240314091358.84025-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
References: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4962

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Geoff Parker <geoffrey.parker@arthrex.com>

Add missing documentation on how to add multiple groups with a single
GROUPADD_PARAM:${PN}

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0887a40b6b..1198ac5696 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2962,6 +2962,14 @@ system and gives an overview of their function and contents.
 
          GROUPADD_PARAM:${PN} = "-r netdev"
 
+      More than one group can be added by separating each set of different
+      groups' parameters with a semicolon.
+
+      Here is an example adding multiple groups from the ``useradd-example.bb``
+      file in the ``meta-skeleton`` layer::
+
+         GROUPADD_PARAM:${PN} = "-g 880 group1; -g 890 group2"
+
       For information on the standard Linux shell command
       ``groupadd``, see https://linux.die.net/man/8/groupadd.
 
-- 
2.34.1


