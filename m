Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E31AC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:08:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7661.1785229689386398720
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 02:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=uLAcMa/E;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.79, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HY6aYC9miheveyepPxqIYN+W3WvE3YGIoKKtZlD67Zh6VKz8HDaYE5jlPY3r4sWnusejhzBgrrJbR7hxEbrOalq4a87/VR07NZ/a9MMdmeaMJSzqKOCxGty9Fm1GyFpNF9nn/ZrbPeQbMKRXA6DErkMkL8VWRB1qjaLzSQsBAIGXDW2DH8OiHtGon4CjrZ4AtkvD3RDNL3HAfQBQTYskmMqkunHIKquCMmc1XbT3onLlTFbBxr4Oxd9yIAeuhtfu+D4tL6bZnTSe14FfgqbA2ng6uS+twBXFOr+JJd69D3QHDzpHKzf+nTZRXK9JkIUAT9YkZZtzQw0hIz+eFkCVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqrrvVqxFx2MYtVXxOJ15Ms1vRglAIAP/b/j/jMmiCY=;
 b=urrmBcEpMOX4TJBjrkGcyHMG+AN/KOrF9Pw3mvRR+EqN3VixL3oODd7XfuXotR/VbMRCidyjNwsaoC5q5KMCeaX+IH4ndS3wq8bZ9HdZxnLy+NZDQOmxN6colHIlYXBeSiV++5/dIDtz7x7EK99oeOaRLBvmuSsN7UJJYWVA6KnidkTnD8k9zVgpeSC7XAqMLiYEZHmVPa2e4XL2i+hLOoLFo5Q/vH3qPRPaAwVEsqxOR2ns/Usm+MNwOOUNmgoxehMzHS3FNVFQL/gdKIcCSnR+LtytUZ/+xw+4LMhrewe3JwYO9ytLPPF79aTyNvRxmnP2yx9gevstlcCiaauftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqrrvVqxFx2MYtVXxOJ15Ms1vRglAIAP/b/j/jMmiCY=;
 b=uLAcMa/EEbeiDZcrV+QY7nV64yQFiX8LgOGbaQYp2AxUZ6wSFYgNoxxjaWkz3vK1Q2vCGbQMcsa5oWcujRBRYSN4QMcSQAkgq6MohkDG2NxNNXveZD/ynD4/ihd7v+arbuFDgFqcU/Dp0Y2dw0B9zIZJuGGoPlu8eKGVMlC7fZnA/NhIyqfFrFUehzdhg7GFkdTDE5P6KUoVbEGLPPlD/sPMyBnLiT41pfXhrVYA8R0/klq0SA1nkgLHPRZKzgw5MirhfoU4DoS0WciYLn/oK+LSUZkPWKX7wJ4By5UAyF2k3mzDUQAOeEpLcoqSGqueRdeVjkNX7O41G/NobwTBsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by PA1PR06MB9700.eurprd06.prod.outlook.com (2603:10a6:102:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 09:08:02 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 09:08:02 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 3/5] dev-manual: Fix missing whitespace around '=' operator
Date: Tue, 28 Jul 2026 12:07:36 +0300
Message-ID: <20260728090746.27793-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728090746.27793-1-niko.mauno@vaisala.com>
References: <20260728090746.27793-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0039.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::7) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|PA1PR06MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: 46219ebe-9aeb-48cd-a8a5-08deec87b912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|56012099006|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	0M1E1WGiSUWt32AlK6bfKAAd8whcXo1lMtBt7XX6RZgoNb629g4GAg+Bc5/yUlrA0hD22CFGmYTK71tfx+ED/afWg39CLM6tEvT75Jk+YyXcES9S1+2EuX8VilDH+hCuKCsKf9wPLCT09RKwdpbFbM0ryhsxcrVvK2rn92JQlBcE/lDwQj/vpwvjLnjTnzmUZx0c9WMDULdJiql5S6klCabNoctiA8eHbhPIfXoK1l4TMipfBy/WJcuxRclANFXNmTegFWME2lINx8zcs948ppmjB7aXD5CXeNxCDqVpT7OOPLBYw6OflKXSeXyOyDlhvFTM4b4Q0t7ewqoeuHnmIDX7I3pK9RMBEmaRVzlTvOK33JSMwsQB5Wn9D24dxkuDT7FXnxxflNXIrhWqoL4H+nTEC0LWBdcVfDpPVB6xDvoR5WD8bhYNOTjVKdl0MWLVnSYePn99GrBYCmDyG5sOrTFKR/0woy8ip/qhY1CWjoFj3hIbjqz+iHQZOE2YPv8WCSS0yBfeOOP0h/GemCW61BBy2tbxZ+mrWf/8Vx1ydHUQpozXUMOT/XFMFd+KahM/1e39tUVbdvqEBGUjhrd164kqTxgLP3T3gNMaKUtRiHbMfL/9cfU8r90KpAX9I49fjmthpiKjLA55sW4z03tYP9F2vZBaw//8Aje3ShVXaB+wIA7nCVmRk1rtJjHhAitotAQ97BUbfAE4GdjbcS7Zjr71MXSzK/0TBZrbMP7e5ng=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RwYiUIvcDi+ifHHSmJQ555Xc2SA0NsA6ShVyrnYS6pHpAO9lRi7mO3QslaB1?=
 =?us-ascii?Q?SUE3+0qx5UiHQXwHuKoWULXOOoGsDEpS89YUiFxmyWVUMjvVUmkrSxc/V2YD?=
 =?us-ascii?Q?Ns38bz2yfYEwscaOjvFWnhuo3uVhf4rAafk8SvO2URuBMerr5gXXGg+cXEl2?=
 =?us-ascii?Q?O0a/PD6cezNy3kUQ89CFk1PMzN74s8ZhrObGy+m3gkJq/zPXUWnSSjT9ZKlW?=
 =?us-ascii?Q?Lg7tuNpXnAUL4Kkr+tIgY46XUYP3tO0RNH+/DHm3Pp01yUhIvWyqbSde9lMs?=
 =?us-ascii?Q?D+jLcLaHipqCG5Bmi9NeO+yXSTFvaOsnnMowtzVzKdzr3UCXfs075gnZ2OGK?=
 =?us-ascii?Q?PliLGn4GYmQn7xcfe3wBNQV5K3YLgEEjn/UMvLr1UuSyRffOj0rSGj2EGys2?=
 =?us-ascii?Q?LCgo4xuZZgArtpqf6QqgNL0EMqHsU3qzyJt50wA0Of/AKTa5cqlox3UHYlir?=
 =?us-ascii?Q?1EIER3fMPrVX7+m3Q7D0KSsnnQV61jZ5bvuA7pPvUgXkY6Xi4qz9RX09NWEu?=
 =?us-ascii?Q?lmaRqBkpr13EcBJd9NxJH5gSnY+zQsR901Q+ezw7dgXp5SvJrVP1Y8MuLhvx?=
 =?us-ascii?Q?Rc6gsuwRXTrVudYQ4LWD3tegq/NpCwj5SK71XvyYe+/rhy/uqTCKWm+JR7Jr?=
 =?us-ascii?Q?o0JXsHTbBQCvpiB/KCpr6AmIAJXiA8LvMp2Kq69FFm3M6PTt1edKvFHmj4UD?=
 =?us-ascii?Q?kyVwgKwRRlnrQD4Q+uDREv7SCY8YUksy9D/T0x+SfH6XbQpYnzr8Px24Fbo4?=
 =?us-ascii?Q?tXUnSG4tPubJ7iPC7NgkDIVgPwfhlapxdgMZ+m035YvvQxuO1inerm5OB0KN?=
 =?us-ascii?Q?jG1Xv+nIICTXIbHwgOLe2RKjaEmvXbk3bsHfUVlN9Ih4Tab2VSwLrNWZqc5A?=
 =?us-ascii?Q?H1/iPyPgk1vjBMrl4R/Rk20nRAYMiPhdnNMGFBR8bWlVfKn/+woSm6mqFRX3?=
 =?us-ascii?Q?krt5EhCA8yLON5JYRcLHh4PKrM5jFKOWLAvmSLFl13uUBzxzBBz57zA6OpK2?=
 =?us-ascii?Q?9/pRx1wBj4pgO+QZFdLwW1YbtNaO4PieI73WhebTZkWcA1t63Sxj2v7nKRdx?=
 =?us-ascii?Q?7zciV+NQitfebv/PFDehgM/0tv2Zi+6RVFBjJmDafyFL2L2mlwapns3NJx9U?=
 =?us-ascii?Q?R4qfPi4hRjbfPvOS0zIKEXjw0h06d5RRfD0bcXwMTCK6l4bUEle9mk9UlbU3?=
 =?us-ascii?Q?cDADo047kP/J7GsxHe5VUKY5yDeuvySoKZGxOvnnYQfJgKbNepvTeG12IysZ?=
 =?us-ascii?Q?1RFU5RqPqN/gcd9mdAmFgLrfdPb7b76m/ef7dQkIEEzH/nA4mfyLo8s7ir85?=
 =?us-ascii?Q?vUVnKkUytwxrJfdw93m/ZH22CRMJ09S6T04BVEEkI/HHIAmV6rpvnrdUQWUj?=
 =?us-ascii?Q?E3zoP83Mj0QUo5MrfNTG3Jfi80gH7cLcYbkJRXh3uSsE5PZED61DHcpvjXaV?=
 =?us-ascii?Q?rBVMkhVwNiCdd+PFJq8q0pxVOEUl/NWmHbSJ/ls+6AXUE42uweixSwrX8hrL?=
 =?us-ascii?Q?AoORu5G2KwsFnqA7su+zEBVr1HQVAWuqzhyg+GNTLLYXXtGSGpa1YpjNVjKT?=
 =?us-ascii?Q?kVW5tzxlfHssYpLiVRL51kdpXNy6CTPDprvQdxfq21wPS93lt8TQQSsbR1Kw?=
 =?us-ascii?Q?0Xy489ub8L1vBwWfBTGaA4BEP+cVf7fSpcfHTfP7PwqNW5G5vSJ3mYYTaGwm?=
 =?us-ascii?Q?7rSXmv/MZtAA8lwJyyeJ7dYwQqcORuCpboSJschu70Mjbw4EROWHW/bUGr6W?=
 =?us-ascii?Q?2r0g6/DWNb1G8djw1k0rVuxvLeOFr/U=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46219ebe-9aeb-48cd-a8a5-08deec87b912
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:08:00.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0PdmjaKRAvS01NeK4JDr4kxbbeXxo9vyZZQ253rAxH7sCSI20Tt4KJ0PQAKO0chfm0H9Ud1ovZgMlvDPWaXmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9700
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 09:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10170

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


