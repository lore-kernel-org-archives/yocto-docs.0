Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8F9C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:49:27 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.51])
 by mx.groups.io with SMTP id smtpd.web11.84689.1754045358753448666
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 03:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IkQVX89/;
 spf=pass (domain: cherry.de, ip: 40.107.162.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C41R201ewKa1XjMjcy0JaQ0mYtDHwigmh7uZktmGEiMPYs2piSdmctiF774tCrFjlmxKCGsYf63lZdyK8bg2Hm9G9dLwIa6gSbeCmmZ84WdubHky4OGEJhcU5dncSIKFaXONf5UcBIID4okzUB3AXO5mTrqWXVMbMXujitCCxojXX/nFU/FxFaO0Q7qxTjgFhiakXSkzUTr7nwR/36nil4txkXAkKPAvsNFvLTuvXK+P3qsWCHHDQyonGIuwERcg/TaWITxp8TthWycCG00GIDoNhzG79jHu7sRjTmBkuED2LmvRZp3v6+hbLtkSqxrtgXjNMl70LS8yQW7nJZSPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vHf6EJOII7vlXf7XvN083OGjgL0xpqAnOVGUPonAOU=;
 b=JxhPuSKYCSExxNVZCluB4PAXCryRIY1xD55AlK4rDhUxXp5WtMOs8JQ3DHjbDOlhbTAnK8A4bkYA93HL3tGch00BncQYv8wiXvST0CTpVMiEAx1ShV1IP28Ezom5IyrCaXCAbruC8JMg+b76e0eCrsQHX2KwYsDewGTZwkZQHJ5OfEaTLTj3kR9vyJ9TUAvSD82usn60vU73tmkFLO8M1GK1A45CMMwruAGU+YRbSvF/9ONkmWTINxfCKNUNIeOkCSbhUCNDxdbSKFospuzwgqrBpXdUxd6QbwAECSmn428j/IL1ATnWBQXX5FMOfXhv7W4iL0CMgGxxmykNZLWiSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vHf6EJOII7vlXf7XvN083OGjgL0xpqAnOVGUPonAOU=;
 b=IkQVX89/Rcni7J85MZB0/FMFdbUFPhGDGoFRys2/LMJQr4xFizlLUAkfyUHJNaN4jWJ2tPFzNZKpDfR1nJMhadLMzczBEYl+KXoDNVqtTE0cEXI6zNsxllyL0qrxS0Zi0JDQFfJu+hFVRVSuoB+3bl/JL1kYGItiLwLyasZ+kls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 10:49:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:49:16 +0000
Message-ID: <abcc7114-c3cd-4677-bb5b-085e64ed11d5@cherry.de>
Date: Fri, 1 Aug 2025 12:49:00 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH] variables.rst: remove references to obsolete tar
 packaging
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <26fc08c0-b3ba-dbd1-af40-6de560fc8769@crashcourse.ca>
Content-Language: en-US
In-Reply-To: <26fc08c0-b3ba-dbd1-af40-6de560fc8769@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: b014c313-2cdf-4b32-36d3-08ddd0e90f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VHI5Um1KUFNSZ0s4NzUraXZzODdKdkxVOXJ5RDNFeDdtdklBeXNyU21JMlhi?=
 =?utf-8?B?Y2FxV0hNc0tqYXF0Y2dCT0FRUE1YdUhqamtHa0RCMjVjT2dnYktzTFpQVy9x?=
 =?utf-8?B?QzFmZ3M2QVI5NXlYK2xMcmh4ZWI3T3JxL1cvZG5xVEFZSndMT0VHUDc0L2xB?=
 =?utf-8?B?Y2hWai9hcHBZWTBneDhlR2tvT3lxak5FVjFqZzladjN0cFJNNE5iSWJWcitF?=
 =?utf-8?B?R21TM2g2UXlIS2hrdjBURWNGaGEyZThUTjNHTU5pcWsvY21CZ1F0NUpVZGt6?=
 =?utf-8?B?YmRHRE9MMTh6U2wrQWR3SWpvM3crVnI4cW1yTWVwbFlzaG5KVG1ESmM0VFN4?=
 =?utf-8?B?NWVuQWFrQkMrbmxKR2hJTDZBYlZ3b3Q4ZW1tYjJwbEJCQzlnRTdkbnVIaGhu?=
 =?utf-8?B?UUhldytWSE1CWmU0cnFRQjZDRUpxNFNYY2MydEtacVlPOHp3bHNIcnFVM2Rn?=
 =?utf-8?B?UWRkL1BLbWRyNU4xeU5rRm5SZ0hpbkNucktha0FWZVhDQllWQmRlTU9Vbnp2?=
 =?utf-8?B?dUlrWDJjOSt5b3JDZXozTmJKVkR4OFVySmRObm1FREdPZEgyWFN5SGZ0cTZu?=
 =?utf-8?B?eGlINllQQ29jMUlGVDltR0NVTkhXamx6YjRHUnhnNkNJaXdHcmhJN0trOUxU?=
 =?utf-8?B?aTNqK3crTE5UN25DRGZyb20vY3U3MXQ1RWYvNkJRY28xUnZUd2JyczUyMVBx?=
 =?utf-8?B?dW8zUzExWTliVkFBMUpPN2Z3eGNZd1hISHFPZUZiQnNwVWI3Y0JCNnEyVkZm?=
 =?utf-8?B?cGlxelpBc3FYS0IrY1huOUxGN1I0blQyWDdSS0RxZmg1YnZlRDg5TmVZYm1y?=
 =?utf-8?B?T2M1SXJBeWt6bWVmWmdKU3NzUlI5L0FmcUZyeUc5cnNCWWk0TmlSUXQyaUhM?=
 =?utf-8?B?NXBRK0lKeWl4NFpJNXNnaVJZQTVZbnEvQWI3T2JaaStkdlFMVTB1MFIrV2lY?=
 =?utf-8?B?dm1MSjV2MXRCZEtjdWhmeG5QR3pVVjFLVDlQTHMxdWJKNnByVk55NHpkdzN5?=
 =?utf-8?B?bTd5RXBPMEN0NThrVTZWb1Z5ell0NjRjakFtYVV5aFRjM3FxOXd3Tm5iUnZH?=
 =?utf-8?B?T2Nwd0dxZUZEbWdLOFhnQ1RLbkRTbDNNUk5aM243N1MrRmZKaW1JTnYyZ3lx?=
 =?utf-8?B?ejB2L25UYkZxSlNLUGg4dGhPUHBhQkYxc05PS3pINndFS2xOeGhkZUhKYnpY?=
 =?utf-8?B?R1JvZElUN0lNSUh3dnJoTGQ1WDJiUWxMQ1MvVmk0RmZkaW9teWFOM0Fza2FZ?=
 =?utf-8?B?NlppdVpGK3FORk5HMjRNSjVSTTFsK2VlZlJSZTNxcEFEQXdIYVN2SGk5bVZu?=
 =?utf-8?B?eGRYN09FOGZWYlU1NHVNeTg2MllmT2lCZmRFbXZ1bnRCMjA1d28wTm1Nb0ll?=
 =?utf-8?B?Q3pEQkQwVXhsak1Uam1SamJnQW5HMzdEZDgrVlVGTUhLQmltUXNjcWxrRzBT?=
 =?utf-8?B?WFBLcEsyMjBJWXVjWUhDYU1BYTRCbGNuODU0QW9DQ2Q1UGJhV1hyOFFjRndV?=
 =?utf-8?B?dUEwS0dkQUtPMlNpRVUzWncxcmJsVGpRSGw5bFdDczFzWkpnRGw5STFHWHJy?=
 =?utf-8?B?NFVaTHZOQ2pPV0ovZXFMbDhZZEZYbnFmR2RyWWVLdmpRUjJrMmFXVDB5Y0lN?=
 =?utf-8?B?QjBUbUN2TjErdHBDTmhGUlE5RTl6a2FHRFk3UnF2MkpGZG0wcTU0SVNhdm1I?=
 =?utf-8?B?WTd6dktQcTUvSjF2U2xudFlBb1FxWEtBaGgvRDJOZTFzeGZjdjgrTE1SaFd6?=
 =?utf-8?B?L1BZV2tkai84OTZ4aktnNVo2WjEyVkxLektCdUM2M1ptMVg5RytZd2xmbllY?=
 =?utf-8?B?WlZoVUpiems2U2ZaUlhiUTBuVzFvejd4K1JlTFA0VTd5SU80Q2F0cHhlVHhl?=
 =?utf-8?B?OUkxVGREcFlVKzVTSGxxMEZDZFhSeW5yLzQ5ZFgrQmNiWnBCRHBTSWt6SHlW?=
 =?utf-8?Q?x9UXOaqDWr8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1htN1BNbExRZWhlSGtGMDZ6M3BJbytYTy9iMnNKa0VuR1dSTEVtUGVON3kz?=
 =?utf-8?B?Tnd4ak13MGt0MnNOM2xvcTQzSXNkajg2ZXI1cjQ3bXdJVnJKd3M0cXk5aEgy?=
 =?utf-8?B?RVgyMzFEaTY1VWpUSzBOTGZyVU9aNlNYQndpbnVRNFRpWm4rTjZzb1R1dTRK?=
 =?utf-8?B?bk1OaWxpZnFEQmJQTGxtKyt4VlBNOEhEb1o4bFJRcldoMUYvdGt0bHVvMWFI?=
 =?utf-8?B?L1Z0ekRrY0tnMUdzNGtOc0pHUmtmbWJSclhKQnA3UmMxWTNZb3FiV1FlS2FO?=
 =?utf-8?B?U01LODBoVGswZHRxZFNjNDJpcHZMMDJhODFFWDROdEdhclB3SVJmMThTMmo3?=
 =?utf-8?B?b2pDQVEwZjdreWUyVnQyd04xL1RxQlhPRlg2ZFBhVW95dXJyZTRSRVZ4U0tj?=
 =?utf-8?B?VVk2ZlhJdUMvUlNKZUNlUWVkN1NhbjNlVjQ4dXkvRFFhRi9vNzFES0ZGMTY2?=
 =?utf-8?B?dDZNanBMWVRtQzhRTXBWcE95MjhteHhYOElUQWhReTI1M2liTmVkKzVXemZr?=
 =?utf-8?B?R3M5N1VpeitVbmRENEowQjcrV1c4ZGw0Q1FxVEdyTlFVK0NaclBENHRnbUVk?=
 =?utf-8?B?YUxsUlNjQkZCaWxYeWpldVFWVHVua01zRDVYUFZvc2NNVGQveitPSWYxN1k4?=
 =?utf-8?B?eGNJOFh2OXJKenAzcU5YM003dm1UelBtWUkxRUk4d1BOc3B2bTV5dWVMK3dn?=
 =?utf-8?B?Z2ZoZXB3WHdtTW94dmNSeWt3TktRVyt4SzJtSGY1NVpHQ2x5NkZKdFI2R2FB?=
 =?utf-8?B?d2toTEZrVDhZTDNrYU53QjYxa3F5ejhrMlpNLzc5QVM4SGVKVVIwaytCc2tj?=
 =?utf-8?B?VlVSWTZIVjRYekVGVk9sYVhyN2RyajJ2dU50Z0lKMnRNR0hQN2dQWU0yallZ?=
 =?utf-8?B?bnlWZE9obTR4Ni9BZEt0ZWRCNmpJUGYvdThYWDM5M1VyMUkwbnptdjV0Z3Zx?=
 =?utf-8?B?QmZoeFREYTh0MnBlNGNpUFlrK2ttRmRCWUw2SWNRM2dnZTlYTkNoMThPY3Qw?=
 =?utf-8?B?dHF1cnh0MWlSUHBMczRtOXlJM0F5K25XKzFNdVVZOUs3cXRkRTNqY3Q1M2F1?=
 =?utf-8?B?MWNNTUhiejNYdmlYTjF2VWZBWWtiNzBPZ0hrUHVOQlFEZnp6TWtTRUZPRVc4?=
 =?utf-8?B?em0xRDUxMExWbXIrUzFHeWtxWlZVMlkzdDZUQzNrVWZub0NBZHlwWUM1Rkx1?=
 =?utf-8?B?R2wyV1R4bE1YaGRBS3c5WWxmTnllUUhxbjZxSjdnaTdMMFBNQmZMT0F0TVVl?=
 =?utf-8?B?MnhQenpVZkIvdXoyMXpTMlI1dUUvaHBvYmZobGJMcGYwWTdxOSs1RFBhVDll?=
 =?utf-8?B?c3gwNkE3c1NBZ3BmZjZOMkZjTFBPTHEvWVplV2wwdDV4QlpCdWdVUkVrQnpy?=
 =?utf-8?B?ZG1LNEZ5QnJEcDU4bWxqdGtxaDNOeE81ejdnYmN1TUtURjlMaUpiOUp0bVh4?=
 =?utf-8?B?ckxGK2xrNCs4dlBtUjg1aGVqVmIvQU42eitnTGsyNjhvMzB3eDhSNGhiNVFJ?=
 =?utf-8?B?dTE2SUp2MEcwL0gxNFdFa3dvZFJjd0xuS0dGeVJwNlBTZHFVT2k4Wks0UnRG?=
 =?utf-8?B?NEtMUzhYdGhmMjE3S3FBYWp0N2U2QnFzeW13WWFxUXlxWmFnb2RlcW0zRlIy?=
 =?utf-8?B?SndMM2l0QzFWZHl1Qnl5ZDRMSjU2cDNJY21tTVBtRmZoRjl6MWFkWFNYMFZZ?=
 =?utf-8?B?MU40SXgvTGo2VzIyb1czKzZBZ2ZDeDdWOUd2eXpTTHd2MWdSWFc2MGUwaVE2?=
 =?utf-8?B?SkI4Si9LbFNCY0lma1IrWm1QTmtPZXFPMUhZWnNibXZjaGwrQ2RkSno4QXox?=
 =?utf-8?B?WG9JYUdtMWZoaUp5Uk9HWXFhTzRNbWhCQzdJM0pLNVhuZE5BVnZ1MlFPaml0?=
 =?utf-8?B?a0hLQVMyUitCMGU0U2ZBdkU3Q0FPTHJVdTFxWTBOU01ub04wZzd4bjFSL3ho?=
 =?utf-8?B?SjhlWmNCSG5vZ3dLSElFRHlHNUlEY2F2QjcrUlltckkvdkVsWGlFSUxqVEtz?=
 =?utf-8?B?MHZVWnZCcHlkb3hwRXdGUkZicWJRN3Vabit5RHhwSVNodFlVQWxHeEN2MWVY?=
 =?utf-8?B?MUQ1K2tobnROcFI3UU1WVWt4VFlBY0o2cDZ5WUM1b0hoSE5sTGYySGJhbHgr?=
 =?utf-8?B?YVVmemJVK01pREVrVWNSK1FPT0JQMFlLeDhValVLRFMrTVVpY1F1cnhTZ0Zn?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b014c313-2cdf-4b32-36d3-08ddd0e90f2f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 10:49:15.9924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JB8twdnX/NJjQNQiLPN2yU8iFehH4ohoC/GzRdorJqnFCo72VI9xeT1xa+WYRcN9QQdNQIyHyXKvLVHULEEf4tesUWJgEqP2atKiGtG6zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Aug 2025 10:49:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7424

Hi Robert,

On 7/25/25 12:02 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> The tar packaging format was removed some time ago. Also, add some
> minor grammatical tweaking.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Can you please also fix the other occurrences in the docs?

I could identify overview-manual/yp-intro.rst +179 and 
dev-manual/packages.rst +553.

Looks good to me otherwise.

This should be backported to scarthgap and more recent branches once 
merged as the commit (4022115a7124d3da6245f19d512ff3abe80ddd1e) that 
removed it was merged in Mickledore.

Cheers,
Quentin

