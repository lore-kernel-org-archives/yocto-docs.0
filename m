Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E511C6379F
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 09:21:38 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.6763.1677144088619023986
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 01:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ExBjVbwv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 06C2B240004;
	Thu, 23 Feb 2023 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677144086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IM+U7uyjbfjEPjUYGeV3PeaXwZ6laGZX4s+9Y2qdUo8=;
	b=ExBjVbwvIjXf7ldYJO900JvYLkJm6V2KscySlSbkSqARHfYJNB7dbPR3s9UhCDkfkNPKEm
	JVUG7dPCgM1lbxa06HziY6UvHsfSv4sjZD6K+0KGQgnmC2sYwmEotu8BGHOz6hECybTJ+E
	5a4JZDtSoE1lbw+GVHpuHQGJ45jHxdR6oyb6hwyuhsnzGjnA1qiVTQntX5vtud0q2tcbRD
	++kMNXW1i2qmyQVfNWtVHSgRRyi+LfzDVNT8/RlaCkLjhDbuTqTUvkoJr6PJvhbPLjnmQx
	4gWJg/PSpWeuRRGtIY4tc6uDBv/Er+536PfwOoWYBXO1axS64zA4FsMdQha50A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] ref-manual: system-requirements.rst: update supported distros
Date: Thu, 23 Feb 2023 10:21:22 +0100
Message-Id: <20230223092122.200648-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 09:21:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3720

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Syncing with meta-yocto/meta-poky/conf/distro/poky.conf

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/system-requirements.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 3cd0894687..38d4aaf5a7 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -42,18 +42,20 @@ Currently, the Yocto Project is supported on the following distributions:
 
 -  Ubuntu 22.04 (LTS)
 
--  Fedora 34
+-  Fedora 36
 
--  Fedora 35
+-  Fedora 37
 
--  AlmaLinux 8.5
+-  AlmaLinux 8.7
 
--  Debian GNU/Linux 10.x (Buster)
+-  AlmaLinux 9.1
 
 -  Debian GNU/Linux 11.x (Bullseye)
 
 -  OpenSUSE Leap 15.3
 
+-  OpenSUSE Leap 15.4
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
-- 
2.37.2


