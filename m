Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08371D13C30
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:18:58 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22466.1769440732464530382
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 07:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=X+ywYBHG;
 spf=pass (domain: cherry.de, ip: 40.107.162.39, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/V9UBDOFcq5MYXO8QFS2dE10HCePLomdZpBOWf6Kzb8j6F/Koc+GXbdlTSO8zcHoAEF8iZDLLtZUR/Q5LQBhWQeYV856QwPOUkLyBhGAMGW+f07reXwIw/VyD3xDTRiFl41Oo8BZAIS76FvrG1X9H65dNeLXcBcSWXZYI+TYMUPG5lvIghcmBItOnokt4FqbnBc2wcJstQAvBTgQOj2kX7LpHdeJYK3hYlvwUEqzG06u4OMKSKVsapfRYpr6sDVd5rhUQodItaA9Dnsms7E3eCQhOGnqi8TOSL5l8rsENyDnOEKchydtnvRL2y4SfxbqKf+2hyDKWO8Mf0y78a7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9zgZUPDLOGWxIucO+Wrf/WZcXoMBxcLwQx90uUu4YY=;
 b=OkyPHwEawId45Sq8+czhScUtN6jMm8nTVvvzs/R/cygb5xDLuSJNefo+BCXlw1cj/jN2YdiOcFNhgGX3wjKfiowcae3mIxBgkEYpBzxVC1SZicSb+5ePs5s0XYD5GUuDBism84i4vBKcAWVWe2kz26Jk5nZ6JF7lhXEkyV7Xhv78g3O5yMTL2FzztCugrx/VM5AU4qGo29BKYHC/Ny0fmEOqk1tn6TEXgHKxvqu9VrPCTGfx2mzdoKtd4yfaxCaR5Ujlw5ZpuwuFIXp5FBlQw3HO2Y8QINLLinDuWq8mB+d8JzVce4SwWhfB4boodJKzxWKv8VcBbT5vV8yIljoxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9zgZUPDLOGWxIucO+Wrf/WZcXoMBxcLwQx90uUu4YY=;
 b=X+ywYBHG0u2ZG1WFMK3XlotkhM6++dX4MrDY0+ErlQLpLZPblL7RcUe39PmLqhh+zMDy/mVeE4Pj+R/KnFGU5MHywGEUce+TmNYv55rZbb2OBHeGVfVfuELGbgzJucWJQK3K/Q0Y3CwCSjJf6lu7IBcfUNzs/gMDM95eMmmi1mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM6PR04MB11268.eurprd04.prod.outlook.com (2603:10a6:20b:6d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 15:18:46 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 15:18:46 +0000
Message-ID: <ed829b23-cc35-4191-8286-c07520bf0f4f@cherry.de>
Date: Mon, 26 Jan 2026 16:18:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 22/53] overview-manual/development-environment.rst:
 remove obsolete poky repo references
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-22-658a5f4dbde2@bootlin.com>
 <064b4d3d-0695-4ffe-8ae0-cd53ab2d281d@cherry.de>
 <DFYLXI28FQVB.2K36J5CKAU4ML@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DFYLXI28FQVB.2K36J5CKAU4ML@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM6PR04MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fddcb2-d6a8-428c-fe40-08de5cee3356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RXJ5dkg4aFZmcnVOWWQ4ZERZbUtYR0NITUhRaXMvWUQzNHRlMGtRUkJkb3Uv?=
 =?utf-8?B?dVZwcVhlREpTZGZZRHprWFZTNjlKbStSdkNYSHZJVmhoRktxaU91U3BGM3py?=
 =?utf-8?B?TGptdnFPejV1dzNDZXYrb0RGaHBhQzdDSk8wK1JPZUY3UVl5WU9aWWdMMEUv?=
 =?utf-8?B?KzcxdXZ0aWRWNjlJTWs1dUxOdzl3SkcwVXRhekNoRVFZU09tbjc4VzNaUWdB?=
 =?utf-8?B?OTF2eGNvTFhrVmdiYjFDYi9leDc5OFJ5WDZyS3dzSDR1MW84YjNka0NTVkJQ?=
 =?utf-8?B?em4vekR0SzJtS2FUTGdIZEJ2dEFXekRIRldWRFRGektrNW1GNWV2STAzT00v?=
 =?utf-8?B?NHpqdEpUMGVjNE5VVkp4MEdYTHlkSnhuZ2RpQTFoSk12aWQzRExPdmFsUEJj?=
 =?utf-8?B?Qk5TOGQ5TWRjK085d2d1MENVa0dvVXAxYTMybndoMkxIdkltTC9sYnBsVEQr?=
 =?utf-8?B?emh3SFpraytkZlpCMFhKR2Rrdkd2aFpyRlVwTmRpM1owSDBqejRMWFVYbDcx?=
 =?utf-8?B?V24wL2FlWWZaZGRHeXBiV3BiaFAwSHRScGdQckF2VnMwc1JENjBaOVNlWjhx?=
 =?utf-8?B?RWJ2U2JXZFpqUHdIWWYzbEs1RUM5TGxUSFZqek8xeEwxaEF5SjN1aUlacCtD?=
 =?utf-8?B?VklNYzdCQzkxYysrQjFkOXpjUzBFYjI0ZU8zUFpFUUJyZWZ6SW9UTzg3VE8r?=
 =?utf-8?B?V0kyZkZzZjBQRHZYeHpBZE9uUEk5K2tvZ1c3MTZ1SVZLRk5JT2dLTjhCWDNu?=
 =?utf-8?B?WWtoaEh4WXhPZEJQbFhEbWI1WXNRSTExTTZQcmVpMUhJVEdSUmhFbDQ5VWlm?=
 =?utf-8?B?TzkvSU1mdVFkWG9XOEtlZDF2b3Z0SUw2N21xaHViSWx6MmkvcUNzOENOeUZL?=
 =?utf-8?B?SGUxNGFBNWJycHA2eWh3dHpRSWJJWGE3U1haWlhuZ1IvazJqOW9nMW5QWkpk?=
 =?utf-8?B?cFlRZEtjYmJxNGl2NFJFNUhzRU54WTNIOTE2TFdUWm5GdVhUR0paRFJqTkl0?=
 =?utf-8?B?VnFjYzJkSUtKV2lTR2ZHSEE0dEJKYnRQT0JsZFo3ZkN1WU9JOTA4cXFFYkJi?=
 =?utf-8?B?bHZ0QU9WTlVpejdDUnFva3Y3Q0crSDFPS0UvSUdGNjl0VE5qbE5tYjRxcG9p?=
 =?utf-8?B?aEpHaWlMeVgrSlJCVk14eTYrcExRQThBRzBMSUJPcjM2QlFFRkhqcnVETFlU?=
 =?utf-8?B?U3g5ZXY5YUdnTUdsU2dSN1I2UzZMTWVlSkJxaUQ0TnNYL3R3OTBEL0NMRHVw?=
 =?utf-8?B?MzhLQ0NSdEFZREdFYnUyM3NOSGVrSmZQZ1J3NHlsSXFTNUY1UFNyc24xWjQz?=
 =?utf-8?B?VEhSOWlqVE1ZelBMVnJKRTFJcFdnRk14dHFuRW85UlVKaFNUcFdBRlBoc3pE?=
 =?utf-8?B?V2k5RmliZnM1RWRnSHdwL1l4WjZ3ZCt3K2thSVFhUmhWSWtWRldFTDc1ZkhU?=
 =?utf-8?B?dnRXUHUxZUtvSklSejMrWmJDVWdJQmd6V2p2WlpoUnpiUDF3cVZBVzRYbDgy?=
 =?utf-8?B?ajNLT2grNGE1T1JGcVJQeURFa3FSTzd0K3JFcmhvUUIyQzVnc0cweEsydlBN?=
 =?utf-8?B?UmxnREI2K1U2dkhoZjJ0RzZHbmdIUkppREs1VjR4RDZSYTM2Tms0RUlYOHI3?=
 =?utf-8?B?L2lMZzhqSW1aZEk0VFYwM3dheWc4b0JKRDBrZnVBcW5RN0dOQXVHUUhmM2hS?=
 =?utf-8?B?aDR6VnJleGFFVm5USFRhTmpGd3d3TXQrd3RORkZjakRjQTY0RUVZa0tlK290?=
 =?utf-8?B?ZVcwb1duZkk4NFQ3RXJxeWthNjhTWVQyeFZDZ2FkR2poTHpBOU41ckpKR3dJ?=
 =?utf-8?B?TUNvSWd1RTRwK2Qvdzh0M3lBVy9CNWM0R3BmOTFmb1NoYkpHOTQ3UndvemRL?=
 =?utf-8?B?U3pVYlMzNmgwdW1uMGMveWllSWlTdXFaRzdEVjlxTDJnZis0MEl5ZW96Q2Zw?=
 =?utf-8?B?Tmg1ampabGdydmVURjYxcXdaTzI4VjJBVDlFalpzRitnTlVxanJQV1g0OHlC?=
 =?utf-8?B?Q21UZWJIeVVKcm5GR29tZXFHa2VUN1YwSEh1aDZKcVI0QlBFZDU5d3BGRHJo?=
 =?utf-8?Q?P/4VM7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THQ4UlZvRDl3aUxBWmt3VldhdEtJZ253R0lSRFJNY1d5Ym8zMzF6cG9hUkJl?=
 =?utf-8?B?TzB5KzRTWm1uMml4cjhmcHZIbFdvb0cxVk4wTGx3aklpb3JkTC96Z1h3ajNj?=
 =?utf-8?B?QUdVa0VTSzF0ODdTS3Z0WEdZMHBVRjBCVCsvd1V6bWNMcmNyTXA2T1pyMWkx?=
 =?utf-8?B?TFB1V2xpa2M1b2s0Mjh5Z0VZVmdDclNvaW8rVUwxYWdiL2l3Mmh1bklIUzd4?=
 =?utf-8?B?S3hkekoxdm5SWFI0VEZFYW5nNWdRSUhCZEtsR3B3S0ZjN29RVjVUQWlnSlZx?=
 =?utf-8?B?MDB0REtvQ0pjZnlPbFVVOXYzdEx2M0FVRU5QazR1K2M3MU9GanVMakJwSWFm?=
 =?utf-8?B?NUtFbUN1R3ZpT01INmVxVk04bVlxMFdhMEFXaVUzMFdDWmh4Y1FPS054ZkZX?=
 =?utf-8?B?YmRNdGZKUjFEZVR3eFUySzJrZFVKNk1VZFRhbFVLWWs5dGdNRkNpT1l6S0tz?=
 =?utf-8?B?UzZvNlErTDlGb0JoRnZGOGw2WVlRSHgzYmowVnNzbldaTUtDZVhkNHo3NVlw?=
 =?utf-8?B?WUpJdlVFL2Z3UXV2cjl4WE1LV0ZndjhvZFBhazZiRm9SRWpxc3hVS3FSR2kz?=
 =?utf-8?B?Z1hMNDhSUDRrVmxCdlcyU0hiMUhuZnJQR1doNUVpZEFBYTFES0NOcjE0M3Qy?=
 =?utf-8?B?c0NTdEJ1MC9TWjdhbWtFZWNuNXVJM0hMVC9kZVdpT3lOWHN4ODNBQ2xxN1RW?=
 =?utf-8?B?S2JPL0E5S090TGI5WDB5RzgyeWJ6cWZLUm5JdWFNZ1RuSFhQQ0l4L3Q4UEhN?=
 =?utf-8?B?TnB2OEd0N1BsM1d4K1RuNXNBRHJZUzIwZ1FKcHhJbkpkSTI1RlNnQzAzb0ow?=
 =?utf-8?B?KzlTV0FwVVhWNkVvL01jOUVGMHEwSlNnY0ZZTTJmMSt0aThQTzlsc1Z4LzFl?=
 =?utf-8?B?YzZCaG5ISURVd0psWUR6VE9IeVNOR3Q4ek1iQmFZL0hXbmxSUFV3Y0dxRC9z?=
 =?utf-8?B?ckEzRTFxR3dKMFp1bnpHT040VVhGRDRlaUlzTlB1ZlJjUjhPbnRKSTQyZDBC?=
 =?utf-8?B?VUNHc0JwMW9vc0xiejBYdVk1cU9jT2FOZWJ0ZjgzMERQcXc2cVpscCs4NnVa?=
 =?utf-8?B?bkQrb3Q4ZUtEekZaT0JQTmVJMWtsV1lZN080Zm9tczBnNy80MndBd3NudFVu?=
 =?utf-8?B?TjJxWkRYbFhXYmJ6c1FiSnVDOUhjZUFic1FMM3JyRS95dGxId2VQajN5OC9Z?=
 =?utf-8?B?MHNvUmxWQzEvVlU2TE5yYzZza29yT2JZN3EydmM5ZHFNNmJ0anVrT2NkYmJV?=
 =?utf-8?B?MzZJUjFtSk1zbDNXakpJeFAvdmdNY2RYQkx0QUI2SkpCeWZLbmtwTkZ0THls?=
 =?utf-8?B?dndCSVdrVHQybk11dEZta1U0TTU1MWN6L0JXMGpBVVc4YmgrckFnZjhHSkRD?=
 =?utf-8?B?ZEg4MXB0ckUwdVYyRjZQdnpxbUZCSkZ6cGxFUkZDMlNnNHQxUDVJaUNLdkMy?=
 =?utf-8?B?RWdncStTU2ZYSHlyQWpnTEJXTndnWjA3N2RRS0RsMjZmSS9NRG1HQVRhNk55?=
 =?utf-8?B?YUEzNUZPZHp4RTNUQmFZQmY2ZjAzb2VUUUdRa25BSWRPdkprSGhYMVFNOGVr?=
 =?utf-8?B?MEJ3TVluc3hrdDFsbnRLNlVEWFZCNXVsbWQ5bEwvTGh6WHVmYVQwajhsbks1?=
 =?utf-8?B?OWpxTWV6VmFGckFJdjUxWVpBQktNblN5cFk1bVVhSW9lVnQzdVRnRFg4cDBM?=
 =?utf-8?B?ZlUvcjhzOGgxK0VkTEtPOFJQUDIvV1ZvTlgvbU5zdlB0NlNMcGdUV3hRWUpw?=
 =?utf-8?B?TERseTFzUmtML3Jnb1YwMWx4eFBuTHNrbFZuTkVoYXFPSEVFR3JLR1RiL1Bo?=
 =?utf-8?B?WVVKaGxnRTZLb3JEYWtNZ0JrWUovL0laVUJ6WnRHYUdCb0ZMcE9pQml4cFM4?=
 =?utf-8?B?R3dRNS9aOTZ6eVpZQzVBMTlIL3JLbGRxcVNUSXRJczFUSmg4OEx0dU1nMUlX?=
 =?utf-8?B?UHV1RXBkeGpkRnpIdUgzcGVXazJKZ3JLYWkwQ2toM0l4cEVtUkxnaGNHTUt1?=
 =?utf-8?B?RmRicHZ1Qk0zeXlyaXFUR1dSclBmUnZNMHloZzRXU0Q3N1RSK1hSdTlrdjBj?=
 =?utf-8?B?TVl1Q3h3TSs0U2tXYXZCVUs0NXBjck1kRFlaYUMwV2RvbmFmTnd3dWxOYTAv?=
 =?utf-8?B?U1oycHdaLy9YM3FRbHhPT0FHN0tvaEZqNVRzQ1phOERTOU1Cb1luSFR3aHNz?=
 =?utf-8?B?alBrOElBVkJjNDFLRlVzZnhUdHU2bW11UjkwV3VOSTRISXFLRmJwaVliMGUz?=
 =?utf-8?B?VitGUlhnek01SjUyRjBsRmxVWlFiZkhaUlNha2t1aEREWWMrcm5wc0hiYm9I?=
 =?utf-8?B?R1M3VS9MbTQ3enBXK3Q2ZXFIQURLYTh4Y20yU0hwSmdSb3krM0k2QXFxY1ls?=
 =?utf-8?Q?Dias+fYjRA7Ao6LmI6ONBf3dSiPJr7SFXmpNX?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fddcb2-d6a8-428c-fe40-08de5cee3356
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 15:18:46.7190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRiEvjPdtPaq3DROoTYMAJ9Gwnbu7LjUzJhYujSxogUHH4CW0FmnDReBn+AtARvWhkTTmZ6LJfDwoTjeibcVjFLHWV3amVQvqJaHHnZ/ixg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB11268
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 15:18:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8650

Hi Antonin,

On 1/26/26 3:57 PM, Antonin Godard wrote:
> Hi,
> 
> On Tue Jan 13, 2026 at 2:49 PM CET, Quentin Schulz wrote:
> [...]
>>> +      :term:`BitBake` repositories. For example, if you have checked out the "&DISTRO_NAME_NO_CAP;"
>>
>> Do not use this branch as it will never exist as it points to the name
>> of the not-yet-released version. You want to use
>> DISTRO_NAME_NO_CAP_MINUS_ONE likely (or DISTRO_NAME_NO_CAP_LTS).
> 
> No? This is true for the dev version of the docs, but once the docs are
> released, this equals to the current version of the docs you are reading.
> 
> [...]
>>>    It is important to understand that Git tracks content change and not
>>>    files. Git uses "branches" to organize different development efforts.
>>> -For example, the ``poky`` repository has several branches that include
>>> +For example, the :yocto_git:`yocto-docs </yocto-docs>` repository has several branches that include
>>>    the current "&DISTRO_NAME_NO_CAP;" branch, the "master" branch, and many
>>
>> DISTRO_NAME_NO_CAP is wrong here, it's the not-yet-released version. We
>> shouldn't be using that (or set_versions.py doesn't work right now). Or
>> is it just wrong for the "master" branch of the docs maybe? Still,
>> people will likely reach the official docs through the master branch?
>> Should we show a warning on the docs for the master branch stating this
>> applies only to unreleased software?
> 
> No, docs.yoctoproject.org shows the latest released version of the docs, which
> is the tip of the whinlatter branch right now. The master version of the docs is
> docs.yoctoproject.org/dev, and the master-next version of the docs is
> docs.yoctoproject.org/next.
> 

Ack. FYI, the version is invalid though, c.f. 
https://docs.yoctoproject.org/ref-manual/system-requirements.html#supported-linux-distributions 
search for 5.3.999. So we should be wary of using that.

All good, got confused, sorry for the noise.

Cheers,
Quentin

