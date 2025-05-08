Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3973C3ABC9
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 05:53:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web10.8932.1746683628399872936
 for <docs@lists.yoctoproject.org>;
 Wed, 07 May 2025 22:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=dGZmnWkr;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746683629; x=1778219629;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7X8upQTyR73dfVUTuJ1xRjBCoovwn9kwDsk596IoXHQ=;
  b=dGZmnWkrgA7uodrlMva/GAiv6GtF66R8XIP6fXds2ASct1kv7VPcLWzR
   jcMCH5y4P3BMHCc1hh7FTTtUw3qpCTbqxeMyBLrQqAa1/XGGjj4F7EV75
   MaVSwjl/5Fq2VBs46CkrH8QKO87ZWcHqfBx4w077q53BfDBzAdkvUY6Mt
   DH0BjBYupGKfabEjj9bA4oqKDE4EN3wyiNZtzEozZmq8RS53Z0IyOCQ89
   feviPU0RCLbkIl9FjS27MLJOzHZS8MRzgbFgWknC3aqZBS5+fpGzXD5SA
   O/PLv8H1DTp7B09XuVnq+Mp/QWaEcvxYvE9cjSLnR7iMuSW0aBItcD9XW
   g==;
X-CSE-ConnectionGUID: UGpweTuqSAG+qPZFS5wQJQ==
X-CSE-MsgGUID: ZHjsyCJURLiNhBdZEzpKUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48355298"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48355298"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:53:49 -0700
X-CSE-ConnectionGUID: 2FZMPN1rTSC7VL7uUQwnpA==
X-CSE-MsgGUID: Of/bXFDFT8eKiuy+wlQtyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="173393966"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 22:53:48 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] release-notes-5.2: update download section
Date: Thu,  8 May 2025 13:53:51 +0800
Message-ID: <20250508055351.2101822-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508055351.2101822-1-chee.yang.lee@intel.com>
References: <20250508055351.2101822-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 May 2025 05:53:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6804

From: Lee Chee Yang <chee.yang.lee@intel.com>

also fix some typo.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-5.2.rst    | 63 ++++++++++++++++++-
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 03f454bfc..dd541a7e3 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -354,7 +354,7 @@ New Features / Enhancements in |yocto-ver|
          HTTPS tokens may not be required.
 
    -  ``compress``: use ``lz4`` instead of ``lz4c``, as ``lz4c`` as been
-      considered deprecrated since 2018.
+      considered deprecated since 2018.
 
    -  ``server/process``: decrease idle/main loop frequency, as it is idle and
       main loops have socket select calls to know when to execute.
@@ -373,7 +373,7 @@ New Features / Enhancements in |yocto-ver|
    -  ``bb/build``: add a function ``bb.build.listtasks()`` to list the tasks in
       a datastore.
 
-   -  Remove custom exception backtrace formatting, and replace occurences of
+   -  Remove custom exception backtrace formatting, and replace occurrences of
       ``bb.exception.format_exception()`` by ``traceback.format_exception()``.
 
    -  ``runqueue``: various performance optimizations including:
@@ -598,7 +598,7 @@ New Features / Enhancements in |yocto-ver|
       code in :oe_git:`meta/lib/oe/license.py </openembedded-core/tree/meta/lib/oe/license.py>`.
 
    -  The recipe ``cairo`` now disables the features ``symbol-lookup``,
-      ``spectre`, and ``tests`` by default.
+      ``spectre``, and ``tests`` by default.
 
    -  The recipe ``glib-2.0`` now disables the feature ``sysprof`` by default.
 
@@ -2241,3 +2241,60 @@ Thanks to the following people who contributed to this release:
 
 Repositories / Downloads for Yocto-|yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`walnascar </poky/log/?h=walnascar>`
+-  Tag:  :yocto_git:`yocto-5.2 </poky/log/?h=yocto-5.2>`
+-  Git Revision: :yocto_git:`9b96fdbb0cab02f4a6180e812b02bc9d4c41b1a5 </poky/commit/?id=9b96fdbb0cab02f4a6180e812b02bc9d4c41b1a5>`
+-  Release Artefact: poky-9b96fdbb0cab02f4a6180e812b02bc9d4c41b1a5
+-  sha: 2d3c0e216c7fa71a364986be6754549e2059d37581aad0a53f0f95c33fb1eefe
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.2/poky-9b96fdbb0cab02f4a6180e812b02bc9d4c41b1a5.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.2/poky-9b96fdbb0cab02f4a6180e812b02bc9d4c41b1a5.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`walnascar </openembedded-core/log/?h=walnascar>`
+-  Tag:  :oe_git:`yocto-5.2 </openembedded-core/log/?h=yocto-5.2>`
+-  Git Revision: :oe_git:`6ec2c52b938302b894f119f701ffcf0a847eee85 </openembedded-core/commit/?id=6ec2c52b938302b894f119f701ffcf0a847eee85>`
+-  Release Artefact: oecore-6ec2c52b938302b894f119f701ffcf0a847eee85
+-  sha: 00453354efdd9c977d559f7c0047691bb974170ce313ac9a1e6cb94108d6c648
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.2/oecore-6ec2c52b938302b894f119f701ffcf0a847eee85.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.2/oecore-6ec2c52b938302b894f119f701ffcf0a847eee85.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`walnascar </meta-mingw/log/?h=walnascar>`
+-  Tag:  :yocto_git:`yocto-5.2 </meta-mingw/log/?h=yocto-5.2>`
+-  Git Revision: :yocto_git:`edce693e1b8fabd84651aa6c0888aafbcf238577 </meta-mingw/commit/?id=edce693e1b8fabd84651aa6c0888aafbcf238577>`
+-  Release Artefact: meta-mingw-edce693e1b8fabd84651aa6c0888aafbcf238577
+-  sha: 6cfed41b54f83da91a6cf201ec1c2cd4ac284f642b1268c8fa89d2335ea2bce1
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.2/meta-mingw-edce693e1b8fabd84651aa6c0888aafbcf238577.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.2/meta-mingw-edce693e1b8fabd84651aa6c0888aafbcf238577.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.12 </bitbake/log/?h=2.12>`
+-  Tag:  :oe_git:`yocto-5.2 </bitbake/log/?h=yocto-5.2>`
+-  Git Revision: :oe_git:`5b4e20377eea8d428edf1aeb2187c18f82ca6757 </bitbake/commit/?id=5b4e20377eea8d428edf1aeb2187c18f82ca6757>`
+-  Release Artefact: bitbake-5b4e20377eea8d428edf1aeb2187c18f82ca6757
+-  sha: 48cff22c1e61f47adce474b636ca865e7e0b62293fc5c8829d09e7f1ac5252af
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.2/bitbake-5b4e20377eea8d428edf1aeb2187c18f82ca6757.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.2/bitbake-5b4e20377eea8d428edf1aeb2187c18f82ca6757.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`walnascar </yocto-docs/log/?h=walnascar>`
+-  Tag: :yocto_git:`yocto-5.2 </yocto-docs/log/?h=yocto-5.2>`
+-  Git Revision: :yocto_git:`b8d9cf79d299b2e553e6bc962527d835206022ec </yocto-docs/commit/?id=b8d9cf79d299b2e553e6bc962527d835206022ec>`
+
-- 
2.43.0


