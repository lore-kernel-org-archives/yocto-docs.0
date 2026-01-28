Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70436D3F06D
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:27:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14495.1769610440302694928
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=MeVEhn9e;
 spf=pass (domain: cherry.de, ip: 52.101.72.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiFZvc+6PsfeGAQr5r1w97N5c5pxWkD7MXO3ASEUMFQ89zoDdi41f/N0CwVXbe+YH6BsQp91Baa1VMnQs9L/1cPtfiDJFVtkB4BMEnN2Wit/9rnuQet8QukyMWjgPu5qegwXwIzqeku1a+HUOoMllUAy8a/7/86uHHsDLE4lpXjHSaVqWxb2UFHKzapiYQrTLqDtyWqPjtbYg/76FKXpaa3otB45QeemqMh5hZtCfXryVkgN2gnJiLrxfRd6SXOXj22ZPggN6PURBcl8fxvX5JzmPbjpZ03+IMfs89NHcOOuDKAbjA3qm8edZoH0a9y8H6g9a4e2CzhYLVsSnkoAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+nWL2HlgVrS2d8WTYYXtrFvjYodsZK6MoKNzzy0w1w=;
 b=e+gSHZZeems4xOT90TxseToSJ7uHoETZh5ZNc6rxCuNrnO5OblDwDmdDEunAJQvT7nWII4MIyKOfYJERjqluhWLtYVKEWtE93yIwbePzssg6D95kupTTi2nCLCz8PkZso0ajtJRqcp9UWiao4LE/p6eHXrTqU5V6sgBXO/xodWZytHibDn3HGlfCKFVxKmCAuQtkrwyrMDKW+jlnsOfdY1LrarJQgsuAPwWzTzZuX0kG3z2y1vHmkE6aUauK8EGD7QYIrgmOsJ4Ut4H71SxgqqjlTBthyM2vtJ7wwBAUvTcP9mTle6jmT03lsjfxuW/yUsKw+CdpvhDm+KkzxqiFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+nWL2HlgVrS2d8WTYYXtrFvjYodsZK6MoKNzzy0w1w=;
 b=MeVEhn9eJoO0Wrqi5wf+85IjxkAN/f2DJdRQCkcncveHklMVJu8hzr0+SC70fehPferSXS78BpEcGLTkhdLMYRG1SYhQjrSE/XRQItodOgPZ7MJSW2QVpHBYT4IDF2Kc6nbuBhEnnAS0fkSCQ1iRybjV1FWyFx6uq1hQG7VMMn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AMBPR04MB11838.eurprd04.prod.outlook.com (2603:10a6:20b:6f5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 14:27:16 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:27:16 +0000
Message-ID: <024d2fff-2a8f-41dd-a1ff-81898cba1284@cherry.de>
Date: Wed, 28 Jan 2026 15:27:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 50/56] ref-manual/release-process.rst: remove repeated
 "in the"
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-50-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-50-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AMBPR04MB11838:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa07242-4ba9-4a4f-a11e-08de5e79561f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmJGSVhPb3FIY3NFdzlKOWtSRHovdjVZdEZQa0R3bWZsMnl6UzFEak9sK1NT?=
 =?utf-8?B?RjhNVm5zVFFKNGYxNm5CclhNbGpPQVlENGtHZHVoQXlUTllHdDh2eHR4ZWVo?=
 =?utf-8?B?a3hrQS9jNmFIUFpBb1RqTlBKL2thMGpMOVN3S0RkQUNMcXl6cStTWllJYW5p?=
 =?utf-8?B?L2xhWVhqSksvS2ZaWndqN3VZNXl1Y1pvdnpBb2ZONkhRdkJ2VDgvUDhxb25x?=
 =?utf-8?B?VzA1eEFKMzlodUNrMXlJR2FYeXNNZVZzaUZWdCtOdUdWSHZ5c3RXU2RkcGU1?=
 =?utf-8?B?QXFucGVDbGlnZE54UkVJaXZrdGxnNGI3NTBMYnVYTW1sWTNTd0IrMGx3ak9O?=
 =?utf-8?B?d21OMURxRXQ3MU0zQlBzYjhkK3hnY2ZuR09DRlhzeWpKam5YbDNNeTBIUkpT?=
 =?utf-8?B?K2h4WjI0elhPZE1CUHhGNXlWUElFcGJ5QjBMWkV4d0Rna0VXclhNeENEUHd2?=
 =?utf-8?B?a2JhNEpPN1pSMno1bVgvejdFN0RoZUJHbThralNMK09vTFNibE9Wajl2TmRz?=
 =?utf-8?B?UXpjOGRvejlDR0NuM05RcHVhcFMrWllVWnpkOFR1NHBEWGttdDhVY245NEgy?=
 =?utf-8?B?a1ZBSEl4VEJWYWtoOWNiV1ZPQWZuNUpIVjl6TzcwajZXc29kczZJZVQ5RkVP?=
 =?utf-8?B?NFNXekhvVy92Tm1JVDh6ZDZ6MVU0blBLSUtyaCtvUGJUN3hZNy9yZWJFcEpG?=
 =?utf-8?B?RWpjeVlXWGlyU2IzVlFmdVpZYjZzdTdHNnViL1lHZ1pMMUpDQnpiZUUybEU5?=
 =?utf-8?B?eHh2L1lJb3ZGNlk3dkg0a3dMU2Y0VFA4Q2Nxc3dablhiWkw0aXlEbDZTc0Jm?=
 =?utf-8?B?VXZnRFBYck9GZ0Y5VjlweUN4dW5hLy9xY1F1akFWVnh4R3g1T0FIRmxSbndw?=
 =?utf-8?B?Y3RXTmw2SlhiOFJ6V3R6bzlQeURBT1VmMlhPS2xPNDFsdzVhaVRWY0VpSS8r?=
 =?utf-8?B?eE5IY0d2RFg5cE1pVkJmRnEreEtpRnZBRHAxSCthL2U4cnQzcXIvQjhuTWV2?=
 =?utf-8?B?eGNaVWRhTFc5c0tueDd1ZGtpeEoyeVI1Q2pGTEhkaE1nTHoxZWR0QklGRnRx?=
 =?utf-8?B?RFNNVVRmNGRDdFQ2MU1jN0dUMS9xRjJTOWYrSURRdURnajhHOTRBOERZZXdO?=
 =?utf-8?B?ZnZKTkxseUI4WG9ybGgrYlRjbHplc0F4anJaRFZEdHg4TkZQOWxQOGJMcEY1?=
 =?utf-8?B?aUJHbG9pMUI1bENnZG9mRDEzUmdOYnp6aDRiNEVLdCtsNUZ4clArRnoyRklo?=
 =?utf-8?B?USs5dTFlYklSQkFadkZ6c3h2VldzZXh3bDdvc3BoRmF3RlZDUG45bjI2Zkp0?=
 =?utf-8?B?NGg4QnNzYVBOOUoyYjhweU10K3poU1JTWE4zZVdOVEJ4VjNLd3pjNHF4N0Rs?=
 =?utf-8?B?MUtyY2gxcmNaVG5kdnJVaWIzdkxKQ3FpUGhEY0lwWVZ3ZTlBQUhyY043amVx?=
 =?utf-8?B?Z3dVV2tDcjVWVHJvaWNPRngySWFFZlQwanhSUnRaVnB6UGJ4bW9CSDFud0Vk?=
 =?utf-8?B?cEFQaWRWOTBYdzU4aTJyZDBHRHJzbEROblZKdld1WTB0bGtuOHJFRXRBN3Vw?=
 =?utf-8?B?SHh5SDR4dldGWDdHNlJML2ZLWXJFY285dWx0Qmw2WlVjOXpCeDdaWjNMSFdq?=
 =?utf-8?B?M3JSajRJS3NadkxzcUErRk9FbTkreUpzcG9MUXdJK1dwUmpKeEVXeDhpRWFl?=
 =?utf-8?B?L21qT2c2c1BoU3R5N1cvdGFHUG1TZjBMRVUvY2lVVWNTbXJoeWJ2TGd4cHRv?=
 =?utf-8?B?UVlhcFhERDUwK094cjVtTFZWL2JYL2xIZlBkR2lsZUhOWFFBei9KZ0tVZEhV?=
 =?utf-8?B?amdMZkdVYTVBd21PdE9VSDRNL25QSzNuaS90WDNjVXgxd1hoelhZYUwzU3lU?=
 =?utf-8?B?M1A3RDhFaS94WWl5YzZRTFk0c2pYWWNhVFRRWk1kODRXOGFMSkpkc0ZrWGNt?=
 =?utf-8?B?ejNoemZoc244Qk1FVUJTZE5YT2k5dnVhdHFKaEtOc21PSzJXNWM3QXJBV0JR?=
 =?utf-8?B?dEJiZGtNNjlZNytxMUVLV2xsZ2ZaTEtTaGFDYzAySnNkUndPMjVleFdxUHdq?=
 =?utf-8?B?aTFOL0VjYXBUNzBGOFpOc2lDY1VUQ2FEcEFhdEcvM0FkbTgyYWx5UzRrcldz?=
 =?utf-8?Q?0318=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkJ3QkZtZm5LeFpJeFVFOUswS2lNQjFESEQvdFRwY2taOENTNVdYeHVnTzlw?=
 =?utf-8?B?RjlJUFlLS2FKK2F6T2ZPcDNraFN2ei9CMHdVWU9zUm1JTmxUaEt5MCtNM2VX?=
 =?utf-8?B?V01pd3AxZDBGUnU2VzlxWHpEeDFRM0NXekljODgvREtuaHcwdmZ1ZmEvUXA1?=
 =?utf-8?B?TVl6N1FsTFRZZzB1cytVcFUvSHNQNVp1KzJqV2d2N3o0OWFvVGNTRTE2MHB2?=
 =?utf-8?B?ODZjZSszUnZEcnpqMVRkR2dGMnpCZlB5RzBld3BsV0JQNFVLVSt5dzN2ZzlQ?=
 =?utf-8?B?cmhvYThDaTZjWjVqL3VMcmU4SUJ6SURNM1E2RDlLRnlRNmRpbFRYR0dUN044?=
 =?utf-8?B?Sk9QUHk3eDh1eXNCZlNiYzBOYzR0VmpvdS85d0JROEZUalFZYlk4THVXZlBH?=
 =?utf-8?B?Vi9jMXFXUzZmTUxQMTNWcXBmUnFEL1FNRlBnUStzenJMa1Z2NlJKbkNYTDYr?=
 =?utf-8?B?NkIwbmQrSkl4cFlyT05nU2Y1RVdiMVdHSWV1VnJHQU9TYnNBa1BKTzFmK0xr?=
 =?utf-8?B?Rk02QkZMeW9xZWFNVXVTOStWdllCVndZdDJaenZTaysrMWtEYzdSV2tvUllt?=
 =?utf-8?B?eklFRFFpYnFqOUMxLys4VVlPSXY0Y1E1VVBXV3RTblN0RTM4blArR2kwVEUx?=
 =?utf-8?B?VTRmR1BoZThiKzlwNzJ4ZGhQUFRwUEQvWXZMME1UKzloT3cvYmpPVkZsY2hl?=
 =?utf-8?B?cjNnbW52dDJmZmNmSWx5VHEwdHFvQ1UxYWFiR2FHd1RkZHd4ZUpUamtYbU9l?=
 =?utf-8?B?MzRvUXlHK0hmSXpVZ2FQRnQ4MmIxQisyOUozRC9INno2OXFJU20wOXFzZ0Fp?=
 =?utf-8?B?U1hZcC9mOThWRFNPK0N6a1loK3ZFMVBOc0ZmMXZnaDNkemRUeExVTFE1bEJY?=
 =?utf-8?B?SUFFY2ZnT3FCYjhnRDNVS2t1U0NwNVU2K0YvZ0owZVcyMGpuMU1ZZzQ3RTNL?=
 =?utf-8?B?TEdjQ0xuUWZkZkM0TTUyNld5b2FaN0htUGZjMUpyUUJiL282NDhDbHl0Q3Rh?=
 =?utf-8?B?MXQ0SHdyS2lvLzBmeDdWT0N3d3JUeDVxRHBVRjhVeGRVZGlEQjN0eWg4VW5r?=
 =?utf-8?B?cWNGOHlheGFiY3J5TE9lb3lOL3d6Rm9JWDJzYXlCNjZ1UG9yYVBKS2ZtRE83?=
 =?utf-8?B?WDhlSlM2bWJUUTVUbGdkRVBKWjFsOHJMOExkL0txdDFQUVlCUmxsbDRJd2Fy?=
 =?utf-8?B?VW5hL290ajNYS0Q2UzdETTFNUFNBWDdkYW0vcVV6alU5ajZXRzlvYktubFZr?=
 =?utf-8?B?aCtaQ0pubTJQdTd4LzduamwrMG95ZkJQRmNDaUpTWDdxbEkwaWZRREdjeFd6?=
 =?utf-8?B?eDQraW9BUkErQVRPckI0Ung0aWhPTGhxdFZnWlF5aFNDT2IrdVI0b0wrTXha?=
 =?utf-8?B?Z1kvNVFBaDRQTlV2MGt4RHJ2RGxBUnJhTDBWUzg3aDl0QUJ2dXBNY0tkbVow?=
 =?utf-8?B?UVhVYUpaMlcrOG1jVi82K2NYVFlqOFd1MjEwOWdsVTBZak5FcWVhSitUMjJa?=
 =?utf-8?B?SzhlNEZnZHpSOWtlOW1QeHR0R2wzNFRkTCtCQ001UkU0eE9Eb3BZemdRWUlO?=
 =?utf-8?B?dkRMZzVRSWZNYVJJRW1xU3YwSHNRb3EvRGRLb0IvL0QwazdhcW9UOXUvdEwx?=
 =?utf-8?B?MmJYM20waVEzSlhPSkhkVFNRY3Y3SVRZZjFES3FjRnhaUVlPQXlZTERzOXNE?=
 =?utf-8?B?MjNGRVZNWm16UlB1RFo1ODVuR3RhaG9rN3J6eGFMUFBud2oyWVNjMXAxSHhk?=
 =?utf-8?B?NTV1Vmo0dGJrcWxvWC93NXVNODY0SHFEcUh1RklaMEpGYUJoUG5BSzNZNjJs?=
 =?utf-8?B?akQwYkFoVHZCdERuL1NVdUxZTnhMd05sYWNHRGE2ZDg4UmZrdTErRHMxcGNh?=
 =?utf-8?B?WGJ4cGhqUXh1UEkrcGR5Z29FNDhQZm0yTUxwYWhJTTdLS0ZFWVRTcENjVjBt?=
 =?utf-8?B?Z1RpbGlnN1Qrb3F1bXFUY1hVRGJmMGZzOFBlc3NYVnpBOEw2WkJ3aUJieW5Z?=
 =?utf-8?B?d0oyRktMWHkrT1hZNTBBaDNUT0ovNjRNRlRXcUZFdWw2am1GdWFrcnJIdlJK?=
 =?utf-8?B?SS8wdEkvTlEvaFoyWFZCSXhHR1ROTGZTK1dhcGMrVnJCUU1HUGNGeFE1Z3BR?=
 =?utf-8?B?dXJJNjRtRnpMcS9xcWpyaTFNblA1by9keHBBUEY4WDNTM2l1U2lWeE9UYTlt?=
 =?utf-8?B?RXVTZlBlb2tESDRZTDR5V3lLa00yeDMwOW1zTHB3Z20yMDZzVGlEdXhkTFBG?=
 =?utf-8?B?eUNhY2M0aFJ2clMrMy9NdUQ2dVVlY3NYTVcyb0JlTUtCSi9GZFVHeW9BeVk4?=
 =?utf-8?B?L1VJbVQ0SEc5WktvVUJLcVNmQ2g5SWoxNEtRVHBUdjRNay9qeDZwYmg3RWJZ?=
 =?utf-8?Q?hnwsIrLvkl8GF3OHyVuKhKvrTFkW1h3CjU3Pv?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa07242-4ba9-4a4f-a11e-08de5e79561f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:27:16.3919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ayc8VGtv2LJb+m//ydYWP9h6UoC04E9CyCdH0pJHkhFIC/3lgedr3rKwHtsyVxmza+JjRsLHQA993SMguYVO12eFM2lXYx4OMiQbWJfjhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11838
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:27:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8773

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard wrote:
> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

