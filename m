Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D13EC6FA86
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.580.1663955611440910526
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FbVNcjOO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2820E40005;
	Fri, 23 Sep 2022 17:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1Y2MuFtzJTPox4ct3yzbXKmkoGkwlNxbUPHgGZTqtg=;
	b=FbVNcjOO/LUrpEIyZvCvtJNiB20o3pY504EiaXKKquY7oXgbHmBt+eJEx9rtSCTevHNpHZ
	RCpEfxJxrkAxt8wsPBnCu0VmUifpx0wZ+2/kgIQmyJC25LJi+bggTpo6+XOVrADZ4764HD
	PfA/0belFSOlh7g86N2wjVUpQFy3C9GjXzoT9IA0qqMkkqyPRhRiq7J6X3RjBWccM/dy5j
	vcgzVg6cvGoCjygrX/jOSwEXnCpcrNrR46gj+GZwrORdjcKYnjznQ2gq0+AZuR/1dNpYxS
	1xmFhF1Sy6qolCYzjN5x65Jx/58d/JSlKVwsBnwth00iSw4roltFnjs8n8yn7g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 13/30] ref-manual: variables.rst: add reference to
 "do_populate_lic" task
Date: Fri, 23 Sep 2022 19:52:02 +0200
Message-Id: <20220923175219.6652-14-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3228

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 272673d90b..e71c3b6b57 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6709,7 +6709,7 @@ system and gives an overview of their function and contents.
       A list of shared state tasks added to the extensible SDK. By default,
       the following tasks are added:
 
-      - do_populate_lic
+      - :ref:`ref-tasks-populate_lic`
       - :ref:`ref-tasks-package_qa`
       - do_populate_sysroot
       - :ref:`ref-tasks-deploy`
-- 
2.34.1


