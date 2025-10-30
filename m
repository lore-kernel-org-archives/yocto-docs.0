Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E25CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:54:45 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.40])
 by mx.groups.io with SMTP id smtpd.web10.22378.1761818083724160410
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 02:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XnPs36Jf;
 spf=pass (domain: cherry.de, ip: 40.107.162.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRUEsK2hGwzqrf1BK0JSyzJgS+9PoNMDnswQlSbgQVPDO+A0szWdGQjY2rCH96ax/fsycBwiQbr8Wiae9GFUuTzyG4lpwFEvW8XJQ+Xrp7QNbRpn5CPSj1Wd/0ZLGa20FF6LFkbrY0SvY682SPnAInPA9Zb1TmfTxgAeWgJ2rL1dX1V7KYLRW+HuHUSBGGriPyxvF3D6q66vcHRbVCAmWb9o6OSRxx9uLAGNhvKu+OuDtDHxNTA8K+CmjviiXZ5wpC2kwctmr1Z65IX7L9YC6CX+90pfJhw/JW0hvblJ6glQ+KjxesbRsZCVqa4koJiPhmGy5NE1Ug4m2GaygaXIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyETxcmfQ9yN5AvUe4nisoTtc1XaRq0cPzDH6lgjQMs=;
 b=L4SduoUsdcK9h4M+QYhUsz/UBOJ9t5BLfOpgD28OBnthZiuheuUWJ7e43NBylkxNiNyPlS+YFdkC4GX6YVr1RKhL+7fl+hlKHhLHk4LPXVmCOLnnKTxrIoQ7h8bAzA55rWCC02NMmDwYTY9T5ngSUO5MsuNVFtIdmHNcS5HsUGm41iAffGsPjDMmPqkzCo77+05YqkCtsmRhbZGVGBJRiWg8YcaYv9jZq2cAVt5KCsXN9TFCwneLpBrDunpctnND67mgc6zx7oocTeamkh9JKHLwDcKGVS93i9drGCHNloWQahEBxqPKO0yJmoNsJnhXB+shdkHuoKWUAAwXiQjGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyETxcmfQ9yN5AvUe4nisoTtc1XaRq0cPzDH6lgjQMs=;
 b=XnPs36JfDUGPveDQ+obbh+9ditI/kg4KYnWrk0gkRmohu1HTuw1jmaQinlWix2dZwLmIXiTkbKl/d+rUkVyzHFLcLqM1dFRfTiyk1LRkneCq82V4Wq/PoJNXOtPZMCEfAqrgBMKbLF6OJQLAHFutvvQ6HYZN+AZgmXBmsmP9SUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8260.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 09:54:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Thu, 30 Oct 2025
 09:54:39 +0000
Message-ID: <208e7d2f-7db7-430c-b561-d0f21f288212@cherry.de>
Date: Thu, 30 Oct 2025 10:54:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] more pedantry, this involving virtual providers
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <f7ee02d1-b309-fb49-a629-c6840ad92149@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f7ee02d1-b309-fb49-a629-c6840ad92149@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c44b329-5942-4475-eafc-08de179a572f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QkcrU1NTTi9qNklRYjVyQTlDWGZQRjdRcC9yMUkrMkRaaEI0SkwzbDZOZVN6?=
 =?utf-8?B?Y29pUlhXTWRkWFdCQmJsMVNXOGp4WElGVkQ1VjBhQUQ3dzd5bkF1VnlaczZF?=
 =?utf-8?B?UHBIaWhEcE80RnU1YVV6Nlp0emFEeWo2YldKaWtTZ0Z3OXRhRUp3S0s0UldJ?=
 =?utf-8?B?QXh6UEdvZ2VZdWJxTmRaaHlsMlFLVGtDbDBHVVJuZDZXc1Q4TlVNajErUU8z?=
 =?utf-8?B?bDBLUDQ3aXk3MzF1Z2NPVk9NQzNOSWtxYUpzK28wT3pYUmFWV2VFVkx2bW1Z?=
 =?utf-8?B?cWtpTDNjNTRYa1RLSjhlaDNkVDdXZzJkYk1vL3hlTGt2UGFDNUpPL0RjWk9B?=
 =?utf-8?B?VXlrWnllb21ocE85L1RTRHZMbVoyYVN6d0tsZU15V2srY0Z1QWRWb3pydXFG?=
 =?utf-8?B?QXNTcUJGdU95WjJFZ25abEF0QjN3cEZjTWM4bHhWQ1lpUERTVFhzUkpNai96?=
 =?utf-8?B?TFpUMHZrVWVHOUtIdmZBMHpvN2NnQWFucHlJSWlOdlRIMnhoNFp6eGM0OUlY?=
 =?utf-8?B?eG05aFJmQlJtejhNYnNKYlFKNDZ0RndURmtmYk8zRGUxNnU1SS9CVGUyN0Uw?=
 =?utf-8?B?aUk5V0pxQ1d1TFN6aER1Y21EYmM0Q2lVUjB3YlBtOUx4QkN1RzlVcnRRVWZN?=
 =?utf-8?B?RGFaemhPTEJXeGwxdnFEdDVuN0JTYk9lbURseWxvU3I5K2hmTTNCSnprUWFJ?=
 =?utf-8?B?M2tJS0lCNFYzaHVkR2xmUUkyTGVhWmhzb1c5QzA4WnkvQWd0bGNrNWczd3pH?=
 =?utf-8?B?WVY3b1JTZlo0a0hSQ0orMm9CUG1Ea3ZyRXFKTHFHWlN2cnpucnpxZVd6RkQ2?=
 =?utf-8?B?SXZhQlZQNy9EZlRtZmFESGc4bHUwTzg3b0JaWFhZMDBvWkM3V0RDdkRWZ0pH?=
 =?utf-8?B?bTM2end0S0RhRlg2Q3hYSU9Mam9yanZEZWNSS3hXaWNmQzBNSjM1dnBOVEdT?=
 =?utf-8?B?V25udElLWE5xSWszakVtUk8raGRhMCtSSjZpMnBCeDUza0tyZTJFem1GZzdo?=
 =?utf-8?B?dWVBQ2hNa1RGakR6SXFNNmVXbEJMckJFMVZlamNtelRoa3dTR3FuSFQ3WHF5?=
 =?utf-8?B?bStaZVdaOUtIS1NGUGxZdlMyK0FoaGFSam1iL2VxN2xYVFZ2OFQxWEZjVlVE?=
 =?utf-8?B?MGxSc0x0c2lnNVd2YzFWNnA4S3ZuMlMxZG1NL0hSTFRBTUxtRnRvcGxydFVH?=
 =?utf-8?B?bnVKM3VTZWVhSHNQSklzSGVyODV2N1hLZnc2UXNLOUx5VVZkaXN5d3FYZXVO?=
 =?utf-8?B?OGtMZmZSS24vZ2ZrQU1ZWmdMY05sdUFPSzJsbWVvOVZHWXNxb0pzVDliV3R4?=
 =?utf-8?B?R3QrMHczYmxJYmZVU0lsbWVEWDlBQjdRaHU4dks2azh5c2VMd3AxQlJBSGVo?=
 =?utf-8?B?Ykw0UXgxaU11Z2cwYktiSFJPSWc1dnEvMXgrbGxCUTdOMklzaUxnYjA5Q2lQ?=
 =?utf-8?B?a3Y3SkFITkNYM0lrcnBocDY4ZXVMWDMvejV5Mks5UW1ISmRWMHo2OXUvRHF1?=
 =?utf-8?B?YXNhK3ZYU3Zib05DWGV3cG5salZmQ25MNXhndlRBVm1zZCtxRjZEd1gzSDJo?=
 =?utf-8?B?NFdUR3ZjQTk4MGtqWTUrRkk5d0tUSHVtSyswS3BTNUpuallNUkJPcmpwUXMx?=
 =?utf-8?B?N1I3aTFVYWxzdWY4SzNNSDBTb3hUZ252aDg2REttL0ptdDB4R3NBVlNKYU5K?=
 =?utf-8?B?UkRqVHcyV29ON1RBbVd4aC94ZW56VGVkdVlLWFRmMXQzZFRWbzcybkpaT1I2?=
 =?utf-8?B?WnFxRlVlTXNyZmVZZjk3UFcxemVDNnRCdXdWSVRjZVloU1NpamNLV3JEeDRj?=
 =?utf-8?B?TkM3bkpudi9peGFFNkZOZ09nTm1CT2V0UjJEZ3NWaHN3Ny9RYlhmKzRhNzdH?=
 =?utf-8?B?Q1RDRUY5M2sydlZwMmYvMzlQSU5KdVd5Qm5QWGJjN215WkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFJ1Q0VnQStDZjA0YmtUNWx1WU9ab1c4TmViTkFPSXlzU1RBaE1vY3lDUWk2?=
 =?utf-8?B?am4xdUNHdks2aFRLZXJqQkdpZ0Erdm5PWG9pSC8zQzdxK0FNQ2thZ0dMaDFn?=
 =?utf-8?B?MFpmbjk5eERoNUsrb3pidnB2Z2p0OW1ZdzlwbW9RM0ZINE14TGV5TTRIa0Vw?=
 =?utf-8?B?OGNYKzdQSkZjOGZsSVduV2VXNVVPTXMwdWhxcGE2c0pjbi9jWGxaM0JKS1VD?=
 =?utf-8?B?UzBFODJxTXoxMG8vVWNzYThVQzNHdkM5K01IWktKa0Y5Ri84T1ZhdjN4clpj?=
 =?utf-8?B?aHdEZ1BaTjZ0dVdwdzBXMFh3a0NkQitsOWQzbEowODJsMm95V3VZOGtjQktv?=
 =?utf-8?B?TTV4L0l3d2FFdWVGd2hwcGQ0VTFrN1JreVhibVFrN1UzL09iRXp0cU85Unhw?=
 =?utf-8?B?bWN4T0pVWTRkVEFXOFRxNTA3Z254NWQ0YzNzUWR0cGpBdE5CamFTRG1icjNK?=
 =?utf-8?B?VXV0OC9nVVcvN2FjbHhVY2h6WDdLWHpyd3pFK0d6dTFRWWFJaXFpcm1VOWJZ?=
 =?utf-8?B?MlBEamhvTjcxVkVCVnJkKzV6b2h5OFRjcHhYWkFoUlJmcmRqSEk5WlkvejZr?=
 =?utf-8?B?SEh4K0p2b216ZnhnYjZXVWwxMCtyZ0VIT1RIaDNiMEFBcTBsaktVbzlld1BM?=
 =?utf-8?B?WXFpK2Fzb3IwWldkZXJtdjN6LzZKOFY2SzlvTmhpMFc5QytLUVk0RGk3SGlv?=
 =?utf-8?B?dGM1RkNZcUhaZGVFanBTNm16N1J3cm5QT0h1dzVOdzc5bmFhc2pqdldTSGkx?=
 =?utf-8?B?dGdvSUJ4L29Jemp5ZHMrNE96MkRTanhaZnNXUGN2cDhYaytXVmtlLzBHQ1FC?=
 =?utf-8?B?RmRGTjYzUXF2ZHdZaXhBNW85NlFIYWhlTjdBR0dEc2JlSzRzUE9kRG9WTmJq?=
 =?utf-8?B?bzI3VGVlSlRHLzc3Z0VuMVZ0Qko3WCt1VUc0MUdLdGEwTzE3MUlSUDNxU3o3?=
 =?utf-8?B?QjQ2S0E4T2JSbDJod2d1RUM1U0VlN2hBT1N0cjZGRWpPY2c2eGxGQ1h5V1ZO?=
 =?utf-8?B?bWFXSFNnV0llOE5tdGYwcFJscXowcFlvZzBsajBvMWM5TWo4VGRDM0dwNTRB?=
 =?utf-8?B?YTZVVWdYTXU2VTNRT2JxT2J5SHNuZ0NVOXhpaDAyZWhZblBzY0RoZmFPa095?=
 =?utf-8?B?TnN0ZnBhM0ZCV3BiNVJGQU5hT2sxTnpNcXJsdVppMUZCY3RKRU55WVBOSDhZ?=
 =?utf-8?B?VzJpYjRtVmhpWEhHTHhralVwOEYvaWhmVkNoMlJlS3hmZ21OVHVEUGtKMkJa?=
 =?utf-8?B?c3E3NDUxM2RGd1YyTTA4d1pHcnYwRU91TElObG9NZFUySmt3KzNheGdsb3VL?=
 =?utf-8?B?TWRuQk5HajE3aDRzVld1aXJWTXhjc2o4WUh3Q3JiNWtYUGR1U1Nmc2VHV21I?=
 =?utf-8?B?UFkxSmFpRzQ1VHZuclROYXlZVEdaZ2tkWmFINDZtdFpDOWtkMU1ibVlybUVy?=
 =?utf-8?B?d3BQK0FRS1JLL2E2cFZVTHZxeE9iRk8rSk5UdGJPbnoxV2hWWW5wVFY3TGhp?=
 =?utf-8?B?aU9FTHRHbzZUbFJoUW5hbVVidnkxMEh6ZlFQWDVpbGxvdXNXaFJ3QkpCdUYx?=
 =?utf-8?B?cGd2K3czcDk0V2NaTldLWU9UZkxQMTZEV3RmWDBsKzVmcnhhMEpzTGhFSUZG?=
 =?utf-8?B?YTBjUURyaHRIUVl2MlRjSGtwc0s2djdVY2NsRWJpOGlId2IvaFdmWmNJVkUr?=
 =?utf-8?B?M0NmZGx0MlJFK3N2OERhWFJsdWRVUk0wcEhRUjFXc3plOENIc0QxSllIanBp?=
 =?utf-8?B?MnNzVGJJWVh6K0FIZkREM1F0YXJFV2Ztbk15clNzTXZkam1ocFhFQkdSZEp3?=
 =?utf-8?B?eUNPTTN0ZVhjSzRERTYxbFRENHhsd212WXZHeGFVZERxam5KajA5RnFtc09P?=
 =?utf-8?B?WjhuVE5sa1JwVmV4OEdNZzFUZk9PV0NjSWwrV3I4YWVydHo2MDhJYzV1R3BS?=
 =?utf-8?B?dEFCRjR4RWNESEU1NWZiRG1HRHd2V054LytEN3d6aFpBK2FQU3FaelBhZldp?=
 =?utf-8?B?TElPQ3U5MjhKQVBTZHJNYlh0WFQ5UnB0UnlWaENLeUUwd3Z5eXkzVkIyM3pP?=
 =?utf-8?B?Z2VuVEtzcVA5WDYwMVZyR01XSkQ2OFJnSzFWYTJYbjFRckhNaitIS3Y3RGQz?=
 =?utf-8?B?NWJuVVY5WGwrR3lCbXc1UnU5Qnp3S1RqcUhjdko2K1JHWkxJZW9MTm13WUpE?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c44b329-5942-4475-eafc-08de179a572f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 09:54:39.0325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+V3PVyh+0q0gtOscGFbmt5FqETRsHNz4P2pbhBPb0zz5oWlM8esRSWIvbA455TEcLhgOBx1/Fo5pR+QJKzAlFdJb/L2GqlIkjOBPXH2l2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8260
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 09:54:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7910



On 10/29/25 7:44 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    (man, this methodical review of the docs is taking longer than i
> thought. *sigh*.)
> 
>    here:
> 
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#using-virtual-providers
> 
> someone reading that section might come away with the impression that
> virtual provider references all have the form:
> 
>    PREFERRED_PROVIDER_virtual/*
> 
> all of the examples at the end of that section certainly bolster that
> impression as they all have that form. but what about things like:
> 
>    PREFERRED_PROVIDER_udev
> 
> from here:
> 
> https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/include/default-providers.inc
> 
> there are quite a number of PREFERRED_PROVIDER examples that do not
> contain the "virtual/" string, but certainly seem to follow the
> pattern:
> 
> PREFERRED_PROVIDER_udev ?=
>   "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
> 
> philosophically, it would seem that if one followed the pattern, this
> would look like:
> 
> PREFERRED_PROVIDER_virtual/udev
> 
> but i'm not going to suggest changing that, just wondering if this
> example qualifies as a "virtual provider" like the rest.
> 
> rday
> 
> p.s.
> 
> what's with:
> 
>    PREFERRED_PROVIDER_opkg ?= "opkg"
> 
> what are the alternatives to the opkg command? apk?
> 

https://git.yoctoproject.org/poky/commit/?id=8bd2f3891320628b490c4035124bf8704ef49c45

