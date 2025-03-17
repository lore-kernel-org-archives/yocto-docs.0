Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA6CC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 11:35:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web11.50172.1742211322632393616
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 04:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IAWzxsxB;
 spf=pass (domain: cherry.de, ip: 40.107.22.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1ljGrMEoQIezpAWNf6TbcmWg4zK78vI+E+CI2RGdIk4hHsacIwyTyEW+rjC6rSmObILXIfoFHpmf5SSSiMj9aEDNwHuQYBaVi2pPtRrNHxbHQeeV6bF7vK7iP+2Iw3B7g1fnYc2xqteQy//8ZMArnLlLpCpgWlqsxMaD8039e9Sqj5w1Cnm31rkW4BsNCo94WDv22Cd853XvLLXohHeLUJzK438yrZTW6CbDwN0k78FkcavKtiYqDIafZcPI7oOQtQJ6Ce9bRWmocxbTCOONTu9+ImRN5dW5u7KCyJzkJevyGQ1DYcBcDYM7500gx79qnmkAdHoJuvJDIQ7wWcx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHYivPNp8yxHa74nclQPgav2bZZ2pMK/mzXhMtvbnLo=;
 b=i0wdVB9P9FnLEJ/5Ue9jcie1sSAb2t474xPm43/YPpqYYRY3RbNBSNSu8BnDSkgT4rAfjse3fKNnWlGmSRB25hc6e2/zrv5OdCbFObE4RCmIIVTsAMUVwFf+dtiURLtkTBMSVXgFLgye0ai53EDhW5HaJf/cqS/prRAMYssZSRuDVE+EOMW4YBxaq80VNufWKs5VzM1ZyxnG6qgaE5tpYYhWaFsb4Gp3C1BN66T/RMzyf+LXG/6olhGYkZX1UQeXjuQ1DNPwNYuAFvzfKFR14iGphpPiHCaWGO4vmbtRC+CLDTQ1mE0qWp7Yu99kwkK0RwCaxi/GuRdjAM2NnwYATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHYivPNp8yxHa74nclQPgav2bZZ2pMK/mzXhMtvbnLo=;
 b=IAWzxsxByvQtfxvoANRMVyNktfW2d2rV+O5ZSq9Y9d8Qf0xKasqFUhrkEZYWROcay4XoT01wVHjpeyDENfWAqk5ofNWjs1rgREuGIcnzLb723VoTZpgsAE7KeHRdObaa+jLCMwKwA3eA8cvQECJlLWOGHJX8LEFZLOebibhAWFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6956.eurprd04.prod.outlook.com (2603:10a6:10:11b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:35:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:35:17 +0000
Message-ID: <acc19cf6-4a72-41c8-9039-4897e179a0fd@cherry.de>
Date: Mon, 17 Mar 2025 12:35:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v6] ref-manual: uboot-sign: Add how to enable ATF,
 TEE and User defined snippet ITS for U-Boot FIT image
To: jamin_lin@aspeedtech.com, docs@lists.yoctoproject.org
Cc: troy_lee@aspeedtech.com
References: <20250314021535.1677985-1-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250314021535.1677985-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e159090-e0e0-42a2-1c43-08dd6547caa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2hCcTBHTVc4dldvWGhDZEFvOGNLOC9Zd2hGaWtRY0dTWk1GMnVuUUVDNlUx?=
 =?utf-8?B?bHFFQmM1Zm9MRUFYU1dmTURHYzF6NVB0YWl4dENUQW82ZWN3eGN3dWVFOEkr?=
 =?utf-8?B?MSt1MWdGYldLTXorV05vbVRBTUpZQStaNWxablRrQmFvMFRTSTNJZytEMDZn?=
 =?utf-8?B?OGpiWTgyelo0Si9lenVZVDFoOTdNN2lWeS9GdmZPcm9jaEZkWG1uelIvYm53?=
 =?utf-8?B?UDdoemd5Vlphc2Jlei9GcHAyeU42MEtDaUFCNHVXVm44cUdqZWZmOGlEVmJH?=
 =?utf-8?B?OEM0WlExczJXQTZUOE50aWpUK3lTNEVaeHM3aXozWm5kUEZwYVhIK2ZtbGV6?=
 =?utf-8?B?cm5QdDZjU2g4eDk4NXJXTXI0bFl5L09OeUd2UVgvUy9aUzRmbUZ4RVUzQzNv?=
 =?utf-8?B?cjIwOUEvT0t4eWx0anZteWliWkZLcjJjclNEVXZZanRZMldnc2xnYXJKTTZt?=
 =?utf-8?B?RFhtV29zenk3c05VWFpHaHpyaHBNMVFLdXZxY2FOVjVxRmpzL0NsRnRoRFVo?=
 =?utf-8?B?amJ2cFNPUWRpbG5NOWNtSXEwUG5VNmV2clp1b2FaSzlrbFBYeFpYckhrSEVI?=
 =?utf-8?B?dEhrdHVnbTduc2ZXVUY4cWFyNHRGUXRjN2x4Z0hPOUtJZVorWmhKdjZ3YVF0?=
 =?utf-8?B?c0tUMEFLYzlSVm5rWmZLeDdzc2pmUWhLbTRWVnNmbS9Cd2JsOEVSUG11YnM5?=
 =?utf-8?B?dWs2WXg0VEhieEozU1JjRTdoT0p3SnB1b09CalZSeVp5NmtrTE5OdFJGbnRr?=
 =?utf-8?B?TVBla0RNeCtaUTkzbEdZWkNzWnYxWFVnOFhnVUhTUGp6aGxIcUMvR2JPSzJM?=
 =?utf-8?B?eDZMd3M3aFUrMm42N091dWl1S1hMelpGSUhjb1R4WTR6LzV3RkhwY2QzWXZN?=
 =?utf-8?B?VGpUU2RZb1R0UlZhdnk2WDJVR1FzRnR3N1BkYklMcVJPWVdmaTA4UEtzUWMr?=
 =?utf-8?B?Vng0UnVhV3JKang0aGlaNjdxQVVaRVRkcG5yemFhUUxGY0RUSm04UWFJOFR2?=
 =?utf-8?B?SjN1RWZLd3djWEZyUitFdWJ4Sm00SWRqc2xLWjRFZ2RUQWJHY0MrNlNNRnRj?=
 =?utf-8?B?a1BkaEdTajE5T093VzNGUVA1Rjd5MTN5U0JJdXRldzdTVmpxMU1lRk5EZms4?=
 =?utf-8?B?OVljb25DeFFJSmhGYmY3NVI5WHk0cDl6cCtNaHgvanhoc0o0RG1yK1FQbFU0?=
 =?utf-8?B?VDZkdjRpOEVQbFlyV3gwcHRwejBLMHU3UENYMEtXZ25GTFVLZGlIZk9mZVlJ?=
 =?utf-8?B?eXBWSVJ1b0h5MVpIUEtyZEdyN0ZGSEZWeDBYZUJMMDU1MTFMRkhSTnhoajM3?=
 =?utf-8?B?bGJjNHdRYWJUREpRYnlCRk9qNHpsQVRhYldjT1lpQ0NwVWRQcnc2NExib0hX?=
 =?utf-8?B?Rk1mWDJBTHF5RjFJWkVVejdONHIwSE5kc1NOVE9LNlIyU3FncUNHQ05LZllZ?=
 =?utf-8?B?WjBCYzlqS1hxajZTSzNGWDRxSE4zcUJ6SG83YUowQVlET0NvVno3SU11ZWlh?=
 =?utf-8?B?TEVPNm81YjQrMDhFVnJhbTZuVzRCN2pKUlpabmJvQmN4VXY0aS9qNEExZkMw?=
 =?utf-8?B?TlhGQXhTbXAwUXU1Mkk5SzFwVm83L0pDNHhaVTNRZ0VLdG1nTVVOM0t5UW9J?=
 =?utf-8?B?T25GWitWTmM0c1pTalBGaGJqQ0Z3cGVvOXRQRlMvTzJPMCsyS2Zsd2xlb2Zw?=
 =?utf-8?B?V21JYU4wanQ5eUhFOVg0dHhmcjhiVGdkVEpJcXl5a2MvVHRVbEptdlNqWnVi?=
 =?utf-8?B?UWcxQjZPZFJLZWYyeGFsWFgrOUdpU1FXakJPbzZyWTlpUXhQZ2VBSmVNTGtj?=
 =?utf-8?B?azhER0RFNVhrTHVLeVpVUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHMrWUtXUkpBRTRtOVhCT3didnY1Q2lXaEFqWVV6aTVUdGZlN1BjTnFLR2lj?=
 =?utf-8?B?a1Y2NzVwdWQwSHhaeXgrODlsSDFxVE9KMW1uMHJ0NXR0YXl1WFYwNEQ4SWdT?=
 =?utf-8?B?bzg1WkcvTG4wb3FndjJKV2hpbS85QW9wZ2Y4ZEVjYnNUODNDaURRaE1COUZD?=
 =?utf-8?B?TmJCTU4veHB3WU1UQzB4S2xnWG1wdWIrc2ZLajlWc2pNMkN0K0NYRDhPWWw1?=
 =?utf-8?B?YUJQSHphcjBXM2FaUm9wcE1MQS9OOVhkZFBMOGdwbDlvL3NKZWZZZnRiclkv?=
 =?utf-8?B?MTBNV21EdUdvbWRLUWIwQWZvSUJDbE5WSllQTkFWMnQ4N1ZzOGlFTll0NWFt?=
 =?utf-8?B?MmlyNWZjcTVqRlk0ay9WazdYeUJNd3VRMDFpSDUxT01CNW91Q3lDQkUxWnZl?=
 =?utf-8?B?cjd6MjlIVXBIVllKampCWVRPajEzMkg0bi9PN2R2L1hDbVpiZC9Za1JZbjg1?=
 =?utf-8?B?SEVrd1pYSmRQK0lQUFhHTXJFcjVqNFpJWldhV2JPdkNNdG90QlY2T0YrSzR5?=
 =?utf-8?B?dTFLQ2Y3bHV5ZVloTVJscDB0blpneGxoeFVpNVNxQTJGR3dsSjJSMEVDaHhr?=
 =?utf-8?B?YlZJUnpLWi9nMkJMZHJaT3pyaWRtQWhadWlhWGlaQ0VMcjdSM1RIdUw3ZWpG?=
 =?utf-8?B?M3QzVU4zYmttbzhzTnZyVmVmQkJKdmhTYUxKVzNpN3YzYzN4WjMrZCs2KzZr?=
 =?utf-8?B?V3J6ZW9WcU9SQ1Z2Y2FOU0J5S3NYUmU5ZE9qeXhjM290MHQ0aFc4c1o2V1lq?=
 =?utf-8?B?Qk8zSVc4bkhyc3VaMWp1ZkJVUW5lano3ZTgyc29GTEx5MlRaUU54b1pVcDdk?=
 =?utf-8?B?WXUwUUdaVDh2Mk44R1JQT1VHL2VNZllSbmwwZHQ1QnhvZWJPencySVhyZTZw?=
 =?utf-8?B?UWxxbDNQOXJ0eGRvSGlDMmJNS0tzSUZ1OVFOeWw3a3VaTkVZQ1VaRW5qbUZV?=
 =?utf-8?B?ZEhkL3BEcnhILzU2RjNNZXN0Yk9HRkplaFlNT0I1TGg2dDVXTjhHRGFXKzhH?=
 =?utf-8?B?cEFGUmdiZGNJc3lUTUh4OXdLdW8wVmxvbHMrb3E0bUZTNDFQc2hNWElPNWhY?=
 =?utf-8?B?ekZibytKcmU2WjMwcWRsTk9NeGpRUytLKzNURU84UC9Kd0o3bzI5cTh0YnMx?=
 =?utf-8?B?bjMwVm8vWGxyL1hETFduRGppdFBwN2hLTjVKTHdRREVrd291a2h4aXV3ZVRE?=
 =?utf-8?B?bm1heFIvTlF2aFg2V0JGbmZhZmF2UFFwdHhoUGtndDQ0bm5sK0lFeE1GNU05?=
 =?utf-8?B?MUtOMldRbXFsWmxheTFpeW9XaU14dHl0MGNNRG1zTTk4em1FOU14NUgvQXUx?=
 =?utf-8?B?SU1BZUVZbzFCcjM4Y0xscXdxcDhtVGsrVjJZQnE4SXlvM3l5d29nemhuT01C?=
 =?utf-8?B?WFpDaUNMNm0rUStlRWJZZG5ONm1kNmQ4OTRWc1N3NVRGaUhZSHU0RFFHZXVW?=
 =?utf-8?B?STRLWlJ0QTFzaGMyanliTjNyQ1NCc0Y3d1krbmRTb1QvcTE3Y2hQRHN3NkVE?=
 =?utf-8?B?UEw0akc3M2c1Z2lETjM3N1hYcVdZU2tKREIwcDlXa2E3MWc1cEs2WmM3K0RD?=
 =?utf-8?B?N3dDMGQyYnoyMHQ4a25pbzRsakFQM0M2dzNJVDNJUlpHUHc4MWdselZmK0pw?=
 =?utf-8?B?UmZIT3oyN3FOUHpSZWxkMlFWWkZEUHU3UE9hV2tQV3ppbXU5alM4RzJtNmty?=
 =?utf-8?B?cXhuSEkraGZhT0NLQWF6K0h2bkhFRTlmRVFGN1ZncXBhTDVyVkw3Vms0SWpl?=
 =?utf-8?B?ZDE5OEZlR0wzbDg3Q1Y1aUhaSGJzcTRpcjlEZWNpWStlYVNLYmlRdVNDaURY?=
 =?utf-8?B?VWl1ckl0NGNSQk5UY0pKUDVsMmRKMTNMVFZoS0FZMmFRNUdkTGtxNmxadlAv?=
 =?utf-8?B?K2d6cysxaDhtaDhVZlBCTlh1bTJrUnFJeWg4bWptK2JrR3A0UUtsYUhWOWhP?=
 =?utf-8?B?VHZSaFpvV3Y4UTlwV3ZYeFdxMW42UGo0SGNVajhLUzZRK3BkaG82K2Rrb3JG?=
 =?utf-8?B?cys1K2Q4eTZuY0JCY29tQlZjTFUreUpOdi94UnhBUTE1LzNIYWtPaTYwVGU5?=
 =?utf-8?B?MW9Fa1h5Sm9wYXUybU5jWGgxLzNNZVcxM1ZiL1JZbDE3bmdoYjFOSjNzeEtP?=
 =?utf-8?B?cFJPbGU3czNwc0w0Q0dNSW1hSStwNkRLMU05ME9KUFcxTzRKclduODhWYjMy?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e159090-e0e0-42a2-1c43-08dd6547caa1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:35:17.4173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2zA9wce65sNo/hWerxV34nmnNmNYVsaarxxLWXva2XJgsMKkww19Pts/xc/v7RKv/2TlBYIxk4trbs8tZvQrQ/MFGoMG4jBmwFzzk4Uq3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6956
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 11:35:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6577

Hi Jamin,

On 3/14/25 3:15 AM, Jamin Lin via lists.yoctoproject.org wrote:
> Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image generation.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   documentation/ref-manual/classes.rst   |  14 +++
>   documentation/ref-manual/variables.rst | 137 +++++++++++++++++++++++++
>   2 files changed, 151 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b93279ff6..0a73a956e 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3401,6 +3401,20 @@ The variables used by this class are:
>   -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT image.
>   -  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
>      rebuilding the FIT image containing the kernel.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`: include the Trusted Firmware-A
> +   (TF-A) binary in the U-Boot FIT binary.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`: specifies the path to the
> +   Trusted Firmware-A (TF-A) binary.
> +-  :term:`UBOOT_FIT_TEE`: include the Trusted Execution Environment (TEE)
> +   binary in the U-Boot FIT binary.
> +-  :term:`UBOOT_FIT_TEE_IMAGE`: specifies the path to the Trusted Execution
> +   Environment (TEE) binary.
> +-  :term:`UBOOT_FIT_USER_SETTINGS`: adds a user-specific snippet to the ITS.
> +   Users can include their custom ITS snippet in this variable.
> +-  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds one or more user-defined images
> +   to the ``loadables`` property of the configuration node. It should be a
> +   comma-separated list of strings and each string needs to be surrounded by
> +   quotes too.
>   

Sorry for misleading you, I meant to say:

TF-A binary
TEE binary
FIT image (or simply FIT?)

>   See U-Boot's documentation for details about `verified boot
>   <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verified-boot.txt>`__
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 861b04eaa..4a8049e14 100644
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
> +      Secure Monitor. This variable enables the generation of a U-Boot FIT
> +      binary with an Trusted Firmware-A (TF-A) binary.
> +

s/an/a/

> +      Its default value is "0", so set it to "1" to enable this functionality::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE = "1"
> +
> +   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`
> +      Specifies the path to the Trusted Firmware-A (TF-A) binary. Its default
> +      value is "bl31.bin"::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?= "bl31.bin"
> +
> +      If a relative path is provided, the file is expected to be relative to
> +      U-Boot's :term:`B` directory. An absolute path can be provided too,
> +      e.g.::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?= "${DEPLOY_DIR_IMAGE}/bl31.bin"
> +
> +      If the Trusted Firmware-A (TF-A) binary is built in a separate recipe,
> +      you must add the necessary dependency in a U-Boot ``.bbappend`` file. The
> +      recipe name for Trusted Firmware-A (TF-A) binary is
> +      ``trusted-firmware-a``, which comes from the
> +      :yocto_git:`meta-arm </meta-arm>` layer::
> +
> +         do_compile[depends] += "trusted-firmware-a:do_deploy"
> +
> +   :term:`UBOOT_FIT_CONF_USER_LOADABLES`
> +      Adds one or more user-defined images to the ``loadables`` property of the
> +      configuration node of the U-Boot Image Tree Source (ITS). It should be a
> +      comma-separated list of strings and each string needs to be surrounded by
> +      quotes too, e.g.::
> +

I guess we can say that this variable is handled by the local shell in 
the recipe so appropriate escaping should be done, e.g. escaping quotes.

> +         UBOOT_FIT_CONF_USER_LOADABLES = '\"fwa\", \"fwb\"'
> +
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
> +      FIT binary with a Trusted Execution Environment (TEE) binary.
> +
> +      Its default value is "0", so set it to "1" to enable this functionality::
> +
> +         UBOOT_FIT_TEE = "1"
> +
> +   :term:`UBOOT_FIT_TEE_IMAGE`
> +      Specifies the path to the Trusted Execution Environment (TEE) binary. Its
> +      default value is "tee-raw.bin"::
> +
> +         UBOOT_FIT_TEE_IMAGE ?= "tee-raw.bin"
> +
> +      If a relative path is provided, the file is expected to be relative to
> +      U-Boot's :term:`B` directory. An absolute path can be provided too,
> +      e.g.::
> +
> +         UBOOT_FIT_TEE_IMAGE ?= "${DEPLOY_DIR_IMAGE}/tee-raw.bin"
> +
> +      If the Trusted Execution Environment (TEE) binary is built in a separate
> +      recipe, you must add the necessary dependency in a U-Boot ``.bbappend``
> +      file. The recipe name for Trusted Execution Environment (TEE) binary is
> +      ``optee-os``, which comes from the :yocto_git:`meta-arm </meta-arm>`
> +      layer::
> +
> +         do_compile[depends] += "optee-os:do_deploy"
> +
> +   :term:`UBOOT_FIT_USER_SETTINGS`
> +      Add a user-specific snippet to the U-Boot Image Tree Source (ITS). This
> +      variable allows the user to add one or more user-defined ``/images`` node
> +      to the U-Boot Image Tree Source (ITS). For more details, please refer to
> +      https://fitspec.osfw.foundation/\ .
> +
> +      The original content of the U-Boot Image Tree Source (ITS) is as
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

I guess we can say that this variable is handled by the local shell in 
the recipe so appropriate escaping should be done, e.g. escaping quotes 
and adding newlines with \n.

I think this means that newline aren't actually stripped, it's only 
because a multiline variable in BitBake needs to have each line ending 
with a backslash, which means they're then concatenated back to a 
single-line string but because the recipe uses that variable in local 
shell, we can put \n there to actually include newlines.

Otherwise this looks good to me, please replace "FIT binary" with "FIT 
image" (or simply "FIT"?), the an/a typo listed in this mail and mention 
(with the wording of your choice) that those are expanded by the local 
shell in the recipe so their content needs to be properly escaped.

Cheers,
Quentin

