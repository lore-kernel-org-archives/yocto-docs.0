Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C65C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 07:38:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.12335.1691653100168221760
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 00:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lC+tguCx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72DBD2000C;
	Thu, 10 Aug 2023 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691653097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IlCzMtsDr3pt7S8LKvsnBTFpmPf7V4xe7IeHv7pmMTc=;
	b=lC+tguCxHa62R8C6EDMfuxyj/IgPHoFvADtXiPDZD93tL2WsouFMESe7yb4PSv+jxOuWZH
	k7dhnj7iT+3PmymUUA4D3+pxnTXrXiypBrTvmJ6lshV5T/4/dv9NFPJ+EgAYLfO7cyl2Ue
	18/X/uqpNtIXtICr/Ok9AAmB4Thpe1fC40h9Wu31olsq7oB15RplCotGQT04YK9NS3eSLu
	So76cZ9EKxFbwIWjZm/2IjDl0fG0x253p/ewiNQeSooK9cDzkHAmmWsx43LIb8vDs6fWAI
	CTUWbxP6YCN1GIg3hiMjf7mDy5m/tiN4AYjdhj+zkcqS5WZ0PGxiG4F2SQODNg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH] [mickledore] dev-manual: wic.rst: Update native tools build command
Date: Thu, 10 Aug 2023 09:38:13 +0200
Message-Id: <20230810073813.961376-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 07:38:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4129

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Daniel Semkowicz <dse@thaumatec.com>

Requirements list seems to be outdated. It is not possible to follow
instructions for Raw Mode as not all of the native tools are available.
All wic dependencies are gathered under wic-tools package. Some commands
in the instruction already use wic-tools native sysroot, but this
dependency is not specified in the requirements.
Update the command for building native tools to use wic-tools instead
of the seperate packages.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/wic.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 2a4408cdb0..664f07a212 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -92,7 +92,7 @@ system needs to meet the following requirements:
 -  You must build several native tools, which are built to run on the
    build system::
 
-      $ bitbake parted-native dosfstools-native mtools-native
+      $ bitbake wic-tools
 
 -  Include "wic" as part of the
    :term:`IMAGE_FSTYPES`
-- 
2.34.1


