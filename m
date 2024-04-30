Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F0DC10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 14:03:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web10.16415.1714485790545914617
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 07:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nTlftD8u;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714485791; x=1746021791;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5TPn7Lf3W5H4yTR4uHCi2p+zhbhq3JiGYsBsv6bE9V8=;
  b=nTlftD8udhnNBncNndq+BF+vaOKNc/V/0c5XRFfBxtaNiCpBUl3mUA+O
   +ABAGGLdBAJ6HVUYIcEhf3MxsOJ6BiIHcM79M/cFlGA+ZGYr90X5S0TGX
   X0BnCv6JRjjGDyw1AkRaNURj/pM9IiOGxocDn6jv4rvqvLgRt5yG9MzUk
   5iIpUEC7YPcNLv8Ryq/TVxccWqdSLp1P0EV1oqjG5mfMGnkPb+JQgS/V8
   XY86u19guo1TZ2ANLAlTESy//W0yKKh3vDL3OA1luouNC/JCUNLITJ7kV
   n+NFkD3nYzV7xyqQ2ICwLxqS7EVztRlpGJTN9G6oqAzrWl8yYH9Rw9o9s
   w==;
X-CSE-ConnectionGUID: H4HsyeCnQ3iq71Kr6Gq4/w==
X-CSE-MsgGUID: GfRwTYCLRsOSKGgoF7yfGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20808125"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="20808125"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 07:03:11 -0700
X-CSE-ConnectionGUID: kfRd/SW3S7y9/fwKlkFzqQ==
X-CSE-MsgGUID: aiUgqKR1R4uSQGh9GjaXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="26558659"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2024 07:03:10 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] release-notes-5.0: update Repositories / Downloads section
Date: Tue, 30 Apr 2024 22:00:17 +0800
Message-Id: <20240430140017.1741751-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430140017.1741751-1-chee.yang.lee@intel.com>
References: <20240430140017.1741751-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Apr 2024 14:03:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5183

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-5.0.rst    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 884a66771..800ba20a2 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -936,3 +936,58 @@ Thanks to the following people who contributed to this release:
 Repositories / Downloads for Yocto-5.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`scarthgap </poky/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0 </poky/log/?h=yocto-5.0>`
+-  Git Revision: :yocto_git:`fb91a49387cfb0c8d48303bb3354325ba2a05587 </poky/commit/?id=fb91a49387cfb0c8d48303bb3354325ba2a05587>`
+-  Release Artefact: poky-fb91a49387cfb0c8d48303bb3354325ba2a05587
+-  sha: 8a0dff4b677b9414ab814ed35d1880196123732ea16ab2fafa388bcc509b32ab
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0/poky-fb91a49387cfb0c8d48303bb3354325ba2a05587.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0/poky-fb91a49387cfb0c8d48303bb3354325ba2a05587.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`scarthgap </openembedded-core/log/?h=scarthgap>`
+-  Tag:  :oe_git:`yocto-5.0 </openembedded-core/log/?h=yocto-5.0>`
+-  Git Revision: :oe_git:`b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277 </openembedded-core/commit/?id=b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277>`
+-  Release Artefact: oecore-b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277
+-  sha: c7fd05d1a00c70acba2540e60dce01a1bdc4701ebff9a808784960240c69261d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0/oecore-b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0/oecore-b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`scarthgap </meta-mingw/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0 </meta-mingw/log/?h=yocto-5.0>`
+-  Git Revision: :yocto_git:`acbba477893ef87388effc4679b7f40ee49fc852 </meta-mingw/commit/?id=acbba477893ef87388effc4679b7f40ee49fc852>`
+-  Release Artefact: meta-mingw-acbba477893ef87388effc4679b7f40ee49fc852
+-  sha: 3b7c2f475dad5130bace652b150367f587d44b391218b1364a8bbc430b48c54c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0/meta-mingw-acbba477893ef87388effc4679b7f40ee49fc852.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0/meta-mingw-acbba477893ef87388effc4679b7f40ee49fc852.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.8 </bitbake/log/?h=2.8>`
+-  Tag:  :oe_git:`yocto-5.0 </bitbake/log/?h=yocto-5.0>`
+-  Git Revision: :oe_git:`c86466d51e8ff14e57a734c1eec5bb651fdc73ef </bitbake/commit/?id=c86466d51e8ff14e57a734c1eec5bb651fdc73ef>`
+-  Release Artefact: bitbake-c86466d51e8ff14e57a734c1eec5bb651fdc73ef
+-  sha: 45c91294c1fa5a0044f1bb72a9bb69456bb458747114115af85c7664bf672d48
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0/bitbake-c86466d51e8ff14e57a734c1eec5bb651fdc73ef.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0/bitbake-c86466d51e8ff14e57a734c1eec5bb651fdc73ef.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=scarthgap>`
+-  Tag: :yocto_git:`yocto-5.0 </yocto-docs/log/?h=yocto-5.0>`
+-  Git Revision: :yocto_git:`0cdc0afd3332459d30cfc8f4c2e62bdcc23f5ed5 </yocto-docs/commit/?id=0cdc0afd3332459d30cfc8f4c2e62bdcc23f5ed5>`
+
-- 
2.34.1


