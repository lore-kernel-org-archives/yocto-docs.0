Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA4FC636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 19:47:04 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.429.1675972014353528444
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 11:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZSVoEJtb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3E9ACFF803;
	Thu,  9 Feb 2023 19:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675972012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P+L6F7zTfcwIiX5p9+s/uni51FtP31WwvrBiioFvV5o=;
	b=ZSVoEJtbpC2icBYLy7rFoCixWJK+IpEWvqlJnuQSgV3gs/Rzsio1obFKy+a2dR3c3n/XkU
	H/8OlPVyx7ZCWoDQc4nlchtzGZms9kxwa9HsJ6iH7PQIR7WhPT0VgOaJpqqcYoFnF3ovgy
	WRbsWcwD31RXeQ/IE/b359fOhDuJcae63aylG3ypwzSXoS5Tmx386jWnvee3K1pxkTbL7V
	stPpJ/9T9Y40eHuafNummD8fIyE3L/6chZ87jWZNDRkxGwuwmW+nRD0rpTso/mjaMB3HTB
	cvJzri0YzRWDl6oDFKu2dUGmj9+jtPcVfWTh5JR9Et9KCr6uvufVL7W1lX3A4g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [langdale] ref-manual: variables.rst: fix broken hyperlink
Date: Thu,  9 Feb 2023 20:46:49 +0100
Message-Id: <20230209194649.177411-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Feb 2023 19:47:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3656

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f17960e0e9..b31408ca95 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7545,7 +7545,7 @@ system and gives an overview of their function and contents.
 
       ``SSTATE_EXCLUDEDEPS_SYSROOT`` is evaluated as two regular
       expressions of recipe and dependency to ignore. An example
-      is the rule in :oe_git:`meta/conf/layer.conf </meta/conf/layer.conf>`::
+      is the rule in :oe_git:`meta/conf/layer.conf </openembedded-core/tree/meta/conf/layer.conf>`::
 
          # Nothing needs to depend on libc-initial
          # base-passwd/shadow-sysroot don't need their dependencies
-- 
2.37.2


