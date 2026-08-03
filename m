Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D06C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:45:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39032.1785746753759096059
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Aug 2026 01:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=apRPCyOZ;
 spf=pass (domain: navimatix.de, ip: 40.107.159.75, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AowPl/QGavjNR8D4gYz5+/e+FqJFUgC3jDmzsQ01w9SuJHyjUhFGBNmtvUaPD3UFSe8gxZ/QsudNrGjnzZBNDjgTNWV7chtkfYbxkr8aYNbvmpMHMWNQt12sNsd+MuG4iB4d6IXbOTumdjnBQPgeJ70PFlMCV66nLDx+QTb5vHU0y33ypkHTwfHC94TWxrNU8+6L1rKs0UsyRHgTU99wiyzvcUE6Y6g/++wn7sU78S8jx1q4FrrzrbUdng5G+jyqWJhwFzqw+5L8jyqcKHe5VnC46lq2YqgktudNDdjj71d9vdeekg55EYPWr6QeZrunJtwp0aaD+jpLZaIn8VfP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8holDUzY4nouom0TL90zUM8Ah7P1VUl90gbls//fGyk=;
 b=d1Y0U+pmM9FcI9Mw7TSS7Uzpzl62QtTLFj/eJQLBsXoxPftKMDS6HdmbN6+HPzRGhV3pNLWAEzRxaAunMeju8pskt/sRcwWyIV66eloV50v70yoSJbGhrJBZlXnL3qisoqN0pU9RIbvVS2c9NFMoTQWqINWoSLZthZ4nH34ZGL+FGFzIdtJKNJCm6Ev1HAtQO9ybenSXZKu7G+xwjjo85l2/AeViyILpIjjL9VKIPnaatcSggO7lXtSEYWGyB7lL25af2RPL8VNigUnxZwKIwNpn/k2IV/MXexMYJOYDjr/0nTvkLwVqE/+KcT0GS+vbK/t6CsJ74FxG7ckLpdC9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8holDUzY4nouom0TL90zUM8Ah7P1VUl90gbls//fGyk=;
 b=apRPCyOZj3TPv599wOOJr5smLdzArOgwikqO+gkXxyNOEdl5ZGBK5MZL1DHpfcBWh5n5q5Xr+j7n528FirdPxe6M0HUjjOQtDrdNxZn9Basco1nq64LV3jOPlOpnogcpXW4QkRmXPSo5d7xlcYeGZVTbovZ01/1MdBRi7+4gs74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PR3PR01MB8016.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:177::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 08:45:47 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0270.015; Mon, 3 Aug 2026 08:45:47 +0000
Date: Mon, 3 Aug 2026 10:45:46 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: docs@lists.yoctoproject.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v3] features: Add distro feature "audit"
Message-ID: <2dac9fa540b8fe54bb3d5096f09e10257399e67f.1785746493.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PR3PR01MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 66742448-baf4-44a8-0595-08def13b9d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	CKhIXCwQauWilZmfoOAzFkvXnF3Vuh4O0zs/XCKl19vJp/JuwcIcmfoEKPb+3vpUHjMJAtggLmYbonFX261TtKXiFIDLMjwjf4ipz+1eKJqIRQ804UDHhdNVzcuLIDS1JhB8rd/r/eD7XSsM/K0NS7ErT9MIqw/9rloaSxTCx/fpkJImAMMZzQ1i4NR6vc3GvrZ3LJeNf7BiUemOFKE/Crri7whuOszk5eIf5bjg9Y6nxiafy3ytjX/y/BlKx51QgbsgMN6mqH8KG7fw8vuTUITuryUZXUhtlyUUB4RabGve7ZR/aLVYjfgqKQIGjw6FNWMpXJynS7Oh39frqfGxsq1FmiDICjX5QvNtf2FubamVf6vJb4gVRpRKcsVQ6spFEXI7+3Vt+6YBPazVaQf17DQLrPO+fK8BgNrr92CEJY+79zyga4saRufd1nkQHBsX76RQ1FwWOFVYXaum736gRg2u1aqEVtyKSpUUM777sXD6IRKfErwi08rfBX/HqnEH+6cUg9Z6SzdL6kV2abkQWP7haki3kUJVsC5eiq3a/Rts46axNlIF81jatJsGm1PjzVTLagJzDvTR0hPWz0+EOhynV5doezQVYlkYTbsLUz8PcVKtfUkHYipQcJ8WV7aYyXbeTPyHUyj8ehuYC0tvNf9eDYwRLHe1H+ohGOlsJeg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ojiAWGk/b9PdSDGTIWjTrKH23pFGHthSo2V57iwC+eay4gnGLLSCptai16ST?=
 =?us-ascii?Q?fyAhLNH/HU1cA28VFwDkQglJl7chZuCwHU3Fk4pJDJryRNbG1Z4lw/VjgfwT?=
 =?us-ascii?Q?gB9/q1BAnwEj1fBrNJf7Xja7s6o4PPUNxFbTIJt1TuNjroPtPH2TqNEVS/Cg?=
 =?us-ascii?Q?lh3mGFedtt9zwm8fVYybhYx9YZHhlrSJbYWU812YTWdoITij+vIgVbkepLvC?=
 =?us-ascii?Q?9P9Mo7aLIDM9y7x4q/X1K0hzeWrZRuiu1HL1k3glx4E3l2oFt+QCUkNWDCCS?=
 =?us-ascii?Q?TJv6ruT9BsgOwapAF4yqEmfFK0ikkkCjFvNWzaeN29z5XzA/U5DiwkScWszx?=
 =?us-ascii?Q?3ojqqKeT0RoJ5M9mSQ/K18qs9bGP0GrHnS06ugAmw2ljcLknFcBqe7aH6sfJ?=
 =?us-ascii?Q?XAPkHGyPf0H1WDFONfzBsPs3E5z1/xt/1ijtbLwQCh7uw8K+smlwSAdWx/gV?=
 =?us-ascii?Q?BIbX7XuE3Du8PuBKZCu81gR6qJROvFETeKJaQFdktrviC3mDIB6P+J+OfnSD?=
 =?us-ascii?Q?Wv+Dwi2B32y/oLhpVMIhNF5s6XH09bCAy1OrwiX1QwH2MYnVbNN/82253L8u?=
 =?us-ascii?Q?bUWUGFJjUCJ+G1tgKO6NQgUPZ7i6qaJqd36XOdFHW+ORMUGJAatZYxqOZzLb?=
 =?us-ascii?Q?hquqRubUL6Gxvf2+nv5Ar37wWe/L3WB27oDdC4n6AiGzlpmYKF70CmSTwUuw?=
 =?us-ascii?Q?j1vT52mij7ftp0Km4fifBLLPOq2syyctlWDjJPcxhhZukcfR6BudyrVLFDwi?=
 =?us-ascii?Q?8sDAS6+scx5+Dfp5G6KF37zL/i+0ZaV6d5fZv7u7GXP0pW0tbNSmlflmiB3j?=
 =?us-ascii?Q?l6qOLv1CIcdevMygNV/iD4apUWkNtGdM/t3XKRA3e800CLPTvCQf7semmOjT?=
 =?us-ascii?Q?AFrec5iQJvaoIClkaPWjRNxQiX3BOsK1wUmvXcB4wQ/JaPBboog7cW/zuyrA?=
 =?us-ascii?Q?+NjdGdlUY6gVjDdIN1wI1xfC1SRdI/pQPw3PtHMuZphx6Z/ysnC2NXbXlyr7?=
 =?us-ascii?Q?rS6XLQyUu+P5pplmZ14yuqboKsEkcYLZISukhqC19TroNqVGRka7sURWYgL4?=
 =?us-ascii?Q?nDZbv5SXk4nfhCK4+Dicq82bMK1nA7L38VckqdoeIPPUaiNmEjy0F58EU69W?=
 =?us-ascii?Q?vrsZSBVFctNzsB/lWqDLyNwhcQ8F7mB7L4/gfHPj3hb3PuqkElV3TfhwZ/cI?=
 =?us-ascii?Q?vVNtZrqrEORUPjGm1MMA3ML0gdEW1uBf2If/MBrHlx8DEUnLVKqy1q1Tb2D3?=
 =?us-ascii?Q?PwYGT1VvfrdWGndKkFVySrNCk4YdYP/D1Cy04MLZs53K8u8pyOmFZ0Vkddak?=
 =?us-ascii?Q?roTgTdt0yPo/2oCw5kN1N5SfEE+THr/JALT9/4qsni9xPQcbYeIfG3uB5t2U?=
 =?us-ascii?Q?Hsv8d17gN1UZXP5Vi6gKzO6fIptPhk7xW8l9khj2ozW447Prn6fWzQFZfXUl?=
 =?us-ascii?Q?ZnOysuYfytBpH5Ds8gAoPpfyK2UkBSg6pzkoudkrJW56K++PCxLiNX6wtBur?=
 =?us-ascii?Q?Je32wH0Q1FwLbn+bP46U64DBCSKmIwvECxX62DBA9BE73jUi44yeTWYATJkD?=
 =?us-ascii?Q?2qGi+9jpADXPOropuFFf14NwVC5bTbGZ4X2QwbPcCUAp/sa6Qqf58rk+oTh5?=
 =?us-ascii?Q?pCKbC5GbqfbEcKRKnYq0eGDuH0NF6nsu9EJwZ/2pRcWBx6UkRHipiT+F/QLS?=
 =?us-ascii?Q?hNlaUk0EwCXSUSAG0fWrrsGSSSq2yresupW4hq3Lq32AgtmgmvVbPABtRZTA?=
 =?us-ascii?Q?v7lIqyQmKWF2lwVyhihXudifjJecPCY=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 66742448-baf4-44a8-0595-08def13b9d26
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:45:47.7364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKBDXDW3TqTdIcZObdoYX0TmeioWxQvswbfodnuWyF19wg+3ljts/bLOGOjF05Fu5Gsani82OsXnuumFD/gHnNhHYRrtydjBITER7/6QVSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB8016
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Aug 2026 08:45:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10232

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The audit recipe should stay in meta-openembedded. Therefore, give the user=
s
an hint on this.

https://lists.openembedded.org/g/openembedded-core/message/242612

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
Changes since v2:

* Added a note about audit recipe being in meta-oe.

Changes since v1:

* I've added a link to the documentation wiki.

 documentation/ref-manual/features.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index 77d034f0c..63d47d6ec 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -141,6 +141,14 @@ metadata, as extra layers can define their own:
    section in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual.
=20
+-  *audit:* Enables `linux-audit <https://github.com/linux-audit/audit-doc=
umentation/wiki>`__
+   support.
+
+   .. note::
+
+      The ``audit`` recipe is provided by :oe_git:`meta-oe
+      </meta-openembedded/tree/meta-oe/>` in ``meta-openembedded``.
+
 -  *bluetooth:* Include bluetooth support (integrated BT only).
=20
 -  *cramfs:* Include CramFS support.
--=20
2.53.0


