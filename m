Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F04C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 06:22:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.web10.13795.1724221346253053194
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Aug 2024 23:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VYippvG7;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724221346; x=1755757346;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pQsRfvQ8id/UmBxYpSQFt2R5rZ0N2J2C9xu8MgSmo7E=;
  b=VYippvG7ssDVHP7JHc5qI8xNP+v1d3PtoMe+0yzUc+hj75BjzQPe9zFC
   UheiS+DGXtQamtBFr+NSaUGpa+VFe8gLwl0bSposD9i4/ekdXZtNOYxmw
   Pui5W55fd4UFGDH+13Qe5w7VNdvg/0UeERpoXM4ag3spdlYTCAfUvjzaO
   Q91ldrghVrw1V0SklsrjnOGk02jPfJSxOthFExkC8+MNkdHF4ib3SVphi
   LKA23KUAoKtnwwDYCOZ06lt5eOsJWcxLQ6dhhW9QBWJ93qqTIrqyRetFn
   MBBhZyHJ4uPOW8KcGw2eAKCpBzr+gx/K8GuocwZCVOxobq8yV+xYGDHIN
   Q==;
X-CSE-ConnectionGUID: fCtZflghTMaxaocVlXugVQ==
X-CSE-MsgGUID: xnWqy4svTVyawzDIsk9/CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22701560"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22701560"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 23:22:25 -0700
X-CSE-ConnectionGUID: 9bsJnPqiTIaDuL2lOuC9bw==
X-CSE-MsgGUID: 9NS8LeGZTUy4svQwlIGqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61136121"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmviesa010.fm.intel.com with ESMTP; 20 Aug 2024 23:22:24 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add release notes for 5.0.3
Date: Wed, 21 Aug 2024 14:21:32 +0800
Message-Id: <20240821062132.3806249-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Aug 2024 06:22:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5336

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-5.0.rst          |   1 +
 .../migration-guides/release-notes-5.0.3.rst  | 314 ++++++++++++++++++
 2 files changed, 315 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-5.0.3.rst

diff --git a/documentation/migration-guides/release-5.0.rst b/documentation=
/migration-guides/release-5.0.rst
index 6e382bff9..1d6ba7692 100644
--- a/documentation/migration-guides/release-5.0.rst
+++ b/documentation/migration-guides/release-5.0.rst
@@ -9,3 +9,4 @@ Release 5.0 (scarthgap)
    release-notes-5.0
    release-notes-5.0.1
    release-notes-5.0.2
+   release-notes-5.0.3
diff --git a/documentation/migration-guides/release-notes-5.0.3.rst b/docum=
entation/migration-guides/release-notes-5.0.3.rst
new file mode 100644
index 000000000..5ed660c9e
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.0.3.rst
@@ -0,0 +1,314 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-5.0.3 (Scarthgap)
+-----------------------------------------
+
+Security Fixes in Yocto-5.0.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  bind: Fix :cve:`2024-0760`, :cve:`2024-1737`, :cve:`2024-1975` and :cve=
:`2024-4076`
+-  busybox: Fix :cve:`2023-42366`, :cve:`2023-42364`, :cve:`2023-42365`, :=
cve:`2021-42380` and :cve:`2023-42363`
+-  cpio: Ignore :cve:`2023-7216`
+-  curl: Fix :cve:`2024-6197`
+-  ffmpeg: Fix :cve:`2023-49502`, :cve:`2024-31578` and :cve:`2024-31582`
+-  ghostscript: Fix :cve:`2023-52722`
+-  go: Fix :cve:`2024-24790`
+-  gstreamer1.0-plugins-base: Fix :cve:`2024-4453`
+-  less: Fix :cve:`2024-32487`
+-  libxml2: Fix :cve:`2024-34459`
+-  libyaml: Ignore :cve:`2024-35328`
+-  linux-yocto/6.6: Fix :cve:`2024-23307`, :cve:`2024-24861`, :cve:`2024-2=
6642`, :cve:`2024-26643`, :cve:`2024-26654`, :cve:`2024-26656` and :cve:`20=
23-47233`
+-  linux-yocto/6.6: Ignore :cve:`2019-25160`, :cve:`2019-25162`, :cve:`202=
0-36775`, :cve:`2020-36776`, :cve:`2020-36777`, :cve:`2020-36778`, :cve:`20=
20-36779`, :cve:`2020-36780`, :cve:`2020-36781`, :cve:`2020-36782`, :cve:`2=
020-36783`, :cve:`2020-36784`, :cve:`2020-36785`, :cve:`2020-36786`, :cve:`=
2020-36787`, :cve:`2021-46904`, :cve:`2021-46905`, :cve:`2021-46906`, :cve:=
`2021-46908`, :cve:`2021-46909`, :cve:`2021-46910`, :cve:`2021-46911`, :cve=
:`2021-46912`, :cve:`2021-46913`, :cve:`2021-46914`, :cve:`2021-46915`, :cv=
e:`2021-46916`, :cve:`2021-46917`, :cve:`2021-46918`, :cve:`2021-46919`, :c=
ve:`2021-46920`, :cve:`2021-46921`, :cve:`2021-46922`, :cve:`2021-46923`, :=
cve:`2021-46924`, :cve:`2021-46925`, :cve:`2021-46926`, :cve:`2021-46927`, =
:cve:`2021-46928`, :cve:`2021-46929`, :cve:`2021-46930`, :cve:`2021-46931`,=
 :cve:`2021-46932`, :cve:`2021-46933`, :cve:`2021-46934`, :cve:`2021-46935`=
, :cve:`2021-46936`, :cve:`2021-46937`, :cve:`2021-46938`, :cve:`2021-46939=
`, :cve:`2021-46940`, :cve:`2021-46941`, :cve:`2021-46942`, :cve:`2021-4694=
3`, :cve:`2021-46944`, :cve:`2021-46945`, :cve:`2021-46947`, :cve:`2021-469=
48`, :cve:`2021-46949`, :cve:`2021-46950`, :cve:`2021-46951`, :cve:`2021-46=
952`, :cve:`2021-46953`, :cve:`2021-46954`, :cve:`2021-46955`, :cve:`2021-4=
6956`, :cve:`2021-46957`, :cve:`2021-46958`, :cve:`2021-46959`, :cve:`2021-=
46960`, :cve:`2021-46961`, :cve:`2021-46962`, :cve:`2021-46963`, :cve:`2021=
-46964`, :cve:`2021-46965`, :cve:`2021-46966`, :cve:`2021-46967`, :cve:`202=
1-46968`, :cve:`2021-46969`, :cve:`2021-46970`, :cve:`2021-46971`, :cve:`20=
21-46972`, :cve:`2021-46973`, :cve:`2021-46974`, :cve:`2021-46976`, :cve:`2=
021-46977`, :cve:`2021-46978`, :cve:`2021-46979`, :cve:`2021-46980`, :cve:`=
2021-46981`, :cve:`2021-46982`, :cve:`2021-46983`, :cve:`2021-46984`, :cve:=
`2021-46985`, :cve:`2021-46986`, :cve:`2021-46987`, :cve:`2021-46988`, :cve=
:`2021-46989`, :cve:`2021-46990`, :cve:`2021-46991`, :cve:`2021-46992`, :cv=
e:`2021-46993`, :cve:`2021-46994`, :cve:`2021-46995`, :cve:`2021-46996`, :c=
ve:`2021-46997`, :cve:`2021-46998`, :cve:`2021-46999`, :cve:`2021-47000`, :=
cve:`2021-47001`, :cve:`2021-47002`, :cve:`2021-47003`, :cve:`2021-47004`, =
:cve:`2021-47005`, :cve:`2021-47006`, :cve:`2021-47007`, :cve:`2021-47008`,=
 :cve:`2021-47009`, :cve:`2021-47010`, :cve:`2021-47011`, :cve:`2021-47012`=
, :cve:`2021-47013`, :cve:`2021-47014`, :cve:`2021-47015`, :cve:`2021-47016=
`, :cve:`2021-47017`, :cve:`2021-47018`, :cve:`2021-47019`, :cve:`2021-4702=
0`, :cve:`2021-47021`, :cve:`2021-47022`, :cve:`2021-47023`, :cve:`2021-470=
24`, :cve:`2021-47025`, :cve:`2021-47026`, :cve:`2021-47027`, :cve:`2021-47=
028`, :cve:`2021-47029`, :cve:`2021-47030`, :cve:`2021-47031`, :cve:`2021-4=
7032`, :cve:`2021-47033`, :cve:`2021-47034`, :cve:`2021-47035`, :cve:`2021-=
47036`, :cve:`2021-47037`, :cve:`2021-47038`, :cve:`2021-47039`, :cve:`2021=
-47040`, :cve:`2021-47041`, :cve:`2021-47042`, :cve:`2021-47043`, :cve:`202=
1-47044`, :cve:`2021-47045`, :cve:`2021-47046`, :cve:`2021-47047`, :cve:`20=
21-47048`, :cve:`2021-47049`, :cve:`2021-47050`, :cve:`2021-47051`, :cve:`2=
021-47052`, :cve:`2021-47053`, :cve:`2021-47054`, :cve:`2021-47055`, :cve:`=
2021-47056`, :cve:`2021-47057`, :cve:`2021-47058`, :cve:`2021-47059`, :cve:=
`2021-47060`, :cve:`2021-47061`, :cve:`2021-47062`, :cve:`2021-47063`, :cve=
:`2021-47064`, :cve:`2021-47065`, :cve:`2021-47066`, :cve:`2021-47067`, :cv=
e:`2021-47068`, :cve:`2021-47069`, :cve:`2021-47070`, :cve:`2021-47071`, :c=
ve:`2021-47072`, :cve:`2021-47073`, :cve:`2021-47074`, :cve:`2021-47075`, :=
cve:`2021-47076`, :cve:`2021-47077`, :cve:`2021-47078`, :cve:`2021-47079`, =
:cve:`2021-47080`, :cve:`2021-47081`, :cve:`2021-47082`, :cve:`2021-47083`,=
 :cve:`2021-47086`, :cve:`2021-47087`, :cve:`2021-47088`, :cve:`2021-47089`=
, :cve:`2021-47090`, :cve:`2021-47091`, :cve:`2021-47092`, :cve:`2021-47093=
`, :cve:`2021-47094`, :cve:`2021-47095`, :cve:`2021-47096`, :cve:`2021-4709=
7`, :cve:`2021-47098`, :cve:`2021-47099`, :cve:`2021-47100`, :cve:`2021-471=
01`, :cve:`2021-47102`, :cve:`2021-47103`, :cve:`2021-47104`, :cve:`2021-47=
105`, :cve:`2021-47106`, :cve:`2021-47107`, :cve:`2021-47108`, :cve:`2021-4=
7109`, :cve:`2021-47110`, :cve:`2021-47111`, :cve:`2021-47112`, :cve:`2021-=
47113`, :cve:`2021-47114`, :cve:`2021-47116`, :cve:`2021-47117`, :cve:`2021=
-47118`, :cve:`2021-47119`, :cve:`2021-47120`, :cve:`2021-47121`, :cve:`202=
1-47122`, :cve:`2021-47123`, :cve:`2021-47124`, :cve:`2021-47125`, :cve:`20=
21-47126`, :cve:`2021-47127`, :cve:`2021-47128`, :cve:`2021-47129`, :cve:`2=
021-47130`, :cve:`2021-47131`, :cve:`2021-47132`, :cve:`2021-47133`, :cve:`=
2021-47134`, :cve:`2021-47135`, :cve:`2021-47136`, :cve:`2021-47137`, :cve:=
`2021-47138`, :cve:`2021-47139`, :cve:`2021-47140`, :cve:`2021-47141`, :cve=
:`2021-47142`, :cve:`2021-47143`, :cve:`2021-47144`, :cve:`2021-47145`, :cv=
e:`2021-47146`, :cve:`2021-47147`, :cve:`2021-47148`, :cve:`2021-47149`, :c=
ve:`2021-47150`, :cve:`2021-47151`, :cve:`2021-47152`, :cve:`2021-47153`, :=
cve:`2021-47158`, :cve:`2021-47159`, :cve:`2021-47160`, :cve:`2021-47161`, =
:cve:`2021-47162`, :cve:`2021-47163`, :cve:`2021-47164`, :cve:`2021-47165`,=
 :cve:`2021-47166`, :cve:`2021-47167`, :cve:`2021-47168`, :cve:`2021-47169`=
, :cve:`2021-47170`, :cve:`2021-47171`, :cve:`2021-47172`, :cve:`2021-47173=
`, :cve:`2021-47174`, :cve:`2021-47175`, :cve:`2021-47176`, :cve:`2021-4717=
7`, :cve:`2021-47178`, :cve:`2021-47179`, :cve:`2021-47180`, :cve:`2022-486=
26`, :cve:`2022-48627`, :cve:`2022-48628`, :cve:`2022-48629` and :cve:`2022=
-48630`
+-  linux-yocto/6.6 (cont.): Ignore :cve:`2023-6270`, :cve:`2023-6356`, :cv=
e:`2023-6536`, :cve:`2023-7042`, :cve:`2023-28746`, :cve:`2023-52465`, :cve=
:`2023-52467`, :cve:`2023-52468`, :cve:`2023-52469`, :cve:`2023-52470`, :cv=
e:`2023-52471`, :cve:`2023-52472`, :cve:`2023-52473`, :cve:`2023-52474`, :c=
ve:`2023-52475`, :cve:`2023-52476`, :cve:`2023-52477`, :cve:`2023-52478`, :=
cve:`2023-52479`, :cve:`2023-52480`, :cve:`2023-52481`, :cve:`2023-52482`, =
:cve:`2023-52483`, :cve:`2023-52484`, :cve:`2023-52486`, :cve:`2023-52487`,=
 :cve:`2023-52488`, :cve:`2023-52489`, :cve:`2023-52490`, :cve:`2023-52491`=
, :cve:`2023-52492`, :cve:`2023-52493`, :cve:`2023-52494`, :cve:`2023-52495=
`, :cve:`2023-52497`, :cve:`2023-52498`, :cve:`2023-52499`, :cve:`2023-5250=
0`, :cve:`2023-52501`, :cve:`2023-52502`, :cve:`2023-52503`, :cve:`2023-525=
04`, :cve:`2023-52505`, :cve:`2023-52506`, :cve:`2023-52507`, :cve:`2023-52=
508`, :cve:`2023-52509`, :cve:`2023-52510`, :cve:`2023-52511`, :cve:`2023-5=
2512`, :cve:`2023-52513`, :cve:`2023-52515`, :cve:`2023-52516`, :cve:`2023-=
52517`, :cve:`2023-52518`, :cve:`2023-52519`, :cve:`2023-52520`, :cve:`2023=
-52522`, :cve:`2023-52523`, :cve:`2023-52524`, :cve:`2023-52525`, :cve:`202=
3-52526`, :cve:`2023-52527`, :cve:`2023-52528`, :cve:`2023-52529`, :cve:`20=
23-52530`, :cve:`2023-52531`, :cve:`2023-52532`, :cve:`2023-52559`, :cve:`2=
023-52560`, :cve:`2023-52561`, :cve:`2023-52562`, :cve:`2023-52563`, :cve:`=
2023-52564`, :cve:`2023-52565`, :cve:`2023-52566`, :cve:`2023-52567`, :cve:=
`2023-52568`, :cve:`2023-52569`, :cve:`2023-52570`, :cve:`2023-52571`, :cve=
:`2023-52572`, :cve:`2023-52573`, :cve:`2023-52574`, :cve:`2023-52575`, :cv=
e:`2023-52576`, :cve:`2023-52577`, :cve:`2023-52578`, :cve:`2023-52580`, :c=
ve:`2023-52581`, :cve:`2023-52582`, :cve:`2023-52583`, :cve:`2023-52584`, :=
cve:`2023-52587`, :cve:`2023-52588`, :cve:`2023-52589`, :cve:`2023-52591`, =
:cve:`2023-52593`, :cve:`2023-52594`, :cve:`2023-52595`, :cve:`2023-52596`,=
 :cve:`2023-52597`, :cve:`2023-52598`, :cve:`2023-52599`, :cve:`2023-52600`=
, :cve:`2023-52601`, :cve:`2023-52602`, :cve:`2023-52603`, :cve:`2023-52604=
`, :cve:`2023-52606`, :cve:`2023-52607`, :cve:`2023-52608`, :cve:`2023-5260=
9`, :cve:`2023-52610`, :cve:`2023-52611`, :cve:`2023-52612`, :cve:`2023-526=
13`, :cve:`2023-52614`, :cve:`2023-52615`, :cve:`2023-52616`, :cve:`2023-52=
617`, :cve:`2023-52618`, :cve:`2023-52619`, :cve:`2023-52620`, :cve:`2023-5=
2621`, :cve:`2023-52622`, :cve:`2023-52623`, :cve:`2023-52626`, :cve:`2023-=
52627`, :cve:`2023-52628`, :cve:`2023-52629`, :cve:`2023-52630`, :cve:`2023=
-52631`, :cve:`2023-52632`, :cve:`2023-52633`, :cve:`2023-52635`, :cve:`202=
3-52636`, :cve:`2023-52637`, :cve:`2023-52638`, :cve:`2023-52639`, :cve:`20=
23-52640`, :cve:`2023-52641`, :cve:`2024-0841`, :cve:`2024-22099`, :cve:`20=
24-23196`, :cve:`2024-26600`, :cve:`2024-26601`, :cve:`2024-26602`, :cve:`2=
024-26603`, :cve:`2024-26604`, :cve:`2024-26605`, :cve:`2024-26606`, :cve:`=
2024-26607`, :cve:`2024-26608`, :cve:`2024-26610`, :cve:`2024-26611`, :cve:=
`2024-26612`, :cve:`2024-26614`, :cve:`2024-26615`, :cve:`2024-26616`, :cve=
:`2024-26617`, :cve:`2024-26618`, :cve:`2024-26619`, :cve:`2024-26620`, :cv=
e:`2024-26621`, :cve:`2024-26622`, :cve:`2024-26623`, :cve:`2024-26625`, :c=
ve:`2024-26626`, :cve:`2024-26627`, :cve:`2024-26629`, :cve:`2024-26630`, :=
cve:`2024-26631`, :cve:`2024-26632`, :cve:`2024-26633`, :cve:`2024-26634`, =
:cve:`2024-26635`, :cve:`2024-26636`, :cve:`2024-26637`, :cve:`2024-26638`,=
 :cve:`2024-26639`, :cve:`2024-26640`, :cve:`2024-26641`, :cve:`2024-26644`=
, :cve:`2024-26645`, :cve:`2024-26646`, :cve:`2024-26647`, :cve:`2024-26648=
`, :cve:`2024-26649`, :cve:`2024-26650`, :cve:`2024-26651`, :cve:`2024-2665=
2`, :cve:`2024-26653`, :cve:`2024-26657`, :cve:`2024-26659`, :cve:`2024-266=
60`, :cve:`2024-26661`, :cve:`2024-26662`, :cve:`2024-26663`, :cve:`2024-26=
664`, :cve:`2024-26665`, :cve:`2024-26666`, :cve:`2024-26667`, :cve:`2024-2=
6668`, :cve:`2024-26669`, :cve:`2024-26670`, :cve:`2024-26671`, :cve:`2024-=
26673`, :cve:`2024-26674`, :cve:`2024-26675`, :cve:`2024-26676`, :cve:`2024=
-26677`, :cve:`2024-26678`, :cve:`2024-26679`, :cve:`2024-26680`, :cve:`202=
4-26681`, :cve:`2024-26682`, :cve:`2024-26683`, :cve:`2024-26684`, :cve:`20=
24-26685`, :cve:`2024-26687`, :cve:`2024-26688`, :cve:`2024-26689`, :cve:`2=
024-26690`, :cve:`2024-26691`, :cve:`2024-26692`, :cve:`2024-26693`, :cve:`=
2024-26694`, :cve:`2024-26695`, :cve:`2024-26696`, :cve:`2024-26697`, :cve:=
`2024-26698`, :cve:`2024-26700`, :cve:`2024-26702`, :cve:`2024-26703`, :cve=
:`2024-26704`, :cve:`2024-26705`, :cve:`2024-26706`, :cve:`2024-26707`, :cv=
e:`2024-26708`, :cve:`2024-26709`, :cve:`2024-26710`, :cve:`2024-26711`, :c=
ve:`2024-26712`, :cve:`2024-26713`, :cve:`2024-26714`, :cve:`2024-26715`, :=
cve:`2024-26716`, :cve:`2024-26717`, :cve:`2024-26718`, :cve:`2024-26719`, =
:cve:`2024-26720`, :cve:`2024-26721`, :cve:`2024-26722`, :cve:`2024-26723`,=
 :cve:`2024-26724`, :cve:`2024-26725`, :cve:`2024-26726`, :cve:`2024-26727`=
, :cve:`2024-26728`, :cve:`2024-26729`, :cve:`2024-26730`, :cve:`2024-26731=
`, :cve:`2024-26732`, :cve:`2024-26733`, :cve:`2024-26734`, :cve:`2024-2673=
5`, :cve:`2024-26736`, :cve:`2024-26737`, :cve:`2024-26738`, :cve:`2024-267=
39`, :cve:`2024-26740`, :cve:`2024-26741`, :cve:`2024-26742`, :cve:`2024-26=
743`, :cve:`2024-26744`, :cve:`2024-26745`, :cve:`2024-26746`, :cve:`2024-2=
6747`, :cve:`2024-26748`, :cve:`2024-26749`, :cve:`2024-26750`, :cve:`2024-=
26751`, :cve:`2024-26752`, :cve:`2024-26753`, :cve:`2024-26754`, :cve:`2024=
-26755`, :cve:`2024-26759`, :cve:`2024-26760`, :cve:`2024-26761`, :cve:`202=
4-26762`, :cve:`2024-26763`, :cve:`2024-26764`, :cve:`2024-26765`, :cve:`20=
24-26766`, :cve:`2024-26767`, :cve:`2024-26768`, :cve:`2024-26769`, :cve:`2=
024-26770`, :cve:`2024-26771`, :cve:`2024-26772`, :cve:`2024-26773`, :cve:`=
2024-26774`, :cve:`2024-26775`, :cve:`2024-26776`, :cve:`2024-26777`, :cve:=
`2024-26778`, :cve:`2024-26779`, :cve:`2024-26780`, :cve:`2024-26781`, :cve=
:`2024-26782`, :cve:`2024-26783`, :cve:`2024-26786`, :cve:`2024-26787`, :cv=
e:`2024-26788`, :cve:`2024-26789`, :cve:`2024-26790`, :cve:`2024-26791`, :c=
ve:`2024-26792`, :cve:`2024-26793`, :cve:`2024-26794`, :cve:`2024-26795`, :=
cve:`2024-26796`, :cve:`2024-26798`, :cve:`2024-26799`, :cve:`2024-26800`, =
:cve:`2024-26801`, :cve:`2024-26802`, :cve:`2024-26803`, :cve:`2024-26804`,=
 :cve:`2024-26805`, :cve:`2024-26807`, :cve:`2024-26808` and :cve:`2024-268=
09`
+-  llvm: Fix :cve:`2024-0151`
+-  ofono: Fix :cve:`2023-2794`
+-  openssh: Fix :cve:`2024-6387` and :cve:`2024-39894`
+-  openssl: Fix :cve:`2024-5535`
+-  pam: Fix :cve:`2024-22365`
+-  python3-idna: Fix :cve:`2024-3651`
+-  qemu: Fix :cve:`2023-6683`, :cve:`2024-3446`, :cve_mitre:`2024-3447`, :=
cve:`2024-3567`, :cve:`2024-26327` and :cve:`2024-26328`
+-  ruby: Fix :cve:`2023-36617` and :cve:`2024-27281`
+-  vte: Fix :cve:`2024-37535`
+-  wget: Fix for :cve:`2024-38428`
+
+
+Fixes in Yocto-5.0.3
+~~~~~~~~~~~~~~~~~~~~
+
+-  apt-native: don't let dpkg overwrite files by default
+-  archiver.bbclass: Fix work-shared checking for kernel recipes
+-  automake: mark new_rt_path_for_test-driver.patch as Inappropriate
+-  bash: fix configure checks that fail with GCC 14.1
+-  bind: upgrade to 9.18.28
+-  binutils: stable 2.42 branch updates
+-  bitbake: codeparser/data: Ensure module function contents changing is a=
ccounted for
+-  bitbake: codeparser: Skip non-local functions for module dependencies
+-  build-appliance-image: Update to scarthgap head revision
+-  cargo: remove True option to getVar calls
+-  classes/create-spdx-2.2: Fix :term:`SPDX` Namespace Prefix
+-  classes/kernel: No symlink in postinst without KERNEL_IMAGETYPE_SYMLINK
+-  cmake-qemu.bbclass: fix if criterion
+-  create-spdx-3.0/populate_sdk_base: Add SDK_CLASSES inherit mechanism to=
 fix tarball :term:`SPDX` manifests
+-  create-spdx-'*': Support multilibs via SPDX_MULTILIB_SSTATE_ARCHS
+-  curl: correct the :term:`PACKAGECONFIG` for native/nativesdk
+-  curl: locale-base-en-us isn't glibc-specific
+-  curl: skip FTP tests in run-ptest
+-  cve-check: Introduce CVE_CHECK_MANIFEST_JSON_SUFFIX
+-  cve-exclusion: Drop the version comparision/warning
+-  devtool: ide-sdk: correct help typo
+-  dnf: Fix missing leading whitespace with ':append'
+-  dpkg: mark patches adding custom non-debian architectures as inappropri=
ate for upstream
+-  ed: upgrade to 1.20.2
+-  expect: fix configure with GCC 14
+-  ffmpeg: backport patch to fix errors with GCC 14
+-  ffmpeg: backport patches to use new Vulkan AV1 codec API
+-  flac: fix buildpaths warnings
+-  fribidi: upgrade to 1.0.14
+-  gawk: Remove References to /usr/local/bin/gawk
+-  gawk: update patch status
+-  gettext: fix a parallel build issue
+-  ghostscript: upgrade to 10.03.1
+-  glib-networking: submit eagain.patch upstream
+-  glibc: cleanup old cve status
+-  glibc: stable 2.39 branch updates
+-  glslang: mark 0001-generate-glslang-pkg-config.patch as Inappropriate
+-  go: drop the old 1.4 bootstrap C version
+-  go: upgrade to 1.22.5
+-  gpgme: move gpgme-tool to own sub-package
+-  grub,grub-efi: Remove -mfpmath=3Dsse on x86
+-  grub: mark grub-module-explicitly-keeps-symbole-.module_license.patch a=
s a workaround
+-  gstreamer1.0: skip another known flaky test
+-  gstreamer: upgrade to 1.22.12
+-  insane.bbclass: fix `HOST_` variable names
+-  insane.bbclass: remove leftover variables and comment
+-  insane.bbclass: remove skipping of cross-compiled packages
+-  insane: handle dangling symlinks in the libdir QA check
+-  iptables: fix memory corruption when parsing nft rules
+-  iptables: fix save/restore symlinks with libnftnl :term:`PACKAGECONFIG`=
 enabled
+-  iptables: submit 0001-configure-Add-option-to-enable-disable-libnfnetli=
nk.patch upstream
+-  kexec-tools: submit 0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue=
.patch upstream
+-  layer.conf: Add os-release to :term:`SIGGEN_EXCLUDERECIPES_ABISAFE`
+-  libacpi: mark patches as inactive-upstream
+-  libadwaita: upgrade to 1.5.1
+-  libcap-ng-python: upgrade to 0.8.5
+-  libcap-ng: upgrade to 0.8.5
+-  libmnl: explicitly disable doxygen
+-  libnl: change :term:`HOMEPAGE`
+-  libpam: fix runtime error in pam_pwhistory moudle
+-  libpng: update :term:`SRC_URI`
+-  libportal: fix rare build race
+-  libstd-rs: set :term:`CVE_PRODUCT` to rust
+-  libxcrypt: correct the check for a working libucontext.h
+-  libxml2: upgrade to 2.12.8
+-  linux-yocto-custom: Fix comment override syntax
+-  linux-yocto/6.6: cfg: drop obselete options
+-  linux-yocto/6.6: cfg: introduce Intel NPU fragment
+-  linux-yocto/6.6: fix AMD boot trace
+-  linux-yocto/6.6: fix kselftest failures
+-  linux-yocto/6.6: intel configuration changes
+-  linux-yocto/6.6: nft: enable veth
+-  linux-yocto/6.6: update to v6.6.35
+-  linux-yocto: Enable team net driver
+-  linuxloader: add -armhf on arm only for :term:`TARGET_FPU` 'hard'
+-  llvm: upgrade to 18.1.6
+-  maintainers.inc: update self e-mail address
+-  maintainers: Drop go-native as recipe removed
+-  mesa: Fix missing leading whitespace with ':append'
+-  mesa: remove obsolete 0001-meson.build-check-for-all-linux-host_os-comb=
inations.patch
+-  mesa: upgrade to 24.0.7
+-  meson: don't use deprecated pkgconfig variable
+-  migration-guides: add release notes for 4.0.19
+-  migration-guides: add release notes for 5.0.2
+-  migration-notes: add release notes for 5.0.1
+-  mmc-utils: fix URL
+-  mobile-broadband-provider-info: upgrade to 20240407
+-  multilib.bbclass: replace deprecated e.data with d
+-  multilib.conf: remove appending to :term:`PKG_CONFIG_PATH`
+-  nasm: upgrade to 2.16.03
+-  ncurses: switch to new mirror
+-  oeqa/runtime/scp: requires openssh-sftp-server
+-  oeqa/runtime: fix race-condition in minidebuginfo test
+-  oeqa/runtime: fix regression in minidebuginfo test
+-  oeqa/runtime: make minidebuginfo test work with coreutils
+-  oeqa/sdk/case: Ensure :term:`DL_DIR` is populated with artefacts if used
+-  oeqa/sdk/case: Skip SDK test cases when :term:`TCLIBC` is newlib
+-  oeqa/selftest/devtool: Fix for usrmerge in :term:`DISTRO_FEATURES`
+-  oeqa/selftest/recipetool: Fix for usrmerge in :term:`DISTRO_FEATURES`
+-  openssh: drop rejected patch fixed in 8.6p1 release
+-  openssh: systemd notification was implemented upstream
+-  openssh: systemd sd-notify patch was rejected upstream
+-  orc: upgrade to 0.4.39
+-  package.py: Fix static debuginfo split
+-  package.py: Fix static library processing
+-  pcmanfm: Disable incompatible-pointer-types warning as error
+-  perl: submit the rest of determinism.patch upstream
+-  pixman: fixing inline failure with -Og
+-  poky.conf: bump version for 5.0.3
+-  populate_sdk_ext.bbclass: Fix undefined variable error
+-  pseudo: Fix to work with glibc 2.40
+-  pseudo: Update to include open symlink handling bugfix
+-  pseudo: Update to pull in python 3.12+ fix
+-  python3-attrs: drop python3-ctypes from :term:`RDEPENDS`
+-  python3-bcrypt: drop python3-six from :term:`RDEPENDS`
+-  python3-idna: upgrade to 3.7
+-  python3-jinja2: upgrade to 3.1.4
+-  python3-pyopenssl: drop python3-six from :term:`RDEPENDS`
+-  python3-requests: cleanup :term:`RDEPENDS`
+-  python3-setuptools: drop python3-2to3 from :term:`RDEPENDS`
+-  python3: Treat UID/GID overflow as failure
+-  python3: skip test_concurrent_futures/test_deadlock
+-  python3: skip test_multiprocessing/test_active_children test
+-  python3: submit deterministic_imports.patch upstream as a ticket
+-  python3: upgrade to 3.12.4
+-  qemu: upgrade to 8.2.3
+-  rng-tools: ignore incompatible-pointer-types errors for now
+-  rt-tests: rt_bmark.py: fix TypeError
+-  rust-cross-canadian: set :term:`CVE_PRODUCT` to rust
+-  rust: Add new varaible RUST_ENABLE_EXTRA_TOOLS
+-  sanity: Check if tar is gnutar
+-  sdk: Fix path length limit to match reserved size
+-  selftest-hardlink: Add additional test cases
+-  selftest/cases/runtime_test: Exclude centos-9 from virgl tests
+-  selftest: add Upstream-Status to .patch files
+-  settings-daemon: submit addsoundkeys.patch upstream and update to a rev=
ision that has it
+-  systemd.bbclass: Clarify error message
+-  tcp-wrappers: mark all patches as inactive-upstream
+-  tzdata: Add tzdata.zi to tzdata-core package
+-  vorbis: mark patch as Inactive-Upstream
+-  vulkan-samples: fix do_compile error when -Og enabled
+-  watchdog: Set watchdog_module in default config
+-  webkitgtk: fix do_compile errors on beaglebone-yocto
+-  webkitgtk: fix do_configure error on beaglebone-yocto
+-  weston: upgrade to 13.0.1
+-  wic/partition.py: Set hash_seed for empty ext partition
+-  wic: bootimg-efi: fix error handling
+-  wic: engine.py: use raw string for escape sequence
+-  wireless-regdb: upgrade to 2024.05.08
+-  xserver-xorg: upgrade to 21.1.13
+-  xz: Update :term:`LICENSE` variable for xz packages
+
+
+Known Issues in Yocto-5.0.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  N/A
+
+
+Contributors to Yocto-5.0.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Adithya Balakumar
+-  Aleksandar Nikolic
+-  Alexander Kanavin
+-  Antonin Godard
+-  Archana Polampalli
+-  Ashish Sharma
+-  Benjamin Sz=C5=91ke
+-  Bruce Ashfield
+-  Changqing Li
+-  Chen Qi
+-  Christian Taedcke
+-  Deepthi Hemraj
+-  Denys Dmytriyenko
+-  Dmitry Baryshkov
+-  Emil Kronborg
+-  Enrico J=C3=B6rns
+-  Etienne Cordonnier
+-  Gu=C3=B0ni M=C3=A1r Gilbert
+-  Hitendra Prajapati
+-  Jonas Gorski
+-  Jookia
+-  Jose Quaresma
+-  Joshua Watt
+-  J=C3=B6rg Sommer
+-  Kai Kang
+-  Khem Raj
+-  Kirill Yatsenko
+-  Lee Chee Yang
+-  Mark Hatle
+-  Markus Volk
+-  Martin Jansa
+-  Michael Opdenacker
+-  Mingli Yu
+-  Niko Mauno
+-  Patrick Wicki
+-  Peter Marko
+-  Quentin Schulz
+-  Ranjitsinh Rathod
+-  Richard Purdie
+-  Robert Kovacsics
+-  Ross Burton
+-  Siddharth Doshi
+-  Simone Wei=C3=9F
+-  Soumya Sambu
+-  Steve Sakoman
+-  Sundeep KOKKONDA
+-  Trevor Gamblin
+-  Vijay Anusuri
+-  Wadim Egorov
+-  Wang Mingyu
+-  Xiangyu Chen
+-  Yi Zhao
+-  Yogita Urade
+-  Zahir Hussain
+
+
+Repositories / Downloads for Yocto-5.0.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`scarthgap </poky/log/?h=3Dscarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.3 </poky/log/?h=3Dyocto-5.0.3>`
+-  Git Revision: :yocto_git:`0b37512fb4b231cc106768e2a7328431009b3b70 </po=
ky/commit/?id=3D0b37512fb4b231cc106768e2a7328431009b3b70>`
+-  Release Artefact: poky-0b37512fb4b231cc106768e2a7328431009b3b70
+-  sha: b37fe0b2f6a685ee94b4af55f896cbf52ba69023e10eb21d3e54798ca21ace79
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0.3/poky-0b375=
12fb4b231cc106768e2a7328431009b3b70.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0.3/poky-0b37512fb4b231cc=
106768e2a7328431009b3b70.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`scarthgap </openembedded-core/log/?h=3Dscarthgap>`
+-  Tag:  :oe_git:`yocto-5.0.3 </openembedded-core/log/?h=3Dyocto-5.0.3>`
+-  Git Revision: :oe_git:`236ac1b43308df722a78d3aa20aef065dfae5b2b </opene=
mbedded-core/commit/?id=3D236ac1b43308df722a78d3aa20aef065dfae5b2b>`
+-  Release Artefact: oecore-236ac1b43308df722a78d3aa20aef065dfae5b2b
+-  sha: 44b89feba9563c2281c8c2f45037dd7c312fb20e8b7d9289b25f0ea0fe1fc2c4
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0.3/oecore-236=
ac1b43308df722a78d3aa20aef065dfae5b2b.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0.3/oecore-236ac1b43308df=
722a78d3aa20aef065dfae5b2b.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`scarthgap </meta-mingw/log/?h=3Dscarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.3 </meta-mingw/log/?h=3Dyocto-5.0.3>`
+-  Git Revision: :yocto_git:`acbba477893ef87388effc4679b7f40ee49fc852 </me=
ta-mingw/commit/?id=3Dacbba477893ef87388effc4679b7f40ee49fc852>`
+-  Release Artefact: meta-mingw-acbba477893ef87388effc4679b7f40ee49fc852
+-  sha: 3b7c2f475dad5130bace652b150367f587d44b391218b1364a8bbc430b48c54c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0.3/meta-mingw=
-acbba477893ef87388effc4679b7f40ee49fc852.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0.3/meta-mingw-acbba47789=
3ef87388effc4679b7f40ee49fc852.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.8 </bitbake/log/?h=3D2.8>`
+-  Tag:  :oe_git:`yocto-5.0.3 </bitbake/log/?h=3Dyocto-5.0.3>`
+-  Git Revision: :oe_git:`11d83170922a2c6b9db1f6e8c23e533526984b2c </bitba=
ke/commit/?id=3D11d83170922a2c6b9db1f6e8c23e533526984b2c>`
+-  Release Artefact: bitbake-11d83170922a2c6b9db1f6e8c23e533526984b2c
+-  sha: 9643433748d7ed80d6334124390271929566b3bc076dad0f6e6be1ec6d753b8d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-5.0.3/bitbake-11=
d83170922a2c6b9db1f6e8c23e533526984b2c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-5.0.3/bitbake-11d83170922a2=
c6b9db1f6e8c23e533526984b2c.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=3Dscarthgap>`
+-  Tag: :yocto_git:`yocto-5.0.3 </yocto-docs/log/?h=3Dyocto-5.0.3>`
+-  Git Revision: :yocto_git:`TBD </yocto-docs/commit/?id=3DTBD>`
+
+
--=20
2.34.1


