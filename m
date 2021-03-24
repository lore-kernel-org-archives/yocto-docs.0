Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web09.5020.1616589344510618459
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 05:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6eMEFEoe;
 spf=pass (domain: pelion.com, ip: 40.107.7.59, mailfrom: janne.kiiskila@pelion.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UIN22lpYX9LKMq+5xdCbY7ZWLhVpeZpZjtMuMbU4mA=;
 b=6eMEFEoerxzRnMp7KKefcgbOhUzqyntU2zuOddekyW0NEYzgW+IA7U1L4ob9O1Mnd24GkeNfiRr5ERMsZ5I9/vrmffJcCyQ8zC/2dn3VOBczsg62oeXk3D54cybaLdsG0B99BH5ZADVM0V/ZZ2YPoSTj6dLht/I2RHdvGgR9vZ4=
Received: from DB6PR0201CA0023.eurprd02.prod.outlook.com (2603:10a6:4:3f::33)
 by DB8PR08MB3979.eurprd08.prod.outlook.com (2603:10a6:10:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 12:35:40 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::c) by DB6PR0201CA0023.outlook.office365.com
 (2603:10a6:4:3f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Wed, 24 Mar 2021 12:35:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=pelion.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=none
 action=none header.from=pelion.com;
Received-SPF: Fail (protection.outlook.com: domain of pelion.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 12:35:40 +0000
Received: ("Tessian outbound 7d88ebbbfeee:v89"); Wed, 24 Mar 2021 12:35:40 +0000
X-CR-MTA-TID: 64aa7808
Received: from 57fdea3cb927.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D39D1939-6636-43F7-84F9-B5047B72018E.1;
	Wed, 24 Mar 2021 12:35:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57fdea3cb927.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 Mar 2021 12:35:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jL7aMyMP4XXhMptrIaJjurXE1fNRP70ZVMEITBs5QUemGo4MBcAAZKNmGBoCbi6I8nw9Ut6OXEKyyqcbFHcJuJw0DuKsC1cJ6B4bUAcra2CnU+fnXigof7cXYoT5+bDZOGMg3sX5Tih38QO4zjk1hPhKR4aiLCzDFTj4ucZJv6F0RgtGUZ2gQuZ/UsO5qsdhaqOR8V35FVRSFedY9hE2Z8ASlAT5KnF1hrR6icDHD+0l36LwcqGvH0bQUqBGpHcFpLMna2lk+ol2V49R5Xce+jxahOaR6nLssRoeDl7YSP6gW3hhOsJAZoBGxwO5/rIDNCGsGyFF4nMaOKri0Mp/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UIN22lpYX9LKMq+5xdCbY7ZWLhVpeZpZjtMuMbU4mA=;
 b=F858+zVybdrt4Z+UMV4ziLWHozfdC1wrhg3UeqlYt0KnbiN/Z2r+N4MKfuZ7fg2p7PLoPcw/wAvd0DI9dl1Jzfx9HEQhkn9TX/nkecyRHldSm0RNhJUcmSGLCd8j5/eCC/CNNQF529hANH6JFYqEallmZXzFwdduU0YmfbCcioH7k0lYr/Bivxn3pM+wg5lRabD/VIWUPADeFXJi3LmBA1bsGNgQpgX5MRzDt74LPYlfvKWLDXHUS0ncKdXK6JSaaKOanynnaI4Pihq+JJLMIVVSALqVzTyfDvX8iKaid84b98jVMbTRztmWpzgktYFDRKsOA0VqRfLHjOn/1BN+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pelion.com; dmarc=pass action=none header.from=pelion.com;
 dkim=pass header.d=pelion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UIN22lpYX9LKMq+5xdCbY7ZWLhVpeZpZjtMuMbU4mA=;
 b=6eMEFEoerxzRnMp7KKefcgbOhUzqyntU2zuOddekyW0NEYzgW+IA7U1L4ob9O1Mnd24GkeNfiRr5ERMsZ5I9/vrmffJcCyQ8zC/2dn3VOBczsg62oeXk3D54cybaLdsG0B99BH5ZADVM0V/ZZ2YPoSTj6dLht/I2RHdvGgR9vZ4=
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19)
 by DBBPR08MB5882.eurprd08.prod.outlook.com (2603:10a6:10:200::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 12:35:32 +0000
Received: from DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::380f:e6cd:ff32:f81d]) by DBAPR08MB5558.eurprd08.prod.outlook.com
 ([fe80::380f:e6cd:ff32:f81d%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 12:35:32 +0000
From: "Janne Kiiskila" <janne.kiiskila@pelion.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: [PATCH v2] UBUNTU sudo apt git instead of git-core
Thread-Topic: [PATCH v2] UBUNTU sudo apt git instead of git-core
Thread-Index: AdcgnHjcKKKf5MF2TIqvq1zSCjsWNQ==
Date: Wed, 24 Mar 2021 12:35:32 +0000
Message-ID: 
 <DBAPR08MB55580B8D8BF0C1EFBB404545F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 5CBE272C46723944B52302454180B6A1.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=pelion.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5690412f-d4f3-4128-fc2d-08d8eec15579
x-ms-traffictypediagnostic: DBBPR08MB5882:|DB8PR08MB3979:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB39799D4F8B09427D86CBC667F3639@DB8PR08MB3979.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 w2k0Zo8t7jTsTugeJRSPtxTs1E+l5KK8WZ3YE/SjIWjoPbCGr6+GMuhZmBUuAMdUzEXAU0bgFP8/sAgUgSpaKCk3qh+BIRshFrWaRapCncN7K2Bosb6L1qWPiDDnW4PKGpVxCfUOXMs6g9P94Bz9D574IZbHbG6eTwYspXTQLKlxiyo9wHzYI5PVLtVsfPjR9PEAJTL6F8EFx+8fOHTeWl5i3PzKk49cb27rqyn5LtZ6noG/aJ7BWcABYJ6B0LhXWtXtaNsIpWcU048BBRFy8brxjUWdoPPP2xD+9wWIIUkuCa5EWnfm3Ay6PZC6XoRJ6wB/xiTKi7r4VFO4wuRCYw5u3Ai6l89fjWkQ+sOj60ePDxDiZMXrcts7hN8pOJsuiN0BicaqLhZ19DGrY1lr6UtOM1J47VrrkJhhs6V7RoOYzfXb3dkFzsCCpDz/NNWEuaGsnd4ufpXd16ALMr/2eUWCbfjPQw5U0JziCtRhgE34DlmkR2uiqCUMxPHLs8eAtCMu3Eq8dMaADbc9Gt9s5PClWR5zSKoh5KjBI0LpKFWq5wyD7zdgmGNsxQYOKJXsnfeHSTjHfjktskm5UqN8I5wBaYiS7EXEtBdLA538cKNFU17Vy0Xa7yJcAYhq0E1UhfU5KtGcXllTfN6oR3CbBPz9HV7dBuQasVbIbc0rT+IwWrMdIg91z5OTEWo91BrAsp2NPwnmjOl9+X7gfz+sw+zh4TEpYQwUnYStC20RZeXxKl3EFU9aWpJJQrH3aW2O
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5558.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(7696005)(316002)(53546011)(55016002)(478600001)(5660300002)(38100700001)(83380400001)(966005)(26005)(6916009)(186003)(6506007)(52536014)(66446008)(8936002)(71200400001)(66476007)(8676002)(33656002)(2906002)(66946007)(86362001)(9686003)(64756008)(166002)(76116006)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?4ENJx9QIQ8s506zc4efDfpidfz7kBBgWvcJLNV4eqwUZ6yss0CUztwEsLzvo?=
 =?us-ascii?Q?F9xMPKv7yBc8dnnIoncYwI8CIAc89HDdKWKpF2HB3RsRrav+2nPfNKSVcSPQ?=
 =?us-ascii?Q?/1N0NSDp9DYzinT7frMTvltQ4PoVmtAhVA5vtnXuGgazf3/FX49Wk+p94VO6?=
 =?us-ascii?Q?wasJXeQ1TurySzpkfwYOMdEz7hjNtfQd2CGFLYZG7fQQ/2THfdN4e/yzSwcv?=
 =?us-ascii?Q?tIHFsjjDYL6H/3OB3fIC8/UNHvyM/YHtrwiw9eNVCFtwBKGCTGienMFHYOSg?=
 =?us-ascii?Q?kx+6rSq+cY38qN7udRM9r0/EGkv3KJc5CCmiAfzB5R4VAcqiZC37dntLtjxX?=
 =?us-ascii?Q?CjHNBu8kprMuzAA9RKBtp+SSBUao7LvcmYGwTuHFD2Phb2PNy69Tgglgttyt?=
 =?us-ascii?Q?96TTvQPYJbR0IxW/HBUSygnfKlN2+Yc+VVDaFETgge7WrFY4KFRvPC4y5VyK?=
 =?us-ascii?Q?2m5D4/41UKMnRo0C3c5pFRwkqKt5CaIIIexTNAYo7zaGqsQpsxbmY6IO4okO?=
 =?us-ascii?Q?a96PApVcEqTYJo3yAdivvquQOSTSRz8YHOeRI64IuA60l/GPcKOkaL3q7D+9?=
 =?us-ascii?Q?PuSEFCel4i5x0MqER+FSv8vTAzwPNQ6K09STpx7Rzxu38C+KB1lYZHPH1SWr?=
 =?us-ascii?Q?QBLXgaTVpx0gqY9tNeOoc2NGcXD1KSVbr9ypa+EG0cfkvjL3ikfgkiZ4OxuH?=
 =?us-ascii?Q?VgpVEZdhIsTHXCGCyXkg3ikIKnvDQJQprwweVG74BtuNROXxx7WWu/LvsGNL?=
 =?us-ascii?Q?IKJ4WIqybDM9qy7nOoppz5+z5hXtBfzJzVeT/BEkIhp9txZmyRttfZv/NChG?=
 =?us-ascii?Q?1wcsykgBWHCxArwvyCCyaVVzZ2exmYDxJamAkwqHRJeg6erOJXB3ZMZs8KXE?=
 =?us-ascii?Q?im88YIAbBI8A0OJNIRvAOClj4fb1AF9xAorJ5EfFBYWOREf6eguDz58xP4GR?=
 =?us-ascii?Q?sHZXeVjUSL4Q2d/bMf/Iakef2NF0N4D2wO37+G+3TyLwjCd3QHkC1i5veaNV?=
 =?us-ascii?Q?q3Oi6uOLcxI7deDPl70TZ9qruQNiaydSDe9QNKaLEKJrqivBxRZEjxBosfe/?=
 =?us-ascii?Q?yIyKWMgUOCHsLucF5gwnsAvff82LBr8YSybCYeTMuhhSv2ARP3l6NW/KI2HD?=
 =?us-ascii?Q?BfsIHEeN4tcRBFY4AUjC3pVLZMLWrj3+HnC8+YSViwfe3WezU4G16s1SIGAA?=
 =?us-ascii?Q?eYQkCR2RqSi53ehIND4vjYe8Cm9DyekfDt9rfaPisAT2zQIHWmErCx+v1cPq?=
 =?us-ascii?Q?WgPcvVzv4tGTtBIkTJ0UI6CdEeCYwCrgIyyVmP0LAAjy5jBSp1KOotNyb5FD?=
 =?us-ascii?Q?8ztLyQF+C/BjF4RccinAXhcG?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5882
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=pelion.com;
Return-Path: Janne.Kiiskila@pelion.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a0b6f6fd-2419-41ac-3b86-08d8eec150c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E7KiWRjgD5BKC24oI/gWz4A6PpLOCh8IUOLFgunDJIZiyAM4qOcBTZutBZjGCuKU/JnDEG6Wp/tNJTmCYZ7+TqE4xK2I1HIH9Z2a9xGa3vM3aR+at1c7OH8gVoXMJGUPOl6nsNT0EYVd7FsdLpXBoQeKFYVUvC1cR726o0f9GPpuFGrqNO8r7EyFBR+23FoMgg5NRza7LBRo0Ulksb0W9ZqgT5Jnd5KPSHv/xBCWYNLbUsM5PigDTiHPFyONc29wuA5xTvFmdihoOsLtzKjQC8eJ9bN1Sq+l0H1/bnr+P+gxMjAbyNKwzFvVd8klqY3kvH9h06IUFCJAIHjGWVMW1fD0o7mecrAwk12p4lCMUMfE9FPf7Z9HPlYLKXd1Awpt0Fvt4OuWGUFFaGFiT42tjoYSsORwSSMYht3FPbflvv98LmCP6yefbh5nlnpgZnq/L73Vzt8uCAXNgfSRnJRocQHZ4SHlnoI2b3JvlxM00NvXMNPuDHoX7dPkoH+6EEESTbA0OtsRabySwulLN5xUHuXRph1f6uNPleX+r7mISs0/OLBziYoL6hrblFGu0DjrAItPUh2z/t8rgsLWH0bLbPdoxTiI9UASo3vP1ntFrPFofQbyMpJBdnZR9zB831OuzKOXiBCADoTcLu9w0AXYv6ilPWuDSTqncOZ7nX0rYFCnTQnRsFn6SDLxYgtiE9t6yl2JhAraWvhtFwN65rE6Q4Wp8X2FqczEGOob7p/bgAQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(36840700001)(356005)(9686003)(2906002)(166002)(47076005)(82740400003)(70206006)(70586007)(6506007)(15843345004)(53546011)(7696005)(52536014)(81166007)(8936002)(36860700001)(86362001)(8676002)(55016002)(6916009)(33656002)(316002)(5660300002)(478600001)(966005)(186003)(26005)(83380400001)(82310400003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: pelion.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:35:40.3001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5690412f-d4f3-4128-fc2d-08d8eec15579
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3979
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DBAPR08MB55580B8D8BF0C1EFBB404545F3639DBAPR08MB5558eurp_"

--_000_DBAPR08MB55580B8D8BF0C1EFBB404545F3639DBAPR08MB5558eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From d7a40397af511baf3a53d12541ee601849f0ab26 Mon Sep 17 00:00:00 2001
From: Janne Kiiskila janne.kiiskila@pelion.com<mailto:janne.kiiskila@pelion=
.com>
Date: Tue, 23 Mar 2021 11:11:39 -0700
Subject: [PATCH v2] UBUNTU sudo apt git instead of git-core

Ubuntu has changed packaging and git-core is not available anymore,
it is now just plain git.

$ sudo apt-get install git-core
[sudo] password for jankii01:
Reading package lists... Done
Building dependency tree
Reading state information... Done
Note, selecting 'git' instead of 'git-core'
git is already the newest version (1:2.17.1-1ubuntu0.8).
The following package was automatically installed and is no longer required=
:
  linux-hwe-5.4-headers-5.4.0-65
Use 'sudo apt autoremove' to remove it.
0 upgraded, 0 newly installed, 0 to remove and 13 not upgraded.

Documentation should match the current package name to avoid confusion/warn=
ings.

Change can be verified by running the following script

set -ex

distros=3D("debian:8" "debian:9" "debian:10" "ubuntu:16.04" "ubuntu:18.04" =
"ubuntu:20.04")
for i in "${distros[@]}"
do
   folder=3D"${i/:/.}"      # change : to .
   mkdir -p $folder
   cd $folder
   echo FROM $i > Dockerfile
   echo RUN apt-get update \&\& apt-get install -y git >> Dockerfile
   echo
   cat Dockerfile
   docker build -t test-$folder .
   cd ..
   rm $folder/Dockerfile
   rmdir $folder
done

Signed-off-by: Janne Kiiskila janne.kiiskila@pelion.com<mailto:janne.kiiski=
la@pelion.com>
---
documentation/poky.yaml | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 3c30c4430e..2554f1e496 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -11,7 +11,7 @@ YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
YOCTO_DL_URL : https://downloads.yoctoproject.org
YOCTO_AB_URL : https://autobuilder.yoctoproject.org
YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
-UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texinf=
o gcc-multilib \
+UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc=
-multilib \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpec=
t \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-=
mesa libsdl1.2-dev \
      pylint3 xterm python3-subunit mesa-common-dev"
--
2.17.1
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_DBAPR08MB55580B8D8BF0C1EFBB404545F3639DBAPR08MB5558eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">From d7a40397af511baf3a53d12541ee601849f0ab26 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Janne Kiiskila <a href=3D"mailto:janne.kiiskil=
a@pelion.com">
janne.kiiskila@pelion.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">Date: Tue, 23 Mar 2021 11:11:39 -0700<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH v2] UBUNTU sudo apt git instead of g=
it-core<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Ubuntu has changed packaging and git-core is not ava=
ilable anymore,<o:p></o:p></p>
<p class=3D"MsoNormal">it is now just plain git.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">$ sudo apt-get install git-core<o:p></o:p></p>
<p class=3D"MsoNormal">[sudo] password for jankii01:<o:p></o:p></p>
<p class=3D"MsoNormal">Reading package lists... Done<o:p></o:p></p>
<p class=3D"MsoNormal">Building dependency tree<o:p></o:p></p>
<p class=3D"MsoNormal">Reading state information... Done<o:p></o:p></p>
<p class=3D"MsoNormal">Note, selecting 'git' instead of 'git-core'<o:p></o:=
p></p>
<p class=3D"MsoNormal">git is already the newest version (1:2.17.1-1ubuntu0=
.8).<o:p></o:p></p>
<p class=3D"MsoNormal">The following package was automatically installed an=
d is no longer required:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; linux-hwe-5.4-headers-5.4.0-65<o:p></o:p></p>
<p class=3D"MsoNormal">Use 'sudo apt autoremove' to remove it.<o:p></o:p></=
p>
<p class=3D"MsoNormal">0 upgraded, 0 newly installed, 0 to remove and 13 no=
t upgraded.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Documentation should match the current package name =
to avoid confusion/warnings.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Change can be verified by running the following scri=
pt<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">set -ex<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">distros=3D(&quot;debian:8&quot; &quot;debian:9&quot;=
 &quot;debian:10&quot; &quot;ubuntu:16.04&quot; &quot;ubuntu:18.04&quot; &q=
uot;ubuntu:20.04&quot;)<o:p></o:p></p>
<p class=3D"MsoNormal">for i in &quot;${distros[@]}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">do<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; folder=3D&quot;${i/:/.}&quot;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; # change : to .<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; mkdir -p $folder<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; cd $folder<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; echo FROM $i &gt; Dockerfile<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp; echo RUN apt-get update \&amp;\&amp; ap=
t-get install -y git &gt;&gt; Dockerfile<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; echo<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; cat Dockerfile<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; docker build -t test-$folder .<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; cd ..<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; rm $folder/Dockerfile<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; rmdir $folder<o:p></o:p></p>
<p class=3D"MsoNormal">done<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Janne Kiiskila <a href=3D"mailto:jann=
e.kiiskila@pelion.com">
janne.kiiskila@pelion.com</a><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"FR">---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR">documentation/poky.yaml | 2 +-<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR">1 file changed, 1 insertion(+), 1 =
deletion(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR">diff --git a/documentation/poky.ya=
ml b/documentation/poky.yaml<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR">index 3c30c4430e..2554f1e496 10064=
4<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR">--- a/documentation/poky.yaml<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal">+++ b/documentation/poky.yaml<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -11,7 +11,7 @@ YOCTO_POKY : &quot;poky-&amp;DISTR=
O_NAME_NO_CAP;-&amp;POKYVERSION;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">YOCTO_DL_URL : <a href=3D"https://downloads.yoctopro=
ject.org">
https://downloads.yoctoproject.org</a><o:p></o:p></p>
<p class=3D"MsoNormal">YOCTO_AB_URL : <a href=3D"https://autobuilder.yoctop=
roject.org">
https://autobuilder.yoctoproject.org</a><o:p></o:p></p>
<p class=3D"MsoNormal">YOCTO_RELEASE_DL_URL : &quot;&amp;YOCTO_DL_URL;/rele=
ases/yocto/yocto-&amp;DISTRO;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-UBUNTU_HOST_PACKAGES_ESSENTIAL : &quot;gawk wget gi=
t-core diffstat unzip texinfo gcc-multilib \<o:p></o:p></p>
<p class=3D"MsoNormal">+UBUNTU_HOST_PACKAGES_ESSENTIAL : &quot;gawk wget gi=
t diffstat unzip texinfo gcc-multilib \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; build-essential chrpa=
th socat cpio python3 python3-pip python3-pexpect \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xz-utils debianutils =
iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;pylint3 xterm python3=
-subunit mesa-common-dev&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.17.1<o:p></o:p></p>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DBAPR08MB55580B8D8BF0C1EFBB404545F3639DBAPR08MB5558eurp_--
