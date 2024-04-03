Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A34CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 14:38:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12733.1712155098726477270
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 07:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UFJhUfRJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43F9D1C0009;
	Wed,  3 Apr 2024 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712155097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VACC+Cs4gGs6cgAf7VdRfbTS0nOf737JgVl4wqAtN0g=;
	b=UFJhUfRJ2DkfOBprl2g/zpLD1ANuXNmROKElbhCsMjMwpbWkEaWHqz72WDIVZatZUbLc57
	jI7/SV1joI3kkWz+TOy8D1JxKlJ3x8c7U3F7S+rPVdIKiwT9/mvse1n1hI7tFxJeI1wO+Q
	Xe7VgzwIVHhcyjL4pq6psFJbEuH2IuIXA8h9P+nxWXaoNDpPZ3zRxXmgxRaT1VpGvwGh0y
	PoscXA5K8I3OmDfpRRzjBsQJbpwbTCBjtHETSjKbeTdGYkyvwB3M4WiXYmPawBoj49UZh9
	EuwMF2qpxxDlyTPr4bsHCDrfuJRO/XTwB4Or688BmZ8hooXy/yWht7KlgeW3YQ==
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 3/5] migration-guides: leave Deprecated variables empty
Date: Wed,  3 Apr 2024 16:37:22 +0200
Message-ID: <20240403143724.1956838-4-joaomarcos.costa@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5053

Only mention that no variables were deprecated in the upcoming release 5.0

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index 2c106ee13..cf55ee4c1 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -70,7 +70,7 @@ Recipe changes
 Deprecated variables
 ~~~~~~~~~~~~~~~~~~~~
 
-The following variables have been deprecated:
+No variables have been deprecated in this release.
 
 .. _migration-5.0-removed-variables:
 
-- 
2.43.0


