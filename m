Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B79D65548
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 10:38:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11414.1765967932614874332
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 02:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=O1y05MMy;
 spf=pass (domain: cherry.de, ip: 52.101.66.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6ECxZZBacVfpRYduK/Eiap+Pm4LvKVgAh+Gjqq863sXTsvJD11Su8lo0nFMQ1+7z0YhszaaYJQMcJgAJARCxPZ2sBylk9p1uNpIttvZl2YVr5BPo5VQzfDbbJc/Ag8HF+tA1kpWv/Bgcxfx38at4NkXbtze5n6Lh+XGgQKkB27R1ZJhPJqGLLnGZ9ljNGzOkxlWPAoXgQkVAWSza7FUoNKopme84kHRvyUddOYnmFvBD7uNSf2YVMxo5H5wm9IYv2IQ+k2FBcT32PCU2XUomM6oBuPGosa1VTtu69E0X5YnoXHUaJ8m9y8YuO4cHz0FkUWqI3bv19xLSLgPeSISXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqZUdVirZiCr99IxgyVxEDGIo53lkOgFnrycTahMz6s=;
 b=npeL0QKh3O2F39Ka7o4tzJWMCmzbHh/5gQPleP+XK4+RpD7/jSSd+J/h8pg1QrVP4P5iWRFGqxCC4f+Pa1wsQELJKN5/evgVM/XfeUaNIrHao/ozIiRGng5wPuyjlmUqTD2sfVeq/RX0LeKKFkoOZTj48QPtbe2sYv671CxwVAfi/7lTAnT53wu4qfXmzKjge1DPoyVV4avsmgzJbXm9lfsByj9rQy/48gOyk+eS+QTCrzldb8IKCJtjX2EgVM2xuFp/ZsH7da99vCkrr7ATCZxLQuuLqcK4BMOh5uas2s4DWaHCV+AVn3AsfCm6iKZhj7bFAeCqLNxVHE40dTGqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqZUdVirZiCr99IxgyVxEDGIo53lkOgFnrycTahMz6s=;
 b=O1y05MMyVUz5sjhfihjOHzdMC6N2M77eqsLNT0dOpVvu7+yePsiprWIWt1rw0+3EtCE/NxkARfRpCTNVljZA3WPZTJ2dJCkngDRAWuX8gM23r6+kj/jOpYgklgMTxPNXxuql8QhcUqrkOuhyZQ5oCc/r6Z31X6paI/PlImoeLzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PR3PR04MB7242.eurprd04.prod.outlook.com (2603:10a6:102:91::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 10:38:48 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 10:38:48 +0000
Message-ID: <b93e1cb6-ee85-4592-894e-a685cb968676@cherry.de>
Date: Wed, 17 Dec 2025 11:38:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual/classes.rst: document the
 image-container class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251217-image-container-v3-1-ceb72620a254@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251217-image-container-v3-1-ceb72620a254@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIYP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PR3PR04MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: b124a76d-bb39-4544-7d91-08de3d587612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c0YzYWlNS2NBTFZQcnVMMGUrTFBWNHRQbEoybkxmTTF1ZjdtOFlPTW9mMG1K?=
 =?utf-8?B?d1MvU0QzSFZJbVJSMDErQ1M0emlLci9TRVV3WGtBaDYzZ3hGaWhhUDhJUkZo?=
 =?utf-8?B?UXJkcHRzY290dk05T2drK0E3TVRYNTVxenpmM1VjaldUQ1diWnIwcnljclFB?=
 =?utf-8?B?enpCcXVYY1c5Q1JsdGltVXI1Ym5iTGFuS1loZXBBRkF2dG1wRjhWRFdTT0dH?=
 =?utf-8?B?WXRmNmg2NkRsa1Y2cW5zOGw2OGVhRTY1WEVGcXFCSng0RE9ESDM5VEFmSklL?=
 =?utf-8?B?QVV1VkdUaXhsS3NJVFgwdFNJUUJuVks1dkV1UjhMTEh5L3h3WGVrRVh6MzZs?=
 =?utf-8?B?NGJDQ09tdTljR2JMTjNybzl3dkRlV2xUVUQxZG5qNU9MOHFGS0RMOTV0TEcy?=
 =?utf-8?B?bGxkYmhQdWFCUDg2NjdXdEhXNnQ5Wnp4MkQzbzdPdldXWHN1K2ZhN1lidlZq?=
 =?utf-8?B?N2hHQXVTZGdCVnhrVit6S0psc0YyNWkvQWptRHRGVTJKeUo2bmtmdGxLUFYw?=
 =?utf-8?B?eGUxOHJySkF1NHVRVHdwUE9jNnJmWjEzRExSdmt2WjVCa3YycTNDejRDOXNV?=
 =?utf-8?B?bStjUWkvd0U1bFlGa1BDSjJMMjJSM096UGFUL3JUczI3U3hBVWxCY3p5US9j?=
 =?utf-8?B?Njl5UmNmZ0IvdXJHU2sxSjVCcDR2QVd0V2pEK0ZrL3d6OEh5S0FDcmRGdnNh?=
 =?utf-8?B?MGFoRkRUMEw3MS9RamQwMmpKYUE3Tkk2TW0zLzVDc0Q2UFJSSldOQW8zMGhT?=
 =?utf-8?B?S01iZkNHbXJDaDVja1lrQVVZTmtzR3pzL1krYTRuKzlpajhmUUJRSzNIcHNI?=
 =?utf-8?B?T09lWGNMd0QwSkVOdytGYXIrdTZGbW9PL1J2OFF6V21TME1BemRZWWFwNFo1?=
 =?utf-8?B?cUFkTzlvZmFQc1JQcEV0N2d2Qm5TWHVOQWtOT05ncDFNajN6S1FsVmdEVHhX?=
 =?utf-8?B?YkZOQnh2amVyeEEvM0lKam15bFkycGJ5WVV2UW84TC8xbTAyZ2t5czZBRnE3?=
 =?utf-8?B?bTBpTlQzVjYwaDY0dVFwV3F5a0s0SHJZWHNsSUpNVkQzeGlWTDBjTWh6R29N?=
 =?utf-8?B?OE9yWkYwakpzeFk1TGx6QmEzUGhrZWZWeFk1ZnE0aGRxSEJOcmF4UGpEdldW?=
 =?utf-8?B?b0IrOFoxb0Nnc092Y3VjcnNkNk1va21zV3pRamgzczk2SzJoWEVLMnNiUnh0?=
 =?utf-8?B?Tmx0VlhyRm5UUkNQZzZscXJjeDhMek9jcm1TbE0xbVZYSlhxMTdOckFlQXVW?=
 =?utf-8?B?RDg4QW9iT0gxVE83TmxrdGFBYXpUYW1mTk96VnhDaC9zZDNueE1FZnRBVUpx?=
 =?utf-8?B?WFUzNDFTU0dUamxlNm1EWHdIbXJ0OXVsWXdOOXZNQUFzSFltK0hxRTgwTTY5?=
 =?utf-8?B?alZxTUNCYURGdkVwcThHOWhqOHdydVlkV2MzMWt0MkJlWTc1bzFrQWRYRkhs?=
 =?utf-8?B?cUp3RGx1NS9neVdHeWVSZ2IxMUpaR0FBbzNyQ0d5bjNaSHFCMXJKaW1lQ3pz?=
 =?utf-8?B?cVhVQ0pIT1RUZXdRTUVDOHFZNTF2eHc3NnBVaXFEczkrd0FOVnpMcXMrQU9W?=
 =?utf-8?B?bGRtMy9oUHJxODFoT3JHYnozZStQRmxIaWFHSWNJYlZHdkJKNTV1QTNuZ2N6?=
 =?utf-8?B?NmxINWNCTjJDcXhDbCttTkUyM1JwUVR4M0xlTUZMdUFLQXhtQlZRVU9DUWEy?=
 =?utf-8?B?T1VlYmxGWlI2c09ZMTBxUm5sSk1TREtEK1BDd2NUbjNsVEJwYWtIc2VKUzhx?=
 =?utf-8?B?elRZMk9jVW5pd0pjVkpFTzNFcldPbE01SjVYTHg0OW9lUzBPY1UrVUhhZGpM?=
 =?utf-8?B?KzJrRE5xdE1vaDVaY1N1cTNSejN2MEV3dklXU0c5eVlIN3htWGdqQVRpYTJs?=
 =?utf-8?B?encwR3JaQ0NYZDc3bWVYbXQ4R21ONUhRTm80dy9Ubm9TY2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWpoTXI4eDNPb2J5WVhxWEwxNERPZ1g3QXZnODJacll0NG5PNWNQelpmdG9W?=
 =?utf-8?B?OEJCVXlkWEZDRE5wc25LRjk0a3B6dDlYcVlDQVZmbElBZGp4SEJPQlAreEQw?=
 =?utf-8?B?ZDQ1cGJJRXpOQ2ppUUkzVTAza0JxN3lQUFpxWGdjQ0dSVDdHRWVVQVhPTHll?=
 =?utf-8?B?cHFzWFYwSDM0aFFxcUljUEJDdXlTUnNVU2lzS3F5cUtKZ2I2NFJHZUNIUlhO?=
 =?utf-8?B?WTVyUER1TEN2MFBjbjFnMTZTa2VjN2xGYlYyeVI2UHl0VklnU0lrYktpbjBG?=
 =?utf-8?B?N3JXUG15blF3dGpDNmFmRnlYUEZtOWR3ajZHZWt0STBKK01OQ2tMU1A1TjRW?=
 =?utf-8?B?N2hseVBHWGVFYmo2S0xtL3ptcHR3RytzRURVQ1NyTEdpUjljdnVVUkpKSmxu?=
 =?utf-8?B?ckRkdUZVdUxXWHZSV1dHbktsQklyc1lMczcwVk1oVHZJK0NLUE5qTHFneEwx?=
 =?utf-8?B?dEhvRjB6L3lzWEk5UVVORDRsL05nM3Y2a2pkazJjUUNLajV2a1lkRmlVU3lu?=
 =?utf-8?B?QzFFblF5QW5Eb0dzeXluNmI4dmh3eWh1U055aHpNWWR5ckpheGZ6Q1k5bDV0?=
 =?utf-8?B?djY0SXdTc2N4K0EzbjZQNEVub0JNNkFGZ1Y3RFRYWGFsUkwrZk9rQzN5Sjkv?=
 =?utf-8?B?QWcvS1ZGTFNteE1mTmI5V3ZUQkF1R0xtVXB0QXVjY2hhUldhNTZKWUU3cTlL?=
 =?utf-8?B?WDJDbkZzYkVVUm1DSjZzb3cwZ2hrbnBjMG9NdnNNOTJOelRNdFVWbWJ2aDRU?=
 =?utf-8?B?M3FJaENxVWZiUW5KKzBoSjhLS0YrUHpQaXVxYTBhQUVFdi9mOUN4SHU1cGRx?=
 =?utf-8?B?VUhYK09sYlArd2hlbHVSVUVSa3Y4c1p3ODBKSFlBK2kvM2ZzRDJIUDRISkxi?=
 =?utf-8?B?ZGR5R2g3M1EyMmZKK0QvTG9ONnhtMEcvUDc5SlRxT2FENUIzc3BPak44aU5O?=
 =?utf-8?B?YUVBMXFWbmhnR1pTZ1dzSDRMQ2ppby9xRVFMTXJ3c3V2dERHVXJ0c01LVDlL?=
 =?utf-8?B?N0dTeE1YenBLRmFPYTlSWm5ueHY4UFlOSWVBdnlwN1g5NHVTdlRES2EvaWc2?=
 =?utf-8?B?cklRRUxwOXhDdFVFeWtHZUpZVG5ZMy9ybVFUV0RMRXNBT1lZWlZjV2hHSm9O?=
 =?utf-8?B?UXozNUt2R3JkZThUb3AvWkI5RlQvWkZBREpuUEt2ZHRYc1ZiNGQ4azE4TFp4?=
 =?utf-8?B?ckFqb2NjUHFPeXhjS1FxcVV1TG5BbmF2aWYvRHZnZHMvS3hOZlpsVGhkMVZj?=
 =?utf-8?B?RmpZK0lyWHhnbnBIVkNHSVRKeDBoVjZRQmx1QUhuSGV3cjBmNjdZMzlKYUFU?=
 =?utf-8?B?MmU5T0ZNZ3dTbFhTYndRdGd2Z1lXRGZQeDA4MnRvZk5HTVBiRWdZcXNXaXQx?=
 =?utf-8?B?QzB4ZGdYQ0VEVlhDZ0hleDBjdE9aVWdHQkY2aTNrVTdVZHZBMWdlZmVTWTha?=
 =?utf-8?B?T3BWazIyVmZaSjNEWkhISEJjMnl2dEpzUDExRDBEa01tQzJQQWw0TXRvaXY4?=
 =?utf-8?B?T0tqb0J2Ump0TVBwOGQ1YnNQZHd3TjN0ZkxRdS9EUkJzMDJZc0pDVS9wN1Fi?=
 =?utf-8?B?cFNETHQ1QVVKelpsaVc3cDZrQTQzdzJwNnErNTBWK3UxU0N1YUtqZE1kclRh?=
 =?utf-8?B?NGxqYXdGN3BJd29NWEI3WXhBbXF3eTJodzFRV0VYTE01aWFzVnY3ak1GRDVt?=
 =?utf-8?B?NU4yMkhxN1NvTCtzb1JNVmxjbDJtemVmcitMNlIyUUNqVXRGZzd6TmVYVU95?=
 =?utf-8?B?OHJOaDJTMkoyNVZpNkNkcU9VN0U3TnQrdVpjZVNaOVkzN0Q3aHBGdmJrUEZu?=
 =?utf-8?B?aEIzUWZHZEEyOWkrMmpOU3d5T2dkd0F4VlZjNWdLblZ2SW9lbnpMcjhTNVd2?=
 =?utf-8?B?YXJxc3Z1NFdIeXl3V0FXM0g3NU1jbXFIYlA3QTIxcHJxYjhWU0NYSUlUbng1?=
 =?utf-8?B?VitQVHVMMjBxM2R3TnA1RDZyWEhlaUVRZGVSOFVyUzhrZlY5WHlnSkdvSGxi?=
 =?utf-8?B?RVZhOGprR2M1aFlqUkt6ellpWFlSWmN1M3pCaWwvdWE5dVc0ajFvYy9paFZ1?=
 =?utf-8?B?TjM1S0JzWDlscG1rdmduVEMzeElyZFk1Sms3U3FPSmhJbG9LNWRYdi81dzZp?=
 =?utf-8?B?UTlIUDZ4WlZ5YTB3ZHBTUyt1SktJcWU4VHRhczk1anU3ZXdoUTZqR25pVGIy?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b124a76d-bb39-4544-7d91-08de3d587612
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 10:38:48.1543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR+6IzdtNoq5spa6CjN+5/LayE1SQAdcYX54lkfvoqNwfaMIVGlwBKKUA/mtT46shFWIj5JODyeJooVWLjSNV4KK5rqIw3bw+AOCxjzDCfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7242
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Dec 2025 10:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8300

Hi Antonin,

Minor typos and one comments below, feel free to fix while applying.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!

On 12/17/25 10:16 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add documentation for the image-container class, which is a simple class
> to generate an image suitable for creating a container.
> 
> This answers in part to questions asked in [YOCTO #14368].
> 
> It also adds documentation for IMAGE_CONTAINER_NO_DUMMY, which was added
> in OE-Core with commit f0645e172bb8 ("image-container.bbclass: Error if
> not using linux-dummy").
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v3:
> - Apply suggestions from Quentin (thanks!)
> - Link to v2: https://patch.msgid.link/20251216-image-container-v2-1-630e5f91c0d9@bootlin.com
> 
> Changes in v2:
> - Review from Quentin (thanks!)
>    - Merge patch 1 and 2.
>    - Rephrase class and variable to highlight that IMAGE_FSTYPES should
>      contain container, and that the class should not be inherited
>      directly.
> - Link to v1: https://patch.msgid.link/20251212-image-container-v1-0-fb6586d06813@bootlin.com
> ---
>   documentation/ref-manual/classes.rst   | 46 ++++++++++++++++++++++++++++++++++
>   documentation/ref-manual/variables.rst | 18 +++++++++++++
>   2 files changed, 64 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index a56a2f719..a46a5527f 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1258,6 +1258,52 @@ The :ref:`ref-classes-image_types` class also handles conversion and compression
>      :term:`IMAGE_FSTYPES`. This would also be similar for Virtual Box Virtual Disk
>      Image ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
>   

Unrelated to this patch, I'm wondering if image_types is at the right 
location in order for the classes to be alphabetically sorted.

It is currently between image-buildinfo and image-live.

> +.. _ref-classes-image-container:
> +
> +``image-container``
> +===================
> +
> +The :ref:`ref-classes-image-container` class is automatically inherited in
> +:doc:`image </ref-manual/images>` recipes that have the ``container`` image type
> +in :term:`IMAGE_FSTYPES`. It provides relevant settings to generate an image
> +ready for use with an :wikipedia:`OCI <Open_Container_Initiative>`-compliant
> +container management tool, such as :wikipedia:`Podman <Podman>` or
> +:wikipedia:`Docker <Docker_(software)>`.
> +
> +.. note::
> +
> +   This class neither builds nor installs container management tools on the
> +   target. Those tools are available in the :yocto_git:`meta-virtualization
> +   </meta-virtualization>` layer.
> +
> +You should set the :term:`PREFERRED_PROVIDER` for the Linux kernel to
> +``linux-dummy`` in a :term:`configuration file`::
> +
> +   PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
> +
> +Otherwise an error is triggered. If desired, the
> +:term:`IMAGE_CONTAINER_NO_DUMMY` variable can be set to "1" to skip this check.
> +

Here it's the first time we say "check", before we say an error is 
triggered. This refers to the check that triggers to the error but it 
may not be clear for the user reading this for the first time. I guess 
we could say "to avoid triggering an error"?

> +The ``linux-dummy`` recipes acts as a Linux kernel recipe but builds nothing. It

s/recipes/recipe/

> +is relevant to use as the preferred Linux kernel provider in this case as a
> +container image does not need to include a Linux kernel. Selecting it as the
> +preferred provider for the kernel will also decrease build time.
> +
> +Using this class only deploys an additional ``tar.bz2`` archive to
> +:term:`DEPLOY_DIR_IMAGE`. This archive can be used in a container file (a file
> +typically named ``Dockerfile`` or ``Containerfile``). For example, to be used with
> +:wikipedia:`Podman <Podman>` or :wikipedia:`Docker <Docker_(software)>`, the
> +`container file <https://docs.docker.com/reference/dockerfile/>`__ could contain
> +the following instructions:
> +
> +.. code-block:: dockerfile
> +
> +   FROM scratch
> +   ADD ./image-container-qemux86-64.rootfs.tar.bz2 /
> +   ENTRYPOINT /bin/sh
> +
> +This is suitable to build a container using our generated root filesystem image.
> +
>   .. _ref-classes-image-live:
>   
>   ``image-live``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 71fe11b83..7c03dc138 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3955,6 +3955,24 @@ system and gives an overview of their function and contents.
>         variable, see the :ref:`ref-classes-image_types`
>         class file, which is ``meta/classes-recipe/image_types.bbclass``.
>   
> +   :term:`IMAGE_CONTAINER_NO_DUMMY`
> +      When an image recipe has the ``container`` image type in
> +      :term:`IMAGE_FSTYPES`, it expects the :term:`PREFERRED_PROVIDER` for
> +      the Linux kernel (``virtual/kernel``) to be set to ``linux-dummy`` from a
> +      :term:`configuration file`. Otherwise, an error is triggered.
> +
> +      When set to "1", The :term:`IMAGE_CONTAINER_NO_DUMMY` variable allows the

s/The/the/

