Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5673CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:30:41 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.53])
 by mx.groups.io with SMTP id smtpd.web11.14667.1761319837279766556
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fHtFMAxV;
 spf=pass (domain: cherry.de, ip: 52.101.72.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjKdAizA+wRViXUcdkTVTD/GJTFaMXmEBcl8mGiG5xWnKkjZnr1WlFYGPHOw51K5oB3JXi7Qq4lQBoJr1kT0tUAXJ55s5O9o4VOLn3s47WQgKijUUJyiQzCgt6iTGcx8uXVlpfttQOIqmXq70BN0v8qhp/qyMZKzA24Qe8ab4HCJF/Zj6VkuJ0wFDIMSIQgTRPcvChENyjD4VDoyrR0IRSKDL9reOP/qGZ8mnD3PT//0LS7Az6TzfTwONSFAZFO9jHEm9jTB/g4sekdtXG7wv+Ilcz2+VAcvUq+dL9kLT6fAAR2PqPlHqDgAw8jF1aKInwHLPtyGH3gmKc8l6bx+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6FMzEopZ24By24qofPQvIKVcyiR8QC17B7drypNgT4=;
 b=FC+qa/clywMUaFemvGsLH+ldxzo2yjiH1NWcbjzeOEIuqpVItQVwqygpufRCrEgMmr0uJ+k0q8L6rNReTC9BwqCq0ZBbU/xtL6zSnOV+rIrCjtO/rivt8zN99IENZJPsUPzquV8VLoueKrnWGfpPh4McOheSkPEcDL5w880Qpoy2V7qNt1JWV15jieuC5lVrCSqeCzyx+6FJcV4C12wDIMCXvDwfenEdB+sLP5hAwMg/ULMJLzJEUP/vhpP/ttY/4bD+5pShcohZj42mDisGp/qkPrBrQVn6bbMCFrBCb+GfcZIZN1zl4paO/cLkAnos1kUd8spKOfcug+hI9hldxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6FMzEopZ24By24qofPQvIKVcyiR8QC17B7drypNgT4=;
 b=fHtFMAxVU+UdiTg7BU4Dc14yAOWMMBTQl7n5nJQ8zipz4w7/g6USrNhL2OsnzyPlKgx1cQq9AkM4RDd1S4rAguG+o2OBBRCirao5w72nfLDw3A2UZ9YRZghqibQY+UQg9gQpAFf/WfRk9p0CVOKASa9XW2oOzj8TAQxwxc3c1Qs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10853.eurprd04.prod.outlook.com (2603:10a6:800:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:30:32 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:30:32 +0000
Message-ID: <6204654f-fbc4-48f9-85fa-899d738ff5ee@cherry.de>
Date: Fri, 24 Oct 2025 17:30:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 09/16] ref-manual/variables.rst: document the
 REQUIRED_IMAGE_FEATURES variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-9-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-9-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10853:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea052dd-b2e5-4635-a72e-08de131244e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VC9ZdDNGNlRIYS96RllCRndCbXpFd2JIT3U4VU16VlhxV0xkQ3oxSklwSVVP?=
 =?utf-8?B?M2s1UUkvSkhhU0VqWVBWeEdjeFlsbjR2OTRvdzRJRC9ETG5KcDZ2akZoa3Z2?=
 =?utf-8?B?MlJ0QmVUQWNrcWZWQmZ3Zkg5VEMySWh5empReGhnTUVHOXRDTzFVa0dpWU9p?=
 =?utf-8?B?a2hzMklYbVRyT0NKVlQxVDIwNytBclZBRHR0NzJPUlkwQ0F0dmZSKzBuSEg1?=
 =?utf-8?B?N2FFT2xZS2hNRmFhTEpyRTJ2ZmRDN1pwN1hTVzg4Z2ZGdG1EOWYvaFlLWFI3?=
 =?utf-8?B?SFk1M1huZlNOUDFQbTdTN1d3S1hHTTBuM1dab0tpdXRpdHZVbGFVSDVhQTNH?=
 =?utf-8?B?d0Q3NWpDbkJSSDU3TjZ2S0ZKc2xsOFo0cjRIeFo4MGdGMWY3RkZnOG1MeUVO?=
 =?utf-8?B?VWZ6UzNlbHIwTzVOcjNRMjY4bUNMbCtGMU5BNndubG1zRndUWkJyODd2cjJ3?=
 =?utf-8?B?YlRkWjdWQk53ZXFRQzdVcTUwdFArUmdDdFZtbFU3VlBmZ2R2RVhIck9YV1Z5?=
 =?utf-8?B?dlEzWWNsMDRZTzVJb0JGSGdUdTBWM3NueHk5T2g2QXI0LzI3dCtZaTlLdmFR?=
 =?utf-8?B?My9leHZLRXhqQmZUNW8wVGZFQVJZcXFoTVhwZVo2ZzNwdWpPcTNIUVloWnIv?=
 =?utf-8?B?enhyTWhkcHJQQUJlN0VYVjBSUjhHV0hMVTZpQ081aFk2OFVvbmhNYXpLeWl5?=
 =?utf-8?B?blVPdkh0SlppM29QdHh1ZkJUSHgvN0tPcEIxSmFaeFZ0aW1jNUVYMjBKT0Zx?=
 =?utf-8?B?eU1DWWUvU0hhOVNXMFgrckZsVEVKWm1VT0l2S0VMU2QrZlEzSm9MMEJQT2h2?=
 =?utf-8?B?UmgwcmFhTUZPQzN6dG81NjRlaDA3TktyQUMraVRhdGl6ZTVKTms0N2Fzb29X?=
 =?utf-8?B?dWNkYUpnVGdjZnEwTnBaUU51akF1cmVYZ0t5QTQyOEZWbkk1ZlVKdVEwWXFJ?=
 =?utf-8?B?UzdKWFNOLzlsQWo5a0h0RDl1RUliSXBTV0lyVFZ2SkgxL1lyWkpTUzhJdnR6?=
 =?utf-8?B?dE9PUm52cVV2RkZGQ2FEdUFHL3JnL2E3WFhJdlM4ZWk5cERnZ3ZFeG9kS01k?=
 =?utf-8?B?cXBhNi96bDcrOFhiL1pSS05yNkJMZjV4T09xM2pTWlUrSU4welZETUU1NnVq?=
 =?utf-8?B?NUhSZzRqZXBPZ1RGWjhOTTNPTkxLbUcyeG1WcnorUzNrWmpkNEdHUENRSkRZ?=
 =?utf-8?B?Y0J5OEgyQjkzRStWdXA0eFFsMG1uOHQ0cjE2eDVMSTdMTzhNY0RyRUNRb01S?=
 =?utf-8?B?eVpQdS90d3ovVUVFOXBRNzg3TnVkVkxQZ0hOYTZJQzBRZW5nUmtCald0VVlG?=
 =?utf-8?B?b0xHaC9kOUVRbjk1SHVnaFNCblpML3M1ZTZ4c3Y2Uzgwb0hIV3NSczNwZ1Fh?=
 =?utf-8?B?RWhKamY3Ym9Vd0FVUmN4RGtDS2pscDliTCs5Smp0enRVWkpVNGpoVFRjK0J0?=
 =?utf-8?B?VExld3R2b0FYTGNkS3AxczM0eEhOVmVsQkpmSVRLL3FIc1NsbGh4OHJyay9q?=
 =?utf-8?B?bmc1OEcwQUJXbk5wVFdaSlVVRWo0ZjRNYkdlNGFoSkM3NlBXMG1OL2xwSGxC?=
 =?utf-8?B?VklHZmNMYVkvZDQ0WFdlVk9qaWwxRXMxNXRERzJ3WUcrL0dPQlZkZGJuUEh5?=
 =?utf-8?B?dEdITVlxOGI5d3dZVXNmL0FFK2NhM0dFSEdwdzJudU1tQVNiMzJZTWFVcmJH?=
 =?utf-8?B?Sit2SkhrOGY3b2JFaHFxbDZ2WHl0cVJwTWs1d3d2QnhPanVHWkNKWUo0aDlw?=
 =?utf-8?B?NWE5WmxkVlh2TVVIS05DUmxxbVZSWU5uZXNPaStOSFM1NU1NT0hwZmJ1akk3?=
 =?utf-8?B?OW8veHptZ3BEQnEwdmNDT2JMYlFlbFlNRWk1NElKNURsY2xEZUM0WDF1Rk9D?=
 =?utf-8?B?MkgvV3Bna2lOQmhaajZqYk1GZVJQWGt3QXpoV1I4Zm11M2cyOG1NUS9Ydklm?=
 =?utf-8?Q?2+SJ8D02XKRan/V9BtgkIvbL2zK5oHlh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VEV5WkFETStDSUVWNlU1SXNvYTdUMFFNaHhGbDRkb2JEVCttNGRxRkhVVHZ2?=
 =?utf-8?B?RzVQV0lTSElCUzQ1SUpsSGFYS1hXampLT3orcTM1UVdhNWQ1M3lCbVpCcVB2?=
 =?utf-8?B?ZkVraU43N2VTZmxtNkc2MkU4RjYvbmtwcDJySnE2L0l0Zlh6RFB0YmszTlRv?=
 =?utf-8?B?ZlZnUi9kdEhjZG51aXdqeE9HVEE2SDhUV3ZpWWQ4TnFHWXErT2t0MFB4aDJv?=
 =?utf-8?B?TEMxRGswSks3NklzQXpVS0Iva3VybGc4U2J3ZWd4Ry9tekdhY3NCWnluVk9T?=
 =?utf-8?B?eXh0YkErM1pBN2NKMFdWeE1IcDJ0SE0vZTR0NWM0dlZydDFFa2dDK1dubTBT?=
 =?utf-8?B?ZXBsNWtGQWxLaHY4MlFFY2VEbVNpYUM2RzErd0dUVlNSUC93K0VLZjV3WWU5?=
 =?utf-8?B?TGYvVUh1VlVJL1FNd1lGVEc5d1EzM2NRRVgvQmE5aUtiYXdqYzNFVEx4TGQw?=
 =?utf-8?B?UVc4c1dnckJDU2dPWWJ6MlF4c3VUSkJxUFJPS0ttUWF1cnFFN2lPdCtxRDB0?=
 =?utf-8?B?RStlMlJTUlExeUFRZlNkTDN5TmZaem9icjhPUFVFQm9RQU4rV3ZMaFZibWR0?=
 =?utf-8?B?TFc5SU5icUhsWjAwRHppdTZ3YVpqeEx4YjdxWnV2TzVyait6RzNkYU5sM1BS?=
 =?utf-8?B?U2hCOC9oc01BdTdjMkN5SHNkV244dEgwblo0V2lMeWRibWxHSDBYcXFkdUhL?=
 =?utf-8?B?dmNRa1drclNTc0xSNEVxS2MxMWhuZjloZ3JUT3M0N2tseXl5TUNuWWNGT2hs?=
 =?utf-8?B?ZWJPR3o5T2owZFdTdldubitlY05xdGJzdGZvdlhQWER0OC9pWXpnbFZxdDdU?=
 =?utf-8?B?R2dEdDg2TnNySU5CU2N1VFY5VjlzcjlaeXRUZ3ZWMVQ4eEMzaVhCdmJ5ME5r?=
 =?utf-8?B?eWpZVWgvQXhkYjVSSEhnN0ZRUWYrY244Q3VnLzM1eFlJQlpxSHljcE44MVli?=
 =?utf-8?B?SkNIWXhrUzgyTzU5N0JCUFpMUVZXalhmS2d5YnJoNzVLdmtSa0o0aU5EcU5w?=
 =?utf-8?B?Z3k3ZkcvMnh1YUhBaEZpdzM1Y3JNOUhic2o1bDhxVTdMZjViYUtPRitrOEV3?=
 =?utf-8?B?N2x1d1dmN09QbUliZnpvUTJwZWRXT1NmMHRsU3U1SGkxNzFhZDVkRTRwaEhw?=
 =?utf-8?B?djA1T1ZJZ01LUWlFcHpVbCtjYzNqWlRCbHE2OVNYWHdsWmk4cE5NNUZIbzRI?=
 =?utf-8?B?TnIyQmgvdjdGUGNydEU5a2hBWm9kR1FWUjdlWURXay9qTGNYRHYvNlA2a1Ix?=
 =?utf-8?B?UGpLMlZ5cXVNSnIvR3I5OTR5czdSQS9xS0p4RWlmdVo1SjlyUTFSb2V2OFc3?=
 =?utf-8?B?dmtWRm9Ha2s1U0s0eDRPWmszMDdrNkNMUUFHaHhYYXY0ZTJYTkM1MXRKdmU1?=
 =?utf-8?B?QkE1M2JsdVJ3VHZ4YmVob1pxSlVxUFpDcGxvTVdrU2FMSFVjV1N3c1Q4Sm5v?=
 =?utf-8?B?bkJWb1VGeFRMUkxBOU1IczNRYzEzbHhJaUxZZzhxeG55L1VkSDFtR0NHaWlN?=
 =?utf-8?B?dVJ4Snd4OVh5TXR0M2VEOWhmaUE3WFBlT3ZWUG1QdWFmYzZrMGtvOU9QcmZl?=
 =?utf-8?B?NTFvTStReUFBaGsvRDdqZUlwM0VjbXg3MU5SUEllL0lWZjdkbk5CR0VzZ2R1?=
 =?utf-8?B?OEE1WlVTY3pNYURxZVRXUTcwTWVYMHNpd1JIWHp1TU1BWG95VEZuVEs3dzJu?=
 =?utf-8?B?Mmt5VWxNaHFVM3AwNnRieCtUY3VMbTBKcjJIcGl0YmV6UUNCcnRLMEF6dXBx?=
 =?utf-8?B?aDlLRHErbnpnTEtHcXo1eFA2dk4vWHFXeHpVaEhFdjg1NXdGaFZVLzNzeGZa?=
 =?utf-8?B?c0VPV0k1M0I0WU96ODc3M2FDSFJOSUE4MWZjbVgvMDR3eFNYQ2V3SlQ1TUZa?=
 =?utf-8?B?cTRyUzNKR3NETnhwcWhrbTRQcXlUM1JtU3RuZXZjMVdjSVk5WXhLMTRYYWdO?=
 =?utf-8?B?TkNXRFBDQmFrd2paRDkyVkpER0MwT1hrcVFPQUFORzZrVjl2YjRBK0xrZXNH?=
 =?utf-8?B?dUlBR3NqM0M0UktOSXAwS2RVNncrVVUvSFk1QVkxT1RIV1AwZ28wVmp4MzBj?=
 =?utf-8?B?b1lEUGtsVGFPbjdmbGVob1JSd0RTdWlHNnY2QzN0YXQwbjMrOC85ZHd3UE1R?=
 =?utf-8?B?RDJUQ0ZqZXppVFdUMGc5ekxUNWZBZ0I0KzRYdm1ZVXpaT1dGblVWRmJvNTdW?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea052dd-b2e5-4635-a72e-08de131244e2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:30:32.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INwS5mJ6xks8X/VwdTKURbUvaeOp+jAXN8dEaUbjGTujjCwrU8yrpT0FV69WHKrezwiMkON1h66wrX3L5oixy4wzW9qvGxFh/ocybUQMZaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10853
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:30:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7830

Hi Antonin,

On 10/24/25 10:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added by commit 96a9702a24a7 ("distro_features_check: expand with
> IMAGE_FEATURES") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 167f38e86..9d2889877 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7896,6 +7896,23 @@ system and gives an overview of their function and contents.
>         the recipe will be skipped, and if the build system attempts to build
>         the recipe then an error will be triggered.
>   
> +   :term:`REQUIRED_IMAGE_FEATURES`
> +      When inheriting the :ref:`ref-classes-features_check` class, this variable
> +      identifies image features that must exist in the current
> +      configuration in order for the :term:`OpenEmbedded Build System` to build
> +      the recipe. In other words, if the :term:`REQUIRED_IMAGE_FEATURES` variable
> +      lists a feature that does not appear in :term:`IMAGE_FEATURES` within the
> +      current configuration, then the recipe will be skipped, and if the build
> +      system attempts to build the recipe then an error will be triggered.
> +
> +      Compared to other ``REQUIRED_*_FEATURES`` variables, the
> +      :term:`REQUIRED_IMAGE_FEATURES` varible only targets image recipes, as the
> +      :term:`IMAGE_FEATURES` variable is handled by the :ref:`ref-classes-core-image`
> +      class). However, the :term:`REQUIRED_IMAGE_FEATURES` varible can also be
> +      set from a :term:`Configuration File`, such as a :term:`DISTRO`

Not sure we should use DISTRO link here or rather use a lowercase 
"distro" (without the link) which I believe  is what we use most over 
the source code?

Otherwise, looks good to me, thus

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

