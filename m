Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33084D6ACCA
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 12:52:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web10.70950.1732711914872862211
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 04:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WNxYEST3;
 spf=pass (domain: cherry.de, ip: 40.107.22.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUkVuFJSAGnWaXNrnxXAKx9LRDtqAjtp1q7YuAbdf+pCuaDrOXSm8/Bn4dZRTF+IkxNmAOWysCmVV0mT9r25lGnNu4J3n9PGECudlce8i3hLnpz/ugc9a6HFT0aOhtyoSNkaZ5u+EBIIFahpLJ+rkdpsRqkSkPJB3R8j1F7iJfJCEQGI6AwPbi+Z3pQRPoZz+18jqhukZ6om/Pti4+Yv743LA9f+v9gRv7g19LIuZlIbMshi+cuUUhC6LP2NRirLrQ84QbS2SlZxpvEQ8l1u/xHx05XJpAO0OSylxQnCDaG7xWV0g8RGjzmLKU3n3YqG+q2zZCnUEVtB6/go91Ga9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+XiETxBdCiNNplDGCJ4niKQCpK+wsAyfIeWL6ifPqw=;
 b=who4ZJZUt07w9BMDafamEdYBzz0ErNeNfaa5sqVBraLbXt30giMQO+x3KZzDP85kkeAMJlh6vKOuuegu/ITFTyo0N6VggliHPyOJviYdl6ryxp+r4p4i02MnR3VlhfEJS9PKOiVtcwYeDDyZ9wFiZg4cE28gpN2acVSoZN9/ciXyohx01puauiwCi1rTRbHW796YE9gN8lWIkCxAZGOotQH56lPQNoVSqInIGdQCmy+/9LoqHouwdrHu4M9VqVfPllE0tfvtbqwCESL8btC8VVOYKKyDIT30Q3IpsMcebkNSX6AvSO6bWOhQtalV/3MVH1M8ChUVRrLxk/2Q67YuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+XiETxBdCiNNplDGCJ4niKQCpK+wsAyfIeWL6ifPqw=;
 b=WNxYEST3yoX877uqFeWkLOFCJPWk/w+aGqUgibM+2LCB6MQADwfsjfauaGk9dlLRDYzgMpd3DmNJs73a3CIyiLPT5P+ctPe5jI0QyHr6uAKkvQLbqaDN4UZ2h32NBiIFGCcgVYshuq01YS4koVUXfy7zy2dQa3NRA7/9829qNQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB8041.eurprd04.prod.outlook.com (2603:10a6:10:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 12:51:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 12:51:50 +0000
Message-ID: <f6b6408f-e156-4b24-9930-0335b70f45be@cherry.de>
Date: Wed, 27 Nov 2024 13:51:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs][PATCH v2] Update the documentation for SRCPV
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241125-deprecated-srcpv-v2-1-89bc3afc78db@bootlin.com>
 <a8f7ee5a-0733-409e-a9eb-a5531c6eda23@cherry.de>
 <D5WTAZ2HJTBW.NLAN1YRHN9IE@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5WTAZ2HJTBW.NLAN1YRHN9IE@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0075.eurprd02.prod.outlook.com
 (2603:10a6:802:14::46) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f626b71-6481-4981-d9a8-08dd0ee2428d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UUs3MmhIbEx0cEVrMkFEOWdwS3JHcXloMXNjNndtVzZBQm9BNUkvNlNxcmdQ?=
 =?utf-8?B?cDJMUnFHcXkwQlZTZUV5Si9nYldaOG52UVV2R2U0OWx3RlRwWGhjOFVrSWg5?=
 =?utf-8?B?Ykt5WTdvQUVHbnRadEZkalpYL2tMd2xPWFVUOHJLTVlYWnNBd1RQTWR1VDhP?=
 =?utf-8?B?ZG83U2daaHE4UDRqZk5MRDV3M2NDUFVNYVk4ZlZvNFhQWDZkUjBjRnQvTTEw?=
 =?utf-8?B?V2VleHN4Q3c4YXA4ZTV4ZUdPWVpudzZrUm1XVVp2QmNyQ29rdlpXR2VhRUFN?=
 =?utf-8?B?Um5QaVkzbXBVTjZhMzltZkZqaklQUUNoUGxVM2s2TmgzUHFzSURYYWZZZ2U4?=
 =?utf-8?B?ZlFWTTh0RjlQWkdoQklORTcxRFlmUlBsL3ZwMXNkZzdvZWxxdWNzTDZVMEVW?=
 =?utf-8?B?aTRJM2VyaHliVjRVUVNMZmQ5K3hsK1FZbVhlNEVKZWNWMUVhMGFJM1R4T25Y?=
 =?utf-8?B?eC9iV1E5QXpHdDlEL21tOVNBckFJUGhKWGN5K2paUUNPTmQwdHhoV3RvTnkr?=
 =?utf-8?B?blNUTFZRTTJGT0s3NmF0cDlKTUpyUngxYUNZZURCZEtGSk5DSzZHTElMaU80?=
 =?utf-8?B?MFE5ckkwR010L0c2cXF6VmExd1hxVzVVYlBoL2lnY294UUYvNExkejlWNlJG?=
 =?utf-8?B?bHBUYlpnZmR3ekxETTlIMFNMQ1VTMmJwSFlVWHJta0VuTlIwUUUxVTk5WHFM?=
 =?utf-8?B?OEhPaXo3Ump4a09FL2R4ZHMra0JvckZ0NUQvNTdtdXhjSGxUaHNvM2twSWJp?=
 =?utf-8?B?MnJJVkdlU0E5dmhIbFNibitvVnN3ZHc5MmQ1KzNmRGtZajNZZ3Q0UFh4M0Qx?=
 =?utf-8?B?c0pSQmMyZFcwZzNwdXgvUDZnQy9pdnU3TDRWL3lBeTVSa3J1YWtobURERmVw?=
 =?utf-8?B?TE1qajZDYlk5ZU5iSGt1VU5WbyswK2VUUGxkMDNHZDhhQ0pQVUNTTHU3VGRZ?=
 =?utf-8?B?ZnN0NG1qWTZlSDROZXNKU2Y4SjE4Nm9SZEpEZ0p1US9tcDNtYWlhbTlPTkIw?=
 =?utf-8?B?cGlBNUk5QnAzRGFYUTdXNnJGajh5dXkvSFAzTXREVmpjK1pCODFEZzRIS29X?=
 =?utf-8?B?Ym40Y2Z6Z2FSRUFUTmpZZjNXV1ZGRFpoQU5qTngzYWhaczZPcjVnRUtTaDdE?=
 =?utf-8?B?U0dnMEhFaS9KcUl0U21rMlhuQlo4SXF6M1BmRk1CU0wzQjFNcVNuN2w0UGxM?=
 =?utf-8?B?UDVkbzdQZ3hVRnRraityR2NlWk5RMG9WZ2Y0djNJT1piSG9obEhsUnJNZTUx?=
 =?utf-8?B?VGZMOVltSWhWaEFsT1QwRG5ySmJGSEFzSGwySmhMdFFWcFFUMTJKdVFBOVdM?=
 =?utf-8?B?K0FqZ1UxbkpnZGg0bnJMWjdXZUVLMURJaEpxRkdObW1xQWttTUJ0ZDY2SWFR?=
 =?utf-8?B?SXEwanNWMjU5Rmp1RGNqSkhiVTV0VEJseXVyeFFqTXI3MUg0QUI4TC9XZklh?=
 =?utf-8?B?QzVicVdSZ3JlUVF3VzhCYXZabEF3OHBpK1lHVk1wNys2UlhEZXQ3eVZiK1JG?=
 =?utf-8?B?cy9NT2QzYU9hQVBJRjZsMnJvM29ZOVZCWGxGRklMWFQvZmplaVM4UktoNXZo?=
 =?utf-8?B?eHFpUXlqdXp1azNKRERYQURiNGxzdWhDaFZJdFJKYnd0RU8xeFkrRXNuSlJ1?=
 =?utf-8?B?OGlSaTZ3SEJqSnY1dytncmlTNnQ4dGVCeWxMVVN0b2ZKS1VVNTF6OW5SQ1pw?=
 =?utf-8?B?emxlekVQdFZITllKNDVQbmlUazJad05hUVppMk5HSWRzVnNRZVJjTHY1QzBE?=
 =?utf-8?B?SjQyM2JaZjRYNFBlOUxpekZIRS9IZ2lGbHQvL1UyYXpibjdKbGdiQ3IwRHQ5?=
 =?utf-8?B?SWpha0tBZUNNWElhTlVJdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V2F3d08xeEljNjZid1lsZWhYVWhuaGEvUWN3MzJnWEtEdGxIQzVYcE5OQngr?=
 =?utf-8?B?Sjl3SlJqeHY5Mk5QOW5wNE1CR0Y4bVZqMmMvdWZTT2ZLbytaVG1nc1NReGtF?=
 =?utf-8?B?QTBET0cvQ2VTc0hyZjYwcEYyUk0vUUo1ZHU0aXlZL29ZVWE4UUN4TXcxMldi?=
 =?utf-8?B?anFvTVZ6YndZMG9DbytONmVHMm5waGRzampTNlRkWUdJalhxNTZMMHdZbEY0?=
 =?utf-8?B?a1FNeE52VFpra0NNYlR5Q3J1ZHZRSE5QUldPVWZUQ2F6VkU3QXBpekNJQUoy?=
 =?utf-8?B?cHZ3SE9ibWJZNU9JQkpkUzZtcmZ0M0tlWVk4aWluS2dnWVZzbGMraWluSkRI?=
 =?utf-8?B?OGJnU00xTGtGTzB2cEJjcDVVTm5MWW9HMHc0cWRiTWUxMWZPemtvZGdDQjBm?=
 =?utf-8?B?TzFoSFpyNFMwLytwWmp0YWJqUEkwZ3dKdFJiU1FUUzFUbUhudWZERHdRdHp5?=
 =?utf-8?B?aWFqV2pwUWcxa1gxTm1KdFU0bFRTVG1XUW9MNnVTUVNqZWRQWFVCMkN5WFgv?=
 =?utf-8?B?MUZMOFp6NjhSNDAxVmxhQVlUd0VvdnoyaVA4MlRGWnoyeWhaMjU1RDJNWXhp?=
 =?utf-8?B?NVNDSVkrczN6c05YQmZLRFVXR3NJSStqRjRDUGFGVm04MndWcmlaNWxDa3l5?=
 =?utf-8?B?S0hkTjBWVERIazUwVGloSkxROUNRellxWUVYbW1lMjk4QWRIc2JpbDIwK0ZK?=
 =?utf-8?B?aC9ieUxBbU16dWE1ck85S2UrbXFPKzRzNzNKeEUxaHdJVVZoREdOTTJ2anBF?=
 =?utf-8?B?b1FQdVdhRnl1UHZrc0RLaHFkNitNU2FmdEs2K0VEQjRuQ1kza2krWEtsR2tV?=
 =?utf-8?B?ajRCZnNSaG4relRPQVM3d2F4enpIV2drdDNUdUFwUC90bFRyZmlYVER6WlNW?=
 =?utf-8?B?K3NnL1hzbnJCK3llUllncFpkMDR2Skp0bFZvWW5oODdSZWsvMEY5ZGtqYUpZ?=
 =?utf-8?B?S1AvMStTQU5mMnZDd05BSXB5NXdzblFHUjZtNENkcGUyQTdlSzY1QytuNHdJ?=
 =?utf-8?B?RVdiNUR4bGZxa2hCWWxHSGp6bHF5WjV6OGdjTlp6RUpLb3BtWEErbzI3ZDYw?=
 =?utf-8?B?eUpDaHdKbEVsMjlUUDgyTGdHbjl4S29VcDJSZ0RSL044Rms0L0FOYWVKSUlV?=
 =?utf-8?B?Yjd2ZGxYbGpXNXN5bkF6K0ZWdERVemxZT0pVMndZd3BYZ0M2d0J4cnBYdE1x?=
 =?utf-8?B?TzVwL09zd2ZkOW5peHJsTDdGQjhGM25OZCtjcVB5MUtETDhrMFJ1MFdPOW5O?=
 =?utf-8?B?YXFJZW9KdU9CT04zRGhyMHdsWFczczZMN043SGVGVTJtNUZ5Q2cxcnR0R01C?=
 =?utf-8?B?SmpUVE84QTIxUXVLTm0yR0lQV2dBSGZCS21TTGVCNEpMWi9ZNmF1dktrVTZw?=
 =?utf-8?B?bytzalE3cHVDWTFvSkdBd05ZVTRETTZRSW43TngyYmpscXh2UVFpODFXT2E0?=
 =?utf-8?B?VEhUUjFnT1k3YzhpdHRzRElyOHVFM0dLODN5TUVteWp1a2NDSWNlTWpQUCtz?=
 =?utf-8?B?T3g4elVZdGJ0MThaK2lDRVBuVnh5K0tBV2xmb2VzaEUrNmFlaytYRHdIKzNP?=
 =?utf-8?B?NC9VUmdTTGowRGI4MTEzYUdXT3B6SDR3Sml5ZG03S1VGbmZGblpUS1N5SDFU?=
 =?utf-8?B?ZGliM3M4ZGVSYVBrOUJ2NGFYNEpJMGtWTkI3ZlpzcjNKRjJBdlJodUlBbmlF?=
 =?utf-8?B?Q3RwSk96U2s2RC84NGQrWW9HUjdwdFBZRlVIeGRDeUlScFp5RTJNVkxFY0Nj?=
 =?utf-8?B?TUlWc0k1YUhRVFJBSUhsWUJ1RTRDazlYTDlqNmNpRll3djBFKzNLOXdqcnFB?=
 =?utf-8?B?RE5ock5VbXpWeHhHWGhYS0t5cUZNVWhRbng4OVViazRtOERzcUlNdXI3RUdN?=
 =?utf-8?B?YVYzN2ZvbDdZZ2wxM0dJUXBQTE9NODhpQkNBbG1aQzVZTllCMDRCMWZDM0l5?=
 =?utf-8?B?L1Y1RXluSzhKazhSa3dzek5BSTJFK2lVKzArUXpuRGtNbXpaWmNwTVBHUVlJ?=
 =?utf-8?B?MHl5Nmhkb0JvMTJkeUwvZnB1NzRwQzFOVjhmYlgwNzZjYUd4U3dWK3lqUk9t?=
 =?utf-8?B?bEQ4UGRLVlZVV2FDd1RPcDNKS0NFMlF3Y1BnbnZrRnFyWWNDTzluVEd5cGFq?=
 =?utf-8?B?Y284K2lRQnQwYytxdEQwSllIakpwQ2MzNUttTEJnRmcxQWZIeFFUVmlDcUVx?=
 =?utf-8?Q?rm4tFv9mtjpQVfHiNqssgP4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f626b71-6481-4981-d9a8-08dd0ee2428d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 12:51:50.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0JSTCVFgUEXWc5DSO6waMaeY/h7TkE94ckTSGoSL6koFFfvGcxO4kX2voxR9zKIRxN3U/K8jsnxcUa0/GCsTzevG11GMX8HEFx1abpuobw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8041
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 12:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5828

Hi Antonin,

On 11/27/24 9:18 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Mon Nov 25, 2024 at 4:57 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 11/25/24 9:17 AM, Antonin Godard wrote:
>>> The variable SRCPV is deprecated since 4.3. Instead of including SRCPV
>>> in PV, including the sign "+" is enough for bitbake to add the source
>>> control information to PKGV during the packaging phase.
>>>
>>> Update the documentation for SRCPV and the places where it was used.
>>> When instructions previously referred to SRCPV, replace by mentioning to
>>> include "+" in the assignment.
>>>
>>> In most examples, "+git" is added to PV as it is the most popular SCM.
>>> Simply adding "+" is also possible, although it is better practice to
>>> include the SCM name, so give that example.
>>>
>>> Update the gcompat example with l3afpad as it didn't include "+git" in
>>> its PV definition anymore.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>> [...]
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index ec4d7ab73fe3ac1bc64f5378c65d19ae0b749809..f611edae9f37097734234805faa34b1850e5cfd1 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -209,12 +209,11 @@ system and gives an overview of their function and contents.
>>>             SRCREV = "${AUTOREV}"
>>>    
>>>          If you use the previous statement to retrieve the latest version of
>>> -      software, you need to be sure :term:`PV` contains
>>> -      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a kernel
>>> -      recipe that inherits the :ref:`ref-classes-kernel` class and you
>>> -      use the previous statement. In this example, ``${SRCPV}`` does not
>>> -      automatically get into :term:`PV`. Consequently, you need to change
>>> -      :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
>>> +      software, you need to make sure :term:`PV` contains the ``+`` sign so
>>> +      :term:`bitbake` includes source control information to :term:`PKGV` when
>>> +      packaging the recipe. For example::
>>> +
>>> +        PV = "6.10.y+git"
>>>    
>>
>> I believe this is not properly indented? Missing a space here to follow
>> our standards?
> 
> 
> Good catch, thank you. Some others below are also not properly indented. It
> would be nice if sphinx-lint could report this, but I don't think it is able to.
> 

It's open-source, so maybe something we can contribute :)

>>>          For more information see the
>>>          ":ref:`dev-manual/packages:automatically incrementing a package version number`"
>>> @@ -5152,7 +5151,7 @@ system and gives an overview of their function and contents.
>>>          The :term:`LINUX_VERSION` variable is used to define :term:`PV`
>>>          for the recipe::
>>>    
>>> -         PV = "${LINUX_VERSION}+git${SRCPV}"
>>> +         PV = "${LINUX_VERSION}+git"
>>>    
>>>       :term:`LINUX_VERSION_EXTENSION`
>>>          A string extension compiled into the version string of the Linux
>>> @@ -6720,9 +6719,10 @@ system and gives an overview of their function and contents.
>>>          For example, consider two recipes ``foo_1.2.bb`` and ``foo_git.bb``
>>>          where ``foo_git.bb`` contains the following assignment::
>>>    
>>> -         PV = "1.1+git${SRCPV}"
>>> +         PV = "1.1+git${@bb.fetch2.get_srcrev(d)}"
>>>    
>>
>> Getting back at my original comment in v1 (forgot to answer again there,
>> so doing it here). I'm not sure this makes sense as an example as it is
>> not necessary anymore since + character is enough to include that
>> information in PKGV (as far as I understood from the patch). I would
> 
> Exactly, "+" is enough now.
> 
>> like to avoid suggesting using something that isn't relevant here (or
>> discouraged).
>>
>> I think we could simplify the example. The point is not necessarily to
>> use % with a git-named recipe but rather that a git-named recipe is not
>> going to match "git" but the "PV" defined in the recipe. What do you think?
> 
> Ok, something like:
> 
>    If your PV is equal to "a.b.c+git", you can match it with "a.b.c%" in
>    PREFERRED_VERSION?
> 
> This makes more sense with the current state of things, and simplifies the
> example a bit.
> 

"""
If you want to select a recipe named foo_git.bb which has :term:`PV` set 
to `1.2.3+git`, you can do so by setting :term:`PREFERRED_VERSION_foo` 
to `1.2.3%` (i.e. using simply `git` will not work as the name of the 
recipe isn't used, but rather its :term:`PV`).
"""

or something like that?

Is PV really extended with the git hash when there's a + in there or is 
it only PKGV that gets it? Basically, do you even need % character when 
we have a + in PV now?

Not sure it's clear, lemme know if I need to rephrase my question.

Cheers,
Quentin

