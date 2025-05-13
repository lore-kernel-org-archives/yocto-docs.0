Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04063C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 15:37:13 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.54])
 by mx.groups.io with SMTP id smtpd.web11.79742.1747150625356176343
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 08:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fjL7LgU3;
 spf=pass (domain: cherry.de, ip: 40.107.105.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rM+WFZwrA3LpANdFMkOSQl2z8LoZquPpO3jTIbSusvp6mneoRYl75dZysDsf+yO/CQyTTitnnxj1Es0k1VO7QqNJBhnBAXki3EIlQgMQvsxTHEEgFJhjwyTPve4YCbqJ2ehWSf2DPifU1NJyBEYkIL956noxqOTSw/1i6DE+zs7CTEJLWG7HWcVCCORiB6lk/mHms6jIBaEIOlyJEvC7fziu3k8qY4pwpKMPu2Js+grfl2ZU0/GKDfjOm4KrHY1MZRNCZbB7xlBtlRlVxPnyZhLK++88QqW4LpdiihiH0eOb+OLFZBPe5UmvjjNVBzzUJCWMCoV3Sa138vl3+ShnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiFu16H36R3FGzJmFUAvywC73Cp6C14Cj4oatbztqRk=;
 b=qagF4JuUFZc91XV+KUY9hCE9Im37/ee4QVAp+LyZzHfG0s8jDDGHOknxoVIZl7uYAQ55ysyhAR4ib6yaIt0ZEkz4NkbzfFqsfcc4JP50oIMlQIz+jWWV1eqxmR2rIWVh70LcHl0V8qjakPBFFcGCBVuCDd+xj9sgKbyEte/CZI4kGm6sLaXnsM86X9Mat2CxFA1eAZakE5njB9SYQbAXdZefFYLUid06WPPyzuv5xwYv4NnweFLYGDpccgfwwCKQHcA4a2pjzKuroDERxcVWa+JXp/ac21PMimROFVt8ErNz1prg4UeNPwTyedscY0gL54c3OHQOwAemK3bJdpDMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiFu16H36R3FGzJmFUAvywC73Cp6C14Cj4oatbztqRk=;
 b=fjL7LgU3UIT2t1v1CBGXXIJ9Vquem9r8YweIVRN8sBEbHk1N4BkigrleIZ+HL7TqCByhtT5rG+vJlqm1Fj2fgBIrEaM7uk2DuX1yarz4jOBrBgXUxbQUZeVdIoPGJXwtevl6CNkGxCp2jjUzOnP3AZNYo9K4pnFdYPNCR9JpXD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7992.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 15:37:01 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 15:37:01 +0000
Message-ID: <7a5e1e18-02ad-41de-aee0-3a00a35ec0be@cherry.de>
Date: Tue, 13 May 2025 17:37:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual/variables.rst: document
 WIC_CREATE_EXTRA_ARGS
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20250513144803.26956-1-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250513144803.26956-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 8937a4b7-c37a-4e87-5fdc-08dd9234012d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eStWZkJWZ2tLcmFuN3Q3dGFqZHNGSmxHN2FYTUdacWxkK1JVR1VDYjVaNnRP?=
 =?utf-8?B?NWNqNStuNWRDNjdSSkFoS25kby93V2VWOFFoTDdSL3F4Ny9rRmJPLzBpOTFt?=
 =?utf-8?B?TDBOd253UUJISnNoVHFoMHdhQmxUdUtZUDkwbWt3YTFMeHhDRmdvZ2VCUEw1?=
 =?utf-8?B?TUZUZEtGVldOTVNyNFcwNFU5V2hJTHMvOGJ1ZnZCanN6d3lIMWpLVzYveERT?=
 =?utf-8?B?S1V6VnF2ZVI3a1RjRkxabjBoc3o1ckYzaE52dC84TUg2TWZ0NHR2OGJIV1pu?=
 =?utf-8?B?VDk4MHFuZFhtOXZiQmd6YTZ5bDQ5OWhOL2FUaTZxcG9uOWljRS93SWpaN0Qv?=
 =?utf-8?B?VGhGNnd5SmxoV3Bra0NSaTVXYVhVL2VUVVBBbGRSUGZVamZ6dGQxd284cCt2?=
 =?utf-8?B?Z2FLTWNVTWZmSDRDTHYvYUs0OXgxdGduWGtueSsycTVEUUxmRU05SWM1RlBW?=
 =?utf-8?B?N2JCR3htYnMxL09lL3BTdVlKelU5Z3dpMGY3U1hJbkQ5VTdlaFlzeFlQY3R1?=
 =?utf-8?B?aitCSTJud21DdEY2OEc0L3N2NnFGYVU3TENCYXFHUXo5ZENHaXRKYWZDVlNh?=
 =?utf-8?B?ZFZkYmZDRjJUdjlvMXJPYXhKNXc4aS9PeVVZWnl2ckdCb2ZJNi9BbW51dnAw?=
 =?utf-8?B?b0lrMTVrZGx2NmZza1VtQjVNOTJhaE12WU1GMlBlODBtUGQxb0tWcmhPNTcx?=
 =?utf-8?B?cVFrZWtUdkFNT3pORURrY1lLOFBIdUVqN1pkSnAvdUIwVGtmKys5NGFnbk1O?=
 =?utf-8?B?REtib1piZ1pydnhMa2VlOUM2OWxsTEwyRjdCcFcwaVQ1ZnB0MWZrZ1R0U2NX?=
 =?utf-8?B?L0RpSDhQUG1NVGQ1ajMzKzQwWGhkNGtUZkxYZ1YyaTdaOFBRWFJIQ3hoODdZ?=
 =?utf-8?B?dURWZFg2dGxuMjF3ZTlRS1VhWXB3SjlSUWswQ3V2cXYvN1VEL1QwZWF2bTY3?=
 =?utf-8?B?QTViS2t3SnBkN01mRjR6R3ZFa1plLzJVeGY2SUlQR044a2FBNFVWN1lUSGhj?=
 =?utf-8?B?dXFkMVVmZ2RvLy9wNUFaOGFBRUlDK1NMenlYbkZWbDlCYTEzbWJCbTNmeWE4?=
 =?utf-8?B?K25UendCMVBKNHpQcFFKL0hkcXlxZmtMN1IxTHNQN3ZUeXFybnJBWTNxb3V2?=
 =?utf-8?B?L1Z3cXlZelg1QjY1YmQ4RFNEbW11cEhWblI2MU5IZVNjalA2VHJzRnJuZVdT?=
 =?utf-8?B?Y3pMTmpkZFE0U1pHNlE4OUpUTERtakNQTEppc0dmWnptaXpmUFZWVE1Nbms0?=
 =?utf-8?B?aG5hMjNxbUhvMU9ob21mV2NlMzQxc2VlK0dDR09hdFhzZG9hMVpBOTVKelo4?=
 =?utf-8?B?RVpyYWRYTUJ4VWNheWNaYlIrMnh5VVkxYitPVnJFZUg3TXo5Zml2azlMRkNV?=
 =?utf-8?B?bnhVajVVNzNabjVqcUJMQWhyZ256YzE0T0Ixa3ZHcUtlRm81SkFUblJSUGNo?=
 =?utf-8?B?dFhvUFdERzhiU1pYVG9ZeTMyb0xqMzZpWHpUVndYRFVXUVkvakVoaUkwcG90?=
 =?utf-8?B?WXNCNDJFa2NGZCsrdW01dDQzeWxlMUVtK2txemxPY21uOVFmeGZmeHcyaUVs?=
 =?utf-8?B?QTgwOHJWWkJ0WU9CMjU3WHZnVGh2MWRlSnZYZTRvOWtiWldaeHB0aXA0eFJ6?=
 =?utf-8?B?N1lXWEhjSmdjRVRqSG5sdU14aW9IdDE3WnZCN3cwei8wS3oxbUl2N2s5cE9P?=
 =?utf-8?B?d29JZjMzWlFLcHA1clhldDhlLzArSlo0Y2l3YUxmTmlFYTdwYk9RTlpBWERS?=
 =?utf-8?B?YzdCVzQ4L0Y2Y2I1ZU44Y0IranlqaGltQlJKMFQ2VHlQQ1JHSXR5ZzZRb0Iy?=
 =?utf-8?B?enJmSnZMRjNxckFKejhxb0dvOXZZWkF5Q3V2Z3pMU1ZMUzQ5WHlOaHhKWVdP?=
 =?utf-8?B?QmxVU3R6bTJCQlEvTmZ2OU5VaWlwMmFkdk9jWEJ4S0dLRGlqSno0UEpKT1pP?=
 =?utf-8?Q?SEK2g4+AGfI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TWhUems3b3g0QXF2YmRaN0dwVTA1VVoxQjhaQ21CL3BYc2hkeXBadXI3R1g1?=
 =?utf-8?B?Z2NoNGlMTWF2VUNRcko5NnBqY0lGb3dub3hVT3RwRTltY01xUkNXdnQ0REZH?=
 =?utf-8?B?Ui8waFJOZFhiajFBMExlaVNmRGpndGsyYnRVV3NKaFVmS0sybkpQY0hTdlFq?=
 =?utf-8?B?UGprVTdNeGt4Y0wzaXNaNEpBdVQ2SXF5eDIrYWVHeWZmSEVhcWF4TDRIZ0tZ?=
 =?utf-8?B?Rk4vekRRL245aGRoUkFiSGdaT2l1clh4TXhwOVlDMU15aDVTTDFtS1VWUjJY?=
 =?utf-8?B?YWFXNmdwS01XWmVRalFqd2U0blUzRm1BbWlqOURVR1hndE1pQXlWdGhFemF4?=
 =?utf-8?B?UWdJc3hIaGZPT3lVWUhwSU1iRzRJdmIxd2pSZ2JuYzQ4aGF2RTRoRGoxWkFS?=
 =?utf-8?B?Ujc4QXRGWDlTdisybGI3clNzNEMzYkdLalBxQ3lIcm1jRW9oeUVTd1lOcUJC?=
 =?utf-8?B?V1RaWHB4NktTK0NiTzVnVnU0bEdJVE9LYU9wckR5aXp1NnFHTHZZV0hvZytL?=
 =?utf-8?B?Zzd5a0RnZTVoaW04dXVGdzVyTlBlanNMYktXamJqNlE4eVpkdkJHUi9LUDJn?=
 =?utf-8?B?aGhTTXRvUjd3bWZpeGx3OEVkVnJpcDczYll2Zi9FSDRjcFF0MGFkbTRUVERx?=
 =?utf-8?B?MjRlUkZLcExCR1pvU0F2NVpacEdEYk9VanlpVHUrdi9nWmxZNTdQUC90bGtO?=
 =?utf-8?B?OHp4NVhkUmRxclpVemlwTFZOQ0wzSk93eWdFbkc1Rm1LOUEwNERTemk0RndT?=
 =?utf-8?B?WWlRYmJtdXZuM1FqcVg1V2pCaGRiZWpWdGkwQWhrMFNwelV0SHFvZTV1Rkhp?=
 =?utf-8?B?eXVtelZpOWE0WnhXRkZaOTRVbkdSQ0o0RUY3RDhMeU40VytJZnc3K2J6eXFt?=
 =?utf-8?B?TmNwZ3dGK01meHUwRTZWSGRTeGtxcENkTDAwYnFuNWpycHFhc1UxRU50RVNj?=
 =?utf-8?B?WmoySTJOeFZGNjJDdE9XQXdkWi9BNmszdVZiVmU0NXpCcldnaU1NengwT0xM?=
 =?utf-8?B?N0dMTHhIU2JBdFlBdHpZbkx6eVRSdDlBelhYVTdjeHNsaUh2MS9zTzJ5MWlX?=
 =?utf-8?B?bnhRVWNWYUNudWl1SDJlMmVoMzVRWVpuTm1PazFBa0dMK3BQOEh4OFdBVFdL?=
 =?utf-8?B?SGpReUdScGs2aGZOQlFFTURiM0N2d3VVRFh3bytxSWtRMnh4RjV6UHVESFVF?=
 =?utf-8?B?b2RLZ1d1eDNkeWQrbGRTVzJmSU1Ra3BRelJ5SHNlQkdHeFVmb0txU1N6SzZu?=
 =?utf-8?B?Q2ZMd3B6TjZjRGswRDU2YVJwa2FVYXNwK2NXWTBKajc1YjRnWGtzU1hDUHl1?=
 =?utf-8?B?Ym9RKy9hWTlXUFlGelAwMGl2VnR3R1lXTTlXbFZyWmNZdHowYnV4a3VGT1NM?=
 =?utf-8?B?V1FwOTlZR1BWSk5PT3k4OGkxSHNUa1MvamhFbEZYaTRyMU9CdkFkSU94SFIw?=
 =?utf-8?B?ZEVxWHVvUEUrWkpmYWtyVTFFUlhTZGh2QW5od0cvU3lYNVV3QUFqb1Bjdk9F?=
 =?utf-8?B?dGFrb1lqZjFtcThWVVpzemk1MDZaT1QxT0txK2FaM2k5cUtoNkNDNTgwM1NC?=
 =?utf-8?B?N3FrZmUxR1U0TXdPNmxxRVVPWXVVanFnVFUwWUNNeWd0T2F1dHRnSkFZL0Vk?=
 =?utf-8?B?WkVGV0RNb1lxdUkwbi8venpmMU1ndHVjNlFsRU85aE5aZkdENGF3aDdUdHhO?=
 =?utf-8?B?YkJldEhTTzFjY2lPekpwOERYTXJBWGxjUkd1WWt1OXNkd2VhK2RqMk43YjY3?=
 =?utf-8?B?ZXllc0U4aG13NC9GeU9Rd3hsaFZlUWMrRlEvUUFCL0NoMlFsY1pNWC90WThm?=
 =?utf-8?B?cW1tMTBuaUtxR2FQUEhpeXZDb0ROZlllOWU5UkpaUmNHOGhPQ0xTU1ljTjBs?=
 =?utf-8?B?dkJ0WlJkeVhMMFB0MXNOdnJZN0RtN2V2MDY0LzZVSHB4bng0ZFRrRWxnL0ZM?=
 =?utf-8?B?WTJKSCtWbm5QS0l0Tk5xV2hxWEtWSGtTdUtXekhvbUlIZGswcEgrd0Qxa09W?=
 =?utf-8?B?cFZvRFgzUHRQMjFTQnVWVklYU081Q1lESzRObnBwbXZ6RmUrNnB5STJseFR3?=
 =?utf-8?B?MERucG5Fb2h4UXRmcW11MFFhTUViNDVDVnJnem0veXdieEJPd0JTSWtrdFZB?=
 =?utf-8?B?ZTBiVHkwL3ZmZlFRY0xBMWNRQjhDd2RjUUMyV3oySFdUSldVNUNVcVVQZjJL?=
 =?utf-8?B?RHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8937a4b7-c37a-4e87-5fdc-08dd9234012d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 15:37:01.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60iKyj0JrvDHYQrBpMQXCtpBaMkYFfs05lTYcRhGlupORCPUpb9U39NztExfZ6qQJFEAWEJwePfyOenk6guzWNUS45zAGWAG1uGO1UozlYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7992
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 15:37:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6822

Hi Trevor,

On 5/13/25 4:48 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> Fixes [YOCTO #15509]
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Try to add Reviewed-by trailers to the commit logs when they are given 
on earlier versions :)

> ---
> changes in v3:
> - add tickquotes for -D and --debug
> 
> changes in v2:
> - link the phrase "Wic image" to the dev manual's section on creating wic
>    images instead of providing a paragraph at the end to include the link
> - remove any reference to a bbclass
> - reduce the number of "`wic create`" phrases
> ---
>   documentation/ref-manual/variables.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d17f81036b7d..670cb3e0ef28 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10942,6 +10942,20 @@ system and gives an overview of their function and contents.
>         Specifies the timeout in seconds used by the ``watchdog-config`` recipe
>         and also by ``systemd`` during reboot. The default is 60 seconds.
>   
> +   :term:`WIC_CREATE_EXTRA_ARGS`
> +      If the :term:`IMAGE_FSTYPES` variable contains "wic", the build
> +      will generate a
> +      :ref:`Wic image <dev-manual/wic:creating partitioned images using wic>`
> +      automatically when BitBake builds an image recipe. As part of this
> +      process BitBake will invoke the "`wic create`" command.
> +      The `WIC_CREATE_EXTRA_ARGS` variable is placed at the end of this

We always refer (or at least should always refer) to documented 
variables with :term:`WIC_CREATE_EXTRA_ARGS` so that a link exists. Yes, 
even in the same section it is documented.

Cheers,
Quentin

