Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992D1C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 15:31:34 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.46085.1679499083634760651
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Mar 2023 08:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ksDhvdvp;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 38753240013;
	Wed, 22 Mar 2023 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679499081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B57UzFY2INlob0ITJAm5esUkl8msjyICuDYSZGVrT+s=;
	b=ksDhvdvppMcuGjkulYOnCqO5WlbUllYyCZOqAvE4q8vTOxNdUnhHvYqTXYR0D9odwyXIdM
	fNbiKWd7JE9vdiOdXVl/yIBGH5L+61+gaaw+2DGRQpHq404WGceu/TMXMKXi/volnJBoAt
	Hm1zP+n/xTlUvhAJIm3g9zSCcXaFY9gp5wHihgFHpBUxTfK2ids2QHXmRFBxuthoAdvjwW
	VcHC4oacxdeWwGfz2LPj6/RmPfyEcEM3wEUCVEgiFeBESB+y1DDgjgRbjuoMTdOIQ7/u/E
	8CvzwyX/mno4CFh6TPJIsUweEnQTXWNFmdQgT8UBiyNG+xew3jEi3VdHiJ2Nhg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2] ref-manual: release-process.rst: update testing section
Date: Wed, 22 Mar 2023 16:31:19 +0100
Message-Id: <20230322153119.127443-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <F93D5EC7-ED2A-418C-9E48-77495A1A55F9@arm.com>
References: <F93D5EC7-ED2A-418C-9E48-77495A1A55F9@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Mar 2023 15:31:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3814

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Remove note to section not carrying information about
  special hosts tools for oe-selftest

- Add links to mentioned repositories

CC: Ross Burton <ross.burton@arm.com>

---

Changes in V2:
- Stop mentioning the "ross/mut" branch as suggested by Ross Burton
---
 documentation/ref-manual/release-process.rst | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index fa057e055c..a9202a10e4 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -161,25 +161,17 @@ consists of the following pieces:
    ``oe-selftest`` can run all tests by default or can run selected
    tests or test suites.
 
-   .. note::
-
-      Running ``oe-selftest`` requires host packages beyond the "Essential"
-      grouping. See the :ref:`ref-manual/system-requirements:required packages for the build host`
-      section for more information.
-
 Originally, much of this testing was done manually. However, significant
 effort has been made to automate the tests so that more people can use
 them and the Yocto Project development team can run them faster and more
 efficiently.
 
-The Yocto Project's main Autobuilder (&YOCTO_AB_URL;)
-publicly tests each Yocto Project release's code in the
-:term:`OpenEmbedded-Core (OE-Core)`, Poky, and BitBake repositories. The testing
-occurs for both the current state of the "master" branch and also for
+The Yocto Project's main Autobuilder (&YOCTO_AB_URL;) publicly tests each Yocto
+Project release's code in the :oe_git:`openembedded-core </openembedded-core>`,
+:yocto_git:`poky </poky>` and :oe_git:`bitbake </bitbake>` repositories. The
+testing occurs for both the current state of the "master" branch and also for
 submitted patches. Testing for submitted patches usually occurs in the
-"ross/mut" branch in the ``poky-contrib`` repository (i.e. the
-master-under-test branch) or in the "master-next" branch in the ``poky``
-repository.
+in the "master-next" branch in the :yocto_git:`poky </poky>` repository.
 
 .. note::
 
-- 
2.34.1


