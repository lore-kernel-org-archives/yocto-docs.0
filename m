Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7846C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 17:23:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.166.1677777826180745786
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 09:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hxb8dwNn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A93B560002;
	Thu,  2 Mar 2023 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677777823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Tl76dkzCtidNmE5I/9xqqT3PTJIsy/qc8zVeT8TUDc=;
	b=Hxb8dwNnBH3VvEgLCqA5+Z63cDd+PTfMSHnXS0L7meaFL8mewIv9WCBwMlRsByTBzRpZUV
	MN4c8nttP49BDQ7LhZ6HWmj7PHd38Ny/SdrNRqbNc60kqgDcn7/GJEIY82mdaA4js9PPGb
	KFyu6Kbej3x1kzLsvS/RCUiOmRrw/I9hnz4l7emMT9L7On7da/iB+10spgVmdRB2mpsETr
	ddso4POCUd5RLGUJ7dD+m0eGxAdf6gnZ4QZNs5yC6t68VeeNKgLE+HkITKT773kVBfN40r
	TPl79slmu6Ul2W04mwhI7ihpbsVQIwnAV1jD4ofVZgbT3HM+741aur50rt5QVg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] overview-manual: add missing link to BitBake User Manual
Date: Thu,  2 Mar 2023 18:23:41 +0100
Message-Id: <20230302172341.478721-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Mar 2023 17:23:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3779

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 4cee4bb169..a7a0efd6e9 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -680,7 +680,7 @@ closer look at each of those areas.
 .. note::
 
    Documentation for the BitBake tool is available separately. See the
-   BitBake User Manual
+   :doc:`BitBake User Manual <bitbake:index>`
    for reference material on BitBake.
 
 Source Fetching
-- 
2.37.2


