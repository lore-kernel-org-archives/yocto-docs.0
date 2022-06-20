Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77815C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 09:42:16 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.28420.1655718131688185136
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jun 2022 02:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JVIgY+7y;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8FC05240012;
	Mon, 20 Jun 2022 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655718129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HVGJffmTJm+nczv5jg/cjL6bNh/uASrt2XoNET2C90c=;
	b=JVIgY+7yM8INdcXypi5e5wwXAJNyQU+6RK3vN5mocbUMkmXZ1omeMJHMWmJ2AzcRcX3gDy
	UFq5cjDxPGOnA+DUKgUq00r0N5RIyx1alWTbX8kriVBlwaz6jUi1l4MMd/DpDNxb1P7B2K
	kPiJGqTnBv73G2ObiyMZB8nihLeB484mNj2ElkbX8wWYpVWcS1QBbsvCsmp+/gQsIRjrUs
	KBQQs5pO7ozwNRlNjlcNvF5oZzjFWnB13BnIW5DyniFcuUpiDItyJeyHZ9lkFGEBNgo/ah
	pLU2KKSwZFFKIIpYsDLiJjI8Ndi7O/ry4VEw8ORzYI4dgR6GMOs7RB1FOtwhjQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: NPM packages: minor grammar fix
Date: Mon, 20 Jun 2022 11:42:02 +0200
Message-Id: <20220620094202.1870136-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jun 2022 09:42:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3011

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 50c571b103..a6c7ba3ce1 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -7624,7 +7624,7 @@ modules and manually add the information to the recipe.
 
 ``recipetool`` creates a "shrinkwrap" file for your recipe. Shrinkwrap
 files capture the version of all dependent modules. Many packages do not
-provide shrinkwrap files. ``recipetool`` create a shrinkwrap file as it
+provide shrinkwrap files but ``recipetool`` will create a shrinkwrap file as it
 runs.
 
 .. note::
-- 
2.34.1


