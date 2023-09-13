Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68248EDEC70
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:51:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.566.1694616666685098204
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 07:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=chAzQNnk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF840E000E;
	Wed, 13 Sep 2023 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694616664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fyc/cw5pn7WECSLZx3/+p+JS31lH+4OHnRol7aGuu8M=;
	b=chAzQNnkwIp1xMIBPHVIRW8cALNp7YrZ3yJKZ7ZE3NlK8LRAynWzNdb/CSMu7DBYMjr3lz
	m4gVHJwkMJz1CXjXwhNAbAEjJLBCCzwfjWmCi2WLF9RtJT68GhqmiFbbZwAMB8dIXu5AI7
	7l6Ycj1ejsTP3HWjqbhzKwkNCY5PECkLqcTCEjKNnkn7wlULML9iTsk+WA4MHOqjbT5Qby
	zNXbQWIQ48WL0dNn5dqZvvHcJ8P1LcZgy7/c/nefArXWBtgDPO5WOfr5LxLu2DQ/r4hTB6
	eXcY5d0pXLFTHNn4ZNvSyxLKiABJ6Cr90ihvBe4ZQ3xkl+EwGnn6o563dcOXjg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] dev-manual: licenses: update license manifest location
Date: Wed, 13 Sep 2023 16:50:56 +0200
Message-Id: <20230913145057.3100143-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Sep 2023 14:51:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4215

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Fix broken markup (wasn't displaying properly)
- Update the path to the directory containing license information
- Fix typo later in the document

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/licenses.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index e3f0aa9dc1..f28baf57d1 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -317,7 +317,8 @@ audit all artifacts to ensure completeness.
 .. note::
 
    The Yocto Project generates a license manifest during image creation
-   that is located in ``${DEPLOY_DIR}/licenses/``\ `image_name`\ ``-``\ `datestamp`
+   that is located in
+   ``${DEPLOY_DIR}/licenses/<image-name>-<machine>.rootfs-<datestamp>/``
    to assist with any audits.
 
 Providing the Source Code
@@ -435,7 +436,7 @@ with source as defined by the GPL and other open source licenses.
 Providing Compilation Scripts and Source Code Modifications
 -----------------------------------------------------------
 
-At this point, we have addressed all we need to prior to generating the
+At this point, we have addressed all we need prior to generating the
 image. The next two requirements are addressed during the final
 packaging of the release.
 
-- 
2.34.1


