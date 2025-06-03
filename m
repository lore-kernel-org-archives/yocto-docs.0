Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99DBC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 15:34:29 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.17])
 by mx.groups.io with SMTP id smtpd.web11.14817.1748964860674571075
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Jun 2025 08:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aF0o49FT;
 spf=pass (domain: cherry.de, ip: 52.101.71.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLd0p3HocpIeDesIhe9Bo6GM0L7KzYHaBn680yNaKopPok4qncJe37kV0dyY03Y69uoegbn9KbseqarMeWt3f2if/SPtCBIZ3a4GyzjK4YV5ft1PheeHancVlW9mZcEW592Khh0Ko/zd9gqJINBMFR5Y4aXePTQrw3xtN/on9SVN7AJy2KfTNYGH/3+nIV55nXn7vHbA1eG7m6KUkkoNQy7unJpgtMo7vZCgxdzv4+iJZ1ALsuJxXMjlQ1l1oZ3c+/qc1+DDjfV+52lZgr4nezl+EV+mjhWfWL1wKwiSAAOxsQ8lqiHmpCH1M7fOaawRCkbnhR6XLP/0DVD0K40QSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLEeFzSZSnqVLMLnnJEIdHC5cWU6U6Z5Vc34X2aUyeo=;
 b=s/kxIvmnlTuJdN/YpilPoV8wOlLcAvD3O0bz9mmaJrF9Cf4Z2R+EQxqa1vXJRFICSXYJifD6FBxMCIjG9J/4mVu/w+44KkYKiBpsuYgKeZrkCCrNLXrrYXJqXoK9eLABCeDNVzLGO6N1zlr6ACkbl2Oodu6+9lFLrEWS/55yitZQeP5DDAsRy54KAbW7paYo74dfW/Jo06kXzepCYuAZq3QW+qUlbB5fKS//xSLopzK7kH68m9zBODKWIwKwI1qKL1NbPTGRoo1V4oRhD8t/yRlax0RNHo5gArSUT8RlwfYi2D85wNGLwud+IsvM9o9OeO0vZ3vINma2C7nbWhx9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLEeFzSZSnqVLMLnnJEIdHC5cWU6U6Z5Vc34X2aUyeo=;
 b=aF0o49FTy+DbfOqBPe7NyMcAz32RJXVJspbjNc6dnq7FRJ0CeW447jNeV42zintJPqO+9oqwqYusl9tU5nyFGQefwZAkpCSAmTUn+NXD7xaPUWgwDT/1Prh85AERlhQklJZnweGY/2SywBTOQyKrEKQ0wGU/d1w7iD7+XwJ8EQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PAWPR04MB9837.eurprd04.prod.outlook.com (2603:10a6:102:385::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 15:34:17 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 15:34:16 +0000
Message-ID: <511e5cf4-cd3e-4a62-ab70-7a7a582368c9@cherry.de>
Date: Tue, 3 Jun 2025 17:34:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] A thought or two about YP documentation versus glossary
 entries
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <79b9774e-2ad4-1ff7-bc4e-4bf6ad2610d3@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <79b9774e-2ad4-1ff7-bc4e-4bf6ad2610d3@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0113.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::18) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PAWPR04MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: bece3f4c-31d8-42b7-e05c-08dda2b419d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3lucUxZdnB2UlM4azI0OEJxS04ySms1VXV4REZQNFd1OGplWWFOWU5Vd1ZJ?=
 =?utf-8?B?ZFNOSkRXUWRVa3pyODFxVkFjWUl0cndzZTdCQ3ZtSXJ3VXFZRnV0alFtN0h2?=
 =?utf-8?B?UFVvSnpQeU5icnBQTTRzNHhEQW0wUExNZm1jV0I3NlN6T0VKc2lDU0tpWXBw?=
 =?utf-8?B?c0NOQksxekVrQXRNczlWeGVlUGRkRHppZURvcXF0aFJhYWhDMzI5c1JaTFdq?=
 =?utf-8?B?SG9wTlhLczNVQlpTNkwwbGxBUHp2ZFR2Z29Md1k3NUJncHZVaEltbVkvcmht?=
 =?utf-8?B?QTJKc0RkYVpnTU1OTGxrM244ZEs1QzNHZ1RWUzdlODY3aVIvZzF2dmdqaUhj?=
 =?utf-8?B?T3E1QzQ3VnQrWVFSRXdQbGNMN1BtUERjZkJZLy8zOWRYUlZ5cHJlZDJLbmZR?=
 =?utf-8?B?U1BZM2ZCa2dtRXlLUXZGVndUOVExNWw0dlYrbkQxN0JjcmVrZGlBQjlLTjA0?=
 =?utf-8?B?K0NkazZjV29DSGdPY0R2Uno1Q0czOWpLTkpQV3hzUjhvNjVXL09iVTE4UkNU?=
 =?utf-8?B?dXlVZWhheGNkK05WWVpOZUJXZGdaT00vRWlHbFQrY1h5T0hHYnhNdys5UEVo?=
 =?utf-8?B?Ty9Eb1pYU0NoOWNPNUxTaVk2WDBQeGM0SGxPUWZrUXZDYlg1ZWRLYUdMbElu?=
 =?utf-8?B?bXlLODVwdXFTNUhBOWJnYTI0ZFB1aGpGa0U3SUFiaGpXSDRtK2hXRHUvaStD?=
 =?utf-8?B?ZjBIeW1VMnJKQyt1WXJHejM0NWxsazNaWnJ0QnlTK3JzZ0VXTnR5TUFMK3JI?=
 =?utf-8?B?c3ZzczNhUlpRUWs5VEptRk52QlhlVzRMWlVCT0xGK2ZGNHIrekR1ZHl2ZlZX?=
 =?utf-8?B?cUlyR0Z3MTRuVllQdk5PeGtTTkphWGhKRFFENFpYY0t0REpzYmRKSzE3WmJT?=
 =?utf-8?B?SENvd1hCdk0yQ2xTZGRuTklJMHBsbWt4MW1uVDRJUGxqRHA4eU54OXN2Tjl4?=
 =?utf-8?B?enRtcXphN281ZXpKNUZpV04wZ3pxWUVFSks1b2RmYXhWMTJsQURvaEZZSzEy?=
 =?utf-8?B?Y3kxSnJJa21LWjBTZXFGVm40ZnY2WGo0VHBiQkNxUEo5enFKYU1IYTNpVXh4?=
 =?utf-8?B?Z1ZGSFdyWUVFb3gyenRqZm1lb0dwaEJrbm16elIvU3FSbS9jNE5WUDVzZkdH?=
 =?utf-8?B?MnYrc0YvL3l3aEorVElUMDhvZ3NsY1BOODJvODVwbUFFdXBRRlJldmRyVWRa?=
 =?utf-8?B?YVNtbGN6MkdqNkg2NmcwZEhNNVJsVkpZTUwwNFNRdG9ja2RuSnhQNUZ1dDdQ?=
 =?utf-8?B?WEZPZ2NNMFIzZDdicjZtS3JlZ0pBVDd4am9BRU5EbEFPT3BLYW44L1l5Rmdo?=
 =?utf-8?B?TGdFZStMVzRWdEdYenh5b2JvWlBOMmdjaFZsUjNPL012djJ0cnVJeVBBNDNS?=
 =?utf-8?B?dCt0aVBTZDVCMldmWmo1ekg5N2NxS1o4L1hnS3p6b3NRWG0xbXN4Y2FQY0FQ?=
 =?utf-8?B?UklBcE9VdThIN0xML3VsQ3VZaVFub1BBbnNuRGpzbHFVWnNyMXcvV1dtZ1o3?=
 =?utf-8?B?b2MwbGdmOU9IWXdxeG1FK2dQcWh6V2ZrVjdYbytHcGs0WVc4MEUyOXhHNG5K?=
 =?utf-8?B?Vi85Vnd0dTF1ZVBnZGd4MktFNDlUdnRIMEYyMXBRc0dBQUQ0VnVjYk42NDlP?=
 =?utf-8?B?Vm9wZVhEVWE5dVFpQTMxcSsrTk5HYjZJaVYrS25hOE5FalNBc0REbm1CNXc1?=
 =?utf-8?B?NUdteC96T2d5eXFORTk1QVIyVzk0cGlrZ2RiVURsZHovNmhTS3VHU3hDN0VF?=
 =?utf-8?B?UHhkMFVPMVJFTzFxTjNOZlhyRU8xem9Ra2tGdEtsMzlkSmlDNWFoMjBSQTds?=
 =?utf-8?B?TWx3cmxQTERkZlJlbUNWVTk3VXdNa2RrZzZSUVRWOSt2T2NPNHFGbmprZXhh?=
 =?utf-8?B?QU9sSUF5aVcrclZwWllsbFZNRDBJQlE1dkYwQmt4M2NyR3VSMjdNUW80eWVS?=
 =?utf-8?Q?FXZ4wMhpNyk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aG9tM2k0bmk1bUI2WjMyVlVZbUluK3pmejF0a2U0ZTB2ampPQWxIRDFlTzdT?=
 =?utf-8?B?Z0dFekZQclRsdlhYcWRuMlBxZ2ZuS0xNZG9KaWdjRWhtQldLK3M0L1FHVm5U?=
 =?utf-8?B?STVpVWdpczZuaEpkcWlWUklqbHVPYzBaQnBWbmpFOHVldlA5VDVBa1g4eUJG?=
 =?utf-8?B?THliSVh1NVQ1ZStXSlJCcHJhTElzSzM1bTREcGV1MzFKVXJhdDJwRGxIV2hO?=
 =?utf-8?B?MUVqSjZaZGc5RHpOVk9aVVJaSVpEWEt1UmhXZkxiZHpqdkJzNkp5dkpuTldL?=
 =?utf-8?B?ZVhRZHhIWStrdDRnNjNNeDQxYVZuZnN6SzZFL2M3bHQ3S2QwWGsxNktXN3Zj?=
 =?utf-8?B?NmdRL0RKUkZGZXZsMU5GYlhOcm5pbXlKVWV2MzZIMGxXNk96eGJxb0JBT3U3?=
 =?utf-8?B?eGZldTRGNENSSEJaQU5ZK0NnT0d6eVhXaDYrU2Q3ZmZpMzROY2Z2WHJzYVU0?=
 =?utf-8?B?bWtGcytMaDBVNk1qaTJPcWtRMHZIK3dYR01FbmNRcDM5UGFpVkNuQkxIQysv?=
 =?utf-8?B?M3k3NGNsZzFRcVlrMG1oY2pGZG1IblQrNGlNMS83ZGVDRHcvRXBXRnZmRXdP?=
 =?utf-8?B?Y21nQzB4WkcvL25HU3Y2dDdhY082S0NLZ1h4YkRqNXUweHQ2Z1BNUUhVQzJF?=
 =?utf-8?B?WWwwVjZuQjd1WVo2SGYvTGVvNUFPZW5wczNqRkhpUWlrU1RoalkycFhGTUtV?=
 =?utf-8?B?eXY5R0JNcjZIVzZJNDZ0bnNwd3N2ZEJzU2JGUlNYOXFNRTdxL1NFd25sTTJ4?=
 =?utf-8?B?MERWYlllVFhxc1RHZ2xyMWJJclBLYlM5anVkSkhqQko5QWkzdTBOamphNG5N?=
 =?utf-8?B?VWhDeXgwaTg1bStseWoxVjBxMHd4RTJUZER5VG9QU3ZTYnNobUNvSUFuWDdh?=
 =?utf-8?B?M0xSL1A1bXVJb1FZVDc0Vk1ycysyV1VDZzR2dHM2cHlCSmpVK2xrWGNST0Z3?=
 =?utf-8?B?UmJJeHd5QUJDVjBCMU1rbXBRZDJqaGFnRU1tUkl4QzRMM1dJM0tRd0hIM0VL?=
 =?utf-8?B?TXdqRE1uSG02YWZvMld6UHBCZm5HVUhyemRXTi9udC85Tm56U0phdEdjVkJy?=
 =?utf-8?B?TGgrOUVya0tjSi82VjRRZjczMkFNN0w0STJoQ0kwV0xRcnVFVGNmNFp1TnY0?=
 =?utf-8?B?Nno2UW10Z2dqeXV5Szlqb0laWmg2NXdHZTBBSW5qMTdlSGtpa21VZTJPWE9H?=
 =?utf-8?B?SnIxcVBQaWFreVBiakdpZ2dMWDZUa3lTWXpNYUs2cDFFWTNLK3VQRkJMNUcv?=
 =?utf-8?B?SmIvSXJmWG56TUFSS3BpdGNMYkpvTHZyancvaHpqVFIxbjAyekFuSzRKMnFK?=
 =?utf-8?B?MkFreElWYUxZZ1dtRmpMUlJXYm1VVkNoUDZPdlRKc0Zzbm5laUxqTGVyQS9w?=
 =?utf-8?B?Q3pCR1IzY2MyZ3FZak9ra1FPanhDb0x1VE15Nnh5bEM4K1c1bXZ1QmlYN0ta?=
 =?utf-8?B?VE9KQ1pDcUZDVFl6d3F3NmtJc3QvbFV3SUNmRSttelFjZUlhb0ltcmhkZWJI?=
 =?utf-8?B?OW5rVnBOZ2Q4VklZbWVyVG05aHJTVURkSHJ5Z2JwVW1lRzd4c2Nub3JPejB1?=
 =?utf-8?B?RUdWdFNOTUdodFBLcytSaThsQ2Zzb01zZmY3RkFJM3A3Ni94ejZQRndSVUlS?=
 =?utf-8?B?cnRDQ25GWGhXbjlaaHhtMmVNbHpidFRGRlF2SmRQd2VwS3pqSkxHQzR1dkdp?=
 =?utf-8?B?SzlZdjNqRVMrUEM3eGIvOG1DaC9ha1dqRTlWKzhaeXJJcktSamdZR1pwUVJa?=
 =?utf-8?B?ZnR1NEE0NlpGaUdZVC9VZjZHdTJCTnBoOFZZTmI0cWgvdmo4cFUvVmJVcHhz?=
 =?utf-8?B?R2FWVkVCT0JseWh1R1B3K0dwMDRBS3RVQmNDQ2J2dnlhR0gvVnBZQmFVWUhi?=
 =?utf-8?B?UHFPRmYweXhjMlZhL2ZINkNIeXFBZ3RRZk53RzFXdEJVcXEwVzlscFBEWTJy?=
 =?utf-8?B?ZjBpaUdRM1F0dWJrT3ZlbGQwd3ZoNC9talVxMy9NMUVLTUlvbmpHR2U1VUlD?=
 =?utf-8?B?ZzFyNkNYUTdqTktNSjNQbEprd0hFR3YzbjRYLzV3a2xiSGFvMlllOXhmblNH?=
 =?utf-8?B?dWtoYnNjRmYxalNYUTYyNjczQzVET0JtTCtTNkJtK29xcmFrU1VBcGh6Y2l5?=
 =?utf-8?B?TGZTRnhmb0xzS2ZsQVF6eGtWR1dpNGQ2Q0xLQWcyRlJML0tPeFVsWjRxbnpZ?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bece3f4c-31d8-42b7-e05c-08dda2b419d8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:34:16.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5tzvwhMr5gOqDn3hkFekdbc0phlsOnQnAvLrKCvPvFGlHKOiuNRo9tYux5bpPTUI/ywyuDgga8I2nDlSIEu2xC/ix2YZdkCIv5XigBqGGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9837
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Jun 2025 15:34:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6989

Hi Robert,

On 6/3/25 11:44 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
[...]
>    Finally(?), in the case of BB_NUMBER_THREADS, this is part of
> BitBake and so should be explained *in detail* in that manual, along
> with related BB_PRESSURE_* variables in a section entitled something
> like "Speeding up the Build." That is, comprehensive coverage of those
> related features in the BB manual in an actual section, again with
> glossary entries being little more than links.
> 

I'd start by keeping the way we do it in YP wrt the glossary but start 
documenting variables in the BitBake documentation for BitBake variables 
yes. I don't think you'll meet resistance doing that.
YP docs may then refer to the BitBake glossary term and eventually 
extend it whenever applicable (maybe YP sets some defaults, or uses the 
variable in different additional ways, etc.).

I'm quite resistant to the idea of having a few sentences for a term in 
the glossary but maybe because I don't really have an idea what the 
content would then be. Could you take a couple variables and tell us 
what you'd like their description to be? Maybe that'll help me getting a 
better understanding?

Cheers,
Quentin

