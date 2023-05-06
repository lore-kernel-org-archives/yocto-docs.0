Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99489C77B75
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 01:28:52 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.14266.1683336526202050984
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 18:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=NS39uFJ2;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683336526; x=1714872526;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2Q8ZNvnSPzjVevP7H2mWQWCIpclmDF4NzMawqjJGIAc=;
  b=NS39uFJ2nf8WCrl9Q+bY2yhNVBqcZBxRFlEe+HX5hnCdho7+D6WorI+F
   5N+1riqAN9a5oEuaf4ZSfgAXMPdnLKRlirV619RuOYy6Qe8QsdHl45C9W
   lUZWMj6QkrbMxVcXJpuli3NxzojcD7Rf5vdl6fB5qyVszvnq+ba0j8gQG
   LVjKtzDl+K+6GgjGWt2xP53bZfMLr6ac901J+DLbIQGrCVnP9cd5WC7+j
   g1xCVnQAd3qkPfVQSa4jzaHYTA5PKq1t0mXRNDg2y2aWKs4LUlef5pZ5C
   YXIGRFMuilyFgI52Egf7g9dNMpeTzbgQVrf8ki9K/qGzGZ4QXcPwPW31v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="352381709"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="352381709"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 18:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="675331675"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="675331675"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orsmga006.jf.intel.com with ESMTP; 05 May 2023 18:28:44 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-4.2: update known issues and Repositories/Downloads
Date: Sat,  6 May 2023 09:27:40 +0800
Message-Id: <20230506012740.3904740-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 06 May 2023 01:28:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3921

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-4.2.rst    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index 473ea984c..97e1cfe0e 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -316,6 +316,8 @@ New Features / Enhancements in 4.2
 Known Issues in 4.2
 ~~~~~~~~~~~~~~~~~~~
 
+- N/A
+
 Recipe License changes in 4.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -903,3 +905,62 @@ Thanks to the following people who contributed to this release:
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


