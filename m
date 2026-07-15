Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E62C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:56:28 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10808.1784130985376248240
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 08:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=YFFUBCvR;
 spf=pass (domain: navimatix.de, ip: 40.107.162.112, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKzJXLcFiqV6WyGvx0OrhPHGlnw3UoFaPNE6w1vsbuQoWIsXdW6gPNfWzNcy2xiGhjtjp16K3/DqcYInuoaSC6wjrj8S5MSSA7A07Nr/Q8qyvYaUvNnbe12hqkjhmxwi1VDd58proxlLOjaxpdaPLV1Xdd4uFujI6OBU/F/Vba9tEGnG7cpAq+ytLMbc16JIcAbHB56ugWXGQbgw66H/AnOLPZXvPEEBFH/bPlTp4g7vK+ehH2LVDubpYSyFdvb9wDuknVb+t8BX/mfjOCw+97afKfgL2EPmH0jTfom5d3dfFNIrPvjTRUcIBZ0mN07X6Fie63Yq6PP4/Q12oBTdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3ilRLDyvfcCwTJhD7RK0hMWbO/HF4BckVjmfX8Zf4s=;
 b=KtzZBXzWJ1v58+l2gCWJNlZoqxTnz9QLDRcIGOj+6atWuh9Naw+aruP4P491+vIIaI0K7Ec7GfDzk5SQSGsEs6uBraF22p5+ObZkYrovn0PSrokTzJtquY2Vw8dbS3aau0ZqWoN1mjaTCH3gUxXyzB23wcBqDud6ZcUnedywxph9HJang8+gmCqizw83MlvOtMg4QG/KV/0IOa12QyuBiDY++NvTHg8I0z66qp99fwHsgaYH9z8Hz8uxzlesv0sosMCHQaMdacSbnU6/hQfXU7EIA0d78qcXmil2+uUQiaxV6JbYHheoyv/e/bx/lFlGMO8E1QgrvDy3d5FueVTGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3ilRLDyvfcCwTJhD7RK0hMWbO/HF4BckVjmfX8Zf4s=;
 b=YFFUBCvR1AMnMsNyN30EqKroBQJri2/ztYOoR+Nyeqvygp2qVRjvEBG80xb3HzMrRRUCkN96Bh131eskJh+QNoW+SuvHFAcEdHvuMYwY88uc/alHP/BI/eWMr1IRunZTAh9Y8hjZy/X2s8Ku8arwzz90eYn+rhSSpgKI1HMtpC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI2PR01MB11191.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:26f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 05:57:34 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.017; Wed, 15 Jul 2026 05:57:33 +0000
Date: Wed, 15 Jul 2026 07:57:31 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: docs@lists.yoctoproject.org, joerg.sommer@navimatix.de
Subject: [PATCH Resend] features: Add distro feature "audit"
Message-ID: <alchGk8fYN2cPmGa@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI2PR01MB11191:EE_
X-MS-Office365-Filtering-Correlation-Id: 148880a6-234f-43b6-e587-08dee235f6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	B25yDkWOErnddiT5qdA6o8Mrgk1dpK6meJWWRTAGJMprofwuiv/wSIVK2p2o0J27keOIrnQu7RjR9ST/hgBT6KIkSUP/8Gq8o4TqZDxX6zqAXPUeirmiynCbLVjM6QD/7T8AVMySeOD5jXiXsNS6VB3tl8y/3Xo3t8bVgb7xvp0/oFheMkO2EPnZFSnKoENUCOq4Ip4FV+K04NkwFJI8sFfUGDWaz+32GUYukqn3/VREPTay0MmZD20jLeSmheXDT3A5aVZYXSfK8YQvbiIgwROnhKO8hIsg7WHNxbJG2cqX7cZkLB+CiigjlsdanZ+2NeGUv7SZoewkG1wmYXryM2pLII1yLor9bDqYZyifyRUtIOEUkjb5EWB02ZROfwDn1U0CgbepqyU6msbH65RC724B/4+n2AC0tg+vjPJ+JIMN9x2WTXtMM9DtUZAytthCRZ9dUQZE+q3+nnaS9j51NYRQSwXsRa3qzP82tf5Kj7YE3q8wOetnzpRkga9ChBfdHek3T1oBqJX5AXF3d7ZFrhXdGFOeWzpqcHKAawbTPAsrwP6Ojn5U0/RY36R5TtxypxCrr6Z6qenqX3vu61apwPZs9SPmhM8bIdInXhnhz5B2srVYBgj/AdIr7NFhPP72qiHT/amCZrFlnKu5hUzJ9ZjWWkzJvCRBvNTmuffgkgA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tzRaHVSjNGtpHUOTXhNdPfjmmRlLQHsjTxuGBBQu868eeGutd+0Epe33sjta?=
 =?us-ascii?Q?nf/ukdPkSAvCMSp+hXvK9LmWgNHkeQGT7dThTYX2rcNZByY6OR8Ewqaz1BUO?=
 =?us-ascii?Q?W2LtLaWloaxpENi8HLLFbgkgSiju+TzeLwwODVUK01++d/wmmYXAIi3xyDtG?=
 =?us-ascii?Q?KFYeob/cc07XLAajzenaitMpRxlsjHd4GJLcH/Y6ezHIrBvjNskpJrYYx4kc?=
 =?us-ascii?Q?OAzYVgnapjUMfwqJSXjRe55i2a9T0wGxWZQwXcRtgwPV7yhkxASFTDDvgBy7?=
 =?us-ascii?Q?R4sPgTbD5gLNB1lVlFMKLbY/ZC47TNQUTE1tUz4kjZ55iuE+ymZF5LJei4Q+?=
 =?us-ascii?Q?bb6rh1XX0y8zrZtgiVirDcr36S1gu02i+dj8sY1sO3z8KJIacKcwITX/SBce?=
 =?us-ascii?Q?O50Xe9DHEKYymV2qV8Zk1RhLqxhdpljsz1qE1zw9w6OtsE4DMc5s4QDZcxEK?=
 =?us-ascii?Q?ANrApMba4F7IUiQ3YMTztd5a4Y0rnFQZ1jfnjcOeqvvHXwfOgyubQOAjbLIy?=
 =?us-ascii?Q?hDxMZihnKrR2pyK724vpgDs11Wyedtz9tAq5K26x73bY8P3N6vwlNSXeuRTG?=
 =?us-ascii?Q?Nje6l3QB5GkgKy4tD4IhHsJXvtppPjSAavinpxm3peWcNaVltROMvuOtMY0F?=
 =?us-ascii?Q?yKLeP/xIgraTTr14PM1E20POohrn39dbiszzNFggCyII2EDMvs9bNOrTb/J0?=
 =?us-ascii?Q?fSSB9spfct5hB5WwPpXUZzTzYhe8YFNBt2OUxx+cd+IRhTQgqmPBc5L+xqSj?=
 =?us-ascii?Q?ZC4Fv6K9B1nEauJIhBkmq/m/U3Du4VweBObTnasojcoJcG1rZpXY/n1D8GCf?=
 =?us-ascii?Q?Pc6EMXwtO2kAE/nGYs3ptY9IFoKyfAour2y7wr6xYS/vo8SMC2bJFQSq6QL6?=
 =?us-ascii?Q?T+jWaqg4AXcr7Qln96VrkmAi6lpFE7CpPTnaMDIrge6MEY2D+rp34xvdnpum?=
 =?us-ascii?Q?6ErowyXVVor/6EyWR9YmTh1WfsAqBlttaNybHvmKMlJSZlNtLlKgQyq9MyAE?=
 =?us-ascii?Q?oJ0HUoO2DtUBj7moCti3qefFMuQfRb8d42vsgjqCwDLcm0AilyoPaRlaaQPm?=
 =?us-ascii?Q?Jp/L8lY6gEDni5JrrpgI3tXrnr30MJIJN5EWgIrVhsPUzkI0rODun3Dc0Bbk?=
 =?us-ascii?Q?hdgPiR3uHND/7z09XZKAM307HRWyQta8AI7TYNMOVZHPyaYW8pU/MytSpQiJ?=
 =?us-ascii?Q?ltUH2Q8VJ/BbITrJ/R3MQmiF7qIpb/6QdOzxAW5nXY3sB8uQDZbLu8YJYWbH?=
 =?us-ascii?Q?HeolkMAgAf6uCf74oqI4t8c8GZEWnjys2+OSc9FLTQZrzyLLkvOWtHy94A3+?=
 =?us-ascii?Q?gPNObpB692QjNdHaKVi4EPb17UowmNnYW4oT49oRCUsDpEEtHjgDR4Z1WslD?=
 =?us-ascii?Q?T6rbWQpXa+rWbx15UsoqaBUsgwIc/1x1faiUD0bvzrWnU59+eIMcZDq/lBdG?=
 =?us-ascii?Q?OwbvC+xDcxWNHKGC49hSsgmbPizmYsTj1CDJUZ2rDdKcpwhaXpX8CCKALmrQ?=
 =?us-ascii?Q?JcJh3+z7mixsAQVqRGrZ1ADkA1jcHTwPU/TZPyKLgxZLxAE0tWqJtuoyf7XP?=
 =?us-ascii?Q?Y5bwsySPeF3EfOqHx3IaqKudOvLmstzW85tPKE7ZebPyVMEkGT/jU6/AnpwA?=
 =?us-ascii?Q?chFGkEnBxuCqm4EZNs8To55R5Ib4LCZ2Y0+e/zZpuTKBiwLX3FayiImcUFuZ?=
 =?us-ascii?Q?K2pTOSOd41m0UBVXyGh26n9niv6Qwct/5yB7yuI80TY7fmB0fPUOuvEwE8s7?=
 =?us-ascii?Q?Oa8jK7OZnL5vrLFNfsUMHyG2vbKmCII=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 148880a6-234f-43b6-e587-08dee235f6af
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 05:57:33.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cnZBWeMQaTLzx5HwtcyxkqB2ncgF5AA2I7+Yvz3i0ADCJt/S9Xsbi130JiQYjb4/AHFm0Z71QXJa+3xoUE1T29uEmue5YMP0PGLvh8j70Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR01MB11191
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 15:56:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10078

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 documentation/ref-manual/features.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index 77d034f0c..7194bf4ac 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -141,6 +141,8 @@ metadata, as extra layers can define their own:
    section in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual.
=20
+-  *audit:* Enables libaudit support.
+
 -  *bluetooth:* Include bluetooth support (integrated BT only).
=20
 -  *cramfs:* Include CramFS support.
--=20
2.53.0


