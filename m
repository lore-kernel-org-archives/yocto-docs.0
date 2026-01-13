Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24999D2D111
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:41:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60257.1768315307349546634
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lWY6iY9I;
 spf=pass (domain: cherry.de, ip: 40.107.130.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDyoZWGbM6qaS09gMXgeK94HLY8gVY+FO0g8qGwPi/l/3b45lVrFnmP7/UwpeM/4HWRaBMqowEU9E5PeHqgd2+tPLI3MxrD+Z9s5NIANiLUBgKS02Qwb1YYD7JHzrYLvIZBpbUfTAl2GXNQ3mWL+xMkQ0waE1tfniQQyA0kTSq13U7osU3hyKMjPWpjbdkK+57ioIcDtAQihGSQUpu0gOHIaC8cPB5T0Pk4Fl/eIGPX2UnptIHeKZ890vBEt3dzhgRLB04tJS8qV1aTyA7yO7kFydMyp+u5C4rUzUmPqa/53tTUuCrKY1Vo3rYSccQzvM/H5f+zq8Zo3oJZzDvHotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQUZRHOAPjeAbwAm3hDAeLciTVclw2OoiYamr8MsjqI=;
 b=S3HkxywN86Z9cRjIzRpz6sxSnZ8RnthnaC1GzI+FbhmDE2x3fENER7YjsnpcQ55aIgQBGj3QrenJb5EhMhpMNTxmztQRCDM25pnUXBq+TsRIp19JB7RrRIRSdxDCsP5JlI+TXbUAr9A5u+5UqYAYE19dYCeKBdK9UXGkiJH+k1BPBXtAZNsX1AHnA5E4oAKZMlfakD4vFGPK7GpiDhKeKCAP2ylXTVkp33ELK80mhhxtJKRpJwSO02k1dr7ou+gBb3w15COKTEbcB8axzaQbotU/LTT/aMm6ew7tyelTJoD3JlNtY4+EHrRSohUdiESEWuXF/Si9XwbzE/18SrCzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQUZRHOAPjeAbwAm3hDAeLciTVclw2OoiYamr8MsjqI=;
 b=lWY6iY9Iof4SYTYQqUEMofbyN/tuG2hmji2hqJfW2SqlpL0DDSjOQugpXZYHRHd6xFl2BS6KZ3vIqvwn2dX7qaWMIgkSYfG945v4b7RGCcKYZu82gPFa7Gos95Bsa6YGS8qemxowsJd0zAmTXc+6tVqDp6849SVGN55VbBBEgdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBAPR04MB7302.eurprd04.prod.outlook.com (2603:10a6:10:1a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:41:43 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:41:43 +0000
Message-ID: <c1558d5e-c1ed-49a0-b0d2-8761c47d3c25@cherry.de>
Date: Tue, 13 Jan 2026 15:41:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 32/53] toaster-manual: remove obsolete poky repo
 references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-32-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-32-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBAPR04MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc02e19-112d-4a31-e1c0-08de52b1de78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|7142099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TVhjU2lMa1duNXlFbFhYZFo0M1ZmWU45bldlSVhHWXlpQmEyMGhBSlRvUGhm?=
 =?utf-8?B?TjRSRTloYk44ZDJsdGhvOHNOVGhVYnMzcG04R3dUeWNFdWFyVDRCelY1QmpK?=
 =?utf-8?B?cFVoajJvbDlBRXJNOUMzNGIyS0ZiSFJLNTRBWi9UcUtacjNZT3FGeG1WcWtw?=
 =?utf-8?B?bWxjRVdGOUZrZGMzaUZhKzVwUmI4NjZjOTVpT3RnYmdudG81VUNkQWg1TWI0?=
 =?utf-8?B?d2RJQXNDL2xpZU81aFI0L3pNcVdqNllkNmMxbWFoSi9xM21XL3JFL3hRK3Vn?=
 =?utf-8?B?RUhray9DaU5SbEhKdWhxOWFUVHVXeCsvQ2ZvZmNialpNTkNVU3l4alJzaHRo?=
 =?utf-8?B?aTRSMEpqWGJmTXNKbm43R0FHUGNYVVcwcXduMjdjejcvUzRpQmNrQldnaVZy?=
 =?utf-8?B?NmMzOHNxQ2Zua2tCQVRVY0hsWGh0SkVuTDEva3dXU2dNWUpxZWRwQUFLbGxw?=
 =?utf-8?B?enlxbHpoVVFQR1ZiSHBZTkgvS2NPSiszbUlwVHA4TzIrVU1oWDBPU2ZhT2d3?=
 =?utf-8?B?KzJBdkV6Y1dFZmt0K0cvQ3A5SFc1bDZhOVVTMFZySVN6YkF4Vi9nb3FKVEd0?=
 =?utf-8?B?ZGNQYzNXS1NHMnV0YTFQbU55a1pLMnJCaU5oVlBGMXVTQ09XNU1PY3BudHUw?=
 =?utf-8?B?OU15TnlHMFFlWXJQanJ1Vk9obVNKbUtheldXOHR6dlYxUVV1M01NdjROdGNP?=
 =?utf-8?B?TEsrWFBvSWVHalJQRXUyaG54UExqc00zNmFBa2hQVlpsMnR2Z2NIamY1NkNT?=
 =?utf-8?B?V2FvTmxYNTRtWG5udjVvaEcxS0VRdGZMSER1dmdQRnRSUFJUWEhXQkR5ajlU?=
 =?utf-8?B?cHZ0V25Cb2xmTHRQa2J1OG5VU2tIQjVDWGdGNG1ESk1rdmhPUGtpRW45aGcx?=
 =?utf-8?B?STBRWGtra1RyTFZJU1ppbHEzaDM5cTN1cTVTYng0YlA0NVRETmwvK2tPMUxO?=
 =?utf-8?B?WkRQVVV5N3AzYmFaNWtzYW5XWHZjblY3dm94VzJEWUtUUk9XbUZWTDJkbkVE?=
 =?utf-8?B?Z3htYmVnVXU1d0duYVdNTGViK3EzcExHRDdlRExZWWRZZDAxUkpXMzlvak5Z?=
 =?utf-8?B?ZlQ1M3k4YmpqekNRNFZqUGxFaThoSmFzWmFtVlZ4UktYVGhjUEsxNnQ0Ty9l?=
 =?utf-8?B?akU5UC9RRmx6aUJqZml6MXRyWHZPbW9hU2NFcG9FMDRHTEZuU0daR3Y3dnFM?=
 =?utf-8?B?S2dnRDM1SFovVE5OKzZhaDFsYWhWVmFWVXhtbnpYWDhGVGdvQWozbHBWRVIr?=
 =?utf-8?B?WXZQT1ZqSys2c0pHcmZVVUFRMGdVcnJDa0tVamlRZUEvNlJRK0FIUEdtL1VZ?=
 =?utf-8?B?L1dsTVEzZ3dpRllCMjE0S0d6bHV1a1ltTHgrYkY1bm5PSkdvQ21OYnp1dWEv?=
 =?utf-8?B?aVFkazd5TVgwQ2FmeVFVZWI2ajNCT0lhcmVVRjI5eUxHSCtUVjd3UUF3UU1D?=
 =?utf-8?B?MFg1Nm9vejZVTjEzQmZOUzJDWEtsaUZTY3dvaDZRRXFDK1QzUmFZazh4VENN?=
 =?utf-8?B?WmFaVVRUeUtwaGNuYytvUFpKdUMzMVpJMkxJaWFVZk43MG9oMk4zMkpkQTlB?=
 =?utf-8?B?Y0MyZ2YwMG9aT01Rei9zMnZadFRsUk9JVllvczY3MEtEQVRSR3liSHJ4cUl5?=
 =?utf-8?B?alVsdFdxdkk5eG1mTzZUOVM5VkIrTjRBN0YxUVFROFcvdHNiMFRuSlc2NmZr?=
 =?utf-8?B?dkFOR2xUdklsTnRTVFljWGZHeDJrN1F6R3p6M2pzS1N0ODl5ZGd5ZjluTy80?=
 =?utf-8?B?cC96ZSs0SmF5QkFsMVB3OVFDQ29wbHpZNXlocWtXM296UUpIQWhKV0ZPNVRF?=
 =?utf-8?B?RVpmYSs2eFVtbWV0Um9MUHVLaGZkQUhaeVo0MnBoYzhudjArNTRydXpNUndH?=
 =?utf-8?B?NU96NU9zY2taY29yZGtXWUhtbnQwNi82TEJ4Qnh0bkJVc0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(7142099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2t1WFFHd0ttQ0l1R0lGcWNuY2ZwK21qcjdBZTlMT0tlVGVSeVJwV3RDRUU3?=
 =?utf-8?B?cm4rcVpsaThTVmFQSzl4VE4zM1ZrK3gxVmQ2NHk0azNOQlhOUUlYL3pvNDU0?=
 =?utf-8?B?UTB3VTBuVjI0RzFTTHl1QldsWTFrblVuM0NUTlVJNklRUlJaMUQvbVNicTgy?=
 =?utf-8?B?NzNhakU1aG1GZnBVMXdzRWxxTUU3ZUNBSHV4dnhvTXp3c3dsZDZ4TlI5Y3Vv?=
 =?utf-8?B?ck9NZytwUjhDNXVKMjhjaWkwa3pkSWhFbDloZGljZkJIUFJ6T1pOUXJXUTRl?=
 =?utf-8?B?MGtzMkFpeXFlNk1sc1RGdWdZMDl2K3Z0TmRvaWFsNGZHRWdONDBFMCtqS214?=
 =?utf-8?B?ZUNKMTBHdndORGhmZjRoMHpxUS82RWtNVW5WcTEwcFhqZy9jSDhFSlVrbUh3?=
 =?utf-8?B?a1NPNlNFbzJSb2pNaXNJRjlJeldUcFJhVUphM2R0U3RDM1RnTjlvOGhBd01X?=
 =?utf-8?B?ZnV4TlNIckEyMnUyZkhGZ3JMWFhVU0hhWlNTSVo0NDR2NU40K2FFQnJuZHNo?=
 =?utf-8?B?YjllVDZrS2tVa0dlKzRPR20vK3ZhN0F4NnJVTDA2Z3lwU3A3emZXRXhFN3RK?=
 =?utf-8?B?TUpLajJTQi9JWDVLWTFXd1I4VUdhek1jZjFPVjE4b2l4cXljTmJzcWovSnVI?=
 =?utf-8?B?S1JMZXFIMmF4eXZYUU9ybGRudVVyM1dWdlJZOCtYNXh0QklrdTV0VEhOU2Rh?=
 =?utf-8?B?cUljT1ZoZFZuTmNNMU5WS1Awb0RXSWdlMlcxVWNtZ0g3ZGxxN2JWS2FOdjFz?=
 =?utf-8?B?eUZVMUREdmNodGZkYmlPQU9nNGJ0MFpaUG15VGR2bWRwRjdHaElROWY0ajhz?=
 =?utf-8?B?c2lVR3ZuQjk2dU1uazdJdlg0eThtcDU0MFZYR0ExemZ3eXc5N25VREEwajA2?=
 =?utf-8?B?UUVVUlNoN0htVWhIbGNZYTJEeXNRa0RkY2plV2RJbTA4R1p5a2lETnR3WnlL?=
 =?utf-8?B?Z0g0bTM5dCtFZlFvQUhDWEh2aklibi9TellxRUg0OG5EQnF0TmZJYTJPZGlF?=
 =?utf-8?B?ak9GQVJxNmg0bDVQSTA4UWdqVXJWdGtwMGpWSnVlcUhpUThybzZydXpRMFFN?=
 =?utf-8?B?eG94Q1pObVVyVEdCQlBxZGJoUlVhajBVWFFRbldUQmlPQkZ3VEluOWJrSFRz?=
 =?utf-8?B?MjJoeGQ3dFBUN09zWGdiS2NuU0RkTFpBNDhkZXNBNW10UXpBWmlpeDFCcjZU?=
 =?utf-8?B?WVF2WXRYRHZuSlhjbWVEMU9adUVsVGVEY1Y2Z3RxcHY2bWVRbVFVaDhHWVRP?=
 =?utf-8?B?dEl5dDA4ZTR0Szc0akpRTXZJWlBIU3BXM2lKdng3N0I3TTRET3JESHdWVisv?=
 =?utf-8?B?OEJ4dlpSM2ljaUw5VnNxY3A2SmFRalJwajdPT1lsMytXL1JYVmMzRU83VzdH?=
 =?utf-8?B?SDM1QWJXNDBxMWxlWFJMMm5XbWtkeU9tSE1SNC96dHRmcTBQY3krbTUyanBx?=
 =?utf-8?B?RXN2L2JaWm9yM1RFYmpjSE9FY2FXdFFJUmhDQ09HMnlyQVdiSW1GMmxBZHRP?=
 =?utf-8?B?QWFuNlM5S3doS0hJQkhKVjR6UGIvNzhiU3RCZWJJd2IzZDFMUFREWDRVVk1w?=
 =?utf-8?B?elpFcWpDM3djZUtQZC9mSU91bFZqUTNkNlltZTBkWENBd3NUeWlQQUlpc1pC?=
 =?utf-8?B?K3B2TjJqMlNTMEViejJEWTNJbFBOOSthTVhxUURHdjdSVmhVVERidDFSUFdr?=
 =?utf-8?B?YzMrcFkxb2FPWDVHL0VQcEtuaU1iVURtTVpHaFo4R2dOeU16L1BYNVR3dXYv?=
 =?utf-8?B?d0pNY1hBZzJUeFdvbm1rUndMc2xYTit3ZThCWHd4VVB5M0RxOVhGaEtWTjFO?=
 =?utf-8?B?Q285MDNPdlZzT0htZnlZMTY1L1BrQUNpcUxwV1JOeENCQW9ueUFOMkNiVHIy?=
 =?utf-8?B?RUUzSjlxekIrdENpM2ZPdGI2ZTJLTTNQNU41SlVIS2MrdkNHQ242RU55Y1ZB?=
 =?utf-8?B?TWxGSlFCTXZSWUhlYVlqY0NzTU52QStOUUlMM2hLanY3R0VCWHczYjFLVGpa?=
 =?utf-8?B?MzIvWnNLYkQ0UEhZVmF1eHRBMDlJU3dHWTh1eUFoZkR4YnE0Y2RjanlVNFpV?=
 =?utf-8?B?SXlSN0dnYXU4OTFJV3J4R1hqUzA5WDE5OUdreUlnaEhUc0ZFUlVBVGs5L0x1?=
 =?utf-8?B?WjJuVkdCSXg3eExVdnlEdE1Mamp3R29lM0RIMDJWU3Era3hpVFdxUzJnenFJ?=
 =?utf-8?B?ZmxzaXFHQjVWYmlJWEFoR1U2SGtzVkhEc2tIOFgwMjRjR2g0cVRkR0F0Z1V2?=
 =?utf-8?B?T1NsUEtpcU0yR2pYMWVrMEl4SHdVN1M0RHBQV2hYQmw1RHkrbk43N09DZXRU?=
 =?utf-8?B?OTZ5Y2MvRXB6Vk11UzNoWVhma1htR2tiYzRSRHIzMHFlZ1pEbk1vZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc02e19-112d-4a31-e1c0-08de52b1de78
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:41:42.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnStQf0gNghwbexT9UI9E1x33nOuyFXgdpz0UN9lLTYCOuKGbgQ2ATQC+/iVxOOYGV6tyzEvBXK1+vdT0NXdhkkDMbqYCv3TKLO5lxzGSzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7302
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:41:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8521

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Adapt the Toaster documentation after the Poky became obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/toaster-manual/reference.rst     | 12 +++---
>   documentation/toaster-manual/setup-and-use.rst | 56 ++++++++++++++------------
>   documentation/toaster-manual/start.rst         |  6 +--
>   3 files changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
> index 3050b5d0f5..4dbcda37ff 100644
> --- a/documentation/toaster-manual/reference.rst
> +++ b/documentation/toaster-manual/reference.rst
> @@ -161,16 +161,15 @@ As shipped, Toaster is configured to work with the following releases:
>   -  *Yocto Project &DISTRO; "&DISTRO_NAME;" or OpenEmbedded "&DISTRO_NAME;":*
>      This release causes your Toaster projects to build against the head
>      of the &DISTRO_NAME_NO_CAP; branch at
> -   :yocto_git:`/poky/log/?h=&DISTRO_NAME_NO_CAP;` or
>      :oe_git:`/openembedded-core/commit/?h=&DISTRO_NAME_NO_CAP;`.
>   
>   -  *Yocto Project "Master" or OpenEmbedded "Master":* This release
>      causes your Toaster Projects to build against the head of the master
>      branch, which is where active development takes place, at
> -   :yocto_git:`/poky/log/` or :oe_git:`/openembedded-core/log/`.
> +   :oe_git:`/openembedded-core/log/`.
>   
>   -  *Local Yocto Project or Local OpenEmbedded:* This release causes your
> -   Toaster Projects to build against the head of the ``poky`` or
> +   Toaster Projects to build against the head of the
>      ``openembedded-core`` clone you have local to the machine running
>      Toaster.
>   

I've never used Toaster, but isn't that a selection? E.g. Yocto Project 
is for setting up like how it used to be with poky, and OpenEmbedded 
only with oe-core + bitbake?

I'm not sure it's as simple as removing mentions to poky/rename them to 
oe-core?

> @@ -277,7 +276,7 @@ release selection:
>      <!-- Bitbake versions which correspond to the metadata release -->
>      <object model="orm.bitbakeversion" pk="1">
>         <field type="CharField" name="name">&DISTRO_NAME_NO_CAP;</field>
> -      <field type="CharField" name="giturl">git://git.yoctoproject.org/poky</field>
> +      <field type="CharField" name="giturl">git://git.openembedded.org/bitbake</field>
>         <field type="CharField" name="branch">&DISTRO_NAME_NO_CAP;</field>
>         <field type="CharField" name="dirpath">bitbake</field>

Uuuuh... Is this correct? I would assume this is the way to find where 
bitbake is. But that's how it used to be for poky (where bitbake was in 
a bitbake/ subdir?), so not sure what there should be in dirpath for 
example (or if this code-block is enough?).

>      </object>
> @@ -513,8 +512,7 @@ at the
>   `Django <https://docs.djangoproject.com/en/2.2/topics/settings/>`__
>   site. However, several ``manage.py`` commands have been created that are
>   specific to Toaster and are used to control configuration and back-end
> -tasks. You can locate these commands in the
> -:term:`Source Directory` (e.g. ``poky``) at
> +tasks. You can locate these commands in :term:`BitBake` at
>   ``bitbake/lib/manage.py``. This section documents those commands.

I'm getting confused now as whether we should be prefixing the paths 
with the name of the root directory or not. Here since we say in 
BitBake, I would assume we should only need lib/manage.py?

>   
>   .. note::
> @@ -551,7 +549,7 @@ example that assumes default repository and :term:`Build Directory` names:
>   
>   .. code-block:: shell
>   
> -   $ cd poky/build
> +   $ cd project/build
>      $ python ../bitbake/lib/toaster/manage.py buildslist
>   
>   If your Toaster database had only one build, the above
> diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
> index a0c27499ba..6ca5d252a3 100644
> --- a/documentation/toaster-manual/setup-and-use.rst
> +++ b/documentation/toaster-manual/setup-and-use.rst
> @@ -15,15 +15,15 @@ Toaster`" chapter, you are ready to start
>   Toaster.
>   
>   Navigate to the root of your
> -:term:`Source Directory` (e.g. ``poky``)::
> +:term:`Source Directory` (e.g. ``project``)::
>   
> -   $ cd poky
> +   $ cd project
>   
>   Once in that directory, source the build environment script::
>   
> -   $ source oe-init-build-env
> +   $ source layers/openembedded-core/oe-init-build-env
>   
> -Next, from the :term:`Build Directory` (e.g. ``poky/build``), start Toaster
> +Next, from the :term:`Build Directory` (e.g. ``project/build``), start Toaster
>   using this command::
>   
>      $ source toaster start
> @@ -112,8 +112,8 @@ This example binds to a specific IP address on the host's NIC::
>   The Directory for Cloning Layers
>   ================================
>   
> -Toaster creates a ``_toaster_clones`` directory inside your Source
> -Directory (i.e. ``poky``) to clone any layers needed for your builds.
> +Toaster creates a ``_toaster_clones`` directory inside your :term:`Source
> +Directory` to clone any layers needed for your builds.
>   
>   Alternatively, if you would like all of your Toaster related files and
>   directories to be in a particular location other than the default, you
> @@ -124,8 +124,8 @@ causes Toaster to create and use ``$TOASTER_DIR./_toaster_clones``.
>   The Build Directory
>   ===================
>   
> -Toaster creates a :term:`Build Directory` within your Source Directory (e.g.
> -``poky``) to execute the builds.
> +Toaster creates a :term:`Build Directory` within your :term:`Source Directory`
> +to execute the builds.
>   
>   Alternatively, if you would like all of your Toaster related files and
>   directories to be in a particular location, you can set the
> @@ -155,8 +155,8 @@ superuser by following these steps:
>      is the :term:`Build Directory`, invoke the ``createsuperuser`` command from
>      ``manage.py``::
>   
> -      $ cd poky/build
> -      $ ../bitbake/lib/toaster/manage.py createsuperuser
> +      $ cd project/build
> +      $ ../layers/bitbake/lib/toaster/manage.py createsuperuser
>   
>   #. Django prompts you for the username, which you need to provide.
>   
> @@ -233,17 +233,21 @@ Perform the following steps to install Toaster:
>         $ sudo /usr/sbin/useradd toaster -md /var/www/toaster -s /bin/false
>         $ sudo su - toaster -s /bin/bash
>   
> -#.  Checkout a copy of ``poky`` into the web server directory. You will
> +#.  Checkout a copy of :term:`BitBake` into the web server directory. You will
>       be using ``/var/www/toaster``::
>   
> -      $ git clone git://git.yoctoproject.org/poky
> -      $ git checkout &DISTRO_NAME_NO_CAP;
> +      $ git clone git://git.openembedded.org/bitbake
> +
> +#.  Checkout a version of :term:`BitBake` matching the current Yocto Project
> +    &DISTRO_NAME; release::

Where do I find this information? **I** know I can get it from 
https://wiki.yoctoproject.org/wiki/Releases but we don't usually 
recommend going to the wiki because it may end up unmaintained/outdated 
(though if there's one page that is rarely outdated for long it's this 
one :) ).

> +
> +      $ git checkout &BITBAKE_SERIES;
>   
>   #.  Install Toaster dependencies using the ``--user`` flag which keeps the
>       Python packages isolated from your system-provided packages::
>   
>         $ cd /var/www/toaster/
> -      $ pip3 install --user -r ./poky/bitbake/toaster-requirements.txt
> +      $ pip3 install --user -r ./bitbake/toaster-requirements.txt
>         $ pip3 install --user mysqlclient
>   
>       .. note::
> @@ -253,7 +257,7 @@ Perform the following steps to install Toaster:
>          manager to install the packages.
>   
>   #.  Configure Toaster by editing
> -    ``/var/www/toaster/poky/bitbake/lib/toaster/toastermain/settings.py``
> +    ``/var/www/toaster/bitbake/lib/toaster/toastermain/settings.py``
>       as follows:
>   
>       -  Edit the
> @@ -298,9 +302,9 @@ Perform the following steps to install Toaster:
>   #.  Get Toaster to create the database schema, default data, and gather
>       the statically-served files::
>   
> -      $ cd /var/www/toaster/poky/
> +      $ cd /var/www/toaster/
>         $ ./bitbake/lib/toaster/manage.py migrate
> -      $ TOASTER_DIR=`pwd\` TEMPLATECONF='poky' \
> +      $ TOASTER_DIR=`pwd` TEMPLATECONF='poky' \
>            ./bitbake/lib/toaster/manage.py checksettings
>         $ ./bitbake/lib/toaster/manage.py collectstatic
>   
> @@ -322,12 +326,12 @@ Perform the following steps to install Toaster:
>       directory is created on the file system. In the example above,
>       ``TOASTER_DIR`` is set as follows::
>   
> -       /var/www/toaster/poky
> +       /var/www/toaster/
>   
>   
>       This setting causes the Toaster :term:`Build Directory` to be::
>   
> -       /var/www/toaster/poky/build
> +       /var/www/toaster/build
>   
>       Finally, the ``collectstatic`` command is a Django framework command
>       that collects all the statically served files into a designated
> @@ -380,14 +384,14 @@ Perform the following steps to install Toaster:
>            </IfModule>
>         </Directory>
>   
> -      <Directory /var/www/toaster/poky/bitbake/lib/toaster/toastermain>
> +      <Directory /var/www/toaster/bitbake/lib/toaster/toastermain>
>            <Files "wsgi.py">
>               Require all granted
>            </Files>
>         </Directory>
>   
> -      WSGIDaemonProcess toaster_wsgi python-path=/var/www/toaster/poky/bitbake/lib/toaster:/var/www/toaster/.local/lib/python3.4/site-packages
> -      WSGIScriptAlias / "/var/www/toaster/poky/bitbake/lib/toaster/toastermain/wsgi.py"
> +      WSGIDaemonProcess toaster_wsgi python-path=/var/www/toaster/bitbake/lib/toaster:/var/www/toaster/.local/lib/python3.4/site-packages
> +      WSGIScriptAlias / "/var/www/toaster/bitbake/lib/toaster/toastermain/wsgi.py"
>         <Location />
>            WSGIProcessGroup toaster_wsgi
>         </Location>
> @@ -419,16 +423,16 @@ Perform the following steps to install Toaster:
>   
>         [Service]
>         Type=forking User=toaster
> -      ExecStart=/usr/bin/screen -d -m -S runbuilds /var/www/toaster/poky/bitbake/lib/toaster/runbuilds-service.sh start
> +      ExecStart=/usr/bin/screen -d -m -S runbuilds /var/www/toaster/bitbake/lib/toaster/runbuilds-service.sh start
>         ExecStop=/usr/bin/screen -S runbuilds -X quit
> -      WorkingDirectory=/var/www/toaster/poky
> +      WorkingDirectory=/var/www/toaster
>   
>         [Install]
>         WantedBy=multi-user.target
>   
>   
>       Prepare the ``runbuilds-service.sh`` script that you need to place in the
> -    ``/var/www/toaster/poky/bitbake/lib/toaster/`` directory by setting
> +    ``/var/www/toaster/bitbake/lib/toaster/`` directory by setting
>       up executable permissions::
>   
>         #!/bin/bash
> @@ -436,7 +440,7 @@ Perform the following steps to install Toaster:
>         #export http_proxy=http://proxy.host.com:8080/
>         #export https_proxy=http://proxy.host.com:8080/
>         #export GIT_PROXY_COMMAND=$HOME/bin/gitproxy
> -      cd poky/
> +      cd /var/www/toaster/
>         source ./oe-init-build-env build

Is this correct? I believe we need to cd into openembedded-core for this 
to work no?

>         source ../bitbake/bin/toaster $1 noweb
>         [ "$1" == 'start' ] && /bin/bash
> diff --git a/documentation/toaster-manual/start.rst b/documentation/toaster-manual/start.rst
> index 2d6474852a..ed7b0e1644 100644
> --- a/documentation/toaster-manual/start.rst
> +++ b/documentation/toaster-manual/start.rst
> @@ -25,10 +25,8 @@ Establishing Toaster System Dependencies
>   
>   Toaster requires extra Python dependencies in order to run. A Toaster
>   requirements file named ``toaster-requirements.txt`` defines the Python
> -dependencies. The requirements file is located in the ``bitbake``
> -directory, which is located in the root directory of the
> -:term:`Source Directory` (e.g.
> -``poky/bitbake/toaster-requirements.txt``). The dependencies appear in a
> +dependencies. The requirements file is located in the :term:`BitBake`
> +repository, (``bitbake/toaster-requirements.txt``). The dependencies appear in a

"bitbake/" prefix or no prefix, that is the question.

Cheers,
Quentin

