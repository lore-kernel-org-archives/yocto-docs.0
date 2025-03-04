Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E23AC021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 13:55:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.35])
 by mx.groups.io with SMTP id smtpd.web11.22241.1741096552942680788
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 05:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jLbbPRLO;
 spf=pass (domain: cherry.de, ip: 40.107.159.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJkweqxCQPxIzP2y+Sd7hdK+mfRLLtb+a23Ekq1jmJyD/OYF9TBc0zuGbS4/h5aInYmuTf1GZQn1eiQp37OtX8VXB2DZOkrP4AK47iw6rA0XMP8spTSCew5YuAv5AcRH9zdBkmb9tZLDuOR8brHLROQwn7YhzChbu4Aeylb/10501o4Uuau2Yzt25ERA3Og/jhOefVSwqmyzOyVacQxSAvwPux77uBEA71TUC/24yPxa45PBynBazjEkBzj7lK3B98dLOnEEmWnpYk4Tdb5zWIQzoXGMZ7umc5H7tlVB89ZX4BLUAhL2v/Bouq35MBmyjVnLuHhhC8ovdqfAKHymqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvCPQjHpGPSZmQ2ODVCZSfidAqsJNFGDwAbn+iC2mIo=;
 b=F/EHbiSdhIqlYGwEqqeeKIt59d928OClYD0Z1JbwUyRa2yFHzCKCkofqg7LyJMEvUhSYUf1u/S+zOBFzSk5vLYq4A/bShEUPTRhNvkw0a47kzoxVjI274z3KVXpuaP3l2xj1ZqYSeN2pHK10ftenXN0X0vpPXY3gr3baXqunJ5RK1mpiK1+mM2USMkFt1ZUN9sAG54SiHL8dH0bjscEANi+eNuWLfWeNL0j8X2YG2kEpSbiyvaKuzuQpqtZGhpIz6JaoWOfdXS53zlWpIsLnTDR/YOq6iMEywmwaunm9O2MPnhmtglQKG34Dsai5cbnE80AlYpf2iW04DC+RGjZZ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvCPQjHpGPSZmQ2ODVCZSfidAqsJNFGDwAbn+iC2mIo=;
 b=jLbbPRLOJ+Xu5XpmniNp2pdCuLdgg02kHaZ+2sIgDbwFIlZ1aWSD2efhzj1d2z3w+wSzr2n6HvCC4zkVjOjqrRKkc4zuJbeWdjpHX5aFxq+TSGHJ1CWnYORT7r3xwNUAr+eZoVNacujIgYxr3xbdUZVlRxxSiSfj3AlVwfR6Avg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 13:55:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:55:47 +0000
Message-ID: <2cf86512-efc1-47f3-96aa-0d1e7892a55a@cherry.de>
Date: Tue, 4 Mar 2025 14:55:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual: uboot-sign: Add how to enable ATF,
 TEE and User defined snippet ITS for U-Boot FIT image
To: jamin_lin@aspeedtech.com, docs@lists.yoctoproject.org
Cc: troy_lee@aspeedtech.com
References: <20250304083842.2828763-1-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250304083842.2828763-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c9e390-bd63-4788-7164-08dd5b244416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dEdNRmVzQlJuRSs2MEpVSkZoRXJPOVVLSndpOEF6N05YVllTaHdhMVFDcm95?=
 =?utf-8?B?bUo0ZVYxWk9PdEt3amg4cDE0c21sQ211bGtPclQvNXFoVUloWWJ6ZjkwUXRz?=
 =?utf-8?B?SElXNjJTdWhyUElRL0JNU1p3T3pZNVQzaTREL0xCd2NieG1ualhUSHRiZFM0?=
 =?utf-8?B?dENtNnJ2TytFWnBWa0hIVGFlNTV2UmlVS2FKSEZVU2xXUzJwUW1iOU5kcUhi?=
 =?utf-8?B?S043NzduYVJIaEY2TmpqK1pPc1BhR1ZlOXRCeEZSV3plTFNUeVFJTTNmV0I1?=
 =?utf-8?B?TWlhdFVEQlZYT1ZhWWpaTGo2WXF1aGFLT01IVnd6bEJsMG5UU3BJRkNoRWhT?=
 =?utf-8?B?SFVFTktLaDVyclY1YkNYdGJFNmZNVjMzb1lWeEtTb1JGbDd0ZTRDSEc4eWdE?=
 =?utf-8?B?U2FzUW9CTFNKZlZYZ1hpV3NqMG5hcE1IUGs3aE04Wm00L1llNW1tRzBwc3li?=
 =?utf-8?B?djlCSlUvYVE5MU82SzJzQ0xuQUdoTTdEeG1QV1d4WUlweDQvdHBob3d5ZG83?=
 =?utf-8?B?Mk5pckpiQTllYzFHTkJINHdpc3U2aFFORUkrRjdGV1NOK2FoWllrRkJuZm5x?=
 =?utf-8?B?L1R4WEltNkg2cWpFMk1TMDg0bnljcXZoSVZHbDlzK211aWgyMmsyYSszd0pL?=
 =?utf-8?B?RkJtcWJNdmlVY0Rsd0xNc0ZkcjV6K0tXd3A0RzdVcDAza1l3eTQyV2VkOXl4?=
 =?utf-8?B?T1NKR0JwM2VTc2tobGFVQ2UrSjExQmNOc2NpZGM3ZjNTdEUzbFNwT2R3cDlL?=
 =?utf-8?B?bDJqVTV3ZnQ5K3JIa2hSNUIwSlQvVVlJdFN5NEgvaG1DWjN2elh6NXFCL3NH?=
 =?utf-8?B?eStPUEFyUnQxRmZtNjRyaDY0RmlmWDhHOVRsRiszUEpYOCtPNkZmSkFNM2tR?=
 =?utf-8?B?T2FLT0w0M1lyU2xFbXFTK3B4em5pMlkyY1NDN0w0R3pKb2cwaFl0Q3FtZEJD?=
 =?utf-8?B?NGxscFNVQTVCSHdFY1ZTcjhCeXBuSnBpT2JHdGZWWTdiMTNqQXhlMVYwdlo1?=
 =?utf-8?B?SEk2ZVkwelc5MTlIRGR5RGlRTnE4VlVJVTBxNmV4N3VPYk9meUVhK3ZQc0hO?=
 =?utf-8?B?TXBrNWJMYW5EQys0ZTltS0hvUnRJbjAvQnFLRSsrSjNDd2VSdm1rc1VwRXZF?=
 =?utf-8?B?ejdpaFhOWGJoQVZiK1lEY1MxbWZUNkg5WGhMaE1meTN6MnZSN1NXWi96MEpU?=
 =?utf-8?B?aVJlM1pjSS9uNmVCQThEUGgyZ3BLSFI2MnVBVGJsdGRDSVJEc0gwVk13UEph?=
 =?utf-8?B?cThOcjliSTRZOWdFYk5OMzdpS0dUKzhQQmVCV2NXNmhhTSt4VFZVQ2tWNGt4?=
 =?utf-8?B?dG13TnJOU0JOMk1uRWxGVjNNTE5IbysvVEhjYUk0aFVVYVkzNEJuRlVDdkJh?=
 =?utf-8?B?b1RZZEh2NlVtNzVEem1Fa1RURUpIcncwTEZudUJFUERaV0d6LzNONlVrKzhp?=
 =?utf-8?B?VFNlQTR0VWRkUHRjQWRhNjlMOFN5QmY1c3g1Q2IwUlM5d1JDeGRxZkhIT1dO?=
 =?utf-8?B?cE0vMjk2cngyN2kvS2xNL1ZJYVFDTElsUnZ4aVhWaUdiZHRoUmlCcW9JOU1x?=
 =?utf-8?B?aEdrdkVyS05obHpCVzNteHAvUDBDNDluaFhMV2JZVGFpclhndVQ4UitiVmNa?=
 =?utf-8?B?QUQ4YjE1T3E3VlBpeXlhcVc1RHVLQmxBSlFzVDJJVy9aalptOVhoT0kyWlcv?=
 =?utf-8?B?cU5uRVRGYnhGQVlmc2RRTXZMd05UYWtjblQzWllDQ21rL2oveGlhMnBISGhQ?=
 =?utf-8?Q?//PTt2PV7BVQdMasThFiyddxZUvLlDrbwztiVj0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVhsMU9iTitiTEI3eENYUlAxY2R1SjhobEVWaTAzb2hpcGh5WU44TkR1V3V2?=
 =?utf-8?B?Z1ZEemRKaUlKWHNvUFNTbWFpVitMeTlCckUzOWZ1bk1nbGt2WkFLTVI3azRH?=
 =?utf-8?B?WmVJajllcHhzTlVkVlhZeTE2Yys0NUFCUmtGYjJMcHhnUlFRSXhJeUV6bXFZ?=
 =?utf-8?B?RGFGRVBrVitPQmRTdjBHNGlkUVFaRnlndkxBUGVjeDFQcFJqQ0ZhNG1LSkhQ?=
 =?utf-8?B?Qi82dWJDS2xKbkl4SFdDeTBPZXBuTGk1QWRNMjNaRmVpYXBaQ2ZuZ3d3eXpr?=
 =?utf-8?B?U1hzRlNuNmZmclR5RGN5UVlRWlhqOTNDV1Brd3Y3Ymx5YXlqamdoVUlmSEc4?=
 =?utf-8?B?bExFV3VGcGd6akFsL3pHb2l5aDRobGgxSS9ydTNwMUhuVmhnUGpzNkg0dHlV?=
 =?utf-8?B?VWxoeGdiV3NmL3dyZ25TVURWaUFhUnduRHNHbEN3cGk1ZjFQZU9PNlJ2SVp6?=
 =?utf-8?B?M09Fbnlmb0JVZzBIaDZJZTlzcng3QlVSajlVRnEyOEFFMDB0dU5jTU9KMWY4?=
 =?utf-8?B?Ymt4UW5BY1ZuaVMzSngwU3B0L0hCd0lYRDY4SXhNQ3ozQUdFZEJTdWFFWTBS?=
 =?utf-8?B?QXN2eHR1aEJBV1RtN2RSelJtaVRRN3orOW5RTU1hWkhJYlhSeUpQYnV1dGp3?=
 =?utf-8?B?b3J6ZjQwdUdZRU85eHgxS1BWM0hNUVIvZENRMEhpOXFRL2VZSHZCdUJVNHVK?=
 =?utf-8?B?alhFQ1JYM3ZxNFd4NElzZWJ4UXdLck1abkRZcXZwNnppbTRVT3JYNkN5MXFS?=
 =?utf-8?B?RlpMa2JZL1MwWmFXS2JISCt1ZFc5c3FWbmJHREN5ZjZBbXAzM1duNVF1ajZF?=
 =?utf-8?B?YzViNmkzaWZsN3dhYVNBOFlaZ1lwOGJpYlJSa0NWRFZYcHhnZlJRNHRLdWdJ?=
 =?utf-8?B?L3hiY2ljeE1SenJnWThvSGwxY1lTY0Q5VkJpdDZtQ1cwam9icDkvY1lldlVm?=
 =?utf-8?B?V1B3UDZrRElOdlYrQ0tpQzJSNm9qNk5jYnBQN0JKRkROUTJLMDRSRFppaUoz?=
 =?utf-8?B?NlFFK3RqeC9EWUJ3a2NzMzBINkhzaUdUbzd2WUhvVFFZSENEenl5bG5BaHpr?=
 =?utf-8?B?K3RwcE9jcFVFVTRJTk42cTVUeGlkWkNVUjF6eXBNZnFpQktHZkMrSGEydDNk?=
 =?utf-8?B?ek9lNGR4bTJhd3dDejNpeUo3bFNHVFkyaXdTb0hJTExVTmZoa3dBMFdUYkd6?=
 =?utf-8?B?WUMzdU9PeXlyL0xNbTN6Q3J6d1Q2c2FYQjJaN2JsMzZRUWNaMUVJeUZHM2ov?=
 =?utf-8?B?ZEI0TU1FRGV1a1V1ZVQzOWhKWi9wMXNGTmxFWGp0SEdQTmw0WDMzMTdDZ1Vp?=
 =?utf-8?B?QVQ0eVJuRzB4elJ4YkVWTkJITTdoVC9TYUl3T05sSElSUjRuZk5jcXZOR01T?=
 =?utf-8?B?V2diYjdraUhYZUExQzh3RlN0ZXRPU0dUamVFMjRRZC93S1MxWFpCYnJXbGVO?=
 =?utf-8?B?Tm1oU1h5VE5LM2U0Mm5HL09VNVlOUFlrbldPYVJPWGpEdFZjeGY3SmlZREZt?=
 =?utf-8?B?RWorM21pM0hrNVR0em5HVXhJRVIycXlMWTBFc2xZV2VWdzBKVmYyUmZwSDla?=
 =?utf-8?B?bTkyRjllUjl5Ris1ZSs5a2JYeHljc1Zkdy9PcGdyNVNLbzRiRDRUaUQyQmw0?=
 =?utf-8?B?UmppYi94cUZ5QWthL1A2TzBhTUd3cm93U1F1SkZPNXZWb3hwK0hueEFQYjAw?=
 =?utf-8?B?VSttNXhWa2thS201Qk9KcEFYUzd5NE9DTUw3dDcydTZLWXF0bDBEN0lTdllX?=
 =?utf-8?B?Y1Z1VnA5TDI4ZlIzRHpmTEQ3NFVCcTA1N1BSQzdZc2pFdEhUK0IwWCt0c0ZI?=
 =?utf-8?B?UW9kaExhWnl2ZUxxU0xaTi9mTEY2SVh3OEVQNnZtMFBSWktoNkxFbkNLUkYv?=
 =?utf-8?B?b2VVV1NwVUsrSlJIWHB0SkJQaXA3SHgxWEJMTzhkd2ZoRlhEQWtacWg2ekk0?=
 =?utf-8?B?S1I5VThaV3d5R0tDTVo1SzMvNTN0dEtEVFB5Y055dU0yNjU5Y0d6TmUvaXVO?=
 =?utf-8?B?ZWREK3Z5cjFDam9nMi9SeXFFakFwd3VyeEt1VVVTYWZjanI0WTNTbG82VW5R?=
 =?utf-8?B?c1d2N2laTXRlbnJkQ3ZISzZEZkNYNlhqb0x2RytLL3JQTnR0Z2VNeEt0aVN6?=
 =?utf-8?B?UmhNRXhrOFZUK1hPclNwZjNsRGZhVHN2R0xnUjZJaGVTa1JyWkNxa1ZCM0pw?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c9e390-bd63-4788-7164-08dd5b244416
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:55:47.7076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I68BTfNnejpizKdapVFSj7FhidFPxOeTKvVC78E8VWt+wqqSdrrrGSCQfxxD8PV3ux78bZyzuAGNBZ/UPx/FFTntC3nHE/SJkimNCEk3Eow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9562
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Mar 2025 13:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6497

Hi Jamin,

On 3/4/25 9:38 AM, Jamin Lin via lists.yoctoproject.org wrote:
> Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image generation.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   documentation/ref-manual/classes.rst   |  8 +++
>   documentation/ref-manual/variables.rst | 72 ++++++++++++++++++++++++++
>   2 files changed, 80 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b93279ff6..d1669ed87 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3401,6 +3401,14 @@ The variables used by this class are:
>   -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT image.
>   -  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
>      rebuilding the FIT image containing the kernel.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`: enable the ARM Trusted Firmware (ATF) image.

I would rather suggest:

include the ARM Trusted Firmware (ATF) image in the U-Boot FIT image.

Funnily enough ATF is the old name, it should now be called Trusted 
Firmware-A, shortened to TF-A. 
https://trustedfirmware-a.readthedocs.io/en/latest/index.html

> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`: specifie the path to the ATF image.

s/specifie/specifies/

Please also reiterate what ATF stands for (ARM Trusted Firmware) and/or 
use the new name as well. I think it's a good idea to try to not use 
only abbreviations.

> +-  :term:`UBOOT_FIT_TEE`: enable the Trusted Execution Environment (TEE) image.

I would rather suggest:

include the Trusted Execution Environment (TEE) image in the U-Boot FIT 
image.

> +-  :term:`UBOOT_FIT_TEE_IMAGE`: specifie the path to the TEE image.

s/specifie/specifies/

Please also reiterate what TEE stands for (Tee Execution Environment). I 
think it's a good idea to try to not use only abbreviations.


> +-  :term:`UBOOT_FIT_USER_SETTINGS`: add a user-specific snippet to the ITS. Users can
> +   include their custom ITS snippet in this variable.

s/add/adds/

If I'm not mistaken, this is to be inserted in the /images node, before 
the /configurations node.

> +-  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds a user-defined image to the loadable

s/a user-defined image/one or more user-defined images/

s/loadable/loadables/

> +   property of the configuration node. It should be a comma-separated list of strings.
>   

I believe the strings should be surrounded each by quotes as well?

>   See U-Boot's documentation for details about `verified boot
>   <https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verified-boot.txt>`__
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 60984cc8f..dbbaac56d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9884,6 +9884,78 @@ system and gives an overview of their function and contents.
>   
>         See the :ref:`ref-classes-uboot-sign` class for details.
>   
> +   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`

Please order this alphabetically, so before UBOOT_FIT_DESC.

> +      ARM Trusted Firmware (ATF) is a reference implementation of secure world

I would recommend also mentioning the new name (Trusted Firmware-A aka 
TF-A).

Additionally, provide a link to the project, e.g. 
https://www.trustedfirmware.org/projects/tf-a

> +      software for Arm A-Profile architectures (Armv8-A and Armv7-A), including
> +      an Exception Level 3 (EL3) Secure Monitor. This variable enables the
> +      generation of a U-Boot FIT image with an ATF image.
> +
> +      Its default value is "0", so set it to "1" to enable this functionality::
> +
> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE = "1"
> +
> +   :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`
> +      Specifies the path to the ATF image. Its default value is "bl31.bin"
> +

Missing the double colon here to make the line below a code-block.

Please also reiterate what ATF stands for and provide the new name (with 
its abbreviation as well).

> +         UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?= "bl31.bin"
> +
> +   :term:`UBOOT_FIT_TEE`

Please order this alphabetically, so before UBOOT_FITIMAGE_ENABLE.

> +      A Trusted Execution Environment (TEE) is a secure environment for executing
> +      code, ensuring high levels of trust in asset management within the
> +      surrounding system. This variable enables the generation of a U-Boot FIT
> +      image with a TEE image.
> +
> +      Its default value is "0", so set it to "1" to enable this functionality::
> +
> +         UBOOT_FIT_TEE = "1"
> +
> +   :term:`UBOOT_FIT_TEE_IMAGE`
> +      Specifies the path to the TEE image. Its default value is "tee-raw.bin"::

Please reiterate what TEE stands for.

> +
> +         UBOOT_FIT_TEE_IMAGE ?= "tee-raw.bin"
> +
> +   :term:`UBOOT_FIT_USER_SETTINGS`
> +      Add a user-specific snippet to the ITS. Users can include their custom ITS

Please mention it's for U-Boot ITS and specifically to add to the 
/images node.

Please specify what ITS stands for.

You could also provide a link to the specs, c.f. 
https://fitspec.osfw.foundation/

> +      snippet in this variable.
> +
> +      Ex::

s/snippet in this variable./snippet in this variable, e.g.::/

> +
> +         UBOOT_FIT_FWA_ITS = '\
> +             fwa {\n\
> +                 description = \"FW A\";\n\
> +                 data = /incbin/(\"fwa.bin\");\n\
> +                 type = \"fwtype\";\n\
> +                 arch = \"fwarch\";\n\
> +                 os = \"fwos\";\n\
> +                 load = <0xb2000000>;\n\
> +                 entry = <0xb2000000>;\n\
> +                 compression = \"none\";\n\
> +             };\n\
> +         '
> +

question: are the \n necessary? If so, we should document it that 
newlines are stripped and if they need to be added, they need to be 
explicitly added, via \n.

> +         UBOOT_FIT_USER_SETTINGS = "${UBOOT_FIT_FWA_ITS}"
> +
> +       The generated Image Tree Source (ITS):

Missing second colon to make the below a code block.

> +
> +         fwa {
> +             description = "FW A";
> +             data = /incbin/("fwa.bin");
> +             type = "fwtype";
> +             arch = "fwarch";
> +             os = "fwos";
> +             load = <0xb2000000>;
> +             entry = <0xb2000000>;
> +             compression = "none";
> +         };
> +

This is not properly aligned. It should be three whitespaces compared to 
the paragraph it's rattached to (i.e. where T character in "The 
generated Image Tree Source" is).

I am not entirely sure what should be understood from this example 
though? Maybe provide a full dummy ITS without this variable set and 
then with the variable set and show the changes?

> +   :term:`UBOOT_FIT_CONF_USER_LOADABLES`

Please order this alphabetically, so before UBOOT_FIT_USER_SETTINGS.

> +      Adds a user-defined image to the loadable property of the configuration node.

s/loadable/``loadables``/

s/of the configuration node/of the configuration node of the U-Boot 
Image Tree Source (ITS)/

> +      It should be a comma-separated list of strings.
> +
> +      Ex::
> +

s/It should be a comma-separated list of strings./It should be a 
comma-separated list of strings, e.g.::/

I believe each string needs to be surrounded by quotes too (like in your 
example)? If that really is the case, then we should mention it as well.

Looking good otherwise!

Cheers,
Quentin

