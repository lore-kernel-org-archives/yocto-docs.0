Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F65FA3744
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:19:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.4620.1666952391835357278
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 03:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zhzfh34c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DDEF61C0003;
	Fri, 28 Oct 2022 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666952390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuHY8mkAPixWDtYgtRufyW+Hon2L4HPLKiCw0ZUwxiQ=;
	b=Zhzfh34cUjbzN4kK7QyyL0A21zL4c23bcUvx+AcX3lyeW3d29T7wdYZm90A4nfu7ylWQEi
	thGtiK9y3nzsVvMxsPDwJoX7obPlBdGFk8X6ZEdFlRecD1lM7va+FCMgeUlY/izFzlvsen
	A+0JLpDd8SbRYMh24BVMI9iarYR5nCqVe5TLC5rZKU1fpk8uwVEGCtiZz5Bq8RJAwOkE7M
	VuGz+FYHoZk95GIE9LFvbDuCQZpqKXX/xlb+RRgt/SsETTtjOm8foHYr6OCvLW/NbA/5xm
	FTSfrHlK8Zh3AoCI2opCJCTs5Uw9ez37eVSoB4wkq3+inzw6lGC31sN2OKiEUw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/5] ref-manual: classes.rst: expand documentation of create-spdx class
Date: Fri, 28 Oct 2022 12:19:38 +0200
Message-Id: <20221028101939.93195-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
References: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 10:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3435

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index cce0269b9a..621cf9c8b6 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -373,8 +373,24 @@ support.
 ``create-spdx.bbclass``
 =======================
 
-The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for automatically creating
-SPDX SBoM documents based upon image and SDK contents.
+The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for
+automatically creating :term:`SPDX` :term:`SBOM` documents based upon image
+and SDK contents.
+
+This class is meant to be inherited globally from a configuration file::
+
+   INHERIT += "create-spdx"
+
+The output files are generated in ``tmp/deploy/spdx`` under the
+:term:`Build Directory`.
+
+The exact behaviour of this class, and the amount of output can be controlled
+by the :term:`SPDX_PRETTY`, :term:`SPDX_ARCHIVE_PACKAGED`,
+:term:`SPDX_ARCHIVE_SOURCES` and :term:`SPDX_INCLUDE_SOURCES` variables.
+
+See the description of these variables and the
+":ref:`dev-manual/common-tasks:creating a software bill of materials`"
+section in the Yocto Project Development Manual for more details.
 
 .. _ref-classes-cross:
 
-- 
2.34.1


