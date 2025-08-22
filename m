Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFBACA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 14:32:35 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.31])
 by mx.groups.io with SMTP id smtpd.web10.11585.1755873146747811568
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 07:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N5puihez;
 spf=pass (domain: cherry.de, ip: 52.101.83.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kggFy5Uu39Sl2K0VhJIz5K8nUirT1l4WaJlP/686KRErqhw0ifDAp8DjTg2wuvBm93j5vSDo61Ts7fEpVyfAjItWX68gCeBEzMjg3kTynCLj0G+HDzLh6Q1ViL6oHLnmaxcdUu5qhEZPqR6bjtHZkMVD36qGGLEo6ebQQ3jQ9akBY7MNH2wj/iXmsK/VRKtRFlvlzczP0i6VFZdb7KKdQxJRk9TL00TteOtG/ej+VPU4rCXcAaOWumJTx4anGPe90GxTWMJEGhHJ+mpJama7d+FvOXvFNEYu21BBOhRnz5b4/P8BkRV5ar3Pofrw2eqzMR246ve3LV9gbSVt0HL5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93XSPHkQAIfq0biwwTDgy0vM7wYsCPKQkKvejXlVwQc=;
 b=mi44CiE0pU7fAYf2dcfmm11BOtvPXkOMMYWnIT+2ktp+bht1QJdkbRYF5RSnKOKQ+ehi4YfOUd1gLi3RLIyvuGN2r+euHwzrCNuGHegTA4h25x4V8E8HyUog9ejD95lBQIZyDA1F1D6hOp/kitDiaeTpwsLRNVgR7iYhKfwDvrRPA8UxTeAxtKp3KyhZeat649NW8rlJfasC4K53kcaxrgOAWBfPQoLjdCRNZuPQIN+Es6gVYc/u1RpNGsxQvmNcBBvy6rK8RsD1WRJjWmPqrDepGqctkSE9wiUksKNPvME5qCw1HepTyQRv/wHBR82WY0hsyR6kbRHjDjOYgVze8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93XSPHkQAIfq0biwwTDgy0vM7wYsCPKQkKvejXlVwQc=;
 b=N5puihezOxwLd8v7dldSbYpjy2c8XjHA0Uc21AmgbG4cJqzOEWvLNxoXRz9W7xdKp4RSInvKMu0/fwGkORn/KourqzVXkN9VeNWolVSpQ4w28dcfBGlrYqEm7PAQcFYVpY7tIe9iem2t1gg+XTYmHjrX2Nh4Z+oql85nFQBhgok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8707.eurprd04.prod.outlook.com (2603:10a6:20b:42a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 14:32:22 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 14:32:21 +0000
Message-ID: <a106fc65-b72d-4701-b1f7-917dbfe5bfc6@cherry.de>
Date: Fri, 22 Aug 2025 16:32:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH] ref-manual/variables.rst: expand
 IMAGE_OVERHEAD_FACTOR glossary entry
To: joaomarcos.costa@bootlin.com, docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com
References: <20250819160431.382820-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250819160431.382820-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f19c0e2-5bde-42a0-2afc-08dde188b46a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Qzc3NFF3dWZZNjlBZHlNSmxJVzRjOWVzMjYwZ21PVlpkeUZxaS9KbldUUHQy?=
 =?utf-8?B?b2gvYWx4cHcwNUdqYzN1aHVtcjdBczJrSG1XUkJGNnlGRER3RkdKZzQzaHla?=
 =?utf-8?B?ZVNBU1JDRzk2TVBMQmlzczlTTmRiZU9pc2FGSW5FK1F4Mng2RlB3bFlzbTVX?=
 =?utf-8?B?OElidDF6RnlUL3VzNjNIdUdqZWxNT1Y4TDdVMGJjcUQ0eGg2ak9NRWwxR2tv?=
 =?utf-8?B?c2NzSEhOU011T0JoMnNCRHY5VjZRaENSTUVUWktFcEQrYmhidEFyakpUbWhY?=
 =?utf-8?B?aldSbUt0LzFDZDhEYVNqRjJDRVBuNTVQd0hOU280UXpkUU1QcEtybHRmMlJy?=
 =?utf-8?B?VjZMSjdjZDZOZ0w2UzZRZ0xNUTgrMHNQUUp5UFVhWGtKNWFQR1A2VmE3RHV3?=
 =?utf-8?B?ckIxN0ZQTlEzdlBFclFhS2VxSStPeUszM09sNFRaaUhsS0hFVjFwcEFhUndL?=
 =?utf-8?B?a3JvckUyRUNRYXRWbTZiMTR0VTRqVG1IcHBVZDZIbHQ4ZVR1b1JYZkxtR1FV?=
 =?utf-8?B?ZlZHNzhYMzVFYk1BSFdXY2Vabkx0MGYza1VaTStrMlU2a3RNd0lqTlVrSUtU?=
 =?utf-8?B?ZUk5TmhZK3hQQTRTdTNwL2oySVVGSzlpeTJURE0vWWdIOTVhTnlTYmw5MVU0?=
 =?utf-8?B?bUg1M3NEMEhpNTE4a1duVWhNdFpDUVFvUnVYZ3dweVNrTFYycjE2VWc5ekxU?=
 =?utf-8?B?NURxem95dGgwdEFBZnZuUnZIVDZ2R3MzenQ0WVVZMEtSVk1CTHpQV3Vtekhu?=
 =?utf-8?B?MHAzMWVURHVDc2htVUduZERJVnc3bmNkanZOWUJLU3hBREVOK3g5M0JPSjlI?=
 =?utf-8?B?WHJKYTEyN2NnYmt4QkR5aE5TSGJvSmFYSGl6SEw5L0l0S3lrdFpRVEV2UUVX?=
 =?utf-8?B?bVIweWR1aGNTb1JmRGVBWkRiWnhoTFc2MG8yOUVIbFltaXhJczRFclV0MGQz?=
 =?utf-8?B?d3hZL1BFVE1lYy9JTXVKM2dtQ0ZkS082SFZvQWsrdTFWMjhwcGltT3NMTVlT?=
 =?utf-8?B?MlQxVWFIeUJvVitYOVZpM251SVhoeklWQXc0NDV2ZFFlUlZ5eFJ4cktpdHA2?=
 =?utf-8?B?R3B3YlJRNzhmREFqaEpzOFpZTzBkT1FWZW11NGtMbTRJUXN3dmJ1MVdWbzNz?=
 =?utf-8?B?aEkxMEtCZW5RUG9pRUNNR2FBWFNqZERFeGZhU3N0ZWxyYXp6Z3dORi80SHh5?=
 =?utf-8?B?c0pJSCtndUQvUzQ1d1lvUHZ1RDYxSnpQSVpha0Zxck92dFJRVkl0ZE1pZjRt?=
 =?utf-8?B?ZmJ5di9BaCt1SnZaWVdOTHFVMnd0ckdlYnFaZE5IYUF1TVkrdnZ4NmVvZnpj?=
 =?utf-8?B?QUtlaW5sOG9QZGRpaUNabTFNODllZ2VtWVFxeUF2UHBLblBLeWUwQmxYc2Nt?=
 =?utf-8?B?TkMrYjRoOGxpZjBDSXpVU0JsclliNm1sVFAxUjRWc1VmMFZUKzFHM1U0Vmpo?=
 =?utf-8?B?VDdzN1kvL1JySUVCaEdmRFZPZVJFV05nU0hUTVpDektPWEFQQkgyYUc3cHM0?=
 =?utf-8?B?MEJqLzd0d3I5dDNGb0R2Z1lIQkEzQSsyNnJzelRDazk1Z3RJOXl2SnJmVzcx?=
 =?utf-8?B?cHAvN3dMR0NyRVlNWmNWV2FKOUpvOHpSMFRTeFczQzVMYk9aNVFwazJTaEUz?=
 =?utf-8?B?VzBHUUtGRXk3dGtJMWcvd3Vhd3FzNnRYMWVsR0hxT1EzWGdQcFExZHY1MS83?=
 =?utf-8?B?VGw3WjdRUWFTUWhQYWY3R2g2SVQwcnZwSWpBd0RmYWo2ejEzYXlackNXaTRw?=
 =?utf-8?B?ZVYrNDVDZ1JQK3dCcEcvYWNoak5HOHFJaUVBTXQwRU9IRkI4M2o4am5CZ2pj?=
 =?utf-8?Q?/SIagmlygHwUpMHev2+0XybLjEgAbS9vbNUQY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c2NzZTFNZitOY1VFRGg5TlpXclpYalpaV2VGS1JQRnY2a1VTZDlkMjVpM2N3?=
 =?utf-8?B?SzlZYUlkM3Jkb1NKT3RJOHdaMUhJYk90MXhlbUl3MTFnMVJhZTNyOXVBSnFu?=
 =?utf-8?B?RnZRYVVpWkdYdTBSc2ZiTTg4YjVvT3RKV1dvRTQ0b1lGQUxkcXVvVzcycVlp?=
 =?utf-8?B?RTRBaE16TVNqYTNycllRK0JFNkxXWUNUYkxjTk5XSUZRdUM3ZEpGSDZDUlV4?=
 =?utf-8?B?TjlaMDZZQVpVTTF3d1R2YXJOeTlxb2NkSDE3c1krYXJhTWw1cjJIZ1oxSWdN?=
 =?utf-8?B?UzNrUTBDNUNYYkRTSjA4OGd4N3QyT3ZwdlZLbmJ2UUFxbTdOUmNSblRLMm5z?=
 =?utf-8?B?TFRpZThxM3ZxalFMMlNTNTZBZWpIbVpYVEFUS0o0N0JWYW05WkhXdFNuODFU?=
 =?utf-8?B?aEs0elhWS0xtT0FjSUlVcTE4cUZia1VUWFR5bHowZElwTm9neDhzaGJzSU9V?=
 =?utf-8?B?amZJM21SNUlaNU8yNU02M1JEVU1HcDRkTWw3aEdPdVF5bmJsdm5RakNVeVZJ?=
 =?utf-8?B?MmZmRlg4akNtNDlHWXN1Zm03ak5uM1Y3QStQc3ZOZk5lZTRwSzdybmpmNWlh?=
 =?utf-8?B?dktkTHU2OXNLUnNURitSRjdmMHhPS0h0Q3c1YlMrb2VDOEVyVmpKTDRjbVdm?=
 =?utf-8?B?SGhkbkFnMWZPS3RpSFJoMms4NmhTZENJN3N0akR4VXNNakRkeWhiWnBNWjRy?=
 =?utf-8?B?NUZOQ0FETno0NWdacDdLeE9jSnRyVjdtMm13UWE3dGY4bndlVVdBeXVZK05K?=
 =?utf-8?B?eGJtb1ovR3F3UXBiWWFkSFhiWHgwTGFldm1kOFdrSDYyRERBV3FZQVhHY05m?=
 =?utf-8?B?RmtkSjJnbVNOTGd6T0pudnp3V1RKOUVlRW03RmZMVUlVUDUxdTU4ekF0NVFp?=
 =?utf-8?B?WVJZTkh3c2VVYnptalU1TW1ta3BoMXA1cmRIOE04ZFRQQVNBN0RubDNaajhx?=
 =?utf-8?B?TlN5MTRBcXpWQjB2dnZnTmFVZmJSNEZhOE1US3ZHa1VkdTRGRjQ1dmZld2dk?=
 =?utf-8?B?cFlEQ0lPSHdjZmQ5WTMwWTdHRDhSMEh0dmY2d1ZHUnJyYTlNOUVRbzM4YjRT?=
 =?utf-8?B?UUdOZnhQa1h5YjE0M1h1eGtEbE4xekFLN1NSeUd4QVFsOXVDdytYYW0xUnZo?=
 =?utf-8?B?R3oxRnVsTk1zNXFYVUcrTHlYd3hBMGYxQTdMWGRKOU1vbkw2aHExcUhwTHND?=
 =?utf-8?B?RDRQK2JVZTYvN2lBNHg0S1RjMzdNdDM3bG1SekxnWWFNallseGJDczlkWUF6?=
 =?utf-8?B?OHl1c2k5TUJLalkyYTBuNStVUVgxZ0NmVFJlT1JQcGtqdGhPcmtzRVFLdnkw?=
 =?utf-8?B?MFl6a0V6QkhYSjlOZm1yYlNjYXM5UEZuNkY4QWtkNW4zQ3Q5bDd6L0RzWkRy?=
 =?utf-8?B?VEk1cG1mdWJjMjkxMUVwSVdSMXNYV0FMc2llRmVqTUlLYy9ZS1hKdG5jOEJx?=
 =?utf-8?B?Rm5XM3hyU2xrbmsrekFadGwwTHlUOVl1M1ZWUWZaWCtpZWJIMm0yQUJiL3Nx?=
 =?utf-8?B?MVdDN09nZ0xrZHpydThCMGJvZXJKSHhTRHFvTVRjaGJubThMTGowSmZ3Rm5Y?=
 =?utf-8?B?WkZCaVNwemgyYllvTHorMjFORDF1WkJzM3I1R1pwc0RXaGg1eENxZ2Mxa0Y2?=
 =?utf-8?B?cjV5OGlicjc1S2dxMmFpS2lqeXRuUm5BRkZxQnl4Sytoa0g5VFNKY014V3N2?=
 =?utf-8?B?akVyWW5DUFF3Nm4yRWJ0WjFoVHJpRnJxYWMrWCtGZHR2KzZGUVh0cEpCUUZo?=
 =?utf-8?B?UVMvSmxnbEZzNjFqbmNueXVuaTZIRkgwcWxwR2Y0QWNpb0hXemxrdlpoZHMw?=
 =?utf-8?B?YVp6NFgwVnl6ZjhhWnUrUDcxcWdnYkR2TjlmNjlmeWdJeVh5SHllTGJ6cUww?=
 =?utf-8?B?Wmo0QStVU01vUFdkUlJ4V1YvK1JDbDA4MVg4TnZCTS9zbG5pYjRpNy81c1R5?=
 =?utf-8?B?aWppNEgyRVNrNzJXeVYvYkRWekJWL29hWERRSnUvWC93TmZsZ05XZzd3MzFG?=
 =?utf-8?B?S2E4czRmdHd5UWNCaGJQdTRrWm9oTm4wdm1SMVpWQTBNZUhYdU9zR2VMSWZ3?=
 =?utf-8?B?SkpJZUxkZ2JkWHZIZlBWODVCVWNvS1JaQWo3dWM0V3hJN0xSZERQRFFqdW5E?=
 =?utf-8?B?LzhmcG5kVWY1OEQ2UkZCbjVFYU1QTm9Fb2Z0N1BkVjB3cDRtRHlnbEVkVk5p?=
 =?utf-8?B?cUluTHFUSzR1ZmpEbk1NblNueUlGRjFyRUNvdEd4dWxud3FjckF0RGRVMDB2?=
 =?utf-8?B?UkpYMXJLS1oyTnJ3WkxIR3dWL29BPT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f19c0e2-5bde-42a0-2afc-08dde188b46a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 14:32:21.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sM/relbGr1/hwODidyjOT9+rGymMTBgRnqLlTsXxcRKw3QxwRzohChYqUgWYRQdA5nLSZyWHf+7Tnm92LHrGycxvp/8JGdxhBmftKXvNFI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8707
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Aug 2025 14:32:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7462

Hi Joao,

On 8/19/25 6:04 PM, Joao Marcos Costa via lists.yoctoproject.org wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> 
> There's a (second) overhead factor applied in images generated with Wic,
> and this is already documented in the .wks reference. However, the
> IMAGE_OVERHEAD_FACTOR entry does not mention it, and by looking at the
> partition sizes (e.g. with parted) one may find it confusing that they
> don't match with the expected rootfs size (e.g. in a scenario where the
> extra space is "0" and IMAGE_OVERHEAD_FACTOR="1.0").
> 
> This second overhead is already documented, though:
> https://docs.yoctoproject.org/ref-manual/kickstart.html#command-part-or-partition
> 
> Mention the '--overhead-factor' option in the glossary entry and add a
> reference to the wks documentation.
> 

I'm wondering if this isn't rather a bug than a feature?

Why would we need to have two overhead factors?

Also, I'm wondering if this isn't a case of:
- IMAGE_OVERHEAD_FACTOR for setting an overhead factor for the filesystem
- --overhead-factor for setting an overhead factor for the partition

In which case you would have a filesystem which doesn't take the whole 
partition. I assume if you have systemd-growfs/systemd-repart it'll take 
the whole partition at first boot?

Both would have a valid use-case. I imagine that it'd be perfectly fine 
to have an overhead-factor of 0 for a filesystem that already has an 
overhead (e.g. for journaling).

> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d559899c6..c18bc7ba4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4166,6 +4166,11 @@ system and gives an overview of their function and contents.
>         added to the image by using the :term:`IMAGE_ROOTFS_EXTRA_SPACE`
>         variable.
>   
> +      When using Wic tool, beware that a second overhead factor is also applied.
> +      This overhead's value is defined by the ``--overhead-factor`` option, and

Gut feeling says we shouldn't us "'s" here.

How this sentence is worded could be interpreted like so:

"I do not put --overhead-factor so there is no overhead factor"

whereas what actually happens is that the default is 30% if this 
argument is missing.

> +      not by :term:`IMAGE_OVERHEAD_FACTOR`. See the
> +      ":doc:`/ref-manual/kickstart`" chapter for details.

Maybe we could point at the section (command: part or partition) since 
that parameter only applies to that?

Cheers,
Quentin

