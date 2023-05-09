Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80006C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 12:40:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.31079.1683636051451073295
 for <docs@lists.yoctoproject.org>;
 Tue, 09 May 2023 05:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q5d4w73A;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 62D011BF20B;
	Tue,  9 May 2023 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683636049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Utx1V7VLjucT8xcNJftIAAdQvwboVQ6axWbF/PvMK/A=;
	b=Q5d4w73AQnYEQFhavW2jerIHjKTymN9U0wwt1PYmIsNtX/5OEvwvrl1gvsB/d212a8kVUA
	Ex2UPBhoU3N3i395H3YnMRstJZnRXVaLE7HMGECEk4cB8JCoN6rnbBQkfGg1iZxb9TMWwz
	J/HyXZLYrZ8HdSFNZu8gFTjTjWhgOPURKpprw5nqM/srxf7aplfOGLb9ZMQKCmkhmCPIIS
	7E0aE8aSoJfqmsZeUe0epwDE3pNFuIRsqDUnt1e2BCspdbxDVYe2Lax/iBdL/GJ66IJx9V
	FJD2vXmqexqMsORZ66WWMQKM4eiP7XtOHYiSMaPy5kZFIeZqYJRanAPoiDnKMw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Lee Chee Yang <chee.yang.lee@intel.com>
Subject: [PATCH 2/4] [mickledore] release-notes-4.2: update known issues and Repositories/Downloads
Date: Tue,  9 May 2023 14:40:36 +0200
Message-Id: <20230509124038.2265185-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509124038.2265185-1-michael.opdenacker@bootlin.com>
References: <20230509124038.2265185-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 May 2023 12:40:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3925

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/release-notes-4.2.rst    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index e13bbde1b3..27d51a574a 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -334,6 +334,8 @@ New Features / Enhancements in 4.2
 Known Issues in 4.2
 ~~~~~~~~~~~~~~~~~~~
 
+- N/A
+
 Recipe License changes in 4.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -921,3 +923,62 @@ Thanks to the following people who contributed to this release:
 - Zoltan Boszormenyi
 - 张忠山
 
+
+Repositories / Downloads for Yocto-4.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`mickledore </poky/log/?h=mickledore>`
+-  Tag:  :yocto_git:`yocto-4.2 </poky/log/?h=yocto-4.2>`
+-  Git Revision: :yocto_git:`21790e71d55f417f27cd51fae9dd47549758d4a0 </poky/commit/?id=21790e71d55f417f27cd51fae9dd47549758d4a0>`
+-  Release Artefact: poky-21790e71d55f417f27cd51fae9dd47549758d4a0
+-  sha: 38606076765d912deec84e523403709ef1249122197e61454ae08818e60f83c2
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2/poky-21790e71d55f417f27cd51fae9dd47549758d4a0.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2/poky-21790e71d55f417f27cd51fae9dd47549758d4a0.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`mickledore </openembedded-core/log/?h=mickledore>`
+-  Tag:  :oe_git:`yocto-4.2 </openembedded-core/log/?h=yocto-4.2>`
+-  Git Revision: :oe_git:`c57d1a561db563ed2f521bbac5fc12d4ac8e11a7 </openembedded-core/commit/?id=c57d1a561db563ed2f521bbac5fc12d4ac8e11a7>`
+-  Release Artefact: oecore-c57d1a561db563ed2f521bbac5fc12d4ac8e11a7
+-  sha: e8cdd870492017be7e7b74b8c2fb73ae6771b2d2125b2aa1f0e65d0689f96af8
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2/oecore-c57d1a561db563ed2f521bbac5fc12d4ac8e11a7.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2/oecore-c57d1a561db563ed2f521bbac5fc12d4ac8e11a7.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`mickledore </meta-mingw/log/?h=mickledore>`
+-  Tag:  :yocto_git:`yocto-4.2 </meta-mingw/log/?h=yocto-4.2>`
+-  Git Revision: :yocto_git:`250617ffa524c082b848487359b9d045703d59c2 </meta-mingw/commit/?id=250617ffa524c082b848487359b9d045703d59c2>`
+-  Release Artefact: meta-mingw-250617ffa524c082b848487359b9d045703d59c2
+-  sha: 873a97dfd5ed6fb26e1f6a2ddc2c0c9d7a7b3c7f5018588e912294618775c323
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2/meta-mingw-250617ffa524c082b848487359b9d045703d59c2.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2/meta-mingw-250617ffa524c082b848487359b9d045703d59c2.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.4 </bitbake/log/?h=2.4>`
+-  Tag:  :oe_git:`yocto-4.2 </bitbake/log/?h=yocto-4.2>`
+-  Git Revision: :oe_git:`d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c </bitbake/commit/?id=d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c>`
+-  Release Artefact: bitbake-d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c
+-  sha: 5edcb97cb545011226b778355bb840ebcc790552d4a885a0d83178153697ba7a
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2/bitbake-d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2/bitbake-d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`mickledore </yocto-docs/log/?h=mickledore>`
+-  Tag: :yocto_git:`yocto-4.2 </yocto-docs/log/?h=yocto-4.2>`
+-  Git Revision: :yocto_git:`4d6807e34adf5d92d9b6e5852736443a867c78fa </yocto-docs/commit/?id=4d6807e34adf5d92d9b6e5852736443a867c78fa>`
+
-- 
2.34.1


