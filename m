Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD622C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 04:45:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.9209.1713933898391807673
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 21:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=hFEl8bx9;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713933898; x=1745469898;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YfLLQZtZjHsbOacX5oy5br3KuNxD5F0A8vbKgNFiZi4=;
  b=hFEl8bx9mDzAexveyJBwxwfE3rn9fslBd4yUV8zCBK665FHLlh3v+dFg
   kCw75g84RIra1MDDTj+YLqdFuxR9k6Gv/GAzdEafDKRpoYRn2eP/i0oeG
   u9tdkBpAiw0fFZlG5ipKwHDIb47o02bpsAK1G9FyQzaGaqACDvfxoOuQx
   fypCXaKak81sxYm18FhsAdIT9VsT3sce4ZkNJ2ypbaBSKsl7czUmuq2yY
   drcgo2i+dqel/zd3Q/Yif/V8imsI4F/roL9sDWYPQSDGW7wislleS+ca4
   sgEFRP6DnHrsjx5SGQ7RvAMDmRF4JQlMqeHOsyACPTx+x9OEgNWWxzI3T
   g==;
X-CSE-ConnectionGUID: NldVB93LQvyaY8OykVVRGQ==
X-CSE-MsgGUID: fIw1aPh6TdejhzJUhzrO5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9472418"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9472418"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 21:44:40 -0700
X-CSE-ConnectionGUID: PUy1HNexRkqKOFROUmfXrQ==
X-CSE-MsgGUID: DWMNyDpiTx2DKPlW5c8r0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="24625725"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmviesa007.fm.intel.com with ESMTP; 23 Apr 2024 21:44:39 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-5.0: update recipes changes
Date: Wed, 24 Apr 2024 12:41:54 +0800
Message-Id: <20240424044154.4712-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Apr 2024 04:45:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5173

From: Lee Chee Yang <chee.yang.lee@intel.com>

update recipes changes in 5.0 rc4.
update new recipes, license changes, patched cve and recipes version
changes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 2501acdaf..884a66771 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -88,6 +88,9 @@ New Features / Enhancements in 5.0
       a Sphinx extension to include jQuery on newer Sphinx releases. Recent
       versions of ``python3-sphinx-rtd-theme`` depend on it.
 
+   -  `python3-websockets <https://pypi.org/project/websockets/>`__: a
+      library for building WebSocket servers and clients in Python.
+
    -  `python3-yamllint <https://github.com/adrienverge/yamllint>`__: a linter
       for YAML files. In U-Boot, the ``binman`` tool uses this linter to verify the
       configurations at compile time.
@@ -346,6 +349,7 @@ The following corrections have been made to the :term:`LICENSE` values set by re
 
 -  ``elfutils``: split license for libraries & backend and utilities.
 -  ``ghostscript``: correct :term:`LICENSE` to ``AGPL-3.0-or-later``.
+-  ``kbd``: update license for consolefont and keymaps.
 -  ``libsystemd``: set its own :term:`LICENSE` value (``LGPL-2.1-or-later``) to add more granularity.
 -  ``libtest-warnings-perl``: update :term:`LICENSE` ``Artistic-1.0`` to ``Artistic-1.0-Perl``.
 -  ``linux-firmware``: set package :term:`LICENSE` appropriately for ``carl9170``, ``rockchip`` and ``powerpr``.
@@ -378,7 +382,7 @@ Security Fixes in 5.0
 -  libxml2: :cve:`2023-45322` (ignored)
 -  linux-yocto/6.6: :cve:`2020-16119`
 -  openssh: :cve:`2023-48795`, :cve:`2023-51384`, :cve:`2023-51385`
--  openssl: :cve:`2023-5363`, :cve:`2023-5678`, :cve:`2023-6129`, :cve_mitre:`2023-6237`, :cve:`2024-0727`
+-  openssl: :cve:`2023-5363`, :cve:`2023-5678`, :cve:`2023-6129`, :cve_mitre:`2023-6237`, :cve:`2024-0727`, :cve:`2024-2511`
 -  perl: :cve:`2023-47100`
 -  pixman: :cve:`2023-37769` (ignored)
 -  python3-cryptography{-vectors}: :cve:`2023-49083`, :cve:`2024-26130`
@@ -554,7 +558,7 @@ Recipe Upgrades in 5.0
 -  linux-yocto-dev 6.6+git -> 6.9+git
 -  linux-yocto-rt 6.1.78+git, 6.5.13+git -> 6.6.23+git
 -  linux-yocto-tiny 6.1.78+git, 6.5.13+git -> 6.6.23+git
--  llvm 17.0.3 -> 18.1.2
+-  llvm 17.0.3 -> 18.1.3
 -  lsof 4.98.0 -> 4.99.3
 -  ltp 20230516 -> 20240129
 -  lttng-modules 2.13.10 -> 2.13.12
@@ -590,7 +594,7 @@ Recipe Upgrades in 5.0
 -  ptest-runner 2.4.2+git -> 2.4.3+git
 -  pulseaudio 16.1 -> 17.0
 -  puzzles 0.0+git (2d9e414ee316…) -> 0.0+git (80aac3104096…)
--  python3 3.11.5 -> 3.12.2
+-  python3 3.11.5 -> 3.12.3
 -  python3-alabaster 0.7.13 -> 0.7.16
 -  python3-attrs 23.1.0 -> 23.2.0
 -  python3-babel 2.12.1 -> 2.14.0
-- 
2.34.1


