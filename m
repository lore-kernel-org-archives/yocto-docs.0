Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A18C6FA93
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.583.1663955620464157350
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HSvBv+fg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CCF3920005;
	Fri, 23 Sep 2022 17:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpgGBGBJilhZqjL78Wpl5jz4CJHBX89UDO2oKj6I2oQ=;
	b=HSvBv+fgXHJomcn/IE1+Ovnq+L9nqq/pjKGuYNQ7aVdnMgM7RI9yFqE7e7/JPS99iV1htj
	CgIm2Xsal8K7ho24/nn4Jy5KIxvPIZRnDbtb1wexAiWxMvMLVw+uZZlXsV8Jpl+b3zunjM
	o4gfzX4PkkhgM0JNgD8I6rLrQ7C5Aqez0XlrOsrVJ2IBilcMBL9FjMMwQQLzARfMvWJc06
	AiGYbXPpqGSTYWUVaSRdt4SB39400DcoVszSKkbyiKdfuXzOOJerKWLpGwNOihBZxQRqfQ
	FaDyGZWh5Ad2z7F6IDDt0KwXzvfCicorMLbzKjDm5FQJIlAmRhaa0l0m2rGSdg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 18/30] dev-manual: common-tasks.rst: add reference to
 "do_clean" task
Date: Fri, 23 Sep 2022 19:52:07 +0200
Message-Id: <20220923175219.6652-19-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3233

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 8a087850b6..cf4d12f388 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3458,7 +3458,7 @@ Follow these general steps:
    .. note::
 
       All the modifications you make to the temporary source code disappear
-      once you run the ``do_clean`` or ``do_cleanall`` tasks using BitBake
+      once you run the :ref:`ref-tasks-clean` or ``do_cleanall`` tasks using BitBake
       (i.e. ``bitbake -c clean package`` and ``bitbake -c cleanall package``).
       Modifications will also disappear if you use the ``rm_work`` feature as
       described in the
-- 
2.34.1


