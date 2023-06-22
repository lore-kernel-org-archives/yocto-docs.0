Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FE6C001B0
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:51:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.16802.1687452685091895348
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 09:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BEC91BF209;
	Thu, 22 Jun 2023 16:51:23 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 4/4] docs: ref-manual: terms: fix incorrect note directive
Date: Thu, 22 Jun 2023 18:51:06 +0200
Message-ID: <20230622-typos-202306-v1-4-68489d7f23f2@theobroma-systems.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
References: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 16:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4031

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The directive is followed by two colons and not only one, so let's add
the missing one.

c.f. https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#directive-note

Fixes: 952c7e6dee49 ("manuals: improve initramfs details")
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/terms.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index bdb4f934c..b5d5f1dbd 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -224,7 +224,7 @@ universal, the list includes them just in case:
       having to duplicate accessed file contents in the file cache in RAM,
       as for any block device.
 
-      .. note:
+      .. note::
 
          As far as bootloaders are concerned, :term:`Initramfs` and "initrd"
          images are still copied to RAM in the same way. That's why most

-- 
2.41.0


