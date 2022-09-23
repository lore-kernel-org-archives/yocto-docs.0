Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B20BC6FA92
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:59 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.588.1663955637368715560
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LPj759OR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C612B20007;
	Fri, 23 Sep 2022 17:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KYdSkaImXj/M6KmzjUkQI+CZNtfBajfA0Rs/dUX1DB0=;
	b=LPj759OR4pcGymjxHo+NNEKXcZHR7XSCdhP4QZDFymHqrhcnACafGe+Pdir/GiYetL0hZx
	YRMpCD1ZmIffycrJ+p7LYMAtB8lT/nt0T2m2SAI9c25Fj0p0t3ptwbeK7KNsASfI/1v/zW
	GDTG6OY8uI8ypG6fga3MHM2s5PrdwyLNTuX/ebx0FdCAcXKS31aVq5Rqp4M6Tl++9JU721
	bH3KoCSTzGiBt9pXtnS9d0gx7I1fcyQ6W+No8PWY+CKrbK7J5JKE73R8S+fCEXyGOLKBSa
	I8taNFQsOv8uGleqaziuFPxhFQpKNJM1K4FjZS8qrySwtREokMGiewXbcoRqdQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 28/30] ref-manual: tasks.rst: add reference to the
 "do_kernel_metadata" task
Date: Fri, 23 Sep 2022 19:52:17 +0200
Message-Id: <20220923175219.6652-29-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3243

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 29a135beb0..ce900119ef 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -719,7 +719,7 @@ information on this configuration tool.
 
 Collects all the features required for a given kernel build, whether the
 features come from :term:`SRC_URI` or from Git
-repositories. After collection, the ``do_kernel_metadata`` task
+repositories. After collection, the :ref:`ref-tasks-kernel_metadata` task
 processes the features into a series of config fragments and patches,
 which can then be applied by subsequent tasks such as
 :ref:`ref-tasks-patch` and
-- 
2.34.1


