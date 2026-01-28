Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F047D3F069
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:10:43 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14100.1769609440613879256
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=j3lAmVVj;
 spf=pass (domain: cherry.de, ip: 52.101.72.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsaQT7HtexoJY2fcT29NvlO7pBjaH+kJrZL5ElMSM3s+3xkGGzur+UPOEnItWsAV5TS78Lvmv1rnsgWKZwJttaTXBBRQV5KiK9sk1Wj4+cTVPGcHpcW9w3fz/HGVkzzF7PLOvKHeELLoC/hSmuYdeYpK28cBh6e3k6sD+fyXiephCzhObivELOPvouQFJoVf6fAb6vzR+xr4NO0v6RGuw+1Hew23OF4qe35l8h+p+Xkf7j86W/Y/tP3oO+3Au1ddjnr8mtTh++NnS1UEkPluHwImO9rmUjQnAuGHOxRxaEHw3HPT2tqb0GKMSLbesyiouq+kHEQH3wV7AcHlbRKjWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eJN5PnFhYF5QeOgv8vPO/zd4mHWEfABoCGEEP3Y8O0=;
 b=ptEL0F44hpjMU/UNgOso35ZYi17GJOXEAZfjZuWFDdH/ZDmgCsIh5lvq9tWMOLnwhSsV7hlNAlKqXfTLwKZ7jYYV+dpdSx210vTLiWUvEmn+QyLB3sj6YCCOMfN/Vs9Rd+wGy8BXREAwGs7fl4aAa6/m/CSpnVBX5SDK5N8O1arkG4UxkFQeAkTRm+Q2FJQUMNjUrtQRTHkNeCa+NFusMk6h5W9znhsZS4LoSmbbQ8TvQb1Nk1wTKEG40qg/hM+eXG3Sj1JpQvQzPYDr7xqjGiX7ohXTqBB4L6Nsz/o3x6Voo0gWkDAJw5k1zBWYjeBF4Y3Q7o0/Cxsd84M7ARpJyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eJN5PnFhYF5QeOgv8vPO/zd4mHWEfABoCGEEP3Y8O0=;
 b=j3lAmVVjv0VSiuxiq3dc+EFUB5UqdugCxH63J4B5/22UGu9Is9d++6ADWtNv9sjgeBlnBd5kmSqVLp7F9N0+Ls36buSSZqgH2uKkVbW9TJVxiB1df3jYMUFpR+3+Gk+BXGamDtySv94Y+3igN2jRehtWwKj6c6t1ni94MpnaX+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 14:10:35 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:10:35 +0000
Message-ID: <fb33d2af-0949-4358-b0b9-a94b9297d2c1@cherry.de>
Date: Wed, 28 Jan 2026 15:09:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 44/56] dev-manual/upgrading-recipes.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-44-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-44-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: e4502526-feb1-4250-cf33-08de5e770198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z01TanFnWnI3R3pJYi9odE9CV3E3aGJZQjl5N1pyV2JIUVFSMFYyZk1YRFZx?=
 =?utf-8?B?VHlrNkZleXN2Vm9wU0NGZUFSQy9tV2k5TG5VcDlwV1pLMnRxUjFHK3EzVWp6?=
 =?utf-8?B?MDE5amRNdmV2VFB0V3p3Rm11NmJPTXd1OHAxbXFsQ2ZJTGszaGtxN3V3TVF6?=
 =?utf-8?B?SkNjR2ZXYnU0QkFONDV4UmwzVUtVRGpZN0VYblRIRUNQUjZIbTJKRDUrcldB?=
 =?utf-8?B?bkYwU3JKRUNZNHFORExUZUdRWndxU05xaTBBQXhySTUwcmxaTVo2RENJdVoz?=
 =?utf-8?B?WHovZ3BQNWkreUZnaUs1MTVhdkFXQ1p5Sk1qVWFEcGJTdXFoSW51TCtIWWNH?=
 =?utf-8?B?T0ZqMGEvZUV6S1RxZEtIbW5DbVVkamtEUnlDcW5HNXVrMm9mc2tjZ1ZYWmRz?=
 =?utf-8?B?QzF1RmxBWTJabVRRTXNnOXpFOHlGNmVUZU1hUEU5ZW93ZkM3UUpFYVZlL1dT?=
 =?utf-8?B?UXI0ZldhOWh6d2syY3lIVHhjTzdjV2NGam1xUFlxUm5vTVYwVHR2Q2R6ZlA1?=
 =?utf-8?B?b2lDMHdDYm14a1FCczBBRlY0cTk0L3pRZEJWdEorK3RydXJDRTF5NEtKbW1u?=
 =?utf-8?B?bG4vTmFpcWliU3A3dFRQS3V3ZFJDaS9EUmVPS2ZXOS9vZWtadG1pdGFnNm9j?=
 =?utf-8?B?eWJwQnRNZmJNb1hSVU1lVHN6MUJXSkkxSHpsZWE4M0RUczUwZzFKUWd6WHRL?=
 =?utf-8?B?MllHeGhYSnNpZHNyREZjNWJCUHpDYUVNeHBIZmNFUGk2eGltK2JzUmFoekxm?=
 =?utf-8?B?alFOQnUzcGNwM1VBcytpVXBTNG9LQkRXSUdsUk5vdFZGNDBoWW9PbFBLSncy?=
 =?utf-8?B?S1JqVTE4ZmlocDRYUUJhVW5mTzlZN1RQc0hTcHVSNXhGYUVUYWRmenltSWta?=
 =?utf-8?B?cWlDdHRGSmhZQ0lVQmduaFUwQmdXd3IraUQwRjVnTmdzeWw0Mk1OYzh5ZHVW?=
 =?utf-8?B?aXhiQ1I3N1FyTzBmeXI4WVAvWmcxSHBUWjNwNm92WEREUnlqRzBISlpwSFVK?=
 =?utf-8?B?Z0phSEhIMGZ6eDdVUXNUSEJqNU1XMTRTWkE0M3lNQmUwOENLbEdvQThtMkhh?=
 =?utf-8?B?VEtkVEJmSXdIdnlnUHhhYlp4aWs2dllwTDd0UFhYK085ZzFqT3kxeGt6Zzd6?=
 =?utf-8?B?V0x5M2N2djYvUSt0SzFqOUU2QXVSUC84S2plaWdyaUVUN2hqdk51N0t6aUpJ?=
 =?utf-8?B?cTF0T1plWGloclBNTzNQTTFMYWJ4cmtJVDk5ckN6enYwcFFwVVV2VG50NGxT?=
 =?utf-8?B?Z2JQazZiNDdLL0l4TEZBNFB0aDMxdWlzeWlMaFVKbTVLQVRCeTBDc20xWWFz?=
 =?utf-8?B?UEhFanpJYjdGMEtVTWZLbk9RWFJjNTZQVHFXSGhpcEVjY2RuaEFtSjFLa2xW?=
 =?utf-8?B?em55cUo4TkQ5d2dVVU1aWVlhRzNnYlhLSDRBbDU5MHV6bm1ETkl3RmRNb2hv?=
 =?utf-8?B?SXJ4U0M5MzBMdHZwRFNIZ3ZuRkQ2QmtoSVBwT0RodkcwWTdLQWZMdnFod3ZE?=
 =?utf-8?B?cDhhTE5xVXNJK0oxWFFMbEhqMXdZdFBOTE9uclJYVlFUUE9wS2g4dE0yV3Ir?=
 =?utf-8?B?aU95ZWtobWVpcGZVd2xNNVhuYVZIU240TEVSSzkySGZqTkcwck1MMWZzNkEw?=
 =?utf-8?B?MDRVOXBUSnB5YThmSVlBeFhVbS9kRUhSSXBsYnUvMS94OFl2RjBLNC9xQThS?=
 =?utf-8?B?Z05HZmNwVlhyQVloWk9NK29PeDczRndEOUNIa21rck5PUVdOdGRJQ1lqNGp0?=
 =?utf-8?B?bncyUHlVRWFEdXBTNU40Y1BXY0VtTHdGMlI4T1ZKN20zUW1vekZ4cGxXYXc3?=
 =?utf-8?B?a3UvVktyemVrMkdYQUVSODYzVkhnbnRkUktXYTlqZjg1WVlqaUpQRmRHSkw4?=
 =?utf-8?B?ZGJFeGJZQUg4RE1KZEpjR0Y0T1FwY291K1NJWXlLVzdIUFh3MjlmRzlZZ1F0?=
 =?utf-8?B?ZUJRZ3ZzdTd3aGJNYmFFMytCeCsvcEhZWlh4alVwdmxxYkttU2xhVzBiVTFr?=
 =?utf-8?B?TWU2K0puQjYrNDYwRmNIbWRLNk5SRnhFSTRoMlVsSmF6aXZKV0duZCtkOGVm?=
 =?utf-8?B?VjdWNjRmbnJkRVF0VkJJRnZ0RFVnM1o2bm9qWVNIYWwxelpTZDlTODdtL2Zj?=
 =?utf-8?Q?f3vo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djE5NzZGejRuWlNjQkl5YWdTQndidFl4ODlTR0JSVWFCaktDdGlocSt2VVlo?=
 =?utf-8?B?Y1hrQ2RQT1hLTUdBSWYzVGxIbGlManBxUEh2YnFZb21RUDlsTFk2YU0yVmt2?=
 =?utf-8?B?S1ovZWozVkFJK2MvWVBsM20vSjRxTjdJeVMxTTYrZnR4azJybG1LR0o3MktN?=
 =?utf-8?B?eGFtalRtaXpJZ3dHNythcXU1ZlBTdlFmTWMxKzBrLzk3VzFGaThMZno2SkN6?=
 =?utf-8?B?cVZGbEh1cnE0T1ltYjkrb0ZoZjFYTmQ0MjZVYUtJYVRsc2kzQURqTnhSMmVW?=
 =?utf-8?B?V1Vlci83ODV6MHhtQ1BUTHl3RzJmQy90T01LR2FweDBMQTdUSnNXVXpQUHAw?=
 =?utf-8?B?c2xmMjBUYmNlZWw1c2RoUFI0aHFaNkdzbEsvZkxTcjhIMExPa2YxZW41S3M3?=
 =?utf-8?B?S0pJVHVzcTJLaUNiSFRlaHB3ZUJxZURWbU1FWXJXempwYnFaQ2pEMHB2STUv?=
 =?utf-8?B?K0lxNG1kanNzUktuOWoxNklRaGtFdkZnZEpKZnZrUGVmOUdod2hEa0F3R2hw?=
 =?utf-8?B?SHB4WGNCSGw4bDVndm52ZmRBR2FUa2tVTzcyT1JrbkUremJEY2RJK2ZrWmxH?=
 =?utf-8?B?d05RQUt0RzYvYXh6VjBNYnhBZ3c2ekcvTU9xa2JReE9sbHU3Y0Vva3BSMUlj?=
 =?utf-8?B?VUlUWHVyZW8xWnlycEpvQk5ueThQNVBYRmQ3SGlOT3Bnb0xRKzFDQldoS3JK?=
 =?utf-8?B?WEtZb2tIL2U1RTM3akVodjVqU1UvbHM5bDFySHdXUDNHRnBLWlA4ekJFTmE0?=
 =?utf-8?B?QWYyeVkvSWxUZGF4aWcwWXJ1UFVsc3ZOTzdIcytrN2ZBYWJ5TURuOGVVMUVE?=
 =?utf-8?B?UWoxU0ZrZ05kRFJONnBod3NoamNaWWFBQ3d6RkVKNXJPRk5DOWNoMlIvUkpH?=
 =?utf-8?B?L3EwRFl5Sm5OZ05IS0dYSlMxTHpTeEN2NS9VZENmTmpCbzZnWVZVVGhQcHUx?=
 =?utf-8?B?ZUhrRGFRTTNJS0w0ZXEwVVVQUitOVlVKNmowZzUzUzVqcFRWdXo4R1RQMlFt?=
 =?utf-8?B?anY1UVljeStFSEE5RVZibTFUcnVGcEhqNlhuUU94RFc4WDd4QkVBWHU5UjdP?=
 =?utf-8?B?TlgyM3crN0ZoTmpURXdvcjR0d3VmVzByYzhiY0hCTTdTVk1leUgvYTdjbEp6?=
 =?utf-8?B?TGsxaE1RLzV0VlFMMHRhaFJmek4yb2F6QytLYXRnemxyZ29Uem5kWERMMDJu?=
 =?utf-8?B?bGc1SVloczZVc0lIeVJwM3g0L3B2YVAzUHFRV2oxL3cySHgvaU4xZDVScUFQ?=
 =?utf-8?B?SXdJQzA3eGF4KzNZSy9nWlZXS3NJVXN3bE53K2hQeTVIR2o2ZUNtYm1Pbkpz?=
 =?utf-8?B?WHFEZCsrN3hSVXBGL0dQSEZTVm90Q01qQWNKRVpkTERnM1pJSngzNmZxbzVl?=
 =?utf-8?B?ZmxwUFVSMUl0Z3dIWXV3bHI3R2owc1c5Zyt1aFROa3BOZjV1c0VCU3NBTXFE?=
 =?utf-8?B?LzM3dTR2WVZRMnl5WFd5NG8xVnk0am9BVGdORXRjMmVrRlpzRHo0dUoyYkla?=
 =?utf-8?B?UmhYMTM2VWRCb01QTlhvRjc3ak9NbFNDSCtjclBseTV1ZldzWGV0L2NXS2pC?=
 =?utf-8?B?YnN1V1ZVZ1FKaVkraHFPV0xYa2JVVmZQU0k1czE2ZFBoWWc4ZjZDQktSTXdB?=
 =?utf-8?B?aFR4ZzBIb3BlSzBienJnVWFCQnVhZmI3akdpOEpaQ0dxRjJLTzZBb2srU3BH?=
 =?utf-8?B?YThMUlVBNEV5STB0QVhIT0VqRFRJWmpKZmsyT1B6djFGNmdZZXUxS1RzSXlt?=
 =?utf-8?B?eWpMZ0R0eWE3VUU4ZTNIVVRURW1GRVpNSXpUL3owMDdhdG9hSmN3MU9lYlhi?=
 =?utf-8?B?QVlFYWRBcUV0STBVbVd0V0YzQmVVREEyajMxK0FENkppeUdVZTRwRitFeXZT?=
 =?utf-8?B?VjV3RzMvQTdPZTlpbXoxTVlScktXdVN3Z3MvRVB4NzRDSUlnQ0haWVhiREwx?=
 =?utf-8?B?OGpVcC9qcGNmR0RsUVN2dG52V2ZocHdEUy9DbnhFRDMrT2FkWWtlamhpU0Ew?=
 =?utf-8?B?djdORVk4cXc5bTExbVJlYWNLcGxJTmdPYW02ZXBjYTQ2MXhhbnRqTHlBMVJE?=
 =?utf-8?B?WXp2QW5idFplbkdSSXd0cjh4aFVHTS8wMFBvdXVTMG1TUncvT2tMWWhMdEJ1?=
 =?utf-8?B?RW5odnZ6R3U3Qyt6aWREWFJ0SFF2ZjN3WHEwSXN6aFYrc2dHWDF2dlFPa05G?=
 =?utf-8?B?SEhJN0d0ZWw1S3ZlYUFKVmJlcG5wUllNNmtaU1FJcXVrQUs2OU04a045dEhX?=
 =?utf-8?B?ZmhEa2dVdEZ4elFDRytPdEpsa2xwYVc4Qy9OUVVmL1FiVUV2U0VLQ3BpSWwr?=
 =?utf-8?B?STQyOWFna2E3bHc5Sk5PMzVpa1d6d25INDhVa2o4aklYZWVrZExyMEh0c3BD?=
 =?utf-8?Q?/KiACzTuzl9egYNbRj3ip8Jye97rau1PrEa/j?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e4502526-feb1-4250-cf33-08de5e770198
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:10:35.6193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6w268Pn0jrgE5OkT54X20+kwXahPYGUsCS3qVoqNmb2pptGhM2BHQuCSgizcjss4qH/WajmkrcqxdAQIYZbMkA1ijrrXSwp4OgrkDG90lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:10:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8769

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/upgrading-recipes.rst | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
> index 2e6567867..c4199d160 100644
> --- a/documentation/dev-manual/upgrading-recipes.rst
> +++ b/documentation/dev-manual/upgrading-recipes.rst
> @@ -84,12 +84,12 @@ The following steps describe how to set up the AUH utility:
>      AUH is not part of the :term:`OpenEmbedded-Core (OE-Core)` or
>      :term:`Poky` repositories.
>   
> -#. *Create a Dedicated Build Directory:* Run the :ref:`structure-core-script`
> +#. *Create a Dedicated Build Directory:* Create a new :term:`bitbake:Setup` with
> +   ``bitbake-setup`` or manually run the :ref:`structure-core-script`
>      script to create a fresh :term:`Build Directory` that you use exclusively
>      for running the AUH utility::
>   
> -      $ cd poky
> -      $ source oe-init-build-env your_AUH_build_directory
> +      $ source layers/openembedded-core/oe-init-build-env your_AUH_build_directory
>   
>      Re-using an existing :term:`Build Directory` and its configurations is not
>      recommended as existing settings could cause AUH to fail or behave
> @@ -121,7 +121,7 @@ The following steps describe how to set up the AUH utility:
>   
>         .. note::
>   
> -         If your distro does not enable by default ptest, which Poky
> +         If your distro does not enable by default ptest, which :term:`Poky`
>            does, you need the following in your ``local.conf`` file::
>   
>                    DISTRO_FEATURES:append = " ptest"
> @@ -143,7 +143,7 @@ The following steps describe how to set up the AUH utility:
>      described earlier, you must enable it in ``upgrade-helper.conf``.
>   
>      Also, if you are using the default ``maintainers.inc`` file supplied
> -   with Poky and located in ``meta-yocto`` and you do not set a
> +   in :term:`OpenEmbedded-Core (OE-Core)` and you do not set a
>      "maintainers_whitelist" or "global_maintainer_override" in the
>      ``upgrade-helper.conf`` configuration, and you specify "-e all" on
>      the AUH command-line, the utility automatically sends out emails to
> @@ -263,7 +263,7 @@ directory automatically upgrades the recipe for you::
>   
>      $ devtool upgrade nano -V 2.9.3
>      NOTE: Starting bitbake server...
> -   NOTE: Creating workspace layer in /home/scottrif/poky/build/workspace
> +   NOTE: Creating workspace layer in /home/scottrif/bitbake-builds/build/workspace
>      Parsing recipes: 100% |##########################################| Time: 0:00:46
>      Parsing of 1431 .bb files complete (0 cached, 1431 parsed). 2040 targets, 56 skipped, 0 masked, 0 errors.
>      NOTE: Extracting current version source...
> @@ -275,8 +275,8 @@ directory automatically upgrades the recipe for you::
>      NOTE: Executing RunQueue Tasks
>      NOTE: Tasks Summary: Attempted 74 tasks of which 72 didn't need to be rerun and all succeeded.
>      Adding changed files: 100% |#####################################| Time: 0:00:00
> -   NOTE: Upgraded source extracted to /home/scottrif/poky/build/workspace/sources/nano
> -   NOTE: New recipe is /home/scottrif/poky/build/workspace/recipes/nano/nano_2.9.3.bb
> +   NOTE: Upgraded source extracted to /home/scottrif/bitbake-builds/build/workspace/sources/nano
> +   NOTE: New recipe is /home/scottrif/bitbake-builds/build/workspace/recipes/nano/nano_2.9.3.bb
>   
>   .. note::
>   
> @@ -298,7 +298,7 @@ newly upgraded recipe::
>             .
>      NOTE: Executing SetScene Tasks
>      NOTE: Executing RunQueue Tasks
> -   NOTE: nano: compiling from external source tree /home/scottrif/poky/build/workspace/sources/nano
> +   NOTE: nano: compiling from external source tree /home/scottrif/bitbake-builds/build/workspace/sources/nano
>      NOTE: Tasks Summary: Attempted 520 tasks of which 304 didn't need to be rerun and all succeeded.
>   
>   Within the ``devtool upgrade`` workflow, you can
> @@ -320,8 +320,8 @@ directory::
>      NOTE: Adding new patch 0001-nano.bb-Stuff-I-changed-when-upgrading-nano.bb.patch
>      NOTE: Updating recipe nano_2.9.3.bb
>      NOTE: Removing file /home/scottrif/meta-openembedded/meta-oe/recipes-support/nano/nano_2.7.4.bb

We should probably update the meta-oe layer addition to follow the new 
layout (/home/scottrif/bitbake-builds/layers/).

Can be done in a separate patch/series though, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

