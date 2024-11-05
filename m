Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3A8D1CA14
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 01:44:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web11.7743.1730771039604520869
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 17:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QOH+f+mV;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730771039; x=1762307039;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=43b/9R0hklTvgBOnXk7HIL57i64k9KvarjkwecjsRvs=;
  b=QOH+f+mVekWyxtXrYfucGM9K3NedXytUKk2rIJjy1cJyJbNDIxdW+6mE
   UCRYvJcZ1txJYFGUUJEQQ+hwSQmS6oPE+bjBjCLndF5io9zYtGJRnk06K
   kGu6ba6wX+G7lXnPPD04hXKBGUoaOIjoRXaHw9HApHqqy4IRX3k2i/Trw
   zOoXQ/4UNC7yZKzNHZ8rnkZq6uqiDQYvYB56txR9/SF8eDxjPBykPgLNH
   nfFBDKnxlZj2CKNXxCSUv2pfgKxohdPzD710YgF9Ezo95AjoSxwuQHf8I
   xDebxZnUZBqh2Dl1+BQfdtkCD6tgKW1jnQsRENJkpKyMBY+CZZHc3LTbN
   g==;
X-CSE-ConnectionGUID: N8QRnEcGSbCa2LX4HhlDfA==
X-CSE-MsgGUID: ke6RX8r3T7OABGo8VoPrcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18114518"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="18114518"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 17:43:59 -0800
X-CSE-ConnectionGUID: b7fALkPESA2pvp9bpRlTqA==
X-CSE-MsgGUID: wcuCecijQeOHn8owqN60Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="83500589"
Received: from cheeyang-desk1.png.intel.com ([10.107.249.127])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2024 17:43:58 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-5.1: add download section
Date: Tue,  5 Nov 2024 09:42:04 +0800
Message-Id: <20241105014204.2824698-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 01:44:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5670

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-5.1.rst    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index d6e284c1e..e5da4eeaf 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -1018,3 +1018,59 @@ Thanks to the following people who contributed to this release:
 
 Repositories / Downloads for Yocto-5.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`styhead </poky/log/?h=styhead>`
+-  Tag:  :yocto_git:`yocto-5.1 </poky/log/?h=yocto-5.1>`
+-  Git Revision: :yocto_git:`8f01ae5c7cba251ed25c80f0141a950ebc8a5f73 </poky/commit/?id=8f01ae5c7cba251ed25c80f0141a950ebc8a5f73>`
+-  Release Artefact: poky-8f01ae5c7cba251ed25c80f0141a950ebc8a5f73
+-  sha: 91f5b2bc8a2be153ac2c358aa8ad71737b4f91e83d2c3ed1aac4f5f087991769
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.1/poky-8f01ae5c7cba251ed25c80f0141a950ebc8a5f73.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.1/poky-8f01ae5c7cba251ed25c80f0141a950ebc8a5f73.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`styhead </openembedded-core/log/?h=styhead>`
+-  Tag:  :oe_git:`yocto-5.1 </openembedded-core/log/?h=yocto-5.1>`
+-  Git Revision: :oe_git:`161c5b311f1aeb8f254dca96331b31d5b67fc92d </openembedded-core/commit/?id=161c5b311f1aeb8f254dca96331b31d5b67fc92d>`
+-  Release Artefact: oecore-161c5b311f1aeb8f254dca96331b31d5b67fc92d
+-  sha: 7b8ea61a3b811556f40b0912ee22b3ef37bccead1d65fb7e1c35a47aff4ca718
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.1/oecore-161c5b311f1aeb8f254dca96331b31d5b67fc92d.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.1/oecore-161c5b311f1aeb8f254dca96331b31d5b67fc92d.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`styhead </meta-mingw/log/?h=styhead>`
+-  Tag:  :yocto_git:`yocto-5.1 </meta-mingw/log/?h=yocto-5.1>`
+-  Git Revision: :yocto_git:`4ac6cbfdce1f85294bd54bcd8b074f7ef32c378f </meta-mingw/commit/?id=4ac6cbfdce1f85294bd54bcd8b074f7ef32c378f>`
+-  Release Artefact: meta-mingw-4ac6cbfdce1f85294bd54bcd8b074f7ef32c378f
+-  sha: 7759361e141654cc84aad486ad36a9ddaf7ee47feebe2cc6dca3175f1922b7c4
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.1/meta-mingw-4ac6cbfdce1f85294bd54bcd8b074f7ef32c378f.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.1/meta-mingw-4ac6cbfdce1f85294bd54bcd8b074f7ef32c378f.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.10 </bitbake/log/?h=2.10>`
+-  Tag:  :oe_git:`yocto-5.1 </bitbake/log/?h=yocto-5.1>`
+-  Git Revision: :oe_git:`d3c84198771b7f79aa84dc73061d8ca071fe18f3 </bitbake/commit/?id=d3c84198771b7f79aa84dc73061d8ca071fe18f3>`
+-  Release Artefact: bitbake-d3c84198771b7f79aa84dc73061d8ca071fe18f3
+-  sha: 4b64120f26878a661d1aaf0b0bb5009a21614e2db0649c728cc9d4c16b1050b6
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.1/bitbake-d3c84198771b7f79aa84dc73061d8ca071fe18f3.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.1/bitbake-d3c84198771b7f79aa84dc73061d8ca071fe18f3.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`styhead </yocto-docs/log/?h=styhead>`
+-  Tag: :yocto_git:`yocto-5.1 </yocto-docs/log/?h=yocto-5.1>`
+-  Git Revision: :yocto_git:`c32b55b3403dcfd76a4694ff407d4b513e14c8f4 </yocto-docs/commit/?id=c32b55b3403dcfd76a4694ff407d4b513e14c8f4>`
+
-- 
2.34.1


