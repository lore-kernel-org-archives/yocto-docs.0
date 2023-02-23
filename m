Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD44C6379F
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 15:37:50 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.13575.1677166662756530957
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 07:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CRnF8bSN;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 11AE4240003;
	Thu, 23 Feb 2023 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677166660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2NC5rOguGgOzWPPX3mJet35IxuDwe/u3pJ4Hj8rwCs=;
	b=CRnF8bSNXmuIfbt4YWKhTAymvQDZHU3QQR4pcleLHzyGPcb24cbn8siqcX21ZUw0mg1PJX
	pvstDmTLVAYOAQKHjUXymnSFYBoq8/izSMRe4s5YbSwzeaK4zGB6go7tfhwb1H1XHluv73
	gzZN0PqNQ+3bUP4t6iakgu88F+hm68gEvMzmedjamifnytO7Iw0uNqa2BNZHlh+FmHOt56
	fM1IoZQ84X7a3DnEVmqktNQsitR3HCa3+jD9TA7Y7jW0+zhQLrZEHbWxDyUPrCdVrfKS+5
	iKdYdZakIkzK7fIqJxGdIHyc37f5VHOGQSv675P300tVpKbGMT6bkF+e5sx7cQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] dev-manual: new-recipe.rst: add references to subsections in Examples section
Date: Thu, 23 Feb 2023 16:37:29 +0100
Message-Id: <20230223153729.2492175-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230223153729.2492175-1-michael.opdenacker@bootlin.com>
References: <20230223153729.2492175-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 15:37:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3727

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Making it possible to jump right away to the desired example

Rename a section title to make it more suitable for a link title.

Using short references (`Section Name`_) instead of
:ref:`dev-manual/new-recipe:Section Name`) as we are in the same
document.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 9f00ac198f..d8cedbf7a4 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -361,7 +361,7 @@ and searches specific directories in a certain order:
 ``files``. The directories are assumed to be subdirectories of the
 directory in which the recipe or append file resides. For another
 example that specifies these types of files, see the
-":ref:`dev-manual/new-recipe:building a single .c file package (hello world!)`" section.
+"`building a single .c file package`_" section.
 
 The previous example also specifies a patch file. Patch files are files
 whose names usually end in ``.patch`` or ``.diff`` but can end with
@@ -1167,20 +1167,20 @@ Examples
 To help summarize how to write a recipe, this section provides some
 recipe examples given various scenarios:
 
--  Building packages from a single local file
+-  `Building a single .c file package`_
 
--  Building a Makefile-based package
+-  `Building a Makefile-based package`_
 
--  Building an Autotooled package
+-  `Building an Autotooled package`_
 
--  Building a Meson package
+-  `Building a Meson package`_
 
--  Splitting an application into multiple packages
+-  `Splitting an application into multiple packages`_
 
--  Adding binaries to an image
+-  `Packaging externally produced binaries`_
 
-Building a Single .c File Package (Hello World!)
-------------------------------------------------
+Building a Single .c File Package
+---------------------------------
 
 Building an application from a single file that is stored locally (e.g. under
 ``files``) requires a recipe that has the file listed in the :term:`SRC_URI`
-- 
2.37.2


