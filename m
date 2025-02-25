Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E9AC021B6
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 10:33:20 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.web11.5373.1740479596510647333
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 02:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=G7+QRXyo;
 spf=pass (domain: cherry.de, ip: 52.101.65.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoBxwFW1m/OeXLflaZeyUI4oV5dqzEzCv118cH4IcfB7awSsEPu+piHgoS1QxwPN+6vA4OXlf6PUSgWGp6HgaPqpTBYi4M70UPbFI3Fl8xms0U3sjBGKzskQBFdRvsmgnWgzxLq11HDH83GU/PcfMdapNT0E/QEFTcv3ZpyNTglvek6K/UZgjG02bOr/FagKwbyO/sgaIAEZ8kYqH2/y5BThVsWWGmUj4bnUAwRqd03X33MuRBuEmBqunzpVseGCNPVH/5lXPr9Hc0w7xa6eSaBE3mGGOtjR4nA9Nj0rTFOBcTf/ktBl3IW8ZIV25UcpKp58Kl6pdzzgr4RUJ0lSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssZ4is91iFhfKFEJ0dSDJL3+HFBF6DWps2UUloHWRN0=;
 b=FGdpOjN93VDMDxcR/7wVI02yk6CcHnHSHVacHTkoMhpS8WQiAuLKnM58dMor4ezkI+KoOdAwf3U70VzZVgIqKTMoYdBF1H0AL1mXk5QxyiCnbPcMA2d/5flqFZYjhD1hSbw0oYnUZY+3e/+1j/poxlqKC1WGQvNV0n4VnYYRhtaWci97NCFvZx7LEe7yjztLGJTasZOQlZmDpaoJrRHzmg+lt8we7BCx5PJHBy2Rx/+iCgnojLyRQ/SEl07v+0FRl7rlC7Ovqn/YL3DvYFctsbOEC1CC6yJ/3z/MawGxP9mZprJWfC6JnBUuK2yMC0uCRmGE+vm904e6BgvAlsDg1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssZ4is91iFhfKFEJ0dSDJL3+HFBF6DWps2UUloHWRN0=;
 b=G7+QRXyoZQ9DKpca6qcvFGYJumr9Cpnqc5V6Ct+KdylJ2zb0O+S8YJd3aWlWbkuELJ0m4ueU4LwKaOzwPmbefidF2+uLW3c94EBIK0pVcDq7dk/78BhPJXyRr4127htzT3sN2f4cFAYNlMKr8q7ysBDxD3fwC4Y0A5FUQXHGPcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7725.eurprd04.prod.outlook.com (2603:10a6:102:f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 10:33:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 10:33:12 +0000
Message-ID: <e919d911-0930-42c0-aa89-40f668b26fed@cherry.de>
Date: Tue, 25 Feb 2025 11:33:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual: cover UBOOT_ENV variables
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250224221630.3331182-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250224221630.3331182-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec57672-a50f-4767-85c0-08dd5587cdf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ckpJYlFsY25WNlU1VmdHV2hNUUFiQVBHS0hVeU1oRXdQSWhJUU5HTmw5dHA3?=
 =?utf-8?B?dHRoOEUzUGhJOUZTckZ6ci94K0hMeldYWXE5Yks4eFY4ejdsWVBWcWthK2E0?=
 =?utf-8?B?cldGVDlsaWJweFQ5bGpvOWwxOFJmZG9pSXhRUythRnVkMU1yUFg3NE8ycURB?=
 =?utf-8?B?a3k0V1l2VDB4KzFSNWFjQ3g2VjNNOTdESUxZeWpTdkRDSEtTYVVBY2pPOFVR?=
 =?utf-8?B?SE5aTjVOSlZCYW1LL0twampLekxVZjkzUmdLSi95T0dFVFc0T3BPcC9mMzlM?=
 =?utf-8?B?SFR2dmFkZDN5SzlEa0hwaW9odkNmb3djRUVNVURsaW8xSUF4UjRUVURnZHA3?=
 =?utf-8?B?U1BET09EcGpzbU0yeHZpWUpFbWhCdCtNWUpyV3RXUUFuZE1XcG1PQ0xPOEg2?=
 =?utf-8?B?OXRiTngyVU41ZWZFMTNncXhTR2RaL2tOZFpJczdyeGVJZ2NYZTVraGJIbmhD?=
 =?utf-8?B?ckxubWdzblN4aDRiOUJuenlwSDlTYzY5VmRMblYvMUJ6SUM5NDVrNXgxQWxZ?=
 =?utf-8?B?NHAxeGtrNTRQcTFxbDI2eEhGWEVFS1NtOUhQVFkycGlsWmRwSXI5M0FkMlRv?=
 =?utf-8?B?MU5paHd4eXZET2ZObEFqWERoQTFuaFZsRk44S3hLdFBGQTY5cnBBN1pJV3ZS?=
 =?utf-8?B?d0R0YStMNmhwaitEZDhjRWN4RTlBN0tGMitDWllmeFkxOU1WM1Q0dmsvb3Z1?=
 =?utf-8?B?Yk41NnpIWTRjQnh3aGVnRGlGRGtUNlEwYUNCeExScys2Q3gxcGxWRnlQVFFC?=
 =?utf-8?B?MnN6N1gzRzV4U3lsV0J2ajM4Vk5ObFVGTGc1aituRHM2TFhmTWJpM1lTVS9u?=
 =?utf-8?B?UWdnM2V1NFRSbFcwRlVlbnJPY2FtOC82alN3MWpvUzdxYS8vWEwvVGt2d2Ix?=
 =?utf-8?B?TXN0Uk9odmkwN2Nhc3Qvalk1Q2JoN20vanhEUXphSGlUODJicUpYSHZzQ2dr?=
 =?utf-8?B?MHUvd2JVQVlWb0Q5RFphbnhQd1BJdW5rS2N5VzJpNjdFakFld1JZQk5RV3Q5?=
 =?utf-8?B?QkZHcDNqb3kvczZqUk9FMWFwbW5tclFuVHVCUk5XeDNNYi9Yb3Rvc2RaaG1w?=
 =?utf-8?B?cGFKUnR5ZmNPYVlDU20wUGtYcUlHOWF5ZVFWYUpUQkZEVmNreVNsMkhpcEp1?=
 =?utf-8?B?Qi9xQkxLMGt6Nzk2eENMdlFUS2ZIQjZYUmZnN3pKOHpmbnVxS1lDem5EWjh5?=
 =?utf-8?B?cXF5c2cxcjREZ3JoUDQ0dTF3ejJkMFA3bWgya25UZDVHc285dFBGS01yL0ND?=
 =?utf-8?B?cEJnTUZmOS9JZHlySVNQbmZZcC9qSTByN0JFdUkxUzdKUkdlVkNXSUdLQUJG?=
 =?utf-8?B?d1ZBOVd0ejMyM2VvSUhWZnpORnNmRkpXcFVKOWhYRy94dDNZUmVkSkVZM2pE?=
 =?utf-8?B?clg3TndMcXc0STJHdi9qWXQ4a0ptNnlTcjRYaGZYMkdoMlVkU1hIUitIK1Y1?=
 =?utf-8?B?dVJVVTc2R1pTbWVVdURldUh1WVJncmhQM3J0bURCU0loRktBQU02L1dEd1hw?=
 =?utf-8?B?NW1Bd0FyM2RqQ0EwY1NhNVM2Ym1xcTNiSC9ERVg4Mmw4c2Y3Q0RiVDEzeEpF?=
 =?utf-8?B?UmIybGdSQXYxNzFsNUpmTUxNZDM2T0JteEtJbkU5UHZwK2xNYy8wcDhPTThX?=
 =?utf-8?B?YnF6TmRqWFBEcjRwUnN1MXdwd2J0S0xFSDR5SzZ2Y09vd0FWZVRxN3ZhelJn?=
 =?utf-8?B?ejZnL3llSzdzTTNvMEUzc1JhSFkwWGQxWUhWaGlmQWl6b2ZuYkZZS2NZVmlS?=
 =?utf-8?Q?h8CLpI8iSmernZKIbilOKHmNoVa1BJ2upzg3uEe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T2prUWRTVVZEd3FxcGQzdXp1WTQ5YUQ3ZTd6bzFjcTFodG5mTStQYnVQS1hp?=
 =?utf-8?B?R3I5MW9Jb25Ed3JmNWZubGx5b2FydGs2Y1MzRlRhZjNWR3lXbDU0d01NdVpY?=
 =?utf-8?B?WFBQc1RkU3pPd0h3U0JFZkVySmVKdFdpbEhPT2luQ3JZR0krQkgxbE1aa2JC?=
 =?utf-8?B?TytrQ0krMnUwUmdOY2JySjhnMHJLZWFyb1E1OGxodEJzUjc2YnBtRVdzNitI?=
 =?utf-8?B?dVdvdU9zZFRmOUlBMEx2d0twSC9FS1ZvZ3h0OVNQK1dqb0RiMkhkSnpVOUtx?=
 =?utf-8?B?LzNTVDliMUlPQ0g0L0pIWUtDUmtaNkhrRFpWeG1WMStqaXZCZHM4MVpqUTVN?=
 =?utf-8?B?aXNUREd3ZE1ZUDlBMUpWZ21OZjB6cWNybXd6Mzdtdkg0ZEhnZVk3RFp6YldR?=
 =?utf-8?B?bFpuSmNSM0gzdXN1bGxmM2Fsb0FHek5JeXZBUGtsd3pXMWFjcUJHWG10MHNU?=
 =?utf-8?B?c1I0VjZEMWJNTG43Vm5VMnkrWWJySTdnNWtHbkp1UlZyUElFSUFaSlZjZjhh?=
 =?utf-8?B?YkEyaWFocG1BUlYzbzYxMHFSSjhMNVRxMUl2Nkd0Z0o0M3pEd2FGSWZ6RHNR?=
 =?utf-8?B?RkQwRGp5cGJqODdBaHkxYUtXSFE3M2U1QVFXdy9FSnJGTGJmaTIrUXJ6T211?=
 =?utf-8?B?OXVsc092SEp5TjVWNFcxSDFmcGdraWwvaFA2N3Y3UkFXbHBmR29kTTdmY0hv?=
 =?utf-8?B?aFZDUUMvTUVjNE1wS0NuMjhoWWl0UlpMTjBueHo1aWZyTTJmR0d6aGR5MEpy?=
 =?utf-8?B?QzNzNW5GbG9qUUpuc29Mb3FjNmo1RmtNdjlITUNGUm9DTVZBNmFYWkFKazRY?=
 =?utf-8?B?ZUErSzdtOFV0K1ZoYkw3azlQVURCeWZNdnZBL1Z4VGNRRkdGbGIrTDVpYmh1?=
 =?utf-8?B?a1BDQ1UxY3BBVDdiYlNBemI2K2dTZDdLbzBVeFlUZnFLOW5lYmVsSEFzemxU?=
 =?utf-8?B?c2pWOUswQmhDeUVCVGljK0FEL0lqalZuOUkydDc4RzU4WEFmSkw0VW5YY3F5?=
 =?utf-8?B?WVNQdzNJRzA0Q0UvTGc4dnQ3NWNPdk5xTkNoRExndy84M2lNOHMrelcrTE5P?=
 =?utf-8?B?M3p4Uy9seURYSTdaRTRUK1VLSnFqWEpTSU9qQmhicDkralgzUzcxejQ1S3hK?=
 =?utf-8?B?N3lJa0kvRkxWQmFKQlNBeUVOUmVpL2huVXhEY0twSXp3N2FzdTJ6U2hteWVa?=
 =?utf-8?B?bU5wQkpWMFJpYm5JMk9PK0NSTzl6eVIvNFB5L3ZtdzlXcFBtYWh0RU0zVHZh?=
 =?utf-8?B?U1UrYmRTVTM4MkJKbzcycWhzWVA3anhpdXY1N1d4bFR0ZnNTR05JM0F5b2JP?=
 =?utf-8?B?OHFUZmpGL1BjZEpnMTlHVlBydmZWUnRnSUdNRWExaUtMc1V5eVB4ZXh4QU9Z?=
 =?utf-8?B?ekJxSkZUY2h3dnlVZElDb1BzN0M1V2N2UGJYdmRLTVk0TmpTMEF6bGtWbmV0?=
 =?utf-8?B?aGpKU1N6WDROV2tveHh3cTk3aHZ6RldoMS9veVMzUG5yeHJZV0NYbjA1ZVNY?=
 =?utf-8?B?RnJyWEppRTRpTkpQOGVDQmJPbDFDS2ZmVnVxYTJLVnpLVkZqcU14TnQvZm0r?=
 =?utf-8?B?RDE4Wk5KN3hGNTVYbExTczJ2OFMvUnlCa3FIeWZ0Q3BNQ2ZEN1AvSGhPTzdS?=
 =?utf-8?B?OFhVdGM0ZkxrL2MwVGRJOGdCa0JlbGxxczBYd3BqcXhablVFYWJFd2ZGTlR6?=
 =?utf-8?B?ZXIweVliZ25kaEZBYzV0NSt0Y2tDN2w0UC9Xdlk4d2JpNHBweTNVL28xUjB6?=
 =?utf-8?B?emIwWjhqYUZzT0h6TloxS3U1ditTUGJSUzcxMFpQaWNYaDRtUzB0TjczMXhO?=
 =?utf-8?B?V3FhL0hrcTBRd3VFMFRvZG1iUGNWTE9NNmVWOGxMMG1VRFNCTHBTcGkxeDZ0?=
 =?utf-8?B?RG9wRzg0akRXUWRmZmwvVndrTUtHL1NlaTczbEl5UzJxbkY0NFdvYUxyUHdF?=
 =?utf-8?B?Z3p1YkJCbzNicUQzcFhxcnI3OWZnSWljR2h1TW40T1hrMlNoaTdLV29uZ211?=
 =?utf-8?B?eXg3cTNxSUtYNlJLWEZTWlVabWlNY1BMTVlTMjR0TXVhVzBrc0ZPVDlXanBn?=
 =?utf-8?B?dFR1M2FLTzEzdG9NVkhXMFhIMkIwenI0RTNocFhvaURHNlVVbkxEZHcxNXIr?=
 =?utf-8?B?elBkUlFDNjZsWkxKQi9iYm1CdEd3bWo5eDJ2Q05WbGdmK1AzVTMyRkI5ZDJI?=
 =?utf-8?B?cEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec57672-a50f-4767-85c0-08dd5587cdf7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:33:12.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/m84mkjKX4GueqJljEnbzfcln1EDTzUTdLvVnpJc5kRpTwpE3sBsqb2YJcQ1HUdPbWbuyKKiN8/2LHk1QKWKSHfTFK08XmbPpeBGlNhdz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7725
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 10:33:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6447

Hi Adrian,

On 2/24/25 11:16 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/ref-manual/variables.rst | 62 ++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index adbef69d8f3..b432488a012 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3180,6 +3180,30 @@ system and gives an overview of their function and contents.
>         The default value for this variable is set to "2048"
>         by the :ref:`ref-classes-kernel-fitimage` class.
>   
> +   :term:`FIT_UBOOT_ENV`
> +      This variable allows to add a U-Boot script as a text file to the
> +      FIT image. Such a script can be sourced from the U-Boot shell.
> +
> +      For machine configurations needing such a script a
> +      ``linux-yocto_%.bbappend`` file should include it in the :term:`SRC_URI`

FIT_UBOOT_ENV isn't specific to linux-yocto recipes, any recipe 
inheriting kernel-fitimage should be able to handle that no?

You can see just below in FONT_EXTRA_RDEPENDS that we specify

When inheriting the :ref:`ref-classes-fontcache` class,

So maybe we can something similar here?

> +      of the Linux kernel recipe.
> +
> +      Example:
> +
> +      -  Add a script ``boot.cmd`` to the Linux kernel recipe::
> +
> +            FIT_UBOOT_ENV = "boot.cmd"
> +            SRC_URI += "file://${FIT_UBOOT_ENV}"
> +
> +      -  Use the script file from the U-Boot shell. This example loads the FIT
> +         image from a TFTP server.::
> +

Remove the trailing dot.

> +            tftp $loadaddr $fit_url
> +            source $loadaddr#bootscr-boot.cmd
> +

I think it'd be nice to explain that the FIT image node for the boot 
script will be FIT_UBOOT_ENV prefixed with bootscr-.

fit_url is a bit odd since I don't think tftp supports URLs? c.f. 
https://en.wikipedia.org/wiki/URL#Syntax

I think we should use something like "$fit_tftp_path" or something like 
that? IIRC, it's relative to the root directory of the TFTP server?

> +      More information can be found in the official U-Boot documentation:
> +      `U-Boot source command <https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image.f>`__
> +
>      :term:`FONT_EXTRA_RDEPENDS`
>         When inheriting the :ref:`ref-classes-fontcache` class,
>         this variable specifies the runtime dependencies for font packages.
> @@ -9777,6 +9801,44 @@ system and gives an overview of their function and contents.
>         :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
>         used in creating the dtbo sections of Image Tree Source for the FIT image.
>   
> +   :term:`UBOOT_ENV`

It seems that most of this is specific to u-boot.inc, which we usually 
recommend NOT including from third-party recipes. Maybe say it is 
specific to the U-Boot recipe in OE-Core? @Antonin, an opinion on that?

> +      This variable allows to add additional environment variables or a script
> +      to be installed together with U-Boot.
> +      This file, typically ``uEnv.txt`` or ``boot.cmd``, is installed in
> +      ``/boot`` as well as copied to the deploy directory.

:term:`DEPLOYDIR` (where the recipe copies the file) or maybe 
:term:`DEPLOY_DIR_IMAGE` (where the user should get the file from)

> +
> +      For machine configurations needing one of these files a ``.bbappend``
> +      file should include it in the :term:`SRC_URI` of the U-Boot recipe.
> +
> +      If the variable :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` the script is
> +      packaged as a uImage (``mkimage -T script..``) otherwise it gets
> +      installed as it is.
> +

Can suggest

s/as it is/verbatim/

not strong opinion though.

> +      Some examples:
> +
> +      -  Adding a script ``boot.cmd`` as an uImage to ``/boot``::

s/an/a/

> +
> +            UBOOT_ENV = "boot"
> +            UBOOT_ENV_SUFFIX = "scr"
> +            SRC_URI += "file://${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
> +

Isn't that UBOOT_ENV_SRC directly? I think it'd make sense to use 
variables made specifically for that instead of replacing it with its 
content. Best practice and all :)

> +      -  Adding a script ``uEnv.txt`` as a plain text file to ``/boot``::
> +
> +            UBOOT_ENV = "uEnv"
> +            UBOOT_ENV_SUFFIX = "txt"
> +            SRC_URI += "file://${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"

Isn't that UBOOT_ENV_BINARY directly? I think it'd make sense to use 
variables made specifically for that instead of replacing it with its 
content. Best practice and all :)

> +
> +   :term:`UBOOT_ENV_SUFFIX`
> +      If this variable is set to ``scr`` the script referred by

s/referred by/referred to by/

> +      :term:`UBOOT_ENV` gets packaged as a uImage before it gets installed.
> +      The default is ``txt`` which means the script is installed as-is, with
> +      no modification.
> +
> +   :term:`UBOOT_ENV_SRC_SUFFIX`
> +      If :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` this is the suffix of the
> +      plain text script file as is it specified in the :term:`SRC_URI` of the

s/is it/it is/

> +      U-Boot recipe.
> +

This is not alphabetically sorted, UBOOT_ENV needs to be after 
UBOOT_ENTRYPOINT, then UBOOT_ENV_SRC_SUFFIX and after that, 
UBOOT_ENV_SUFFIX.

Cheers,
Quentin

