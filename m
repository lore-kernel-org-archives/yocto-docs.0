Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C36C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 21:26:03 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.133])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.607.1784237152252372789
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=P074N1Co;
 spf=pass (domain: navimatix.de, ip: 52.101.70.133, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxKj11hrbdLVuanFPDClYZTTVUUu1HMElM8uOYE2AMKpkztxAOMxEzjpyOSjugpXrQBbrH/Q+3GZ0WI7jQNXL9IPcUHBUoou6C28gySQbq7YSf8n5Po7uEhKYKkcYKbcZKoFMRzNNzvAjydGg4ls8Rw32P7Ax8IjisyAWwsbvz2CzR2LJ/VKBM8bVRP3IaEz0hNi/ZYgNYNbLrK7TANMwsB3n+nuagDDLJKfyd415185oyhQRmly3e5+2C0nupmXkJHRyX/zQgZnFY/qSzOA5AInmSqU1qmoefPD1rFKZlF5JgUHYrU4Ucagm9mjzXETyWSm7Q46FCPs6ShHPybm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pfKJV7HNNWfaePJ9zbN/IBS0KF/kUBZTLKfbQDprX8=;
 b=AHw0r+iDjHm6c3LFbVyffkQgk7xAZFvFsSnZq4DObZCq0kXtInUUGxTmevw42q4ieiXOrPd87vZz9gmqwroe/XFYBF+m+BJwAUXRsxxp1h5smvV3Vz7b4NUmT9XBHKQ7vNBagsb74lG8IASpOIjX301pJ8PMCsapPPZqOqZXbYK6OUNqs/tokYxFmxjqMzTZ4fGhHo2lDBG77vG3K41vOOPWYGm8mnbm/cFRpf/oldG8M3wif1lEwnvnXUCRlvnEmMCe+TUknPxRLM58G6KuDisScocS4b/JZ8k1haWibFLFxr3kYATanWiMz6k9IjHY3TpPeRRvmwQYHqWTK0OcxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pfKJV7HNNWfaePJ9zbN/IBS0KF/kUBZTLKfbQDprX8=;
 b=P074N1CokS66q3w0awFjNWLMMBA+B0wJZQ6h/Ztw4WI4nGMIiGZ1c7P8xuo5NGLbXAIJ2q+RIToAuRXd58st2y8dx5hjVDZQWnw5Tva0pFmr5HBMyn8FTda/2SMWgbKtlROzfM5BMipl0EqqQmbtt/8cZWWx1hudYJguWl3j/s4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PR3PR01MB7161.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:78::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:25:47 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 21:25:46 +0000
Date: Thu, 16 Jul 2026 23:25:45 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: docs@lists.yoctoproject.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] features: Add distro feature "audit"
Message-ID: <db22bdb6f13cb1a7159a9284058eba3f07a4a700.1784236750.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <alchGk8fYN2cPmGa@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <alchGk8fYN2cPmGa@navimatix.de>
X-ClientProxiedBy: BE1P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PR3PR01MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a20af2-ff4e-4dbe-5bad-08dee380ccf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WTnYsOkDA5Wl9Gw8YSZYsFAyJGevNJK4Lqh6fg0LG7klKNCitCaQy5OEnUN3EMeZZbZ0iHPhIDWrSHrLmdpSx+3pty/hc5bUThMIKYyU27ePES04Cm9VDS1WibJWZdRiNaUlhAJQJF75LiyW/brauDZyB5oMozvkCVqM+XFcml2OMvRs+RirzdIhaNWsqYObbtawxQm3B7cadK1eq/vIxxbuy/jO+SRR0CN58RjLXlre8/v5cvI7jD9TMRlSK94m8xWWacwdbzrKh5Bi7d4rXE5L1GNJq3tyIeb4kqpxZ1DVoZOFvEwHmo85+7k/z7oOI/VXIWnPpyvMKYEDf4vEQ9kW1ATN8EOE4S+Up6CucaYBRL4kjxLsLfscBvz9lUsaLxi8RD9Q05kpEisQ/SuRUO/03S2leyTGz+wdCnncIdtEcQLcrtiIDENbwakBsjhHhhIPojSs8WKObP2jnOQdJo0I5xUYByyKp5+TMOerxjXDUUMUqcDzH1zhIZpj7+v5pt5YwOmiSlVMuMd2RteBeyuCukEwWEeEY5RL0sxHzzhFtscWEBm0X32AxcFb1vdslQq+fwwmu7TR5CrK2CxHjPBwXflVeNsZDkNRQPcts57v9XqjSGcprH3IjWiUUEfqzY3S/ioGt/Y+n+lYelVAE89BflGjHqTjg8i+q/3nqbA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I0jeLzVzL3yeLiGh1PN1YatgQjpY66DeUXNegeTlQtgpCs4U7nCtBdAfJMtm?=
 =?us-ascii?Q?iC5WcV0Ps0MASUODRkCIOURpQmMeuspr+J8+FBWx0y7GWb8CkMudahGrJUok?=
 =?us-ascii?Q?JnXaVDDaBcDcMbrWZiW/DWnDSAjQaGQ6Rss+VeC+M+Q9JsvCnPyl0CHcEulO?=
 =?us-ascii?Q?ENQgrIontt6pliUTEdfgwA7TfhwYByK7yQMpdNa5nEA9e2k3/Zvkh11nko5m?=
 =?us-ascii?Q?TvgvIt7HjShWsIpm2lQQTUM58Ihf54pyumm52afaDcT3rLTLuVX/dRyWoJlK?=
 =?us-ascii?Q?OW5fYlOS5GYhcWT74GSlj6By4MqwPsg6HhSGUaxTN1xZ0jQiACc17iXIIfhn?=
 =?us-ascii?Q?WvCpX0vc72uidpMaFRSGC0UPmhcF63UllLDei1Cha0r5TYLwuNotpxvQsqjA?=
 =?us-ascii?Q?HrMDz4NgQjYZx8JsO6yEG3CPlDcakNvCnsHLec5T/3bxVRct1dV2M+NhrNtO?=
 =?us-ascii?Q?13Gx6P1oX85ZVVGQhX81mg4kMs/1CqKKW6Qx1l8UKgDcuseHIVGX70TYnWwV?=
 =?us-ascii?Q?ySNV3Hmp+5RpU/ch34trqzmSL5f9LMgRpzDYJEKTDSdxyPqE6ZspHC+o/2bk?=
 =?us-ascii?Q?x4xNTtqGTY6xmE2pUlx1u9VBemvRB1gUmuJsC0RqNCeROYYi1C1AeMyPfFX6?=
 =?us-ascii?Q?TIah7/jGepRcG7wKsQh5RxiN/6foLZrHk5YOTQauVsbUc12kd9/O+StROZSw?=
 =?us-ascii?Q?66AxrmX5k0RnKZR2fkwlrsSab077G9sOZLb7pMeZ0EmteKjBZxAOQVCqQtuA?=
 =?us-ascii?Q?/+4XVMvwZfwFS1ILqX8LS81pea8oZNveNpSHG99y/ayQTIrVxTdwzsT2U9zi?=
 =?us-ascii?Q?IAOzjXzIVqxlNE88q8ClkBMvewEm4rAlg5OrA0DED+y39kQ+wApLG66Vc7X2?=
 =?us-ascii?Q?T0Sraq7swBsIsUNuuJPFWFPn4G9lYjOmOUbPzpN8eonGzcfvNQgvV4jWVHVV?=
 =?us-ascii?Q?SueMyOl4o/z2bn+zRn9Fr3+AoMVbKDiIBkiuqogQyiDkkAjW9ONEGOEkZPnB?=
 =?us-ascii?Q?UGoDLMNlFEDZ45H46ozOf/li7LbzxFDkxWl/9AgIf9gSBvfqXAuzXBy5gXjm?=
 =?us-ascii?Q?y2Sur1qfaOFLjzSc6yGbBpSjSHuUoA4skzntlRxWhrpMI46zZSsNSJUL2T/K?=
 =?us-ascii?Q?poGk6B8W1fO1oGs2oOvous9ZPJ1Uw0Z7d87LvLXtl3MhJyTD41qzYACVK68Q?=
 =?us-ascii?Q?jQK6yRJRDYmGCJpQsWOsUHM8wZPM2yceSpmjNyHGiWoonk65HcKSjirljAi2?=
 =?us-ascii?Q?5oIuVCVfSSDbOI/RudSOxuTxVvjV5hBPRqma4UmSz57l5JH32dHhYY4s1FM2?=
 =?us-ascii?Q?KeXCGIZz3xT9qQ0i9rZN/IV86U6nWKds6UjOSeU4B4qvUuAohNqDS2GZYmlm?=
 =?us-ascii?Q?i5+Hnfw3/w1nPa5I5i79azDgh6axRXnebX22oBqVbmpNNXs+Qzi1JIB9Sk5R?=
 =?us-ascii?Q?azQhsu4i3iPz4XqGTLJaTiwP4kcZcpObHJ10fm0aesgIbZ3JhLcvqPjQ/K6Z?=
 =?us-ascii?Q?3qZ3fwmYNk+GfIhwh6dzzcsKg6baAM62bYhxJ6rj8bvlGdTfntDb3kiDHSKK?=
 =?us-ascii?Q?WhimnjGwvWsTJU41bV9nUYi5TXv2mioCsz97AaxTjs/h05CGgkHZklhqnVoX?=
 =?us-ascii?Q?iCg8R/Sr1DgNfw637b0rI/zAfY5xzy6p4FyQ/iWGt2yiYIqzi2D1vET4uj9F?=
 =?us-ascii?Q?VNXKZLczkipUkpYHeFR/nmZEAdr5JhN1mXeZWE7ovWdV9bZ83HmGOd1i4hSP?=
 =?us-ascii?Q?S2o12wE0ydrb1Pou3Sa3cDiC0RZcW84=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a20af2-ff4e-4dbe-5bad-08dee380ccf5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:25:46.8413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUeK1865/f4NuwqgmK9WOKPAsm8j99MvzXIZq7RXx664dRC2hZcEAg5M/aVvgdjDtsbX4b8+Pf6cgohr4VAHwb3CKPnXFF9Ca/8guZgCYno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB7161
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 21:26:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10093

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
Changes since v1:

* I've added a link to the documentation wiki.

 documentation/ref-manual/features.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index 77d034f0c..d12b7fa13 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -141,6 +141,8 @@ metadata, as extra layers can define their own:
    section in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual.
=20
+-  *audit:* Enables `linux-audit <https://github.com/linux-audit/audit-doc=
umentation/wiki>`__ support.
+
 -  *bluetooth:* Include bluetooth support (integrated BT only).
=20
 -  *cramfs:* Include CramFS support.
--=20
2.53.0


