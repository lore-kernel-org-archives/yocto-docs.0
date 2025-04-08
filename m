Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD86C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 13:11:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.2])
 by mx.groups.io with SMTP id smtpd.web10.74746.1744117907252863808
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 06:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KY9JQzSX;
 spf=pass (domain: cherry.de, ip: 40.107.130.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCUoe2Z4qzUJQ+QhmPGZbc4EgPCajI9M/9mAK3bYoTD3af5Cks+sGfDT2GIM5MejhYqcMTrwMZFTaKj8N4cegVot0nrCuNqAiuw6CZPb/cySqc1k6wxc+btK64+qcm/qc1uN64SBlYftRDv6Bkrl0dmKmt8MnT/5Q9AYiIf5BydHZiRgtLbOQuvVPEQ5X43QG//c/5qxdWyuIUBY4blGaZNvxk6nmjbvpcBJHmXG8xP2PGirS5jJGYYEHybOdAKjCD1A6Hdvn2rPETzF6U/+7OIkEJroOi8V5bNz0L0me/Dah5vbGRnIub28ZWhqsbWJF5s5t98ws9cZ3DFdr2PscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7Jmm3zK0VFhmaLmqUe7BsJNtxzqzMelcQUvbAvbdbY=;
 b=IIGJvQOZ39La2+kLOTzo26jn/iM+AMCpJFWxE10/sUrgd0WXiU0/a88Yz+kAUQWiBI0RG0e+xYIEPoRuAiyEn1PZFF+bcP+QChrXLlZ0JQPvCieZgAI9Jy7RIHT4ZitC87HQVzaWagOJGoAxzw13dULjOPgmkysU0Jt4hPV5+uWQ+Djl3N/rBFoeSddEk+oTtB8N3cn4qjm2Ud1gx/1IIMm4rVVy7M97hcngegSVmG2gjwsMgSqOow9jhvDX4wOe56PAsxPaHFZEa0QCQx9Ut+0kBopWjsHPgGReLLrRxEGvYCuxu17Hz5TWa+tb62t1de5LAqVsdPpvNxUbSeMqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7Jmm3zK0VFhmaLmqUe7BsJNtxzqzMelcQUvbAvbdbY=;
 b=KY9JQzSXC70mfA9d68zpZcgaMOaXg6IeJ7NbGs89MODSmNH3/rdjKx2U8EhsCrz3FBlFk5prgv0Y2lBZdWvI3JwWBqG/QMaLcTdEiPTgce/9AQ7aRyJNE2LuVyL+YF/r042EM20t9UcWMRxgH1c1Dt8olo4WFXyNJaSGK7ZCc70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBAPR04MB7207.eurprd04.prod.outlook.com (2603:10a6:10:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 13:11:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 13:11:43 +0000
Message-ID: <88758ca0-fdfe-4c0f-9b96-88a2678b28ed@cherry.de>
Date: Tue, 8 Apr 2025 15:11:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] manuals: remove repeated word
To: Andrew Kreimer <algonell@gmail.com>
Cc: docs@lists.yoctoproject.org
References: <20250408113128.12973-1-algonell@gmail.com>
 <ccd6c80e-e3e9-45b0-a842-4ce7a35d2f28@cherry.de> <Z_UfqRL_P-3UhQxI@void>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <Z_UfqRL_P-3UhQxI@void>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBAPR04MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 30da96b4-a3d7-4ec1-94b4-08dd769ee83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0ZBUEVwb3lCYlZ3RTBHZ3pvN2p3T1pQUVRGT0dLdytPNk9nSnRwZ2JSYXVV?=
 =?utf-8?B?WjNLbkJWV1lvcFcyWWMyYUZ5OEoreHplQkNIdzdwd3crQnBsek5RZ3lyL2t3?=
 =?utf-8?B?d3lhTzFVaEtZNi83YTJmQjNmLzFBSjlPRDgwTGhmUGp5QTdlMzV4cGg3TVBi?=
 =?utf-8?B?cS9Na3BOeStFODd0RGxlYURndDFRd0xBWDZWaUhyZVlJYi8xWFlSdXRVbHFT?=
 =?utf-8?B?SWlVTkNuSW1RaDZKOG1hVkxsY3RyazJNeE5VUWs4MS9mRDd6WUhmc05lK2dp?=
 =?utf-8?B?V21GNlZqa1FZQUl4bEJFWmlTK0lLZnBITVNkYUhrSGpzUUY3WEZHQ0RGWVRH?=
 =?utf-8?B?V1JuMC9lamZIeUFPbkEyTEE4MkJYNUFIenNNRmJHOHI2OVpmTVkxM2VkUHI4?=
 =?utf-8?B?U3NJcVFsalI5M2V5MWk5YUNTSWc3MEVhZ1M4Zys5UnIzckRSdFJkZmNLTzAy?=
 =?utf-8?B?VktwWm1GTTdRNkNxVHRMUDl5cHdDSjhoWTVKdDVud0JuSjhnNDdleW9NbFlU?=
 =?utf-8?B?aG1WR0l1cjJRaE5PNzZzQzNqcFNOczBUVEVOdlljdzBFUFB6a3NiTHJvcFJR?=
 =?utf-8?B?UEZJQmx3LzVZVDM0Q1dWbGt5ZUY0MHJVR3Vod3E1STQ2SjhML3pVbDhvMGp1?=
 =?utf-8?B?Sjd6a0trOXBKYmVCUkh1WlQwRVg1YU9yZmFiczN6RUxkVko2ZGlkMytkUGpu?=
 =?utf-8?B?WjVhTUZzVmdiYnpPVC9XWHQvdnpuUUNvNDlMc1FraUdoZ0xHRVZxNUxaK2NV?=
 =?utf-8?B?ckxWVTBpMmp1dUlyRGZrcWFkc00wbE40NThYc2xXSTZtdmFOU2FvTG5UUDJY?=
 =?utf-8?B?S1dXNVB4T1RhMWFpYkxIS0JSakUwVWp5Um5jR0dtWUlBK2VueEpTUzllR2dR?=
 =?utf-8?B?Z1Q0M2NuN0hzV1NqY1loc3dJeklyUEdVQkowL1lMZFBXRHdxMEljd0RkYXdl?=
 =?utf-8?B?bWVBWkJUTmYwblZFeHM5MTVDNlMydDUzRHg3WTJpODZIZG9yR1RxcHc2SGh5?=
 =?utf-8?B?Sk9IRlpnWCtNczhlUG8rS21FcWJnTXhXUm5CdmRNVXpROFc1YmI1YlBZNWpm?=
 =?utf-8?B?VVM4TUJ2L09CdENUL3hPZ1EwOEFnVVlmbURxS1dSS09xTC8rMVJ6S0dVdHFo?=
 =?utf-8?B?SEN4TThqUnBhMjJHV0FhcDhsWGIrSjM4NFpTajdBUHZNQU5DVzhNbTZQVjBR?=
 =?utf-8?B?OHBhM3prem9ZVjhoOXhDSldicHRNYlFCQW9qQlR2RnkyYWlEM0pXcUJRNkIv?=
 =?utf-8?B?MlZNaXNxOERMZUU1VGZMbmxMazBkVHVXaDFLZkRiNXQyWDRSYjlORHVDRURy?=
 =?utf-8?B?MjZnUHpvaWFOSVEzRE1FNW9BTXY0cG5sSHI3TVMvek1UZTkzUmd2UnBQcytF?=
 =?utf-8?B?MFBjVlE4UlhsZFY3dld6ZWxqbkwzTGZaeXRkTUNxVURMRndHdG4vSnR0eVZw?=
 =?utf-8?B?bDFqZ3hWRUNYNUNCa1VJYjZ3VVFKcFYzR3BjR3JnTGUxcS93R1BPQVJNRXJy?=
 =?utf-8?B?UTU4U3dXNUl3NUdnMlR2NlMwNzJ3SmtHRFRIZFh1RUlOMEhhaldDSDNLQTFY?=
 =?utf-8?B?b0VGb1BHRFBld0N2UkU4bnc3ZHI5ODZ4M1Y3ODhoMXZUa0x0MGhGSXh5ZlNU?=
 =?utf-8?B?d3dBQ3VCZFowaFZOa0pNZlhMdFJjV3d4aUpzeGVLVkdEcUxIVGFsRUplMnBK?=
 =?utf-8?B?YzFlODVJRUowb3NrUXRadjlqZUtld09mWTdMeUtLaG1aenN4VjQvT0ZjUXQ2?=
 =?utf-8?B?SWFLVmNEM2tGRWp2QnVVeGRUdE42UW45Nk5uWklwK1RHb2c5d3dpRlhwM1Y4?=
 =?utf-8?B?NW55bnpzQW5MK2hEbjlWTmlyWkRRTnR4WjI4LzRKbDErVURpQmhNVmpqakdv?=
 =?utf-8?Q?t03yHKFzQone8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sm43b3JTaTlzYnI1WFlxWGVnSy84RElRZ1ovVzRnNVh4dW9nTUNzaHRpRjcz?=
 =?utf-8?B?ZEp6ZjhBY3Y1UkNSSDB4RU1PY0NnUmQ1eUwzd0FuRE5GeXZBOVpRL2tkL3pr?=
 =?utf-8?B?dkJmMTdHR3JoSnl0dytUQXpBVHg0L05qSnlvVThrai9xQXZTYlJqVk1zdWJD?=
 =?utf-8?B?dXBtd3Jia1E5VVFqYlpMb1FVRFRlNUVLVmhHS2ZDTzlrTFkzNEc3aGlWVXFO?=
 =?utf-8?B?eXFTeDZQNmRqVEozamFEanBocTZrWWZTLzEyRHhHTDhEbUNBVktaank4NXlZ?=
 =?utf-8?B?c1U1MWZjcHh1U3R6Y0NtWnhkL2toMmpYNDBRNno2aTBRWTdta1piYWlpNHoy?=
 =?utf-8?B?bys0OTVaeEhVYXVGVDMvQ0NtbkEyK1hnOFExamVsYjlpNVJUVnJ5dU4wRjEz?=
 =?utf-8?B?ZWx5akx3N1FacUdiWk95QlhlMUZKNHF0YXVRV0tYWmVrQXpkNm9WcllkT29K?=
 =?utf-8?B?TEpadFd2bU5RODU4QUx6aVZjclRwRkZzM2kvWm42V3NPWjNiOS9xeG9pMXNO?=
 =?utf-8?B?dzVyWWZJV2UzL1QyY1FUQnZ3MzhuV3NwZm40WTRvVlVOR3Ztd2tnc21jcWdZ?=
 =?utf-8?B?elRFNEp1YzluZm9hUytJcmt3WEhmeG41Mm9Ec3VhdnNxb2d1aytETzFJY1cx?=
 =?utf-8?B?MDZuMXRwc244U1dWaHJlZ3dUd09jaVQ5d0pRVXRiK0lvTUZoWnJPbU1CK0RR?=
 =?utf-8?B?TU5ScVBsUWZKTWdHVDNUcHRwbDNkcWhsL3pNMUVkNzhVOEk5eVFtN1VxRjRn?=
 =?utf-8?B?SDNRM0FKL0M2cEtaN2xmMUtuMFpNR2JRMVgwYzVxYUdvQXhtQXNvTlpaQ0FQ?=
 =?utf-8?B?S0xneE03WVpGcnNEakdNN2tGbEF2MGl2a05SU2prMi8xdVRCeFJlS0prY0Z4?=
 =?utf-8?B?cTRHM2dNTlAzcHJ5ak1YQlNjSnN2eWMwRWlJSi92MklGVWRZRml3TkF2MkNK?=
 =?utf-8?B?TDZXMk41L1I5aXU4WFVONEZYcTMyYm1UK01nTmNKNWdLNklFcVVrQWp1ZWhP?=
 =?utf-8?B?M0dlYTJrMFJ4U1dDRjlsRDFXYXRveXp1L2NLYURvbGRsNXA0eXlMdko0RXNF?=
 =?utf-8?B?VEQ5TXJxQ0U2cXZRMzIrUzZVc3pQZ0pGd0V2QjlMbzROTWZzMmhaRDF6aFQz?=
 =?utf-8?B?NjVwTGErZWlmZ05yV2FrSFdqdHRGdkhyOFNUUUo1eEZvN1VMM09JeklENG9Y?=
 =?utf-8?B?MFZOZklmUExyd25jRHBVMnZkK0lDVTE2WXhqclpKM0lLZzN1UmtvSGVaZnhI?=
 =?utf-8?B?bTE5ekpVa1hLY09uOThkNTI3d240em9iT2JTc1B2bDUySXVqKy84NHVSbHFG?=
 =?utf-8?B?VmlUNWlVQ0l1Q2J0dWh4UzRPQ2R4dzd5c2Vxd1VCa3BuKzdLWk0veFJtalNR?=
 =?utf-8?B?V2lTQ1ROVFI4aktDaFlvMUp3MXMzYktEU0cwWTFFWnJUdjFiQUlReCswVytx?=
 =?utf-8?B?M1gyTjBvVWh0clRBSG5LV25rKzIrV2g5SlIvMGNWSDU0Q0I0ZUQ0SFFyTWdS?=
 =?utf-8?B?Tis1Ty9DNlRSYXBpeGZyMVZWZno4ZTdEenBIQlhVUnNrNmxZSDBQVmxVTmsv?=
 =?utf-8?B?Wi9uVDNoSSsyMWlZRzVtWmUySkN3ZThhNnRrYzc5bWI4bUlCMkFaQXF1MjNO?=
 =?utf-8?B?WGtoV21SR1N3Z25Uc3dvZ3VMd1o2R2lhdXUwdFNZWGN5UDJNYlAzdHZRVUtP?=
 =?utf-8?B?Mkwva2lQVDFucTBTOWo5dGtDY2YwdDByc1pVOEcrNWJocjMwQ2puVlZCN1hQ?=
 =?utf-8?B?NElxbzV1U1lxNEtRU2hPMmdmd1dkK3M1N0taYWx5YmFNRlR0R3ppT0pXN2dM?=
 =?utf-8?B?dHdFZUMxZWg1SW9XbFZvdnNYeFlXaUlsNGpueXdHMXBIVitXOHMvdExCaldi?=
 =?utf-8?B?ZGhuUTVMUkhNbytNRGh1Mm1aZ3Mxcys0MldHVVc0V29OY2ZpdzI1STZWSkN5?=
 =?utf-8?B?Ym44ZmF5bm1pdWFpdFV5L2tPa0Vlb1Y2L2lpc0UrRnVCZEhER2pwWXRZNHps?=
 =?utf-8?B?cUp4andHYVY3QUVsRU50YW5Hd2dHa2lsVTRsOTVNK1ZBT2JTRS9EWll5NTZ0?=
 =?utf-8?B?R1BFTWI1SWl4VWpZUllIMkZMVUtMVG1qRjVIZGY4U2E5OFE2RVBRRnNnUjNO?=
 =?utf-8?B?SnBpQkVCblVXUWhwR2cxeFdaOXhyVzBSRkozZGk5cytCbEhOK0t5UFphNjRV?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 30da96b4-a3d7-4ec1-94b4-08dd769ee83e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:11:43.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D36z7R40OFC8LQCom/qzcb4mc7WjJOIDKPttWGoHfhLVmcZlJ0ppnxjnH7v87v58Vr+n99YchJ4E/m9GgJEuoWmbUUz+Q/oYakMnRX9b2L8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7207
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Apr 2025 13:11:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6719

Hi Andrew,

On 4/8/25 3:07 PM, Andrew Kreimer wrote:
> On Tue, Apr 08, 2025 at 02:42:04PM +0200, Quentin Schulz wrote:
>> It's because it's VERY modern, like modern among the modern ones.
> 
> Noted, thank you.

That was sarcasm/a joke. It's evidently a typo but was trying to 
jokingly justify it while giving my Reviewed-by, acknowledging that you 
are right that it was a uselessly redundancy. Your patch is fine and 
welcome, sorry for the confusion!

Cheers,
Quentin


