Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F58DC00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.147626.1698153823696526549
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U9vQgS84;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CB3E40016;
	Tue, 24 Oct 2023 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+V1BGY/pVfSilH6RPWMnRfc121+/t3LHQda/wS6SWTY=;
	b=U9vQgS844Zbar959jTC8Ru+K2ygYcJhFyBCe5pBP9kBYYcQr3TKX8zExTnvncoeWN3nBv4
	6iJjIQnOvOXMMQHXr3z1pVVT0hjRSPuZdaMVL5P3INXO4SNUxSiVC4Q4dbw1wEnu4XWYNp
	v9zyp2QExidwaIeawUTWymXyigLlWGWuctEgf4woEn89LEiHgqeIFqe+a+VQxTZ+MRnV+9
	Sw/1Cm5AkycYRAxd7/EOnE081sHL2EqwMg2rkVJhA2DqL5qOLmnh/9p4uX0dA3NLErPzaD
	Dz+QAG6IKbCDlgGcpSMMc7/NWeS6Gwto3U3CttdVuoRUDd/C/ZzkzSG3mnOT1Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	richard.purdie@linuxfoundation.org
Subject: [mickledore][PATCH 09/13] brief-yoctoprojectqs: use new CDN mirror for sstate
Date: Tue, 24 Oct 2023 15:23:14 +0200
Message-Id: <20231024132318.90209-10-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
References: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4470

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Recommended instead of the Yocto Project mirror, because expected
to be faster. Make sure you only set one such mirror.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: richard.purdie@linuxfoundation.org
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 0ccffccc60..df8d75edc2 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -254,7 +254,7 @@ an entire Linux distribution, including the toolchain, from source.
          BB_SIGNATURE_HANDLER = "OEEquivHash"
          BB_HASHSERVE = "auto"
          BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
-         SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
+         SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
 
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
-- 
2.34.1


