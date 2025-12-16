Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61373D5CC95
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:33:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18625.1765877592054639922
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 01:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XEgCEbj8;
 spf=pass (domain: cherry.de, ip: 52.101.84.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJdtX9yQKL+tnn1ugF02hmT7AykmPZw0A0EGlW/rLV0tQcL3D4l8h24oAE8j5MIFoc9ha7XvC4ZSE7OK4CYc7zdcvWvfq3WAAPZd7qBqq/DYDRDhadq5rSpClSm8jnRQieKhT/HSgHGXQt6gDJRKMHMFB6VADdirsnsigX47LtrRGFDKPeYGLzLpmLF7AVbqKC1xZVsZM2Y7EmcgMm9XEHTG0X0pN6vGDPPgZ4pjjq4qN5Jpfd2OIXSFwSqfgYzDaHkwzC/xHXPwizaiB+haBtFSr6hKWMROG0J95OIiYrOjHguDAdIDwWjTpFSAdKODKHoGBtRsEEKEbayoK0ekyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZIMHwtno/LRnoCKX7ZlUr4WjN2fosk+PB3Ee0QudmM=;
 b=BbkzImUexnli51zoB5zBgdU/H6Q6+ris0gtUElVxWoD2Uw9whpElJ0xYBLVMML8N2oguY/LFdnSm/V1bIJyw224YiGswFrN1zX4/qhTdfuiQ/gwU5QCgJ1uMRfocgYpwNStRsYMu6+erRfIQWcI1Pu73RqqcW43pAEgkVpePYJ6IOF2I1vlMiqlJ9ag57y8uywYV+FkqfsWtRnXl58Az0SSrEt+F9OetQdg2TR+9+t44Sc2EYJJGNYtP4Jf2BESpk9f6jbZ+OaqvFzQtlJAm8K9uOVX5C0cBU6dX6gRkWMFpZr4e4qZSExYfU13/ttPWyGxicrFHloyaKN2lU2+QGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZIMHwtno/LRnoCKX7ZlUr4WjN2fosk+PB3Ee0QudmM=;
 b=XEgCEbj83W1quvl+2RLlKAAh8nYHW2RbbPJAY7R4FqMM8ZeSP3biRMy91dUSC5BMnOY4Hqr7gxQudBpqxmPAqS6qecdYSLMI3aWUzwO7oiJ5ObskGeIgmQu+X2XwCevF7dYBr+FM5CCjdbgGNsD2VZA6tUgDKRJN4i3vvLa5lTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8376.eurprd04.prod.outlook.com (2603:10a6:102:1bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:33:06 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:33:06 +0000
Message-ID: <dc3f345e-ad6f-435b-b0bb-98c07e1a9b7f@cherry.de>
Date: Tue, 16 Dec 2025 10:33:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] is it time for a separate YP doc focusing on
 security/vulnerabilities/CVEs, etc?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <2d09b577-b67c-74cf-658e-8b82f29ad17d@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <2d09b577-b67c-74cf-658e-8b82f29ad17d@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: aee6202d-b7d5-410b-6207-08de3c861e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TysyejF6ZGl2Rlc0SVJWNktpV2ZMa2diTjg0K3JmbjAvanZkR2VIVjNqS01s?=
 =?utf-8?B?UW5sdnYxR3ZYSXN6TGFyNlZEakNWcHFLRm9uQ0NCa2d3d1JlMzgxZzl5bEhX?=
 =?utf-8?B?MS8za0kwd0dQWTg5cGc4YU1saEloTXExRmdjTHo2eHFZNlU0dkt4ZGZsSzdH?=
 =?utf-8?B?dGNobzEyM0FzTDg3SFI0Qmc0Rk5FQmoxcmp5YUt1OEdKM3IwZFZJRzNKaTBy?=
 =?utf-8?B?dWhJTTNMc1haclB6bzhPL3JxVUEwbkxxRCtvWWlBanljYUxjcFlKdTd0WUZW?=
 =?utf-8?B?THhKTFZRM2F0d2V4dldZY3E2a3RzOEV0amZnZjZQbnRMV2dDK3oya05tTHZr?=
 =?utf-8?B?YjRRNzZsWXBwK2xaSDlZeUQ4NUpUQ1hiL3Eva1ppTGJCTUtMTHp6czNMMjRL?=
 =?utf-8?B?eUxlcFE3dzB3ejVHZFRhL3lJeU9ZRmpJUklQY1o2VWg2QndvK2JHTm5pelhY?=
 =?utf-8?B?eFZhK1czMkxiM3hvc2xDM3A2RWg3RXBpdzIrZWh4N1duRUVyY0k4WkpmTHVj?=
 =?utf-8?B?eHlNdEFORlZjOTVDTWh3RnpaSGxjTnBQREZNVys1UzdBbFBPVVZTNWxaaEx2?=
 =?utf-8?B?NmhSMjlJd1d6c1pURTVydjN4Q3VhNFJteGVwam10dHB5cUo1RW1ZRU1LR0ZN?=
 =?utf-8?B?UnBxNzNnUlRDT3NOWkxOZWw0andwUW8rODRlZ2NyT2cxL09Fem1XdUhCYkdE?=
 =?utf-8?B?eW1WRkltZmpJaXZVb0tQbGNheWdkV0VEblNnMDdDVy9vMjU0Y1FMMzJndzlH?=
 =?utf-8?B?NDVFeExVTVB2a0ZKOGI0UVYvbUp6dmZLUGhxdTQxdVVyNGE5LzhPTWpDRzZk?=
 =?utf-8?B?ZTkrNGdKZkl3dzJDZ3d4aXVoQVgzS2xvZWpmV3BiMkpTTlBTa0t1SVNoU0ps?=
 =?utf-8?B?YTcxSEt3Unk2UUQvKzlsbGdjdXhhR29TeDdmUHpoMzlkeHltdWFnTGp6RnZ3?=
 =?utf-8?B?d1hBSDdjeUhSR2d2K1F2amxORVZ6S3NIQ3U1cUgzN2RKeFNKOEJuVU5ESWZU?=
 =?utf-8?B?eXFsNUZ2SDJlMitlTTkrcUtvM2M4aTdTVThEK3RhUExrcytZOHowbWdBei80?=
 =?utf-8?B?aHNmdm5xNWVJVDcwQkRQVmhvc2NQdlZDeXFFVUxXZkJseUJCYVNBczgzWXdC?=
 =?utf-8?B?c0FhSjcreWo2UHJJaDlZVmNTK3ArZnpLUmpOT1YvYVNFMGV4alN1dHBVR1pw?=
 =?utf-8?B?RmVsamdudUpoOXVESmVwYmpWTGxzSHRkM3NVUnk1UzlBSzZxUVl5LzVUUTNr?=
 =?utf-8?B?dEpMZDA2clFRWFc1RFM5dzIzemZRMUR1dTBJSnVRYmRwY05GVnVZS0JTakFv?=
 =?utf-8?B?MXZ6VTJFdVVQMFRteE1CZTVsbWlhN2k3UkpBeERJd2NKVWhVTWd6bEtub0M1?=
 =?utf-8?B?OUtHWmJaOVZ3KytzMmR0T2tWMHVJSW40RjFpai9TY1RlcDZqa2w5ZVVJN2VH?=
 =?utf-8?B?OUdmVXJ6cm5QK3NSN2ZzMDlJVEFYRmRWZmZzd2JzRmpDZ2VWRTlJd0F4L1lS?=
 =?utf-8?B?RWdlUmdnTzFZRmZkdEswYmsycVdrY0dqQUlFTEVNY2xEcHBGY2k1M3cwcndW?=
 =?utf-8?B?NjJsVVZQVy9FUzB2N2lTRERqTXFqTmZsZXd5RktITFZudmpWUm5TRm1GbE0r?=
 =?utf-8?B?QjBaWE42V0FlTFMyZXpMTUZZWHMwVk9yb29aOXUwbGJyRitCSUV4ZFBJWUNU?=
 =?utf-8?B?S3h0RXdlU3RpU2pRUDNXQWNCQXNvWjh2MTR4WFh2Tzk4ZWkyZU55aEY4TGhh?=
 =?utf-8?B?VFFRbFlaVDJnRXBPdzhUeWhVM09TUldyRFpYZDZWT3JLek1Bd0VEMXV3U1pL?=
 =?utf-8?B?N2FxQTk2anEzK1c4dGdGTW5iMXVhdUlVVlJTMVY0RjJmYTAxcDR3blhpWlFp?=
 =?utf-8?B?RCtLUjRBeU5Sc0JkZ05TcHJ6RGlvZG5HaEs3bnpxUjJaRHo2MjI5a0s1R0Fj?=
 =?utf-8?Q?mTziSCnyRxi11AFQ2UUhwe63u/wZNmqY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WldYRjlXMU1yd1BjelNDV0ZXeDI5V3B3YXp3OEhKcUF2empVb1BKdVhGSmJh?=
 =?utf-8?B?T1h4dUdsTnhQai9nUXQxa1M3VVM5M2ZtTGhSQjdDc0cyR1Z6VEVDdU8zcWV4?=
 =?utf-8?B?bmV0RmdwY0F2dzlSL25lV0RPNDB4ZzNBOGRDZzE5aENZZ1cvcndXOUhVNjVu?=
 =?utf-8?B?RFFLMnBsTy9STHVoNC9TRHdmZmNtVHRPaVJYVWQ4UTRETWVVc2JPTy9IM3ZO?=
 =?utf-8?B?YkduZVlyYWt5Vnc0Q0JDNkdyazBWT2VzcHo5NW01UlNIWUdrVGE3TXIxenJT?=
 =?utf-8?B?RDRJNi9Ub3dmT256M3dDYUJZbXlyZ0xpNjYwZHNWak45Wk12MkJjd3IxQmkw?=
 =?utf-8?B?OU42NFE1TjIzWFZwR3RvZFJuQnRaZ1M1TlN1enBUb2hpazZJUWJLeFhycU5Z?=
 =?utf-8?B?OXNOc3N4ZHAvWWhaeVI1SFVMU2lJbFVFUTJyYSs2eTFJRldtVXlRYm1tSEhE?=
 =?utf-8?B?azNOU3pPYlBNUTFKWTUwQkd6clRlUlJnMjFXU2cwcW9pZE5aZ3VocUtFYTd6?=
 =?utf-8?B?cmVLWWhCKzBBSDB4em5yaEkvQjU1ZlFvNzVKTWwrSDZaS0pVdkRuczhRY1ZQ?=
 =?utf-8?B?RXpvQll4cklsdkZpQUQ1SkZrNGc4bElqN1d3aW92WWNzSDZIempHTWhaK0tR?=
 =?utf-8?B?Qlh5dmJzSTdCV1ZBNXBXOTBoc05TWWxuWTh3RnIzMndrUGNDMEE3WUNBRlhL?=
 =?utf-8?B?TmxPcmZjaGpUcnhmdVZRUkk3RVF5VE8zZGRXY1BKNzRyTnMvZ3VnTW1RWjhx?=
 =?utf-8?B?QzFMSWtIWml0YTBXTWNjNjEvMTc0aFlhQ2NUOUVTejBVMHN5K0IySWpsS2VE?=
 =?utf-8?B?S296R0Y3NGxlbXRKaG82MCtENDlrSHM4NEVPVjlKcjhvbmRCRWxLSXdjVUtG?=
 =?utf-8?B?K0J6dHFNOFBkcWtRaEhESFRqQkZwcGVaRzdUcEdkeXdTMkF1UmdwZHd1WFZi?=
 =?utf-8?B?ZGtLa2c1TUQ0Tnh4aVZ6QWFvNWoxSnVodkJyY3NoWklFa0N5b2E2YzFkUGhx?=
 =?utf-8?B?Wk0xOGlPNlllVTdLSWFLcCtLR2dVZTVEZ1pNMHcwU1hkeDdDQlNVTm9FSERK?=
 =?utf-8?B?NGRhcGIvUDF2bERUVTVMWmtCM1A5SWxabkIwMXF5SkFVSVQ1TEpoZEtoZi9u?=
 =?utf-8?B?V3hTZHZrS2F1NTlDbW1zS1VVU0hRMFltYWRHdUh5WHk5TjJqM1dtYUsxWUtm?=
 =?utf-8?B?bkVWU1MvRUorQWtzSlhkVFJOODdWb2RvNndYUTJ5SHpVOXNqdi9KWDJCUStj?=
 =?utf-8?B?Z2p0SFNGSW1YTmRta0ZEQkxSRnVHc240VDZhcXV5OXEreVFLL1Q3LzBtZ085?=
 =?utf-8?B?Z2FHMU1EajdqZ2g2THpTbFNabGRETktnZWdiZVVybTJSOU9OS2xLdzlXd21O?=
 =?utf-8?B?ZzNmWXBZVzRqSG03dTE1U0RrczN3WjJOZDEwZk14L0xLK1ptdDFiUFJKZFh3?=
 =?utf-8?B?VFljMFdxQmZNbFpSaHZXNDlFVW93cDhCdGk1WkdpZWxBeHpkTmpCYkdDQitr?=
 =?utf-8?B?ZElTV25QbWgxYmpMSXBnMEJ6MnhCUHkwWjRQY2NueU8yYzZHK0t1NkFvS0Jl?=
 =?utf-8?B?UXN1TEtTSHdRbktaZjJ1aEhITXZJdkwyU25pZDYwTlZmQVlpMlpGVWY4SUNM?=
 =?utf-8?B?SXhkS2JSdVdjck0ydTdJeStNNjJ3aFRxa3NlNkxYcGNlV3lGcXA3a0UyZVA5?=
 =?utf-8?B?VzFEQmpsUG96NjFSek1FK2U4Q0ZnKzM3S0FkOEplZnd0WS9CL1QraGlnMjNN?=
 =?utf-8?B?bFVWbFVWVlgvNUJ6V2hwUk0yYXR5aVlTUGQ5UFBqenFaclBlQndrTlZyL2Jw?=
 =?utf-8?B?SXk2WVB3aWJmNzJIcFdqd2xQRWhDRmFXSEJuTzZpcGZEUG9NM3hGTS9taXpX?=
 =?utf-8?B?Z29kT3V1OUNQUERSQUQzclpQOXNqVjQxdi9ieDNjQmhlS1prNU8yVEhmeHJh?=
 =?utf-8?B?WWVaSEx5d2Vhempxak9UMndTQVQ2VCszZ29EbW1ndUwxMmtyakE4OU9DOEh6?=
 =?utf-8?B?QmtTc21NTlN2UFhSYWloc0h6T0lPTnFOaFVXUVFIMXhFRHN5SzBhQVhrNi9E?=
 =?utf-8?B?Y0ZiVUNoOGgwY0M2RlNoVmtKemRYSzUxNEd3U3o3dnh5WERoK2RnMmMrczNl?=
 =?utf-8?B?SEorUWxLQXVIbnErMy9JSEdYYk4wbFVXUEZBUEt2RHA5VUdkOGx6TVpxVnlT?=
 =?utf-8?Q?UKybWK3WEbNG4lIgiPsvAUM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aee6202d-b7d5-410b-6207-08de3c861e0f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:33:06.2040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPEStLWkJgBIhdCMVUFgXDhe6h0isPu4WoDa0gqoUoC1OghZCalYDLtmtmUYsrrOzTMbd6/fri2FXuVmn7VKip413VCQ67JZzbwlc33Kk5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8376
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 09:33:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8280

Hi Robert,

On 12/15/25 10:00 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i know i've mentioned this before but, to start with, the dev manual
> section "Making Images More Secure":
> 
>    https://docs.yoctoproject.org/dev-manual/securing-images.html
> 
> opens with three links all of which are more than a decade old. and
> further down in that same manual, there are two sections related to
> vulnerabilities. given the importance of security in the embedded
> space, might it be time for a whole document devoted to the subject?
> 
>    there were a number of talks related to this in the recent YP
> virtual summit, that seems like a decent place to start. surely there
> is easily enough content to justify a separate manual for this, no?
> 

https://lore.kernel.org/yocto-docs/20251204-reorg-security-section-v1-1-75aeeb741c83@bootlin.com/

Maybe?

Anything more to add to that patch? Since you have some interest in the 
topic, please take a few minutes and help reviewing it?

Cheers,
Quentin

