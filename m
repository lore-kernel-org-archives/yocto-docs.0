Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2434C3ABC5
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 05:53:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web10.8932.1746683628399872936
 for <docs@lists.yoctoproject.org>;
 Wed, 07 May 2025 22:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BgDUnPZa;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746683629; x=1778219629;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c7HYB+YcL4/EecgqFMl9HPlFUitDIhxzQtbh6xSBTro=;
  b=BgDUnPZaux1F+ZgpaS0+mKJWTW+xtaOQ0NCT7eueOfNqKlE2mzlFicwM
   W36IaP7zLUbfP5A01FJZn1gWc9Jfl2nNfX2I9M3uQu6AQDOTz8/he1t/x
   /PSkBAGbTvodhqKQk2xUYCJyOdyQ9eVys2yQxpPx3run32z4GbksPTWu/
   2f6IZJp3QHi/t49YJgWWOfGMKhO9yhjZOjXpu66PUGOL4wZXWXvDGAJji
   hDKEalmCn6+X8jqbbQSITnHS7Mf5KBfNQmM24n3G3BEERBFCGa+7u0GaB
   BI1/zFx1ekA6slBuAu4/cnijRJy0+IOergCt7p3U/2TjtckYWOS7KJ+Ct
   Q==;
X-CSE-ConnectionGUID: jdQtgqyJRBa1B4hYk9FNwg==
X-CSE-MsgGUID: pZVfFAYYR/W4dDgOUxNTdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48355297"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48355297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:53:48 -0700
X-CSE-ConnectionGUID: FkHSdQhgRyi4aGlsEFIZbw==
X-CSE-MsgGUID: 9P2MWC+sSXuXOD5NTZQjRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="173393965"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 22:53:47 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] docs: update walnascar-5.2 release
Date: Thu,  8 May 2025 13:53:50 +0800
Message-ID: <20250508055351.2101822-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 May 2025 05:53:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6803

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 documentation/poky.yaml.in    | 12 ++++++------
 documentation/set_versions.py |  6 ++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 26c21e346..39ece05e9 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -4,18 +4,18 @@
 
 # The DISTRO variable represents the current docs version. It should be used
 # when referring to the current docs version. See also DISTRO_LATEST_TAG.
-DISTRO : "5.1"
+DISTRO : "5.2"
 # The DISTRO_LATEST_TAG represents the latest tag on the current branch. It
 # should be used in HTTP link referring to the current docs version. In these
 # cases, the DISTRO may point to A.B.999 which does not exist (just used to
 # represent the latest HEAD revision on the branch). DISTRO_LATEST_TAG should
 # always point to an existing tag.
-DISTRO_LATEST_TAG : "5.1"
-DISTRO_NAME_NO_CAP : "styhead"
-DISTRO_NAME : "Styhead"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "scarthgap"
+DISTRO_LATEST_TAG : "5.2"
+DISTRO_NAME_NO_CAP : "walnascar"
+DISTRO_NAME : "Walnascar"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "styhead"
 DISTRO_NAME_NO_CAP_LTS : "scarthgap"
-YOCTO_DOC_VERSION : "5.1"
+YOCTO_DOC_VERSION : "5.2"
 DISTRO_REL_TAG : "yocto-$DISTRO;"
 DISTRO_REL_LATEST_TAG : "yocto-&DISTRO_LATEST_TAG;"
 DOCCONF_VERSION : "dev"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index b94a7daad..7f5810a31 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,8 +26,8 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["styhead", "scarthgap", "kirkstone"]
-devbranch = "walnascar"
+activereleases = ["walnascar", "styhead", "scarthgap", "kirkstone"]
+devbranch = "whinlatter"
 ltsseries = ["scarthgap", "kirkstone"]
 
 # used by run-docs-builds to get the default page
@@ -36,6 +36,7 @@ if ourversion == "getlatest":
     sys.exit(0)
 
 release_series = collections.OrderedDict()
+release_series["whinlatter"] = "5.3"
 release_series["walnascar"] = "5.2"
 release_series["styhead"] = "5.1"
 release_series["scarthgap"] = "5.0"
@@ -70,6 +71,7 @@ release_series["laverne"] = "0.9"
 
 
 bitbake_mapping = {
+    "whinlatter" : "2.14",
     "walnascar" : "2.12",
     "styhead" : "2.10",
     "scarthgap" : "2.8",
-- 
2.43.0


