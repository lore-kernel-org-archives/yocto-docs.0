Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85161D2D0ED
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 12:57:52 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58387.1768309064056087213
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 04:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ARbiJ8A/;
 spf=pass (domain: cherry.de, ip: 40.107.159.18, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOrFmER3y+DuK2lRcHuiuSEuLcYHX4HRL+xlhMfvO7+ilPXQKed6RMoYoXySh4HNhl9WGiauP1o63DZp3febfQCYby9t6n+SmFcSZrPLB5H8KOSGnM76cUmO15uZSx8UFs0zaTl7xxRqFOMm9qGsEqmEsbzB0kT65Pg/QqYclFDX/2RA1T+uxfhmGSFBnVtiTm6j1lnEE8zQpEYUlcEJv+FsgYLdtxnvLErXtJXbop3G9B4PUg0zO9MT6ZxB1jPApUTGwjN0IRdXed99zLsRYEYtiTFF9dk4aOZIihC3EZeJpI3mjbkvtR7jUQxW0TJK7rwdJCHmcni5b3rWvfPI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGDHjcnXwZ11QH989MLYedx/tgjP3I35b6QTVpm1Fko=;
 b=hkZhh08vAqtITOQ/FYHLQiIazkubuo3J8rrdYJuJR5mUSt9XRER1HNTTHpfJZ7CIzzaKxChiQv9J5SkemgeRHEMSPr8/9b2cR3sC2u+1BB4IDZQoaMYI84ioEFbg2ZEQ9iSPC+nD7LWJp59C63D59EIOcrwax26AA72s2c+uL/a2ssY7+BtWCgocChaE+Vn6WE6fnh59omfD4POEUcb1sOjccBDKrYvVVebJwJM1EVM8l96ru6XJ2BuLpw7jsPODxt5ibMnGT7/iCxyU40N/pZnBpc4K5yzO7SNkpitWLnESOStNHmdEe9Z3WA0u9IO1wI8ub10XJDpAoBE03y3oVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGDHjcnXwZ11QH989MLYedx/tgjP3I35b6QTVpm1Fko=;
 b=ARbiJ8A/Xc1yLOpj52TIiOqqMZM95kx7yEY8RlFqKXxmmwTo85CSdmi3bl/1UC4m7Mu0Knfx0bH5lRBIHlrvy8uKx0YKbmyuhKnoVhgWto01p+Xx7l+XWC6/7lTKsQRxpMhrDjibDt1vuJExV2OpVtOEotrC3ejdwRYNMU+TT5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:57:39 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 12:57:39 +0000
Message-ID: <2fc2d8cf-1d6f-4b77-beb5-038e51448b5f@cherry.de>
Date: Tue, 13 Jan 2026 13:57:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 12/53] dev-manual/layers.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-12-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-12-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0017.eurprd02.prod.outlook.com
 (2603:10a6:803:14::30) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 03aaab29-5197-4539-ef13-08de52a354e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cE5uZGluQ1VOSU5zamFJdFNLUE0yRUwxS3VoL2U0a09UcVhYWjNtdjVDckxt?=
 =?utf-8?B?TWxkM3E0TVN2aDl4QmtNN3d0YnJvTHZzM254NC9GVHFtMlhQcFVPY1AxVzVD?=
 =?utf-8?B?bm1GZlJUeHpMTzE0RGZiK2tvbE1MbWU0blhvdXQvSklLbllaNVlMUkg0Qnkv?=
 =?utf-8?B?TjFWWGlmY1Yyb2syVDZseURmRG1XMVpZdzVxdmx2c2JPNFc4NktCTUVoVzZj?=
 =?utf-8?B?eGRyVE81Q1JUazBmSHdHWWw3dFNleFRCWWZqVnRNSlQ0cEdZcE1jbjljT25n?=
 =?utf-8?B?MEw3QUdvRUV1WGhBejUyVEJjNUVXRlFlVnkzeldnQ0E5TjQxL1RkSUZFQld2?=
 =?utf-8?B?MCtHcDZ0L3JOV1ZZMXpBb1AzVHNtOFRaL1JtbGd3aEIySjR1VGcweEhSenNR?=
 =?utf-8?B?d3FsQTRORy9MalNMWnZvR09BSkF0bzFpekxydEVyM0dkZ0EyU0hpejFBejNl?=
 =?utf-8?B?UndRZkl4Y29xbWtNWFNvMmZNTE9hVVphVEQvR3hmMW5IYWRVSXZtTmkydkM1?=
 =?utf-8?B?bFo4Q2FUU21QdjdzbFphcXM0bUVQbkNBVFZpRDJ1OXJGUXJjMi9EUUczMUwz?=
 =?utf-8?B?a2YwajFzUUhhS1VmYTBsWEExSDlJT2Z1R0RGdGJvb05Cd2xpNEg2amRnbVpB?=
 =?utf-8?B?bUVEUEJIUjErWUNlS1oyaVRjOStHNlFoQjdYdURVcmltUGFlZGJpUFg2Wm5x?=
 =?utf-8?B?bFgwaXpqZTB6aDhXbUswZk5jYXZGSFF4WFJkWjNLZGNmejRQb1RNemtzd0Mw?=
 =?utf-8?B?azU2SlMvdndZaGdQVjZvMVY3eldnUlNTRHhTZVBMMkpHU3BTWHJkL0J4b2Js?=
 =?utf-8?B?dy8xSzBBWEdoakJSLzVNc0J6MUFMS2NuZzdXQ05sTVBRZXkvMW84MUt4L3g2?=
 =?utf-8?B?a2d5bDNmc2JaWmF6S0FBYm5jZC9oc2paV2R2K3RaVFFDRG5rOHdmbHFoaVIv?=
 =?utf-8?B?WkpZN1VLSEk3R1BPZHBHZzREb0N2ei9mUkVIVzhEcXJQT05xS1lKZW1MTHZs?=
 =?utf-8?B?Qy95THBXVTFSSitHeldBMW1VY0ZCNis1ZU1ZT2lFa2tlZ3lwbHhhRFFMeS81?=
 =?utf-8?B?d2NzRW95TVJkZUt0ZWFXVFFMRjV0V0UybFllVDRiS1NSODVDK1VCbUd4KzZx?=
 =?utf-8?B?L1UvVldjU3laeXJ4RGwrQ2VWZlQxZml1TFZTeHlPZ1RBRFVHL3daWmZ3bVIy?=
 =?utf-8?B?cUlFTzlWendpaU5JdjBDWEFTVFZqUldLakdHTXBRRjJWNk10V3ptMGVqTVVS?=
 =?utf-8?B?cERKRE1aSG5TOFVNeFVJYTFnVTQ2WmZ0NTZMK3ZHQUR1UldTdzZkVEhPckhn?=
 =?utf-8?B?bEdvdmh4Q1B6eWR2NVN4bUozTGtYbitzVHB4bWw2WVVybnJYSkpMam8vSlVq?=
 =?utf-8?B?Z1BWMnZudWQ1VlVOY2U0MGRkWGhjNEV6YXo3VG1JOTZ6TkJIeW5LTUltelNR?=
 =?utf-8?B?cTN3R2NnaVhhems2TUl4MEh0dlBsNFM3RzMwM3QrLzZnYTJxd2NhTmIxblFB?=
 =?utf-8?B?T2dObndIY1RxcWtYUkxtN2VZWHdsc0lMSVJabk9WamZkR2J5SktYZnpMZTA1?=
 =?utf-8?B?cFpYK3NaU1BqN0h6djRrNUJKYmh6Wm1FWlU3SnU0TVV2VnR4TE9zRGRrU1dO?=
 =?utf-8?B?eUViNGY3ejVsRzdGN1dtNE9UQmFvNUYxcWlkaFRTQnR1NHNDU2YycE5rRndu?=
 =?utf-8?B?ZFJxcXJNREE5bFdKa1RTR2hXWVdGN3QrZmwzb2JhbFVmOU1aMi9BeFlvc3RO?=
 =?utf-8?B?T3o3M0tFWnZNcDBFNFpvOTh6MjRIeG4yOXcwK0s1TWJSZU5GL1RJK01YTVJ6?=
 =?utf-8?B?Ky8xNytSeWJSa21vSDdLeFdVbzNmcUxZK1EwQjRyUEJOeERqSjRiSlR0aWo4?=
 =?utf-8?B?V2xUWnk4QVYzQVFxWi9DYzluSkhJb0tjSEQ0NmEzMmdRckZFRUpkWjZLSitq?=
 =?utf-8?Q?rn+ZymTSC683lBwcm/MyFbFDSmP70cYy?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b04xZkxaUEtlam43UVhPbm9wV1A4eVRqTExzR0VJY2haU3B1Yy9kTE5kOFVC?=
 =?utf-8?B?QTcwckgwUXcwRXFORnhQUXJ2ZGhUYXIzaGNYRFhEWGc1amp2a0RrRGEwVU1M?=
 =?utf-8?B?OFNocGJnQjY1RGVQT0RzSHZFVGZQdGVQZENQcnh4aU14WERlUTVuOHZvRng1?=
 =?utf-8?B?bnFtQ2ozQVFoOXYxTDlBc2RUZ3BJellyTnE3UkNsdU1uOHFBa252SGtkMkdx?=
 =?utf-8?B?OVpXaURqbzZTUWo1YnVuN2pGc2IwWFJocFErTmplU05zbVMrSFFDQlY0OW14?=
 =?utf-8?B?N1VlWXliWnhiS2Y5dTRKUURlZ25wTkNmNUNmNnJBTkpzOWRCZUNNam9qWWM0?=
 =?utf-8?B?eXlVWThScmpWc3FHYlFlcng3UDJnT3JBRHFpakZpRDRua05RbVZsaGxidE4w?=
 =?utf-8?B?dGF1OFVuS1NUOCtmT0NaTFVlSStYR3VXL1RDU0Eya3F1VzhiYlZIaVNISU9H?=
 =?utf-8?B?RVdyZWdSZysvWXZhcENKZHBvVzMyZ0Vpb3N4UFZpVVlRamdqandsZjFQU0N6?=
 =?utf-8?B?MGUvM2IrVWluMEhXdXNHc2tCOEpIWnd2Zk5VbzY2VFV3RHVHNDk2WWUrOVYz?=
 =?utf-8?B?dEVXZnhJeVI1OEtQOUw0NkpObmtlVUhwSms5eVBVamtJckxQeWlOMkJSMUJw?=
 =?utf-8?B?MENRemlvcy9KN1BiK2R1dWV1S1J0dDhCYkZEYnlYOVRHSjg3SlpYdWNjL1Jt?=
 =?utf-8?B?WkU2SGxGMFZRWmF3dEFnZHQrZUl0UXA0ZW10MmRSWUl0OEU4WDdyK1ZNcmdG?=
 =?utf-8?B?S1orNWVFNU05Y0ZDaEtCYmcwSVZ1Q2Zzd2ZRNFBkM0NHNytlcCs0dDhvdjcv?=
 =?utf-8?B?cmdaU0V3cllMbHFaTTFRcVY3cmsrM1FFWjBwL3FMTlkxV05kTldObmJjdmxE?=
 =?utf-8?B?eGR5VXhWQ3FyYUxvMEE5ZE1uTEY3SXp3Y2pTemRHeEpPdktKNTd1UDRJSFFC?=
 =?utf-8?B?bGVSb2J6NjFrMkd6Q090dDdmQ1p4QlZTWXFFY1FiYTBLMVJiV1pDeUtqYlo2?=
 =?utf-8?B?V1ExWjhOVUtpMXNRMzZkTUFlUDUvVGo1cW94T3djU05mRXdtRFhucXhsWHRq?=
 =?utf-8?B?dG14bGtUeUllcVVhV3Focm1URUkybnRmdnc5Z2ZNcnJiQkpPa2RLUlk1Rnh4?=
 =?utf-8?B?S3dONTFJbktIRE9PaXhmcTAzeUo0VXNEdSs5YVgzL2Q4cnRlbmxBQ0NKbXVC?=
 =?utf-8?B?eTNoNmJoS3preU13cnB3RC9tbjdTOWIyR2dWMjAxeTlRMnA1Y0twYUJ4YmJv?=
 =?utf-8?B?N0Z1UmRGTFk5WmdsVzFoQmVoNVA0M1ZLTGZyTElhSEpQVnZFL1d2S3VqeFZ4?=
 =?utf-8?B?V1NpQmR6RFRwQU9xSnQvSjFKUTVpcU1JZTZydXFFTVVlSTZndEdoVkM2dzFK?=
 =?utf-8?B?QWIvNWJhOStaQjBFRjhmYlZlbk1MSlkvbVl2NkxZU1Y0N1hvQW1hQXNUcEVY?=
 =?utf-8?B?RjM5VnRFRzZzT3NTUmJ5c2JIV2ttZERLZTVLUUNUa0ZnSXRpYmRBSVFMVWtl?=
 =?utf-8?B?bkNiNjArek5jYzBNeVE5S3JaTEdwS2cvSk8rTkk0cmxFbXVFSVdrWVhoZWND?=
 =?utf-8?B?ME1VM3hIRkJOMjZGN0laWHMxZFRvR0ZBcWFZS1Q3UVNtT2xRa1FUSGNUWXI2?=
 =?utf-8?B?czNRUUZQcWtWV1d5cEFJd0kyZ1BtWjE5WC9EWXFlNTB5WmZ3Q2JnTDFyQXY3?=
 =?utf-8?B?Nk02Nm1iQzE1NVVhbW5nd3hWWGozOVhkL2NTcW1DUGU2UnkzSktkN0hpeXhC?=
 =?utf-8?B?T3RYVnVGb1NXZUQ3Wk1abDBZazg2UzRlRzhoWGJUNEhUMzdsYjhKd09xdVBp?=
 =?utf-8?B?MlZXYTBVRnprS01OZGwxOG1jOVJocmNtUnh0b05LcVhRNCt1cS94WVFicVUx?=
 =?utf-8?B?aHlkeWRqZ0VkSURpK2lZaEdHWi9sUmtjUzhpb2tic1QxSlpSTnVnMnBkT3VJ?=
 =?utf-8?B?NjF5REwweGNJdUh6Qm16SjNxei9qRmNJcVBqMnVDTTNTMjNXU21SWGtPY1Ez?=
 =?utf-8?B?aXBkYUtFcXdvak5vT0sydWh5Z1FSejJ3Q0NiRnJvUUttZHZOMXlEOWEvTEh0?=
 =?utf-8?B?cDA3dG00SlFXblNMS2trR0VlaUx4dWdxYlNhTzVIdmF1d29QdVRLeTI1NUxq?=
 =?utf-8?B?WG9YTmc4bXlWc01uZFRrbFIvV1Z6c1dsQk9uNUZnZnRMT3N0QWhtUHZrT0Ux?=
 =?utf-8?B?amFhOC9FMmtlNzdxSVpPUEsxMUFpREVLVnF3RUpjZDBXTFhNNm00Sm1aTnBR?=
 =?utf-8?B?RFFraHRQclY0Y0lwWlhTZEo5d1VUaUJ4ZnlsNXpGcko5aEF5UXlxN3Q3TGh1?=
 =?utf-8?B?SURUa1JmeFFNZStUQ0V0QzZiTGJhQXdBcXFTaW0xWTY3b2Qyd204dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 03aaab29-5197-4539-ef13-08de52a354e8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:57:39.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEGfx7xQg9Q3WWS9VYDAHmwlPs6SgzABivWOGCZxiUTrjgWMQmcvsFKqGo7cjVnwwUkc/4EkAnquXjeTDiddyoOmOyz+dixRK7cklUsWwBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 12:57:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8493

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/layers.rst | 31 ++++++++++++++++---------------
>   1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 15d54cc02..49e17c0fb 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -279,7 +279,7 @@ following list:
>      repository that use the ``meta-layer_name`` format.
>   
>   -  *Group Your Layers Locally:* Clone your repository alongside other
> -   cloned ``meta`` directories from the :term:`Source Directory`.
> +   layers in your :term:`Source Directory`.
>   
>   Making Sure Your Layer is Compatible With Yocto Project
>   =======================================================
> @@ -518,10 +518,10 @@ possible.
>   Overlaying a File Using Your Layer
>   ----------------------------------
>   
> -As an example, consider the main formfactor recipe and a corresponding
> -formfactor append file both from the :term:`Source Directory`.
> +As an example, consider the main ``formfactor`` recipe and a corresponding
> +``formfactor`` append file both from :term:`OpenEmbedded-Core (OE-Core)`.
>   Here is the main
> -formfactor recipe, which is named ``formfactor_0.0.bb`` and located in
> +``formfactor`` recipe, which is named ``formfactor_0.0.bb`` and located in
>   the "meta" layer at ``meta/recipes-bsp/formfactor``::
>   
>      SUMMARY = "Device formfactor information"
> @@ -598,8 +598,8 @@ Installing Additional Files Using Your Layer
>   --------------------------------------------
>   
>   As another example, consider the main ``xserver-xf86-config`` recipe and a
> -corresponding ``xserver-xf86-config`` append file both from the :term:`Source
> -Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
> +corresponding ``xserver-xf86-config`` append file both from
> +:term:`OpenEmbedded-Core (OE-Core)`.  Here is the main ``xserver-xf86-config`` recipe, which is named
>   ``xserver-xf86-config_0.1.bb`` and located in the "meta" layer at
>   ``meta/recipes-graphics/xorg-xserver``::
>   
> @@ -886,7 +886,9 @@ Add your layer by using the ``bitbake-layers add-layer`` command::
>   Here is an example that adds a
>   layer named ``meta-scottrif`` to the configuration file. Following the
>   command that adds the layer is another ``bitbake-layers`` command that
> -shows the layers that are in your ``bblayers.conf`` file::
> +shows the layers that are in your ``bblayers.conf`` file:
> +
> +.. code-block:: console
>   
>      $ bitbake-layers add-layer meta-scottrif
>      NOTE: Starting bitbake server...
> @@ -894,14 +896,13 @@ shows the layers that are in your ``bblayers.conf`` file::
>      Parsing of 1441 .bb files complete (0 cached, 1441 parsed). 2055 targets, 56 skipped, 0 masked, 0 errors.
>      $ bitbake-layers show-layers
>      NOTE: Starting bitbake server...
> -   layer                 path                                      priority
> -   ==========================================================================
> -   meta                  /home/scottrif/poky/meta                  5
> -   meta-poky             /home/scottrif/poky/meta-poky             5
> -   meta-yocto-bsp        /home/scottrif/poky/meta-yocto-bsp        5
> -   workspace             /home/scottrif/poky/build/workspace       99
> -   meta-scottrif         /home/scottrif/poky/build/meta-scottrif   6
> -
> +   layer                 path                                                        priority
> +   ==========================================================================================
> +   meta                  /home/scottrif/project/layers/openembedded-core/meta           5
> +   meta-poky             /home/scottrif/project/layers/meta-yocto/meta-poky             5
> +   meta-yocto-bsp        /home/scottrif/project/layers/meta-yocto/meta-yocto-bsp        5
> +   workspace             /home/scottrif/project/build/workspace                         99
> +   meta-scottrif         /home/scottrif/project/build/meta-scottrif                     6
>   

s/project/yocto/ ?

Regardless of your choice,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

