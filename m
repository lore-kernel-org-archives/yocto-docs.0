Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E95CC77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:49:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.1814.1683038954326780763
 for <docs@lists.yoctoproject.org>;
 Tue, 02 May 2023 07:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d1YdDLj8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 543691C0007;
	Tue,  2 May 2023 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683038952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QRnVTwI4tkTuFH4M9BDqqs+9fgyRlus8HdlxAhBwI14=;
	b=d1YdDLj8vvhLhQU6EO6PP8CsX4JPrIUkQS3xFZirejJ2ul4t/eNsaZZU0RH1PCuKrHJIBC
	OcNmUF7FcaMebWz1rpkXmFlAi5fAKwa1OBTkq3Miz09O153QSfsBJgor8JX6LEMOnf0M0o
	Rp80MvDJKvOnvYH28trqlZOQuIiWAN6fzbMb9NAmKpXvOY1J92wI568ODQgpvPk9fdhZWa
	nsrskhTMIkCLhnrqJriifBzOxljbdVwAl83+uaiOHs4pMN+wK4hP5xubvHZ0OmRugIlkfW
	tOdu/YcoEUcqYqgJKgudbyKGqCmSjlF4MOp7qtrDmFYXqFaly9NWjP0v2jG3CA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] ref-manual: variables.rst: don't mention the INIT_MANAGER "none" option
Date: Tue,  2 May 2023 16:49:06 +0200
Message-Id: <20230502144906.2449915-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 May 2023 14:49:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3890

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As it is mainly used for internal purposes, so not necessarily useful
for regular users.

OE-core "nodistro" uses it as a fallback to the default setting.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/variables.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4dc67a1324..574af2c2f9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3962,7 +3962,6 @@ system and gives an overview of their function and contents.
       -  ``sysvinit``
       -  ``systemd``
       -  ``mdev-busybox``
-      -  ``none``
 
       With ``sysvinit``, the init manager is set to
       :wikipedia:`SysVinit <Init#SysV-style>`, the traditional UNIX init
@@ -3977,10 +3976,6 @@ system and gives an overview of their function and contents.
       and lightest solution, and probably the best choice for low-end systems
       with a rather slow CPU and a limited amount of RAM.
 
-      With ``none``, the init manager is also set to ``sysvinit``. This is the
-      default setting in OpenEmbedded-Core. This option also selects the
-      :wikipedia:`udev <Udev>` device manager.
-
       More concretely, this is used to include
       ``conf/distro/include/init-manager-${INIT_MANAGER}.inc`` into the global
       configuration. You can have a look at the
-- 
2.34.1


