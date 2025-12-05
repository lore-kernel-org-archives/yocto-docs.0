Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E474FD33981
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 15:30:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8283.1764948594371977945
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 07:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iXh7OBmV;
 spf=pass (domain: cherry.de, ip: 40.107.130.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuysrVrgaWuhwVV37Kgadx2ova9G+DYFZYGkQ/P8aZabGYNvL3wHwov3XUJifr3vXka5ugGf/lShhJtRB+x4CuI3H9vXfW6qByaSXN0JuvozdGtCMBNNWwElJ3xjoN+2uQszsiwgvz1An3C/BHANAzp8Wz3IREqQoUOlvyZZc9IFT0UzBvoLwqvykls6FlYtpXU7HKiGhpL8wQxWAKr5ZB7cTzbnMToVgZc5WxMsnyWRDJI4OvLSiCnbwf//2MATas4fLBsOF5gIvLjff+pDFAXdeV4NHQJdA2lT+mIQulloRVrTpoo8o+X9ru97gci8XEjmu8k9W0cFjv0S3aqvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wGK3WJjEhij8knMkQ09aIyg8Vflk3HezFS3gv1ARy4=;
 b=LZOq0VJQqYXSUXuXu/EpbwyTjLCw2s+RFKanrmHFWqdDDqwtT8wKEWK/UMuUqeDsWIvK4hwdBJYMouDBl4oF2ZjzAvcqlz6umcJkajPNz184vsNiCM9RYRPVTil8c77UczW6dP9RlmCaoiGFTE3nCRB+5iA6WyL217Dt7txrz09w8bIV2dx1fefwp15r5429iMsZ78936pXHr4bgvyUTLkhvfTfSKG2aL5ILW7j+F2qhGdqjDQ9H0MOooUiZFgrA+k3g1zd3E+2rEl7iTX0M2qchGnEkJZub2ux1uuvrXtf3xCrMr//M8L2F9wcNs+CIfsKs0xhZGQTHphYpNtnc6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wGK3WJjEhij8knMkQ09aIyg8Vflk3HezFS3gv1ARy4=;
 b=iXh7OBmVMAW4xLvsLx3Ij8gmQFBCX7wGziwNAgyMz+VipuJY4u6Z4G9qup64xyqHUve3uD2HAJDkiOpG6bH4EugNMakzI39xWAnM0FuN+Mh2ccleIkhptNtkSIn+3e3ve76oAa9YebBsvRnSad+Y9qbuSXHLuwQMX717puSQO9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Fri, 5 Dec
 2025 15:29:50 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 15:29:49 +0000
Message-ID: <7ad37c04-75cc-4389-9cf5-72b49b001f28@cherry.de>
Date: Fri, 5 Dec 2025 16:29:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/5] tools/build-docs-container: add CentOS Stream
 9 support
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
 <20251205-build-docs-container-tlmgr-v1-3-de30623e664d@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251205-build-docs-container-tlmgr-v1-3-de30623e664d@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dc08c1-11b6-4d0c-4680-08de341320e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MndVdmttSHk3cHRkMmRJVW9VWjF2Y1VsTTQrRHNuZHR2bDZwMkJVWlo5WGpm?=
 =?utf-8?B?U3B2NlpBcFZ1VlFCMm5icEgvWURmYmJQSlFTT3U3TFBIbzhoUTBWbExtL2dT?=
 =?utf-8?B?dU1aYW1VSExxL2VIVUhmOUtTUHRpejRQUlV3b2cwd1ZOOE1XcjJzWnArajQ3?=
 =?utf-8?B?Syt0eHJ0L0owR1JKWmVaeDljTnJFOVViQnVzbjZzTHgwaENGSHlKTkcxZXNV?=
 =?utf-8?B?TFZ1U2ZZdEUwSDZlaEZIdHgwMjIwSy9rZzhuSWgvZlZHbkRMTFZ4RDZpaS9S?=
 =?utf-8?B?ZElKbjRsWndTbjVBN3ExSlBpSFE2VWR6OFFtR2UyendKVzZDOHZ3cGNyeFdQ?=
 =?utf-8?B?eDcyeTVWNkdHelkwWUxTTi9xNmNQdk5EZHhBZWk1RGs5bml5L1JJK25yRlJz?=
 =?utf-8?B?TWsyVFl0YUsxOXhTcVlET0FjbU9Yek5EelV6RTJSTXoyNFR1Z09UTTNxUDg3?=
 =?utf-8?B?ZEZ5RG85aERrTS91d0dHVHVZNkZ4VGdCWG9vZjNiN1FxUHRzU2c3ZVprTUNO?=
 =?utf-8?B?ZUpXZ2dCeDUwblJFYmJ4Z1A4SURYZGg4QzgycitQNlFSOUpnU2lnWWp6Y2N1?=
 =?utf-8?B?VFhiZWxCVHN4b3dMWS9FVWx6RW96TFZuMTdmQWFMSkR2ZzlBaHFaVFgzVXlm?=
 =?utf-8?B?UXN5UWRMSW9vVUZMT2QyTHdLK1FwekpkWUh1UUhITFBINEp6OFgrRW9aV0RC?=
 =?utf-8?B?YUQ1Qzl4a0dNVk9sNlArb0R6anZLYXd5YldhS242SWZhVk5JOEV1QmZOT0dF?=
 =?utf-8?B?UnVPQ1V3VGt1WnFDRnV2eHdTSVhvR0RQUmErVDgwT2lDM0hxNUcrL2wrNEs2?=
 =?utf-8?B?QXFxUlU4Q2pVWEhhb0sxVmxuM3ZPKzBpRnZXdVoxd29WMkh6VTZMN2ErNkNl?=
 =?utf-8?B?SkpLOFVrN3pVKzJRZHNYaTVFWXl0ZDNQcjdoT0JBYldoRGNBOExjQ1Q0cmt0?=
 =?utf-8?B?Y2g3OGU3NnFMbk9xdGc2SjZXMmpkNGo3MENuR2xHN0VLTU5OdkI3bzBvM3NX?=
 =?utf-8?B?WU1SUmJ1cmJIYzZibUFwYlB3dkZTNGlFdWg4Mm1seEJGd2VIc01kc09XckR2?=
 =?utf-8?B?THlNRzYwcDMrVk5PUXZOeGkrajdaOTlNclcwdHNaZmNWRkZJL1ZhS2ZYSUZQ?=
 =?utf-8?B?dFJvTzdMdUNhVFFYU2tDdDZHNlI2VVhYSE5IWmI2cWFnS1ZDWDdTM2MvVEZE?=
 =?utf-8?B?NkoyeUMzMGZwcCt4aEp3Qjc0STBjTld6MFlPY2dic1M4Z3FqUTFqcGlqcVFF?=
 =?utf-8?B?UDIwbXpkOFJsWSt0Q3BVRUxpeEV2b2RPaklpZnh1OE9RUE9HZWduVXc3VmVO?=
 =?utf-8?B?UUFTSWI0TWp0RDF3ZCt3dW8zaFJtN2YwZGJ6Qkp5Q2doeGI3aDhaUTlBbDR0?=
 =?utf-8?B?Z0N0RjJkY1NSY085OUZ1bFU0N0JOQ3g5OGkwd3hNMFZQM0JGWkVPbkg4YThl?=
 =?utf-8?B?a0lYbWZsREwzd3VMSHYxZ3RNN3Bway9aYjVjdmEwbnRsNWhzNDA1TWNuT21F?=
 =?utf-8?B?WTJjbFVSREFFSTV0eG5WYWt4SHJQMXFKVU0yQnl2NkRHeUJJczR0NEhEMzkw?=
 =?utf-8?B?WmJQVGdLUTFYTnhzNlJ5WGJxY2d1SFBnZnk4UG9DUUFhYTMxN3Nmdk43Sndo?=
 =?utf-8?B?NmhGTkdCeGc3bG4vMmcvZHBkNlN5WTZxR2ovUDczOGRZb0RtY3RqczQ3VEps?=
 =?utf-8?B?OWdPa0xNSGNIcFAreXRMRkNZczY5Zkxmb2JBS1RUVW9aTHBGWlJEMnlSVGRi?=
 =?utf-8?B?L3gzcDRqZ0FTSmw3RURiMUdlYnFNdG53TnNXbXl1ZEVxNzM2T3lOYk5OVk9o?=
 =?utf-8?B?WDQ2R0JXckwveVVnbENudDdvSFBCZ2Vla0Q3Vm5XbnQrQW0xTHZGWjhQRHJ1?=
 =?utf-8?B?eEQxeGhCcFBPQUZ2WklZd0QxZ0hKamthNGRPa1dZMlBaVTJwcjhycHJnZy9Z?=
 =?utf-8?B?RFBKeHo1VS84OVFScldMK3ZBQ0txNWhmd0JYdEhhNjYzY3FPVHdjVFNMWklo?=
 =?utf-8?B?K2xDUEJGYy9BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QzdtOHpMM09kc3lwTFFOUnlKK2FtRFViNG1LUll1MnlTVXh6MjJURzBWUFo1?=
 =?utf-8?B?d1crT0dQbldzazIwSmhybUp3bWp0c2hHVFNDZjd6MWNvS1dzWUFRWllEOVJM?=
 =?utf-8?B?dEIrMVI5RjRqdGhHQk1WdWZCOHhsTkJ4NWlzSHRISEgyM0dQeHVFODFCWGt4?=
 =?utf-8?B?OElTSUFqakl5V0tiNnFld0tNOTFnaC9vQzFwU0tTL0dzdUEwZGFhbVYwS1J6?=
 =?utf-8?B?bnRLZmRzVjh3K3BkS3hTbUM4MW4zVGE5THFudlJaQkRsMGxXNFc2SDg4a0Zm?=
 =?utf-8?B?Q2pCa0N2Z0VEUnNVMXUvYlRhN3RPaFpQRS8xcWYwQUE3TldjQ05WV3A5cmcw?=
 =?utf-8?B?T0xUeXNyRXB6QWo5cEJoSi95REczRDRYTFgzaUlDNjJRV2l6S2pFWjdPM0JD?=
 =?utf-8?B?Y2l6VEVlcFFKS1cyRW1nS2VGa2FrOVhQZmtiY2pnTFZPRmFObStielF6dDdZ?=
 =?utf-8?B?dVhLU2pWZTE0SXRkaFp3Q2xNTHo5akt0SytvWHN3UDQ0QzVmbFBKOFNDVTVW?=
 =?utf-8?B?a2RlbEVGeGVZWktqa3FWNUJ5Q1ZwbGlwODZ4L2pCQlhtemJHbzBmZHd6UGFw?=
 =?utf-8?B?MkpZSVVGbUNmR0ZucUcxcmJ0WWt2WFdkMXUwMjJsT2NPdmp6dFpoalhXaHZq?=
 =?utf-8?B?WkptVVFMOGh0ZXA4NlU2REZVVXBCeEV1VkI2VDFmeWxBNEQrL01OWmhrNnJu?=
 =?utf-8?B?eEVhdG1RWEg2RXdvbU1GUU5OV1ZiZHJPcWJMd2NxVHNxMURKbGxwbmpTSC9G?=
 =?utf-8?B?NjIwcDVJYytkRWpVUHdQczBzNS9wcFg2R2tycWRQQjdYbG1NMXRJRTNkU2VX?=
 =?utf-8?B?OG1YUTBQTExtVHArbzQ5S3R5TG1zUmNVVHVhTjhrdGxaUGdsSEMva1ZCWGVW?=
 =?utf-8?B?QXRKTXJjRFJaMHVjaDhNMjlsTGp0TG9EMkpUSDlrbFBycWZaQjhoVkNXRW41?=
 =?utf-8?B?Z1N3eUF0MGpwUFVsMGx2cGRtalNzS3J0UTZHRTlyMitJYzJBK0VSZWx2MVgw?=
 =?utf-8?B?R01YdE8wcGpEbWMyS1F2anE3Y1F2MStRNENnamlpY3FWazgrc3Fmc2h5a1BJ?=
 =?utf-8?B?TkhpVDNNVjlsMVVVakt0TWJZUXVMdGJJRmo3TkcyWjk3cVYvTU83NC8za2RJ?=
 =?utf-8?B?ekJxK1BmLzB5Y3pNVkd5dUI5N1NycWRkdnZuY0x3MlJYcWF0TEY2bWg3cGph?=
 =?utf-8?B?ZURFT1RvYzRPL0d6THB2MWRiSTZXSmFBcUNmZWc2aHVSL1ZZdkhZL21McXFk?=
 =?utf-8?B?L2dQdVZsL2gzTUE5dTJzaFV6QVIxamVNU3gydG00aEhIdHE5UURSdFIzNm42?=
 =?utf-8?B?eWdYamJCZk1GWkhvL3NZMzZYSUV5TWVlNUcyNGY2MjBLbzVnRHYxM3dRZFZF?=
 =?utf-8?B?L1FJelBVYmVRaWhOMjdNbVdVNVhpSU9WUHRoZlBjWHlQRmxZT0F6Uk03NG55?=
 =?utf-8?B?S3RrUU93QUU0M2tuWmpkSFRjOEw4N0hVOEpvbzVuV2VWUGMyTDV5bHVqelU3?=
 =?utf-8?B?Yk5vYkJWcjVPaVp6UWJtVlJmODZSVWt4Uk44OUlzNEFFcHhuYkdURzg3WUFC?=
 =?utf-8?B?ai91SS8ySTcwS3l1Z1BKbnh4WERiMmJ4SGl3NGNCMWRCOGVsQ29oYUpjQ2lH?=
 =?utf-8?B?L2FuQXhreE9SVE91MlNFSHFiYitBS1ZEUGQwb0VIQy9kbnhaaVFYQWtlNFIw?=
 =?utf-8?B?YWxCVk5lRE0vRVYvRWtGcTA4M2hWWVlMUU5HRUZjL2M5NzgxcEN5RmZsL0RL?=
 =?utf-8?B?QzU2RjA4cHRXMVBIOWcwT2pSeWlzNEM3UlVWVDNTZy9jU3RhejEvRlR5WDRo?=
 =?utf-8?B?aVd0NE5jMjFYbEFpbUk4ZU9pL3BkSmZtYzhjTDdHaW1rekRjeCs1cUNTaWFP?=
 =?utf-8?B?UitxVk1sKzVPWE5jU21TRW0wb3dXV3Q0WHYxUFlOR2dmazdOZHdRM0ZXd0RI?=
 =?utf-8?B?b2EzM0pkZXBLa2RkdllRYUQwTjIvWXdPSkxDR3YrNXc3UkR0WDZiSnA2S2VZ?=
 =?utf-8?B?d2pQR01JYm5aMHhyZXlsUnNZcm9WNUJuMFppY1g3WWVHSGZjNG9DWXMwVWM1?=
 =?utf-8?B?RGk0bTBEc2lvZVNJMGl0WlRUN0dqWWNYbXJVaXpwenNyVmRNT09GV1djUHo2?=
 =?utf-8?B?SjhzcjZ2M0ZaaW5BMDFXN0ZjeTl0N3dLM1pYNzc1U2M3N0llNTRreG4vWXVj?=
 =?utf-8?Q?5GHgkN8A6P/QaT7JLpMJojU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dc08c1-11b6-4d0c-4680-08de341320e0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:29:49.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aauj90PJoHkbxxN+VxCgm5UDbYuSf9BbKxOH0jiEuKmSWudQePNNTBxgZR18DgqNIC25Ft5CtKeb1dGOAlbo1nZtz3c/IYrxaExyCYAbJrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Dec 2025 15:30:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8235

Hi Antonin,

On 12/5/25 3:51 PM, Antonin Godard via lists.yoctoproject.org wrote:

[...]

> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index 7d25b15b9..d753e2153 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -41,6 +41,7 @@ $0 OCI_IMAGE [make arguments...]
>        - fedora:42
>        - leap:15.5
>        - leap:15.6
> +     - tgagor/centos:stream9

quay.io/centos/centos:stream9 is probably better?

We would need to remove the docker.io prefix from the ARG_FROM and make 
it configurable but that should be easy to do.

[...]

> diff --git a/documentation/tools/containerfiles/entrypoint b/documentation/tools/containerfiles/entrypoint
> new file mode 100644
> index 000000000..97ee93c29
> --- /dev/null
> +++ b/documentation/tools/containerfiles/entrypoint
> @@ -0,0 +1,6 @@
> +#!/usr/bin/env sh
> +
> +tldir=/opt/docs-build-tex-tools/tl/bin/x86_64-linux
> +[ -d $tldir ] && export PATH="$PATH:$tldir"
> +
> +make -C documentation/ "$@"

Doesn't

ENV PATH="$PATH:$TEXTOOLDIR/tl/bin/x86_64-linux"

in Containerfile.stream work just fine instead of having to go through 
an ENTRYPOINT?

This also makes the instructions x86_64-only. I have no clue if one can 
run the current instructions on Aarch64 and make it work, but this for 
sure won't help.

> diff --git a/documentation/tools/host_packages_scripts/centosstream_docs.sh b/documentation/tools/host_packages_scripts/centosstream_docs.sh
> new file mode 100644
> index 000000000..9202afc5b
> --- /dev/null
> +++ b/documentation/tools/host_packages_scripts/centosstream_docs.sh
> @@ -0,0 +1 @@
> +sudo dnf install -y git glibc-locale-source librsvg2-tools make python3-pip which
> diff --git a/documentation/tools/host_packages_scripts/centosstream_essential.sh b/documentation/tools/host_packages_scripts/centosstream_essential.sh
> new file mode 100644
> index 000000000..e38fa93c2
> --- /dev/null
> +++ b/documentation/tools/host_packages_scripts/centosstream_essential.sh
> @@ -0,0 +1,5 @@
> +sudo dnf install -y epel-release
> +sudo yum install -y dnf-plugins-core
> +sudo dnf config-manager --set-enabled crb
> +sudo dnf makecache
> +sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
> diff --git a/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
> new file mode 100644
> index 000000000..f3b81da3e
> --- /dev/null
> +++ b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
> @@ -0,0 +1,7 @@
> +textooldir=${TEXTOOLDIR:-"./docs-build-tex-tools"}
> +mkdir -p "$textooldir"/tl
> +wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O "$textooldir"/install-tl-unx.tar.gz
> +zcat < "$textooldir"/install-tl-unx.tar.gz | tar xf - -C "$textooldir"

Can't this simply be

tar xzf "$textooldir"/install-tl-unx.tar.gz -C "$textooldir"

?

Cheers,
Quentin

