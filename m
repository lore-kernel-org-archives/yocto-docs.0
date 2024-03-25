Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1862FCD1280
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:52 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.51974.1711373269072443268
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MshSyefW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A2B940006;
	Mon, 25 Mar 2024 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5f1FbkEu3bxSE/sMeMvmCkuo6UZAq+EZZ9EsKQJeN4=;
	b=MshSyefWzZgp9l/yOYntshRPdq64wFYSm2U+d+WHiB66hHzBfB3Z95vOo730EMfSa3KRlP
	z0VeBXVgvbob6IoOy2Jm6YFxgsby+wBzyY0Ni8OEj3HPMqMIUr9+D3vCRGhCXKR1QJLLKS
	UfiP9G4KkjiFXWamC+z1VDnEZrv2yoXN5cacORxwV35WBMhbt6I1G0AMZGYOceJGB4aLRK
	gjYwJgTyNGlNkXUU0Iz8nzZQmxu1GReW5fWj7rjCTykKypWYVxKvX1xE8kgpENcwqPtGwH
	97q9ZQGt+gS6gYGY25tN3ZBX2zNCX5JmSMTASFUvZtbUVFEr9re/37oxkpp/7g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH 6/9] contributor-guide: be more specific about meta-* trees
Date: Mon, 25 Mar 2024 14:27:34 +0100
Message-Id: <20240325132737.3018073-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
References: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5004

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Martin Jansa <martin.jansa@gmail.com>

* this is often confused to apply for e.g. meta-oe as well
  where it doesn't apply as meta-oe has own ML mentioned
  in README.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index c0f2aa7cb4..15566701f6 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -391,7 +391,7 @@ varies by component:
    :oe_lists:`bitbake-devel </g/bitbake-devel>`
    mailing list.
 
--  *"meta-\*" trees:* These trees contain Metadata. Use the
+-  *meta-poky* and *meta-yocto-bsp* trees: These trees contain Metadata. Use the
    :yocto_lists:`poky </g/poky>` mailing list.
 
 -  *Documentation*: For changes to the Yocto Project documentation, use the
-- 
2.34.1


