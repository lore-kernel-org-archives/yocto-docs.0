Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E1AC46CD4
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.2909.1702935259581942895
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n+P1n83i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E94E920002;
	Mon, 18 Dec 2023 21:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQQumH4Q/K4Slezt6/hiCrVEwnq5Pniyzn/cTW5TeZg=;
	b=n+P1n83iUbQF07mO/L739dQTl6wd6wza/fwlUdxGzwDbZ6lS3EDGRPAeJ6kn0YeT9R38nw
	NQLS4tN6gF9frInbTiSDBTPhlJnvV/gb7IeMAHyFQTV8803FDye9VB4YkUrjBPaDirl5Df
	3xSh5OZQGmNjVCVzt+XRpT3gS3BZH7c09C/0ops/U6MUTIWuOAX+dx1FKRbscz1qu84cC8
	B82coYxi7EFy/Ey3hBC7cO93NbCXANy8TnEANoSeG340Skt2ZG9+6V8/J7iHwLBXV6R2nL
	1sY0pf4X7WIJTwwRGF7v2bZef3Dr0B+5YgjrjVo6Y4bs4JY33HJM/vqj8U54TA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [nanbield][PATCH 17/20] manuals: brief-yoctoprojectqs: align variable order with default local.conf
Date: Mon, 18 Dec 2023 22:33:31 +0100
Message-Id: <20231218213334.146370-18-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4703

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Simone Weiß <simone.p.weiss@posteo.com>

Align the order from `BB_SIGNATURE_HANDLER` to `SSTATE_MIRRORS` in Quick Build
with the order in the default local conf. While trivial it is easier to find,
if the order matches.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index df8d75edc2..61c5cbec36 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -251,10 +251,10 @@ an entire Linux distribution, including the toolchain, from source.
       To use such mirrors, uncomment the below lines in your ``conf/local.conf``
       file in the :term:`Build Directory`::
 
-         BB_SIGNATURE_HANDLER = "OEEquivHash"
-         BB_HASHSERVE = "auto"
          BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
          SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+         BB_HASHSERVE = "auto"
+         BB_SIGNATURE_HANDLER = "OEEquivHash"
 
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
-- 
2.34.1


