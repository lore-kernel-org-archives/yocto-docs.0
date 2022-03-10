Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676F1C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 11:39:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.8494.1646912359516856014
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 03:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m+OJ1Rs5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A49DA1C000A;
	Thu, 10 Mar 2022 11:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646912357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lfSIzcDta7t6+qkTjMwzKsLEe/ItE9T6crsen4l6gPQ=;
	b=m+OJ1Rs50dfm7sAzCe9d2D2kV4wPc664r0wciJMgnKIDxeaXULTH9uOIhnsIuQiJ6Cs7Ms
	LquSfUzNQihjbMTRpgPuSxvuqgFD+j/As5O1KN5UuMsrtPYmzNi47RW21MLQJ+eepDK6S3
	GDw39w9yAGkZICXa4CgkYV+lv/fCNLnE6IKf2k9mUSSg6i+sTPGZL+9J2LQl3Mzt6/ugaQ
	LnJmzfyMA/WWsW1CLSE8jeea0WvwueNi9oXeNzW0ocReSkAduaZsaXf257eAQitnxNXo2K
	b08f2RuWsG186Jg0AwjoAEFGhqlgkrSTNRNQBQUOVfxaVsdsb4DB2ywxz+XaIw==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH V2] dev-manual: details about using firewalls and limiting
 fetch threads
Date: Thu, 10 Mar 2022 12:39:05 +0100
Message-Id: <20220310113905.12144-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16DB01F0D7379E48.32226@lists.yoctoproject.org>
References: <16DB01F0D7379E48.32226@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Mar 2022 11:39:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2580

Fixes [YOCTO #13235]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 1caf953901..72a07a7cff 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -1481,6 +1481,22 @@ compressed suffixes such as ``diff.gz`` and ``patch.bz2``, for example.
 The build system automatically applies patches as described in the
 ":ref:`dev-manual/common-tasks:patching code`" section.
 
+Fetching Code Through Firewalls
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Some users are behind firewalls and need to fetch code through a proxy.
+See the ":doc:`/ref-manual/faq`" chapter for advice.
+
+Limiting the Number of Parallel Connections
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Some users are behind firewalls or use servers where the number of parallel
+connections is limited. In such cases, you can limit the number of fetch
+tasks being run in parallel by adding the following to your ``local.conf``
+file::
+
+   do_fetch[number_threads] = "4"
+
 Unpacking Code
 --------------
 
-- 
2.25.1


