Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5ABC04A94
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:55:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.49357.1691776539970405112
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 10:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fgGMmdzn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B24DA40002;
	Fri, 11 Aug 2023 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691776537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3MLYWkbSyrPRlxohwjdbgzyif2T+3sQ7p6wwZiFTUmU=;
	b=fgGMmdznR0aoKhdo/mfyoUy2oHJyvt3CqOHdY1JEpZKj01FJRxgatsfVXpYLRmzi730nej
	L9xt+8kI6f8vtET3rrdI6ajs8hooDYYM3FZGVq6ooKG13GetVbWD0kJ6bL+uQbGUrCwTqh
	p/WW3nZxW4IlIT505DJC1DPtq1+UEQHGu6hQUjBQr4bSxkPFWAEuGkqt0nLW/iWR0rbxz3
	2Ltrfk8ACzG97mo8M5u3q6LE2mHPFeJ0MQmZVBsB4tSqPDx8eY3BsPNfFKYEQFkRc2KDvo
	fQcdMaSvEtCl4md3582uk0VetoJNcyQdYc366ZRY5/mpe0m6Om7GCaaYWSNL/g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/5] contributor-guide: remove obsolete pkg-config guidelines
Date: Fri, 11 Aug 2023 19:55:24 +0200
Message-Id: <20230811175527.1116864-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
References: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 17:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4147

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

They were coming from obsolete notes from the times
when people directly created or modified .pc files
from their recipes. Nobody should be doing that
any more and keep this can be confusing.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/recipe-style-guide.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 35ffbc61ef..a0d513e8e9 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -255,8 +255,3 @@ Tips and Guidelines for Writing Recipes
 -  Use :term:`BBCLASSEXTEND` instead of creating separate recipes such as ``-native``
    and ``-nativesdk`` ones, whenever possible. This avoids having to maintain multiple
    recipe files at the same time.
-
--  Avoid manually mangling ``pkg-config`` ``.pc`` files.
-   Recipes using ``pkg-config`` should use variables to ensure they are correctly
-   relocatable and not need manual path correction in the recipe.
-
-- 
2.34.1


