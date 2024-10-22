Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FFDD3C939
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 11:57:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.47])
 by mx.groups.io with SMTP id smtpd.web10.16543.1729598228102893680
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 04:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LUM6YWh4;
 spf=pass (domain: cherry.de, ip: 40.107.21.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFnL2T7PDjCEcWRrrvKtvoNS+o+bOPhTrY7R8amMGkgVEmhPn8bbGfXsm5bZ7ur26KHuMR+UeP9Q760fCdHTmL37vLdrWbV3REFRLAoSLx57c+mrrIuPPUo3OmGdmT27uew070XKFvD1u9Xz9DYLZtdU3gDkmUXmU6sqFaEJwsDhv2wu7tuVmsO/XuXgWDnRvNn/CZjrJz5nN+NmrtdeKU0OmeqzTnEHPWHJaftPVOCaM3kCKrG/JB3MLydVaPv0cL6DmO/9XacjRrRkqbpVmiaa1BGcZGoEm+V8HRTh1hnF4NKpf230189/P8edZXApKdy7rHsQ1EDPiz82I2zGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN15ZgVjUybIzsGe9wfFFCmhH+Q3UPwK3dKd9e4p2X4=;
 b=CQy0XQ/j+tXl6uWYYJR8BKXe6fnJEbiBs8LR7fwN4YsRPPhIa2upbXFFHnX93Gwz6Qwv6G5GVe18NydtgmGQAAjTtt96L3CJ/xDkxY0tv5xuHFa5BlsdGBuwmli09OcYPJ+AwGB21djM1FEU3PTufgNpbVmicuk127OFsTGPrNOzbrhwuBDS+QUlkrRbEb5fTvYbryIIo6cKKU54lt7rwUuBFIPmTjDadfeyABH+XzrQ74jvLbJkCNu/iRtl/agl3vsYxxR82gV0LsNzVwuE25+DJL6qccAbrGykCIS3gfmkWJFZd0hLmIiqcARLjf7wYrBXjQk9AdU95ATc2q6N6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN15ZgVjUybIzsGe9wfFFCmhH+Q3UPwK3dKd9e4p2X4=;
 b=LUM6YWh4M9cW8OlZXqOkE1Q3KXW6MQmrZqskiGRnhyNl2+JNVWT+APycKUfulioCivhMOW9z3+dA5M/pgHXlnzHaZKZnYYhS6Ws02mvImNTE7OnY+pFvS+hom/mqVNQjMnCT3lRmhIi8tELYz5JDwV7ddabo9YLQy+4yFF1AG5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VI2PR04MB10690.eurprd04.prod.outlook.com (2603:10a6:800:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 11:57:02 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8069.020; Tue, 22 Oct 2024
 11:57:02 +0000
Message-ID: <79f143c4-7d78-4090-88bb-2b0e5ec4c404@cherry.de>
Date: Tue, 22 Oct 2024 13:57:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
To: chris.laplante@agilent.com, docs@lists.yoctoproject.org
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241021152254.1745411-1-chris.laplante@agilent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VI2PR04MB10690:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2f8cce-3584-4af3-6671-08dcf290a436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TjNDeGdpeTVGbU9pd2ZKeW93RnFRU0F2eEZZVUlMeEZBTHpoYkM4Y3E4Nm9M?=
 =?utf-8?B?SGY0dkw2ZGxuZytsZnV4dGdEYzIvdGczOGViZTN4SkFKZnV0ditCSUpSMkJt?=
 =?utf-8?B?MmZnaGpFMUdOKzFZYzZqY0lTaDRuVm1pOFVEcXM0OXNHSXV0WXI2SUVLZGh1?=
 =?utf-8?B?aEFXU3J4MmRGcHVtcE5DelJDMVlFaTZhZVd1eWYyYzNWbHZBTUY3QmRlUG1k?=
 =?utf-8?B?cnpucDJhdkc0WndEZTZpVHBQRk9lbVpWTmlxbFl3c2FSdXp5T24yRkFUQTRN?=
 =?utf-8?B?Z2FNNDRWWUNLYWJ3N2cvcXQrSGExU0ZvcUp0bE1oU1VVQzJEeHBsbmxBdE0z?=
 =?utf-8?B?RngzdTF6UzRHRHJRVTB3MUdvbm5PdlRaUUFCOWFJZytuNEZCQkdSUGJVVmZH?=
 =?utf-8?B?eUpuK1laTXlreFBjdDBFbkMrZSs0UGRvUXJkL2haK1JZSDc3dDRKbEM3L2F6?=
 =?utf-8?B?UGk0bTYwMUNnSXU0NTdzZVcrR1VCOHh0cXF1MVhNT0FjWkN2Z00xWDVUVDFz?=
 =?utf-8?B?bURSRllEM1dIaVEySkxTYVcwV0liVWRvZDZLRUZPRXEwM3hWbmo0LytjOTF4?=
 =?utf-8?B?a2h6TWVGR0pMcTZDaVIySHV4UDUvQzA1T2Yzcmptb2wvVjRSVHJRVUJyK0VI?=
 =?utf-8?B?ZDRZdlBSeExDeVV5QWQ5aFhQOEZwajdnSllQM3lmUTRBRy9RU09vdzJOTmwr?=
 =?utf-8?B?UjIwVUhKb0V1RU1sc2FwQW9pTC8vNjlOT2Z0TDBvU2JzazN4cTN1REJVMGlJ?=
 =?utf-8?B?Wld0Q1B3aWRKUU1SV2FYbllWNTVNNkxlMGF6eS9TbG1KMTQydVg1VGNUYlA0?=
 =?utf-8?B?RDdhQzBTUUhLT3J0SmZsL2tSTkFrZXNYWlFxNXdPRmMzYWZIVlZRb1ZYZURE?=
 =?utf-8?B?ZDgxOEloNzJSMEh6dnBYNDlIN215YmVzaVo2Sm9mYm9iNDhGd2o0QW1BbnZu?=
 =?utf-8?B?VGxCOHVCQkRvbmcxNmVzdkZsZk95WVZuV2Z3cTJmV2R6STdjWkJOM3dwSyt5?=
 =?utf-8?B?QTdsRC80WEpPRWJVMEo2QTNaaXpDZmZydTYzQzRlQlYrK0hqNnZVZk9kcHlW?=
 =?utf-8?B?TVc3dXNvUWswUGdUdGt1UG9qMytXVDlQTG1MZWpSbm5Sb25pRnpMcm9wRk5n?=
 =?utf-8?B?cHZ5TjhXaHRFRmFJaGFrMlh0YkhJS0NPRlJOQTdyT2lrVWZBN3F0WXllMG5J?=
 =?utf-8?B?UnQvWTdXWDQyZDdockJUZlhFdzJjRGZXeFNWeEk1RW9JaFpjVU00STBqQjgx?=
 =?utf-8?B?RHFxYUhtbFNHclAzY3pLOGlYcHZ6SGp3TStXMmd0NXFSQmJpQWQyeGNmYldN?=
 =?utf-8?B?cXFDd1JiSkc0WXRyY0h3eGZSZ1FFQlN2dCtEQmVyTG02dE5mRTd2TWFJRmJl?=
 =?utf-8?B?THJqanBoeGEvZDQrUlZVVUR4V1dpd0hvK3U3K3A4blhKdWZUbHdUdWtVUkdG?=
 =?utf-8?B?eEtkaGZGVmdIK1RTaEczZURKSzJkS2pWM1NiZzA4NG5oMG1jNHM0V3pRWWVG?=
 =?utf-8?B?aEJZTkR1ek43U0duSTZETWZIUnpqQ1RGRG9ZWWxQR1FnV21QTkgxOU5lVkxG?=
 =?utf-8?B?bEEvSFg5WVA0U3dZYTluZXRtaWVVSXQ0cnBtL2NBZDVSMzVOTGF1bGo2U1Mz?=
 =?utf-8?B?YWFjQ2NsOTBwN0pLRkRuVzV2WmhCTHNITmp6WEJsYkF4RGxmR3UyYXJLRXFz?=
 =?utf-8?Q?6rt76Q33hySmo3TCGVuH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WklvV2pQTVd5UTdLdUxHSDQ0MG5maVFGUmROM1MvS3IyUml4Zklqa3JWS2NY?=
 =?utf-8?B?VDhqMUFkL0Vocml1V2ZRN2d4aVBCanpweTBCOGk3SklKSDQwWFNsbzZ0VEFS?=
 =?utf-8?B?U3NhdEg3bzdTSnlhQVdsMzNyNE1tcXdVS0VMWEdlYjRYZFQ4dzRpZ3VYVmRP?=
 =?utf-8?B?M0VWMFlRYU04TG9WVzBVNVE2V2NwY0l5ZEY5U0swaFpnZUtGeElvc2hjVTZt?=
 =?utf-8?B?dzBhQzRtM01UYTBsWDBZUmZ1NE9oejdnV2tMTHdZSGhlZzJsZzNVMHJJV200?=
 =?utf-8?B?NmVhc0EvcUlQaWtJZUIxczVqZE5oMGRsUlZ6MERHSGpvdCtBWUEveWRVcTNM?=
 =?utf-8?B?Rjgyd2F4Yk1iUG1oTlNWQU5IUjlUVnlCOWxyNDF6UmRsWXpzWnBMWTNMaHFH?=
 =?utf-8?B?dzRZSE9OcWhsbHI2eTZDY2dEcCtkaHl0L2NyYnI2ek52M0cyLzBoN2JnU01N?=
 =?utf-8?B?MnFvaW9tWHk3YTBENEIxY0dYdUVEaFJLM1ZlNXhES2V6VnRHR3RFM2U5cXNn?=
 =?utf-8?B?N1dZQ1dqVDM0V1crN3ZVMm1HWVdjT1FnVjdxQThYei93bmpXN09VV0tMRndm?=
 =?utf-8?B?c280WkdqZzM0cGUxb3ZEV0p2S2xnM2R5bUk2eDdaemozSnlRN095ZXgvOHlY?=
 =?utf-8?B?NDNYSlJzekdvTFRXcGtURWxrTGdFcGU1UUJOdCs5R05FV1JZYTErSU1WSWw1?=
 =?utf-8?B?TUl0UnZ6ZExuZERvN2gzdW03NEZROTVPdmFRVnpkK1FSaDBGbWNwYW1kZkZk?=
 =?utf-8?B?dGNvR3lhTDMrcThrUXZOS2xhazYvZGtTOHp5alFEeWxQSGdpc24rL2l0YXo2?=
 =?utf-8?B?T05lTnduM1FWY0E5a0d6aDI1MFdLY0pGdlF6eDA3SllydVZFNW5GaVdkN2ox?=
 =?utf-8?B?NzFmOHFIcVZmTWFGM0pQTlNuUmM5Wm0xNFdvVlQ1Yldyc09tT2ZMMENmOHMv?=
 =?utf-8?B?dXJ4TVVNQTROSjJpMDlycFV5MjRleGhmUDBpZHJMVUViQ0U2S014WGZ5Rm9B?=
 =?utf-8?B?bUNicjVpZ3F4aVI5eUQ0bzFoeG1PWTRFWlJUTnExTEFTNGxpNVg5ZGd2Kzhz?=
 =?utf-8?B?ZG9VQ2VKVFlYdlBTdFN0UnI5V1g1OGVrZ0ZWeWh5MGRoVnJyMExVMGFlOXpl?=
 =?utf-8?B?TXkrOXNGV3l4dDNzemdoTXFscGxxV2x0YUM0a3JZTGJnemRvYWVLWC93dU9M?=
 =?utf-8?B?cFNHTU1ndEhWUnArbGhCN0FiUUlmTDRISGd2Y0JIckxUTDczdDZMYUlMZWFX?=
 =?utf-8?B?NnJyMzJLUXdlaU1mYkFLSlUzUFN1NXFZM0R5N2QrYzVuY2xpTVZaeXF6Skpz?=
 =?utf-8?B?cy9zcHNQNVM2dHVYM2thaEIzTGhDVkQzR0xzK0dhMm5pdHlJVVMyckliTmFW?=
 =?utf-8?B?OUZsb0J4bXhuK3J5ekxNWFJncGtMS3FhZnRVeUtDaUdhRTJ4TDdVV3diVkJE?=
 =?utf-8?B?OG9pLzJOaWZMeEZDS3laa0FRbUd6a0ZpTnpKQTdsUmpmNFd3d2Q0R04wQlZW?=
 =?utf-8?B?aXh2ZnFPbWl4aXhPU1Joc044eUxvUHR3UkdMSUpVdGxhWWNwd1YzNTBwclB2?=
 =?utf-8?B?Z2ZCVkxuRjd5MGQzNnlGMCtBMGhXK0ZFbFpzUXNXZVNObUZzc0hXSXBVdTZY?=
 =?utf-8?B?a0tyMTdDQ1pYWHVCUEFnWnR6cW50RkRjL24rZDErY2JzU3c2UHg5WHRyQUt0?=
 =?utf-8?B?SHBJQmoxUGZJa3IyV2s1MnZlUlhhYi9XdWlnaFdhS0toaHF1LzBBcFg2Rmlt?=
 =?utf-8?B?UVJ5c2xOTldMTlJ1RVdWZU9wKzZwT1UrbngvaGdkQUlWalZ5bGNwVGFIM3Qv?=
 =?utf-8?B?TGNFZWlYY3J2VkgxcmdVcGpXZEpLSXFEODRHQ0d4dUpiR282ZlJBSy9CMXhU?=
 =?utf-8?B?a1U4UG5MKzd4RDIrTG95VmJ5YSt6MG42cWp5bjJtL3ozTkJQN3lzWnFVOXB0?=
 =?utf-8?B?bThpN0tTM242VTZScHRIRUFxOG5XNHEycDYzRU5wcG9lWFFKSWpvL0grYUlr?=
 =?utf-8?B?WUExdXhpNmxvWEpvY1hIaXlVUkQ0TmM0d3hZazFVdHFuQWlZdUJCMHhZa09x?=
 =?utf-8?B?UjQ4VUEzOWdCL3ExeG0vQVpRNS81V3hWdlpvL2pNdVFTQzJTSGJzWlRRZGRL?=
 =?utf-8?B?K1JxK0toZjF2MFN2WFg4UVp3SHpIMkRBTlNrVENVcVVLN25SamZlQmM3Nmhm?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2f8cce-3584-4af3-6671-08dcf290a436
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 11:57:02.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pauU4kNE0SseToohIy2Hkvi49wJxw9+CBQy7fd05cjj2R023O4IRL9YA4fAcTU8i+EfHvPK/aqjMXVDrzF4s7tc5JlxH3w9Z2PC/ilGpe5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10690
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 11:57:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5557

Hi Chris,

On 10/21/24 5:22 PM, Chris Laplante via lists.yoctoproject.org wrote:
> [You don't often get email from chris.laplante=agilent.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Chris Laplante <chris.laplante@agilent.com>
> 
> 1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2

Yes, but isn't it done automatically if IMAGE_FSTYPES_DEBUGFS and 
IMAGE_GEN_DEBUGFS are set?

We have a selftest here: meta/lib/oeqa/selftest/cases/gdbserver.py that 
doesn't seem to be adding tar.bz2 to IMAGE_FSTYPES, so I assume it's fine?

meta/classes-recipe/image.bbclass and 
meta/classes-recipe/image_types.bbclass are the only places where 
IMAGE_FSTYPES_DEBUGFS is actually used, and it seems that we're adding 
the content of IMAGE_FSTYPES_DEBUGFS to those of IMAGE_FSTYPES if I am 
not misreading it?

Cheers,
Quentin

> 2. Fix the 'cp -a packages-split/bash-dbg/* path/debugfs' step to not
>     literally try to copy a file called '*'
> 
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>   documentation/dev-manual/debugging.rst | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
> index 92458a0c37..6b5d2dd820 100644
> --- a/documentation/dev-manual/debugging.rst
> +++ b/documentation/dev-manual/debugging.rst
> @@ -1006,8 +1006,9 @@ debugger.
> 
>         IMAGE_GEN_DEBUGFS = "1"
>         IMAGE_FSTYPES_DEBUGFS = "tar.bz2"
> +      IMAGE_FSTYPES:append = " tar.bz2"
> 
> -   These options cause the
> +   The first two lines cause the
>      OpenEmbedded build system to generate a special companion filesystem
>      fragment, which contains the matching source and debug symbols to
>      your deployable filesystem. The build system does this by looking at
> @@ -1016,8 +1017,9 @@ debugger.
> 
>      The companion debug filesystem is not a complete filesystem, but only
>      contains the debug fragments. This filesystem must be combined with
> -   the full filesystem for debugging. Subsequent steps in this procedure
> -   show how to combine the partial filesystem with the full filesystem.
> +   the full filesystem for debugging. The third line ensures that the
> +   build system generates a tar.bz2-formatted copy of the full filesystem,
> +   which will be used in subsequent steps in this procedure.
> 
>   #. *Configure the system to include gdbserver in the target filesystem:*
> 
> @@ -1142,7 +1144,7 @@ debugger.
>         $ bitbake -c devshell bash
>         $ cd ..
>         $ scp packages-split/bash/bin/bash target:/bin/bash
> -      $ cp -a packages-split/bash-dbg/\* path/debugfs
> +      $ cp -a packages-split/bash-dbg/* path/debugfs
> 
>   Debugging with the GNU Project Debugger (GDB) on the Target
>   ===========================================================
> --
> 2.43.0
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5541): https://lists.yoctoproject.org/g/docs/message/5541
> Mute This Topic: https://lists.yoctoproject.org/mt/109134583/6293953
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


