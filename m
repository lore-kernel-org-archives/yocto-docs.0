Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481D5FA373F
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 00:11:15 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.1529.1666656673721876187
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 17:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=nXCbUlKu;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666656673; x=1698192673;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/aglPMydL8wveMNdJw4/poQ+Yhk1GIWyxKbzMReKsJ4=;
  b=nXCbUlKum71OlFzc4Tk/lIdUYWCaOOzhez18PGQgTNYtCRud6rGUwSzx
   PTCv98vgY9aj/b0YQqYfQHcfVzEEdR4E8DmEZzfXjsWdQkxfhM/sIhKuB
   cc1s5IST1Z8uIcoE+hLh7dRj6Lj7lt2b+Cvxce3Ph4qfbh5dAzeUO7QUh
   6U3+r6qdASAnL0FYYedbtEL2H7Nco6WJU+IE9ShobDY3KwjyFGKaY5O6v
   plfOZuTDcgGIdVSmvKJ+MDWz2Bd92B1A89lzarD0K1GDh0FROd14tjzKQ
   HrDlesWzQUb25AN8UbfvneifTTWhe07Sg5gDzwJCVNSTSjTbB4xAsSeuG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="305162686"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="305162686"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 17:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="960620257"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="960620257"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.126])
  by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2022 17:11:11 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides/release-notes-4.1.rst: update Repositories / Downloads
Date: Tue, 25 Oct 2022 08:09:53 +0800
Message-Id: <20221025000953.2170782-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 00:11:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3396

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-4.1.rst    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index a2d4b3d6c..dad059919 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -703,3 +703,59 @@ Thanks to the following people who contributed to this release:
 
 Repositories / Downloads for 4.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: https://git.yoctoproject.org/git/poky
+-  Branch: :yocto_git:`langdale </poky/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1 </poky/log/?h=yocto-4.1>`
+-  Git Revision: :yocto_git:`5200799866b92259e855051112520006e1aaaac0 </poky/commit/?id=5200799866b92259e855051112520006e1aaaac0>`
+-  Release Artefact: poky-5200799866b92259e855051112520006e1aaaac0
+-  sha: 9d9a2f7ecf2502f89f43bf45d63e6b61cdcb95ed1d75c8281372f550d809c823
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1/poky-5200799866b92259e855051112520006e1aaaac0.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1/poky-5200799866b92259e855051112520006e1aaaac0.tar.bz2
+
+openembedded-core
+
+-  Repository Location: https://git.openembedded.org/openembedded-core
+-  Branch: :oe_git:`langdale </openembedded-core/log/?h=langdale>`
+-  Tag:  :oe_git:`yocto-4.1 </openembedded-core/log/?h=yocto-4.1>`
+-  Git Revision: :oe_git:`744a2277844ec9a384a9ca7dae2a634d5a0d3590 </openembedded-core/commit/?id=744a2277844ec9a384a9ca7dae2a634d5a0d3590>`
+-  Release Artefact: oecore-744a2277844ec9a384a9ca7dae2a634d5a0d3590
+-  sha: 34f1fd5bb83514bf0ec8ad7f8cce088a8e28677e1338db94c188283da704c663
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1/oecore-744a2277844ec9a384a9ca7dae2a634d5a0d3590.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1/oecore-744a2277844ec9a384a9ca7dae2a634d5a0d3590.tar.bz2
+
+meta-mingw
+
+-  Repository Location: https://git.yoctoproject.org/git/meta-mingw
+-  Branch: :yocto_git:`langdale </meta-mingw/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1 </meta-mingw/log/?h=yocto-4.1>`
+-  Git Revision: :yocto_git:`b0067202db8573df3d23d199f82987cebe1bee2c </meta-mingw/commit/?id=b0067202db8573df3d23d199f82987cebe1bee2c>`
+-  Release Artefact: meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c
+-  sha: 704f2940322b81ce774e9cbd27c3cfa843111d497dc7b1eeaa39cd694d9a2366
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+
+bitbake
+
+-  Repository Location: https://git.openembedded.org/bitbake
+-  Branch: :oe_git:`2.2 </bitbake/log/?h=2.2>`
+-  Tag:  :oe_git:`yocto-4.1 </bitbake/log/?h=yocto-4.1>`
+-  Git Revision: :oe_git:`074da4c469d1f4177a1c5be72b9f3ccdfd379d67 </bitbake/commit/?id=074da4c469d1f4177a1c5be72b9f3ccdfd379d67>`
+-  Release Artefact: bitbake-074da4c469d1f4177a1c5be72b9f3ccdfd379d67
+-  sha: e32c300e0c8522d8d49ef10aae473bd5f293202672eb9d38e90ed92594ed1fe8
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1/bitbake-074da4c469d1f4177a1c5be72b9f3ccdfd379d67.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1/bitbake-074da4c469d1f4177a1c5be72b9f3ccdfd379d67.tar.bz2
+
+yocto-docs
+
+-  Repository Location: https://git.yoctoproject.org/git/yocto-docs
+-  Branch: :yocto_git:`langdale </yocto-docs/log/?h=langdale>`
+-  Tag: :yocto_git:`yocto-4.1 </yocto-docs/log/?h=yocto-4.1>`
+-  Git Revision: :yocto_git:`42d3e26a0d04bc5951e640b471686f347dc9b74a </yocto-docs/commit/?id=42d3e26a0d04bc5951e640b471686f347dc9b74a>`
+
-- 
2.34.1


