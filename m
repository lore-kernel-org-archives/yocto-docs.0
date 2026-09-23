Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726ACC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:17:50 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3727.1790158663760136214
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 03:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mhshJoix;
 spf=pass (domain: cherry.de, ip: 52.101.65.14, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CA2W2py69lEEx1VYnyPmyC5B5qeDPVRbahaD350Q1LDhVA/ksSzfssNXUJdowBimcPEwtNkK8+Yi7xF+5U44HfR45yLpcKKHiiLn58jNd7ccm57NCtuVSNe2HyoDw+H+k7a/n+1mkIDKxIu9Q7vHFEdOtZnJW6bn0hSIE0SMWhuOaSFlK+jZidReaqKEIS8Wje1m96f371/zSdJxEeWv/35jH/SiNiz7sTRakKe6d7BasP+lbVsVyWOAQJJLReO2L38VGWvgoAg9vZeSn3XJJL9J/DCh1oZRUM6uWU4wxhfAtfVfyHgMkuZom1I0AellWNFl9cA/+gT6475prXslyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY8lxQrCMi0uQAUJIFFg8hITpjrWJydzq76roy+jugg=;
 b=HwlWpphvWNuaEc8jI/rY0VecF1f1D+ijSxfSUa1EoLSmmEdFBadW7/OPauiMWauluvScyGvVnPdYgk22SWFTwrBRO2Tzy8ySqaatyLq4n7pm/gfQFpnmCZ7IGu5zBkjy72YyiaidFfoU8y3Z5o8aiN1SmBmtwIYbP4jogo45Rbxfpz2lL6tvHIscunlr6XaAlVN2lB4f13m8omahDLxtDTYc47izVwznSNUy/lLXpBsH2W2bRocL7bOsm2360rMH8ghJV5zau+SHug5108L3yk6iMQUjIot/IsBcr8hIt8HcjjGTuzMU3EisVpNrDyqTTM25k17xLDdEnuM1U/2DDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY8lxQrCMi0uQAUJIFFg8hITpjrWJydzq76roy+jugg=;
 b=mhshJoixCchAMPOcw+A+tefDVvw3uKg+q8JjenTWNGcxvSRG1wjgUU8jqYfBKQK7KnlvEB9K2EnQZF/flKb4LYAMPaMaR6xXRMZVOfIGP1r1Z/W+iTuv3srSMzB8w6C+qk/8+12oHrlpRCUDwpvFMMGDEkNP8iTlPeKLqqNdA/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by GV4PR04MB11403.eurprd04.prod.outlook.com (2603:10a6:150:29a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:17:37 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:17:37 +0000
Message-ID: <44f4e5bc-d59b-4345-a9cb-bedac8e30274@cherry.de>
Date: Wed, 23 Sep 2026 12:17:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/8] docs: give the root prompts a preamble
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-2-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260922183249.2433345-2-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0037.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::16) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|GV4PR04MB11403:EE_
X-MS-Office365-Filtering-Correlation-Id: 53971492-9e15-4f73-4b38-08df195be405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|3023799007|10067099003|5023799004|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	zIXABSHl1g3/fg4w6jSBoDpp7bsZrCNb1pcTQuWFYhs7pTYQUFyhbFj9fzgQrLKZaWMSpwkqQDOhV1ejdxU3TIRx/17Gs8Dis7d8qXzHtUAvkxn4393ihnEaSEU7vmYZnnuhoEMuv426Lu5pe5zvKMOu710ZdroPib0glb8ZfOmmulcB1TqJG1D+aCW3T+VBWeqwY0IV1d/mnhpwhlvpabWFGgJJgnQNIiXOF6gZgWRpByCr0jlZSQgcteUKZPtukGTUA9ercrbHJgEcbfVt8vAujRR5Ut4QMeIC+7HvYmhCtA7yzU5n0LVEIbX96Sw8+pCgMr8Bt5V6myA30bXUAf8xOD1UTfVJ6FLFlyZk8QvmzcMNVOStotCLwmVq142hs+gSSxZtreyWP8EVSvu6XjKdwNcXnNBwgz07vs2A5IO50sPLP7IYJglnIJoxLvOxbRRZXBFtw8U8gRJy4X7wLFuAWYKO0SxuVc4TpHKkIzMWy80vqRshWgSHA1fRIHrFRwaMDzA6oB/8WRagVehL1bVvaSQZIPiJhwrcgz4qIPCmlKQ3KkZI7JZpxM3yxthpHZjR9BK+gaMKqqMHvaZnQ8tzTxHgEJqkjAw8I7Ll8+HHHrZva6ztMQIymdx4WjgesqtWktfmiQEgytnJo/MtOhvfaqRNikqbWLLMjCYwrQE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(3023799007)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHA2Qi9jVW1PamR3SUVwWEJQM3J1VlZPYnE5Rml2V2MyL3VHbVpJN0pJYmhF?=
 =?utf-8?B?c3Nnclh5MFhCSlFibFZjc1hIcmN1OTdXYzAra0tramo0enZTMG5zdWlTY2NN?=
 =?utf-8?B?alBmUmw3U1k4TTNvVm1mdDl1TlFRMmd3OEJ1K2xCaXRYeWZnRzVPazBWcm9m?=
 =?utf-8?B?eXZCWXdaWCt3NE1SaGZVZEZtV2VBOWdLYXhwU2NXWWIwd2tCUU5JY21qZkVL?=
 =?utf-8?B?UGxBNHd1STVUbkRIS3B2ay9uVWV4bGhmZHkvMmtHTWhVOThQd1pNMG9ocjVW?=
 =?utf-8?B?OW9nR25jNFQwcURveFVGWkd2RTY3cHViT2R2WklqUFJodURJV2hQVG1VOVdv?=
 =?utf-8?B?dDVqSmNzdFc0NTROZ1l1cGZjQzdNd3RSWTJJa21RTFE3eCs5MDBwczF0UUpa?=
 =?utf-8?B?dm5lUm1qb0wwQ2hqM0hBZnFKQ0VDMWlsOFp4MSt2VGV0cllKYVRsbDlQRkRS?=
 =?utf-8?B?T09BRkt5MUpoTFRmenlYRkZVbTZiNnczeUlMMzhpdGRiUnBOcWtmblZTMWhq?=
 =?utf-8?B?U1E2S1B1MDdQRnozREZ5SHRNelZzRHVVYUtzMXJaTENPMFBqbGI5TTcxTVJv?=
 =?utf-8?B?RTc1VmRsRDVDUG5qOCsweTV5c2R0K1A0aVFLOVlodG1Yb1RnazVKeGVNOVdo?=
 =?utf-8?B?K00zSVdPS3hhZTk1ZldYL1BjcGhsaUJUQ211a2xvR2d1NU5tTUZkNTJYZU9l?=
 =?utf-8?B?bzdvSVM1U1MwS0JNOUt6RUxUdW1nYVFaai84cUM3QmE4bGV5bUJXblhraGM4?=
 =?utf-8?B?dDcxQ1dOWmJUQ1pvQjRoK2Q5ZTdaemZkYUhvTkxBSnV0UDJhM2o4c2w1blhL?=
 =?utf-8?B?MVdROHBRcUcySnk0REZ4amhYWXp6dFN2R1VaeHBFVlkxcmdBemZtQ1NxNE0w?=
 =?utf-8?B?U3FnYVRXeTZLaTMrODR3bDJPeFAya2llSUMxYXZXb0JYNjQvUDAwK0Jjdjg4?=
 =?utf-8?B?bGFNY2tsVHRja21uVnlOZW9FMmRXY2FOcTR5NGlKV29TQ1ExMENvZ2hSdnR4?=
 =?utf-8?B?VmdBQWtadDdLVlE5S0V4ZjAyVnVOdm5CbDB6c29WcU5aTHUzS2xXVXFZQ3B0?=
 =?utf-8?B?N0ZKSWJ1eXVHN2t3NFc3ZDhvVlRwcHd4VHYyOTI1c1lzUWtmdml3UklzaFFm?=
 =?utf-8?B?ekJYa1JoVXMwYkpiL1JZV1RYRERkTXhXRmdocWlTSFFxYkh5cC9JVWY0dDBn?=
 =?utf-8?B?MCtKaW84T0szVDBNVnlTL1pwQ0xmbWhaN2pRdHI5dlI2eUVQYUFvM0JVbjk5?=
 =?utf-8?B?TWp2QlRmaVA4NW9MVFFVWXU0U2VsRXVBaWVGeWNDd0V3TDJGK2dvU3cvelZY?=
 =?utf-8?B?cEdjb0pIRDVPR1ZhNGlxdkFoSmgrYVhYUXZQVFd5eWJYOFBiOEtpSEtJcDN1?=
 =?utf-8?B?eEhZek9zcTVJNGVYV3FIUFdRNEhaT2VIVWZYQTR6MXhERjN2aGNKVnJxR0Fu?=
 =?utf-8?B?azhDZlBXT0gzYWptS2MydXVwaGdBeVdHc2JiclNWTkU4Zi9JQnJZOFZhaTJE?=
 =?utf-8?B?clczcXpEZXF6NW1tdWpiWFB5dzJ4Q3dLbmk5TUYyU2NFVGNIZDQ3MTF1T2Ir?=
 =?utf-8?B?cks3UVJza3g4cWdIUjJrenB6dzJFMEhCTTU2Z0tJQnArSXl6UGxSZDAzb3Yv?=
 =?utf-8?B?bVZ0aEtFQ2xQQlA5cCtBbDJoeHd5VHBYQUQ0NFNsYXNBdU5RclNNTHpFNjVO?=
 =?utf-8?B?R1hJbFFYSXBDemNtMTM1Uy81cWNmbXpwNmFvU2JOejlBa2VTd29md1ZqdGFZ?=
 =?utf-8?B?KzkvNHViT2FXVEF2dnlTV0ZCeUlhUEkzeEI3ai9VamZvWTE3eUh1WjYyTHFE?=
 =?utf-8?B?a2VIbFcraG1KZyt1RFdiSG1qMzlYSHpReW84S2FWTjJBQVNIU3BnSDIvNUF2?=
 =?utf-8?B?cnZTSHpxV1BYN3lKaTRjWTlCWXgvc3hzVWlBRU5NampVdTAxT3I5dlZVcDd6?=
 =?utf-8?B?cnBxakh1eTVTWFZNVFlSd0doMHlzTC9ERFQ4M2pZc1ZSTFkwOFJkR2NpdCtQ?=
 =?utf-8?B?NlFvbWpSWmQxOThzdmlyK3NIalV1aWxXTGVJL1g5ZGZpSi9ocmU2TXBTNG4y?=
 =?utf-8?B?YklZaWJObHRzaHl1dWM4YzMxa2c4WW54TUZncm5ySkFmSDZ2WXZGb0lhUnhJ?=
 =?utf-8?B?dTV0bFJBb2xLN0lSSXhIU0FaR1JTYWVlbUNnOG9XTHZGTlFWQnAvaTFQWmZ3?=
 =?utf-8?B?TjhQME5qVXhWZ0hpZnRwNUFPVTNOeElOWHNjZnVqM3JvQU84dTROVDgwMFVJ?=
 =?utf-8?B?eS9qczhoYWJsbWZuNGhIMEZGTk9qeFVFNVMrUmxmNWRtZS9rMjhMTkphVEN1?=
 =?utf-8?B?eTJlbS9qYzNudTgrNWIyaDhWVmhzVkIzU1FwNFVUcWl6eTNZTkprZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 53971492-9e15-4f73-4b38-08df195be405
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:17:36.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOofvvOB+XHAnIpiQd4cJgXoTLGB1HomrdTYmBIqZXpPKfIfI+HFE8fkSE1d0HzEHVSysaE+owNHP1PffHmdYSu9G9pvC9p3VB0qnVlmUCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11403
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 10:17:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10601

Hi Trevor,

On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> A bare "#" starting a line is a root prompt, a comment and a line of
> program output all at once, and nothing can tell them apart. Most root
> prompts in the manuals already carry a preamble naming the machine, and
> the stragglers are what make the distinction unreliable.
> 
> Add the preamble the others already use: the machine the surrounding
> steps name, or a generic "machine" where they name none.
> 
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - rebased on master-next
> - the SystemTap example uses a generic root@machine prompt; the two
>    kernel-dev ones keep qemux86, which the surrounding steps name
> ---
>   documentation/kernel-dev/common.rst    | 4 ++--
>   documentation/profile-manual/usage.rst | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> index 2a65055e2a44..fe2e42265f9f 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -722,7 +722,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
>   
>         .. code-block:: none
>   
> -         # dmesg | less
> +         root@qemux86:~# dmesg | less
>   
>         You should see
>         the results of your ``printk`` statements as part of the output
> @@ -878,7 +878,7 @@ Section.
>   
>      .. code-block:: none
>   
> -      # dmesg | less
> +      root@qemux86:~# dmesg | less
>   

This file is also missing a

root@machine:~# cd /usr/src/kernel
root@machine:/usr/src/kernel# make scripts

I'm assuming.

In any case,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

