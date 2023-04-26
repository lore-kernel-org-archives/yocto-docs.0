Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BCAC77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 07:19:17 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.2375.1682493547978157942
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 00:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=lvJJpOZN;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682493548; x=1714029548;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TIS1zZTWyK6fU+i+gcxFUD9TvWnan1cYfzKY9Hjhu1Y=;
  b=lvJJpOZNwWGGEKgyhihzn30KeUFOjhP95AEMgucUkgmb0fk4l2LxgF92
   V9yTPS1eEaQN6DxWZ9EHP2rpxnauc01HBONRiInI4vSiPiLd5l4QGVuMM
   72Gbmxd6EBX30GIRGKKC1EmPxdgyA1lJ+7suJow05LFP2X2rSxcICMuew
   1F2o8WKbV62mgHxdJGAAihHSQsNE5ou04OHXpAU+L+cEIWvruWqqQGx8A
   ECWWMfzL5wQhhT/JWXeRBnzgg3LgQipTTwUWOzczZbcSwG3GxXCUHjBXd
   P4Uqe/SD0KOWmF8s2nC89HdcKjAWOgRmTweIS0Vk1g2tlNJgY2+GztUnA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="412330925"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="412330925"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 00:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="696497386"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="696497386"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmsmga007.fm.intel.com with ESMTP; 26 Apr 2023 00:19:06 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-4.2: update RC3 changes
Date: Wed, 26 Apr 2023 15:17:57 +0800
Message-Id: <20230426071757.2962260-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Apr 2023 07:19:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3870

From: Lee Chee Yang <chee.yang.lee@intel.com>

also fix typo for CVE-2023-24532.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-4.2.rst          | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index bf003c1a0..04261244f 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -326,7 +326,7 @@ Security Fixes in 4.2
 - ffmpeg: :cve:`2022-3964`, :cve:`2022-3965`
 - git: :cve:`2022-39260`, :cve:`2022-41903`, :cve:`2022-23521`, :cve:`2022-41953` (ignored)
 - glibc: :cve:`2023-25139` (ignored)
-- go: :cve:`2023-2453`
+- go: :cve:`2023-24532`, :cve:`2023-24537`
 - grub2: :cve:`2022-2601`, :cve:`2022-3775`, :cve:`2022-28736`
 - inetutils: :cve:`2019-0053`
 - less: :cve:`2022-46663`
@@ -343,14 +343,15 @@ Security Fixes in 4.2
 - qemu: :cve:`2022-3165`
 - rust: :cve:`2022-46176`
 - rxvt-unicode: :cve:`2022-4170`
-- shadow: :cve:`2016-15024` (ignored)
+- screen: :cve:`2023-24626`
+- shadow: :cve:`2023-29383`, :cve:`2016-15024` (ignored)
 - sudo: :cve:`2022-43995`
 - systemd: :cve:`2022-4415` (ignored)
 - tar: :cve:`2022-48303`
 - tiff: :cve:`2022-3599`, :cve:`2022-3597`, :cve:`2022-3626`, :cve:`2022-3627`, :cve:`2022-3570`, :cve:`2022-3598`, :cve:`2022-3970`, :cve:`2022-48281`
 - vim: :cve:`2022-3352`, :cve:`2022-4141`, :cve:`2023-0049`, :cve:`2023-0051`, :cve:`2023-0054`, :cve:`2023-0288`, :cve:`2023-1127`, :cve:`2023-1170`, :cve:`2023-1175`, :cve:`2023-1127`, :cve:`2023-1170`, :cve:`2023-1175`, :cve:`2023-1264`, :cve:`2023-1355`, :cve:`2023-0433`, :cve:`2022-47024`, :cve:`2022-3705`
 - xdg-utils: :cve:`2022-4055`
-- xserver-xorg: :cve:`2022-3550`, :cve:`2022-3551`, :cve:`2023-0494`, :cve:`2022-3553` (ignored)
+- xserver-xorg: :cve:`2022-3550`, :cve:`2022-3551`, :cve:`2023-1393`, :cve:`2023-0494`, :cve:`2022-3553` (ignored)
 
 
 Recipe Upgrades in 4.2
@@ -517,9 +518,9 @@ Recipe Upgrades in 4.2
 - lighttpd: upgrade 1.4.66 -> 1.4.69
 - linux-firmware: upgrade 20220913 -> 20230210
 - linux-libc-headers: bump to 6.1
-- linux-yocto/5.15: update genericx86* machines to v5.15.78
-- linux-yocto/5.15: update to v5.15.103
-- linux-yocto/6.1: update to v6.1.20
+- linux-yocto/5.15: update genericx86* machines to v5.15.103
+- linux-yocto/5.15: update to v5.15.108
+- linux-yocto/6.1: update to v6.1.25
 - linux-yocto-dev: bump to v6.3
 - linux-yocto-rt/5.15: update to -rt59
 - linux-yocto-rt/6.1: update to -rt7
-- 
2.34.1


