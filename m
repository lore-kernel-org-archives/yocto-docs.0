Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B791D12D77
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 15:04:17 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17382.1764774255091189476
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 07:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aXiz2qyt;
 spf=pass (domain: cherry.de, ip: 52.101.84.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvDawOJ3mJTy0gX74PpP1bwJIgNTUbNdGa65lwgTny/3fq4cr1c6KK6czEQdbT7HsqDEfKFm4fArPhmZUBtBs//9nK4yjU96oNwshZU/O7a1cyy9/Eho+aw5YFYhIMbN7WoK2/lhbkYoYTamvJIUVnC4q4RiAlnuHl4EVQhdTJ2uCk29YPZNlGdP2NpQucXH5NeKdpqZ+FdQdG/jiAmn0aKtoGmfyRuDpAutFZS5MNoJ22sfjWcL8j6Gy9J9VyZ+AMGFZLyMhpHLB7E99uIpybH+m4KyRebTWUe0Ou6ubEQaaRiUdnFHbkHk1hGF/JVbw1QRIBO/uxCk8gytDjv7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Cl/cZtx9YS+86l+scWFXxayC29wE7eJomyd7yzezHE=;
 b=CcNCGLHGigBPV+nQR/5BIrLdVslMEam20ktP7vuNsHelYhXtGwbB1sUUkgonmgjSmLIcxeDaVD8PuBcS4rd+PeleriJ3YWKfp1oPWJ9ARbm/MRRV1e7a7oRWnfYzDKlHrW1CJdJOgxBVO8FhDZGTA86KTdvNb5Wsx/hR4Gd1zKYlcA7VnPlfykdEBfUCKX9NxcSOE+TQnW3WlQBs19BCf8ZjeGXDAvS/06JhHy3t9ymGC7Rjnow4ZMQQpYYlnp2jLa8U43aeI5KFDp5oYpu0x5cjg+neVRZsPXvKOcV7C2CWOOIo5hWYNsA4GbqfgL2vQYNGVx0EpoJN6rb6a+G5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Cl/cZtx9YS+86l+scWFXxayC29wE7eJomyd7yzezHE=;
 b=aXiz2qytncQsqkfQNNALZg+0bxf2wh3mpFDCaBHAamvkix+Zw4dQTjru3qpXXDu6MYhptP5JFUZ9Q0Loy+yjkeqa7/Jb+YM9W5vfNING+OmUtDJxTQPK4N0pMHcvh3tcN9BL73jbhgdXUaUmPkArum5kK2WiuqoHI3i01y/RGC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by AS8PR04MB8071.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 15:04:11 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 15:04:11 +0000
Message-ID: <66616c7a-b998-40ed-912c-c0c1a199b890@cherry.de>
Date: Wed, 3 Dec 2025 16:04:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/4] poky.yaml.in: split automatic and manually
 replaced macros
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
 <20251202-release-updates-v1-4-889513ccc384@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251202-release-updates-v1-4-889513ccc384@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|AS8PR04MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 5813cba0-f803-4448-481f-08de327d3744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWp6ckVVTTdodS9zeEE2dzkrVUw2WTBVQWRFRTdpdmRFa3JwRlBxdkY3NTFO?=
 =?utf-8?B?TW4rdXdhSFFpc0hqV2t6MVg4T1pvNjVNRDhJS2tBdElrL3VtdmVkMEp6bVg5?=
 =?utf-8?B?b2ZreTE3bnI3UmwvbmFTQWx4OWN4ZzJsOWh0Ty9IdmhSYlhndGIvbUtKd2VT?=
 =?utf-8?B?TzBIS0haUWxxLzVwV3FNSFo2NFVkRlpxVTVDZUJuTU01TWpLUndNVGtrUHdh?=
 =?utf-8?B?cTUwODZHZ0hRVjVWNXAxRWgzbGVmZCtiRjRqQXhvNWZHMjArQmt5OFIxbkIv?=
 =?utf-8?B?L0hiVkxYMUdUWlpzV2REZjJJT3hKZm1yaGdjbDJpSmZOZUJld08zMWZmOENq?=
 =?utf-8?B?V29aeHlDUzhrZnBiMVNzc2twS0JlejhTdEpsUGlOYmZGMGRvSmF1SlFlSXB5?=
 =?utf-8?B?RFJIclFJY25mcWRCQXl1M1M3ajRkQWtLZXpLZWRCSHJ1ajFuc3ZEL3BxZkdT?=
 =?utf-8?B?MTBvT1VNSFdUUXp6S0Z1N2w0OEMzVEJsK2hMV1ZGaFA3cEdXR0h0UXBtbjk4?=
 =?utf-8?B?dGFYS3pSck5xbVRlWFRpeEFjYXBzUmdUNUdNbmpjT3ZHa0tLNHF4a3VSRHkx?=
 =?utf-8?B?akRSdlFXQ0xsY1pCTGtqMEpKRisyUkpQTFBmSlJSYW1sTDluMFF4YVZKR3Aw?=
 =?utf-8?B?cjB1M2RBdWZMVTEvc3d3Z0JBclM4a2tSRUxTK3FuQzYyZk11SnM3cEVQRndu?=
 =?utf-8?B?NXRKNE5HeVZKNHFOTW5uRzFwMTZhT0lLUWIzVkxHRldXZEJVaFkrNFRVVUlC?=
 =?utf-8?B?ZFUvN2pzZDlQaUZiUGN1NTRvTHVVNmpjdk9YSENmS0lwakt3R3NxQm9aVnVM?=
 =?utf-8?B?b3VPVkZkbzYvRTlYZGNaUUpDVENtbXBIUkROOS85dTBTVHdHTjIydGpmZ1hD?=
 =?utf-8?B?NUs4dENCNW9XRXUvSGpDNm5MR1BPUTlwM0tUaXpVclNSOEsyL1crTVAwSGpz?=
 =?utf-8?B?SHNqZmc3RW01RjhFYUZYUjVJdEh4Sm1lMEJ5Y2Q5NHlQODVzTXZNQURKQjV3?=
 =?utf-8?B?MENMUEd0OUtSTmR0OWY2Mmx1MmQ2c1d4YVNMcERIcXBFdzNoUzZRenNkM3lJ?=
 =?utf-8?B?QmJXTXR3Y1lJVk02L1REOERpOEFSQjJ1VDFXTDB4Zjlyb2plN0E3Qmo5TkhM?=
 =?utf-8?B?UW5PSmFtVGVkZ25VbDR3Y2hWWXBYbnZLVEtXR1NObzQvdzk5WlhKSEFkS2Qw?=
 =?utf-8?B?cmc2OWhyS05BUC94VG1kRUFCZHI5TGhsUzhhaHhPRlZPTGtuL1MrUjhhZk5D?=
 =?utf-8?B?OUpoOFYvY2FHYnZLdW5FMjdxQWN5UDh0T3BVRGQyQlZnQSt0ai9NMGR5ZFhW?=
 =?utf-8?B?R0pZV0UzRE9WWnpPYkRoVVo3bmxQOEFaT09qOUJlZi8yNmtkRDk4bitXaGVK?=
 =?utf-8?B?RGpPTng5SXZNSU00Ym50eE55cTRhM2pJRDMwa3FUeWRVRllNUS84Z2RyL3dL?=
 =?utf-8?B?SzNsZGVNUUxoRXZEbEZnMEV6RUNqQ1p4dXU3TzMxdTJtVWE4enpKb1FXQzh4?=
 =?utf-8?B?YXlxVU54ODFLczhxQ2d2VEFvQVgzRks1VEdscTVYdDQ4UWF6MmlkS050Ylo5?=
 =?utf-8?B?RFZKZS90Snl2aU12ekIzL3RZaWxVcWRiWlFJQngxOFl0Y0hCZlpqbmNuRUMv?=
 =?utf-8?B?ZHROU3Fua203RG5qd1NSd2lMNHdwb0d6L25zUk9iRjdjSGhybTVNbmhBaStq?=
 =?utf-8?B?aGtzTEFvQkpqa0U3cmZDMGFHQWd2OHNLSStCVjkyTTBIeUlHSFR0aFlYdHR0?=
 =?utf-8?B?YzhndHN5d0YxV0Z3eU50OEd0bEVUdkhnRGVZQVhyWTJpd3FRLzdRc2Vmclg0?=
 =?utf-8?B?cGZmUnc1SUd2SktLNS8zeE80Y1ZXODVZQVdQZHhlT1lWTlcyMjNHcHR4Q0c0?=
 =?utf-8?B?cEFQcTdhVWpJZ1k3Q1A0Yko2L1dXTEs1RjhvRHZiRjZ5N1EyNVZ4ZDN0S0d2?=
 =?utf-8?Q?7YE55L1s90GnX7D8Y50siPikiHbvFw6o?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnNwWkltY2pkWWVCM2lyQWVaMzdMSWgyK3hDT2NaWjJyNlliUUlIQTRrcllH?=
 =?utf-8?B?LzlCMTRPek1XanNBMzYyalYzc0M0Szlnb3Fsb1BYN09GMkxWUXFVL0lUYnhh?=
 =?utf-8?B?SnFsanYwc1hIUWRHb3Q0SVh2RGx2UWt5aUFQd1c5YXpoS0FENCt2T3ovTFFY?=
 =?utf-8?B?VHUrbGZSUkVEbHhuc2dzZnQ1MXZBS2JCYWhZRW9CbzRhd2trVmlrbUt6QnRN?=
 =?utf-8?B?TG9zbDdNQ3VLMEhzdjczUnhxZkRrSS9leTJ1cW9TTkFOakdlOUw2VXZ3aDNa?=
 =?utf-8?B?V04wb0lEVkpHMHVqTGg0djJ3WW5wdlJBaVIwRFJEOUNxUlhaNWJWOFNrRnla?=
 =?utf-8?B?b0JGYzZCTlR4QnhCT3RxeUhMeUNzTE9DMFplZFN1M0FLN1JXaGUwK3hiNitz?=
 =?utf-8?B?WDcwTFdDNVprZVZ1Tmx0OWJReU1McGZEUlF0QWJPbjY2K0tPbERVSVVPVDJO?=
 =?utf-8?B?V3l3R3VEcC9NQUV4bmpBeFkvQUNhZTdVbWxlZlowUURzcnU2L3ZDSThydGo3?=
 =?utf-8?B?V2pxUnc4Z1FvcXVLVzd2cFo4alVBZVRZcFNrcXhBRzNiQ3dxdVdYMjJEcUdz?=
 =?utf-8?B?ZXZQbUV1MkU3QkxiTWMrTy94eFAzS2hsVW5oMS83ZnA0V3hoMlRmQnlCaXdz?=
 =?utf-8?B?aUVXdy9ETFhKRmkrWmI0VU9MQTRVY0JjZmg1bkY3b3d6QzBiWk55aGtZYSsy?=
 =?utf-8?B?eGNIdzJ6bTJZQW1aSjNxZVc3OENSWDdyaldWODk5cFoxWE85a2V1L2d6Zjd6?=
 =?utf-8?B?cGY5RHFWWEVhZE54UXNlbHdiTXlpV21XeWVnajRlS0tTYTJMWGR0Q3Fmc2p4?=
 =?utf-8?B?bUd5NnlWSTdFWFI1cFA2SDUzVHovamJ3bXJjRmRxam1OYTVJMW13ZjBTUkov?=
 =?utf-8?B?cmN3ZU9UZ2c3RUVSZEd4VE9xQWVzTWJqSDA1QStPaEs4NlFFZlFIdVUzOE00?=
 =?utf-8?B?WW4vVUtYTjlWTE41b2JSaTRrQXBxSThoanVCN1JLY3R6aWx3a0ExME41V2Jm?=
 =?utf-8?B?RHBvTDJCUjkyRTdKZnc1V05EdEVtZjBYWm1sZWh2NXZTSE1sZUw2Zmg5b05F?=
 =?utf-8?B?SHpESE0vQkl6LzMzcUY3YVNPQVFoRXBqQTlqbm5IbTFjWnZzQjd1QmhNNnRx?=
 =?utf-8?B?N0Vka1A3K0NwcjNHZVovV3JmS3Flb0RZNU5uaytweDMxazdoc2grUHJTcCs3?=
 =?utf-8?B?ZmprTnRmSTYzVFVvbGI1QkdzUHN3TVZyU0pHL0Z1TEg1bDVZd1hRVThOdWxt?=
 =?utf-8?B?aURyRVpMWWx2YTVBa1N4V2xwdit1WCtJcDZETzZUenhPbG9BcUNmMGZYMDY3?=
 =?utf-8?B?emtEZHd1WnhlWGErYnRMUUR0NDJsTkFKdnkva3RvNVlNcmp6NUIraDFRa3Fp?=
 =?utf-8?B?RkY0ci9XT1Q4bU5ObDVHSXQ3RkpFRCtKWDdhNVpMRUZaNHNGYld0NWNEM1Bo?=
 =?utf-8?B?S0xQZFFGcWhEbHVSMmZZdXlPRmtrN2RhWENmOUkwUjJ4dXV2NDJXSDdsZDZh?=
 =?utf-8?B?Y2VuZFVaUk1ZWmZMSURUN2xNNEtCWUw4LytzYUZkZWFINU5WOUZBSVFqR2Rw?=
 =?utf-8?B?cFNCak4ya2NIRkFmZko4R2VXY2I5VFpOczRCaDhqUEFUbU5zOU1OWHIrMkJX?=
 =?utf-8?B?ZGpQWmJJSEFJcUhncVl4QjNna3ZyajQwRnFLVjRLbVNxcmhYYi9GeXBibDBp?=
 =?utf-8?B?SVEzTWU1aGVmcGhYa1VOemVyd0lzNGZ6WG9pQXUzWVV6WTNhcTNCQXZnbXpR?=
 =?utf-8?B?U1I4YTA5OXVidmVHTG9Db3ZUdmJEUTFoRUJWNC84K0Z4a3czM2JDQ2RhMmVh?=
 =?utf-8?B?T3ZZbEdnaFF3NFdPdk1vV2lwc2wzcDBnZHByNk9KNzlxRWVHRktqeWdEK0Ru?=
 =?utf-8?B?TTRmbktWZ1NSUFRESS81YnoyVFJielF0Y3l0UTlBN1JaZU1JNGc5Q1FFSFh2?=
 =?utf-8?B?ZjBVb3NPZWlrOGUvRUlRRnh6ampuS1NUYlpmM1pYZHZDcVBIOXI5Mll5RVVy?=
 =?utf-8?B?WldoMWNremtia09WVlAxck4xalZTWjg1US9PdklaYUN6b25ENEphcTBYNTAx?=
 =?utf-8?B?dVM5K1NsS1N0OWdEOHpVc2RzdHZUWnNJekxXSEM2TS9KaEVuU0k3V0RsRkx6?=
 =?utf-8?B?eURIcHo1RHY0bFAvalBpalFqZjByR0ltWktBbFRRWFpCcW9lSzh3ai9ndjZm?=
 =?utf-8?Q?rvJVuoT0S1rePL4HxhhViQQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5813cba0-f803-4448-481f-08de327d3744
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:04:11.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrKMzCTP8/ba1rAnxQWkNALIQ9pnwkUiTW1adtYKt0osXfq4WpVr1o3UcFseVtAWSmBmUYl0zbyqjyZqd+ZHR/Y/81FxsgR/5EBspNPYky4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8071
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Dec 2025 15:04:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8198

Hi Antonin,

On 12/2/25 5:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Instead of thinking some of these macros should be replaced when a new
> release is out, split the variable that should be manually maintained
> and the ones that are automatically computed in set_versions.py.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/poky.yaml.in | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 810efd4d5..f6d6ea9fc 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -2,6 +2,12 @@
>   # Macros used in the documentation
>   #
>   
> +#
> +# Automatically replaced by set_versions.py, no manual update required
> +# Values below are placeholders to give an idea on how to use them in the
> +# documentation.
> +#
> +
>   # The DISTRO variable represents the current docs version. It should be used
>   # when referring to the current docs version. See also DISTRO_LATEST_TAG.
>   DISTRO : "5.2"
> @@ -22,6 +28,11 @@ DISTRO_REL_TAG : "yocto-$DISTRO;"
>   DISTRO_REL_LATEST_TAG : "yocto-&DISTRO_LATEST_TAG;"
>   DOCCONF_VERSION : "dev"
>   BITBAKE_SERIES : ""

DISTRO_REL_TAG and DISTRO_REL_LATEST_TAG aren't actually replaced, so 
should we move them with the unchanged variables below?

Cheers,
Quentin

