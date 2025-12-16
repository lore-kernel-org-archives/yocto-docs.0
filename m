Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC370D5CCB6
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 10:05:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18884.1765879510578352752
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 02:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Bjt/dPuJ;
 spf=pass (domain: cherry.de, ip: 52.101.84.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1R7czZT4Pm1STEPM+q3+e348TV14xivtTgIR2fnGLh/cu7mAsnCFlTjxi0Vzq7pICidx31O6T9rcmva2w/L0pth5+AXSj4k1xKukL2QKIQUkyTli2StvKuTlCA+dHoc0ExFfagTF1opebAP0Wf4HQ5p/XmwnzRSROv2ghAKWEoAor1PNhwEch7nU9HYH7268JGSdDCuO/ZUkvmzDYHngq+bUTlK9mveEp7nIbaWCKzZOwdaYIMITFIRboOHJRg/7/8in9uH/z9f1lUNICL1mYIE0ZiAkJBIL/bNbVmXmfSd6IEo455ZRgYtHRiXkORa/JRrxJSkf0Xu73YwHg18Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywHKV9CXDM+tcVAAduC9KPCcpeifJNCPYBW/sA5xtj4=;
 b=j2rs7Dl6nECWVgsCgEcT0riEdcyns5UnDkh1LKb4BtcFOdJHOrS6liu+B7Vocvck2kHSJ/7b5ONIuEA8B+akxDIY70CsBR3lhECHz21bUXFGHlksEWu8d0gVZBIvf7nbbplIJmrVprHKhQqYjl01RlKoymbIOqUtRwcs2CylLBj0bbptzquXWaaWaaJ6IfUS4QJX8l4NXMH5mI0z9bVuSC2/xsyV2hQH2TxHkIsfPKK6K0CfnXmaX1jKVMVtqs8aDiSBFCmSvNB2daJzZ/tq+Pu4rU+kIEtR91++AHCL+LYDJ9kwXlsVerfBlHwHB1luH+wkse+omroJ5Qlm29QENQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywHKV9CXDM+tcVAAduC9KPCcpeifJNCPYBW/sA5xtj4=;
 b=Bjt/dPuJBRcccSh32O574g29XIcKGmbWDYGKe/HUn/pURDJpp7smpQuic8FcP5ISc5OFon98LUecBLfF3+2rbO+b62FS/y+PZVOoS3ON05gjZGtJpUoxeCetugLJjVefirRuCmZuhOTRhrYc+weP6dJJz1njHCyik7NTs2IdzJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB12077.eurprd04.prod.outlook.com (2603:10a6:800:317::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 10:05:05 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 10:05:04 +0000
Message-ID: <1f26c158-7fdc-4b2a-b841-8a66d0344b25@cherry.de>
Date: Tue, 16 Dec 2025 11:04:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] ref-manual/variables.rst: document the
 IMAGE_CONTAINER_NO_DUMMY variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
 <20251212-image-container-v1-1-fb6586d06813@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251212-image-container-v1-1-fb6586d06813@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB12077:EE_
X-MS-Office365-Filtering-Correlation-Id: f837f2cd-a36b-4a1c-1f56-08de3c8a955a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bUMvNW1DV3JRTDhNSHVpdDFDZlNKV2hLMy95dStUbUkvdTVHL2J1QklINXl6?=
 =?utf-8?B?U1pJUE9GM2ZYZ0ZDNG50U1IxQUhreXk4aldlYnVqTmdkcit1UXNqV3NvYnB3?=
 =?utf-8?B?N3cvdDdTckxDVzJtK25oREp2MDBqeUhlRHpacnEyZkZzQXBuZDZINi9BTGxa?=
 =?utf-8?B?WmZUZkFZRzVkSXh1YWZqaFkwOVExUUtJU01pRVZFMUZRQ091eXNFeW13WDFF?=
 =?utf-8?B?cWwwVGJEaDJmTnowSXJ5MGVXaVlXTlRxZnRoOGovWGpTWFBCbnF6Zm9mZTZO?=
 =?utf-8?B?bGJTdnZsc0VqZThUT1VudDU5WUNQUVNodDRqUEwzWnJCZWVYdTF3dWQ2ODZI?=
 =?utf-8?B?SHdSN1l4bEFqa3RXR0dxWnhpeFRucVVLeW4yWFhaWWh1ajVhYlFpWGVVOEdJ?=
 =?utf-8?B?OENGRG03S3FjMzBoQUtXcEJKM0doQnpTSWVKWDExYlRXQ3FYZFV6Qyt0dDlj?=
 =?utf-8?B?VDJJcWt5Z24vblA2VG5LVitLNzhKazFSVnVpOWp2V1VPTFpra1dERThvcVNx?=
 =?utf-8?B?b1NOdFJ5TmQycFNBdFJMM0RQMmJUQVRJZW9jYXVEbVRDaXpGV2cxbmFPQUNJ?=
 =?utf-8?B?VWI1M0FDdDNzalBiVzVaMGg5VHVFZDVQalhabXRhdjZkNTVjTU5FUXJVTFFT?=
 =?utf-8?B?WHB3VS9TMUxDWnlZMXA1elV5SkkxWHM3WVVPaTBlWkRoK2U4N3M1Z3FqaXJl?=
 =?utf-8?B?MFZGb2dCUjdRZUQzRUkxelk0ZGUvaFJMaUE2eE00VXA4dm9rOUk0Y2pZSWhh?=
 =?utf-8?B?emx0dTZ4OTk3cTNYdEJVcjBTQ3U0d3JWa1VlV3VkTUVRb0lFZUloZE1uK1la?=
 =?utf-8?B?cjdScHJvN3FKYXdtRFFoN0YyNFl5djFXbkJ3KzJManYzQzFDZS9nY1l0QTFr?=
 =?utf-8?B?YVBGL2ZGQ1dabmtWb3VUTTZGaUlBWG9NbHg1Q095c2pHaFRQak9uTHNvU2xU?=
 =?utf-8?B?dTdqUDBDcUIwSVU3TnZaYmlsZlcrZXRGc20wQ3hBVDN0Qlh0T0lGYmtoUjgx?=
 =?utf-8?B?OWNLWGpEN1ZWVVE4OHJqREhoYURraVhSMXBEOGFCeHVYa1g2WTdFSlRES2l2?=
 =?utf-8?B?VmZNQmJITHBpQlZmS0lSR3VzbHdjV2JrOUl4L2tPSlZDV3NMWnQ4TEMvcll1?=
 =?utf-8?B?ei80V1FvcFVwNzVmUHNyaTRKQ1IyTmxrUGdlRHdIelE0b2p6K3VNdXB1Y1Ji?=
 =?utf-8?B?eEU1dUxhWmFqMzVKOHNrRjIyYWx2SWtpZm9OOUpUQW56SlZMeGN4Ri9DOGR3?=
 =?utf-8?B?NUZla05mR21uekxHZm1CSGlBSHc3c1ZMUUVXVE5TNmFicXpVNi9OeVB3M0ZP?=
 =?utf-8?B?SFZUZkJ2aW5nYU44TnI5QUxCaWZvMDNOaWNYdVkyZk8wS3pJN1JieHU3QWg3?=
 =?utf-8?B?eEgrSGVLdzZQSVpJeXJXOUhOTzhqV25uNG52ZzVSWVV4QnFkcjZCTk9lQVlp?=
 =?utf-8?B?Wm0wcTNFU0FVUTcwK2VtRm84MGVwV1JNT3VJeEVDQXBBckx1K1FxVEZTc1FZ?=
 =?utf-8?B?dEJ4aURoK0QwalRNeDI2RVVJdVZVa1lNSkFCQ1cyeStndjVwVnJ0UFVhc1NV?=
 =?utf-8?B?S2RlOG9teDYzb2VrZTNxNkpzSldQNHh5amFxdGc4OVZyaTVFUDlLNXBKZlFj?=
 =?utf-8?B?WjBvQU9HNzBUS1QvYU5FZjl2YnNUR2c4Wlh0WTZyVWFkM3BJSVlKOUs2WVVD?=
 =?utf-8?B?RkNteEpiR1M2YUlodkNBZVVpbmp0Tml5bnNnQWpCV0xOczg3SnFmdFA1enZ0?=
 =?utf-8?B?ZlpieEtvbFpISk5FWDNxR1dxNHpsbUdvVmswd0ZKYVUrSUp1VEJvNnRBVDBW?=
 =?utf-8?B?YUhwM05MVnZzb1krUW8xWHRaN3hPdDVIQk9JZ0dyQ1BHSHlaUkFndFFmVGh6?=
 =?utf-8?B?UE9leUZtRWN3c2ZsUlgvSkF4b3ZudHcrbnZpdjMrTHZKQVI2YW5IUkQ3a3Zv?=
 =?utf-8?Q?3oOBOhYJIv+apLhfgSh8gc/rooSOG7T5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NEk3Y29RSEVKMzF5UTNOYUVsQXQxd29WdUhjRTBVb0htcUd0Snl1TnJDUzlU?=
 =?utf-8?B?NklTNXZkNGd3eW5rMGZiTGZ2N0N0SWlwOGdkOUFJemVDWU9ScUdNckNETWF5?=
 =?utf-8?B?eURTT2NEZ293Y2dlUzh2TjhrWGZWOUZBc2k2RkpiTnhnVTl2SWNwY0ZaWTVj?=
 =?utf-8?B?eWZuM2E0VWY4MlBCNS9IWjEzaUxWckpkaWo3K0wxZHZNTHl5YjU1aGxHZU9U?=
 =?utf-8?B?UWZqL2pqcXVialpVekNDTlJLQVlnZEJwTkdUelZ5V0pzZDFOUFFnMXVhaEJF?=
 =?utf-8?B?ZFFpRGtEd041THdXU3FpblQ2c0kyak84MFdiV0xjamZHdGEwUkJ2MFdSSTNn?=
 =?utf-8?B?NThzWTVNSUNMeE90M2RhNEQ3WE9jNEV3anovZ3B6cTRlL0hhTTlVdHh5Nnky?=
 =?utf-8?B?NWJPMG05RFc0VnFMMXZybU96eUdDUVJPMXZKeGhmSE9VdFQ2Y084UFdNNkNQ?=
 =?utf-8?B?RnhHVlRWUXN0aE5jbS9YSXc2dGVWbmtOVHNFNmZ2VFNDTlVMMWhubkwwVDZu?=
 =?utf-8?B?bElHV0cweHpzOFJoTHE1Y3cyRE95bFl1aGV5S2FheHdCUld1bCtrL1FmU2RI?=
 =?utf-8?B?ZWtqN3E5WXJJZU1mK1NZNTFxT1ZUTytNc1ZkNGkwS0Z4VzBFa1h0MkRvbVl5?=
 =?utf-8?B?b2ZGZ1ZJb2xXMVcwU2ZZU2tQZmdmcG15Nm1wMWEwSEtJMyt3UjZGSDBqTEFW?=
 =?utf-8?B?UkVGb3l0bjBQRVlxc1JKV04zQ0lEM0JLajZaeXZhdFA4d2dUUFBHY0JWVkc5?=
 =?utf-8?B?RWMrRmtsYkJyT1ZMRjdqVU5DR3pzM0V5RHVPS1ViVFpEZ2JLMDEwZGt0OXgw?=
 =?utf-8?B?ZHlQcndKVkZsa2dLL1pzQ2hjcVJWZTlUbTlEam9ibGhmVEJKdVBhelJlOU5v?=
 =?utf-8?B?ajJpN2FTdk9jRkU2L0NpeGlsWVZKUklsYlpjaTdncFNNc3ZvcjRaK2FQK0M0?=
 =?utf-8?B?V0VDRlRHcWlkbnBjMU1jNzM4OVVnZFByQ1pNbzhNVlczaW1FVVdaY0NrRktI?=
 =?utf-8?B?MWZhZmliZm1zRkxLOEk3bS9FMU5JeStCZEJsRk9LUk9xczZ4MHZHT0pkaC9P?=
 =?utf-8?B?TktNblJ5TS8vT0ZsT1BlWXN2WWVRYVE3SklTd1dyUFVjakc2Sm5DTVRtVk5I?=
 =?utf-8?B?TVFvZHA2Q3NpZnRobENwQVdFRlNoZEZuRWJSeVRoZVZidnoxQ1lHSjFiSUFv?=
 =?utf-8?B?K29uSnNlbHd6M2Q1OWpxbkFVVmNaVEJXb2t4eFhETWx3eW1RdXFTckRZZVB0?=
 =?utf-8?B?ZHBOYmErUXhhOTRnTzY5dGR6R1V1eTRMSmd3VEM4N3JTT0svY1Ewa1gzQlRj?=
 =?utf-8?B?Y0pGck1lYlhROTBpT3RlcTBkOVg1T2hnMzFhSDhmdEhkaVlzM1RKVDIyblBk?=
 =?utf-8?B?dkRDUGVsY0ZTMEVtQWw3V08zVGxXS3ZWZk00cVNFdzNhQTJLWlZUVHVFSHhh?=
 =?utf-8?B?WmlYUkMvMVBEcjZzNWZjVTNWNHVxcmxaR2lIb1VsNmQxdzFrR3RwdVc1QWpm?=
 =?utf-8?B?bWQrS29xZHJrRzRMNXBXMnFpak1XdEZUMTdBV1c1U29Qbk4xYjVvdFRqYkw4?=
 =?utf-8?B?NlRnRVFKcThSeVdLZlk4TFB4ajZtakNRUndESGNFb25pSXRYRXRQN0FOd3dW?=
 =?utf-8?B?QXAydEFMTWhiTEMyTjhHWlRpYlR0S0M4a3BXZ3pZMUxvc1VxalpuWHlkYktZ?=
 =?utf-8?B?RlJ6NUUwdmZZQ2s2ZGhjRW52SC9vY05va3UwVUMrRHJBdHBaSndhcmI1WGFZ?=
 =?utf-8?B?MTZ1WFRGV28xbUd1M2lmN2JtQkVuZ2ZRZ1N6Z3BhdUsyK2dYMHRyMVlRLzUx?=
 =?utf-8?B?VGFFcWczWHY4M0hQVjJUZWNKYjZqcU1GZWp4MVNtVlhOZ1JOSEV4UFdvdSs5?=
 =?utf-8?B?TjhxbU9tMHhEcmxYYUxETlBMeHFrZkF5ZU8wQXAwWm1ENGZueEN6Z2hOMURO?=
 =?utf-8?B?ZGxXRm1EckVtZjlBMUdwUWN1UVQzNlVJZzlDSDcwMy81Rm1pbTEwekpJb01v?=
 =?utf-8?B?SkJyako1MTlXbEdEY1F5Ui9RdTk0bUVJODQ1cUhTamZEeEI5UVJNeTQrTk1z?=
 =?utf-8?B?WXZEYnYyNUY5YWtPaytiTVdabDlXU1lsMi9MYjFGYlY3eGk5SU9DTUJSaXIv?=
 =?utf-8?B?QjIzU3NOK1Y4d3hJMUlHV3VuKzV6R01VM2F4RUt5a1VhNEtJNnRhZzBEdzdP?=
 =?utf-8?Q?y27DecclDGGPf27D9hBk9cg=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f837f2cd-a36b-4a1c-1f56-08de3c8a955a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 10:05:04.3237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqmRkh/9AUjYyFFDbc8BPX3b37hGwURwLeKBrMGliqQBBkHmrHzwPjdiZKfiGJme4xvy5XU3jzXjOv1Ogq3gtvTBwjdiZNOITXTd4gZ8MeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12077
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 10:05:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8282

Hi Antonin,

Seems like the SMTP server only sent the mail to myself and not other 
recipients. I've got to stop using this corporate setup, it's only 
bringing me pain.

I've already removed what I told in patch 2 was to be scratched in patch 
1 ;)

On 12/12/25 11:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added in OE-Core with commit f0645e172bb8 ("image-container.bbclass:
> Error if not using linux-dummy").
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 71fe11b83..ac7b85992 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3955,6 +3955,13 @@ system and gives an overview of their function and contents.
>         variable, see the :ref:`ref-classes-image_types`
>         class file, which is ``meta/classes-recipe/image_types.bbclass``.
>   
> +   :term:`IMAGE_CONTAINER_NO_DUMMY`
> +      When inheriting the :ref:`ref-classes-image-container` class, this variable
> +      can be set to "1" to allow a :term:`PREFERRED_PROVIDER` for the Linux kernel
> +      (``virtual/kernel``) different than ``linux-dummy``.
> +

This seems to imply to me the default is "linux-dummy" but that isn't 
the case. Why would anyone select linux-dummy? A few words or 
cross-referencing another part of the doc where this would be explained 
would be nice.

This also *could* imply that setting IMAGE_CONTAINER_NO_DUMMY to 0 is 
going to do automagic stuff for PREFERRED_PROVIDER but it isn't. I would 
add something like:

:term:`PREFERRED_PROVIDER` also needs to be explicitly specified for 
``virtual/kernel`` (e.g. ``linux-dummy``, ``linux-yocto``, ...).

> +      This variable should be set from a :term:`Configuration File`.
> +

Are you sure about that? This variable is handled from a recipe class, 
itself inherited only when the IMAGE_FSTYPES contains "container". The 
examples in meta-virtualization all have it set in an image recipe.

Cheers,
Quentin

