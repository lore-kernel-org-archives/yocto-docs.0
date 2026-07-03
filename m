Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FE1C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:06:42 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.93207.1783087591689014562
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 07:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aW+SVYS0;
 spf=pass (domain: cherry.de, ip: 52.101.70.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reOKaK5GaVbarFJvmkkuCA1Ap2ncGwfzLxtQ0uZzlKSmzU77yrau8hZls+mwefh8TFf2Dm+9+TwMBt2iicIO/bHMW3qSqsiPfaqHGRzmrKUeK9qE8JIFLdlt7Lp5IsM5pfvIq1CoYSemFfj4cK26WgdUT0ZLLYQGvfoZ1OCXNJeQ7N7UYHRCaZ9mCCAWgLlbE+ndZYkARUUwJkkPdhPk30+4T8nq64YhKl12p6vgCd14L93b1nzEQM/cv0QZOiTc9GNdTW9vPUhbB/TJxpLm8TVMaBEk3Hy9Gb+/DQk2v8ZjEGoO+6Bzdsf9JPyMBURvAMefSFk6SW/HNnkUOsDqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8f20AZVGj03faGOb1CCCZc/b8GKHLB7Jlp0bFAF3M4=;
 b=OxgYoTOUhDSLo+vG/q9AaMOGDOZFizbrTGZyS/Mo7NqNmfdK+4oXNTwrnR4TELUJ4HgbP+0MEcSeKHyBFVn+9NdS5X+FOFD46D+4Qo1GzZEqIosvVXyq78Pnc/4/3VLpsfONwqUpFd/IVQz1pnkp5+7sIT6Qs7ya1XdwzlB6Lp3uvPHG/0/IzPDWuDvpmORO+vFezdv9NwzAty46V3uk0qyOPoCG+4LlHBQmhLOe8bWXF+fgl+SJKHm7eOqFwJZZ4yBE3pMtKWnjc8U5Q7MyIGfCHRn8KNff+Sr2VAPOwx0co9dmbT6Dec1UkMExA2mDHjQRSLyQmSrU05UM/eAmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8f20AZVGj03faGOb1CCCZc/b8GKHLB7Jlp0bFAF3M4=;
 b=aW+SVYS0WhhrjEYcleXUtgezfnmOv8w8jsgToQYv5icVSOKsg0k5J2v0aXb55iGqNcRM3wgyMwAbTPLqkNIKmN69O0jxPy8TISx0FfADCgn2alPEhWqnVykGlqhVoMJjnDUkuJgphJBy+w7HPVpgB8pjgKTVST+i/FBnpB2PVE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DBAPR04MB7414.eurprd04.prod.outlook.com (2603:10a6:10:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:06:28 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 14:06:25 +0000
Message-ID: <2c6bde82-e3bc-4c6a-b4ba-0fb3ab73f4b0@cherry.de>
Date: Fri, 3 Jul 2026 16:06:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/3] tools/check-glossaries: fix default doc
 path
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260703-pre-commit-v2-0-a9a391299c28@bootlin.com>
 <20260703-pre-commit-v2-2-a9a391299c28@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260703-pre-commit-v2-2-a9a391299c28@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DBAPR04MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 49627d19-ac64-4b6b-978e-08ded90c4513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tXhuQlsKE133BnIPsuNqHj/+f/GCJI6+5iPqNo/FPSKAuzhEHskzIEclK963uf3bN3prhaohmOzBxzHuUmb6MFYLFAIRS/Av9ZI/VyGkUoQxdyLPjav4SQ+yHmlLKyhiGl2im+eFmjI40t8SUxbbt+iiPdFUo6WI7GL6ZXI5pzp2mC8E7fgltdE+V4r8yQdXMzQYkUBOTrNSQTccHfcpZYQcCyD8yaHJ7Uu0yxeoMj5YWHZh8bLeavlakTPEGdNdxWqDpwwCLqLa1djBdsbpssQ61IgmDAb7O5fLRAdK01qwb5RJc/qR28C2aXg9Q8CYcIQ0l+UgVi6SFWj7vhCUz+tQ8IIQPVD6KWeh3U5Pz3suA+FoT+n3foX/eOikb4CUZ1M2767U2T96RA53A9993Um4xqxFdjqY8vER5zj2e+3VFJDdQRnsL2+O6gtLi31Uo2KeWdLe46IpUOf5lORQOccBQb1NfGD+0AUsZLeZAq0RN2uKMsJzQWzLhkv9E2Bc9mL4a+MixHz053mpLT2Q4ivzYXtYYV7hdxbufXvy0GO2u3qQ7mVbuuShw2yBvCvjikvOMaADoiGcsgSqPBi9/MlyuQAHKGKUR+KYnkrxR/qb1YM/i0XICqsBH8KIVEcf2ZNeotlLah2cukFUTtNiIIuU/RyZPHvTn2uUKktKHY8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGw5cmtWYlU0WUZQTkhaWGFvVktnREFzY1lMWGptRWk2YzlTSWdvc1pWWTlu?=
 =?utf-8?B?SFdaTHRIZms3d2xmZWNKWWMxaGxZK2hiY3pDZWFrM3ROOS9XOXVEL09lTE9j?=
 =?utf-8?B?WWVUeEJVbUVoejkwRm9aaU5lZ3gzYUVnTGJXeUk5SUgvN3p0a0RwaVRFOUZl?=
 =?utf-8?B?d29tWEdLZVF0SStWMllROEwwWXZGYW04LzhzejI4U0VPbFJRejRINXlCSFFK?=
 =?utf-8?B?MnprZ0ZGOThUTmJxNnRDNTBETmEzTmo3aWFCVEdGK0UxSXlZVnhvemR2bEJh?=
 =?utf-8?B?TzNDUDhTVFV3L3F1cW0yQ0tJSndQR2dub2lKQ1gxVm1ncjUvMm5WSXNxTUdJ?=
 =?utf-8?B?MWljTXJBRnpPS3lHVGpwY3VDVHZlMmtOYTljdWJ4dk15cXJkNHNRU0xXZlRz?=
 =?utf-8?B?VGRDT2cvcEUyOGNEdE9IMHBuKzArcjAwM3hKaWUvZGg4dFNlTXpya3h6cXNR?=
 =?utf-8?B?aXc2NURNbzRlamVad28yUGs2aW5HaW5IZmFVcHczMzV2NHJWQnNDRU5LYXZF?=
 =?utf-8?B?cVkxb2Z2TzFNYlV2cm9Xdm1VRVFnaitraUZFRGVIUzVENERVNXRGYy9uMTNj?=
 =?utf-8?B?Q2N3d09LaTlucFNHVHBKTFBhZHV2eUpOWi9hYTBldVhBczBGZmJnK3lpZldR?=
 =?utf-8?B?aFM0dUo4RkxjM0xZZWdmb2VkaGFpcEJSR1Z0TjMzWVZrZzBPTmNBc3JrN1hh?=
 =?utf-8?B?eFBHL0ZoZUdPZU1MNy9ua29oRC91ZVM3V3dMK1FmcldIaXZNeFZXNkJmQjBm?=
 =?utf-8?B?MmZSRWM3K2RyWlkwTjFBUzFrN09JZXBDbkFFRVgvTzYxRWZXWWkvTGJPUHF2?=
 =?utf-8?B?SjgyWm5XWXhpN3FrZllLRmpXdkkwb0JmaUtMbXQ1ZHVjZDRVVGM2NEd2Y0Fk?=
 =?utf-8?B?c0lrbVFCZVp1cGYwQ0FXdXVNS3JHQzNDZHpMcHhlUHNCM0xudGxmY0MxZklK?=
 =?utf-8?B?b2I2amJVTzdQU0JwTFB2TkZkR3grWXZ5d1hRb094M3FtMlJIUjdGY2RpaFF6?=
 =?utf-8?B?blN6aTdtMEU4eGkwSExkMDdxaHFtN3A0eTYxcGpPbythODZ5Q01rTlZUeXN5?=
 =?utf-8?B?ZnQ2Z0tQMUdoZzJhRlZJZ3ByekFBMVduZnNQUTRVQXlBZGU1Z3E2a01TdEZo?=
 =?utf-8?B?TXZPQmZhZk0vUTZvZEIzdWJKSkJWT3NoaUVIVXdiR3J5S3R0Y0JUMXZWZlVT?=
 =?utf-8?B?eUczK3VRQkpJM3d6SzJCOTZ5K1V0Yzd1WXkzMlVEcEpHSG85NHBHOGN1ZFE2?=
 =?utf-8?B?SFdQbDVJU2kybGtqNzV5a0E3L1FiaDVydy80ZXRqWVpOcUZpSnhoRlk0NmNx?=
 =?utf-8?B?Rjg3ampESlVMVk5WekxuK0FIQStQNDU0UGFMN3JBcm1OTnJtNS9WaGVOeWRQ?=
 =?utf-8?B?TGFTWjV4aEJKV2FYYU9jQVNiQVJ1RmtTNmtYSE8vR0ZvaitLekY4V3FXNjZI?=
 =?utf-8?B?ajRIT204K2tuc0JBVitYbDc0Vk8ydjVpaXNyZUhGcUYrdkJTSnhQcTF4QVFy?=
 =?utf-8?B?eTRNUzNRcWRKV0R2RncvdDZpeXBadnlZdUhtdWlmOVdGeGk4c1N4d0xhL2xX?=
 =?utf-8?B?TTdhMng5R3BsNkRReXRyQlU1WUZEamI0UUR2ZHQxMDFWUzB1cE1GVVpCM1Np?=
 =?utf-8?B?SWxzSmlpa2ZBUlRlVzh5aEJIbzl1V2d0ZGw4a0JUWmcxLytzMkY2d3Q0Vkdq?=
 =?utf-8?B?dkhwczZnMkhpWWR3cXZRS1dnZzNPL2xGWTE5K21RZ3h6cDJRTG5PNG9DRThI?=
 =?utf-8?B?UGcyL0Q1eWhGQUk2d1lpb1d1U2tjamI2a3B1bEUrQTlNVThJcVg0OHpIQzlj?=
 =?utf-8?B?QnZadnlXL3d5RTR0eWFES053TEJlamRnU1BMTllBL25xaGFnZFVpREpZa0lm?=
 =?utf-8?B?YXIrWlNmamxXdUhUTEhFZXlCRXJuTEwrdzVsNUo0cHhGUWFZclJKK0R6Q0N3?=
 =?utf-8?B?b2xHa3FGSmRtY1RVbkV3c0k3QTJ6dHNCUmlZSzN0THdnOG9Ed1dNUi9PRVI0?=
 =?utf-8?B?VUpxQXlvNWJkN29tMDZUNW8wT0JDaWNDYWJYcW9pN2R2Q3hiNHU0MGtZQW9y?=
 =?utf-8?B?SEFCU3Z1a2ttd2FPRExhRllJc2tLbXNiMERQRDZScUNqbThGSm5EMFJMNE9r?=
 =?utf-8?B?Q1VlSFkyU25TeVNBK1J6YTdDbm90YWViZXgyWGxBU1VVaElGWDhCQUhsTUJs?=
 =?utf-8?B?WWtRcmRPdlBjNlV2MlRnQi9WbzY1V0VRUTdNaDVCRDkxbjE5Sm45SERMMVVx?=
 =?utf-8?B?TzRDb3RJRFcxYS84QkhxSzFZaVp5ai9GYTVOSGFabmR5UUxudG9BVk80MUky?=
 =?utf-8?B?ZGZldzBsUHVXd1VWOUticVpTcHluVHp3QWRYdW5vcml0TlB3b2hiUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 49627d19-ac64-4b6b-978e-08ded90c4513
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:06:25.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbMk0H9zPMx1DB1wFS6HOgCSSWM71dtYYmGNJJFnhHOiVL3HbDoY8kypX8BGsJl4eMK+vEQd04DXsl+ty1WFSXfPQ9kHRDQsENpqv0erxvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7414
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 14:06:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10033

Hi Antonin,

On 7/3/26 1:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> This default path pointing to the documentation was wrong, fix it.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

