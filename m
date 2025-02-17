Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B630C0219E
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 11:06:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.6])
 by mx.groups.io with SMTP id smtpd.web11.48673.1739790389401102679
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 03:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kkLVNAZP;
 spf=pass (domain: cherry.de, ip: 40.107.159.6, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVn8EDTghA7+T0ZuQ9aKJJr802z4NeHcBGxasakhUEXHdpctt8nrOIzfOaqwtIhQjrbem+BGAgKhYHrVtGLaiFx/oR8Tu7LMfLaUKabrPcsfHiafpgZYMVboXJbDLicLFhg3I5nhTUBAyd5NB+PxROB7wSKsDIsGCJSi6kZtOb0Sh1Ig0K+mQZnc80sMZSl7S0HEirQROfM+PMZkOgQGqF32GNK6/edRD1t0eeL4Z5NKtj3L487HySljvcbwVJGDO45lq9YcQr0/3oYmc4Xug8LIp/A+gqPsKc058HVMiHXv9yWmB0spAlLxt+eLjKR40bzeF+lVPN+35YQxc400xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb3kS0u8f7qvV9Wr/ckvhcb9HLWWd6QXGg1WRN0O+zk=;
 b=D2ai4MSUc96/yi+kclQZkWG+EaMis7PZMKc0hQiqYoP4MVrfDYPfjQp9lwXeUa3kWkIUsbu92rMBCjvNOLapS8WbYhXD+0tJp87A9nOpF6IG9VdfopufHoWziiAFokDpHPiEEPBI48dmv3C6cIPvLvmNcFAQidQAVDvNrdd5ilC3Xq9j3W6ffic71k1NzsYf9RG5KvJlM/7B0AVTbNm1Jwyk3HTnkJZtZjD0MC432JgOKnEJiTbjch5OVfajptShNZS9FjIMOm8hR4O7zl5H/4F78xhwrCKdM5MyvHOqwtxbIZDi6uVMO0PyqaO59d/5pzZis/bLeO1P7IsoT0yOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb3kS0u8f7qvV9Wr/ckvhcb9HLWWd6QXGg1WRN0O+zk=;
 b=kkLVNAZPyPyk765ZgdxHTGn40IJFs8ljNp+iDyvKON1pY40t9zfWko5KoeoHoyAR1HfPqhWhz77Nmtusq5aP9ggSwATOyNj9K1ctuexmqF0AnJ04FXXsodjiV21jtq9n49XJ9zYocsgidpg+H1PW4j20bPPMuEqz6rzTdINctcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAWPR04MB10056.eurprd04.prod.outlook.com (2603:10a6:102:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 11:06:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 11:06:26 +0000
Message-ID: <4221da7e-309e-40c2-a5c9-9d7f33b52a0d@cherry.de>
Date: Mon, 17 Feb 2025 12:06:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v5 2/4] reproducible-builds: change/add titles in
 the "How" section
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250211234738.2633971-1-yoann.congal@smile.fr>
 <20250211234738.2633971-2-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250211234738.2633971-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAWPR04MB10056:EE_
X-MS-Office365-Filtering-Correlation-Id: 36866623-3d0a-4601-77c9-08dd4f431f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TDhxTXFGVklGTzdRck14UTdiaWJzNU15dEhyRzUrRnJQVDZ2ZndoVi9VRmk1?=
 =?utf-8?B?WHV2MlBhaWRLeWlDSnFXaFh2dGJtS0g0enNyeVlvYk9ydlBuMnV6WXU4RDN3?=
 =?utf-8?B?RGczbE9qNGh3ckgvTGhuSnRwUkxGUDkzSnkyM204ajBzdEhwa2FGVUpEUEU1?=
 =?utf-8?B?ZDE4SGRta1ZUU0ZOTFFLenhjY0VBUW4zUXRrSnNRcGpJMjh6RnVIQnZTdVp1?=
 =?utf-8?B?QnEveHpKdzZBa1RCMTAvRHg1T2M3TVYvV29iYnZrVFVqWXNtalRCaUZFNWJr?=
 =?utf-8?B?aU1FN1AzQVJxVGZtazc3NUJNOHVKT1M3Unc0bGpBby9rMkZtNlhIV200MVNX?=
 =?utf-8?B?VXhOckcxNWxkNW5ZQTRGODFYUWNqN0xXWHViTkNaeHUydGRtY0VhRk5lUkRX?=
 =?utf-8?B?dE9IL2ZFbzBDelJKRk5SeFFTNW9XWUFTekxEOUlMTnJXU00wOGQ1Uy9GdUts?=
 =?utf-8?B?QTZOSTlvaTN0cUJuMkFwR2d3ZGFOSE0zY0dUSUhObEZlM2hBSHliVGxtK29N?=
 =?utf-8?B?Z0hESDlpRGpXZzdxb3pUVEQ3NWFnMndJM0FxV3l6VERqMjJBbXpzTUh6T3dZ?=
 =?utf-8?B?WUh1a25Cc2Rmb1l0emp0TWlRN3BsWFo5RlpTTzF1aUZjUGlLYmN1eHNDVURZ?=
 =?utf-8?B?ZkJQYURQekNyR2g0Z1dmRGh1ME94aUs1ZjVWeUIrZmVlamVzQ1BhcVo4UG0z?=
 =?utf-8?B?SXRpNVJkNHBBRUxxSEdsWG1icU1CTmY1WkMwdXRIRFBBaUM3OTNMMWxHamdB?=
 =?utf-8?B?QVQ5dVM3WTFSbjh6ZVoxQWRkVHJhRDdjVHpQeVBXamgzMllqNFNqckJsaXlH?=
 =?utf-8?B?dU5YSXc0Z3hLOHAzVHZWUGdJTDl4R0Ivclh2dGNVK0t6S0RVeHRtTXh5YjFw?=
 =?utf-8?B?bis0UG5OZjRMWXgwaUk3bGJTNWFaL1VuSnp1NzFNWm5pbm9zWE5FQk5DUXUv?=
 =?utf-8?B?UkR5RjE5WWFyMzRGVUp5R2pLdXQrdk9EVHI1M1ROVCsyNENSZkhrWnZQbnNs?=
 =?utf-8?B?bXJCQ1BnNnZ3Q0xIazFhUHNDQ3FDQ2ZxUkE3a2JWZHZSdkRuU1BxRzN4cXFo?=
 =?utf-8?B?a3lsUGZBM2JRWkE0UnA5UlM2Uk9IRmJOTk5DTDFQbUNWRDFDTW05MmMxR3Ba?=
 =?utf-8?B?VlFsajdvVEZrd0Z0bCtScXB3MTBUYWhUcFRwWGRISVJlNVJpclFuZXdzS3NM?=
 =?utf-8?B?RnJPMnlEWTNwTVhGbDA4U3B6ckZ5YUlCMGJKV0xDMWN5VTFZZklQMng5ZnZs?=
 =?utf-8?B?TGY2L0N5Zm9EV0tvV0FWVlYvYlB3MEF5dGZhMTJKdU1RS1VtV2RadWNiUjNj?=
 =?utf-8?B?VGRtd2FuVlBjWnB6d3pnUm5pcTlXcnZsZENIWWdjWFBNRk1rMGRRci85a1dI?=
 =?utf-8?B?Mm03ZVdtN3FxVXEwaGxNQi9QbXJtWmZQUGRYMlp6bE00WGFPekRwcmpMQS9B?=
 =?utf-8?B?Ui95R0U1b2FKT09GRjdqY3g4MkJNS3dPOFY3dU8xVjY3Wll1UFdmUDdzMjBE?=
 =?utf-8?B?anJOOXhLSTNtTDVGVXpMM3dDRExsd3RQejM1d1RrUXBVVVpPZjFvRUhILzFi?=
 =?utf-8?B?eGFKYXlHTjBtNzFLcjVMaHplbXo1MXIvMHBOOVUrWENTSDIydXpLNW80MGNU?=
 =?utf-8?B?ejhub2N3R3BTSVU3SllZK2lsN2M2SGpmazN3clJyZ2JTVTBTbG5ONGNOVWh5?=
 =?utf-8?B?TGMrWkdRSTY1UHZrMzdiU1ozNWhGRVk3WlBQTkhrYmh0d0htZFpRcFd0SU50?=
 =?utf-8?B?NTRvci9adjZrYngrQUpmd3NqWjhqRS9lS2x3TzFodVRLbGVheVB4Q1BUZE1O?=
 =?utf-8?B?V0huL1hXZEdaMDIvcFA1TTZoRmhmQ1FHQjdDUHdhalJ4bmZJWk81K1hWS2R1?=
 =?utf-8?Q?05BQGAalmSOXs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFlsL2NtZ2IwQ0ZVWkZJaWZtbWJrM2E1TlVicWowNExtdmZhd1UxMWROQUd6?=
 =?utf-8?B?RThxM0pTT1RmeGFhNXVaNjlLbzdSNktJYVpHMUtoWXJpb1VzcVV0WW5EbDlN?=
 =?utf-8?B?TjErRktxR1VmTFJkM0s0Ym9rdTZjbjJiaXEyOHdBTDBURnhsY29HenV1YU9U?=
 =?utf-8?B?N2s2WnZOOXkzOWtwZU43c3dnUEEyNWsyQi9aaktuTDk4T1VFKzREUFJMMXBY?=
 =?utf-8?B?dXdlZ3FESkpnUHRFaDlsdUJMMnFuSnFXSHlnVEVHbGpWSTZzVzBIa3BWb2I1?=
 =?utf-8?B?aTFuOVN5akFkMnNmeGhlTUlZaW9RcCtCWEZaUjRkVWtNaGFtYit3ejNSWFRR?=
 =?utf-8?B?Z1hiUm5qSCszMTl4L0FFbnhQb0JoNUZZSlV4U2c5TityZmJQaUNsLy9CQjBM?=
 =?utf-8?B?UmZyZkhCK1lhZkpoSHNFcyszTE01NitKM1p3V2JNTHYyL204NlRVdjduWnEw?=
 =?utf-8?B?Y2hucVlKMUhVMzhaWUlISjZrM2NXUkNsVWJkakFxa0Y2MHZ6SW0zRkVDTUcy?=
 =?utf-8?B?RnV3WlJIdUlkRVZVbGlwbDAzUXpIUVdHWkNvVTdEN1ZzeW1PVm8xRi9WdXZD?=
 =?utf-8?B?NWpZQldaYzVqMmJzQ1JUSituNFZsYnRVZ1pEa1QxYURsK3NEeTZ5SG5aN0pF?=
 =?utf-8?B?akM3bjM0YnorSDd4NHhjbG1RZU9EK05NNnIwK3kzRXZzSkI3ZlY2Y2Rkd2Q4?=
 =?utf-8?B?VlBSeVR6NndFeDcycmxRR3RZVkdkS2VGWjNEVFladEhCZzNrR0QvOFlFVk9i?=
 =?utf-8?B?a0hvbHFGb2xTTk5pVTlCVEFsZURBRXVoWWN3cVV0YXg5VEl4K3R1NSs2S1pM?=
 =?utf-8?B?MXQwQTVVY2VBUjdYN0ZFWnh3bjZFazZISzhQOEZQdW9mQTAyU25Cd3JVNkp0?=
 =?utf-8?B?eTNpcWVmZ1d4ZFZyL2dCODJoZzNpTlVNMlpqWkJFdnEwTXVwRXl5NENjb3Uy?=
 =?utf-8?B?ajZFTTBKenBlOXV2MkRJcHdrdGdwMWozQjlXbEQ2cHRJV3dIUDhseUVWOW0v?=
 =?utf-8?B?Nllod0o5Uk1kd3dHbjJQWUFQbHpTZ0l5WUJlRE9uQ2lTOVFNb29BQS9HUjlF?=
 =?utf-8?B?WFVaTGk4d2JIQ0hhSFByN2o5ZGErcTlEN2JDQXpqV0hhaWRnYWpkM3dRQTlB?=
 =?utf-8?B?WkovMERRcmtUMzN3SEVJTVlrQWNrR1FPZmUwWUZoSVAzWk5Zamw5bHlJREl0?=
 =?utf-8?B?KzcyTGNEblF4VktkQkhRclZzeWljTEtmNkFKUGMremRvVW1jRlRRSDVzZHls?=
 =?utf-8?B?U3dkRFgwVXFBV3BGaTd2OFozcEtVemhzNEt2di9oMHdPTTMyNVh1V1gzNmUy?=
 =?utf-8?B?b0haMjFjRStNMFI0Vk9xeHJOdXRFNDZWeFJ4cTJuMWZOSnFrL0F5ZFVUNVVZ?=
 =?utf-8?B?VysrQlYvOU8raVpkbjBJL3ppbjBjT2RlK3lOZGE0cUt6cWlIc0toTFhubC9G?=
 =?utf-8?B?UXlkWm9PL1pDMlVrbSszWVdSU0NDazJ2MEFRSVFXVGR2NFdHUGd2Mm1UdEU4?=
 =?utf-8?B?NDhFYklIY1pDamFXWnJQc2w0T1NtVUxwL21HZnBoeFBiWlRBYzdSNFFlZHhh?=
 =?utf-8?B?Tlc1Q2F2SE16aEJlQllFd0E1WEVnbmQvL09xckVNcHBLQWc3emR0RDQyc2pk?=
 =?utf-8?B?YlpKUkZxZWRyWVZLNkNJVmpDWGtvbVhIc2hCNVVKUUE0UHc0ckJnVVZSeUx3?=
 =?utf-8?B?SFFnUFdJYmVBTjVuRDByeXFaUFZaQnFJK3ZsSndDK1ZpNklEVlkvRktiVHh6?=
 =?utf-8?B?bjZ0SGVNY3Z3WnFrWGVBUnZDVytnWTNTSjA0UXl0ZzVVZm9UZ0RvTE1uVlBB?=
 =?utf-8?B?TUMxaXhuUms2N0x4UUJuS2tNWGJTL2Vqb3ppMXlUQUlLUUxhZjUyN1d3amp0?=
 =?utf-8?B?KzJtZlFuSzFscHBoUUcrK3VNS1lwWkwrMWZBZGFBU3VScVMxTVJ2dzBCc0FY?=
 =?utf-8?B?VzdSNklJMUkrUXVZNzQ0Y04yMGMrWHpqZGxKanpQa0NsSElXNThTR2pHTTJx?=
 =?utf-8?B?T2R4YXJzUkUzSDdUQ0p4V2RGbkJQdUpYK2pKOGh6c0JhVGtsSDR1NXNWVlRy?=
 =?utf-8?B?Uk9IaWNkRjBWNlhXYW9tdytJUDdYR1dadU1Jbkl5ZHhUQ1FxaHVDU3c3b2lP?=
 =?utf-8?B?UGZxTjFuUEZVelpkS0lqeUtxcW1aZGxpM3gxTGxlQVlmUm1tcFBOTGg4aUtR?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 36866623-3d0a-4601-77c9-08dd4f431f5b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 11:06:26.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufs+OItJP6tOYbCh+wkuRnEj7sAht1xrob+SULQKtE7E6P1bF4c4FQyX77RcWu7Q/1P5lXbarIdGCvl+TkCwpqEtQOgfWJB4TN62QCRXQaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10056
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 11:06:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6377

Hi Yoann,

On 2/12/25 12:47 AM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> This is preparation work for the following commit.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

