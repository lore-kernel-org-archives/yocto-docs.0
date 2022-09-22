Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC06DC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 07:56:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.4626.1663833366379383084
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 00:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UiP8Eny2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E6BEB20009;
	Thu, 22 Sep 2022 07:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663833364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ta4S0L4z4I4Yrz1PFUyrmlFnPw3xwVYPtLKfAwCDELo=;
	b=UiP8Eny2Sm5ro8vEWRnXC09KhT1hHiCed0zbnuKXADYKaol/eLXhsN/PuA+tdNJMSVFUqB
	kZihb+uffZSNwKBagdcJDoE7NajIUNgtIc19ZPC44moHIq0ymxSYZhX/Li/o5bNPsHF7ZW
	LumHdwzihQR0oKbZ2XLdTZspp4FwYZhadxuR62z8isg7wMdO+iuykUUwnAQ4j8Oamgf4pB
	W1RBHTMdjPcxfVQYNFGWZ/IXxGxfYPqXrqyMrAH4eWI5XeTfs3I9BILybFaZIUenRb0YN3
	C5embrR1Ar4Gk/hJ8u4BgJwfEwK2Dt6dTtHN/tehhexF4TEWm7Bq1pDX67bh/Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] ref-manual: variables.rst: refer to BBPATH in the BitBake
 User Manual
Date: Thu, 22 Sep 2022 09:56:00 +0200
Message-Id: <20220922075600.1160944-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 07:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3202

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As reported in [YOCTO #14502], the description of BBPATH in the
Yocto Project Manual is redundant with its description in the
BitBake User Manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>

---

Without this redirection, the references to BBPATH would still
work, as it this the case for terms only definited in the BitBake
User Manual, but BBPATH would no longer appear in the variable index.

This would probably be a bad thing.
---
 documentation/ref-manual/variables.rst | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fe845bf375..f6cc66e2c4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -729,20 +729,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual.
 
    :term:`BBPATH`
-      Used by BitBake to locate ``.bbclass`` and configuration files. This
-      variable is analogous to the ``PATH`` variable.
-
-      .. note::
-
-         If you run BitBake from a directory outside of the
-         :term:`Build Directory`, you must be sure to set :term:`BBPATH`
-         to point to the Build Directory. Set the variable as you would any
-         environment variable and then run BitBake::
-
-                 $ BBPATH = "build_directory"
-                 $ export BBPATH
-                 $ bitbake target
-
+      See :term:`bitbake:BBPATH` in the BitBake User Manual.
 
    :term:`BBSERVER`
       If defined in the BitBake environment, :term:`BBSERVER` points to the
-- 
2.34.1


