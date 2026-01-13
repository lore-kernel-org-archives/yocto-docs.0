Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152FDD0C853
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:10:52 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56685.1768302647049809720
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 03:10:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=MLZcSPoH;
 spf=pass (domain: cherry.de, ip: 52.101.72.36, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRA7o2tTjQSqspP7qIcaYc+N7aROUApy6bKKojOpi4Qfg9m+p98pD7Qs8YW4YPjqR4ImpKZy70rrjL0Esm8ofxUlOvTf5D/oFYgd4xRUgxYoaNRB1dEHO5v9UgWwwgrW3HzlDGhd07RicQ8b3H5TsGHLGCqbkQg1TU2iaJhHAxygeucdAHd4+21Gq9S/w5YVl4ZuMbltx2F/x+GlpbbYVMBLOYwvKqRmGFjAzgEqkaxW1dbE+JxU0lwhtzPYNWMrD5BwJJllX0OwZM1794YyE7UIB7uJw55lAzum6rRO8jbUdY47WtsVOgjanbuKOqw4LDSd2/59d4fQD6FGY3/fRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20IAAEGSINLjK/PKxfB9SeM5LjuucO21EQxUh3hb+c4=;
 b=wG8pIYnMPVvdjTI0baYuyo+yPxP0MBCKJ/cotdaweMMQOsTdNk7lxrJ+Doc8i0/s/Pef46iKnwgEL2tulAGuXwz+ApCyaie7qdRTsbJ0jbc/oAvEvZiHJlKpVsHwzXgJBG6IqerUBByid7UanbNJ4Uo/K5wfNHBhlfia7YXGWAfPaueXpU3iOKFwTcqGZgZunVqeqMS2jhEXhz8WaxNOIKICZ+qUFpI54TsOaESp5IgOe9KeLEpF4l3MNf8MggZKJ0DN8/qRce+HUv2whP4S62wWRNAOdu7a+gV9GYYsUq0ETcQo1mRzIEGQUrgifjtL4WmympxRGw3eUWGNMNmFcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20IAAEGSINLjK/PKxfB9SeM5LjuucO21EQxUh3hb+c4=;
 b=MLZcSPoH9JeSMblxGyqFg23oYRMq974Rb7ZMFr29SOKK+qiggEdW6P87eVA7U2+KPJ9yv4VjU1tmP89v6eClL5h7uLPnJZIblbMNLyt8ltOPSQ6l80HSotAWowWbnZdnoOgO/GJdaJPWy6QiCpo24WBXjQ3FxPWTjYOxEtqvLoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11079.eurprd04.prod.outlook.com (2603:10a6:10:589::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 11:10:42 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:10:42 +0000
Message-ID: <d85a7a5a-d963-4888-a768-dd349f4cef78@cherry.de>
Date: Tue, 13 Jan 2026 12:10:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 04/53] bsp-guide/bsp.rst: remove obsolete poky repo
 references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-4-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-4-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11079:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fe3996-3ac4-4007-5aa5-08de52946459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?KzJkdlF2TjV3SUQ2d3kxMUpnc1NESDFmUDVtV1FQNlZyWE9jUDdzN2VTcGFn?=
 =?utf-8?B?QlE4ditFUWRwRlBUTng4RGNHdmJzQzd6OVkyelIvL2g5Wm82TCtLZ2E1RWhy?=
 =?utf-8?B?TnNUcnNPdzhielRPeThLQllXYU8reXpOZCt0dWVCOUN4RjcxWjhHZVFKYWtP?=
 =?utf-8?B?WWVxRDJIRmlLOGJLYXcvWlJzajJFQ003VHFYbVNKTWpVOWh1U3JPNmo1aHNI?=
 =?utf-8?B?c3Jya1RWWHVDZWZSWlA3RFJsM0g2Y0kvY0xzS2toa1k1YkFBVUlMb1lydTdr?=
 =?utf-8?B?bGx5SXJQeWRkTDMvdXBUcnN5dnErdUJ5QVlXVzhza2FKZVN3emc4WjFVQkQ4?=
 =?utf-8?B?QTJmNklHV1lYR0VmbUhDVG5iNTRZQ3Y0QkFoaG5VSzVnZ3NtaXdIK0hZekhn?=
 =?utf-8?B?SXFNV0sxc0NFeWY1T2ZkaUlRVW5YUlYxOHZ2dlNhaDZGWm5QOFZCZVEyVVFu?=
 =?utf-8?B?N2M5NlhvaEpLMlBSUTNiam1FK0NnbG9hdjJ3bGtLUitKR0FPMy9vQXRZTUU1?=
 =?utf-8?B?MG1CRFFUbCtBWnkvajFJMWZnT1grSG5CODJQTnh2dlRUY2dIM2pHUEU3QWhk?=
 =?utf-8?B?Vkh3NTNRS0xlMDh0K0ZYWWRqL2VwbDhHSlU5cHEwcDRHNjl4MnFBcjRqRXhw?=
 =?utf-8?B?bm9NNTRXQXlCcGdrTUNvQjNDNWVMNmFCeDFTQXE4MTl4YzhFOXlHRnNBSnNt?=
 =?utf-8?B?ZXVYdUl3R3p1SkFzR00waHBuSDJQTmtVQXM4SHRJV3B0K0d0anZZODBja3Zk?=
 =?utf-8?B?NytLb3cwcUxoNUJqdEdXdW1tQVEyY1JRRTNVTFI5cXVLeW95cEZIdWRTc0JH?=
 =?utf-8?B?M3RTYzhhRkM5ME5INFFtNmFua2s1Z2syTUZhTlI4NWo5bHQxbS9TcGU5bDZn?=
 =?utf-8?B?eDlLVHBGMjNvL0Jqc3hqY2F1d2orMGx5QzVDY0tlT3dJcGMyKzY2dENLTEZ3?=
 =?utf-8?B?OTN0TkVZdlBwZ2JSZ1VlZk9FcElmMkJQanVnL1VKek1ocEVqdmFKdkhzL3VL?=
 =?utf-8?B?SzlaQWJzempLTVpXWW02YTZWeWxOa1R6Tk9pK0xydWN0WHlKcFZ4OG9YK3Yv?=
 =?utf-8?B?Sy9FR0tqN0NUbnUzZlZHaHlTZnhGbGRVbzVqdm9Oblh4S3E2K2pDblVCc3dm?=
 =?utf-8?B?VjgySUNBS3BKTkVWdkFVQ01YNEFkN0hkbUFvd0tlV0NYNU5JRlJDWFRxVkZO?=
 =?utf-8?B?OGlYZGFjYllWSUkxdm9mUjZ3Nm5qdXM2eG4rS1ZmdEg5cUY5eGxNNWljU2Ex?=
 =?utf-8?B?Ykl0UlkrbFlVdmdqUGNaTWk0V3U1Slc5MmUvVk9IMVh1emZOOFlMU3greUY3?=
 =?utf-8?B?eG84NktsdWl0WHpEaGlkM2RlM0xQb0dhdUo1MW1PODh4ckhkYVN2cGFSWFJn?=
 =?utf-8?B?R0NhTGRFUjlIZG1nM1FhbHI4cVk0N2s0MVZlUktCZTdGYXZMUWZ4WTR5NHQz?=
 =?utf-8?B?UERqNGMvaWl4aWlZUTljUHBSVm5Ec0UzY1g0Rm5XV0U0T1NNTXdwTytQNVlC?=
 =?utf-8?B?NitYanljUTZ3WTZWNlZtNlBFRWVtdCtQS2FSdWJmalFRN2NPVDBvNEJhMEc2?=
 =?utf-8?B?cnFSNE04UEluVFI4MGkwbmlQQkwzY0gxenBJbmJhalJLYkQrMDVVQ3QrVlVS?=
 =?utf-8?B?SlNHV3dBeUtUSXFjNEFKanVEelo4ZkxDREpJNmxsWmVYT1d2OTAwT01hUlNr?=
 =?utf-8?B?M0J0alNmNmcreG1mYXVxTGxFUzByYVVVRTF2eUZEd1VsOVFiaWkwSitwT2l6?=
 =?utf-8?B?UlE5RkxVZktKSjB6LzR5OGdIcHFZdTNhTkx1UnBKdmFSbVF3SUlBRVFCa1dp?=
 =?utf-8?B?Z3gyRzgwWHJrY2tpdnRpcXhJWWRzYk9NK2tnaDA0ZXdEM3A3ZzZSZmFOTFdn?=
 =?utf-8?B?bHhjS3gxTk9Yd1Zwek9WSjhVWnk3bnhSUnBuMElFU3Z4S3BnTFREZmROWnhR?=
 =?utf-8?Q?e+NeE3TQ18M2XiIZbHzQPPLWTXTGl83W?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TU4vUmE4cURrakRub2xON2hIa0cvQVdZMXNvVEVSalExTDNSMEZINFQ3b1gv?=
 =?utf-8?B?V1B2Rm5FL3dWMkFXQklYek1DSHNFSVFaZUlVZXh2OExhbEJPUGZTd005Qmti?=
 =?utf-8?B?VVh6N2hVS0R5V0JyeUNhYkl4MVYzODRUZmxHSDJvNzRyN0p6UUlTMDIwSmpp?=
 =?utf-8?B?TEVjc2dnMVUyOE5rOTZpRUxKWUxsMEV2VGZuV2xaZWpRSzZEV2JyM3NjV0Vy?=
 =?utf-8?B?SmcvcXdJTFhMcGhza0tKdWluaEQ2THFsZ0dUNnhZTWVDMkR0V1d5MVBIUTNl?=
 =?utf-8?B?Nm5QZ0JweEJ0dUxQV3JsYjFid040T3l2TWtGZktuUUswYWRzU2ZIdHFyMUMy?=
 =?utf-8?B?UGJJVHh0dnlNYVNrSE50WWZ5L0hTM1N2QjBCbktOM2hsdTBzSUJqMHUyTDFq?=
 =?utf-8?B?V0t4TDg2Y2NGYThZRDI4UVBQck5ySkRpTUJYZURPdnNMNXJ3d2R3L25oMFdT?=
 =?utf-8?B?YmpycC82ZkZtNkUvb2xUejBiKzU4Z1YrbTRYM3B5QXpUbU5qMEVCeFV4K3lL?=
 =?utf-8?B?L2wrcmZ5WnBKbG9nczZFZHFHUXFJMEFTNHpzL2N0cEpsS0Izb3ljRVJhaUxP?=
 =?utf-8?B?L2wrOWk2ekF2bkFjVEFhSGU1aFE1KzNvcy84b2pYZzBZTy9PRWdhVy9DQ3dT?=
 =?utf-8?B?SWZyWTBpMXlNc2VES3JnL1Y4czNqR3lNWHBPaVBrcjR4U1Y3czFCdnQ2VXpH?=
 =?utf-8?B?NnNraVhXbkE1dnVmcFZKVW5KSS9GbzJGa1lHQkhady85cTYrdnk0WTZ5cVJM?=
 =?utf-8?B?MkJjZENOVjdLR2MxSjRZTXNQMk1PRE9tNjI5NFBNOWl3MXFGWHFtZHNMZFc2?=
 =?utf-8?B?dlZ3M0xyTC9Ld2M3UzhUNi9RYUE2U0huRVA4L21ZNWpjbFV2M0hnblZod1VZ?=
 =?utf-8?B?cTJVVUlsVURnUlN2enBlVFkrVTBObnhHSUlFVWFnWm5vM3VwamI0OVdVejR0?=
 =?utf-8?B?UkNkb2ZFQ2U5Q0lHVm5sSzk5ckJrRS9rTFVzLzFJUUpoS3RyaWxETlpoUVo3?=
 =?utf-8?B?QU5id3JCTTkzeWNUOG1ySWtpSzQyRTlvdE5lR28rVTRQZEUrT1JvcTJFeXdW?=
 =?utf-8?B?eW5nUjFJaGNEN2xnYnNmR0E4M2QxM0t3Vm01eENwckZsa0M2SVNjYlpVRU14?=
 =?utf-8?B?T08wOC9qelQ1Q1BjTlhTWDVhMG9MRVM0WVdVd0dUNHRoUDdrZWQ2RHdNRUo3?=
 =?utf-8?B?L1NVVXd0N2ZpVWdwYWViTTQ0aHdVTzMrNlhvWXRrVVNjZlljWXBySnVXUVZE?=
 =?utf-8?B?bnpZclA5eDFFWDhGaUREZmNwWXExMjh4WDZpZ3k5RFNHRE1WREZ4RWFlZ3pQ?=
 =?utf-8?B?WnQzeTI3OTdETFVHUFlQOFpxVlIyTG1vczVXZWp0eHhCV2IrVmdGLzF0S0Ju?=
 =?utf-8?B?SEd6SjNUTmxWRDlpS0ZRak5tZWJtMHVrck4yaDl3d3hxSndtb0hTbVZJKzFU?=
 =?utf-8?B?VWVjaUdlNXVKMzNCMEx2MFpKZ3IxMHE2Y1g3UDE3bVFhckM1dkliY3FRM1dD?=
 =?utf-8?B?c2lHdHJzVzNyaHNVWlNMekViM0htMW93amt1UDVCWk5QaUNGRFhPc1Blbzhv?=
 =?utf-8?B?ZTJ3TlVablJyTFRrbGR0NUQ0L0Y0SDBDWXJLQ2NjT29wY0xUM3BlSHVoaHM0?=
 =?utf-8?B?RGRzS1RxZ3ZxM25EMFV1VnpUVlZtR0QzcXIvdGJBL2tmbCtxVEdmejhWRWgv?=
 =?utf-8?B?QWpvcDRwNW9XQXpyRnlGWWFxT0VMTjhiK3dEWGg0dTZHRWhIa21Lb0NyeVdn?=
 =?utf-8?B?Vkd0Tk1FYmloc0cvcnpQdk1BbmZXdkVROUhxVUljWG1LR1BMcVFzckNONXFJ?=
 =?utf-8?B?b2xqdGIxS3FiM09hVmZsRzhrdXJJVjAyQStCUDN2cm5tWlNZTm1QdmRaR3Yw?=
 =?utf-8?B?QU5PbGt6a1VFRk9GTGlLSWJBTERhZ0lRY0NJaWh1UVA5NUNEYndGL2UycWs3?=
 =?utf-8?B?R0NVcUQ0cHdRV21VbCtDU3BVaTcveDh5NUhLbVVjZXdnN0hSeHl0V3A0bWIy?=
 =?utf-8?B?UVVVK2VZRm4zTmlGK0E1M2NlUE9HMURKNGVtRzJlM3liTnB6TGF5TmJhcWpC?=
 =?utf-8?B?QnBTRyt0azV3SU1TaWtDNkRGOHl5UTh6dGZuSys5QkdZUTFieURkVmlTRmNR?=
 =?utf-8?B?T3E2ZUR4dEZ4THBOSFkzL00za05YZmFIRk9KSDc5aFRXODJhOWQ1ZURHVTVm?=
 =?utf-8?B?eUEwemtPeXk5Q3c5TzVJelJTblhtZFo0ZU0yYi9EWXhrU09ZeDhVbjM5L1g0?=
 =?utf-8?B?L3VpbXB4NWcvZlM1T256ek50Y0JCUkZmOERwSGNKK1Z6ZWFiNXduUUh1emN1?=
 =?utf-8?B?TWNMMGJSZzl4eVVpd2VtRjZxVk5DNnhicXZ0TXRoTk94dWVqa0kxdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fe3996-3ac4-4007-5aa5-08de52946459
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:10:42.6122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIQF3uoEXHaMagCEf22EWX/P54ZghyrbIVDchVO+LkbdaJHcGeJKzJkj5CiE9tFkxzbNemCQ2FGjXce6O78nmmD2PoYBHkarKHBcBhHdfQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11079
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:10:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8484

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core
> in most cases, and refer to bitbake-setup or the manual setup in the
> intro.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/bsp-guide/bsp.rst | 151 +++++++++++++---------------------------
>   1 file changed, 48 insertions(+), 103 deletions(-)
> 
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 74912cdd6..2a451b213 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -62,8 +62,8 @@ Here is an example that clones the Raspberry Pi BSP layer::
>   
>      $ git clone git://git.yoctoproject.org/meta-raspberrypi
>   
> -In addition to BSP layers, the ``meta-yocto-bsp`` layer is part of the
> -shipped ``poky`` repository. The ``meta-yocto-bsp`` layer maintains
> +In addition to BSP layers, the ``meta-yocto-bsp`` layer is part of
> +:yocto_git:`meta-yocto </meta-yocto>`. The ``meta-yocto-bsp`` layer maintains
>   several "reference" BSPs including the ARM-based Beaglebone and generic
>   versions of both 32-bit and 64-bit IA machines.
>   
> @@ -72,7 +72,7 @@ For information on typical BSP development workflow, see the
>   section. For more
>   information on how to set up a local copy of source files from a Git
>   repository, see the
> -:ref:`dev-manual/start:locating yocto project source files`
> +:doc:`/dev-manual/poky-manual-setup`

Commits must be bisectable. This should be in the commit removing the 
section.

>   section in the Yocto Project Development Tasks Manual.
>   
>   The BSP layer's base directory (``meta-bsp_root_name``) is the root
> @@ -150,24 +150,23 @@ section.
>      to get a build host ready that is either a native Linux machine or a machine
>      that uses CROPS.
>   
> -#. *Clone the poky Repository:* You need to have a local copy of the
> -   Yocto Project :term:`Source Directory` (i.e. a local
> -   ``poky`` repository). See the
> -   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" and
> -   possibly the
> -   ":ref:`dev-manual/start:checking out by branch in poky`" or
> -   ":ref:`dev-manual/start:checking out by tag in poky`"
> -   sections
> -   all in the Yocto Project Development Tasks Manual for information on
> -   how to clone the ``poky`` repository and check out the appropriate
> -   branch for your work.
> +#. *Prepare the Source Repositories*:
> +
> +   There are two ways of setting up the :term:`Poky` reference distro:
> +
> +   -  Using the ``bitbake-setup`` command-line utility from :term:`BitBake`.
> +      Follow:
> +
> +      :doc:`Setting Up The Environment With bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
> +
> +   -  Manually cloning the required repositories. Follow:
> +
> +      :doc:`/dev-manual/poky-manual-setup`
>   
>   #. *Determine the BSP Layer You Want:* The Yocto Project supports many
>      BSPs, which are maintained in their own layers or in layers designed
> -   to contain several BSPs. To get an idea of machine support through
> -   BSP layers, you can look at the
> -   :yocto_dl:`index of machines </releases/yocto/&DISTRO_REL_LATEST_TAG;/machines>`
> -   for the release.
> +   to contain several BSPs. The :oe_layerindex:`Layer Index <>` can help finding
> +   BSP layers to use.
>   
>   #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
>      based on current Intel CPUs and devices, you can leverage this BSP
> @@ -175,10 +174,7 @@ section.
>      :yocto_git:`README </meta-intel/tree/README.md>` file.
>   
>      #. *Navigate to Your Source Directory:* Typically, you set up the
> -      ``meta-intel`` Git repository inside the :term:`Source Directory` (e.g.
> -      ``poky``). ::
> -
> -         $ cd /home/you/poky
> +      ``meta-intel`` Git repository next to the other layers in your build.
>   
>      #. *Clone the Layer:* ::
>   
> @@ -224,18 +220,21 @@ section.
>         Resolving deltas: 100% (2447/2447), done.
>         Checking connectivity... done.
>   
> -#. *Initialize the Build Environment:* While in the root directory of
> -   the Source Directory (i.e. ``poky``), run the
> -   :ref:`ref-manual/structure:``oe-init-build-env``` environment
> -   setup script to define the OpenEmbedded build environment on your
> -   build host. ::
> +#. *Initialize the Build Environment:* While in the directory where the
> +   different layers are cloned, run the :ref:`ref-manual/structure:``oe-init-build-env```

I don't think you need to be "in the directory where the different 
layers are cloned" to be able to run the script?

This actually gives an advice we usually don't recommend. In order to be 
"in the directory where the different layers are cloned" and be able to 
"source oe-init-build-env" you would need to clone all the layers while 
being within OE-Core git repo.

What are you trying to convey here?

> +   environment setup script located in :term:`OpenEmbedded-Core (OE-Core)` to
> +   define the OpenEmbedded build environment on your build host. ::
>   
>         $ source oe-init-build-env
>   
>      Among other things, the script creates the :term:`Build Directory`, which is
> -   ``build`` in this case and is located in the :term:`Source Directory`.  After
> -   the script runs, your current working directory is set to the ``build``
> -   directory.
> +   ``build``.  After the script runs, your current working directory is set to
> +   the ``build`` directory.
> +

:term:`Build Directory` ?

> +   .. note::
> +
> +      Alternatively, you can source the ``init-build-env`` file provided by
> +      :doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
>   

Can we set up using bitbake-setup and then source oe-init-buildenv from 
oe-core? Or vice-versa. The wording seems to imply that.

Isn't most the above not applicable if we use bitbake-setup anyway?

Also, i've stumbled upon

bitbake-layers layerindex-fetch -b master meta-rockchip

which does a lot of automagic things (fetching dependent layers if they 
are on the layerindex). We should think about documenting this if that's 
not already the case, it's quite helpful.


>   Example Filesystem Layout
>   =========================
> @@ -597,10 +596,10 @@ optimization flags, which are carefully chosen to give best performance
>   on a given processor.
>   
>   Tuning files are found in the ``meta/conf/machine/include`` directory
> -within the :term:`Source Directory`.
> +within :term:`OpenEmbedded-Core (OE-Core)`.
>   For example, many ``tune-*`` files (e.g. ``tune-arm1136jf-s.inc``,
>   ``tune-1586-nlp.inc``, and so forth) reside in the
> -``poky/meta/conf/machine/include`` directory.
> +``meta/conf/machine/include`` directory.
>   
>   To use an include file, you simply include them in the machine
>   configuration file. For example, the Raspberry Pi BSP
> @@ -636,7 +635,7 @@ directory. Here is the ``machconfig`` file for the Raspberry Pi BSP::
>      according to the formfactor configuration file that is installed by
>      the main formfactor recipe
>      ``meta/recipes-bsp/formfactor/formfactor_0.0.bb``, which is found in
> -   the :term:`Source Directory`.
> +   :term:`OpenEmbedded-Core (OE-Core)`.
>   
>   Display Support Files
>   ---------------------
> @@ -664,7 +663,7 @@ types of files although, in practice, it is likely that you would have
>   one or the other.
>   
>   For your BSP, you typically want to use an existing Yocto Project kernel
> -recipe found in the :term:`Source Directory`
> +recipe found in :term:`OpenEmbedded-Core (OE-Core)`
>   at
>   ``meta/recipes-kernel/linux``. You can append machine-specific changes
>   to the kernel recipe by using a similarly named append file, which is
> @@ -767,19 +766,22 @@ workflow.
>      .. note::
>   
>         -  There are three hardware reference BSPs in the Yocto

Not three anymore with the addition below.

> -         Project release, located in the ``poky/meta-yocto-bsp``
> +         Project release, located in the :yocto_git:`meta-yocto-bsp
> +         </meta-yocto/tree/meta-yocto-bsp>`
>            BSP layer:
>   
>            -  Texas Instruments Beaglebone (``beaglebone-yocto``)
>   
>            -  Two generic IA platforms (``genericx86`` and ``genericx86-64``)
>   
> +         -  A generic ARM 64 platforma (``genericarm64``)
> +

s/platforma/platform/

>      When you set up a layer for a new BSP, you should follow a standard
>      layout. This layout is described in the ":ref:`bsp-guide/bsp:example filesystem layout`"
>      section. In the standard layout, notice
>      the suggested structure for recipes and configuration information.
>      You can see the standard layout for a BSP by examining any supported
> -   BSP found in the ``meta-intel`` layer inside the Source Directory.
> +   BSP found in the ``meta-intel`` layer.
>   

Use a yocto_git reference here maybe?

>   #. *Make Configuration Changes to Your New BSP Layer:* The standard BSP
>      layer structure organizes the files you need to edit in ``conf`` and
> @@ -861,9 +863,7 @@ The requirements for a released BSP that conform to the Yocto Project are:
>   
>   -  *File System Layout:* When possible, use the same directory names in
>      your BSP layer as listed in the ``recipes.txt`` file, which is found
> -   in ``poky/meta`` directory of the :term:`Source Directory`
> -   or in the OpenEmbedded-Core Layer (``openembedded-core``) at
> -   :oe_git:`/openembedded-core/tree/meta`.
> +   in ``meta`` directory of :term:`OpenEmbedded-Core (OE-Core)`.
>   

Maybe use

oe_git:`meta</openembedded-core/tree/meta>` directory...

to not lose information we used to have.

Cheers,
Quentin

