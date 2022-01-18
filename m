Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BB9C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 13:08:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.12247.1642511299652502143
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 05:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C03A6E0003;
	Tue, 18 Jan 2022 13:08:17 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-3.5: mention task specific network access
Date: Tue, 18 Jan 2022 14:07:52 +0100
Message-Id: <20220118130752.3463023-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: 
 <CANNYZj83eY1hkzt-OGyfdxKSsvoQAedVJ4b1QSmspWfdnNRMrw@mail.gmail.com>
References: 
 <CANNYZj83eY1hkzt-OGyfdxKSsvoQAedVJ4b1QSmspWfdnNRMrw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jan 2022 13:08:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2422

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-3.5.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index bd807eb8c7..df15487b10 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -22,6 +22,18 @@ Recipe changes
   recipes now need to use ``;protocol=https`` at the end of GitHub
   URLs. The same script as above can be used to convert the recipes.
 
+- Network access from tasks is now disabled by default on kernels which support
+  this feature (on most recent distros such as CentOS 8 and Debian 11 onwards).
+  This means that tasks accessing the network need to be marked as such with the ``network``
+  flag. For example::
+
+     do_mytask[network] = "1"
+
+  This is allowed by default from ``do_fetch`` but not from any of our other standard
+  tasks. Recipes shouldn't be accessing the network outside of ``do_fetch`` as it
+  usually undermines fetcher source mirroring, image and licence manifests, software
+  auditing and supply chain security.
+
 - The :term:`TOPDIR` variable and the current working directory are no longer modified
   when parsing recipes. Any code depending on that behaviour will no longer work.
 
-- 
2.25.1


