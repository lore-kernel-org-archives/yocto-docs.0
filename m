Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88C9C678D5
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 15:09:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.19813.1677251364924781799
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 07:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M4LXipML;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6571CC0003;
	Fri, 24 Feb 2023 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677251363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dNaLcRDgyL4dXjD3eLCym4x3MaJU6pHv4A5QPWTB7FY=;
	b=M4LXipMLxAg8vTEAvCNmTGoFgzpJQpj6kHAED3PbQL9LD/Crpxp/tReF23CMoxtVoSw7Ct
	ij/Aywr/Zrn53jXuDtCR4DeqWWb8l1U3wRUAS09C+MKmaBhgdLbYfVZl7GCo0xs6NkVGr5
	Dvw94EOzgwawGh/d6UbKz5C+B3S6zr7wuKMCCABBKAVX51dodUefJxuXssVLPyxNzLFnGB
	NK8LhDzP2Fl033WQF0LdObec4ui90D6MktFmsFdFxM2SlRaN5yrZuJW84jk3eYFEkcWdxJ
	oSTTefbDOu3y4KeCFvrs++MfPVX4GPeUVurpoHISrg/oSI2C0oVaupep61KKgQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Yoann CONGAL <yoann.congal@smile.fr>,
	Fawzi KHABER <fawzi.khaber@smile.fr>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] [langdale] ref-manual: update DEV_PKG_DEPENDENCY in variables
Date: Fri, 24 Feb 2023 16:09:15 +0100
Message-Id: <20230224150915.108340-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Feb 2023 15:09:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3737

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Fawzi KHABER <fawzi.khaber@smile.fr>

Since release 4.1, the variable DEV_PKG_DEPENDENCY sets RRECOMMENDS instead
of RDEPENDS for the -dev package on the main package, this change fixes the
documentation to match the actual state

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
---
 documentation/ref-manual/variables.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b31408ca95..2f12677a34 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1844,9 +1844,9 @@ system and gives an overview of their function and contents.
       variable.
 
    :term:`DEV_PKG_DEPENDENCY`
-      Provides an easy way for recipes to disable or adjust the runtime
-      dependency (:term:`RDEPENDS`) of the ``${PN}-dev`` package on the main
-      (``${PN}``) package, particularly where the main package may be empty.
+      Provides an easy way for recipes to disable or adjust the runtime recommendation
+      (:term:`RRECOMMENDS`) of the ``${PN}-dev`` package on the main
+      (``${PN}``) package.
 
    :term:`DISABLE_STATIC`
       Used in order to disable static linking by default (in order to save
-- 
2.37.2


