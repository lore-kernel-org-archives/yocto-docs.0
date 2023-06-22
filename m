Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0F5EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:28:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.7320.1687426098319944249
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 02:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PwgaLBNx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687426095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=As9ClnDahQTCAC1jDTeFsJOk0FZvB0SS+3xrNuuaoQ0=;
	b=PwgaLBNx82fx7G8gNRHpy5q5kzw/zcFFLWOmGIUleXLlcoeKuCYAfAf6sMdu3vfQGs2zfP
	pBxfzu+0NRpgiMnxytTsLSa0MsyI9S/R25IYE24da5OEbhAVi0Abfko65WCcmxfakYYlBH
	wkCJoNiNX4q2lM0SGz1J6MGpCuGdGefw0OFLldGYpI1U7zHjMRXUFUrMWEIge3qPtEzBAL
	wvmpmNsom3pVjtZEo9HezqeTU+sdTz5j74CYPdxn+0sCLD9FqQWvNVemNCjBfxryO8Ew3Y
	PMcfkXjjZgOJeqzX8VTCV0cj0YX2kUKzZHa1U4iRnEHwXTgkfQwmLKZsdzyYYA==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80C5E1C0003;
	Thu, 22 Jun 2023 09:28:15 +0000 (UTC)
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] [mickledore] docs: bsp-guide: bsp: fix typo
Date: Thu, 22 Jun 2023 11:28:09 +0200
Message-Id: <20230622092809.4056589-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 09:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4022

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

It's meta-openembedded and not meta-openbedded, let's fix it.

Fixes: de6e7c05fbcf ("manuals: stop referring to the meta-openembedded repo from GitHub")
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index f2f5d4d954..4d64c65d91 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -109,7 +109,7 @@ them to the "Dependencies" section.
 
 Some layers function as a layer to hold other BSP layers. These layers
 are known as ":term:`container layers <Container Layer>`". An example of
-this type of layer is OpenEmbedded's :oe_git:`meta-openbedded </meta-openembedded>`
+this type of layer is OpenEmbedded's :oe_git:`meta-openembedded </meta-openembedded>`
 layer. The ``meta-openembedded`` layer contains many ``meta-*`` layers.
 In cases like this, you need to include the names of the actual layers
 you want to work with, such as::
-- 
2.34.1


