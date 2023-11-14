Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EE2C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 16:50:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.17634.1699980594491195085
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 08:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WeeSGYyR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E30D16000B;
	Tue, 14 Nov 2023 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699980592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=14H1OSrJDVvnzygTwYBD4epAB0ag5onVr54TwhqC99M=;
	b=WeeSGYyRF3Bwg0cg/dqLDcdHayZsTqeR60psb+q35LBlhh6oxdA5s5vpD6bvB/MJCmcYPa
	ppDGb2eFrECzuJMeii6ZN4Ly8KdD2FqIliBVMxNVW4sQ78bQmfHb9r4a9DoyOu+/JycRFN
	MC28tHpBqmNjBUE+4rPnui4np8pg/ZHuquBtXPJPf8oA0fIHGDO2PRUb4DjyBygde/d8+f
	Z+6DpdCwSyh0Lb3Jh8tVtKdJhPXgalxcWNgYP/rf6TkODQ6v8y+hURX4Hg9Klymp+WLTcC
	hAJ9BwDCr/6W4iRRmo3Dgs6zNLqrBVWSEWoqYg4KFcmjEf01IjzoquU8ySU9KA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 3/7] ref-manual: variables: add RECIPE_MAINTAINER
Date: Tue, 14 Nov 2023 17:49:38 +0100
Message-Id: <20231114164942.133472-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
References: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 16:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4623

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5a34ea7856..a75581f2fd 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6463,6 +6463,22 @@ system and gives an overview of their function and contents.
       BitBake User Manual for additional information on tasks and
       dependencies.
 
+   :term:`RECIPE_MAINTAINER`
+      This variable defines the name and e-mail address of the maintainer of a
+      recipe. Such information can be used by human users submitted changes,
+      and by automated tools to send notifications, for example about
+      vulnerabilities or source updates.
+
+      The variable can be defined in a global distribution :oe_git:`maintainers.inc
+      </openembedded-core/tree/meta/conf/distro/include/maintainers.inc>` file::
+
+          meta/conf/distro/include/maintainers.inc:RECIPE_MAINTAINER:pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
+
+      It can also be directly defined in a recipe,
+      for example in the ``libgpiod`` one::
+
+          RECIPE_MAINTAINER = "Bartosz Golaszewski <brgl@bgdev.pl>"
+
    :term:`RECIPE_NO_UPDATE_REASON`
       If a recipe should not be replaced by a more recent upstream version,
       putting the reason why in this variable in a recipe allows
-- 
2.34.1


