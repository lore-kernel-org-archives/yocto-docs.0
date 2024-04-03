Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2157CD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 14:38:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.12897.1712155101094538969
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 07:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KV9YsA83;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9726A1C0003;
	Wed,  3 Apr 2024 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712155099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7R7dp3Ojdam8Qwt9h0K7HRu0WFdfC+RJswieQIVgw8=;
	b=KV9YsA83QTABX1N9k6brXw23q3lq2Lm0FiXaiDGeBQ/0UW/Avt083MWzt1PM/ASzYt45xx
	U3L5DTRC41O100PNzTj73AkoSmmnOCwaeTvshQlHfeccc4yo51Nno2Z2iCozIoxGeFCVX5
	ZjJMuqH/jf22gleNKWIObZsTUVBl7IJ37JcNhtDzRufFFS7ezVL9+iHjCpCMOnnX9+qyFc
	CLYohzspGBmfc3/RVS7svogBgNhuoiHgFXlwJO9r8+0SpFuFnipx8uPr1XkDkq+tmvDGA2
	WJNXMSNFGRvgGl3FexqGoSzLDViJnqJHGoznBqNsvBmYacTd9/fKi2ccvb7rzw==
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 4/5] migration-guides: list systemd changes
Date: Wed,  3 Apr 2024 16:37:23 +0200
Message-ID: <20240403143724.1956838-5-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
References: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Apr 2024 14:38:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5054

Mention the nss-resolve related changes.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index cf55ee4c1..16ee86e0b 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -57,6 +57,12 @@ Go language changes
 systemd changes
 ~~~~~~~~~~~~~~~
 
+Systemd's nss-resolve plugin is now supported and can be added via the
+``nss-resolve`` :term:`PACKAGECONFIG` option , which is from now on required
+(along with ``resolved``) by the ``systemd-resolved`` feature. Related to that
+(i.e., Systemd's network name resolution), an option to use ``stub-resolv.conf``
+was added as well.
+
 .. _migration-5.0-recipe-changes:
 
 Recipe changes
-- 
2.43.0


