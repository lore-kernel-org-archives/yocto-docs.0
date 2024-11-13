Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A7BD462CF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:55:42 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.79])
 by mx.groups.io with SMTP id smtpd.web10.15133.1731513341483768164
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 07:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Z1WcV2V8;
 spf=pass (domain: cherry.de, ip: 40.107.241.79, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAtABhnb3TZvCuFWR5BmLj9e4jUKmeP6aoic/ARkSAnqWnvb62XiQxfoALJ1NDknIYEAxGil7xKpIXS2EqDJiB95CnV6cwJ/WNoKyRG5QN8m4wf7dDyYNXtXsKjVVwmR5O8rKEkK31jTyluMQuwWgebVoOtsVgIjV5C9MAN5+4P9OyHH3oo1AXclaOKUF/gC5IkEJVmbXj7+uNuHvjuxdhSeyQpex5wnmRiq2JvQEff99vFMzrs/JkU460IXhRbnVKjEQbo40CmB4ceHzqin5LzDQ0VkI3hM6cOZqwNILGjgq+vQgv2PL8JzOea38NbrT9h18k68ZFQqEQT0Do3k9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpJKXIAitFzs29QVYKK/fuN+6gyoqfK7orf9V4Tw0/Q=;
 b=Z95b31JFOqfZikX+0W60TPTAJZXvb3E9hnNv4T3nuUEV5TLORD2SG7ihDZTJV4wjE77KGxXkMPkBA2UNIcBM7isfXaCnm1lT7Grd9i0l/xo6W4BflgB2wbCPJPizbgvPGIZlhA06sq/J9kGh9LQH2gPVOms2QNhojcjXprcGUI1uXr09qnLijesOD320RBdBHDyiSG1OTWEFofMKMJWMcCW1Teqz+FlDAfr35EsOxSdMfwul/8KMvR/TAcb0y8mQHB0fS94CYK65EKoU3zSBbJKvRihf54InudwwDiO+4/MSZklGFx95V6BvnL2G+/4cL8zFyGyWpT+Dlj1Z2iqe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpJKXIAitFzs29QVYKK/fuN+6gyoqfK7orf9V4Tw0/Q=;
 b=Z1WcV2V8ZZgSOTzdmVE3MSBKYubyq9eE9WapvvsM1qmuaRMcyi5oxHvy5s4xJooOpoKIqIHPuq+6EY58Av2iQw+y05rHTklI1hxBMbcDd4Zkv2kMJ1PBGzw3DmFZ7k93a6rVMLKVAauH8USnENM2KKWEhqcMYu2i1tclBZWdlfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 15:55:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 15:55:36 +0000
Message-ID: <728c57bd-2f3a-43d3-a6c6-78a99a0baf0b@cherry.de>
Date: Wed, 13 Nov 2024 16:55:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v4 2/2] dev-manual: document how to provide
 confs from layer.conf
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241113-layer-confs-v4-0-a4758fa4d1a8@bootlin.com>
 <20241113-layer-confs-v4-2-a4758fa4d1a8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241113-layer-confs-v4-2-a4758fa4d1a8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR07CA0234.eurprd07.prod.outlook.com
 (2603:10a6:802:58::37) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: ebcebb27-8647-4aeb-ab6a-08dd03fb9cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dUpVZERwRWZzSU5aYTlENitsSGk4U1ZIaUw1RktpNmNlZCtaUVVKRUxOYW5i?=
 =?utf-8?B?UFdXK3BGUlU0elEzR2RMaDhJZnMvQTloYWNVRks4VUtNaVMvNjhnODBrZmFT?=
 =?utf-8?B?cTR2dXBsaEl1TU42Wm5qeTNXd1RKSGFjdnhSWGtYTVdVVVpNQ2krWDBGdWZW?=
 =?utf-8?B?QlFHN1U5SGJrdStvZW8wOUxOT0ppZHFkRVpxSmNYVUNtVmViMFhSM1lGaEJ2?=
 =?utf-8?B?MTNlT05pY0lmOVBwL083ZFZIWHJKc1JDb1JlbWhzaFNNdzI3ckI2VXB4bkQx?=
 =?utf-8?B?c3dlWkllOU9KWm15RzR4UUhaS2swWklCTmZaK1VoQ25WSEcwMjVOaDBRdHk0?=
 =?utf-8?B?eEZURkVuSTZzSGtwRkQzSCtBNVAzOXMxQ3IydEFTR0lxaXdna1VsSWIvMUE2?=
 =?utf-8?B?bmlaNnpBWk9SaG5QbTJmTzF3WEorejlnMnpFb2d0UHRRdFZxT3gvUzMvYXpG?=
 =?utf-8?B?ekgyQnZYYlEwYUpUbVdVSHNkWjRmcDMza2htNVQxUklXMEl3Wk9UcHZFN2tO?=
 =?utf-8?B?Q21VeTFwY25OOHQ0VDh1NG43TFRYKzFkYjlYV0ZJbGFBVy85VEkva1RUbWtM?=
 =?utf-8?B?emZlTmE4a3BEVEcrSTdqdFJ5MkJmNTVDQ091UGpSRU5laFNURlBVUGEwOHhH?=
 =?utf-8?B?SE5iMnZHTEFTVmVDVlUzeWR3OU9CNzdLMENKLzcrdXBreXczOEh5YXBRZmJh?=
 =?utf-8?B?QXRwR3BveFVlUTNmYWlqR0JodkQwaHg0VEh2OTRmWXZnaC9MOExHcDFiVWZV?=
 =?utf-8?B?KzgrNnpLbWhDdnNESUwxdldKajZvci83VlI4UVAyL1pkQnBqc1U0ZUkyRFRI?=
 =?utf-8?B?bURENkYyczUxc1NZbU0rTHJuVmM0cVErTWNJNHczdFE2Wm1yVVlvOHFOM1dF?=
 =?utf-8?B?aWkwdjBIMEFONDNsM3o2S0tld1hESzArTERYRFBVWldaaXREWjJHQVBySmhG?=
 =?utf-8?B?ZmF0Qll5aXpPM0l5bXBTWGFIT2hjOWZ4YjJ6cmZxRGZNQ2R6elUyZ2NVbzh0?=
 =?utf-8?B?MG1aUEhZTDc4NEZzSzF6L3plNFgxeGtYWlJTdnlMdDEybW8zeHZUZU5Jb1NQ?=
 =?utf-8?B?SmNiL2MxL1JsalVuaDREUFdNSjdvUmdLdUZDMEpuZU1sUk1ZQWJETDVXeldX?=
 =?utf-8?B?YkYvYUlCeFY1ZXpuWWs0LzZud21lZzRpc2xObTVlNVJQWDZQRXFzUm5UNjNT?=
 =?utf-8?B?dmNJVmQxYWo2Rm9CaEJZc0pZMUVmRG44NlduV1YyaVQ0MitxVTRUT3ppUUU4?=
 =?utf-8?B?YWJSRnRyUks4dnhudWM2S3BNTVZOTWxhMjYrYnR0dXVnQUFnWXFJSFBBN0tR?=
 =?utf-8?B?R0xOZEY2eCtjUC8zVkpNSnpHVlVxY1JXamdKSlgxcDVlZWpEUnFUWnVwT1U0?=
 =?utf-8?B?WlNLTVRpM21oSjlUZ3IwOENlZzJSWmxyeWh5UFpnUlpvZ3hDRERUcjJLbkZW?=
 =?utf-8?B?VVdRcGxpMlNlbjBlTm8zK1hOMFd6VGY4SGkrV1lzYWsvckVmc0o4T0lLTVhC?=
 =?utf-8?B?cDAwL0pSdkJGb0Y5TmlxamVNcE5wQld4cWZ1Nks3UGNYRkNyQkloaXZWMldz?=
 =?utf-8?B?TVJLcUtVa3VTY0U5eVplZjN6R29BRkVTQTJ3WmZodSs2cmlUS3pDQWR4VFJN?=
 =?utf-8?B?ZElGdFlGSDJFVWVJdGVUK1RaWVpVRWlEanJuRkZBKzJTV3hDd2tpZVJEZktB?=
 =?utf-8?Q?TLUnxdtaJM1Z2WgnsYTP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SmF5VVJJOWFraDdFelMzNGRoWW9EbXFmODRIc1ZybjVTMGJMaFUvMDZtOFI2?=
 =?utf-8?B?VGMxMTFLaXFOejY1UHE3WndCZkJScFRqWFhCdkFwcC9mS0grRk40dmw5WW9H?=
 =?utf-8?B?QUU1c203YUk0UDhKMmFhdW1PUVZJNFpPVzc2ang1VjNZNzJTeTdMVU5DZHJp?=
 =?utf-8?B?Ym9WTitOc2Y4UEFFM0k1K0FQTlVIeDZiSW9uKzRnbUM1TjFrYnJwQlBmcVo1?=
 =?utf-8?B?eTZMSy83WDZEa2FCei8zSDU0MjZXTWY3SnNvd2x1MEduejRCaEM4d0NxVWV4?=
 =?utf-8?B?UEkzbVBDWDdiRE9UY0U0NTNzT0U5R3dMV3NFLzkvSnhxNGI1eERVSHYyTGZC?=
 =?utf-8?B?cUhPVHJVK1JnZ1NHQzJ2TzllQlFhT3JWVHdIM2dZVUlOOWg1Z093M0g1b3Bs?=
 =?utf-8?B?SWFlcXRKaHhTeDhWNTE2TWNVMDgzdHpFbnJyTm5SRUxKOVE4SmlOZE9EaDRG?=
 =?utf-8?B?eUhuYXlhL1EyQVNXS0ZmRnlPYmkxMFNDKzk4STd3c2xhL1I5dnkxcUU5V2pv?=
 =?utf-8?B?SU00WVFUWUJZT1NqYS9DRTBRTmp6OG9kUHBSK1lvYjdWQXpsdDlvRVk2ZFpY?=
 =?utf-8?B?alhIWVVGcWFKOGxxNHE4OTZ1ZnpDZytZU214c053UmpFd09CSzJqc0JzWXZh?=
 =?utf-8?B?eFpYeGtHdkdJdHpZQ001ZUxLMTU5SHorTjZ6ZGdBY2l2NXE0eDFYekpOMFdX?=
 =?utf-8?B?ZGpITWh5cVBROHdTVVZ5a3pkaSsrQmhHYzhGai9oUVpJenY4MDFPTHZ4YUN2?=
 =?utf-8?B?YW81VmpVNzdrbVExdWpmbWp4VW9xYytYeGN0eVIzalVsU1FIa3RJOUtRWjdi?=
 =?utf-8?B?enlqTnE5R2tYdXlwRmh6QTRkdnhoWFVPV0pLU0RDaVB3emRySWxqaEtFNW5m?=
 =?utf-8?B?YUpkb1pxRTFzQ2MvU2UxNnNORjBwaXYvdCtTdzg4eFo2ckJLcHpzN2pFMGth?=
 =?utf-8?B?QkJkeTFGeWhmeUhyRTBISzVKTUxnNUxmZ1RmMUlMbC92aHVlZWREcmdaRGVl?=
 =?utf-8?B?RUhyczU1NDJMTDNkUkc3ejhYMGhyT0tuSWlqeUJtKzNJTzV2UlNCaDdSRW1U?=
 =?utf-8?B?d2hPcjZGNy9CeUZydnhOOHh0WWowa3FsOXljYmVLVDZTVXJsbXFYejRHZXRa?=
 =?utf-8?B?UEtZZnhxY1lFcnZ4d1VJRStORlpFWjdrRmpZUkhGZHdtK0hrT2FLRzlPZU56?=
 =?utf-8?B?R3ZmMzJtNDY4ZEtCamNtZDVnRFExWEFXN2w0Ynp1R3BDZTdEdE10eFZCTVZE?=
 =?utf-8?B?VklreVJhTE1WcWU0Ymd2OExQNGdtRHZma1NoaHpQUEY1OUdZL1piaDNNcmE0?=
 =?utf-8?B?bjEzaUtDSHJ3c2RFSEdTZno2SE5Xdlh5WDlWWTFXeVhIVEVjSDdKemdKTHZF?=
 =?utf-8?B?Ui9tRm42VlZzZWM1WUNHaGZZRXk2MTNTcVd5VGRLa3l2V2p3K0hCTVpKL29G?=
 =?utf-8?B?OTljVlFQNEpnZ2tQOGVMak94MlVCSUg3SW5kaFdsVVJpOStvK1JuUDNVV0JC?=
 =?utf-8?B?WFFjZU9GVDdsWXI3WENqOUdTWGRKSVJvdW9NRDFBR3BWRTJpZ0FibXZGQzRE?=
 =?utf-8?B?RDgzOWoxR0NJckk2bThiT0RmQy9vV1h1aHNpY1RaMTlDVTR2UmRSc0dHenR3?=
 =?utf-8?B?anNtSGlRMkFMQkIxVWdrVHhQaVExMWpHSGxyb2RnQ0ZRWDFtTmxwRVdoT2d6?=
 =?utf-8?B?M09yd2VCRWVEcDF4ZjdHUE5VZWo5MkpTOVh4MXFZWkt0bzJscTQzSmpvVHlj?=
 =?utf-8?B?SnNmR002MGtkYXEzLzRFQmFzbTFGUjNDczBuTGlWREdTSzBydGJ3VjFvWXQw?=
 =?utf-8?B?M29RZFRHOHdPLzBBdmlWMk45aERpRFdCWUNzWHZFRmJMUlJTM3dWY0pBcEVM?=
 =?utf-8?B?L2hTSDZraG9LTzdGUjkxT1FhRFNUbXdxMytEL3VFaUxTUGFSMVZUVHlieWhW?=
 =?utf-8?B?RjRjZkJtZlVlZFlzMllDSVZSb3BXblJjZkxpVGJYRnhVU1FiNjUyamxqWm9G?=
 =?utf-8?B?Z3drZEE5MkhHUFVlRS9jeVBVL25xZnU5VWpLRnhyanN0SGRxQXBMcDQvZlEr?=
 =?utf-8?B?aXBiWlB4eElmTVMzTlpBbW85RkRyclhlc2NSYUhEby80L3YrNXRRTStxcWZ0?=
 =?utf-8?B?UmREMml6cW50aUt6cFVlVWlVVm05UVNSdTBBcjBjVVpORGN6SUNXd1NEUVI1?=
 =?utf-8?Q?O7kkRh12Ggorl70A+W3AezA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcebb27-8647-4aeb-ab6a-08dd03fb9cbe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 15:55:36.3758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfWCxVC7jB3rKKkW1o39IPDss9eHhZZkMFIBZrDaYT4ckkJd/5sTV6ZVT0/p+auWpr8HfXbd3tra9d8lfoxtIPO/fTwuWzPOZohtZn3Fg9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 15:55:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5741

Hi Antonin,

On 11/13/24 4:28 PM, Antonin Godard wrote:
> Add a section on providing global level configuration from the
> layer.conf file. Since this file is parsed at an earlier stage in the
> parsing process, it's not possible to combine bb.utils.contains and
> {DISTRO,MACHINE}_FEATURES to conditionally set some configurations.
> 
> This patch documents:
> 
> - First that this file can be used for providing such configuration.
> - Then demonstrate how to conditionally provide them, using a technique
>    that is currently used in meta-virtualization
>    (https://git.yoctoproject.org/meta-virtualization/tree/conf/layer.conf#n50).
> 
> Fixes [YOCTO #12688].
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/layers.rst | 90 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 91889bd0ae391c7b6e62068778ae5c180c840762..39cd1963a60086902d7e04e4bdde01f7e661371f 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -644,6 +644,96 @@ variable and append the layer's root name::
>      order of ``.conf`` or ``.bbclass`` files. Future versions of BitBake
>      might address this.
>   
> +Providing Global-level Configurations With Your Layer
> +-----------------------------------------------------
> +
> +When creating a layer, you may need to define configurations that should take
> +effect globally in your build environment when the layer is part of the build.
> +The ``layer.conf`` file is a :term:`configuration file` that affects the build
> +system globally, so it is a candidate for this use-case.
> +
> +.. warning::
> +
> +   Providing unconditional global level configuration from the ``layer.conf``
> +   file is *not* a good practice, and should be avoided. For this reason, the
> +   section :ref:`ref-conditional-layer-confs` below shows how the ``layer.conf``
> +   file can be used to provide configurations only if a certain condition is
> +   met.
> +
> +For example, if your layer provides a Linux kernel recipe named
> +``linux-custom``, you may want to make :term:`PREFERRED_PROVIDER_virtual/kernel
> +<PREFERRED_PROVIDER>` point to ``linux-custom``::
> +
> +  PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
> +

Final nitpick :) Two whitespaces instead of three here if my eyes don't 
lie to me (not worth a v5 though :) ).

LGTM,

Thanks!
Quentin

