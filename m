Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA67EE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:30:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.74])
 by mx.groups.io with SMTP id smtpd.web11.107743.1733765440038809228
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 09:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iUEdVlw+;
 spf=pass (domain: cherry.de, ip: 40.107.21.74, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAhC5l7OJo1rFsHQCDGd75MSwFUctYNSQmhLsXHpXKEFlH+eSqdgXvgv9MPjidONIVkOiwRpjEGgIOQrviGHXcubRAoNgO515R9UKWZE95GhySsjyXwlgMXorx96BtOD/D1vaHaoKajlR4aXwpkJc/4xrM+0vWrnKF6plqi/V9XrMTxY0xXcgX8BynJUnjnAKHubz1u83ntJIaHKnqNTRAcNspP14fFLPzE0Iy3MDSw/7ecS3T5VdFJzuq6ANLRzhB+gWVJ9cPn9KkXq5WWNE8r8uvRJMhRS9wqPPVGvog8MpSl7hs0wt98PB8SU5eW2p62RsedqSSQNiOuguL4fdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYk2CxbllpncCeary+68/n39Vpfdf+jtgMdsvk7pYk4=;
 b=tdCAK0Q7CZOIxT02QdDriPdvlnUqCZWvYp2t4wRMQvsHC1C26ya08xcfOYjDA1WPZpQT2X5srWCNpl+Gud2YPNzIhkwVhfxZR1xtsLTnV6Wh6J2as6dxRlyAie9A5meyRcNqiTkOpl0LCJjHzcFHO1jERgCicyU8S+BjkNgBN+G3MMXPKL7OV8h044TSOefQPaC62Fj3ptbmYoKRvG2mmU9mm162ZdhaBbt3OMxi0K1EW3Oi1lHUvHw6zNLGTeXTJ63CQbiLJwX6+TBx+JHmjOMbD4V30i40BPdEPNW1nCPzPoThdSbpQIXTk68xkxaarpTEmR5lk8FylAcgVV1POA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYk2CxbllpncCeary+68/n39Vpfdf+jtgMdsvk7pYk4=;
 b=iUEdVlw+aSkne7bthZhVGdxXP9dx4v+exx5zgRTqV0mSmD29QcUEi4mq3g+bIWSCdNz7Z9knwFRiCBtgY/LdE0/0WB1WM81oUd6lSNM0wdmhKGW5lP8FpvjrpiMZ+oSEc6MU8/1oZcjIX6yaiqOUnyvZfjBXDDXXJIiZeWT93L4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.17; Mon, 9 Dec
 2024 17:30:37 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 17:30:37 +0000
Message-ID: <7f1b7bfb-fb9a-470a-9e83-a4342cca676e@cherry.de>
Date: Mon, 9 Dec 2024 18:30:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2 1/6] Gather dependencies in poky.yaml.in
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-1-1d9b4063476f@bootlin.com>
 <bbe9f42c-e716-44d7-8930-71a44c4c9a36@cherry.de>
 <D67BY6ERMIWY.5WMB41MN18TJ@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D67BY6ERMIWY.5WMB41MN18TJ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0355.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::8) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 8caf155f-d232-488e-defe-08dd187731ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cXltTjFtcllYRWIxOGlJdk1PZEk4QzFQMXQzeWQxM3FjSFA0QjdhV2IvSFlr?=
 =?utf-8?B?OFd0VURiT252Si9MTThBb2hHV1ZVUDVtanpET3NtR3ZaUUMrRTFSY3pKQTRF?=
 =?utf-8?B?eFNYK3JIV29iemhOTVc4Zk5tMXFheVpST3ZsU3R3SnE0bzVPWFJwRlVFcXgx?=
 =?utf-8?B?Ym1qWDdEY2ZSckVIVmNZQWFKS0Z0UW9NcjVQRzhNYnBmOEEzemROTm9pZlBM?=
 =?utf-8?B?dU12YjVVdUZmcjU0RWxZWkx0eFQxY2xtL1J6bUc3azVYVmtBZFRBR0dDWUY1?=
 =?utf-8?B?OWgyVzF3SlhlUEZ5SkE3Tm0yTEpoUld1UG9ZWm42OVpkdXVLWjRxR2JUUk5p?=
 =?utf-8?B?a05OcytoZ1hhV0hBNTEwYUJwZjNFb0NKaE90a3Z0VkVqbEwrZXk2OXo1K3dN?=
 =?utf-8?B?bUxncGNGOVZVT2pnMXlySFRzS21tckNmYjJBMHVBNnFFSU1NdDB4V2RHeThK?=
 =?utf-8?B?ckh0cTk2WkhobGNSd2pXTnZSeFB3ek1MYmJxV1BlZmFLWm13bVFMRzBzT29w?=
 =?utf-8?B?QVNBVmNmbE5UYms5OXEycmhJSitodjJPRElNYmhReVUwdE5veWhZUmMzcExw?=
 =?utf-8?B?Q0g4RVBVbWxtc1RYNXpHVEhKYWdKdE5UWWVpclMxaWdGd1Q5WTRYRTFDVWxi?=
 =?utf-8?B?ajB5a1g5OFhPSDd6alFZeGt6cEtGQk56MVR3clVSSVF5Qjllb3ZDTkxVU2hj?=
 =?utf-8?B?d2FxbDFrUERhd1dVRzNEbys2U0hTY1RmOFo1VnBBTnAyVW1ldUZlRitzS0RP?=
 =?utf-8?B?K1BmcmswTzVXVjZtaWx1S1VTWFo0emNaS00vSlczUlhUa0NKUkcvOFZCNkd0?=
 =?utf-8?B?YmlLVWw1QVk3dm1lcDJXUWR4aEg0N29xMGd6WDI2cEovT2NMNXVpMU9xYnc3?=
 =?utf-8?B?Sjh5UVV2bDNjeUkrY3NDczdYNnpyaDRzd1Jxb1lIT0lKQ21TVnptaTUyTzZi?=
 =?utf-8?B?elIxdFpadmFEbHhUMDdZL3Ruek1lSTJtcE9vNUVFR3pKQXB2TlZKSlJoZmFp?=
 =?utf-8?B?NmtiSnk2Rk1KWWhxOC85Z25BOGpQRmNqeHNOMjl2Z3dQNUhzRTZtNGd3VTlz?=
 =?utf-8?B?c2RmWFYyRUIrd0hPSEs4V3RsRkpjZ0l4NWMvRXYzTmZDSzZEczQ5WVU5cGtI?=
 =?utf-8?B?eFFqeCtVUGllUHoxVTg2UjFaR2JwZlJsQUlWUE4yVythU0xldlNpU3ZSWTNs?=
 =?utf-8?B?RkFwV3Z1WnhSbHZBZEk4dENoejhOZWpqamJCejRKQmIxWTJYTE5ObTNmSkNF?=
 =?utf-8?B?RUFTV1g3VVhwZmJ4QU02NnJQTkZkdGdTR0xocEFSaW82c0F4aWJuOVVlcXY5?=
 =?utf-8?B?bm81amNpR09jYTRmejY0WnF3NllETDFLYk9DLytZUDFoaEh1bTNnMWNsUXFK?=
 =?utf-8?B?L2tlTVl2ZEIwVXdkNGxzQWUySGZVUEVqN1A2MzdRVVFkdE9ManVWQ0YxcFFn?=
 =?utf-8?B?VU9qbUxSd3FRVERMQjY0Wm9JL0NhVk1WRmYzckFCSC96eFZ0U3p2SGdRMXRZ?=
 =?utf-8?B?dmVtbVF2QzJzM1BSWWdTd094My8zb3h3cEF0L015aVdPamFQbVJBMndMQVB1?=
 =?utf-8?B?MGFHQkQrdVc2RmhlOGVzbFNVWElUKzhiUk03aDJXUGN6Y1FlZk5Jbzl6UGcx?=
 =?utf-8?B?YlYxOTJ2RkhLcVBDSW95bFFXcHNSOFArNDMrN0RIUTljNVlmbmY2UENETWEv?=
 =?utf-8?B?MU9oQnlxOEFuRnphR1owYkkySXdXUmRPRTJhSXNJb0d3VTFNalFEU1hzaHdu?=
 =?utf-8?Q?/XizVb2OnDfMb/bt/8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QU93Zis4RVQ5cmo3a3ZUOHpZSmQ3Rnh4cVkzSnJpWjNqWjBXbGZFdjlVY3Rp?=
 =?utf-8?B?Z3BPeVB1cnZhelRRWHJKSlhyRXdPTTlCeEkxUHpkL2hYUGZoQW41OTBMZkdT?=
 =?utf-8?B?T3lqZjhmRWNrd25hMUZwUXlDWUZuRU45dUlOU3EyVmNEQUowVzdqNjBnbW55?=
 =?utf-8?B?cGZRNlVsRTFxQjkzaHJJOG9QWDlpSmk0T3lrNjdwaGI4TE1weDZtVWZtbm1w?=
 =?utf-8?B?ZzRzUTBKOWM5M1lhMWxxT0tYNXFxZUtlb25kMFJ2YXhQV1o4VmxuWEpoTUlq?=
 =?utf-8?B?OWF2UEhhdHFrM0g1RTRGRVBLZmtTVTVVNDBXeUZ5RTJ2c0YrNDZRMEMwSitt?=
 =?utf-8?B?TGJZUWJYZTVCUG5KSnRWTEVXZGRGeEJSRG11VWVsOFh1bWxxVGRVSXpqdzVS?=
 =?utf-8?B?L0FsUVFNNjh1K2tSK0x4dmJLbVdjNnhqcVF5Q0I2bGR4RVdQNHdwQUp4SllY?=
 =?utf-8?B?dFE5Q29LV1pFbkRXbWpSMGhkd0trWmg0MHpZWVZmOFFySGIvWlpIU3FNUlVk?=
 =?utf-8?B?NEVkaXpmNGpING81RVExSXljWWN6cHBRMkxHZFZvL2JmZjEzR3hjaTErUThH?=
 =?utf-8?B?SVp2bmFzSG14eG93T0dad3Q0cjdneU5Fa0NXRG9tMmU3ZndhMTJkdHhnSENv?=
 =?utf-8?B?MmZGcld0bkhXNHdNUWdzRlFlSi9Ua3BjelpMNW9MZXpPSUxrdnhzbmpuZ1lB?=
 =?utf-8?B?R1FBblV4d1hoWXpSNXJyMnRzbmNPcFcrSGdzT0gxblFSTVAxTmRrYW5FOElN?=
 =?utf-8?B?bnRybkNPLzRPK0piM01wTEt4V3VIT2NKelZyRWJ2eVlLNmN1R1hxQVlydERo?=
 =?utf-8?B?NFF5dXk0YjZrUWFZUWFpMm5SMG1EQ0ZYcklmb2R0SFF6czdpd2VzRWdSZDJO?=
 =?utf-8?B?cURVM1dLRDcwZVdxT001aWxGWXJQUFQ2emNaMlRxdlFpK1czdWNSMkU5Uy9p?=
 =?utf-8?B?Yld4YllUUDg2ZndvMThyK2h2b1JCb0xOYlhpN05vR2hXWmQrZnE4cVpSSFM5?=
 =?utf-8?B?MW5DMzJhVm8zdWp0aFYvck9hNWVNL2ZYTVF0R2VkL3dBMGZsSjJydVdPejhV?=
 =?utf-8?B?WTU3Zk9UYzM0MnkwamF0c3E4NEdWN3pNQWhmRzBUMTVxU0lPRndMSTNtUWRG?=
 =?utf-8?B?ZjF1dkdzdWtuTUZHVkkzVSthWnpEQlNzR3pXbzc2dXFIVkJNYk1jeU1VYzJs?=
 =?utf-8?B?MkFKUUNTbEJwV09JNURUQXNZVjJ4TzBBZ1hFbHpjS04ydGdsWUJYK1dWdVh5?=
 =?utf-8?B?VmgxTldoUFdua1NMQS9sNjFUTzVlQk1WeXBTRnBIZndpNGY2L2Z2aURzSjk3?=
 =?utf-8?B?Qi80cFlxS3grUnhGcEtPWWVhbXdqbUZxelVpRjBabndyR1VMWlRpOEszcXQy?=
 =?utf-8?B?SnV0SE8rZ2wrZG1HWStMUmVXYkxXeFRhTjFKZ1J6RzBCaDBEcWY0SEtzbkQ3?=
 =?utf-8?B?YlZvUXUwTFY1RE03UmpRMk5pUmNKZ3hYZS9PNWRUM3JWZHhLOW92TFdudTBl?=
 =?utf-8?B?aWR3UWZDYXdLKzhSMGtlOFpIRjJCNmQvVlJnek9jRms4Vyt4R21tSFBlcWtI?=
 =?utf-8?B?b2lBLzhIVms1dkpLcmEvRWtKTzY2a0QxRitaUThDVnBabEV1RHRoK001ZHJH?=
 =?utf-8?B?QXdKeGJBU01BNWhLdzNZYXcveHRzTHNuRmJzVGNnckVqZnhrUXQ0UXQ2KytD?=
 =?utf-8?B?OXNVREs4aGZqbTNNZEtibDZoRkJSVEhSOVZEbVI4S1Q4QklsdTltSEE3RDAz?=
 =?utf-8?B?c1hYbEkrc1FHaHJ6YTMwQzRrazliUU5KeDNmTzl3amFpVG16VUgrWitWbExI?=
 =?utf-8?B?YUxDTXYrQkZ5dTZoS1l5RVUxQ1oxNGh4TDl4aDgzZmNOazhKanJVbnJvS3J5?=
 =?utf-8?B?bmN0YnpsK0MvQmZpa1ZJeTZxbW5WTlI4SmR0bStuQktkYzJDNXBrNmNVMStV?=
 =?utf-8?B?MzQzUzIyTEVYbnMyTWJuZm5GejRYVS93YlN4MGwrbEltc1l5V1E2c0p4cDBP?=
 =?utf-8?B?WjJMZHRaYWxJdXN4cmNWZkpaZHMyczRrVUlRU3ZjTWY2cUdLY2ZXL2xVaDBD?=
 =?utf-8?B?NmViT1JqREtNUUlnZkwzNEl2T1M3elNPQ01LMFZFRkNaU0RlVFQxbnZPbDIy?=
 =?utf-8?B?RlJrUUJSeTJ1cVJBcDVaZFJFN1BBc25vYnM5RDQ0ZkVLWno3WFVmemhKZWhJ?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8caf155f-d232-488e-defe-08dd187731ae
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:30:37.1261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EW16FpSM9FUAiIh2xlij4l4xWDZP90ZKTi6day94gJCTBgg0Z7tUQrLnqV70oyph9mNKP3iOVP8wS+X0BVMIFa7H6MQL7YqKkGQ3hf5q+sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 17:30:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5907

Hi Antonin,

On 12/9/24 6:02 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Fri Dec 6, 2024 at 2:51 PM CET, Quentin Schulz wrote:
> [...]
>>> +FEDORA_HOST_PACKAGES_ESSENTIAL: >-
>>> +  bzip2
>>> +  ccache
>>
>> I'm wondering if this is really required?
> 
> I'm not sure either. For now, this series focuses on updating the dependencies
> for the recent PDF additions. Optimizing this list will require more work, and
> is related to an open bug on bugzilla
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=14873).
> 
> I'm trying to get a clean base and a helper container script in to make this
> easier for me and others to do this (adding/removing things from the list).
> 
> But I will definitely go back to your comments as you are indeed pointing out
> things that might be unneeded now, indeed.
> 

Not a blocker for this patch (or series), one thing at a time :) Just 
wanted to raise this as I went through the list and it seemed odd to me.

Cheers,
Quentin

