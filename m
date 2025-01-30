Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E779FC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 15:48:40 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.55])
 by mx.groups.io with SMTP id smtpd.web10.18360.1738252116179646230
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 07:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aLgpE+Rt;
 spf=pass (domain: cherry.de, ip: 40.107.103.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xez7POcuX4lQahJHljdV/RwFMg45BPA0tRsEEID5P458FiMuMww7D8BlaBrX1hy6p7MTF3ImFPK/65pDMyr90gTslPR9wAeTqUmLTKJVpnBuwhHNOv+RhzAUmyI8ND80WqtQzPeiza5cBnV/BZ6u9FFMH1xzBr6vvONy1NYqJsnnImcL0lBys2XQOO/mB8OjiU0gCjdLop1k1QvIQzTm1JJv5RWvcwl8APzMRoZJ5ryMc1Eh8RHZUuK7HqxgBjvmkBo2NEObDNnUn7mb57Dh9X3twp1X4vSeB7pvcDLYZyAy7XkyXodVx07SYIMMXXNa7v/w0Oj/6p6qxHVW32Dvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDHT6O7RLVHXdJalEdRqUjsLV8bBB+jCqIw9Oy1dZ6Y=;
 b=bajfZ80l7AJ1C5E41bicMN3lRp90x8fFdj3bcojSuaU5b/GgbJ2hS/Qd9b9wHzq+v8z2THk09V2KawAnvXZ3YgSU/CbuKcIVZnotvhKINxvs7CZd4nMplsdd5pMBTZrsIA343N/1iCYaHFTBdZH73S8+/y/FsIMEF+F9b8i0rF3aQCVsMpsxFFHQUtT6HGIMyWJhvEba7zvsObEpdzJTy9n5RXWhA9Kmav/YiUne3d1iS3s2nNdAmwyXChXc+zoX8+Uzba1UR1bG75GD6v+1pefjhaulD4PiCElrwpptcJ5NkeQt2RRw99OtMjTnj9nPcu4v+WI08sDX1DYAwq3GrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDHT6O7RLVHXdJalEdRqUjsLV8bBB+jCqIw9Oy1dZ6Y=;
 b=aLgpE+Rtv9tMi+7LNihZAX2eA6iCd9lVV4LB3hUNioJ3y/qg4fXmcj8Xt2BGvhTixvYIQ76UY+kYXjMGNus7lSnbZJJ/WuPuAXtrT8YKbKuxl6Ezufxy+XlZDuPFapNGzFSTr17QNqlt29c3Vs/iYHKjdwRpOtE+RBsA3Y2gjH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9397.eurprd04.prod.outlook.com (2603:10a6:102:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 15:48:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 15:48:29 +0000
Message-ID: <0974715e-b457-4759-8a9d-42750321f629@cherry.de>
Date: Thu, 30 Jan 2025 16:48:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] ref-manual/faq: add q&a on systemd as
 default
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250127-faq-no-systemd-v1-1-e9945bb090ef@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250127-faq-no-systemd-v1-1-e9945bb090ef@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9f6ad7-32da-4574-d369-08dd41458ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WUhTdHR5dXlkMGk2UkJvSGY1RVJnUFFERlBCWkdOckNrVmF3NXlUb1ZMWDM4?=
 =?utf-8?B?RHBCUUJ1UGo4VlVqMDNFYTFBZERsNHQ3ZlU4bE1HUEt2b3Vsd1J2ZlM3UkNs?=
 =?utf-8?B?aDRLSERUaVJIVURLWVRkR2lPQXVjbUpTMUhNVk5TWGkwWFZwaGNteDhicFlL?=
 =?utf-8?B?dzdjVWVNQmFVUjBRQ2x4bVE1OUhDTFk2NURTVjNqblZpVXl1VEtCV0JiTHQ0?=
 =?utf-8?B?VCtHVDNBVUcySVBua2Z3SU1zS2QwVFJPd09kWG1yd0pkR2JIaG5wd3pyamNq?=
 =?utf-8?B?bVRTaUNvSHBiM0I5NjVaYXlXSGdqUWZZdnhUZXdFTitCaXNOb3dmcEZWczBH?=
 =?utf-8?B?UitaWFgrYnpONkZaZ3FJSnFWbWZsVCt0MlM2UGRBU3l4NDRJeEh1VXJOQVp1?=
 =?utf-8?B?MXBVRnBKU2NuMjA2emhOSWtsTzZqS2ppd2N6TjEvWnJPWXNjakNUTHV0cE5D?=
 =?utf-8?B?V3l4dUFlL1V1Q2tQUFhmcDVteGFNU21TQXZCOGFHczBkU04vWlE2bnYzSEhx?=
 =?utf-8?B?WnBHUXRnMS9Ba1lrbmNsNS9ycXNNallqRHhuRTFUNS93dDhsOGxFbkpydGtL?=
 =?utf-8?B?Yk9BNXhjWjN3N09VNVZVOFpqN3kwaEl5RnY0dFFhR2V3S3BYSnJYOVFtdkRU?=
 =?utf-8?B?aXJUcFo4UXVkMmI0WGVob3ZhTzMyY1lrS090V1NBQnM2eElDWlZlSUhSM0FK?=
 =?utf-8?B?b0JydlZxV2E1S3B3Q0FOVHJVN0Y5NmNFbGtwK2NLVS9pZmUwa3BxbzVCdEdV?=
 =?utf-8?B?bFJEVjl6Zi96dUpjbFZSUWdBS1RveUN1QmlKRU9Fc2Fva1g4aXZRazFMbEs1?=
 =?utf-8?B?TURuK0N2dHc5UE54ZEJYRXQ3VFlIb240eiswY3NjbFVyZjVLTVlxUXEwcFlo?=
 =?utf-8?B?MUpOUlQ0OGs2WmxXSVdVOEhNK0N0L1FaaFJ1MlR3ME1IYnpDWEpZeklPNDV1?=
 =?utf-8?B?K1hFOGFvMUZLNmV3QWV5Zll4N0RjRUtqVDd4LzVObjhGdm55OThFQ1JkMGc5?=
 =?utf-8?B?SnFLSFlESGM3Z3RRRURHR2JuRDNLam5kYVQ2QXFldnFlREdFMXZpZlNaOTFU?=
 =?utf-8?B?VmZBRnN2dk13bUsvUXpFVWhGdnlYMzdPUTRJYUcvYWpvNzVwR3BXQVhEYXl3?=
 =?utf-8?B?eXQzaG4xYVRLUWhaWVlaZURSZk1qazJ5Tm1hUWdRbTFQaGRUTWxVNndUWHRR?=
 =?utf-8?B?UEVKV1Q2YzV4YkNzb3FCWVl1RGlDWFA3RExBd05rdzdRSDJEbWQ2YkNNVG5F?=
 =?utf-8?B?MUI3cWViZWR2bjVOcEJJdGZBeWRvNFZ2cHgwQ1hQVE1WZWFtTW1SOFR0eHNY?=
 =?utf-8?B?MmF4NUVGbU95M2k4c3JnRUFZdFJZZW1mdDFFbEg2S1ZtdE10U2NLWmwxek5C?=
 =?utf-8?B?ZU5lQk0yOEN5bFhXU0ppdlVXQWg1YTR6YTB3WGpIT0FhM2NzVmVEcjBTQzUx?=
 =?utf-8?B?UGk0NElPS3BpQ3Zyd2hqTFdFd1RLamNhanpxZG12MndEZXRZVHBjWENpWFd0?=
 =?utf-8?B?ZWg4T3NWS1M5akt6U2FORU0vd0R2S0hwL1lQZU5waHh2L3NjQWhLWnRMQkhn?=
 =?utf-8?B?Rkk2Qms2RWZLYmZSSFBneDVvYTVTUFBlUUtWZlhvRVFPclJYWjF5eFBHUUNk?=
 =?utf-8?B?SmtqQVV2YXIvOG9uQ2lCeEg5L05QUE1ZL2MrYWdqZW4velIvL0tZUTA0Tm0z?=
 =?utf-8?B?SWpvWUg1eHlXbzZ5N29JTk5RN3VoOGRrS0F0NFVGaGxCdzdPS0ZLWWV2b3VY?=
 =?utf-8?Q?7ios36k22IUuuTm+xaLt6o/UDZLH0XwsRArsT1Y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVl0VFhPMmhSU2w4OHdDM2RtbW9KUnhkcFBqbGJ3Rnc1VzlRMldwa1MvS29X?=
 =?utf-8?B?ZzRFMHdDdE5LSytUWWtPWFYyYnB0bjdHb05mODhIcVFYOFc2dkpTc1gzandM?=
 =?utf-8?B?VzUwTFNrUlJCMkRLMkIrWUZ5d1BpNmpiaHhEZXNmWkc2OC9WUi9oYmJtdmdu?=
 =?utf-8?B?L3Bvd2xDOUxyOE5BNkord25YSTd3Z1JZM2RuaTkrSnNPRXBpdnBBeC9IU2Nz?=
 =?utf-8?B?elQwMys2c29QelRnQXVuMHoyZ3JZY2hEWlNUVTQwM1ZvMXNwSzVnaWJIMkFR?=
 =?utf-8?B?SzkvUkpocUJZcHRwaHlIMHowY0FmTlB5cWZCcFdCRCtiMHo4WWlRWVJ3NWFk?=
 =?utf-8?B?WWZmN0VkaXNhcldsa1lidVc5K2wyR0ZIOENyWkd1OTdLdk01aFRsamt3amRQ?=
 =?utf-8?B?WU1jK1FieHBIVmUzWmUxZW1iQkhWSHNrN3BWMCtBb294OGJOU01VOGQ3SCtt?=
 =?utf-8?B?bVdPYUNrVnVNbmIwODhCN0lPcWhIT0I1Tm9Kdk1FTzVJdjYyemtPaUlsNzZs?=
 =?utf-8?B?S29pR1FaRDZhaHZYazhscGZJcWVCVEZXcGpVcUtwc1JjR3o5bGFrOXplZ2FE?=
 =?utf-8?B?SGV3bitGUm8yS09tTlZpMlpJa3VSbm9EcUZma3lWYlliL0VRNlgyUnVnTCtH?=
 =?utf-8?B?ZHRGL0NnbDBkbjB1eU1DSHhiVGRSRUtWRWdRQzFmZDlsZDVTcGpMKzdXMnh3?=
 =?utf-8?B?Y1U5cnJXRkZQRE5OdDBDdHdNNUFPaVFObE9scFR2blZhMlQ3TWNET1dQc0lm?=
 =?utf-8?B?d3dHT2dlNEF4S3hLSjVZUklDeEV1enFWK1d6aXJjVnZoUFZMeVpzZHdBdlp1?=
 =?utf-8?B?bFJCR045TjhkRXdGTHU2SnBiNStQZ0p3alROWHRrODhOcWhHK09LZEN6UEFN?=
 =?utf-8?B?QWZrVzMzYVJSS1hxSFdQSEpRcU1HQUhacTJEQkhpbDc5bDlYWkx1QjhYL1A0?=
 =?utf-8?B?em5RcmVJSk4xN1ZSV25aS3VjS0pEK2pBdjFZWDZBTkZXdVZHTU0vd1pyUUo4?=
 =?utf-8?B?WUxjZmw5QThOODZkU2RsbEs3NUMzR1d0d0ptVHFnaE4vWHJSclo2b2QvdHRk?=
 =?utf-8?B?ekZqU2E2bmNqbDRSQXJxMUxuVmNEWGFqMGloQ3lWQmxMbEdHeDJqOWRGRHQ5?=
 =?utf-8?B?OENqZUoxMmE4ZnByT0RtSW5UenJFMUlYMFJ2bmFoYWVFNFVwVnNybWVpQ2g5?=
 =?utf-8?B?RVVXdUx5UUhORE95MWxDYUxqcE5EMEZQRWhLRFNSMXV3WWs1OElodjZpeUhr?=
 =?utf-8?B?SFdvclhwMzhVS2pZbGZhaVJjUGZlRkJNMFRPQnFjZWh3VWZNMEh2UGNDRzhw?=
 =?utf-8?B?ZU93ZkI2NWlaQ2NjVldVZitxVmdNbHhhUDJIZGFhaWg3enoxWDVjRU5qOUZI?=
 =?utf-8?B?M2NiaEtjN0NrVmVKV21LS1lzc3U2bVV4Q0hsdnRIN1RiYVhHY2RWOWZNb0pO?=
 =?utf-8?B?TUxKV211bDFVVjRqRnBIdEg1THlBWHVIN0pzeGZMRU5vUVBBbFMvTjI1QlJG?=
 =?utf-8?B?dE5TcjNLeTRXZytPNXozTW9oK0pWZ2oyYmFDbzBKdnMwSzB6VTJxNE9Mc1pF?=
 =?utf-8?B?WWoybW9qZDR6dmxPcUF1SlA0cFVGMTNwazVJS2dkVVJzNmVhWlhPZzRCblVE?=
 =?utf-8?B?NDd4N3FBeTNzdmV2TUwvdmZkdmFHZlVNNWh0cVJMbkt1a3hHdml2OGNRaHRw?=
 =?utf-8?B?NURpaU45OWUxcmtqUDJpcHkzam1MMmJXUytXMEU3SmFPby92RmxleGRZRFdY?=
 =?utf-8?B?U3FWVU5JT3BnWTRRTjk5cTZtZkxzSFIzNXg3M1IyYzdzUkR6SFY2YkhqRnFI?=
 =?utf-8?B?RUN2UGFIeFRhWmZqLys1MzBvc3hoZWtHK09GZittVHpic2ZKbVBoNmdVTFY1?=
 =?utf-8?B?RzhFLzNSS0djbXNCUGsxOGxvd3pQcDV6dk9pdkxxZEJOK1BJUFYybFQwZXly?=
 =?utf-8?B?UlJEam9PaUdLaURFT0JHdzZxRUpFY0pwU3d1bHQxbmQxT21pbEpQRlJNWEZ1?=
 =?utf-8?B?Q2ZHaEp2NnhxdzJqR3VSSXV0aTQybSs3Y1hEOUZsb0JmTlRWSTRYWFNlZEwr?=
 =?utf-8?B?cnV5cnNIRmlQSlR1YTVzbVJmeDJ6UUtnSE9SejBEY3RIbEMxSTJsMEhhYnJq?=
 =?utf-8?B?bUtYT0hyYmNGS3lEUmVMdFRtZ2s2T1NkOG44eU92OEJuVXVCTHk4VWN1N3ZH?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9f6ad7-32da-4574-d369-08dd41458ae5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 15:48:29.7056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3lC3AUr5xs48IGEGZQY6kyESpJB+xFiMPKPMxi75hSlHHdkKKhvvPQy+ZdbHIUb8uI+YXvxMx36H4d2nVZ4jD1xv+aIjtvq5vyCj12BD1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9397
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jan 2025 15:48:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6215

Hi Antonin,

On 1/27/25 4:52 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Originally written by Richard Purdie, but formatted in rst syntax and
> slight rephrasing.
> 
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/faq.rst | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index 9e3418e10..827d8d307 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -45,6 +45,28 @@ See :yocto_wiki:`Products that use the Yocto Project
>   Wiki. Don't hesitate to contribute to this page if you know other such
>   products.
>   
> +Why isn't systemd the default init system for OpenEmbedded-Core/Yocto Project or in Poky?
> +-----------------------------------------------------------------------------------------
> +
> +`systemd <https://systemd.io/>`__ is a desktop Linux init system with a specific
> +focus that is not entirely aligned with a customisable "embedded" build
> +system/environment.
> +
> +It understandably mandates certain layouts and configurations which may
> +or may not align with what the objectives and direction :term:`OpenEmbedded-Core
> +(OE-Core)` or Yocto Project want to take. It doesn't support all of our targets.
> +For example `musl <https://www.musl-libc.org/>`__ support in systemd is
> +problematic.
> +
> +If it were our default, we would have to align with all their choices
> +and this doesn't make sense. It is therefore a configuration option and
> +available to anyone where the design goals align. But we are clear it
> +is not the only way to handle init.
> +
> +Our automated testing includes it through ``poky-altcfg`` and we

I would make it explicit that poky-altcfg is a DISTRO.

Otherwise, looks good to me.

Cheers,
Quentin

