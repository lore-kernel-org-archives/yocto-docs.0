Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3C8C001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 07:45:04 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.12402.1691653502867729093
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 00:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n4s3uXAQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56385C0008;
	Thu, 10 Aug 2023 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691653500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9gDoE6/MjTWtJo0WQbx4wAOQ+yYGeIbeUmQ43j5E5K0=;
	b=n4s3uXAQJheiBQRoaDntqdVvWjiS9XD2HPYwSMcI9lgs61Gv0msPjrDTIWi6mfX2v0v59h
	LduMCoHcQYC2FtwhaBEu3gZZ636Amsyg9VkFsZGmZCGviiep6alUS85KGkVRwNz7iIxSci
	SbNXmOMpdl2i3vLGXeb2zuOW1ibCsWRByeROwd9fQW7vvdUWnhDBYNsXX11yKvzj4JfJEK
	rDVeZavtAIYV1HxEtiyHhAJ6aVOv1JgxIa5Sf9c01l6734eIOVtGoocnQKHF1khzXr/C0M
	zzqeuXV42jzAFAtlaP+E7GUn3FjK/4Gp1wT3/4Y/c9ADa0Z1zZo5CcN2hU97/w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH] [kirkstone] dev-manual: wic.rst: Update native tools build command
Date: Thu, 10 Aug 2023 09:44:41 +0200
Message-Id: <20230810074441.962010-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 07:45:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4131

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Requirements list seems to be outdated. It is not possible to follow
instructions for Raw Mode as not all of the native tools are available.
All wic dependencies are gathered under wic-tools package. Some commands
in the instruction already use wic-tools native sysroot, but this
dependency is not specified in the requirements.
Update the command for building native tools to use wic-tools instead
of the seperate packages.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 1ed8156e60..bc1a13f0ab 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5472,7 +5472,7 @@ system needs to meet the following requirements:
 -  You must build several native tools, which are built to run on the
    build system::
 
-      $ bitbake parted-native dosfstools-native mtools-native
+      $ bitbake wic-tools
 
 -  Include "wic" as part of the
    :term:`IMAGE_FSTYPES`
-- 
2.34.1


