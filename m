Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E0FECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 12:48:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.5827.1663764510435482231
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 05:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TZcR9pbV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B24D9E0009;
	Wed, 21 Sep 2022 12:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663764507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=asTl8pPAThyoQHKdiZ2/S2x2Ct4KbBbwUqKBhRyR6Wg=;
	b=TZcR9pbVETzMkTE9CbetrP0hHMGnujwct0sxW8EXVWrSM94AaU+5bGmX+35rl1KkZCgnmn
	m6NvG3ICkgCwPRord4jg9J5cawpCnplOrNPzyp1LDZC//YxMzU9n4NPncq2sWiTL8ubkjE
	lE7YEaOAhsXuOtV1/emxW1nAf9035uGGzOQKJmlOSvm/3unZ45cx/IR4AyjfEYSKpxxCRq
	c3idH0V6QXOk/C7IkgRfqFjsE8OEYV6wlUpW0x1lNmZ++x/9WVM53tw9AykXM3ypiOO15w
	Ao8M52xY2c8dGmRQwxM/Vfot0g7xl88RZ7khLoKWPLGZEfYkoTIrY4gx59xpLQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: common-tasks.rst: refer to Python functions in
 BitBake manual
Date: Wed, 21 Sep 2022 14:48:21 +0200
Message-Id: <20220921124821.105959-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Sep 2022 12:48:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3199

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 837824be38..4c52609e5c 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3595,6 +3595,9 @@ functions::
    pydevshell> bb.build.exec_func("do_unpack", d)
    pydevshell>
 
+See the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:functions you can call from within python`"
+section in the BitBake User Manual for details about available functions.
+
 The commands execute just as if the OpenEmbedded build
 system were executing them. Consequently, working this way can be
 helpful when debugging a build or preparing software to be used with the
-- 
2.34.1


