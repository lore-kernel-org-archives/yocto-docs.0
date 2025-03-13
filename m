Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DF9C28B2E
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:59:00 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.web10.12031.1741863530903241889
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 03:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KqzSYkgC;
 spf=pass (domain: cherry.de, ip: 40.107.159.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHd9tUL2vCiAc4FX8IKkrXhFJd4bI/CI05O59wOg5G/4NmNAJK/f7AFDyE+NmovXEPpquG3Vy9NkVY1dYWeDBBbdYlaKxyiM/rzQUI1BrDs89EL99XczMHpunfr/mag0KcJhrS0bv2ADCUpKY+MDTrSMGo7uXs6IdbAOI6ttYNov13anrjNs+CaGmZuDkbG0h+Ypny/+GzhOtgg1CZz+ITrMvrV8zFMwmQJEE0MO8l83c4cZFLI/mSyzECxZfrvxbmsj13m/4mMkyEmBUjnL6iBgknynYzBgwExS6CpVBP94XvUg20mcm9gk0kp8tcrWlylhKkxbwik1/2rErAmOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIqKU1+guyGq1NdbBX6e4OPuraZv7cE0bVeEFZxRafs=;
 b=p1ToCkyhthWKkbENfNNglEyhPLYwNuvyYBfvOv2+qeLdEW7ZvrVTNsiqZQ0TcmgLyWrqIDt5pMoEC10a0So2o17/Kkel+Axhueuki0vwDh79+Qq/u3uMZ/YyV5ZPOWyLG/x9oKLuiayoL8qbo+oSsejYRxRukyx2L0GCS46dwwWDpiKYnvpBm6xnO9rqu9UkU1KdVoEY0UeicGyBu5Q/sKEkcgocG6/BxpD2SWuIj5RZzSD0er4VCsTNs99zbK5fdmpZcN86lo395xI8VI8+0rqZ55gx8yG7m2agH3nzveU8JPk7zxypmmSiZB1g7DqAsy3uYrE7khN/Z0I8tjHG9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIqKU1+guyGq1NdbBX6e4OPuraZv7cE0bVeEFZxRafs=;
 b=KqzSYkgCsO19au0/6DFD4LPb1uZiuhRLGmyrojpkyb/6Z9YdhYeruRIqxPp+A2gv9GTdOABYusWFY/46f/kXX2swd5osnzLSAQPARyOUNyeG3UXWzi3QWNS48lthv3zYh787AJ9/SWUEOwhZGonSG/Lh5Y5IoA60+1nCGayTl6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DUZPR04MB9967.eurprd04.prod.outlook.com (2603:10a6:10:4dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 10:58:47 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 10:58:47 +0000
Message-ID: <02f75a89-01e3-4f77-b82f-bfb77641cec4@cherry.de>
Date: Thu, 13 Mar 2025 11:58:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v5] ref-manual: uboot-sign: Add how to enable ATF,
 TEE and User defined snippet ITS for U-Boot FIT image
To: jamin_lin@aspeedtech.com, docs@lists.yoctoproject.org
Cc: troy_lee@aspeedtech.com
References: <20250313020253.2785661-1-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250313020253.2785661-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DUZPR04MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: be93e4a0-1b76-46c6-b2a6-08dd621e079e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WGFEb2VSb3U4d0d1eGpIS1pLQzh2cUJMWGprRVBYYmFoeWttKzc1MEltV2p0?=
 =?utf-8?B?TnRzcUR2UFhVOVZaZldXQ3lIdlVCYnV1NmJsM0RncEhGd2I3WXRYdjVvWVlJ?=
 =?utf-8?B?TUduaGxVVHJBbzhrcTNtYnJFR1YzOEErb1F2YzN5NVlpZGozNHNaTFZuc1M2?=
 =?utf-8?B?dTZxdWVYTjBRL0NVNTdIUXJIenJnbjQ5T0kzOTdhNUNLa24zZnpCbHZCWUkz?=
 =?utf-8?B?NGs5aE5mcXE2c09sclc0WlA3N2lZcVVqN1ByRWVZZkhZRUl2bis0K3hpd1pk?=
 =?utf-8?B?OTR6VHJVRFJrUWpRaUxZNHc1S0FTdVlhRVVsY3MrdS9qQVJUcXNYN2xjK0pC?=
 =?utf-8?B?RUdrLzNpUHNmbEk0WnlQU3VrdHlKUlFkV2hZbWd4MnQ4eGt6UURCMmRSRWpB?=
 =?utf-8?B?NTQyZFF4eE9qTThaTEEwM2lpcktmN2RSOHRVSVdmWjNIRHpVdlV1NXdRWFlF?=
 =?utf-8?B?SXlxRC8rZTM3SU9EaEJXTXNtVlh1aFhFa2ZkV25HWDQ5K254d1FPMThReXVt?=
 =?utf-8?B?WnVLbG1haGM1dVh3eWRjNDhXcFJxaktVSDJTK2hVRWYweGdoL2pBM2hVVFdj?=
 =?utf-8?B?NjdIZHh4YklnT01sN2xqdEw5OFlrOUNCYnJwbnZMZG5UeHVKOFI1c215aVNC?=
 =?utf-8?B?OWpPQVlURm1FZ2lFVVpVNkdybmRLMTB4aUpWZXFodURtN3N1Sjh0K3Joc2F6?=
 =?utf-8?B?Y2pTMnVLRm5SdEJ3OW1EYjFQV0ZNSGJUZ21HRUpERU9neFkvV2hNS1dDamRm?=
 =?utf-8?B?Q0ZEWkRlOVZOMGhpTzFrU0tKTFNIby9yQnVFK1I0ZGkrdkc1ZGVIb2hsbm1v?=
 =?utf-8?B?SGp1RythblNlZDVETkxVZVEycGlmdWZTVThGZnRpSG5VTUFRbUhZb3MzZkF2?=
 =?utf-8?B?cWJuNHpTZmxncCtmVEhMcmY4ZjBMRWtkTkRDMDE4c2FMLzlid3lRSXdQQWtU?=
 =?utf-8?B?R1VlR1BZZm1DQUVhMWJDY3FXOXNDYURRU05wK0tzOEJCMXRKTXI0QThrNm5r?=
 =?utf-8?B?a2ljZ0xkdm0xSEp0b2dBby8wSmhKUndoNlVuZEtRVXYyYXEzYmJBS0s1WHEy?=
 =?utf-8?B?bG93V3ZZbVAwM1JXaWFLWmEyNHB5SlBjbXRKMWFiYkpYaVR2TjNlazVoclg3?=
 =?utf-8?B?MVU0SDV0Vm85YWVhWkpsUGI1a1JWUkpxWmI2V25hRDYwRFl2ZEs2K0pocVJE?=
 =?utf-8?B?TFduUEk0VWNnNi9ENjVYU1pZdFR1bmxtMFRETTg3cnFDV0ZIcnB2Qmp1VE5G?=
 =?utf-8?B?MWR2OHd4eTRSZUYzeERCNEhLNGJlVCswVm0yYzFHb1gvVXBZSmdaS1ZyZ2tr?=
 =?utf-8?B?dCtDQlJUUWx4NWc5S3RsREI3NTJPRklyUTY1NVdDNkpSOHRNaEVWK0o5cHBs?=
 =?utf-8?B?enpGK1RiOW8yWmFtVUVTV3N6VDd5dDFVdWdVc2RmZ3N0VDZCWjdKWFJFZGFi?=
 =?utf-8?B?cW9JdUUrSDU5MTkyVlFJM1BsN2hDVlNxVzdJTFR1ZE1WSE9WbEF0azgwYTlm?=
 =?utf-8?B?eVpWei9xUmRaNmYyaEdYNGJtUlBPbFZScWNBNTdjOUs5SFdlaXZmN3A1QmRI?=
 =?utf-8?B?cHhnWThSbmVYMC9NMFZqbXF4MkE1RzFZNHlBdWhiNUxEQzFhVHZGYjlBSmdW?=
 =?utf-8?B?QTRZcys2dElBWldCbjdDVmtPVHpoL0ZMdHpGbjM4T21KUjEvZXROVnpOVmwv?=
 =?utf-8?B?SVU1bzhiZ25sMVRobmIrREJSeENvNWNzOW5kaWdGVndXOVBvcVJha0Q1MXpK?=
 =?utf-8?Q?47Y6NwD12WKUuqRzfNVG5UeUMrFL1ePkUkKaUsS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eTI1alArajFaT2FtMUY3QXZWcmY4eElRQ2YvSHpMKzBRenp6RXdONDRkUTdZ?=
 =?utf-8?B?dlZ0VU03MjMrVjhnQnhpMk5oSEhHSVdZRHQyVVJab05GRmRzQ1JidEE2VVlo?=
 =?utf-8?B?MEw5dEtyMUkwYjdZOXEwNWowRXhKM2toUEp3byswamRlckczK04vR29NLzFv?=
 =?utf-8?B?OFdhMzZLdFA1NE1nR0FHL1p3V1BPdWJzSEZHR21YSGxVcDJ4dXdIaTFaU29K?=
 =?utf-8?B?aHF3aU5OSWFEVDdrZHdpeEF0VVNtUUpYOG8rUzZvdXpybldBNGJRS3NSbUFI?=
 =?utf-8?B?cVgraU1EVU4vdkgvOFhENmZSQmEyQy9saFdaREVaZW9PYlpXL1ZmZytwQm5x?=
 =?utf-8?B?RUJmWktKNGJhSTB0Z0I2eURXQ0ZQTy9WUy9ZZjcrTWxtay93K2Z5U2MrUkNC?=
 =?utf-8?B?RTRFbnFsaEdnbzcvbjRPbVBBenJVSldCSkNJaEJmQ0lEc21WZFpFazJDWnFV?=
 =?utf-8?B?cXorT2h5ZXY5dGc4MDZpaUJMNHkwandXYnlNMGE1bGY2WWVtb0IzK05rQUtn?=
 =?utf-8?B?VmlHRFk3TGxFNnphaEZHbURjQjB5VzhTT1IzYWRNMGREQXR6SjA0VjFpblRD?=
 =?utf-8?B?WWlKVUw3OWdnZ3czTE5lcjhEMm5oKzQrR1FHK3VpL1U3QXdNVDFLaHBRK1B4?=
 =?utf-8?B?Z0RjSGdWcUpXZVpwZFlaYWtWcjdJWFkvZGlJY2daYWVQdzZYQ2NQOGdUMjF0?=
 =?utf-8?B?S2pUNlN0VWJTeGpPT2xaeGhtL1E3YllRRUxrMllxSGxDNTRZcnpqTXdudFB3?=
 =?utf-8?B?YXV1ZVh3ZldMVUR2WG9FRUZYcENwUmp1dVRuTjZGd21VVjFsSEJaSWEvWGFj?=
 =?utf-8?B?QXpGVzZJMXZzSGJZbUFKSjh4c29hWEQwZm11emRDYXVUZGE3bXdkMDJZQWc5?=
 =?utf-8?B?YTJLbjVxTmRyc1FHOGdnaFl4UHRyc2Q5N3FIRWtMcFJhcHVlM0E4UUR1N0FN?=
 =?utf-8?B?VG9wUGhqYXpDUFRPWHpvMkpiWktJMVNpaXdFS3BJZTl5ZzN1bDBGbG04VDUr?=
 =?utf-8?B?aGcxZjRQenFBQmVLdkRTYXpuVFJXUnR5cnVTMG93OVo3ek50aWxWaVVnYTlB?=
 =?utf-8?B?T1RrSm9oT01oWjAycVo1WExRbmdqeVJkM1NZMDBzcURDd3lpaVRpUmViN3hB?=
 =?utf-8?B?QXZycXdIUDJuUU9GTHFIZEdOY1Bqamlza2ZIYkN1OWdEQ3RRVWR3R3Qyejh0?=
 =?utf-8?B?U3dya2lINm95alVHT0VHWmVJTkhWbUE2MmZXVm9jMVl0aGFhNWV4VHBOckFR?=
 =?utf-8?B?QjFibThUQWpkbEdXQTJhQzNDUFZzaHNsdzR1NkxtZHNPcVc0bThkT2hTNUdo?=
 =?utf-8?B?aURYQllEUnFKTkpJUU9QK2JYMUhWQSthbU0rMDlnWE5DL3FKaTJNVHNFck1D?=
 =?utf-8?B?d2lpZmdSckQzL2F6R3BGcXVUK3JHMjJLU3c4ditNdDFhYzlzUmxWbCtBZTRF?=
 =?utf-8?B?alJqOEgwSHRXWXcyRk9INGZuMjFzazdoM09jSVgzT3lwSmdZQ3E0dzIrU3hl?=
 =?utf-8?B?M3FZZUZQUGw1VkZhMUNDamYraUtrSTFOK0Z4Qld5d3M2VkV6VkZXTFpjMnBo?=
 =?utf-8?B?NlVQSWpiL212RURUNVlYR2hheGhYWE1hdWFCeENhQ3d2cng5TG8xd0xlaWhH?=
 =?utf-8?B?YWNOQTJLVmNpRG9yamZNOVd5YUovUldLeDl6YXJET04yL1hETEk0dVpjM3ZO?=
 =?utf-8?B?b0kzb0hqam5qZHdYdFhQNlVmUkxsSHpGcUhMd2EvZStCN3pwQ0tnQUluSk9T?=
 =?utf-8?B?d3B5SzBpTVJRNzV6Rk1OWmJKKzB1SXpxMzF6OXpFZHFWbU1ZMTNrRENmNkZ0?=
 =?utf-8?B?bGQ4Zm5nZ1VKYStYQkJQbFNMRWt2ZzQrcmFHSmVwOEVLazBqNUlETUJia2xL?=
 =?utf-8?B?OGppTkMyeFhINFJNa3pmaVhQRlIxY3o1YzAzVEgySHdRQ0EySUIvTVQ1RWZY?=
 =?utf-8?B?MkNVV2Z6dWRYRTFTVVgxRWJvSmRDUHVEZkZob0ZMdGV0d2dtcUJJSXhJRzlu?=
 =?utf-8?B?S0pSb0JEUXdLYWphTHlZVVZnNm9KcnVacW1tWU12TkdjZTczYzNiWGRvYXMv?=
 =?utf-8?B?b3RQMEhhTlgrY0N2cVl6dGo1UW5ic1BHd3B3V2t4aFY0aG9OQ0VNdVJOaHlG?=
 =?utf-8?B?eU0zUDM2eVBqVEoyN3pKODhFUjVSZjJDS29MTXdJQ0VNV0IwZUNvS1g4bzBH?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: be93e4a0-1b76-46c6-b2a6-08dd621e079e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 10:58:47.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sqEroIW8cpP8UflnFKp7K7AQ0ixiibTgSZk4luqg98Esa/Dxxr2Ls7uah/uWdCP86hJx/XfcHyqYt1NoJG5lzHtf2nyu0dLW/YgA8bUMh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9967
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Mar 2025 10:59:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6555

Hi Jamin,

I think we're almost there now!

On 3/13/25 3:02 AM, Jamin Lin via lists.yoctoproject.org wrote:
> Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image generation.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   documentation/ref-manual/classes.rst   |  14 +++
>   documentation/ref-manual/variables.rst | 137 +++++++++++++++++++++++++
>   2 files changed, 151 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b93279ff6..4b02daa58 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3401,6 +3401,20 @@ The variables used by this class are:
>   -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT image.
>   -  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
>      rebuilding the FIT image containing the kernel.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`: include the Trusted Firmware-A (TF-A)
> +   image in the U-Boot FIT image.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`: specifies the path to the
> +   Trusted Firmware-A (TF-A) image.

s/image/binary/

> +-  :term:`UBOOT_FIT_TEE`: include the Trusted Execution Environment (TEE) image
> +   in the U-Boot FIT image.
> +-  :term:`UBOOT_FIT_TEE_IMAGE`: specifies the path to the Trusted Execution
> +   Environment (TEE) image.

s/image/binary/

> +-  :term:`UBOOT_FIT_USER_SETTINGS`: adds a user-specific snippet to the ITS.
> +   Users can include their custom ITS snippet in this variable.
> +-  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds one or more user-defined images
> +   to the loadables property of the configuration node. It should be a

s/loadables/``loadables``/

> +   comma-separated list of strings and each string needs to be surrounded by
> +   quotes too.
>   
>   See U-Boot's documentation for details about `verified boot
>   <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verified-boot.txt>`__
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 861b04eaa..376782508 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9949,6 +9949,45 @@ system and gives an overview of their function and contents.
>   
>         See `more details about #address-cells <https://elinux.org/Device_Tree_Usage#How_Addressing_Works>`__.
>   
> +   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`
> +      `Trusted Firmware-A (TF-A) <https://www.trustedfirmware.org/projects/tf-a>`__
> +      is a reference implementation of secure world software for Arm A-Profile
> +      architectures (Armv8-A and Armv7-A), including an Exception Level 3 (EL3)
> +      Secure Monitor. This variable enables the generation of a U-Boot FIT image
> +      with an Trusted Firmware-A (TF-A) image.

s/image/binary/

> +
> +      Its default value is "0", so set it to "1" to enable this functionality::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE = "1"
> +
> +   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`
> +      Specifies the path to the Trusted Firmware-A (TF-A) image. Its default

s/image/binary/

> +      value is "bl31.bin"::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?= "bl31.bin"
> +
> +      It is estimated that the image is placed in U-Boot's :term:`B` directory.

Maybe reword to:

If a relative path is provided, the file is expected to be relative to 
U-Boot's :term:`B` directory.

An absolute path can be provided too, e.g.::

    UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?= "${DEPLOY_DIR_IMAGE}/bl31.bin"

> +      Users can specify an alternative location for the image, for example
> +      using :term:`DEPLOY_DIR_IMAGE`::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?= "${DEPLOY_DIR_IMAGE}/bl31.bin"
> +
> +      If the Trusted Firmware-A (TF-A) image is built in a separate recipe, you

s/image/binary/

> +      must add the necessary dependency in the U-boot ``.bbappend`` file. The

s/the U-boot/a U-Boot/

(note the capitalization of B above).

> +      recipe name for Trusted Firmware-A (TF-A) image is ``trusted-firmware-a``

s/image/binary/

> +      , which comes from the
> +      `meta-arm <https://git.yoctoproject.org/meta-arm/>`__ layer::

s;`meta-arm 
<https://git.yoctoproject.org/meta-arm/>`__;:yocto_git:`meta-arm 
</meta-arm>`;

Please check this works, I'm not entirely sure about the syntax anymore, 
but please use :yocto_git: here.

> +
> +         do_compile[depends] += "trusted-firmware-a:do_deploy"
> +
> +   :term:`UBOOT_FIT_CONF_USER_LOADABLES`
> +      Adds one or more user-defined images to the ``loadables`` property of the
> +      configuration node of the U-Boot Image Tree Source (ITS). It should be a
> +      comma-separated list of strings and each string needs to be surrounded by
> +      quotes too, e.g.::
> +
> +         UBOOT_FIT_CONF_USER_LOADABLES = '\"fwa\", \"fwb\"'
> +

Question: do the quotes need to be escaped like in the example? or can 
we have:

UBOOT_FIT_CONF_USER_LOADABLES = '"fwa", "fwb"'

?

>      :term:`UBOOT_FIT_DESC`
>         Specifies the description string encoded into a U-Boot fitImage. The default
>         value is set by the :ref:`ref-classes-uboot-sign` class as follows::
> @@ -9997,6 +10036,104 @@ system and gives an overview of their function and contents.
>         of bits. The default value for this variable is set to "2048"
>         by the :ref:`ref-classes-uboot-sign` class.
>   
> +   :term:`UBOOT_FIT_TEE`
> +      A Trusted Execution Environment (TEE) is a secure environment for
> +      executing code, ensuring high levels of trust in asset management within
> +      the surrounding system. This variable enables the generation of a U-Boot
> +      FIT image with a Trusted Execution Environment (TEE) image.

s/image/binary/

> +
> +      Its default value is "0", so set it to "1" to enable this functionality::
> +
> +         UBOOT_FIT_TEE = "1"
> +
> +   :term:`UBOOT_FIT_TEE_IMAGE`
> +      Specifies the path to the Trusted Execution Environment (TEE) image. Its

s/image/binary/

> +      default value is "tee-raw.bin"::
> +
> +         UBOOT_FIT_TEE_IMAGE ?= "tee-raw.bin"
> +
> +      It is estimated that the image is placed in U-Boot's :term:`B` directory.

Maybe reword to:

If a relative path is provided, the file is expected to be relative to 
U-Boot's :term:`B` directory.

An absolute path can be provided too, e.g.::

    UBOOT_FIT_TEE_IMAGE ?= "${DEPLOY_DIR_IMAGE}/tee-raw.bin"

> +      Users can specify an alternative location for the image, for example> +      using :term:`DEPLOY_DIR_IMAGE`::
> +
> +         UBOOT_FIT_TEE_IMAGE ?= "${DEPLOY_DIR_IMAGE}/tee-raw.bin"
> +
> +      If the Trusted Execution Environment (TEE) image is built in a separate

s/image/binary/

> +      recipe, you must add the necessary dependency in the U-boot ``.bbappend``

s/the U-boot/a U-Boot/

(note the capitalization of B above).

> +      file. The recipe name for Trusted Execution Environment (TEE) image is
> +      ``optee-os``, which comes from the
> +      `meta-arm <https://git.yoctoproject.org/meta-arm/>`__ layer::

s;`meta-arm 
<https://git.yoctoproject.org/meta-arm/>`__;:yocto_git:`meta-arm 
</meta-arm>`;

Please check this works, I'm not entirely sure about the syntax anymore, 
but please use :yocto_git: here.

> +
> +         do_compile[depends] += "optee-os:do_deploy"
> +
> +   :term:`UBOOT_FIT_USER_SETTINGS`
> +      Add a user-specific snippet to the U-Boot Image Tree Source (ITS). This
> +      variable allows the user to add one or more user-defined ``/images`` node
> +      to the U-Boot Image Tree Source (ITS). For more details, please refer to
> +      https://fitspec.osfw.foundation/.
> +

Since there'll be a v6, can you check this link actually works? I have 
some vague recollection the dot may be part of the URL. You may want to do

https://fitspec.osfw.foundation/\ .

instead?

> +      The original contents of the U-Boot Image Tree Source (ITS) are as

s/contents[...] are/content[...] is/

> +      follows::
> +
> +         images {
> +             uboot {
> +                 description = "U-Boot image";
> +                 data = /incbin/("u-boot-nodtb.bin");
> +                 type = "standalone";
> +                 os = "u-boot";
> +                 arch = "";
> +                 compression = "none";
> +                 load = <0x80000000>;
> +                 entry = <0x80000000>;
> +             };
> +         };
> +
> +      Users can include their custom ITS snippet in this variable, e.g.::
> +
> +         UBOOT_FIT_FWA_ITS = '\
> +             fwa {\n\
> +                 description = \"FW A\";\n\
> +                 data = /incbin/(\"fwa.bin\");\n\
> +                 type = \"firmware\";\n\
> +                 arch = \"\";\n\
> +                 os = \"\";\n\
> +                 load = <0xb2000000>;\n\
> +                 entry = <0xb2000000>;\n\
> +                 compression = \"none\";\n\
> +             };\n\
> +         '
> +
> +         UBOOT_FIT_USER_SETTINGS = "${UBOOT_FIT_FWA_ITS}"
> +
> +      Newlines are stripped, and if they need to be included, they must be
> +      explicitly added using ``\n``.
> +

Please specify the quotes need to be escaped too?

> +      The generated contents of the U-Boot Image Tree Source (ITS) are as
> +      follows::
> +

s/contents[...] are/content[...] is/

> +         images {
> +             uboot {
> +                 description = "U-Boot image";
> +                 data = /incbin/("u-boot-nodtb.bin");
> +                 type = "standalone";
> +                 os = "u-boot";
> +                 arch = "";
> +                 compression = "none";
> +                 load = <0x80000000>;
> +                 entry = <0x80000000>;
> +             };
> +             fwa {
> +                 description = "FW A";
> +                 data = /incbin/("fwa.bin");
> +                 type = "firmware";
> +                 arch = "";
> +                 os = "";
> +                 load = <0xb2000000>;
> +                 entry = <0xb2000000>;
> +                 compression = "none";
> +             };
> +         };
> +

Looks good otherwise!

Cheers,
Quentin

