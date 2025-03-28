Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AF0C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:43:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.web11.11412.1743169414030963141
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TBkZyhQT;
 spf=pass (domain: cherry.de, ip: 52.101.66.21, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO2g8/mB+VG/qKr2puCTZI7ymrw4WqEfvccOCo9QrL8PNoIRYAhJzv5dqjP7XumvMcQAuRiJx2MDTAwlcg3hpsPybcoijLuEBs7+vuW01ovg44b93hZm7G9M2ds172ouZhnA5MSVd5FQ9iULfYGKh3YCSZjHmEVroKCQoFr9I8W9bZwhTBExKiOhujm6bGzDlYASauLlkAPeFWoB8FnNA+F9uMUC8IYA97z1uo8coJx+lHyro2JStJoL3iSxs3ULM+xsMIrCD5FIl4NheQs8otxfCGh+epjnV9vh8kr9JcHLxBA0XrKADiiQi6GPRmCcariJb4tMKog9KY+UVcbyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obkPOJNwfkoZIFnU3XdNdgVUzP4T1iJcMWa8DkP3voA=;
 b=taNELWUtLVC0GjM8sDeARYt1QiEJkz8itP+iu+Bpcr72tFL2y2xGIfqQAbFDGTMJVIycVWoklqXYoRd38QxtsgbQbOBoIlBzKiAFF5wkg7mA07Um45tMKbHqeQINiq44RNPSN4pUx/i9NSVeawEwBWiKRChpJv9U4qc1KSXqNnU0gcBuVxgovw33kr3jy0tTEwXg/wl5tOjn1hqiHI8AuuPPe8gVV+bnjbq6y4wm438KCAJr2tzV2JtibrgUhs/ETbyXpBrfJk08DSvnXgyAVEFLNOaDo3gYcKHB5Wr00tyjBIO/u4TOvgzXXNMKHFNDhFxewn1bJSE3L8aDgCBlFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obkPOJNwfkoZIFnU3XdNdgVUzP4T1iJcMWa8DkP3voA=;
 b=TBkZyhQTWKiwauRkd2qpA6Lyl9PdCjGKZmMLTR5un7L26aFheiuY/JJojoaHKY/WNf58kiDWB/AdsX926OAXSF7THt23XTJO13txCSdQb/4Hq0zGEpjvm9JkaMjk3CK4TknR1axjvT+UQzM/1RMuuOcxOIMVFokI4XZ2eMVQq9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8273.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 13:43:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 13:43:30 +0000
Message-ID: <d7dd4348-8e44-47a7-ae86-d55caab98dc8@cherry.de>
Date: Fri, 28 Mar 2025 14:43:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 3/6] ref-manual/variables.rst: add missing
 documentation for BUILD_* variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
 <20250327-cc-vars-v3-3-742dbddce008@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250327-cc-vars-v3-3-742dbddce008@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cba450-a828-4e0b-0fb1-08dd6dfe86d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L1NkdFZtMW1UL1VxS05QK0ZNcWNMaTdJQkpSUm1acTNieDNVTVFZL2x5bGNF?=
 =?utf-8?B?UWx3eHhyMlVJdjRBS2VoMnVlekhOK1F1T2E4M21NTzhsL0R2Y2ZLSHRZTCs4?=
 =?utf-8?B?QTFoRCtIWEtXeVN5VUNhUUJ4ZS96RElYbEFoTmpNVTNLQWhEZzdGRFg2RjJl?=
 =?utf-8?B?QlJjSzA0RFNwekcwZGNvNllrbWg0VlNyclh1Z2NyZTMyRjhWalF0a3VYZ3dy?=
 =?utf-8?B?TGhOMW1aY3BLRmx3cTJpNFl0QUhNYVp4cHhBaE4wbUtJZkFWby9ZNFp1cVB4?=
 =?utf-8?B?VVU4Wm55RFllVXhKQVNUSUwwVUJuVkJiV2ZCS2Exd1lKQVMwYVY0eHpBL0Rr?=
 =?utf-8?B?NWJmelgxTlczR1p6VkRCRmI0TDkrVk91OForWndCdUxORFhRc29FeDJVZUtO?=
 =?utf-8?B?UGMwZGIrYTlrV2s3MGpqVVdDK2NEbERrS3pTMzB4V2ZEZUo4VWgyRThoS3pu?=
 =?utf-8?B?R0Vad0Q0UnNOVTAxQ2FNYkVrcVJvU0JhVEJKNnNFR3VqSWRFUFhNMm5lWEcz?=
 =?utf-8?B?aUQ2OWRLZXBlUTJ3OVVUL3c4UzBHS09mQ1kyRHlZNTIzUTllSFA3eUxCT01R?=
 =?utf-8?B?ZDBYUFl0WHVYOTJoTklBd3V1Z2taM2w2Rmd1VXZkV2s3cFRrT3daMlJkSm5S?=
 =?utf-8?B?R3NVL0lzZzhlbkcxUFlSWHdBWGNpeXQvc3RGSExWM0RES0FzaHcvSlc0UExo?=
 =?utf-8?B?aWdFOElUQmhnTEV6cnRhYWRQbEtaM21iaExCY2lDakFia2ZVN2hzaVI5UTQ4?=
 =?utf-8?B?dEN1c29sUENEY2xKeUE2ZlA2eEk0TkMwc1NyVC9LbS9SNUpTUEl3MUpPdUpQ?=
 =?utf-8?B?ZDRUV0NXVkt1Q01PZUErODZVa2ZtUXd3NG94Ymg5TUc5dmpaQm1Wd0lleGVm?=
 =?utf-8?B?Nkg0S0ZXUTJsQmtEUi94YkNlYjdLVkNhVTBYQ2VGVjU0SlVzZDFXOHp0NjN0?=
 =?utf-8?B?WTlRekorOUVoME1WSHhKZGJKVEhnWHNrampFUVRTOVcweTM0ZE16QmpkNld3?=
 =?utf-8?B?bXFSalJtbnJmQm53UlFEQjBjbTRHeml0aVNsN3JNTUNyRUlTS2QwTzh3MTRu?=
 =?utf-8?B?RlpicTdRaS9rQ0NsNXYvTUdrMjNuaEp0cTNyM2FUYzlWT0taYThtRDlzOFpu?=
 =?utf-8?B?NnlyaW1RRi9GbUdVUnJoM1JNWitJNkY1b0MzZ0VMazRVS2xsb1N0TURmWVkr?=
 =?utf-8?B?V09uUmJ5ZTFlN1FNazZYUnJiV3JvNTFaZGxYcGplcVpSK0FrbzRodWlMMlFE?=
 =?utf-8?B?dy9KMm5JSzJEZ0N6MTRmTC91SVp4NWJ4amFiTG5tMCtXUVEwNjl6d0VGczdh?=
 =?utf-8?B?bUtmblJXcWVxM3dtZ2NuWHB4bHBWUUJFS1M3bnQ0Qm5pNW82OXZEUGJxQkJS?=
 =?utf-8?B?NDlMcGczeWJhUEFFNnpIaTcrekM4R0duaTJiM1M1LzZwbWQ0bzgrem5wYXRU?=
 =?utf-8?B?dVdVY1R6WUgzVm1DcEJJWW5WK1FtOEJ1MmtLVDBvR2ZTRmc5aDl4U2lRcjEv?=
 =?utf-8?B?T25YeTc0amUwbmxZazZnTGpNNzAzNHpLZGtlbzE3b3Jlc2hSTDRCUmR0RmRz?=
 =?utf-8?B?V3NMdFNHMWRSR2VKZnVRT0JXenVtZ3dkckcrRitmL0doSjhJcTFrdXVVTlE2?=
 =?utf-8?B?RWFUMFFEQkZaOVVNdGxaQUc4Wm9IRkZUdElMK05xeVFxZWFrbDBuODF0SlQ2?=
 =?utf-8?B?bVBCdE55QkFvU0NZdmQ5ZXV3cFRMQm02V1E4Rk1VNjZOb2h3NEE3Z3BDNkFr?=
 =?utf-8?B?KzZGTnlBeThKdVFqeGVuVTliQklsRUYzbDRNb3hZa0w5ZERSSFZFSVZBLzky?=
 =?utf-8?B?ejNFTmRqaU44N0kyZDBWa3lEaTJkVnlHcXo5RHcwQnZpQy8vM3BJZ05PVldW?=
 =?utf-8?Q?9Rjcx5xDOkbd8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UDdlTkwwMFhoYzlRWWk1NXhobkt5OWNuVnFHaTYxYmljdW1FVVRVZzhudmo0?=
 =?utf-8?B?RG5SK0FMdC80cE9CSHBQeXZJWVN3YlVSWGpYVmNuaGxTUTB0QXpiTjdCTkQz?=
 =?utf-8?B?bXAwU1ZsQlh2bkdoR2c5dWFBNlRVcFhSY0dzTGVGanVhSUsrOEI3eFhBeEV3?=
 =?utf-8?B?YkNORDdsRGhvUlVMYndiYWNMVTR2aTg2VzZhR1ZYeUliUlZYMERDYmQwdUY2?=
 =?utf-8?B?Z1doeTVVSERvSk4waExNdWlSQVAzMVZKWFQ2bkNzckFRSmQyMSs0a2VIeWVj?=
 =?utf-8?B?b1NlVXEvN3VDc0tnWWtXbmFjV04xWWhrSHI4MUlEZjliME9uaEpuZk52UkdU?=
 =?utf-8?B?LzhnMTFBTFRCcG15N24zYkRrRFlZVldEa2lUbmdGWTNwSEg0YWcwN0F4RHg3?=
 =?utf-8?B?K0JuT0I4eS9lUnIrVmpidEdZc2RxdTVpSGVFWkJyQ3p4Qktkbm5oeFB2cXBv?=
 =?utf-8?B?Y3ZWVDMvaFczaStSUjhkWlYxeHFkWDlTT084KzJTUmtNRzFpaitIbUZyclhx?=
 =?utf-8?B?d3U0cUplUkRTUWx2c0ZPRnhjUDZSaEpOOExtR1NRZzRMVlpxY2F3T0l4c3Zk?=
 =?utf-8?B?R1ozNTBuaHNFaHc4VnE1eC9mYUlOZUxyUFdvRWlPUllneDNCTTlsR3FvMUxH?=
 =?utf-8?B?cUg2SXZZZU9iL2h5bXNCNTNaUERrY1VGUlRWeFJ3cGlnRzZIQ3NKcnhIQlFJ?=
 =?utf-8?B?elplVFhiaXRHMEhGc0dtUzhBV0ZESWUyTE1zdWFTQm15QkZTQmhROUtYMy9U?=
 =?utf-8?B?VlZsekdVMmtxSVNxRkxCYzJqNEJNQUtUS2I3ZjNxRmxlL1hIRFRxR0Y0b0ph?=
 =?utf-8?B?QTlIZDhpWTliZzBzbVlJdXJ1OTVWeFVhMjR2aDVNaHBjK0RRdDM2ZW0vUFNJ?=
 =?utf-8?B?YnVJcmhUbTJWUzY3L2tKUk5XY3BqYkJNN0NPZEN3a0JPZWVqM3pqT0pJaVBa?=
 =?utf-8?B?cnM3SFEwdVAxSlBTK0NxZDlqSVJ4NS9OR1lyakdVTFgrY2NVeEp2MzNaU2d1?=
 =?utf-8?B?bUZ1MGlsaWpBRnpZWHlTeHN3Q3FxN0d1UVZNSVd2R0pkVmQrN1lLencyWkx4?=
 =?utf-8?B?TXg3ekJ1NC8xbXVqTjIxZVVzNXJpQ2E1NWR6dVhaOVhGdUZsc2J0Z0dpREU4?=
 =?utf-8?B?MHg0azJzSjYzZlJrc0c2ZnMvRmY1amUzV3ppZ01BRGNIUFJ1ci9SaTNHN0NB?=
 =?utf-8?B?UlhTUjBBYmdORmV0N2hBSnFSTjlZK1czWmRITFdkcEs1bVJ6dDFJZWFkYWdM?=
 =?utf-8?B?RnRHMGRuRmFpbWU2YU9NYnpHeVNnT0JnS1NpZEU1b1BkV3FFcm1nanlLUXRG?=
 =?utf-8?B?WWwxTUN3TytUM1pld1RnSXEySVRvdVBSNjdJZzhGTk8rd3gvRk1zNitPVjFm?=
 =?utf-8?B?WHRsNG5iZ0tJQ09GVm1ZUXBkRmVFQ3BUQ3lQN1lMdUFwRWVlVXdKbFF5SGV1?=
 =?utf-8?B?cXdyVXFpelkvamlMQlR2b2Z2L1ZjWkJZRWhlQXBVV3BXNzk1UkxFVXZJSHJn?=
 =?utf-8?B?MnBndWhjQk5uNkFkblFaWkJkRnd4VnErd3UzblhLeU1YSjJiQ0JYV1BYOUEr?=
 =?utf-8?B?V3IrT2pHRnMvSDBaenJKYVJXaStwcDZGZ0ZEaVFGdEhrZDBacmpVenU1YUFY?=
 =?utf-8?B?N2lJbHRPT0xxd0IwM2k0R1pHSVlYNDFtUCtDUHp0a2o1MUdOQW1XVllUWExa?=
 =?utf-8?B?a1pFc3NyWG5NSVBsRkxMZlBCM3pOZ1FHeDk1VlJkMzBNUlIvMlZYNFByS1BI?=
 =?utf-8?B?U3ZianBOa0YxeS9uVzJ6cmVrbVdSTmtDa0d1YlJvMG5xMmxDUW1WM3hzU2t2?=
 =?utf-8?B?aWhib0Z0VXRWZGJYL0Vuemx2S2ZkV01hdG8vSWNOdXBQNnlZZHBva1prdzcv?=
 =?utf-8?B?VTI4dkExOGVURTFWNkMyMkFyWTNXOGxhcHhOdUZHT01obVNjZGVPNDdtNEhq?=
 =?utf-8?B?c2xCNkVyQitPeVVtdHlXeFFlTHNtS3pSMTQwN25EZFhpVFpQV1pzb1VaV2ds?=
 =?utf-8?B?WlNOeEdqNEJLMTlJWDBJbEhQQmZUMExCTEMzeUtwQXpEUlNiV3M1ZFkwWlc2?=
 =?utf-8?B?OG1mNjlLVmpIQW1LQ2lxaXhMSUoxdTkvK0g1Nm5DOGhSV1Y1cU1WWHhPRFVR?=
 =?utf-8?B?aEU0MGFRSUUvdlkxNDkxYURJTVUrRHhYWlIxQ2EzVEtlL0RJVFBtamdsMG1N?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cba450-a828-4e0b-0fb1-08dd6dfe86d1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:43:30.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOVS53py3hq/4wLfmhKA2wNeylycCEIi6Bnu7qcQh9nDNPHvcuOrD4IUYhBZ7sP+n7hrWylLGITkPmwVETPCV3Yg6yKAWkRzCteeITGUuKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8273
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:43:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6669

Hi Antonin,

On 3/27/25 10:07 AM, Antonin Godard via lists.yoctoproject.org wrote:
> These toolchain variables are used in a native context. Some of the
> BUILD_* variables missed documentation. Also, some of the base commands
> were also not there so document them.
> 
> Some of existing BUILD_* variable documentation were missing the note
> about their usage in a native context, so add it too so that all BUILD_*
> variables are documented the same way.
> 
> [YOCTO #15719]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 250 ++++++++++++++++++++++++++++++---
>   1 file changed, 230 insertions(+), 20 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d98721818..0516c1816 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -986,55 +986,165 @@ system and gives an overview of their function and contents.
>         variable is a useful pointer in case a bug in the software being
>         built needs to be manually reported.
>   
> +   :term:`BUILD_AR`
> +      Specifies the architecture-specific :manpage:`archiver <ar(1)>` for the
> +      build host, and its default definition is derived in part from
> +      :term:`BUILD_PREFIX`::
> +
> +         BUILD_AR = "${BUILD_PREFIX}ar"
> +
> +      When building a :ref:`ref-classes-native` recipe, :term:`AR` is set to the
> +      value of this variable by default.
> +
> +      The :term:`BUILD_AR` variable should not be set manually, and is rarely
> +      used in recipes as :term:`AR` contains the appropriate value depending on
> +      the context (native or target recipes). Exception be made for target
> +      recipes that need to use the :manpage:`archiver <ar(1)>` from the build
> +      host at some point during the build.
> +
>      :term:`BUILD_ARCH`
>         Specifies the architecture of the build host (e.g. ``i686``). The
>         OpenEmbedded build system sets the value of :term:`BUILD_ARCH` from the
>         machine name reported by the ``uname`` command.
>   
> +   :term:`BUILD_AS`
> +      Specifies the architecture-specific :manpage:`assembler <as(1)>` for the
> +      build host, and its default definition is derived in part from
> +      :term:`BUILD_PREFIX`::
> +
> +         BUILD_AS = "${BUILD_PREFIX}as"
> +

It actually is

${BUILD_PREFIX}as ${BUILD_AS_ARCH}

With that change:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

