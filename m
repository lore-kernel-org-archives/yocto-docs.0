Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1649C7EE32
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:29 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.79.1692378627335498056
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oTo2zyki;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3433EE0003;
	Fri, 18 Aug 2023 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dy/RCcIEai3jalaNgU9kjOEUniKR3Ep3tDT1Qws4oJE=;
	b=oTo2zykiWIabMSvua6okTCZ27ISUUV/LauDstekpSLjpNjny4eEjjPB5w39uv8ZFSaYSvN
	NkhYKYh6JZgbP/7bkD7M4BFi5hLGhSTJ11tikMOPTTu1lZJCLzbf1BiigtP7vrIS4agxXq
	KMNiVUIxDVNfQoxPwCW1YA/UosJcsND1jHIzNk/OYmN7xjXe6A3+8Pd02aNfDkSK8LwdwZ
	0g1a0tu/JszMeLpFRFaA9HCbFsISndoWMDthmlXW6WHRuB0MB8PzXWnsH2I8x+Jnk3P+Cu
	waBh4iN5TezQENu9Fgj8iUD1s3/RLemorqTBfgQnylnhtlQKGJC/SycW1vOdag==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 03/10] contributor-guide: identify component: provide link to repositories
Date: Fri, 18 Aug 2023 19:09:58 +0200
Message-Id: <20230818171005.92381-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
References: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4168

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/identify-component.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/documentation/contributor-guide/identify-component.rst b/documentation/contributor-guide/identify-component.rst
index ba7c998888..a28391a66a 100644
--- a/documentation/contributor-guide/identify-component.rst
+++ b/documentation/contributor-guide/identify-component.rst
@@ -22,8 +22,10 @@ issues can be reported in the :yocto_bugs:`Yocto Project Bugzilla <>`. The
 where questions can be sent if you can’t work out where something should go.
 
 :term:`Poky` is a commonly used “combination” repository where multiple
-components have been combined (``bitbake``, ``openembedded-core``,
-``meta-yocto`` and ``yocto-docs``). Patches should be submitted against
-the appropriate individual component rather than :term:`Poky` itself as
-detailed in the appropriate ``README`` file.
+components have been combined (:oe_git:`bitbake </bitbake>`,
+:oe_git:`openembedded-core </openembedded-core>`,
+:yocto_git:`meta-yocto </meta-yocto>` and
+:yocto_git:`yocto-docs </yocto-docs>`). Patches should be submitted against the
+appropriate individual component rather than :term:`Poky` itself as detailed in
+the appropriate ``README`` file.
 
-- 
2.34.1


