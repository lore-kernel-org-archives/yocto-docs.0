Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D4ED2F330
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:21:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61565.1768317670473787741
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jfo/jFta;
 spf=pass (domain: cherry.de, ip: 52.101.83.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuZk+7uDkb3Bq2g4+78XTRzn7kDA2cemWV8prMNCHM5XknCMwmMBQyE9ukR4f4jUxsLIdFEeF1aLFfR/obsaskm+8ZomMoT35XgW4Dh5X58D2vsTg17BJ8mJdI0B0uwJaacy0gqe8wf6FqXR7E+9RG01MOjkZFxDlymo3VrYuvH9/FfZ8XPltFDW3xfux8V3gbUuTPWi54szhj1TAAX1QZTMoAI+cdKuK05FK15AX/azaYj6NpVck0y50Wbo2WBMx14aVEZL/o9Stkr+zijIWmZT8t6uBkCP/U/DaFm4rZpijtGgz1YSPJggvpvykRG7dl9piaFT2fRAF2GpeeoCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZT2l7bntFOZ9VqbVc1epFNxjRHrcp6wzMjGLK0Slik=;
 b=gmIqPpiBpYarMe9jAGFLkhWGoUwCBXrIF/HF1hvNqEtz7HIyGZCllrA3dKntVkvpTagF7yyBNVfMlmunOOvjJ33/BbxzIFGFI+ZWnVHRISSUURFPUWqPvCe5msFPtWBy2+Z0jRgV3Opwo7uYCAf2R6dg7NKUJ+wVtX6c93T7jKC383zlFqrcf2R5PjPzroOEjioB2bQMsk6M+ytZh8LsWDVejvVV2bEx4683XUpNpcm7SAkbTPl2Bf9aiTqI9I2qvPQLoabizwvJIU/G59QJublga2xU2esYBQYqaFoZWniwQE0M3hsqzNummzCKPZ8xhAYlIZufObsqIAz0heB1lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZT2l7bntFOZ9VqbVc1epFNxjRHrcp6wzMjGLK0Slik=;
 b=jfo/jFtae4RWtGBDJg8FwY5ArXYD1cdovP8ahUu2kXnTYIaz01Y8vjwlZeEspwt+oC8SrucfZZaBeqtdf/XYWW8cqpYRiIo7BoD2fdkjf8b+sCLRWMSWdNhyDfz8iwwuWrz0Qdu6RpUq1JPyP9E00NwIwy1m3Yit4iOMjEQFroI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB9464.eurprd04.prod.outlook.com (2603:10a6:102:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Tue, 13 Jan
 2026 15:21:05 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:21:05 +0000
Message-ID: <1324245d-3eed-4177-bde4-779817c71b5d@cherry.de>
Date: Tue, 13 Jan 2026 16:21:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 49/53] ref-manual/system-requirements.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-49-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-49-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 16143e80-8295-4ec8-5f89-08de52b75ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bFlpTzFBeTBEWDlvVEFyUDRSalNJL2wwSmh0Z3dLYzBsYVhYaHM4alNMLzBx?=
 =?utf-8?B?Zzgxb3hTb0RVZit6R2NQTkNiODU5c2NtQ25GTTc2Uk5TOTdwR3pWYVZnZ29K?=
 =?utf-8?B?eEVZSVBLbzZSbHhFNjlYbXI4MXRCamViTTZkK2Y1cm1TU21qbS91dEQycnVk?=
 =?utf-8?B?aXdDSlJCbjU1Yk91cVdjaytiZlpMZWtPZCtrWC8rOEdqOTR0WWhjb3o3NEpz?=
 =?utf-8?B?TEdPaVAza1MvZnBTU0M2Q3FNaW9Ia1FBRndPaVh2eGkyYkptUGpYcWVOYWhP?=
 =?utf-8?B?VUYydkk1YUw5NEdwaUJxd0grK0Qyek5ld0c4S2o1Z1ZOMFd1MTV0VGI1cmF2?=
 =?utf-8?B?YkhtZzRkQmt5MGFLZVVGQ0ZzeFAzVHZGTjVWeUlaZXZiSWpyams0OEtkakU3?=
 =?utf-8?B?OFVsM1llK3AvQUdOdHIrZ3Jwb1puajEzczhNUEVHMlJZZUZrTjhRYTJHTTQw?=
 =?utf-8?B?YWdpSyt3Q1NFdFMzMGV6TjJFRDRIV011enhkd0VMK2xPekd3WUtnTHBueGll?=
 =?utf-8?B?UUpsUkJkdFk3Z0NYcDIva2tVV0hVYVRKL01ZYUdlTnNHVnVkTEhoNEEreU55?=
 =?utf-8?B?MEwwZ2phV3poYWJnb3paMHRYbzdGOUVlMXV1SDcxM0lUSGNSZ2JBdVRxVUVa?=
 =?utf-8?B?S0VteVBSNjlDa3BQamt4eDk3L1NwQ3V2Z0pScmZmQVd3Vm1wL05ML3lnZEVr?=
 =?utf-8?B?cVUxRzNYMFRqMjUwZUNPV29FUThzdmtldDhKWVFRU3hJMXF0ek9JNzVlVStk?=
 =?utf-8?B?Qkg4R3NDd21EWDNlUkRCVEdrU2JWZHRkRGJpelB4WWM4UmZoTXEyait2OVdY?=
 =?utf-8?B?VUpKcitVT3FSYTUvWE9EMjZuNkZDZFMvbWRPN0h2Q2I2YVMrYXVJRFRUMkhL?=
 =?utf-8?B?QTFTRkcrWWJrblpVc292SjNnVjBBTnkyb3VSb1FMb255UmdMZkNSTXg2dVBx?=
 =?utf-8?B?VEpaOHJMemFXY3A0UzlFcS9Sb05DYys1bEptUTI2dE5yNFJxblR3S3Y3VGZX?=
 =?utf-8?B?UCtjelFQQW9OK1ZnZHhQSjkzOTdySTRxVHFIUFNpZHpQWmZaekh3Ni9hQmZO?=
 =?utf-8?B?cHRJc01OUWpkNDFoMFdEZDNZcm5mRnJjcGtBcUE3aG5nSUh1eWhtdTlDYUNF?=
 =?utf-8?B?Z3RUZUFuK2ltbzRxUlJ3c0taRTlEVEhBdGtnTkRybk51Ny85Uk1pbmpOSGdu?=
 =?utf-8?B?N1hLWUNacVF5dndhU3REN29BMjFWeDc3SGl0Y3piWlgyWEtSd0RzOHBDV2tr?=
 =?utf-8?B?N1FaTlhBbXFRUnl2UXRYQjRIZE1ZN2taS2VFT1ZjM2t0N1orck9HbGV3emNN?=
 =?utf-8?B?akZDbWVvRkNtNUM4U3N0ZzlwaVhYN0pkZ21SM1hqVUhER1JkckxFY05iejc3?=
 =?utf-8?B?L244RW1TeUphbHREbFVNaEE0dzVIQ1U3K25yc0tlSkNwSk5yNHlVR1NUVkRO?=
 =?utf-8?B?a0sxWTdocGR3L0dtRmFBVlRjOXRHNGo0UDZjUG85dU1ENEhlc1B1SmRMa3VR?=
 =?utf-8?B?Q1FMV2lFaWNuOWRQUkd0citYVm9lVW12aEZYQWNoWkwrWXpHQWQ4bWI5b0RW?=
 =?utf-8?B?Z0ZTZmdtb0pZMUVlN3U3ekdqdURjd3hVK2lkc0xDNDBKUHNaeWUvTEloekZC?=
 =?utf-8?B?dEVqZVNWaXpMYWVBd21pL1krOHJIQjhnVnVDTUlVT1JPMjdjdmp6WDNRSWZq?=
 =?utf-8?B?by9ycU9oOFBna2JobjdwczRtVGt6dFBMRXZkNUVtVTZEQ29jL0VJYk0vTnQv?=
 =?utf-8?B?MVkwZm5PRzNHZHA0aGdqM3JwMCt0TTFobm5kV3Y2c0JSUEp2OTVOaFB2VjNK?=
 =?utf-8?B?YUx3VkhxNG05UVBmeERNK2g4c2g5aUhIdXBKMFhpbnJIbjI1NUQ3V282Qzdi?=
 =?utf-8?B?SHJmNkZOVVRKaDd1bUFvY2Rrck5pd0I3RkR6Rm9XeXEzRWVROS9JNEdTdGFU?=
 =?utf-8?Q?bF41ItN1fHG1tXZa1mdKJkaDRCgG3TJY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFhCNk5TSkJaVHdDMmdLQ0lnVXVDY2xBdVkwZHhBZkxFU0pVR0dvQTBHRWVL?=
 =?utf-8?B?NFBLMGFBSXNGbnl3ZmhVQ0JRL096L3dGZit1ZXVsNFNBb3o0dmdKMVFsOUpZ?=
 =?utf-8?B?MytMNHBjVU80OSsrSXlGeDFmQUF1RlRKZFRyRlM1U0NPdmFWUndOaU5JWmZZ?=
 =?utf-8?B?MTMyV2E0TlVKNllFV2tiNDlqZFlqcU55eU5QaDlkakozTVVvL1JUVGduL0VB?=
 =?utf-8?B?WnQxL3dVK1FWbGRhZG52V2hIRUZEUit4cmZSQ3VCSXd4OCtwVlVsamFZZ2tw?=
 =?utf-8?B?WUZYbmo1ZkI3OW5vL0FWblp0a0Z6Z3QyMmdwYW9XNDY1ZGpDNDI3NlQ0R0Fw?=
 =?utf-8?B?eUpOMHhlQmREeGpzcXlJc0NVS284aGJEaUdPYTZud0xoTFd6dWlrS2t3cVQ3?=
 =?utf-8?B?L3lUbldqUHpMbFRseks1ZWJ2NlVNNUU2bmNueEp2OEhoTVVKcVczbjl5d1BD?=
 =?utf-8?B?UzI2ajlmQVNBbEFyVkNtTGtnMHF6eUpsbmNtcUg5dzN5elJZSjdYeWtlSUlI?=
 =?utf-8?B?TDh1N3pKR3FEb2ZpZmpJVEI5YXBjbEtrMTdSb1hVT2ZCSU9xY25MTzMxcUhu?=
 =?utf-8?B?eGpDdld6bExNZDNHOUJLVldXTGZwb01TbWpYZlQ3a1VLZXBhOXNRVDNXdFdD?=
 =?utf-8?B?ZVdlODRlMkxTY1VpN2NxWHd5OTdSNFVKVHcrWjhyaUpKK3l0OTZONFFkcktz?=
 =?utf-8?B?L0J1TDNtZnhJVm5lTmtvc3lRV0RQcU9BUlFDb3FjUjd4Q0xhMTBtZzA1cGFY?=
 =?utf-8?B?MzNtN3U4QTRsdiswdUR2NGVDUFdiQ3phb3g0R2NuK21SRjRlSlZmYVR2d1do?=
 =?utf-8?B?N3lTczNmVkR5aS8xdFIxWEh6Q1RjVTY4MDhmdzhiTXdlQWtBbTQzWXZDbXBi?=
 =?utf-8?B?RDFjeUVHUDJXZnlHSGM2d3NmVll5UWozRzRnbDNHZWJqdFFWZTF2OG1qK3A0?=
 =?utf-8?B?TzJDTEU5ZXV4VkFGS3l5TXpYR1cvZ1E2WDhMUmhVYjJRb0JZUFdhckFMNGIv?=
 =?utf-8?B?dExMeDIyeVh6ZXR0d0wrUDdjKzF2cjliODFiQzNqb1lLTHJyRWZvMElPaGEw?=
 =?utf-8?B?ZlFWdlBYQ0pSazBHQXZNaUV0ZHIrbDJFV3hpbUNSNmkwSzV2QVU3SnlBbWt2?=
 =?utf-8?B?VEZjNGFqb2trTTNHd0VxaUh4V2czaUpOTVd5bys5VUY4N3BKVFQ0NnZqa3da?=
 =?utf-8?B?SkZFOVE5ejNtcWc5U0FNWFVORUJtU3c1WFZ5K3hrMStIUUsybTVZbm84WENi?=
 =?utf-8?B?REREdDFDQmtBenFiS1ZLcEpDT0dReVV3R2N5eW1TZmhraitmZ21MWVlrQ3RT?=
 =?utf-8?B?VGRvaG91Tlo3ZmhRTUMvL1loTzB1L0NrWVp5UW5hYXQ2UkJoNEllRXpBYUdq?=
 =?utf-8?B?SDFuc0NESm1LK05qMmszaUdVaVF1aXpPOTdDWDdHR2dQMW9NNjZiL3R6SXNO?=
 =?utf-8?B?NTUwZTBqZm1memNjbDRMYURSTkhJVDJ2REFJWUFXVjNjc2o0UTRMUmhLcWFB?=
 =?utf-8?B?WFErNkpkanZNRGxyanljb1pXM3FJRExta3hydzFuNzJCcTRmY05XNDdhekxj?=
 =?utf-8?B?ZEJpMnBmMlQ5d0dPbFppWGtZMUl1WS9MRHAyYktTRFFFeW5mbjdxYTgxZ283?=
 =?utf-8?B?U2lwR2JnQ0dCamtIY25MaW8zYzNRLzVnWXllcUNnOTU3WVI0elNEbko0MUpS?=
 =?utf-8?B?bU9ZWFBwWG5ROVB2dWtuV3NOVkYwVHR3V3dGaHZCejkxTnVYUnplS3BQL1Vl?=
 =?utf-8?B?Y21LcXd6Q2g3cldINU9QMUlWWTBXS0xJU3hIL2hNekdEVVZSOGxxVHg3Z1FJ?=
 =?utf-8?B?WnNDc0pzL0NkRHFwMXhYeklGUDdRd1hFNS83S0N6VmNXT0c3OUlnZElleTlV?=
 =?utf-8?B?ZEdlVTgxVW5BRTc4VkY5NG1aSVBDMVppODNQbG5wbksvcWhrdlNoVVJWNVo3?=
 =?utf-8?B?alhxWTlGc2JmaEhON1d5ZTRlSDdPZVNjNW9CMjE0ZWViZVp3anp0bWs0QWtt?=
 =?utf-8?B?bmNmQXF3cTlENEh4ZE0ra0JEMGUxVGJxcG5MOHQzdzNheGxxOWpQRmpVTWNX?=
 =?utf-8?B?UXcvYlBiTVFudnRDcGtyTFRTbnF0RnhXTVY2cVhoQ2IvUGRuWWw5NitSdGxu?=
 =?utf-8?B?K3NTelBZeUY2TjRaaFYxVDZUbVBTSENNbUsrdE9UWEhZYlY0TG1BKzAxL1Ji?=
 =?utf-8?B?VzMrTXZvUVFXbEhFUlFoRlVqNGZpYm1jZktjZHlIVkhPQ1Voa1BCWndpckFK?=
 =?utf-8?B?ZTYwenJIQXc0bmFoNE1NZWpNY0lUYW9vYWIwdDA2QWhBMkxaaDZjOGFUekRB?=
 =?utf-8?B?UkpEM3FOVDJ0Nm1YclV0RVpQQVY0ZWFCL0NSYmpKckxOZldtYWtxQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16143e80-8295-4ec8-5f89-08de52b75ed7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:21:05.7634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0b9sGxhEa29czHVBd7TvQuKc1TCYHNi4+81Pwm8n8w1ZSN1ytO49Rhxn2pflHg73GkiSQuZDvLSuUomLbDHwfHrkITXtMbXGHRCkBB3uUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9464
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:21:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8538

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index a56e683ca..e8d6830b1 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -405,8 +405,8 @@ installer and automatically installs the tools for you:
>   
>   #. Execute the ``install-buildtools`` script. Here is an example::
>   
> -      $ cd poky
> -      $ scripts/install-buildtools \
> +      $ cd /path/to/project
> +      $ ./layers/openembedded-core/scripts/install-buildtools \
>           --without-extended-buildtools \
>           --base-url &YOCTO_DL_URL;/releases/yocto \
>           --release yocto-&DISTRO; \
> @@ -420,26 +420,26 @@ installer and automatically installs the tools for you:
>      To avoid the need of ``sudo`` privileges, the ``install-buildtools``
>      script will by default tell the installer to install in::
>   
> -      /path/to/poky/buildtools
> +      /path/to/project/buildtools
>   
>      If your host development system needs the additional tools provided
>      in the :term:`buildtools-extended` tarball, you can instead execute the
>      ``install-buildtools`` script with the default parameters::
>   
> -      $ cd poky
> +      $ cd /path/to/project
>         $ scripts/install-buildtools

uuuuuh... Shouldn't this be 
./layers/openembedded-core/scripts/install-buildtools?

>   
>      Alternatively if your host development system has a broken ``make``
>      version such that you only need a known good version of ``make``,
>      you can use the ``--make-only`` option::
>   
> -      $ cd poky
> +      $ cd /path/to/project
>         $ scripts/install-buildtools --make-only
>   

Ditto.

Cheers,
Quentin

