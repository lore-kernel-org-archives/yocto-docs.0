Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24158C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 17:40:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14625.1638553211183431712
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 09:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194,
 mailfrom: foss@0leil.net)
Received: from localhost.localdomain (84-115-236-2.cable.dynamic.surfer.at
 [84.115.236.2])
	(Authenticated sender: foss@0leil.net)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPA id E1AF940004;
	Fri,  3 Dec 2021 17:40:08 +0000 (UTC)
From: Quentin Schulz <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] docs: dev-manual: common-tasks: highlight creating your own
 layer is not required
Date: Fri,  3 Dec 2021 18:39:55 +0100
Message-Id: <20211203173955.77512-1-foss@0leil.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 17:40:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2223

Three's been some feedback saying that people actually missed that
paragraph and thought creating the layer by hand was the only way to do
it instead of leveraging bitbake-layers create-layer tool.

Let's try to make it a bit more obvious one does not need to create the
layer by hand by putting the paragraph into a note.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/dev-manual/common-tasks.rst | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 3eead147a..2f5a02f4c 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -24,15 +24,17 @@ section in the Yocto Project Overview and Concepts Manual.
 Creating Your Own Layer
 -----------------------
 
-It is very easy to create your own layers to use with the OpenEmbedded
-build system, as the Yocto Project ships with tools that speed up creating
-layers. This section describes the steps you perform by hand to create
-layers so that you can better understand them. For information about the
-layer-creation tools, see the
-":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
-section in the Yocto Project Board Support Package (BSP) Developer's
-Guide and the ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
-section further down in this manual.
+.. note::
+
+   It is very easy to create your own layers to use with the OpenEmbedded
+   build system, as the Yocto Project ships with tools that speed up creating
+   layers. This section describes the steps you perform by hand to create
+   layers so that you can better understand them. For information about the
+   layer-creation tools, see the
+   ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
+   section in the Yocto Project Board Support Package (BSP) Developer's
+   Guide and the ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   section further down in this manual.
 
 Follow these general steps to create your layer without using tools:
 
-- 
2.33.1


