Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2C4C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 15:53:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.2.1643385224024055606
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 07:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P3fS8PAX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8F353E0010;
	Fri, 28 Jan 2022 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643385220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uTimYyjCnUl7L5qV0utU8oW24ckboqSIPMBqucvrnsY=;
	b=P3fS8PAXeZRoFMyDAKSUWBO9mTHMYyzUd22XWPcCJAuGfZochVrQEZP4KdLix/EIMjOPuu
	wH/JZcf47nD9okTYDUgTGqs8gFDaTRn9y5VqP+oSdBXSUVF5LbWCs8XVzDFtBGAcBrvbl1
	Chsp/l9LL4AmEI1VticKUedLfKSq6YTIzy6oQM2fgy167MpgXpjN/D/9QiExoQbFkzIa8u
	OC0/E3RIybuPRX6xf2oxgK0eKyx1mHadsEU5NbbU5Wp6Mu4ELL2o94WjAPv0Ql1+scnP2b
	J0nnUAslnKV66pimgQNRhmpEuGcfMFRg9j04eaABZ0+m9JuX/SVs676XlDxp2A==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: add usage details about ccache.bbclass
Date: Fri, 28 Jan 2022 16:53:38 +0100
Message-Id: <20220128155338.2246251-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Jan 2022 15:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2448

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index d9065b3619..949217bf42 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -274,10 +274,15 @@ sstate re-use. In order to function, this class requires the
 
 The ``ccache`` class enables the C/C++ Compiler Cache for the build.
 This class is used to give a minor performance boost during the build.
-However, using the class can lead to unexpected side-effects. Thus, it
-is recommended that you do not use this class. See
-https://ccache.samba.org/ for information on the C/C++ Compiler
-Cache.
+
+See https://ccache.samba.org/ for information on the C/C++ Compiler
+Cache, and the :oe_git:`ccache.bbclass </openembedded-core/tree/meta/classes/ccache.bbclass>`
+file for details about how to enable this mechanism in your configuration
+file, how to disable it for specific recipes, and how to share ``ccache``
+files between builds.
+
+However, using the class can lead to unexpected side-effects. Thus, using
+this class is not recommended.
 
 .. _ref-classes-chrpath:
 
-- 
2.25.1


