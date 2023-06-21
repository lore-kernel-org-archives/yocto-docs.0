Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91921EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:42:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.3513.1687365768904572033
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 09:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91072C000D;
	Wed, 21 Jun 2023 16:42:46 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] docs: bsp-guide: bsp: fix typo
Date: Wed, 21 Jun 2023 18:42:32 +0200
Message-ID: <20230621-bsp-typo-v1-1-08b8fb0ec502@theobroma-systems.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Jun 2023 16:42:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4019

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D
It's meta-openembedded and not meta-openbedded, let's fix it.=0D
=0D
Fixes: de6e7c05fbcf ("manuals: stop referring to the meta-openembedded repo=
 from GitHub")=0D
Cc: Quentin Schulz <foss+yocto@0leil.net>=0D
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
---=0D
 documentation/bsp-guide/bsp.rst | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.=
rst=0D
index f2f5d4d95..4d64c65d9 100644=0D
--- a/documentation/bsp-guide/bsp.rst=0D
+++ b/documentation/bsp-guide/bsp.rst=0D
@@ -109,7 +109,7 @@ them to the "Dependencies" section.=0D
 =0D
 Some layers function as a layer to hold other BSP layers. These layers=0D
 are known as ":term:`container layers <Container Layer>`". An example of=0D
-this type of layer is OpenEmbedded's :oe_git:`meta-openbedded </meta-opene=
mbedded>`=0D
+this type of layer is OpenEmbedded's :oe_git:`meta-openembedded </meta-ope=
nembedded>`=0D
 layer. The ``meta-openembedded`` layer contains many ``meta-*`` layers.=0D
 In cases like this, you need to include the names of the actual layers=0D
 you want to work with, such as::=0D
=0D
---=0D
base-commit: c74928b1a7b2f285ed70999539f0c630316ad364=0D
change-id: 20230621-bsp-typo-c3b5c94c109d=0D
=0D
Best regards,=0D
-- =0D
Quentin Schulz <quentin.schulz@theobroma-systems.com>=0D
=0D

