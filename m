Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B076D49216
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 12:07:25 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11188.1765541236828652240
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 04:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bIr2YSG5;
 spf=pass (domain: cherry.de, ip: 40.107.130.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQAnZmZK7ma0c8sqPmS6DlmMLiksvHSAZhjPZlr/mDh3LpBjk/1J2YEWMmc1G6PeR2gD15M5xH5pXxIX3SkeiSII8pX11IZUGbLRZfad9oG17TQ7vbsdGuuTZs1399I451Lho6tyCF4RCg6IiL7zrYG+hfrd67RAJVsxfNVukSK5qOQd1JBBxeso8rxy08hIJNRTg3dpcUyasdszNIRMQ304RNTmA+edXHPjJmNPiPPvgKM2Vv2nOktcee7YSh3p+WWGV1obRvplRn3gmKOBea87/Z2HvfYiu97MckV7BsQ7swtR5XldjyVi6TVKiiOkLF3MyapBIa2u19legcYmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wICXaONMLS3MjEmiCSKoZLhtXPHuVCHeN0EqVcg5/R4=;
 b=xVWHWoa5iQmI31tw8rQ1Dp7XYbzXWSYWbGfqzYvPSAeGfO70b6q4cqtH7uoNbxJEf0HRG7X6gg4bYJaBXuZNvP5+VUBhu9GWkvE3pjwJkAnvF83Cv13Ww624hEr2kydXWQeWcWVspG1WIdVNjB3C3lRkNhi30yDeMKeItdDTrzinv/iwwydM/4LqE6f2kTLSr/mqPURMhGaZyKxIJO2pKXXG51e6EkjNZtMhwVZNpO6l+b4oTMSJ9RJ4Q1NXN/cSEUkq4Nclu5M6JssXKLuXbJuZrZf2qhQzOkcj0hT86tiGZMvfspgXjmNi3dnAevyJq17Eth3vGrFeyjRuTqX9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wICXaONMLS3MjEmiCSKoZLhtXPHuVCHeN0EqVcg5/R4=;
 b=bIr2YSG52gs6hRtJQ/rPvwPhaKUyRlFKqwJ0MHYNBxHfTM+6bXaV19HdYG7f+SBnIg80yW8IjBWcDKXGHhgllgF/wK+tjzsbjIXM1WgUABfNF6trxaaMgfxmWNIDXwu/5jYE0Tbz/jsQhlymoeroXcwILawrEX0yLoIlYNfDUKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8130.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 12:07:12 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 12:07:12 +0000
Message-ID: <72fe57bb-a025-4816-8337-e3791a300398@cherry.de>
Date: Fri, 12 Dec 2025 13:07:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] ref-manual/classes.rst: document the
 image-container class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
 <20251212-image-container-v1-2-fb6586d06813@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251212-image-container-v1-2-fb6586d06813@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec2604c-8bcf-4b1b-d730-08de3976fbd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEJJeGhHQkZ0RmNiczFzd2E3Nms2bDdpbXFEZXQ1SlpGc1crOGh0NDJqNGhY?=
 =?utf-8?B?Z2VPMkR6Zk9hY25vUzVaa2VHU0YwZVRRZll5eE0xQ2xzM0ROZ3dGZVRRM2J2?=
 =?utf-8?B?M0Q0WEhwNTNsVFNCKytnM1ZhU01qY0pzemNzc2J2NldNMGVIZ2t4Z2JPS3V1?=
 =?utf-8?B?c1dya3d5K1UySldVNklhMjhWa1FmVXZRRXRDZnFRajh2bVZqR2lBS2VkSEZG?=
 =?utf-8?B?M0YxbzMvVTFFdlhHQTBrYU5JT0ZpaVBLUTQ1QlhGVi9NYW5yNVJ2RW4wQkxZ?=
 =?utf-8?B?TndFVDJSRldtWjFkR0h3MFhiaUk2U2d0WVIwS1orMU04M09ZY1E5a3d1WlNk?=
 =?utf-8?B?SzZMaEJZeWFLVkZWUU1RaENTQzdVUkVVUnRVakFxV2l0b3JNemJ3RURYbWpo?=
 =?utf-8?B?YWUwVHViVW1rQm5QblQ0dUdBTDNwd3ZVRGxEeG51OGNxK1RlanJZM1dEV3o2?=
 =?utf-8?B?MUFkbzdRdTJQNXEzcFJ6RW5XRGw4QUptMzMrVW9qY3ViS0ZZM0d1R2JJK3hY?=
 =?utf-8?B?YnJGcDJkRkVEV01RWUJHb1Z4YWNkRUE2a3BVYzBnUFV3aWRzZVZldnVhOXpF?=
 =?utf-8?B?bHdINjhKOVRhWHZqWE5HekRNRFFTeWZVT2I4c3M0d1ZrUlkvVm40SldrU0V0?=
 =?utf-8?B?RjlIMXhLc3BLSE5tSzNxY3ppYkJRVlEwWnY5TDVUaWl2eFZOdmdFRVpDMGUy?=
 =?utf-8?B?K3J0YlprTDdqTU01eFZpVXN1UmkxV2JpRDdxQ24wTVlUMmg3Nk5jK1RCOWEy?=
 =?utf-8?B?UzVLbVk4SGpWOUNhOHRDRmh3M00xVDBTZ3pYMHpaeUo2S0xZWnovWk1iV2dK?=
 =?utf-8?B?MTdOMXpqOGFKM3dON2tHUnp4V0ZoRVd6MXFxZmlhUnFUaUpFeFphc0JzVGxK?=
 =?utf-8?B?ajBaVzhTM3lxZDF6RmFsVXRvbmFqTm15M2ZwOFE1QzhGRkM5b2RKNDE4RUoz?=
 =?utf-8?B?K3NHSkFlbG12bjN4T1dqb0xEcWVzS0ZCWUVOa3N4K294a1BHaDZjeEZMRnFY?=
 =?utf-8?B?blZxMnJqT05UYk0yYzJFWGRLdWRSYVBkWTVaN0hZdEkzMFprbWh6WU52aHVl?=
 =?utf-8?B?UjNRVXQ1ZXBKaCt6c1FnSS9GVWVZdDZuOEpiRWRjdk52N2lnamNGMjBheUtl?=
 =?utf-8?B?K1RuUStGb2VPTDROajFDR3d2dGpzSlBPbjI3OVhZQ2JhYktVRm00OGdQSXhu?=
 =?utf-8?B?M3pxY2FTSEt1TkhmbVBhcVV1WlZGZlVjODlhZW92a3d4aFZiQ3ZBd3FyZEhX?=
 =?utf-8?B?TCtZNG9RQTNiWFZTMnVSWngzb3kwOGFTN0xIMHc1SDNaWUdranJ5RWl0Szl3?=
 =?utf-8?B?ZWNzVkV4aDFTaEtFN2kyaVhYamdDSjM2dWFtT3pnTmprYjU2T3FYR0Z4d0RH?=
 =?utf-8?B?NzI0V2FSWFZGSFZRNFVlS1hjeWxtWUhKWXgzUitkVFdQbG9uQmtEWGQwUElz?=
 =?utf-8?B?S25UR00vcndqV3RQN0hVZ0VUeFJicjBzdTdDN1lhay9RdTVGRHdSVWg3c0hL?=
 =?utf-8?B?ZGtEeWdibTFnSGZLM1loWXptMXhQYllYbXZXY0JSVlJtVzJFcURqeXNGMDcz?=
 =?utf-8?B?VjhZd0hGb29rWThBSEpOcGVvWjJONTFsc1RYTGYzZ002SGVxZTNlVS9YSENn?=
 =?utf-8?B?NG8zQ0JmWXlzeUovdXlQOEpsQ0Fid0xjbnB5WThXS0FoSWZsNUsyelFablZY?=
 =?utf-8?B?UENBZlN1eEtQLzRiTWcvNzV3MG0xSGJYNjJLVGVoQTcvUHdCcFNubDNQOWMx?=
 =?utf-8?B?MDlUcmdBcFdSMWJqK2FQSEkxRTBZRWl0VDlvcm5EYm9YR0JNT3UvbEZBRW5D?=
 =?utf-8?B?MDRSOWtPSkR5YjdFNFhvYllJM3lYdW1xSGdXbUJXUXAxbkY2dndRUC9lZ0w1?=
 =?utf-8?B?OWFjK2ovclh3Wmlpd2o2YnFIcTdiaE1oQlJHTDYwbTI0MFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGhyaE9rRk9qdzhLTDJ6RGZFY2RQUWlDM21NZEFndlovZVIxZnc5eWZiSVBF?=
 =?utf-8?B?RzJiUWpaUEtWRVFQaHRxakZzeUVFZi8reHNwQ2QvbUZpbmg2S2tNQTI1Nm4r?=
 =?utf-8?B?empKZ0N0aDJ0UC9qV1ltajVPSXpiNEtrQXRRc1RvdFV3dmtRd09Gem1mN0oy?=
 =?utf-8?B?ckk3a0NrVkpsR1cvZDBrdHFESi9iUndNTzBCa3RnNm4yTWZuMnk1OHdFZE9J?=
 =?utf-8?B?MElEYWc1ZDR0a01xanRZNGY5VkZ0TWV6Qk1OS3doUVpaOTBtT0pEa0VJclBm?=
 =?utf-8?B?amtlWXRQRTBGSXkyWkswYkNTbUwvMTl1SVMwU2E0M040TThEdVlhZlNaL09k?=
 =?utf-8?B?QXhPTlZseFJUS2s3RytZd29GR2w0Q1UwWW16ZGh0VzhjeVErbERBVGxubldI?=
 =?utf-8?B?dFNlaU94dDI3YXY2UlNvZ0p5YjZRTVhSMGF0MU9rYWxWTDJEeGdMb1N6eXRX?=
 =?utf-8?B?SGl6NkJORVVsQ1dTbVJ5SXRaMStyZDNQQ3ZUOC8xRXRUbysxR3I4VG9sd2Zl?=
 =?utf-8?B?ZXhsQXZrVVg2cldrZW9SNE51U2RiTGR5enlGU3lkbTRUR1IwTzB4c1pHMUdp?=
 =?utf-8?B?S1dFazMyNnZHMG1kbHdneG1xeHBucDUyc3FXcVNMRzV6ejkrZXNDeFJZNjVw?=
 =?utf-8?B?SlhZZmVMOTNPZndOUWJhYnpwQ3NmaUtTVkc2K3picDFOd2RpdGRtMit1VDNT?=
 =?utf-8?B?SWltZmQrdm5UQ1ltVkpyL3l4T29hRmMxWm5UbTFBK1FRRzZEYWNCYktHM2U1?=
 =?utf-8?B?WG92UWN3VUNJOC93NVdYRysrb3hMOXl3T3RWM2hCU29ibE91blRzUndVTUFi?=
 =?utf-8?B?Nlk3dCt3cWplVE1NQkNoNWhkR1BkazdTaGord2kzMm1kZUFzUVlOTkxyOEh1?=
 =?utf-8?B?amNXMU1jMzdnUG9ObWNxTmtsVEFwbVc4TVl4TDJtd0E2N3ZEK3E4ZXdjWmJr?=
 =?utf-8?B?YWtwWThjU0VBK1BEWEdGUER6amt2c3J2N2JQYk5QbTZ6eHpLbXJMYXpqZlYr?=
 =?utf-8?B?ZVpveENoOEIrUHNNU3Z5dDRXQWF5dERVU1RsWUJNZEMzM3Y3TEpZcCtXdlcz?=
 =?utf-8?B?d3BhNXhDY2pQeVcrQ3dHME1PaWZpL1p6RUYzMm9NZW14RTJpanlvQVNxNEJr?=
 =?utf-8?B?OFpvMkI4SHNONm15UmJBdCt3bTg2K2FyY21hVDRseDdRNGNNakIzTGFOanB6?=
 =?utf-8?B?OVVSOG5pSys4azg3NEFvanRNNGdJR1RCUFRGWXBTNE1OTi8xREw2dkttTG5O?=
 =?utf-8?B?RmwzaVNjYmdlaWNZYm1LL1E5NmMvVFNDMVFYeUZpU3EvRFhpalBCK0xRRi96?=
 =?utf-8?B?clhiRXliUHpoTkR6Mm82azgzb04wdUlWNWY5N3NNcWliZlpXMlYzS3M0OTNG?=
 =?utf-8?B?T2J5WnlacWIvaGllWXVZNkc5KzFGaTY2VDcvbTkrek1FRVptZURIMjhkZUhx?=
 =?utf-8?B?MHdVdjBERy9nOVF1QjZEVjJOUmtrT0RqK3hFWEVBSktXSk90TG9HWkFRTjdz?=
 =?utf-8?B?WklEdWtXZWJjd25GSzJxOWQxdFJTWXIzeGY2REYxeVUzcG5iaEpZZC9CSG1E?=
 =?utf-8?B?VzlyUkpDa1o0MEtYc0RDdG1tS2V5bEowQjhQVnRKYkVoNnFKNE5Nc3lZWU9k?=
 =?utf-8?B?MGZSekgyYjFlVmlvU1lPNkJWcUV0UDNla1lKUXVsT2FZWUhtaFVEaUdOZVJw?=
 =?utf-8?B?TU9UWjdEby9KTUN6WklkblViTVZSd3ZvMGVMRjRPNGpJNFIvOHViNWhFRUQ5?=
 =?utf-8?B?US9mL2FpdVowN3lDNW1ieWxuMGpmVm1UeGl2a0pPN2JqSzg0SDZaMVF5N2hZ?=
 =?utf-8?B?RldDdWdER3ZRSk1MVFhBU3FieUlLMEF6SU5hYnN3djZQL0hWMnllMGNhNHZP?=
 =?utf-8?B?ZUg4cHh1QnJJRE5IcGtiWFdLOTg2eWVYdUJUaXE3am9mU2RjNHYwMHY4dDRD?=
 =?utf-8?B?U3pYT2lZeWp0aTBnWmNVaDdqalc4aFA1LzBVNlBWWWZuU3JlK3Q3d1ZvL28v?=
 =?utf-8?B?OEJKaFNjM25STitRZFlZZGpyNVByWnVaa1ljUVFzK0EwUlMycUh6bExvUnh3?=
 =?utf-8?B?RWZobytCREZxMFVuVWJCSUR4T211cnM2bnB5Ymc5SnIwbnZpbGl5Q1luZGtW?=
 =?utf-8?B?bFh1WUhSbmdnVExvK0lHQ2xoQ2t1SG1vWU9MK056dGdadUtHcW1DZnNIQ2Ni?=
 =?utf-8?Q?W6d+mTp1KCS/wxxyHRyR6Qc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec2604c-8bcf-4b1b-d730-08de3976fbd9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 12:07:12.8362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoeCcLDA+j4h0em+QVbEaxJ3kdAwZPZFCLiNpvHY56MEaECI4uskTtD90IoBRyeE8oBLllWrObCn3NCfK8alaKMd+kCZcBim9viu8hHrkZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8130
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 12:07:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8271

Hi Antonin,

On 12/12/25 11:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add documentation for the image-container class, which is a simple class
> to generate an image suitable for creating a container.
> 

Wrong order of patches, patch 1 uses the reflink created in this patch.

EDIT: and this patch depends on patch 1 as well, so just merge both of 
them into one patch, they are related anyway.

> This answers in part to questions asked in [YOCTO #14368].
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 51 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index a56a2f719..0097b7c46 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1258,6 +1258,57 @@ The :ref:`ref-classes-image_types` class also handles conversion and compression
>      :term:`IMAGE_FSTYPES`. This would also be similar for Virtual Box Virtual Disk
>      Image ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
>   
> +.. _ref-classes-image-container:
> +
> +``image-container``
> +===================
> +
> +The :ref:`ref-classes-image-container` class is meant to be inherited in
> +:doc:`image </ref-manual/images>` recipes. It provides relevant settings to
> +generate an image ready for use with an :wikipedia:`OCI
> +<Open_Container_Initiative>`-compliant container management tool.

such as....? podman and docker I assume, probably others.

> +
> +.. note::
> +
> +   This class does not build and install container management tools on the

s/does not build and install/neither builds nor installs/

> +   target. Support for this is available in the :yocto_git:`meta-virtualization

s/Support for this is/Those tools are/?

> +   </meta-virtualization>` layer.
> +
> +An image recipe inheriting this class should also add the ``container`` image
> +type to the :term:`IMAGE_FSTYPES` variable::
> +
> +   IMAGE_FSTYPES += "container"
> +

Isn't that done by image.bbclass already anyway? This class is 
automatically inherited when IMAGE_FSTYPES contains "container".

c.f. 
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/image.bbclass#n20 
and 
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/image.bbclass#n25 
?

> +This image type does not deploy anything specific in :term:`DEPLOY_DIR_IMAGE`,
> +but will simply add ``tar.bz2`` to the image types.
> +
> +You must also set the :term:`PREFERRED_PROVIDER` for the Linux kernel to

No. You *can* (and you typically want).

> +``linux-dummy`` in a :term:`configuration file`::
> +
> +   PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
> +> +The ``linux-dummy`` recipes acts as a Linux kernel recipe but builds 
nothing. It
> +is relevant in this case as a container image does not need to include a Linux
> +kernel. Selecting it as the preferred provider for the kernel will also decrease
> +build time.
> +
> +If desired, the :term:`IMAGE_CONTAINER_NO_DUMMY` variable can be set to "1" to
> +skip the ``PREFERRED_PROVIDER_virtual/kernel`` check.
> +

Ah scratch that review on patch 1, linux-dummy isn't the default.

> +After the image is built, the generated ``tar.bz2`` archive can be used in a
> +container generation file. For example, to be used with :wikipedia:`Podman

Being curious, where did you see "container generation file" being used? 
First time I see Containerfile/Dockerfile named this way. You could keep 
it but maybe specify that it's typically named Containerfile or 
Dockerfile so people know what we're talking about?

Cheers,
Quentin

