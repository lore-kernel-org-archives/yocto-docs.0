Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535FCC87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 13:10:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.17])
 by mx.groups.io with SMTP id smtpd.web10.18881.1753449042186524635
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 06:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=j9Dgbu+Y;
 spf=pass (domain: cherry.de, ip: 40.107.130.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQRsnyuDFu9EE63QmR076fZpfxNFh7W/iY++oklWKr/q7ccZJwHWlK/DmrWNH2Wt0yxIlBBrbbrkUtjFE5EPg81V03Nh8KVFISuImFiPeCnB0dgVqxWk9WgohE1XGOlZjj7Qx9dtddH2CT3fWrMkG9F+dxJvk1XBU5MQ8PNllkXUJrcgBRODIJMcYjGv6/89KLcL84fmxtne5CMjUt/+ReZnQSSubsMkIsm7gazCtXF5mATg8qdDgghBnMF28g37CdN3GGZYgnHGM1GECuGUSqQYX+DXbgORpiB07Vp7gp2E8NqbVj6f5QDIGu736fwcrPqzRsgwaX/3we6MCUw0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3o4+XcCSVJRuNPmbHnm2mWfXImvWkDYjzfxV2WzSWo=;
 b=xZrU5nP7kYRwwVmKPCgNT4HWLt1QuWXYLr2TvSQWrXYvSCX7AtJiB4tM6q+d3FmZEAfbe0b9Ihf4Yxvr1YVqUwUtlncmN/MVtXBhy6cRCZ3NHGjt9rbuT4+0RZPmhqiiJMa6baaPfX7pfaTiSO0pp+y9fG8dvO3XMeGB4ZtE5JZR7JpZQbRmkdzjCWArGxd/jk6CAb0cwSzxrph8UfixW8+jh8Yr+ioTwyu8FZwCrGhG/tZOoX91UcN8+yjOJi4U7CgcdbDp5vnym/1ivmBGWWzDJXz0FrrEzRjyGwcDno0dOtyAn9asPM2FhiktSUkCs10i5H+Yjz+F3EMx+it8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3o4+XcCSVJRuNPmbHnm2mWfXImvWkDYjzfxV2WzSWo=;
 b=j9Dgbu+Y0ZJrzHqpertL7+styM9xGa/Scm10HnivhMOgUqVGH6nCyP+E4mSsyJUNhNs2KOjbWjZncMpM8b4u3L0VMTm6d1aY0OU/WryvFdO7tgzVrkBX2vTukW+UqDccO6kl7kft2qOxGel9GTO/MN+KMDSBPUvnAGWNz3BBLSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10525.eurprd04.prod.outlook.com (2603:10a6:102:444::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 13:10:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 13:10:37 +0000
Message-ID: <8c608b36-f81d-4dfa-b5b3-b75a33f86f19@cherry.de>
Date: Fri, 25 Jul 2025 15:10:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] what means PACKAGECONFIG[...] = ",,,"?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <f29a37a8-e752-d173-283b-f0730b8f84b1@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f29a37a8-e752-d173-283b-f0730b8f84b1@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10525:EE_
X-MS-Office365-Filtering-Correlation-Id: abab65e4-4241-4ad7-56c3-08ddcb7ca5ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TnZZMk5DYms3UER0bC9MYitSUjcvbk4ya2tZUUxTOFJUY1NkZEJaSUdrMGk5?=
 =?utf-8?B?cnc1Yy9tV0hSMGNaVWNuVytpRXNJcjFFNW5LN2FMdWdaUk85L3pDY2dRTW5H?=
 =?utf-8?B?VHlFSHRsZVJuNVJqbXpoZ2xsUFJ0ZzV6TS9XZE9CbloreStOWGZvMkxERWg4?=
 =?utf-8?B?Mzg5OE9GYXl0YlVDa3NYbEhKQ3Y4R2d6RlhPZU0xanhmQ0dTUUtuNUF1MG03?=
 =?utf-8?B?MWpTSGtEaHlYd3lnZXNTYlAxaU5QQWZReXFuaXpldTVudFdiRkl6MlRTbi9C?=
 =?utf-8?B?dXBiRnpBYS9KSzdPaDFFWEJodXhCdXF4KzQ5UTZ3NW9kcUw3a3JoZkhaKzFl?=
 =?utf-8?B?aUM5WHRKMEhrVWlUWXNQUkF1cXU5bjhodDRJbFZ3Q3VZU0QzVFJzUFMzbEFq?=
 =?utf-8?B?TFlNbjBHNVVjSS9ZeTNZRHhQYjFYb3FaelZrUkZjL25DZlc4L3FMK0t5WlhE?=
 =?utf-8?B?QzdtSUgrOXFjb0lBUENjc1lPT1JCV2dmSXZWaFB5V0d5NWVlNEU3MnJkVmtI?=
 =?utf-8?B?RUdqTkV1b1FKNUhmZFVsYVBTT1RqbURYdndOdnJQcHJ2d1A2dzJxSzdHMEhk?=
 =?utf-8?B?bys4c1RQbENna1IwTzdndUVTNkp0T3duSE03ODQ1azlHNlBUZjlDQ2o0NEN0?=
 =?utf-8?B?UGxsWlpaMENkZ3RUR1BySHZwMXVPOGlnZWFIbklzOVg1a2d3eUdVWElYQml2?=
 =?utf-8?B?NjFoRUVMRStVaW9LTTFMSHVMZGMwOTVJQnk3ZEoxTHI4dXAyOHRyMDI4c1pt?=
 =?utf-8?B?ZGlhVEZrR1AyK2tFNkFVcGdaVUE0T0Rvdkc1OWVoMVozRXpBbFdrZEhLRXEz?=
 =?utf-8?B?QzNLTFgxWU5qQm5QQ1RnSkVvRGVTWXRrY2g2RlQ0NVZkeE5nTldQZGt1YUV0?=
 =?utf-8?B?Y0NpeHpicmNRTW0zQS8xZk1sRGVxdk0rckVWTGdqS3RCQkNuNXgvTVFNNDFj?=
 =?utf-8?B?aFRsMWVZSVhEQ2FHS2txL2xpbkE0aWd0V2IwbDJjWWtubUJ6TFFpU1IyVGl6?=
 =?utf-8?B?d25UMmc2SGVIay9OeFNsV3JVZGZyQ3pnY3ZJTHNZdlNNUHdXZnhvVXROUWdj?=
 =?utf-8?B?YmxUV3EwYnQrSWU0aC9yazZIbkpubklCdjJPRWFzYlE4YUpUekFHY2ZCTWJH?=
 =?utf-8?B?SmhJZjQxOUVpZWUwemZTbDFIWFN1Vmxpb1dpOWJFekorUjlRNUNWeUp1NDNQ?=
 =?utf-8?B?dVhIcGorUEtYUFI2aEcwUG1DZVhscmZOaFhFMUQwUm0rM05XNVluRkEyUGZS?=
 =?utf-8?B?SEo3VUh3Nnh6cUtibWl5bXl6WGVLcng1eEl0QzFKSkhyVXhmVUU1YlZVRnpx?=
 =?utf-8?B?Vk94ZnMvejUzanlzQnFDNlpvMW9YWUNLMGV6K0R3bmtWOVdxQ2lBZ3A0UGN0?=
 =?utf-8?B?MHFxdGpqNWhnTTF3ODZBR1p5SGIvbDRISWlLck96OTdZVDZWeDhhazhXLzNu?=
 =?utf-8?B?dDQ1eVlwWUJTN0orQ3RFbVJCSmdVVkd1cjNXbVZJR25zUENYVUF0NnRNTVU5?=
 =?utf-8?B?RWNCUGp4VUxXaHhFQWg0cmg2aFF0V3dHNTZxRkNEUjV4Y29Xc2hBNk4waW1D?=
 =?utf-8?B?VUJSRVg3M0J3MmhYYTgwYkpIb3BsT0xIdTkzVUdSR1VPWk9GeUV0ak1DYmta?=
 =?utf-8?B?TmhIb1gza3RCbUU2UU9wSkJiZVFHWE1JeEU4amJTMFpreUp1OWkvNHhNM3U2?=
 =?utf-8?B?QUk2VVVvR3JiZUlXN2ZmNTc4VkNYeWkwMGZIUmhTbnpCM3VHUHJVRXNjQVBl?=
 =?utf-8?B?MTJYSUhDYm5iUktGWjc3RVFrLzZCNkxvRGc2MnYwbG1LUWxtZng4Rkx1cWNR?=
 =?utf-8?B?MHhvZ0p4L2tTVFRrOUFTb0VYQWh0ZjhFMFdhb3c1N1JxTnl2TXAvUU9ubk1K?=
 =?utf-8?B?N3poai9jSkxKeGhjTXdORGQvejNJbTJDVTZ0czdTWjdsVkpNaHNMd3NIMnZs?=
 =?utf-8?Q?SDIt/OgPags=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0lGckV3eldOUEpjTFVMbUkvR0t1akJmZ052UTJRTzEwbWFmeXUxeXdjR1RJ?=
 =?utf-8?B?ZkNzUE9YNjFEdjNpZ0dicVNkMU55Q0kwWHdhbFVnM2tUVFM3aUxBWXE5clMv?=
 =?utf-8?B?elIwRy9PblA2cjk2WkxJU3NScFpUc1luOWg1S3RBMlREaGR6Tzk3OWlzN0pi?=
 =?utf-8?B?bFpkQjhzbEhOcktRaEVNcWFOUktVdE4xN2N3aXBwViticUhSYjlnRlJCeTE4?=
 =?utf-8?B?S0crbHRDQWJld2lYeG5PQ1R3ZkN1eHRnd2VHL0p5czB6ek8vVmE3dGdLY1Zu?=
 =?utf-8?B?OGVxSDVYdDk1cXBNMGFDMUg5dkxUL3NvTVBtUGR5MEJFbEFKaCtWa2lxaTNE?=
 =?utf-8?B?cnk5cU9mNjFjbWdEczRwOHhUdDRZZEdlVHcvdC9sQ2tPb0V1YkR4YVhCcHFI?=
 =?utf-8?B?d2ZXb1c5U2w3MTFDY2tscWprYnBhcnF6czdibklRK3VjSWVINVFlZUlPUExa?=
 =?utf-8?B?QkxKR29LVDQvOUdjdVFxTkEwdmhLalkwdjAyWDZJRjQreGUydWQ5Qk94eDAv?=
 =?utf-8?B?dzZkMEluTjNUbTE3RGJ0dnVJNUt0RnRIcFFmUzgrQmVOWXBLQWhhL3J3Q1N3?=
 =?utf-8?B?QzNzdGd6UGZkYnJHdktmRDlEMWwybnRHVWx5YmFueEloL1pMWGJaUlh0Mks4?=
 =?utf-8?B?M0VNVk80d1NSSDY2UjA3TmJOYTRBUXRzSS93b09iZnV6L0ZuZE1nT09DOFZB?=
 =?utf-8?B?YTFvTU9STHFyOXdsc3ZWS3VnZWNWbjJUYUltakdKcngzUmdjbVRNM3ZTYm1X?=
 =?utf-8?B?ekhUVXR4Y3QyUWVLRWh1U2ZSUnZGUForWjlLZjg4NzZMcFJHN0tLV2F1S2Fi?=
 =?utf-8?B?WnNpa2c3UmJGd2x0cCtlSkxtOXZhSHRUUjZQQWFTNWRzbVlvNThVandCamdE?=
 =?utf-8?B?Q1RpbTFWc1NyczRwNG4zZGNUTW1EZ1NQM1lBL05IbC90YW92SkRnU2dXOUFT?=
 =?utf-8?B?ZFowYlZCcVhCUnlNazFBeTVzN0dFemM2MlViMFkwSTIrUXNWaEFRYkVqbTNM?=
 =?utf-8?B?M3NaUmRqMFRzUEVkNXBrV3FGSGs5aS9NcEE5THVtcXZzTEhaZzJDLzZMR2tm?=
 =?utf-8?B?SmpXOC9uVDludmdLODNYdFhLczFWTGRETk4zd04wWWRsUC9RWkZGNm14eFRR?=
 =?utf-8?B?RHJPcFNOa2dmMStFZUR6TDlhRklqaVZaejRnL0o1ZFhuTS9FT0FrK3NSa1hP?=
 =?utf-8?B?NGMzVklENmxFUkpQTE9kK1pyZWFJWWx0a29LM08rTVNjTVptNFFtdFNtQmJH?=
 =?utf-8?B?bzJRRCsvbDJ5emVwM0cxRjQwVHY3VXZTNkYvSS9nVmJ3ZnkrWW1ZdjhGMGJW?=
 =?utf-8?B?RGF4ZkhHb0lja0xkWVBwd293SHVmUlVWczFHODRZRXhpNWp0dU9wTmhJb0I1?=
 =?utf-8?B?eEk4cWlxVUFlbTdEcnpMWkxydUpSQXE0TCtROFhaZXN6Vk9lWWlpNFVDM04v?=
 =?utf-8?B?Q09LUFRwWFkxTG5Tb1o2ci8vR3J5UmtTNEs3OE1yWTFiSzFPNXhlcXNNZElF?=
 =?utf-8?B?VjhkWVVSeURFbTVJL0NkTDRLTlk3dHNYK0N4S1FBY3QwVndub3N1WTNtTG9a?=
 =?utf-8?B?SlBUWCtoa0tIWHJldHcwdnR6K3JGUUloTFI5VWc3VXZzb1RrWng5ODJaclJ2?=
 =?utf-8?B?MlE1MFF1SVVnQThIMjFuSXNubFdBQ2NYTUdLOCswY00zQzk1eUdQOFM3eHBY?=
 =?utf-8?B?QmxURWg1eW5lbWRTQ2w0TGEwakJXbFd5VVVVT0hHVHU0T3cxamtBUjlmMzdt?=
 =?utf-8?B?M29xeUVONC9VRmlXbkJMd1BKckYySWRzSTJPN3MvS05kdDdmdk9qUDVkeEpm?=
 =?utf-8?B?Ym9GbWR4WURDbmJieDVKZVpMc3RCMElUeUdhUHJwMVFKNlo5bVhKNnV6THpq?=
 =?utf-8?B?OTNxbXM1N0s4RCsxSDVpWFBrMUYzOWV4c2k3djd2T0o4YStBc2dyNG9NUXJt?=
 =?utf-8?B?WDFsNzlJclF1c3RxZ0dxMkRKaEN5KzRpekFjK1E2ZWFxVmE2QzFUQ0c3SHdh?=
 =?utf-8?B?bG5QS1ZYcmt3MXFMbG5kZzNvbnlpQU44S281MzBYcjdMZjFiZHZNVmtzbXpD?=
 =?utf-8?B?UkdwdVNlQVdsN3hiNDRuNFoxNFp6TU9CK1BIYmlrNGtIa1dPT3JrU0prR1Zz?=
 =?utf-8?B?bUpwWVBEZW0zZHM3TXdubkcwOUIrM2RqNEdLajk3SnFTNUVyNmdMTThTbE9J?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: abab65e4-4241-4ad7-56c3-08ddcb7ca5ce
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:10:37.6663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPAUSf3C6xOjVlHQHFsPfoLzPrNcYtkTREBT/jQp8f5EKaGPEXiEiber73eCFY6OCSD7HZ3kTMlC+kZbyid2gQNyTUcAqMLpRZTXjmAHtug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10525
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Jul 2025 13:10:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7387

Hi Robert,

On 7/25/25 2:59 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i was thinking of improving the documentation for PACKAGECONFIG with
> a couple better examples, and i noticed this in the OE layer:
> 
>    recipes-support/icu/icu_77-1.bb:PACKAGECONFIG[make-icudata] = ",,,"
> 
> i'm not sure what to make of a value assignment of ",,,". so there are
> null values for the enable option, disable option, build *and* runtime
> dependencies? what does that mean?
> 

It's a way to impact other parts of the recipe which aren't build flags, 
or build/runtime dependencies. This is typically the case for files that 
should only be installed whenever a config is selected.

For icu, it's entirely bypassing the do_make_icudata (for the target 
recipe) task whenever the option is set. Easier to ask users to set 
PACKAGECONFIG:remove = "make-icudata" than doing 
do_make_icudata:class-target() {:} in a bbappend for example.

Cheers,
Quentin

