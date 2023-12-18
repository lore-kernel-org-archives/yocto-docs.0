Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A16C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3227.1702935914230345729
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i0w7OQ0Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0DED1BF203;
	Mon, 18 Dec 2023 21:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9xtgto+9AUZR1VnmFL162Xw4Ra2higmFbS6/PnFX3yg=;
	b=i0w7OQ0ZQuzm3D/U0NWhpIxQcqea3ZXrCaIiniJ2QOxnnvSB6Stq9OFpFKsPfDujdmZA9B
	Yw63RY41PE/vWU/wVUbQCm2mZwAH8N+pTtj3SBBp7fSkIW068hcWuM4B37J+B4huBfP5bi
	Z7WwKdCrJg+v4K9smrRe4MB+8vwANy1HWZMBGC3piqiPFmJFwuBC3Qqd7rznDFTsNBAD9W
	r/tIWZAfNxNDFDGgWn9bbb45hwT5KhuskOM/mFK9YIjoTF8esuOvp3EJdWOeuKQHXJ97IC
	jhEUhHgcZPs5+/7OlpglwGi1l5kmgA5vmkFl3H6HoTojPgK3kGmFH6F+yRNGzQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [kirkstone][PATCH 15/18] manuals: brief-yoctoprojectqs: align variable order with default local.conf
Date: Mon, 18 Dec 2023 22:44:39 +0100
Message-Id: <20231218214442.147385-16-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4721

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
index 20b2ebab6b..ec4cc8b051 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -254,10 +254,10 @@ an entire Linux distribution, including the toolchain, from source.
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


