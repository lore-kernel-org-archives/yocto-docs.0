Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8E3C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 13:01:28 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150496.1783342885362190938
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 06:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mJJijpvA;
 spf=pass (domain: cherry.de, ip: 52.101.65.38, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwQrVMNXLRjDerlYbwv7iVgRw9D5jV80h8lj48WDGBZbfkiVeATNPNLpAo8nDtxR3DoWqR+B+d+VcdA6l+BiqKy1PsjI4lJWIxdoT2+IoSD52WkJZH38r3wCzubMqJTxsoNvSmkXSd3tWaHas/zGyxPG1G7P7nkKXcfKCcxY4MbT3jP1q91VUFpB5sqMTxz/Klkw2EWDB1hShu3RNHOadrEXedaa2oBKNTEtZfVdYt7/d/M+mPUH3JT+F2h8RUsZ3l0hSZ4tcHrYBA96o3Qy2lLyBjZuE5vzGbkiHc4FB/+ufcEqKf1Yfn5EvNecDgy0WS4kR3p9IHwoEg12fL4SEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49QCdQTeKV/TtzIZp0gcvowp9EAyyP+jGBc3GprdxR4=;
 b=jy8rf6Az7pWDY4hmu4HtxDgsCwZ6S7GKIB7HCBIkTU40aDWr6C2jgCrSch7RTWUmvo2W/ht18ifChe1BkHDGO/gdliW7k33u0u8KiN1nXxygezXDyfpayJDeJRYnuf4Wh3nbLjP0GnTWn43kXjSK2T1d7M8vo3dgzmnXXYNiL/85D+A1Kc+Am/ekNX2sVe8dGUZ94E7+p3xFRpIT7/eJA9MXDNmxLChjMUvAtbV+B4vMWzgXfEiIMmbNjnAZpu1Hezu3sFD1Szas8JR3Hm1bZCJ3ir6Nvia0d7ytDl5J2E2zAmLJqQ2CKmkl/zC0ZJ7pfjjg6K4fIZ3D+ZlXrH1ZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49QCdQTeKV/TtzIZp0gcvowp9EAyyP+jGBc3GprdxR4=;
 b=mJJijpvAA0vXN27hgmT6Do7obFXnl4+oHIHJYZF9rX7TV8qFmw7mb7IS5nlEPkKjjvsVLgCBDY3vtXBwGPG9A32oyVKNl/Efz5MJ+WXVrcJYEiGWAKnmf538Xz7uqHycZ8co8bCNl5SGz1dib4zi29dUbFtmau6wqx11chm88I4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI0PR04MB10370.eurprd04.prod.outlook.com (2603:10a6:800:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 13:01:17 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 13:01:16 +0000
Message-ID: <d7cfcd90-05b0-4694-9b37-8bd7ac5fa029@cherry.de>
Date: Mon, 6 Jul 2026 15:01:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH RFC 0/6] Generate documentation links for OE-Core
 (cover letter only)
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260703-gen-doc-links-v1-0-c2c31c68a0c2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260703-gen-doc-links-v1-0-c2c31c68a0c2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR06CA0136.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::29) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI0PR04MB10370:EE_
X-MS-Office365-Filtering-Correlation-Id: 727bbfa9-11e3-4542-192c-08dedb5eaa8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|5023799004|22082099003|18002099003|4133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	fIYmlMh90Xm1rG9inGNMDYlkXZiOxE0kJfnYnRQs/ex/0txt0FziTTsB2/0KjDRNJAFVCh0+f6CilyEyQGSzmuMPmiw++ZlPgf+wz6AI/rLB/IVEIwhobQp0zoNQhkMltT2T/AchGfKN7ebfDrLiPvwcF6O2HucMKazU3Rqse+GHC9AXRaCdkZMNTV78EyQEunL87pGHur68Ymtyy+pwKTe/zwILy6bRv3ZKxa7Aw8YfDiepzeRBFikHr4ne0ZtJOU1Vek74bnlNsjlQq+ja4qYFLerY5delo7SAGZ/w8NHEPM7NDPZ8YKUhfLZDE3tBA1sxm+GDSVt7gzqLmPikCmJtTKIxYdpj/ilaLktHEiZzFLgw0hACVx1SWgaFJznsOgaL5UAtECf2kWTMTBQU3+xpGHwhyaTAzJP+Z0QmyzE8tnznMtvsHnZ5m/dWc26gPv4ErSg/ByDxTQjdfEM5j/cjAe++j2gkrABvkJ6rjuAfbgHUBVdhMPlR3Q9eh/kq65nyvrLHDkvyI35SWxsdnVjrHTww9lV+ANHQseBRWIsjwEwayaRCSreLOMT4Y3WTrVP3mLM/xp8xXbLN+/RhZWtABx7RHQsfMFGYG5uwBCQJZK4WnJM+KMoYp/TZwR4W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(5023799004)(22082099003)(18002099003)(4133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWR2SDByQUp0REEwbWtEYWVLTSt3c0pmQmkvQmNkMnRQK3RSNHVyVmduOWpT?=
 =?utf-8?B?Njdlc1lPT2c3SmFKcDV6Y2hhanlydmJINFlVUVNjOEpDazNxNi9MY2ZqOTht?=
 =?utf-8?B?R2JlUXRIOE9OcUw3MFptZW5sS3QxT09TQzNYSldpNTZ6blh4eVg1REtSV2Q5?=
 =?utf-8?B?dE1iZk40c2hpMU1PZVNvYU55STFOdTdKOVY2RFF3eGxhWkZiMnA1TXN4M1hO?=
 =?utf-8?B?cGQwalppaGp1RVNnbFRUYXhFWEdoNW03cWZSS1dDTTIxdlFMUUFhY280cXdn?=
 =?utf-8?B?RG5UTlE5QXJVcVUxT0R6dFFuNFNSYk8ySGVLVmNWblY4dk9FZEVmYitiMXBW?=
 =?utf-8?B?NlF1dDg0bUNva2FqRm1TR0hESm5VVFp0dU1BTjNVMzhlSmJCR21WNWRHb3J5?=
 =?utf-8?B?U1o4bkRRRFQrNUxyT1BiOEl1MkRhdDVVbHdJc0JiR2RjSUVFQkNqTzMxTHRy?=
 =?utf-8?B?YUhOSlRJbnowbGx0N0FWdERqaW1ON29TdEJ1NVhGS2ZBUDUweXpqOFEraFpH?=
 =?utf-8?B?MU50RlZ0Y0NGamt0WjN3OVU1VVRYUHBVLzQvY1J1REdTRHFweFpQM1UrUy82?=
 =?utf-8?B?RlZQcGQzU3JBN0M0Q1I5V29XWnRJbGVpdk9uS01qNGR1U2F3aWU5K2ZnRUIx?=
 =?utf-8?B?Vm9hNzZGRytMN3VMRXdQb3ZCMGF3NzFEM2RhVG5oSXlLV1Y3dDdjem55MGJz?=
 =?utf-8?B?YjlpODVkZFpXUkFqSk56T1dQeGZiaHU0TXhiMnJBeVhQSkRmVFZHY2hOa0pK?=
 =?utf-8?B?RGlYTEppNWFUZXR6Yzd3c2xBMTdyNm5rQjdqbmlIVWFIRlNTSGpzSTgyQlA4?=
 =?utf-8?B?T2dGelBPcE43RUFZd0VoTFcyRXpyMnZjRVVvU001NElObU9IMU1XeXdNNlpT?=
 =?utf-8?B?ZWFQZ1AxYmpXemk0S1BySTFyQWFZTEJsVk1qTDFFdXVrSWRkckdENDdHUEwv?=
 =?utf-8?B?ZUo2ZGVYZlpIc05oUVRzQ3NxcmlaTTZXL1doSTJ4NlJMK3N2WndPdU81VHUv?=
 =?utf-8?B?VTBsN1R6WE1nYmxydXlhTzBqbGxPbThDeHhkTENzdUI5T2hxeFVtVWZQRUdm?=
 =?utf-8?B?Mm1RLzBrUWZPd3RsMWhaK2x6b2kvbjFEd3BwcUxHSjJ4dE9HR1RaMjNzQ3Jj?=
 =?utf-8?B?blJwa3cwWk5IQ0grNFBQWkprZEZkV3ZueDJzbDlzaHhvTnNqOE5ZbVNJS2Z3?=
 =?utf-8?B?cFlYenpOVUI2QXdDV3hydUp5eldGYUxjd0l5T1pCR0NwOVFBQlIrR1BFWk1B?=
 =?utf-8?B?M0xyWUtzRk0xd1dzMkJpdFFubElTbGtEdWxVVlkxdlhLNlN6ZFBqYU9PbVpX?=
 =?utf-8?B?cnFZQXN6UG56cGg3TEszUzhxczl5SWJlSzZETVdmSURaVDNpQ3pmZXVqc2E3?=
 =?utf-8?B?T1NNK1R1d1I3Z093ZDlmZ0RiNjhDTm1EeDl4RDlWamdGYk42WGxGWVprdHM0?=
 =?utf-8?B?ZE9UZHFsNk9KM2d2M1VjWlBXWmZJcjF4Qk5jREtKQ3Avdk9RSHE0NURrM29z?=
 =?utf-8?B?aWJPMmlDemRpM0J6WFNZRy9lR21ZMktEb0pnWG5HYVVNQ1FEVUsvSVdmSFVE?=
 =?utf-8?B?TlpJN2szd204VU9qQ1hwSENHS3pNdDc2VXlVcVlsN2tOUms2UTBtWFBpRC8v?=
 =?utf-8?B?VWN0aVlUekpkS1FMbTdoVU9ySkNEWTBJZXdMeFBpQ1hKbkU5cS9hMmg0ck56?=
 =?utf-8?B?cFlnaG96cmdadjMyS3J3TFh2OENySlJxVElhajgvWEdBbGRLYUtiamtORmpj?=
 =?utf-8?B?S0hWYkxOTGFqZHgveDM3TUYvb0NRSzVNTUpiNUErQm9yeFl5OXBJVG5WdE4z?=
 =?utf-8?B?elhUQjBiOHJCbE1VWWp6ZWtBY2krTm04MkI3OU04cjVxdEREYTY2ZG9OSDB6?=
 =?utf-8?B?S2srbnA5eTRvVHpEa21uYVFpUEdsVUhMckZqcStJb29KK0d0SDZTWUdHT3VR?=
 =?utf-8?B?WjE0OEJPN0VvSEtkeWdGeEQvaWd5eVNnQ2NZU0RQMFNiQW10L2RyUkFwZGJq?=
 =?utf-8?B?TUNFVk1sYlAwQk93RnVRWTVjSzB0clVSWTc3VVBNR01FRWNtS21UdDcvcnN0?=
 =?utf-8?B?YUR0MkhBM2ROd1FwKy8ybkJ1T3BsZGUwQ25YVEZGWjd0MVVPM09YL2t5Wmp1?=
 =?utf-8?B?L0Q2Wm4zNHo4emJwNU0zWE04Q1lNcFRxenlYaVA2VmxRZTJiY1NRbVBCUXVa?=
 =?utf-8?B?cmJ2OWZlUFdtOGFXWTYyYk5Zc1ZuamJYMFB3VGxvaVZwNmlaWGhIblN5Rk16?=
 =?utf-8?B?OUFtY3NCR2RFQUpKU0xiVG9kUDZTb1gyaTFXVTQxSUp2VDlERWFXVXlNbmRU?=
 =?utf-8?B?L3BWVGhWSXNMeWhLcnd4M2g5enV2NTZ2RWZidm9KQjdGWVBkM0FSZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 727bbfa9-11e3-4542-192c-08dedb5eaa8b
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:01:16.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RN8xkRgDyEWlh/5wLYbUUwmxISAs6JWXGCrPtqWaA8q0q1OSmUeVqZhHLAk0/CQrD+Vnu5tl3yED1GOnTzJ3VG+DwvrS+fb9P1FKSmjNRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10370
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Jul 2026 13:01:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10038

Hi Antonin,

On 7/3/26 5:07 PM, Antonin Godard via lists.yoctoproject.org wrote:
> [I have pushed this here for now:
>   https://git.yoctoproject.org/yocto-docs/log/?h=contrib/agodard/b4/gen-doc-links
> 
>   Not sent to mailing list as patches are quite big.]
> 
> The purpose of this series is to make links to yocto-docs accessible
> from OE-Core through a doclink flag, making the overall documentation
> more accessible. This link can be shown with:
> 
>    $ bitbake-getvar do_install --value -f doclink
>    https://docs.yoctoproject.org/blacksail/ref-manual/tasks.html#term-do_install
>    $ bitbake-getvar S --value -f doclink
>    https://docs.yoctoproject.org/blacksail/ref-manual/variables.html#term-S
> 
> This is made possible through a file generated automatically, which
> contains assignments such as:
> 
> S[doclink] = 'https://docs.yoctoproject.org/${LAYERSERIES_COMPAT_core}/ref-manual/variables.html#term-S'
> do_install[doclink] = 'https://docs.yoctoproject.org/${LAYERSERIES_COMPAT_core}/ref-manual/tasks.html#term-do_install'
> 
> This can be used in projects that want to point to documentation, like
> Toaster.
> 
> This could also be included automatically from OE-Core's bitbake.conf with:
> 
>    # Default path to yocto-docs, assuming it is next to the openembedded-core
>    # repository, as would be provided by bitbake-setup.
>    YOCTO_DOCS_DIR ??= "${COREBASE}/../yocto-docs"
> 
>    include ${YOCTO_DOCS_DIR}/documentation/oecore/doclinks.conf
> 
> The main point for this is to make documentation for variables easily
> accessible, with the hope that this would also encourage people to
> contribute to documentation more as it would create a bridge between
> OE-Core and yocto-docs.
> 
> This is more of an idea than anything though, comments on whether you
> think this would be useful are welcome!
> 

I've barely looked at it but the first question I had when looking at 
this was "why a file per variable in the glossary?" and the few commits 
I had a look at in the RFC branch don't really say. I think you may have 
wanted to generate a list of variables that are in the glossary and 
parsing Sphinx is a bit overkill, so just looking for files in a 
specific directory would be easier? There are three issues with this 
logic, first, we would need to do this for older releases which is 
time-consuming and error-prone (I guess you probably wrote a script to 
do it, so maybe not that much), second, it may become outdated, third, 
you need access to the docs locally.

Have you considering simply getting the objects.inv file generated by 
Sphinx and available at docs.yoctoproject.org/objects.inv?

python -m sphinx.ext.intersphinx https://docs.yoctoproject.org/objects.inv

will give you something interesting. With this, you don't need to keep 
updating your docs and be sure it's up to date, you just download what 
you need (we have objects.inv for each release I believe), you don't 
need to migrate any docs release as we already have it (Dunfell has one 
for example). The downside is that if you want to do this locally 
instead of remotely fetching the file you then need to compile the docs 
instead of just fetching the source code for the docs. The intersphinx 
code is in the Sphinx source tree, so we can always adapt it to generate 
whatever we need if this isn't 100% matching what you want to do.

You could even add a link to the bitbake docs as well since we also have 
an objects.inv for it. And you could probably also adapt it for other 
things, like documentation for a task since we do have links for each 
task in the docs. Also qa-checks, etc...

Cheers,
Quentin

