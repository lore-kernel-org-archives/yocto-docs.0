Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42B1C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 02:34:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web10.5952.1711593238310466872
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 19:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=jPyaXHAy;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711593238; x=1743129238;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cwa7AT5aXzB+j6IBQe1ypad/bzSMppXEgkxQ/xaI5Ug=;
  b=jPyaXHAyEq8pf3F5B+dLk1OdFBos/N0uboHT/Sj+Y1ZUVQprgOHxE7zZ
   +Tb2dYBTlj6BH8DlJfVtwytYSnC0CHIOLpPz3wiMtoEEne1Jif8mnN2gZ
   2gvQJ8Ps3qev/15aclmTNOcrLj5/YlrT3rAxdvSTGcGpIHyGprknd5Uz7
   TJQfwWxvWvBpPEI0XKPob/s0db1cafvUzb6hAWzUibUl2k1x1eHaWtO57
   y0/aWtCZZk8Hei7BXJ1qSCs5i7Ic5LVZnz7gLsqNMrPGWNHvqEQW4/hn+
   PPFdbTbIH5YHYPGVTxs+8tfk5lHZvNnk09IZ9zLBurdUo5132CjJb/eVy
   g==;
X-CSE-ConnectionGUID: u35D7O+QSh+SITWlSU7ilw==
X-CSE-MsgGUID: zKmcfzXOS0Wz+1mgbhcGCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6843368"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6843368"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 19:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="16520437"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmviesa006.fm.intel.com with ESMTP; 27 Mar 2024 19:33:56 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-4.0.17: reorder CVEs
Date: Thu, 28 Mar 2024 10:31:42 +0800
Message-Id: <20240328023142.3416785-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Mar 2024 02:34:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5020

From: Lee Chee Yang <chee.yang.lee@intel.com>

reorder CVEs from alphabetical order to numerical order, align it
with text based release notes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-4.0.17.rst        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.0.17.rst b/docu=
mentation/migration-guides/release-notes-4.0.17.rst
index 1dfd10ce2..07242584b 100644
--- a/documentation/migration-guides/release-notes-4.0.17.rst
+++ b/documentation/migration-guides/release-notes-4.0.17.rst
@@ -6,7 +6,7 @@ Release notes for Yocto-4.0.17 (Kirkstone)
 Security Fixes in Yocto-4.0.17
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
--  bind: Fix :cve:`2023-4408`, :cve:`2023-50387`, :cve:`2023-50868`, :cve:=
`2023-5517` and :cve:`2023-5679`
+-  bind: Fix :cve:`2023-4408`, :cve:`2023-5517`, :cve:`2023-5679`, :cve:`2=
023-50868` and :cve:`2023-50387`
 -  binutils: Fix :cve:`2023-39129` and :cve:`2023-39130`
 -  curl: Fix :cve:`2023-46219`
 -  curl: Ignore :cve:`2023-42915`
@@ -18,13 +18,13 @@ Security Fixes in Yocto-4.0.17
 -  libgit2: Fix :cve:`2024-24575` and :cve:`2024-24577`
 -  libuv: fix :cve:`2024-24806`
 -  libxml2: Fix for :cve:`2024-25062`
--  linux-yocto/5.15: Fix :cve:`2022-36402`, :cve:`2022-40982`, :cve:`2022-=
47940`, :cve:`2023-1193`, :cve:`2023-1194`, :cve:`2023-20569`, :cve:`2023-2=
0588`, :cve:`2023-25775`, :cve:`2023-31085`, :cve:`2023-32247`, :cve:`2023-=
32250`, :cve:`2023-32252`, :cve:`2023-32254`, :cve:`2023-32257`, :cve:`2023=
-32258`, :cve:`2023-34324`, :cve:`2023-35827`, :cve:`2023-3772`, :cve:`2023=
-38427`, :cve:`2023-38430`, :cve:`2023-38431`, :cve_mitre:`2023-3867`, :cve=
:`2023-39189`, :cve:`2023-39192`, :cve:`2023-39193`, :cve:`2023-39194`, :cv=
e:`2023-39198`, :cve:`2023-40283`, :cve:`2023-4128`, :cve:`2023-4206`, :cve=
:`2023-4207`, :cve:`2023-4208`, :cve:`2023-4244`, :cve:`2023-4273`, :cve:`2=
023-42752`, :cve:`2023-42753`, :cve:`2023-42754`, :cve:`2023-42755`, :cve:`=
2023-4563`, :cve:`2023-4569`, :cve:`2023-45871`, :cve:`2023-4623`, :cve:`20=
23-46343`, :cve:`2023-46813`, :cve:`2023-46838`, :cve:`2023-46862`, :cve:`2=
023-4881`, :cve:`2023-4921`, :cve:`2023-51042`, :cve:`2023-5158`, :cve:`202=
3-51779`, :cve_mitre:`2023-52340`, :cve:`2023-52429`, :cve:`2023-52435`, :c=
ve:`2023-52436`, :cve:`2023-52438`, :cve:`2023-52439`, :cve:`2023-52441`, :=
cve:`2023-52442`, :cve:`2023-52443`, :cve:`2023-52444`, :cve:`2023-52445`, =
:cve:`2023-52448`, :cve:`2023-52449`, :cve:`2023-52451`, :cve:`2023-52454`,=
 :cve:`2023-52456`, :cve:`2023-52457`, :cve:`2023-52458`, :cve:`2023-52463`=
, :cve:`2023-52464`, :cve:`2023-5717`, :cve:`2023-6040`, :cve:`2023-6121`, =
:cve:`2023-6176`, :cve:`2023-6546`, :cve:`2023-6606`, :cve:`2023-6622`, :cv=
e:`2023-6817`, :cve:`2023-6915`, :cve:`2023-6931`, :cve:`2023-6932`, :cve:`=
2024-0340`, :cve:`2024-0584`, :cve:`2024-0607`, :cve:`2024-0641`, :cve:`202=
4-0646`, :cve:`2024-1085`, :cve:`2024-1086`, :cve:`2024-1151`, :cve:`2024-2=
2705`, :cve:`2024-23849`, :cve:`2024-23850`, :cve:`2024-23851`, :cve:`2024-=
24860`, :cve:`2024-26586`, :cve:`2024-26589`, :cve:`2024-26591`, :cve:`2024=
-26592`, :cve:`2024-26593`, :cve:`2024-26594`, :cve:`2024-26597` and :cve:`=
2024-26598`
--  linux-yocto/5.15: Ignore :cve:`2020-27418`, :cve:`2020-36766`, :cve:`20=
21-33630`, :cve:`2021-33631`, :cve:`2022-48619`, :cve:`2023-2430`, :cve:`20=
23-40791`, :cve:`2023-42756`, :cve:`2023-44466`, :cve:`2023-45862`, :cve:`2=
023-45863`, :cve:`2023-45898`, :cve:`2023-4610`, :cve:`2023-4732`, :cve:`20=
23-5090`, :cve:`2023-51043`, :cve:`2023-5178`, :cve:`2023-51780`, :cve:`202=
3-51781`, :cve:`2023-51782`, :cve:`2023-5197`, :cve:`2023-52433`, :cve:`202=
3-52440`, :cve:`2023-52446`, :cve:`2023-52450`, :cve:`2023-52453`, :cve:`20=
23-52455`, :cve:`2023-52459`, :cve:`2023-52460`, :cve:`2023-52461`, :cve:`2=
023-52462`, :cve:`2023-5345`, :cve:`2023-5633`, :cve:`2023-5972`, :cve:`202=
3-6111`, :cve:`2023-6200`, :cve:`2023-6531`, :cve:`2023-6679`, :cve:`2023-7=
192`, :cve:`2024-0193`, :cve:`2024-0443`, :cve:`2024-0562`, :cve:`2024-0582=
`, :cve:`2024-0639`, :cve:`2024-0775`, :cve:`2024-26581`, :cve:`2024-26582`=
, :cve:`2024-26590`, :cve:`2024-26596` and :cve:`2024-26599`
--  linux-yocto/5.10: Fix :cve:`2023-39198`, :cve:`2023-46838`, :cve:`2023-=
51779`, :cve:`2023-51780`, :cve:`2023-51781`, :cve:`2023-51782`, :cve_mitre=
:`2023-52340`, :cve:`2023-6040`, :cve:`2023-6121`, :cve:`2023-6606`, :cve:`=
2023-6817`, :cve:`2023-6915`, :cve:`2023-6931`, :cve:`2023-6932`, :cve:`202=
4-0584` and :cve:`2024-0646`
--  linux-yocto/5.10: Ignore :cve:`2021-33630`, :cve:`2021-33631`, :cve:`20=
22-1508`, :cve:`2022-36402`, :cve:`2022-48619`, :cve:`2023-2430`, :cve:`202=
3-4610`, :cve:`2023-46343`, :cve:`2023-51042`, :cve:`2023-51043`, :cve:`202=
3-5972`, :cve:`2023-6039`, :cve:`2023-6200`, :cve:`2023-6531`, :cve:`2023-6=
546`, :cve:`2023-6622`, :cve:`2023-6679`, :cve:`2023-7192`, :cve:`2024-0193=
`, :cve:`2024-0443`, :cve:`2024-0562`, :cve:`2024-0582`, :cve:`2024-0639`, =
:cve:`2024-0641`, :cve:`2024-0775`, :cve:`2024-1085` and :cve:`2024-22705`
+-  linux-yocto/5.15: Fix :cve:`2022-36402`, :cve:`2022-40982`, :cve:`2022-=
47940`, :cve:`2023-1193`, :cve:`2023-1194`, :cve:`2023-3772`, :cve_mitre:`2=
023-3867`, :cve:`2023-4128`, :cve:`2023-4206`, :cve:`2023-4207`, :cve:`2023=
-4208`, :cve:`2023-4244`, :cve:`2023-4273`, :cve:`2023-4563`, :cve:`2023-45=
69`, :cve:`2023-4623`, :cve:`2023-4881`, :cve:`2023-4921`, :cve:`2023-5158`=
, :cve:`2023-5717`, :cve:`2023-6040`, :cve:`2023-6121`, :cve:`2023-6176`, :=
cve:`2023-6546`, :cve:`2023-6606`, :cve:`2023-6622`, :cve:`2023-6817`, :cve=
:`2023-6915`, :cve:`2023-6931`, :cve:`2023-6932`, :cve:`2023-20569`, :cve:`=
2023-20588`, :cve:`2023-25775`, :cve:`2023-31085`, :cve:`2023-32247`, :cve:=
`2023-32250`, :cve:`2023-32252`, :cve:`2023-32254`, :cve:`2023-32257`, :cve=
:`2023-32258`, :cve:`2023-34324`, :cve:`2023-35827`, :cve:`2023-38427`, :cv=
e:`2023-38430`, :cve:`2023-38431`, :cve:`2023-39189`, :cve:`2023-39192`, :c=
ve:`2023-39193`, :cve:`2023-39194`, :cve:`2023-39198`, :cve:`2023-40283`, :=
cve:`2023-42752`, :cve:`2023-42753`, :cve:`2023-42754`, :cve:`2023-42755`, =
:cve:`2023-45871`, :cve:`2023-46343`, :cve:`2023-46813`, :cve:`2023-46838`,=
 :cve:`2023-46862`, :cve:`2023-51042`, :cve:`2023-51779`, :cve_mitre:`2023-=
52340`, :cve:`2023-52429`, :cve:`2023-52435`, :cve:`2023-52436`, :cve:`2023=
-52438`, :cve:`2023-52439`, :cve:`2023-52441`, :cve:`2023-52442`, :cve:`202=
3-52443`, :cve:`2023-52444`, :cve:`2023-52445`, :cve:`2023-52448`, :cve:`20=
23-52449`, :cve:`2023-52451`, :cve:`2023-52454`, :cve:`2023-52456`, :cve:`2=
023-52457`, :cve:`2023-52458`, :cve:`2023-52463`, :cve:`2023-52464`, :cve:`=
2024-0340`, :cve:`2024-0584`, :cve:`2024-0607`, :cve:`2024-0641`, :cve:`202=
4-0646`, :cve:`2024-1085`, :cve:`2024-1086`, :cve:`2024-1151`, :cve:`2024-2=
2705`, :cve:`2024-23849`, :cve:`2024-23850`, :cve:`2024-23851`, :cve:`2024-=
24860`, :cve:`2024-26586`, :cve:`2024-26589`, :cve:`2024-26591`, :cve:`2024=
-26592`, :cve:`2024-26593`, :cve:`2024-26594`, :cve:`2024-26597` and :cve:`=
2024-26598`
+-  linux-yocto/5.15: Ignore :cve:`2020-27418`, :cve:`2020-36766`, :cve:`20=
21-33630`, :cve:`2021-33631`, :cve:`2022-48619`, :cve:`2023-2430`, :cve:`20=
23-4610`, :cve:`2023-4732`, :cve:`2023-5090`, :cve:`2023-5178`, :cve:`2023-=
5197`, :cve:`2023-5345`, :cve:`2023-5633`, :cve:`2023-5972`, :cve:`2023-611=
1`, :cve:`2023-6200`, :cve:`2023-6531`, :cve:`2023-6679`, :cve:`2023-7192`,=
 :cve:`2023-40791`, :cve:`2023-42756`, :cve:`2023-44466`, :cve:`2023-45862`=
, :cve:`2023-45863`, :cve:`2023-45898`, :cve:`2023-51043`, :cve:`2023-51780=
`, :cve:`2023-51781`, :cve:`2023-51782`, :cve:`2023-52433`, :cve:`2023-5244=
0`, :cve:`2023-52446`, :cve:`2023-52450`, :cve:`2023-52453`, :cve:`2023-524=
55`, :cve:`2023-52459`, :cve:`2023-52460`, :cve:`2023-52461`, :cve:`2023-52=
462`, :cve:`2024-0193`, :cve:`2024-0443`, :cve:`2024-0562`, :cve:`2024-0582=
`, :cve:`2024-0639`, :cve:`2024-0775`, :cve:`2024-26581`, :cve:`2024-26582`=
, :cve:`2024-26590`, :cve:`2024-26596` and :cve:`2024-26599`
+-  linux-yocto/5.10: Fix :cve:`2023-6040`, :cve:`2023-6121`, :cve:`2023-66=
06`, :cve:`2023-6817`, :cve:`2023-6915`, :cve:`2023-6931`, :cve:`2023-6932`=
, :cve:`2023-39198`, :cve:`2023-46838`, :cve:`2023-51779`, :cve:`2023-51780=
`, :cve:`2023-51781`, :cve:`2023-51782`, :cve_mitre:`2023-52340`, :cve:`202=
4-0584` and :cve:`2024-0646`
+-  linux-yocto/5.10: Ignore :cve:`2021-33630`, :cve:`2021-33631`, :cve:`20=
22-1508`, :cve:`2022-36402`, :cve:`2022-48619`, :cve:`2023-2430`, :cve:`202=
3-4610`, :cve:`2023-5972`, :cve:`2023-6039`, :cve:`2023-6200`, :cve:`2023-6=
531`, :cve:`2023-6546`, :cve:`2023-6622`, :cve:`2023-6679`, :cve:`2023-7192=
`, :cve:`2023-46343`, :cve:`2023-51042`, :cve:`2023-51043`, :cve:`2024-0193=
`, :cve:`2024-0443`, :cve:`2024-0562`, :cve:`2024-0582`, :cve:`2024-0639`, =
:cve:`2024-0641`, :cve:`2024-0775`, :cve:`2024-1085` and :cve:`2024-22705`
 -  openssl: Fix :cve:`2024-0727`
 -  python3-pycryptodome: Fix :cve:`2023-52323`
--  qemu: Fix :cve:`2023-42467`, :cve:`2023-6693` and :cve:`2024-24474`
+-  qemu: Fix :cve:`2023-6693`, :cve:`2023-42467` and :cve:`2024-24474`
 -  vim: Fix :cve:`2024-22667`
 -  xwayland: Fix :cve:`2023-6377` and :cve:`2023-6478`
=20
--=20
2.34.1


