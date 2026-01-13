Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9088DD2D0F9
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:11:32 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58743.1768309883010590973
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=geNuNVIF;
 spf=pass (domain: cherry.de, ip: 52.101.72.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trgnvn9UPxCcYSAnRs9xJB6Yij48G0bBhMB2V8LZgWY4E8OVIT37doz00W/ORbZbZ6WdQJubIp9DjfXVehW6sGtFB9h+/ACYRpePHBFZ4Ymro3nA0WwAw81DG241BC0B5yl8CFBu15rsHW9JplkZUkpCdGS7rQq1+JABWbL+QqyGdHGJOSdGyMjh6AqC0qU/i5V18mZMmEthlZ8epjQHJnmG0Dqny/moA0WJxW/FQfBQSZQsiiqe/D4Un5ePX+8JTUMgTLFC2VoTmY9dE15gfrFYivqDqOPtNue3b2w8D2zM/U6WvOBAh5/30AwsDkW3Ou+svty+D+slpiXPS/o6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrZlvL1oZF02/SfruO4t+PrBNRXnULB2T6bqOKIwJLU=;
 b=TSMmVD042EbkhGWUvEXkVedqA3c/qF93iegu9lqBF/+TwGzyz4gNeOrVmo/PqQzp8uNp2Lxy+pSaTPMWy7xZ0WqdassvcTDNY+eoEo4Pzp94ENxyjA5Uy7AWbqTIwHt5wItKu8YrODDYQWBkGJF8HofWFV8+qFLg3Pc1i/CfP/G8LpoZNV0O+N2D44X3P+ujpGjxqdl8Y7Qgwda5wXp2+TZpTr8TTrv5Se8E6aAfO3BwpYNO6eEVvwvheJ4inr0ATyXtdB5K/qkAMv9SX9lHxGv4Ix6r9Z/EuGhWNFPhrj/MsSrfo0Khmz5dP6ND3iEjkxoF18bGSjz6+QmOlOAaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrZlvL1oZF02/SfruO4t+PrBNRXnULB2T6bqOKIwJLU=;
 b=geNuNVIFlLV0f9vOckKFWL7vEHy4lQHdwzYL7ZVtdecMQzNO6Yj7eQxnWAyyP+Ih1WZnNZpJq8O9wlQCKX9p+Kv/XzvaikyyqbmjGHSJxwA0feFUknQ3EnckxB6c0/UXX29OLkikWhrqdKPEuSQNBP6XbvZMFKw0gOYBerB7Jc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:11:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:11:18 +0000
Message-ID: <a330226c-b721-4921-929b-7b2acac5bef7@cherry.de>
Date: Tue, 13 Jan 2026 14:11:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 15/53] dev-manual/securing-images.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-15-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-15-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::6) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 70493053-8218-4cc5-6fc0-08de52a53d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZTNySjBPYzlUZjY5cnpsQ3FubkhERDB2bVJORW9XSVk3Q0J0SW1xSStiL0g3?=
 =?utf-8?B?bFplQWMyUzhXZi9yTjZpMHkvTWR5Q3ZHRzFZRVdneUtVSjEvMEFTZTkwcE42?=
 =?utf-8?B?dHFySkprand3K1BjMzlkME1ZVkw2VW9qbktJZG95NDRweWpBMTFpM1BNSGRz?=
 =?utf-8?B?UW5GUk9UUVRpWWNNdHhUOTRqUGdiZktPSkVGUldCcHlHa1FXWHhwUW00dGdz?=
 =?utf-8?B?dzd5bTF4ZzF1WFhIMVk0NE9KM0hXRGpCVVBnNC9KT2t2NG5zd0FWdGhkZVNL?=
 =?utf-8?B?MkxnMG1NZVo3eFM3aUEyKzhIWGZqMzJmWUJsRkZYbzg2aUg0NDM5M2tjTlU3?=
 =?utf-8?B?SWswMXBtWlhjUEovWUxPaC8xUHd6WlV5VlNkTzdndXFMbDdwZjlCT05sQTJI?=
 =?utf-8?B?eGN2VlNXYW91QzlKdW9vclBySHR2bFg1WDhNeDBzcGhiRDduY0V4Ky9qaU9Y?=
 =?utf-8?B?dDJBRTZZZ3l4WStnRFhmL0syQzM1ZmowZ1VqS1ZJOGo5c0FUV1lmanlHSGd3?=
 =?utf-8?B?QU1tWC90cmZhbm5WYjlLTUk3UnZDbkdvTUpjQTU5K1dwQWZTampIdWhxZFZh?=
 =?utf-8?B?eUVhbFRjWGpDQklLOVBwL1FDRVYyZU9TeGlTeXlaV0dVQTVTblhybGUzM0Rm?=
 =?utf-8?B?eFRkN2wrYVlrZzVvL2FzcHB1TnRUYVEvMFQyVVcxUFl2cE1mbEpnM0x3RnZ0?=
 =?utf-8?B?MHFZeGtyMWs0bUxrNzR2NDYxQ3VnWngycjJMQlE5bHJSMlN4enFuTHFQbFlW?=
 =?utf-8?B?Zjh2c2tLNi84V25Qa3dCQ1oxRE14TUNKMU04eVh2Rm9wbm1DSW4yZ2l0b0VO?=
 =?utf-8?B?ZE5yUnZ3RDF3Vi9WTXhSRU4xTkE2L0U0RXJSZ2psT25Sc0JEME5zem1IUXVT?=
 =?utf-8?B?MCtiYmdINjZSRFNUdGV2aURYWHJNWFBoeEdjQnlidHdOL3BGZkVMOGgyZmxY?=
 =?utf-8?B?bGhUUlB2N2lKdUFIWk01bWxhSXVRemMvQUVMNCtLL1grbXhoYnFybnUxL3F5?=
 =?utf-8?B?OWczbWY2QWhEV0c0eWhudEM4a2pHb2sva2tHZ3NtRjRNZFVzb0doMHh2WVNK?=
 =?utf-8?B?b1dyYUJXSDhPcjE3OEQ1QXp5TEEzYU5FYVprR1BnUGxNbFB4a2Q2bmh4QjdJ?=
 =?utf-8?B?eHlrZW4rMzVCTFBwVHdDNE9TRUNWRG5CajlpL1d5QzN3WXNZL0gveVFDZ0Vy?=
 =?utf-8?B?RE14T3BYSmhKdzNLVVdkdmNNY05JS3ZVOHZ4VEhQTUdLaVhKMWdRSDBHRGVZ?=
 =?utf-8?B?Q1FMbVBGcTdMQjAvT1kyZG13blJxMWt6Ry9vRkhyWEQ2NFEwQk91WG1GUDZn?=
 =?utf-8?B?M3ZGRU9Ec2ljR0k5bmZ1bTZrSlBKY3pFZzVIaUtIUDE0TDR3R3RhN1QwWGx4?=
 =?utf-8?B?NXRQeXM0cnQvWHdQY0dvTjRHb3NNcmlzRXhKYW1UR3ZMT25mL1RkYm9lNm81?=
 =?utf-8?B?dk1OV2hmbUN2L2QrOGVqdGNYTERqQ0kvZE1kNWYwNjNiMi9ldjN5ZC8rM0JD?=
 =?utf-8?B?NXpQd2Jkd2NabU1vbkxkb1Q4WDJ5ODFSSUt1U0xQZGRXWUpHSFlUZkdpUlBo?=
 =?utf-8?B?MUtiVFJHS2tKblBtYWVBdzlLQTR0TkIveTNTQ0hWTlMwQmx5RkJuTzg2dzVO?=
 =?utf-8?B?UXNVaW5JQTRFdk53OSt4a254bmQ0bWVaeWlSYnVGL3NwNVk4KzdUYXJISmV2?=
 =?utf-8?B?ZmxYUE1vdEs3alFNOWF6ZUVVRjJ4UGdBSmdVWW1KNmc5Wlc0SjkxY1o5b1pX?=
 =?utf-8?B?dUpTTVFNUFg3NnE3Z084YjNnY3ZsOUd5TUpFT204NWpKYTBSMWNiaDZiN3lW?=
 =?utf-8?B?bXNUVFgwOVZKK0hPOXNYdEc5UnFYcktvQ294NkNNWTN6eG5XTXBiWFRwUnF5?=
 =?utf-8?B?SXJsRDNObHFLWHI5MDk5dkZ0eHhjbVMyWGUxd3RFRnZud09pTlRGR0ZqaC9O?=
 =?utf-8?Q?xtXZx89vpDfFd1WBFNMPHKkvx/PweSxl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXBtZ09iczBjODJUQUs5REYrSm1YNkpKYzNFdndnRzZJREgvUzNZejVXR1ZZ?=
 =?utf-8?B?Y1pmTDRsOEsrc2x6SnJmM2wyMXl2NTRhU3N1cVhNMmdidWhJM1R2Qm9PQ2VO?=
 =?utf-8?B?Nng0akU2VmliZG91K25WZ1ZuWkMycG9SVHVCaHdGM0JheTdaQkFUcW56amdL?=
 =?utf-8?B?UVNsSXZNZnNsbTByOGlpRkRaN2QvMFE1Rkl5cFphRnpkTUM5TkRVbk9GOVZv?=
 =?utf-8?B?d2NCK0VaVTRSQkdBTTRXcnBJdStrRDZ5RFRGU2pBaVczWlo0UytzcEx6TjBx?=
 =?utf-8?B?RHZ5M1ZiZkdGQ25pVXYydTlyUExUcXc5bDFjK3hmNmd6aHVIK0tCeGxHODVj?=
 =?utf-8?B?MUIrTzNHSUlCOC9mWkdUMEI4R1RHWk80c3R2OThtZE1hYXROc0xqQTZ5MzdL?=
 =?utf-8?B?UHBiVTBlOGtvWHlhdWs1WFM4QktXZjBZVjN4MlNXaTRvckhCT0FTcjhkclNi?=
 =?utf-8?B?K1NvK1l2RVhWZDZrT3BDWmxYMm4yOGpUaGFkQnVKMzFTWDFFNzlnZlRvdHk5?=
 =?utf-8?B?Z2h2MUg4dWlsTUlPdnprOHRpQ3pLazY4WDN0cC91QzdOcTNWY3o5MzNpcjU4?=
 =?utf-8?B?ejE3R0F4aUhhZmhrTXpGL3NDZC9VaVhhYy9rTHRpYlFRUWtFN2FYNVgrM2cz?=
 =?utf-8?B?WEJmVXJkWWQ1Rm1UalJmZU1NeXZJZXVEN1dKclFxNkdXckNXNVJieGc3S0FN?=
 =?utf-8?B?NjVPUVdmdVJhc05NaW1RNnN6WkhEMmxUcjVONWQ5RUJidnIvNDgxOERZWVpX?=
 =?utf-8?B?cWx5T0JXSjYwTC8zekFsQWxNZnFycGVRVFNCNzVOSTdRZ0FRT2JtNU9SYXJz?=
 =?utf-8?B?Z3pPc1N0Y3V3SGY5b2k4eHJHbUxBN1FIa0lTbUpHSmVFdm5LRy9ubHlHWEtX?=
 =?utf-8?B?aTBlWDNLQmkwc3VxWk1pelJETXNzNkk1RG9KNUZGSUNQaGY3d05DeVZMbWNU?=
 =?utf-8?B?ZWRiQWw2bTB1TG50MU9jN1NENXlVZ2UzaG9Fck5hM01sTXA4SmFoUTd4UEFS?=
 =?utf-8?B?cmRyVGdHTHNWMkZjcTh0eVdiNFVPbFlrS1htaGE0N1hRY0huYlRETUZWeUhR?=
 =?utf-8?B?d1d4QUpJdWZ2MWVJR2FtVHgvNGM0SUZoMXlQdGkvSTRTWk1oQWw3dGVyM2J2?=
 =?utf-8?B?OHZuclg2aDhqbm1rdldUT3MrOWRxNEVhWmswYjZhRnVRWHR2KzVPVHhWL3RC?=
 =?utf-8?B?ZmhPS2tQV3RlNDIwbXBwRXJINjYxUnhRSUQ2aXVsR1czYlpIVWxWQnFZdWFM?=
 =?utf-8?B?NjFjTVVHb1N4MmVjeGNtRVlhaGd2MThQbVpSUWs3L2pxdzlNRVpoR3J2SkFn?=
 =?utf-8?B?Z21CNDZVc3hLLzZkMU8wSS95QVQ5a05YWmU3M1JXVy9XWnV4eGl0N0RCZkFV?=
 =?utf-8?B?QjlsNHMrVDhwWmg1OUIzZjgvb1RBRVlyRFZYNjc4YVVLTm5OMDVVbWVOSnB0?=
 =?utf-8?B?RVpuZVZOOVVsUktZbjZaTVFJRktzVElNZXhsQm5EdkExY2xVOGlZS2ZWbzZl?=
 =?utf-8?B?c3dBcXJsVUNjSXpyK0kzcnpEUXlBclRnaUNhT3ZpRXpvMmFzQkRYdlJxNUph?=
 =?utf-8?B?V2NwVlNUZ3pFRnd6Z0FnYmxNMUJDcEIza3I0NVFpOUJLS2k1M21yVlczME85?=
 =?utf-8?B?dDRwWkVud0ppSy8zRE9mWUluYW5JbDB0YnFPWWtOYmNaOThZYnhIUkJEZmxt?=
 =?utf-8?B?RTd0MEJRRTYraDdBZmZqaXZLQUJyMFRoR2x0bW9jeEZJVmJCdlB5YTM4dnpm?=
 =?utf-8?B?WWUzcVJRU3l3dlBWQVZwQ0lnZkkyZHpHaEdGRVExYkw1TVl3SW9RYXRjSm1P?=
 =?utf-8?B?b0FHWUROMGo1c2QzSjRHQzcrdWEwL0lmNlNhY2J6V3hYdVMxRExqRDRpOHF5?=
 =?utf-8?B?VDE3S2h1dWorNUlFYzlzajhGWUJJR0NMN3pKUGs3anFYYnBDM0o0S01sSDhx?=
 =?utf-8?B?QUZXMHZFNWZTQjQ5OGhUNnBEK0FxOWZneHdGK1lOV2JxaXBqc2g2QllmM2VK?=
 =?utf-8?B?bkY3L2V4UUVOenNxVnh0dmVNQkk5d3ZsMEVxMmh4dEloQ0FwTUlhaExMOW1U?=
 =?utf-8?B?QitEcVZHcnNYUWxIa1RSMFJJMytYL0U5NlRIYmpYdVQ5K2xyM2JnMnN4b0lZ?=
 =?utf-8?B?YWtSTFNUSEdibGJvSWk3blZaNHQ0Vk9oUnowZ2JqTXYzZGxkTEF4ald5UE9U?=
 =?utf-8?B?czdMTnFOY2ZJRGJoSVBGT2VTODVRZ0lyaGJENUpzbVA3d1BPV0czY1VOWjM1?=
 =?utf-8?B?V1BMN0xZUmdtaGltR245QTN1QzkwcytzeDJXWDcxR010ZEcxbU5lTXhUemo2?=
 =?utf-8?B?OFNVZ2psYldXWVpSRUZ3SXVJdSswVGkyOWdZNlFxaDY4QjlSWUc4Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 70493053-8218-4cc5-6fc0-08de52a53d71
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:11:18.7959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/G+GzbtHhQF+9Xg170sQle7vNyqByLL6I/2iNA3dWwILSUKMJ6J1JHvEGf0tbqtHLD+CbtWrM2XSjTC3RvEUUf+Rhagh0NzDOd2Qlo/beI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:11:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8504

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/securing-images.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/dev-manual/securing-images.rst b/documentation/dev-manual/securing-images.rst
> index f4b528e55..31c945367 100644
> --- a/documentation/dev-manual/securing-images.rst
> +++ b/documentation/dev-manual/securing-images.rst
> @@ -66,7 +66,7 @@ more secure:
>   -  Regularly scan and apply fixes for CVE security issues affecting
>      all software components in the product, see ":ref:`dev-manual/vulnerabilities:checking for vulnerabilities`".
>   
> --  Regularly update your version of Poky and OE-Core from their upstream
> +-  Regularly update your version of :term:`Poky` and :term:`OpenEmbedded-Core (OE-Core)` from their upstream

This excludes BitBake but probably shouldn't. Should we simply say 
something along the lines of "BitBake and your layers (e.g. oe-core, 
meta-yocto, ...)"?

Cheers,
Quentin

