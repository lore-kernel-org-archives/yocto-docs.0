Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267FAC76195
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 20:39:09 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.25918.1679431146867490353
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 13:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PgfuetTO;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9F822240005;
	Tue, 21 Mar 2023 20:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679431144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9ZWwwSLWzGDkoIzRoNGhHs425BONlV6cCpJzOI0Uq5k=;
	b=PgfuetTOF9XRr74s7weyfixeVCsSyN2EtJmj5hKrLscj5FsSJMjv+u36tbz7+l9jmlny50
	BhTDuD0cn1Dw4isoA8g4wO58Mtrkjq3h2XlueAvVoS8WDQvflJPRarcbK7gcfUSYjjFIxI
	fPA2dbCtLkQRnk6mxkIy2HKLga1Vsw15FkUjFGO5UNQ5Cg63jD+AatZZ2FJ30xcamhWvaW
	og/lSptCLtf/Ii1TVUGKJ4b2o/6qZp/BrF2hBPoWBZEqoaqfHbpG7y37be2XbqMWg0JsnC
	m7Hfo2wJpVCStKGirG/fLAkX5sT+RXO6vYEWbbAqOhb1hjIAMVTfaBQlv3m+OA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] ref-manual: release-process.rst: update testing section
Date: Tue, 21 Mar 2023 21:39:02 +0100
Message-Id: <20230321203902.71281-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Mar 2023 20:39:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3811

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Remove note to section not carrying information about
  special hosts tools for oe-selftest

- Add links to mentioned repositories

CC: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/release-process.rst | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index fa057e055c..be47ddfa6d 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -161,25 +161,19 @@ consists of the following pieces:
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
+"ross/mut" branch in the :yocto_git:`poky-contrib </poky-contrib>` repository
+(i.e. the master-under-test branch) or in the "master-next" branch in the
+:yocto_git:`poky </poky>` repository.
 
 .. note::
 
-- 
2.34.1


