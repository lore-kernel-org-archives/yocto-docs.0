Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC708CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:11:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.214356.1697548287847348352
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mXlT67UV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5174B1C000C;
	Tue, 17 Oct 2023 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697548285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+V1BGY/pVfSilH6RPWMnRfc121+/t3LHQda/wS6SWTY=;
	b=mXlT67UVBPIicsK/aTLFx9p0vHJrjvpSg20jNVyczxXUOPTx9yP8CbNlJ4TdSIH3GicqtN
	7jCz/7QRA6VMT6hz8I170lVzq+8E6RCkgI2KubXa9Ym4U6xonjdTFpPUaws+7HQfGdIaMj
	ASLgMIdASvF1JbOLqMATORFPkGdEhlQQHDos5hJnxAtQGwQGDqyJzSfpPCPCGAa2Mt4rih
	4sIKkm7zkKe5LohWH/LAlv8ULuh2HLJ5my3259BGjlp7AWkhV9c6mbsK9UWWTG5YsOqz/t
	mZvJ8LwOaMOHJmKh56D44/iftVb8T17ydFAtutKiQ1xTFi91NkUZ6zg/4usuyw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	richard.purdie@linuxfoundation.org
Subject: [PATCH] brief-yoctoprojectqs: use new CDN mirror for sstate
Date: Tue, 17 Oct 2023 15:11:22 +0200
Message-Id: <20231017131122.291053-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:11:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4400

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


