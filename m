Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B442C54F5B
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.142])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.576.1785256727391528194
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=lR8QwAJy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.142, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkJatXtcL0DN99u87UqdZxdluW6n+tcTQ9ydF2vDiAyLUtCLYhaBlIoOHq0wMyG8WK0Cbv3AHPEOG6lnb4DIpnMy6XuP3qz6R2dSAFgOsLKO1cVOatM6WHFcluw0QznkewZQPyA9YsO4GNjrhYhxBbYA9c4AHFILoDp13yLtfvZll7sUjhK+SiwdMTLL9rkbwXMDDsvdUMx/xeGkp7ORHNzaMiB2yZPmj288thoiOS8GRWNjEY7YiAl8nuaYZTaPDUcLnCjVcnyT0wLp104xiSWTDzxEZEzF0eDTaNdrD5bZGOB98eDXy5/dpBWfHPcZ5cOuhNQFZG6J3w9l0+Oeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqrrvVqxFx2MYtVXxOJ15Ms1vRglAIAP/b/j/jMmiCY=;
 b=emOadQbIVMQbizhajOM6RsD0Q6ouuowqtKWBVA59EK360r4sN9t/B0ikOHULGn8JWwqkSGvuhNa3rm+nTXr1P2cWMyfDairGEze30tICr5HBjsYYRE/bdZ01Ln3lxRkN+SYMBXPepgX/DBQkePgAZQDxwzoQMGObp9Wf5q7q3nuJx2IN1oVj4bcDcoFWC1HhNEH6anoUUp9s+9Ni57AhxxlFx0+2oN1BBpoXwlLnr2wgSr33OG+WuzUxwSqw3TWeD70FwSzMpgo6NG295jDnNNoyMtQW5eW0hmYgQADMy3mpKw/9t34fyocslgc5o9dJmK9qrk4O3T/s4qsot+3P6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqrrvVqxFx2MYtVXxOJ15Ms1vRglAIAP/b/j/jMmiCY=;
 b=lR8QwAJyBXzRknwESKyPT6E0FFUtFgKaoIBNvL6uq7G/rGyiHurkvWZ8lUJQWqKsEczmsRodHEeI8se2ceFAtCsHi2xm4EasO/Zr53E7GfwFUBcHK8BuZa+4ywHSvV/wHEYBuuoN+mLMI3vH0s/8tRz4EtF/Y+/2S9KY4D9uKnX38qysrsefog1zKOD5ob+G4XmSEv5K3BBEILnrJ1pSvSv+s6pNHfWfybEHuaHgQ02ey88qoemSR9LdYA6D9Lbl5oRMXCZKpwjdyceukJMVVcMXIrLHbc3D/A78yUkJJjDx2d+7k/ab9phLkkQmL3dRA0TFEiT99qwMQTHU7ifhkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AMBPR06MB10211.eurprd06.prod.outlook.com (2603:10a6:20b:6f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:38:44 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 16:38:44 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: paul@pbarker.dev,
	antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4 3/5] dev-manual: Fix missing whitespace around '=' operator
Date: Tue, 28 Jul 2026 19:38:04 +0300
Message-ID: <20260728163816.17230-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728163816.17230-1-niko.mauno@vaisala.com>
References: <20260728163816.17230-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF000167FB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::675) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AMBPR06MB10211:EE_
X-MS-Office365-Filtering-Correlation-Id: b17454f6-1fd7-48f2-658d-08deecc6b08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	BT7XJD0vY3sDmJmv2oc2xWS6p/uiM9L/H9QYfSDND5UZOtPhVmOWdm99dsieRgtZwMzypNCGJpOoRXwOXUv1hpqafgHSHsRP0vgDPn65aDvwP1PYnlGHM7CMJPHPy/9iJjdloAK8BNnoqAm13+em+OV5KErBp5dy1LW+Jrn6/Z14c17wSI+hwP34F/a/znKSyRyQ6QgnpdV5XnvC75HVWaOW3aRYQVCor/WjaBXk2+t/LP5gUS0kwMWKOwdrSGh9YmHwFpLYp+mdq81IOS+bPtSIaqsZAb3hBR7W+q6EPj58p6ys5l23TW3x3/zTwIt09MgV5AVegHxmBOr42oPd0lofz+H3Bk3PUIkQBQuuasPYU1GzycqT/DpjdcGvWHw4IG1Y4Z0ftcxft7p4UnaeQ1jrcc19saYCTGp7VAQMh0PfKz3Kq8iJD/2MHHhoZvNe/grafjy4UUDdWWPOpQgzN8eA9sNNLgGvg/6jDFzfToWkOK47XN0dt0neaPi+iRRaSzjwVT1X6YfJ1EmyO07TMcPZxcvoj4Od8GKhR+biVweVUh5FHNCzM27mrgiQJulCwaRSwiocZYwtH0Kgem8WZyBzOSJcUBEeqiFcPxRYFhZOIwn1VN+RtF7wKm9zYd5VMv9F6PXCPXDFZW4nY+mJCvEnq4Ly/1LYFvw2+1AisTZHQva008NFjpUGmQzIqfJAMrcrNjKgc5DyrzYt0NuYI6Q4wPbH+9Ezc7Jda/qjbuc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nQyjXtm+5r+HRGLtJPrkKOHx/no1w1evf2PH90nk24dlNsg+dxlDhQole/DT?=
 =?us-ascii?Q?I87mOMwEPg0FAj2Tr+SnzoYGezpZWFBPicWlyad5kqXFpWuI64mHkgPs3SMy?=
 =?us-ascii?Q?WIBJ8R+JJBArF9NYDs5uWTq5ASxsABh9rUA5qUnHdwcUW+cwXoELdISBXgrW?=
 =?us-ascii?Q?D6CEnLUVMXVOQewzLy7jTPi9ddwydp9MVLrQsXozyZXfWXSyzdvB8osIrDPi?=
 =?us-ascii?Q?YRBQ7AodmyKuoFlALWQVzBjM9fmTG8S5AoAU/uUhejsLHT2pje8JSBEY+7D+?=
 =?us-ascii?Q?toaC4oYRNjjdtisCf+jMdBh052P5bToaQKcHwQGAp9vDK0F+Insq45MHPFvB?=
 =?us-ascii?Q?glBMRW3vgN//tnMFsYUOvI9Rj0KdRHkRhMSfiSUsVpFd5iVVbr0AxAw+BABh?=
 =?us-ascii?Q?crHlzRCGiQGn9YEyFBh/BzFyp68/dSvca3eWEh+frMIipn4+XhT2fjgy6pnd?=
 =?us-ascii?Q?DVojOPIts/McCFgde69Y7BDqLLuLbXGEHRaCOz4wC+MypqHfAb2GHx9kPLx9?=
 =?us-ascii?Q?AGMm8lHBjpTmocniR6HYC+0FzU2Jng9xQfkSMswUh0tQL9f6sA9RTi8yPzLa?=
 =?us-ascii?Q?imhhGp6yPtrXJtoFw6oA0MaaShsvZZgZJ1vYcO38XaQNP3uNJkjvskl2gNq6?=
 =?us-ascii?Q?1N4Ouq/KHFQ9+TPt/X/ygrRm2MEYVCSnle952nczxWCcVzBG9SGXwR+Zajz6?=
 =?us-ascii?Q?v1SkIUY1dnhKXYBTLmt12QRgfXrqk4hIQNLlTZC4twZYbah42QOcCEBjAiGz?=
 =?us-ascii?Q?jqSJVOIPu0ihPWV8vzKY3qdyeKe9rsSHwXsc03JZt2QZoxW7vqSt9s/qKJ2s?=
 =?us-ascii?Q?zYgKPAx0q8ScTYurb6w4slNa0dISL5ka8a2kf1XaPl/p40fdL4hpTCe1Xpxb?=
 =?us-ascii?Q?IHySwSX6fi+bMmGXsF6f3i3bO3bETtbrYG3vYHheHED6xmYMKSV23XnhHBzy?=
 =?us-ascii?Q?rw7sHQGwJMMGcdF1Q9NmqItA4kwzfnZBrcL482CjDMpmOmeOFDE6ii0wgBH9?=
 =?us-ascii?Q?FXHr8m4x4pPIS85STnZWgu/jLvZcsxQNpg9OK80ee3rpIRZUizG6U9fxC0OH?=
 =?us-ascii?Q?ZUe+chjMKM+5sfv6rw+j317uxZ2MNOJz6d6utmiZXXd0tcKPVvoXNsluGNVw?=
 =?us-ascii?Q?20N3/qgK+A8PWBxlh70W51zG4OzaZf7au0WHnzXRTUbNmnbZcIKfJ9swGy5B?=
 =?us-ascii?Q?oJeh3T2q6C33dgcaYopsklutLJiI4X/5GTqF4KKSuxjJM8UQjOknmMsX7LMM?=
 =?us-ascii?Q?vVsF6M6F94roc4OVKn4snKQTrJftRomuZfLwWm7uLXOjH8HKVaR++Is3tKGw?=
 =?us-ascii?Q?QHIASYm316nZCy6KKYu7ve/kxNNelBPMpadyQyrc5VZuKB3CVYzh0RIp+5AB?=
 =?us-ascii?Q?4ZAUmobJkoYekc5f1ZiyQml/7Rd9TypMCbKfTa0AfystfMieJBuO1uqkB1s3?=
 =?us-ascii?Q?TzB+oaek/j6Cv/tM5wtDggNLDfr/ZHKHxuoUMhlr2pTkaHQMB64FHHVDIDqq?=
 =?us-ascii?Q?XkyVk0lBavidiJy/wQ36fmSr2KMMYpo/vI/7dI7o/I/DPxqu4b5cuJXIatLi?=
 =?us-ascii?Q?PB3XOleoUzwQaGB0y0dY0EnUMIuFAH7N2WhcCLozl52njaBq7FxTPId0n3GD?=
 =?us-ascii?Q?uStKK8T4euqZP63/DbH9venjhpkbZTlbcdl7m5FQHJcfiD9Hpk9XqB+b6s80?=
 =?us-ascii?Q?3nqF5XjZsFzE3u3h3HLjTMo+A5JFKxMe76fQAM3GVhynOyV0p5usIII5XoQc?=
 =?us-ascii?Q?KdJ6eNNdd5lR/PzQSm0gpCl9yv/LOPo=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17454f6-1fd7-48f2-658d-08deecc6b08d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:38:44.4591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmtV0ivq7bLfgA4hifetBmhG2nKmSv3qKRNzkxothj3r/t1z5iLZ6Bso5uwhJVZCsEMAOkE8r6EUg8V93cvGyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR06MB10211
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:38:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10176

From: Niko Mauno <niko.mauno@vaisala.com>

According to the Whinlatter (5.3) migration guide;

  A new warning is now printed when there are no whitespaces around an '=3D=
' assignment in recipes

Fix occurrence of example verbatim applying of which would generate
such warning.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/dev-manual/layers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual=
/layers.rst
index dc63478a3..d33eb136d 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -252,7 +252,7 @@ following list:
          KERNEL_CC:append:arc =3D " ${TOOLCHAIN_OPTIONS}"
          KERNEL_LD:append:arc =3D " ${TOOLCHAIN_OPTIONS}"
=20
-         KERNEL_FEATURES:append:qemuall=3D" features/debug/printk.scc"
+         KERNEL_FEATURES:append:qemuall =3D " features/debug/printk.scc"
=20
    -  *Place Machine-Specific Files in Machine-Specific Locations:* When
       you have a base recipe, such as ``base-files.bb``, that contains a
--=20
2.47.3


