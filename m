Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6AEC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 09:27:54 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.web10.45604.1748856471910415419
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 02:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UyIzHl92;
 spf=pass (domain: cherry.de, ip: 52.101.84.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmAgiM7bDrICPcxpREOL+7LrXLaG+r6/pNmzh56RtkPqbvR344S2E4n89v3S7Lm0WSDXIybqiS/znNTKz5ce8s18wOW9mwHPSQiT/yPvAhMHC5uECNHOzRzEwupFfxzn7Hen9mlk61JPtiXdwXZdGn6Ldk5tDsjD+jJwQob0sQ8FcKBJKKl6goZSNaNQOBOxNl+CM/ubvwCKHJzaH0hf/Ilc5YHdiwKjQz4HMtNphnakdmezwH2NMDnga9S0iCLHkY01zyHUC6qhUfXKxfdC+Di/WcLFSFIMNwzKyyHulD3Wj2sRf8HBSSe2hOPLwjCnmQ9FNri2R60I3+ZhAA9SOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIK+gPi5mc6ZCz6iFGMsljIBYn6Z/EQvK/uEtNxUzvA=;
 b=BxnOET0siv17YDSEunll2oi5vitmyIqv40L2uZChqjIvp2sNn3vXukAS/8hyajetC+4OT1AFNUr1Z4kfhAWgZJXi7+PzkXoEcUF/tSBTM7bKC9zhC30YA6rEl8AUSeUbWncmX3wthC/QhR5tYVp846GRzAh4+otOnmvrcJzxLcEJu06r6PvYNiQN7Nbq5h2/2WHnbTYBzwFz7DgvbAGOijVjrc8tXhXGS1zpfi1NlHfBbYQkFCWza4F5d1Gf0qmqtizWNkmS5S+13o78gwOP+jtn/9cZ1QXXCpyGtreL3jYOVvnfBpG0RJI0UQ779DEobFomI+FOo34guUJz/YX24w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIK+gPi5mc6ZCz6iFGMsljIBYn6Z/EQvK/uEtNxUzvA=;
 b=UyIzHl92kPVCEanB07Gsyp4Y/58MC6Dnx8NN/cU2cr94doFm0k0tQ380i1s80Znx/Xn9o8hA7AjXKnOcL8+73WQzlXysq8w5d75mMrDjC6z8SEJJ4M+hEWXT0xPa2jr3aeY/NmfJm/Cku8S+J4wSZ7tHQ6bnjj7kPEv+UB0gN5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 09:27:48 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 09:27:48 +0000
Message-ID: <3503ec1a-f1e6-46bf-a135-709d54f5ba64@cherry.de>
Date: Mon, 2 Jun 2025 11:27:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/1] documentation: add doc for
 KERNEL_SPLIT_MODULES
To: dixitparmar19@gmail.com, docs@lists.yoctoproject.org
References: <20250529032252.340015-1-dixitparmar19@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250529032252.340015-1-dixitparmar19@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DBBPR09CA0002.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e62c5c-e4b3-4a65-3079-08dda1b7bd7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmZVMmpicVk3aXhSNEZBQ0p6d2VPQk95K3d0bmFRTUtINmtYbUNIcllYSDRa?=
 =?utf-8?B?SEVrYzNLNmtML3MxZzg5ZUhsVlNReEEwQnBSWWRncEp3aFMwNFlMUUNHdU5I?=
 =?utf-8?B?T2o5WGMzQm10bk1xZVF1QTJSM09uRWIxRlVQT3NRY1RReTUrWEFoOW9ZZTMv?=
 =?utf-8?B?SlN5QVdpaTdQcDhINEFMQXlFR0oxcFVYRHpuQUo0R1U3bm11azlSeHF5WTVN?=
 =?utf-8?B?dXIyNHpPNEh5TEJIWjdLMUlQYVdXcFlpNk9CalNBOWFYNUR2R285cTVBNVpm?=
 =?utf-8?B?VGxKRXFYZDBJbGlXcFcxQTFWZHFob2ZkZjlESjRjR0VDUFNUN1N2TVZQSlNo?=
 =?utf-8?B?YXR0SnBSWHRXbVd0aUJ1d3JWWFhYR0NzQi9VYzZwNHovWGRONXkrQVlua0tl?=
 =?utf-8?B?UG12djFzc25KcEZtVksyclFoQ2tyZmIrNVloME04TnlheUthaStRY3oxMXZK?=
 =?utf-8?B?UlNyaHlMUnptM1NKS1V2M0l0Q1A5RXEyM0dCaUJaRHA0dFd2K29oL2VZV1o1?=
 =?utf-8?B?S1JUYmdHbWQ1bUU3MkxTNE9qR2J1ZExtV3dIcXZNK2lncVA4UGVsR2VEMWRk?=
 =?utf-8?B?TjlTWmZ1dWoxOHpKd2dPSHlCYXBzRUNRWC8xVHExSldJNGZvY0g4QlBRNytS?=
 =?utf-8?B?d201bkpucWJoSFh4ZFZ6ODRsY2t2VkpFcnBUK2pPYUtLMnVIMU9QUmV0alNi?=
 =?utf-8?B?ZjYwc2U4bGhrajVRVUxzSUVlQThyTlRobjNNTkh6SnhPekg5M0c5VzFidjlu?=
 =?utf-8?B?RWthRGg5aC9HdmpNUUNzaGZ0ajBXUzVpdUlEZTlldlZ3Smh6VDhYSVNkdlEx?=
 =?utf-8?B?L3VUdlBCVXpWUlhwMmNaOGdtTmVneHdleGJsL0ErOEtWZXhza25SaXZ5VXVO?=
 =?utf-8?B?K2g4TldtQUpiUFBtajRmVXBvM0VTdzNqSXlwVGlYWE5hK0NUZXdFWDk4U2JC?=
 =?utf-8?B?dUlzOG05L2RSSzFmWXpNVGkza3U5T1dBR3JHZlZzVERrUitjZVFxalFBSUsy?=
 =?utf-8?B?cXhpTXZodXB3cDlzME9BZjc1QkZ6cnRGcE16NUJVb05EUjhZVVk4ZVVYYlo4?=
 =?utf-8?B?RjJzNVZpSWRNTDdUUGdLcTFCb0VIVEJ5Z2hNbTNUeUJTY3R5YTBGNWhydnBk?=
 =?utf-8?B?NGh6VkVab3NGK3ZoZnc2aUhaOVlXeVVpUVFMNDZwSm9zYm5iRHFreXhkRkhC?=
 =?utf-8?B?M0FGWVdFc0VRc3RNd1RabkQvTG5DM1VpS3hpTXplVmRvVnp5bUhGSDl3M1Bu?=
 =?utf-8?B?MU9RdVBFNUxzK1V1bFpxLzJDYWFZSksxR2Q2Y3g2eVhKZjZWdkZEUTBKak5y?=
 =?utf-8?B?ZURZd1ZVTVlhQUQ2cGZaQkhLVFpEeERwbDJJSTRyTWJTNXpyVGZ4UlB4bVdz?=
 =?utf-8?B?cVM5WkFqTitqN1JpczVmTDViTU1vOS85aDFCUjRMWUg5MktGSVFHN1VVVjY1?=
 =?utf-8?B?OGUrNDQwY25LbEJpaTQ2VmVKc255aktoV2psQnZqdlBhcGQ3YW9FNjRuaEZ6?=
 =?utf-8?B?SlBUQmUyZmZwbzhQK3lSWlpJcEJwcDBwK1ZWQW83bURCclpqZGRrZytvQ3U1?=
 =?utf-8?B?eEVyZzg5ditPV0s1bmtTMXdiT3hFYUtZckxmU3pNaHRFZ1o3Y0FTNEhMT2ZS?=
 =?utf-8?B?bGlBSUl2djRWanljNXdqSGFBdXRvN3hmVjBrcDJxT3V5TDQ2LzAyNWFPa1NF?=
 =?utf-8?B?OWlQNkFIV2tRR0d5ZjBSNUxGWU5Lc3Jad1BBSnNVbW1Tc08rWjlhSEppMXB0?=
 =?utf-8?B?ekRtdHlRcEFDZWxodUkrWkpmS2dzM0p2SU1ULzkzT0JKT3pjS1FxK1MwZjBB?=
 =?utf-8?Q?af11WPc0onFqu5PPhhozcv2b0zFMWtn9E0Ysw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?REJIMUw0RURhSFplSDRXS3lZNExWK1NMY0Z5aDVzOWw4MkNvdWhUWHBVK0R4?=
 =?utf-8?B?WEJxQ1A4cEV3SWhHcjAyYlAyM0tuMWZPL1c2VVdMOFlmenRxZ3FBRGRPcVVk?=
 =?utf-8?B?RlA5d0VhN0RhbStrL0FGdTg2QVE1MUpDR3h6TGZzK1ozZXRPb3FxVFBnU21S?=
 =?utf-8?B?TzlHeG0vbXF3a3hTWGZEQ1laOGszU0dWdjI0K2UrNmt6bEptWFB0UTBLbjk3?=
 =?utf-8?B?NG5HeE8xVGdwa1pOWEFNcjhvaHRpVXJQRUdPZ0xiOURtV2Z3Y2NJVEl4clI5?=
 =?utf-8?B?Z0VXYVFXTUFYcWhVeG1xZ21rUXBCYkl5NnZQUS9zdEZXOHpGci9KZ2dTQnhx?=
 =?utf-8?B?WnlCK01lWTB3Z051Z1VpU004cVNTcTRHdW1zbTFYYUIvYmhoSTNITFFhVG1Y?=
 =?utf-8?B?RmsraDRFQzhPZmpnZUFBUTkvN2xucENLbnFRbDBEVUttNU1POVhsQVFGcDB2?=
 =?utf-8?B?NE42Vk04Nnc3UEMyK1J6RzVjdE1jVkJZNGlvMEhrS2ZXMDRoNDF1dS9EZWJw?=
 =?utf-8?B?VDhUOFZielU1TW02b01CdTR0UHBieXMvN0tUcEtkaDFGbXI5ZUhJNUEvYXNn?=
 =?utf-8?B?QVY5T0lycTh0QU5BS1hQOUpUck1vL0RJdVlHOWJ6RTcvOWFMYjNDZEg1TlBV?=
 =?utf-8?B?Q2FoQmMvZFBmc0JlZzIyQ3ZTT2I5UXJDajJ4cng2clBLcWN2bXJ1L3d1aXBy?=
 =?utf-8?B?ZDAySTU4R2E4ZG1xSGF0L2RMWjNiekV5WjBMVkFrOWJPYTlMaUptUy84Vk5N?=
 =?utf-8?B?NGdlVzRHSkl4MisweGJZTlNGbmpwZ3N2ckE3bEk0bllHWUtjdEhzUytpOGFK?=
 =?utf-8?B?NUd6cktrN1dLMjVRZStYQjlyQkpENDFFd2ZBcGU5eFl2cVVYZEtjM2JxR3JT?=
 =?utf-8?B?TkV5dnpBY3gxeWtUSWd3akNNMHd6K28zME5jWHVPb29zby8vU3VoS1h4WjIy?=
 =?utf-8?B?bklVNWJVSG9CL25BajcvcUo4aENZMDVBVUp3NDcxcWExR0JyTGxJMXp5TlVr?=
 =?utf-8?B?YXd6Y1ROMW5uMkNxSUN4a29NWWV5L29WWEpVWXR4VitWdkNBRmpwQVBhbjRX?=
 =?utf-8?B?WC8vNXJWNms5QlBJVXhOMXNQVm1HQ1FLQ01Xb1pQTE5wMmxyUnZvU3hsbFY4?=
 =?utf-8?B?SjhHWFpIS21ObmdpSndTcjBWRG83cnFHTmt5dzY2QXNuMThHWkF3ZklXYkVn?=
 =?utf-8?B?ZFJrZy9UcVZFcU0vVGEzWExRaGg3WEIwQUYzdE5YNzZkWXJzV3hmWVhyTkNm?=
 =?utf-8?B?TWxub1VRZ24rU0FwQUUrNW9HOWFjMXk1bksvTk5jcWUyNTkzZVg2V0ZmeGxh?=
 =?utf-8?B?RW14eS9adHRXTG5YekdaWlRzTzdub2dXRWZkMWN3SkFmTHhjZElWSHRHWC9w?=
 =?utf-8?B?dVlaZkswUzQ1d2pyaTBWUzZ3S0F1SGIwQVhVOEpndHY0SldwSklkRi85ZHp3?=
 =?utf-8?B?QkkzNm9mcEJ1WHo2MTFPc28vdzJLTmg3aDlwQzd2YTBINEMxdDlJUTIxcjZq?=
 =?utf-8?B?NGtmL2VFNWJ2b2ZMNTQ3QlYvckhqNGYvck9IMVI1TWhmSjgvNWRmV1lLVkYy?=
 =?utf-8?B?Y3J6eW0waHZGNU9MVUpGaCsyL2hrSy9nUHdjYkdmMnNlK29DSDUvalM0eXp4?=
 =?utf-8?B?ZGdSbk5NRXYyUXNEVHMzUWNRbHhrc3Fqamp5UFBidFZZSVVmQnAzNFNTOTVa?=
 =?utf-8?B?R2liYTlUNzFBT3VSa3RXMXJkOFRLTXNjNW16dzhzWStDMjF2TlBRQzc0OG8v?=
 =?utf-8?B?ZUpqdlZzTEpTRU1Fd3hTM050OUdybTVzUzdadlJuQlhKVVk4Q1J1NjFSTjZU?=
 =?utf-8?B?VjNnRGxKWEdWL2ZLTTZxQjNzK2NNbjVhaTVNM3lBM2UwZG1FZG1GOTFMaHhX?=
 =?utf-8?B?UGZlcTN3VmtoMHVyWHc2ZzVBejE0YUdvazJuR3BkeWM1ZWRjZW93cG9kQ2No?=
 =?utf-8?B?VjFocDd0MWE1WjcveTRpNW4yUFBpVGl2Z3AzbWVsbHczZksyT2M1c3lheGY5?=
 =?utf-8?B?Wjd3TmtFcDlTbTl0WGpVZTZjdEEwSVVqRkZHVytHTlNVUTM2YVh4c1NuV3JZ?=
 =?utf-8?B?RTA4TW5hUGhxNDRvT05vTGJJeXYzaXJKNG9USlhlckJRSXZqR1F4SEhpOEU5?=
 =?utf-8?B?b2dKOG9XeWlKYkNaRWg5Qi9odUZFakt2MXhuRm1vMEJEeTVmREtaMUF3SXVk?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e62c5c-e4b3-4a65-3079-08dda1b7bd7c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 09:27:48.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOxL5qjF6TiKEUxDB+7g//INwvezI9EEwPrOhNmnbviP/ESIj50t+b8gCwCsm/NdhmsXhs5r2sJplkEbMJqd/5WBfuQ2l8NgowNT4LAcBW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 09:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6960

Hi Dixit,

On 5/29/25 5:22 AM, Dixit Parmar via lists.yoctoproject.org wrote:
> Add the missing documentation for the KERNEL_SPLIT_MODULES variable.
> 
> [ YOCTO #15771 ]
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>   meta/conf/documentation.conf | 1 +

This file is not handled by the yocto-docs community as far as I know, 
so you won't really have review from us.

>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 3dd7bce515..4c8becbdc2 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -252,6 +252,7 @@ KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded
>   KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
>   KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
>   KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
> +KERNEL_SPLIT_MODULES[doc] = "Allow opt-out of split kernel modules. Default set to 1, one subpackage per module. Setting it 0 will generate a monolithic kernel-modules package containing all modules built from the source."

I'm not sure where this [doc] varflag is used actually... I would 
recommend to add an entry in the yocto-docs variable glossary instead, 
so it eventually appears on docs.yoctoproject.org.

https://git.yoctoproject.org/yocto-docs would be the git repo to do your 
modifications on. The variable glossary is stored in 
documentation/ref-manual/variables.rst.

Let us know if you need help with something.

Looking forward to seeing your patch on the ML :)

Cheers,
Quentin

