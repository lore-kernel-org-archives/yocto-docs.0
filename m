Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9CFE77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 14:46:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.36])
 by mx.groups.io with SMTP id smtpd.web10.38665.1733496363956902269
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 06:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=axKhln0X;
 spf=pass (domain: cherry.de, ip: 40.107.159.36, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyIrMn3XVp2iO5zXubSgyWrHG/lDyGD2qDhI09sfeyiBPNcKpwdKWr3jMMMM2RpEHnpMz/zOxo5BdOD9p4kdmXUQpd+Kca9arQIQv9BZITx04mCPloxRuQw146zxHd8XmoY1CFr91SVu0PXvLaSAAH6KrF3qjhZ7QetDX8Kk64jFTUkw3ptrNCHCg11wqA6mcKWlAbMRHJnwkB9c0AAqvkFhLprNkFAZ8He0k+/mbhwhWSa6rR4z0QXFKxDMPUlzYxHojm4SeKdkrcgrdDW0vilvzfciKyeJQ57L0m5IXpPaWipQoy7zt6pnXCxlVsBMI8I5+gjjADXySNGz/1Bbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn5UeuGvn4yUE5Sr7eA4j08NlpcnWVSg1ORArwIBpFY=;
 b=Mp/8Yrm9+GC69zN9V9L6rVfrx2VeO8ELavmH6eArkJYhyL2bJnYjDmS4A8JcIrPnwnS6l8eXN6z+J+cSigY4HS2wBttXgNFsbhIkKAmlicHb/kv/5XRCiBEu5Zy7nOzWEd4L2x+b2/mkcWwKnt7JnJCdH8EPPJSRiCIYCd7rTn1WbkHkFXqi3YQ74iFWYzYWcmf50HvDPR7YYUP37nVkBTyxRF7uWdFs4Qte5kGgHSL8OHz+YoeQ+M8MXcsqU7yVVekZtZPjQIjLBf44W4p4LhZAsyFe9HdKXemLjn0+sbpUgeozCKY19Ur2xhEiHKmEAkds2B4AlnTCngCEN+VYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn5UeuGvn4yUE5Sr7eA4j08NlpcnWVSg1ORArwIBpFY=;
 b=axKhln0XY4rDaXNjSSWrBp18eD520cBjI2iTTddUuz9ddZQr/MVekltWu84UxNfnG5lCfIPNA5XLUMUttMhrt2t2dFLRIFs62AKUJ3fZLa2xipp1GhLz0s8c25TZrToxCeBUKXg0Wu85RxEicPev9hOftNBeWHUZZcDF9g9+mHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AS5PR04MB10018.eurprd04.prod.outlook.com (2603:10a6:20b:67e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 14:46:00 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 14:46:00 +0000
Message-ID: <caf9df48-3ae4-4136-a359-eefc42339fe4@cherry.de>
Date: Fri, 6 Dec 2024 15:45:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs][PATCH v3] Update the documentation for SRCPV
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241127-deprecated-srcpv-v3-1-4eb17c564c29@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241127-deprecated-srcpv-v3-1-4eb17c564c29@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::19) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AS5PR04MB10018:EE_
X-MS-Office365-Filtering-Correlation-Id: 3805fd2c-454d-450d-93ed-08dd1604b314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cXBjcC91UnZDL3NYREhhSkthNmFIQ01DRXhFaDNHWEZHYmpiZ3MzM3UybzBh?=
 =?utf-8?B?b1FWeFN6UjgrQ0xmdmQ2OGZoZHRGT1JzejFoY2RYVHo4b2VGN3pCb2RIejNT?=
 =?utf-8?B?U09zZUljODllMEgraDdqYjQzZlhVUUUrZEN5WXZzRml5dVdKMC9MK1VzQkpE?=
 =?utf-8?B?SE1UMVNnSXpDR2ZZUVFDa1EvRmVSVC9UVXlwOFdKTGt4NW5GcWNaUUlUU3Jq?=
 =?utf-8?B?cFRYQkZ5ejNRU1dkem8xN09WSm56cXBiM0JBdnFZMTdNL3NpYUNIaGQ1bDNk?=
 =?utf-8?B?TGx3d2lkMStoMmMranpmbWRYemd6VWNkMk03UjdSb0tYcjJwazNmSEdRVkZy?=
 =?utf-8?B?ODdiOUQvK1dQQkNhbURpOGNvampLMTFhekVMTHB2TDRvOXhkOTBPS2FscUlx?=
 =?utf-8?B?aDNtQmxWd2xENjIvWUlFS1psQlhWWTJvK0xvTjJpWXZqYWpEZmtBVDlEbCsx?=
 =?utf-8?B?eHF1WDVnaDAyeDZDRm55WWhjKzJJNnQ4S08zYUdHT281ZzNMME1rclNDaHl2?=
 =?utf-8?B?SHhYbTVGNHNKdnpuUEkwT25uTWIwOU9UQk1pN1pPTENWTXM3Z25DRDlRVXhN?=
 =?utf-8?B?K3ZKK3Z1MjJYamt0bjkrVnp0TVFHZm8yTnV2VVM2VEp0ZVVhTWtSLzFtbCtj?=
 =?utf-8?B?c2JiR1lEb3JEeXVZb05GQnZvemhkQmdoR2RzYmdWL2NLSzQ1RjNEVzNDWGx5?=
 =?utf-8?B?QW5scUxmVndOcUw4MEU1L0ZMejFqdUpPdFFBRWNuc0kwajYyWUxRZ2ZwMXlx?=
 =?utf-8?B?MXNHcHFoQ1E4cVVHaWxpVHdsdHdWZEdxZVJGRHphcFdlQ1J0NDZiYUJnSXdw?=
 =?utf-8?B?UnZmK0F5QnRFNjdPbmJacW1LS3EyZVR3U3ZUZzNYTHdhMXRjQjAyRXNPNnVj?=
 =?utf-8?B?di9OMytpUFJ2RGpTR1hzUDFlQ2R5WktpVC9RdldqN0FuZWJvc1hNRDhKdy9H?=
 =?utf-8?B?cGM2bktEZ2orY05CM3pYRjkyYlhLeUVtTGdkcWlURmRNMjYxcGdZcHgrbEhL?=
 =?utf-8?B?aktsMi82Yklyc0hKUzhSQmZNVG5kZFNuZ0p6UG5VeDV4S3R5amZ4cGxNRlVK?=
 =?utf-8?B?ZlY2ajYvdUtsQVJPMzF5Y0o2bTdBaVlPczVOWUVUdlBLbUJmNWtBQS96djhW?=
 =?utf-8?B?bDZ6cmFXTHRvT20xUjdaMG1saDRjN09jT0taZHMyRUVYb083OWl3aFdkOVUy?=
 =?utf-8?B?ckZrN1NnYzU0dXhJZ0F2S1pETUM5RDgrTHErMnpmZG80eld6MzdSWEhhUkM5?=
 =?utf-8?B?STdWcTRSaEJ4QjlEdWRVVnp6Q3BoUndjTGpnQWRyZUVyYkxvaU9wREkrbWZq?=
 =?utf-8?B?NWtrbnoxYlAyNzJmdmYvVTJHOW01N0tOb21DVXE3b3lPY1owNEhyNkJNd2VY?=
 =?utf-8?B?Z2JsakxMYlJNc1JXWlByUklSTEc2dHBwUzBHZWMzNysvakgzODlPSmQ3UlpO?=
 =?utf-8?B?cjM1ck9zSjhjTEdhRkJKM2RkMnV3Z0VrZXlpa1lwZG9oTzQ4K3JqTndsVEhD?=
 =?utf-8?B?dVk5M214T1JITElQWWkrMm1mVEhYYzBiUy9uMmV6cXhnOUI2V3NxZ3gzdmlE?=
 =?utf-8?B?TkFReThIKzFhTVNoVldFemlicnFqUnlFY0NGeitMd3QzRkJyZ29RdXl6QXFn?=
 =?utf-8?B?VHdBcHI5dnFRYVlyLytwVFRMUEVYZGtMMEMvaDU3c2ZjS0w5QVZVNmlBNEMv?=
 =?utf-8?B?QjZvSTdteGhaWU51L1FnRzJpVlBYMmxhYjIxUForeVVlRWRvbnY3cTdhUWJa?=
 =?utf-8?B?ZjZ5MjFCTFp1akVySVpOajl6dGlUNTVWc1pJNWZYTGFCdTkxK1Iwb2tsQ3hr?=
 =?utf-8?B?TS9XVHkvcnVuclVSVG5Vdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aXQ2VG1IZTE0dXJGbU5CTlNkMTNzMjFGQU9YaWF3aHhuZGY1MFBxMjJMSmt2?=
 =?utf-8?B?ejZEWkpUVHRoZ1J3VEw4clBUVGRFR1ZYYm1IZkQ3eEcraG80S3ZvcDdtVk8w?=
 =?utf-8?B?djRuS0VjZ3gxY3JGYkFiN3ZyVXhpSkpTMUJqVWhGRUFvUDg4NTVrY0FXem95?=
 =?utf-8?B?Y25zaW1rdGFMSGtkc1BoNVBqTHZHV09vMDNRT3FPb1RkeUsyMHFpelczRmg5?=
 =?utf-8?B?cllpR3dTcFRYMHIwOUpod2c2Tkg4REFzQ21qVDk1VC95K2NEREZCV3lUM0Vq?=
 =?utf-8?B?VytkZ1NTdXJTR0c3eWdwVDlhd2lqZFZIeFMreEgxaXBYSnhrUEVZQXFVbkFu?=
 =?utf-8?B?NlBLd1hlZFJ6WDhEbmYvbzl2OFJsckVrcWRZa1JVUVp6MWJCWFhVcUxiRy9K?=
 =?utf-8?B?VmQwL0xjaEFRaGl6ZjJ2L09NZ2dqL3J1ZTJMR3A4eDJRbzREcTVSb0QwVVZ1?=
 =?utf-8?B?N2YzNnlXMnFEUGJCRk9VZ3RXN1NSZzZRMlk2TDVSQWY3Rk9iYXhMVnBKQTBY?=
 =?utf-8?B?b1FnaG1FNEZhQWZvRE1SQjg2cENNWW1mK1psb2Q1QUxyN0FMU0xNWk44elp0?=
 =?utf-8?B?YkIvNENNcENOQ0lBbkozNktBSWFSeldPdWlHL3h1aWt5TEc2S0o1dklsZGR2?=
 =?utf-8?B?WG5UMHlXVlF5cFprK3cvVjNYUEZOUEl1cnlNcyt6TU1mcWszc2RYRXBmaDdR?=
 =?utf-8?B?UlBtZ0hneTlKa2duZFNoVUVIRElDR1FaKytzMXN2UytpVDR3cTZZVVlxTzVK?=
 =?utf-8?B?Nis3d3pNOHZuTGt1VkZrZDhrNFlsaE9mdEtLdnl2TVlKcTVIMjcvb3ZsY0Rj?=
 =?utf-8?B?YS8rZjVxSG9rYVo4RytNbDhYRUx0dWxYVjFaaXk4TFRuMlhud0U2Y1ZidnR6?=
 =?utf-8?B?YUhMMkVaeXNTZHA3TE1DS0FLNGlRZlRWQzQwUHo0aEs3WGZENUkvWHF6Sm9Q?=
 =?utf-8?B?dHdjczBUSDhGdU5qM3MwOTlCNGJFZWh0QnJzb0FrNWlOMHYrazd5V2k0c2JH?=
 =?utf-8?B?VjMvelpFMmRab1prUS9uRTFRYWZxZUluUE85MXdYU05yZTVFd0tVaFljRDBE?=
 =?utf-8?B?WjBUYll0OFJLb1Y2OXNQc0U0Y0RYLzdBcE1IeWdxQ3AwOHMya2hKN2svdVV5?=
 =?utf-8?B?V1BDNXpza1lGbWN5NWxiSHE3Y2o4STQrblhTZjNIRXhFL2dOUkU3MGxiMTZK?=
 =?utf-8?B?QUZaRmE5N0IvQm9LUGtZWGRUSnJac2RFLzVtUGswYkdKUUpEWTRuekl0MllW?=
 =?utf-8?B?S3hTVElmM25lTkRTbTVPa3FDRUJBMElwbEZmVi9HZ01OSytTcVJ1V3FSMUFV?=
 =?utf-8?B?OEtQSjNUQVY0dkUwaEtlb3lLNHh6YXFTMFRBeW9Hb3RmOE51V1dRYWs5cFVu?=
 =?utf-8?B?ZFZGNlBTRFJqMjNuZjNMVUlLMU9tZERKbHB6dnN1SWlqL2hxRjh5UjlMUmhT?=
 =?utf-8?B?RFRZNEZCbWtpV1RkZXVBeXFWM2tUbDJuUVJON1N0WWVhdnpyY0xUVDBtaEls?=
 =?utf-8?B?ZmpvVW0yVG9nVlcveDFESE13RUFVeG5XRTRNUXlReTVrMEdONlBuaXJFdzN4?=
 =?utf-8?B?VDIzU1R5YWhjMEY3cVM1NHp6UXA5RDR0cC9DVllkaGdZdGxVOXlhbHErdWE3?=
 =?utf-8?B?QWx0aVY4VCtockpvUDlBOU02Q3BoeXhZZFVEV0Y0U3NxZzllVlM5Mmk4SGJi?=
 =?utf-8?B?WmNlV3hVaktHeVZ2Ky9mTkEyS2ttL1Nibnk5OTh4cjB1dVNxTEl4c1ZWcGRG?=
 =?utf-8?B?dTdoYUFjYnpSaVJaSTlkMkxEaFpSU09vZUZCeDE2b1hNZmlySW8vVXhVblJk?=
 =?utf-8?B?NkZCZU5XQnljSE5lYUd5TWtvaGFXRzJVWHlJcWt2bWJwS1N5VFVuN0pFNlI3?=
 =?utf-8?B?Z0lGeHhzemZzTEtTcGVydy9FQkRpMS9aOWw0eGw3TFI4SGFINWduV2c5YTZz?=
 =?utf-8?B?UzlIOUJndGFNNy92bVBIanBzclNWakg2WUQrblBVS1d2TGQ3cC9McEpiU2hr?=
 =?utf-8?B?ampWS1V1OU5mMzVJM3crWGFibDRUQ2REMHc3VTVVY1hlR2RBd21rblJOTUpk?=
 =?utf-8?B?V0FBd2F5aDZONWZOUGpkSkVzN0IrOVZUZUJKWnlGYXU2bzhGWmxBRXdvdi9Q?=
 =?utf-8?B?WDJaaG9YUk9EK2dxb01YOGl5U3grcjFCY3d4YjdhdkhHc3FCTndmekMzNjdE?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3805fd2c-454d-450d-93ed-08dd1604b314
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 14:45:59.9545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5rm9ocgFszU+KEkHzE5kWDwXNLAXw7FN1hJVYQ8yuMjgPoROrtkHfPZJRS1+zS0Hu7P1j0mZByaja4QWdTDy+yFdf/2AIVwRzU9dH5rgMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10018
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Dec 2024 14:46:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5894

Hi Antonin,

On 11/27/24 5:23 PM, Antonin Godard wrote:
[...]
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index ec4d7ab73fe3ac1bc64f5378c65d19ae0b749809..9bc07336a750beaf5c1cda8272f39803eb53901e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -209,12 +209,11 @@ system and gives an overview of their function and contents.
>            SRCREV = "${AUTOREV}"
>   
>         If you use the previous statement to retrieve the latest version of
> -      software, you need to be sure :term:`PV` contains
> -      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a kernel
> -      recipe that inherits the :ref:`ref-classes-kernel` class and you
> -      use the previous statement. In this example, ``${SRCPV}`` does not
> -      automatically get into :term:`PV`. Consequently, you need to change
> -      :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
> +      software, you need to make sure :term:`PV` contains the ``+`` sign so
> +      :term:`bitbake` includes source control information to :term:`PKGV` when
> +      packaging the recipe. For example::
> +
> +         PV = "6.10.y+git"
>   
>         For more information see the
>         ":ref:`dev-manual/packages:automatically incrementing a package version number`"
> @@ -5152,7 +5151,7 @@ system and gives an overview of their function and contents.
>         The :term:`LINUX_VERSION` variable is used to define :term:`PV`
>         for the recipe::
>   
> -         PV = "${LINUX_VERSION}+git${SRCPV}"
> +         PV = "${LINUX_VERSION}+git"
>   
>      :term:`LINUX_VERSION_EXTENSION`
>         A string extension compiled into the version string of the Linux
> @@ -6702,9 +6701,7 @@ system and gives an overview of their function and contents.
>   
>         The :term:`PREFERRED_VERSION` variable supports limited wildcard use
>         through the "``%``" character. You can use the character to match any
> -      number of characters, which can be useful when specifying versions
> -      that contain long revision numbers that potentially change. Here are

I would keep some of this in. This is actually a good tip on how to 
properly support bbappending in layers. E.g. gstreamer1.0 often gets its 
minor version changed in the same release branch. If you want your layer 
to be compatible with all previous, current and future minor versions of 
the recipe, you can simply use e.g. 
gstreamer1.0-plugins-base_1.24.%.bbappend!

> -      two examples::
> +      number of characters. Here are two examples::
>   
>            PREFERRED_VERSION_python = "3.4.0"
>            PREFERRED_VERSION_linux-yocto = "5.0%"
> @@ -6715,22 +6712,13 @@ system and gives an overview of their function and contents.
>            string. You cannot use the wildcard character in any other
>            location of the string.
>   
> -      The specified version is matched against :term:`PV`, which
> -      does not necessarily match the version part of the recipe's filename.
> -      For example, consider two recipes ``foo_1.2.bb`` and ``foo_git.bb``
> -      where ``foo_git.bb`` contains the following assignment::
> -
> -         PV = "1.1+git${SRCPV}"
> -
> -      In this case, the correct way to select
> -      ``foo_git.bb`` is by using an assignment such as the following::
> -
> -         PREFERRED_VERSION_foo = "1.1+git%"
> +      The specified version is matched against :term:`PV`, which does not
> +      necessarily match the version part of the recipe's filename.
>   
> -      Compare that previous example
> -      against the following incorrect example, which does not work::
> -
> -         PREFERRED_VERSION_foo = "git"
> +      If you want to select a recipe named ``foo_git.bb`` which has :term:`PV`
> +      set to ``1.2.3+git``, you can do so by setting ```PREFERRED_VERSION_foo``
> +      to ``1.2.3%`` (i.e. simply using ``git`` will not work as the name of the

s/simply using/simply setting ``PREFERRED_VERSION_foo`` to/

The fact we remove git entirely from PREFERRED_VERSION_foo and say 
"simply using git will not work" may be a bit confusing, so making 
explicit what exactly won't work is better?

> +      recipe isn't used, but rather its :term:`PV` definition).
>   
>         Sometimes the :term:`PREFERRED_VERSION` variable can be set by
>         configuration files in a way that is hard to change. You can use
> @@ -8316,21 +8304,23 @@ system and gives an overview of their function and contents.
>         (SCM).
>   
>      :term:`SRCPV`
> -      Returns the version string of the current package. This string is
> -      used to help define the value of :term:`PV`.
> +      The variable :term:`SRCPV` is deprecated. It was previously used to
> +      include source control information in :term:`PV` for :term:`bitbake` to
> +      work correctly but this is no longer a requirement. Source control
> +      information will be automatically included by :term:`bitbake` in the
> +      variable :term:`PKGV` during packaging if the ``+`` sign is present in
> +      ``PV``.

:term:`PV` ?

Looking good otherwise!

Cheers,
Quentin

