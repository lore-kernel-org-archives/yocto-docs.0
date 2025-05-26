Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA05BC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 12:03:21 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.67])
 by mx.groups.io with SMTP id smtpd.web10.27104.1748261000349026725
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 05:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kC5gbL9x;
 spf=pass (domain: cherry.de, ip: 40.107.103.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/hyG+6hW+PZYK1JDQOlY8ZCDkR1Ocb2ccDFCv9VJkqkiyd4iyUxwDb2xa1MJ4rLi2m6LJDpOzhD1NPX119XokkFx492oTbDX1TYIEENNfe1KxCYrbeOYaBItq9UCGrTtYhp6FUfIJklg9WeXuARcVJIs7+KcUb8ctj5yRkmZxO0AHGoMDmZuZzTUoGINEP7lbZ1pjxhzk3u+q1hbGqQvkSVg7w31n33/hSRszq23CG4e/86xFng0trDjQAigP3FZIm5UPZZ2Zo3IW+JuhxGJ9Tu1gbmqRBDKMPVYNuaL1I+eiKQeHseXDwK0ImOoT3pd7W2ZdTrHZUfq4IGbr+69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV7VI+27hrVjwYXAmTFAUSq0Mp2vqHBMJsjIKWxqWlE=;
 b=XGxv7yL5ZrNj7vmL+KMosOsN8AexkOb2i4txaczxGznCR/53resk+Wy7oUHCwutj8kguVXy1Skj2vcOF28dv610/uAnMho7Nw2VTX4uZOmu4Gwi7aPpzxROphm3ZxHgvj3vXjNRJUFVMYqH/sImSt7MS0bmRveoRod49qHBuWoYs/qhgpjz4YHzXl6Yr0+exQ8rIQGdusBnwasQvfkeejpFQacN6Q2j4Zcib3U0/6JEEZkJWkqZ8Js60rDfQMknpmyBEgDMGanhMvLSilXP7fp0/Jl64sc6KOayPdUz2x52vjUO1EqF6VT20ktbzQ7D8mV+ziIxhAL7QBoou2HNzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV7VI+27hrVjwYXAmTFAUSq0Mp2vqHBMJsjIKWxqWlE=;
 b=kC5gbL9xdAG0u04KKbba2iTqxttkY/KvFsHHqBITsTFYZGs3ZNv/PAYFh4Vh8ncQikwOw2MoalbCRNYanUZHFimbw1SVAgQB+QaYTyHBfe4X4TMG/USw9Y4jDwF3wUEwXi1gGhl2wvS+ibk9kMrNvH2MSsv1nDzABkRH8Th0YQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 12:03:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 12:03:16 +0000
Message-ID: <93b137bc-bbc6-418c-98eb-c7a4d9e9752f@cherry.de>
Date: Mon, 26 May 2025 14:03:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH v2] Clean up explanation of minimum required version
 numbers
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <77073870-67eb-b7ba-80c7-a88ed13a2ff2@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <77073870-67eb-b7ba-80c7-a88ed13a2ff2@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad0b7c1-a274-44f4-343f-08dd9c4d4c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2U2RlJaR21NNGxVN3RzQ05pNGdXRWdrUkZFTEJjU2I3NmxRY3JpTDI2L1Uw?=
 =?utf-8?B?blpXb0Z6NklmdUtWVWRpQ0JCR3lseFAxRzh4MU9xbkNVdXVVNWFIZGc0Rlp6?=
 =?utf-8?B?enF0bzV4QVFIbldyVG9lQWwydVVZQmNqemhLK2Yzc2tpQ09DTkVaZ3VtZkFi?=
 =?utf-8?B?amZacWF3ckI2Zk5jWnJqTGhRQkw1U2kvdGhQdjV4QjJ0ajJKcWJrL2Rka1Vy?=
 =?utf-8?B?Nk9NTk5tMUZGR1NadDBQa0JDVGNLMjU4VXFiZUlIUURzaG1CQkZhbmkvSUFt?=
 =?utf-8?B?UnFURWtjVFoyY0dBeU02SWIzdTJqcDJCSndUd1hwZlExRGJJaU1WVWc1MXpx?=
 =?utf-8?B?UUhJS2MyRXFZT2ZLVVVRTHEyZjBCUjJZYjd0anVMSWVHUmNwQ2d1eFhWUzdz?=
 =?utf-8?B?WmtJdlFXczJQM09YNG5TeGorNVBXNmdHRWJsRjFUbWpnY3ZkMzBPeVJma0Vy?=
 =?utf-8?B?cTJCRFZHbEVUZ1JDUjNPUGphQlM4Mlhyd2VtTWFSdTRZVnh0RE5TU2xNcVZN?=
 =?utf-8?B?d1owUlEvMEJqTmViNnJEY2sxLytxanpqQ01JK3NneHRXdzNtd3A1RXRrSnli?=
 =?utf-8?B?TDJ2LzU4NTZWVUozSm5ncDg4YXc0RTZHTWxmMW5hUVhrdlhBbUhXSTdUdHJH?=
 =?utf-8?B?bHp2bzZ0dzMvTEdHQ2d3SnZxemJxRTMvSEVvaHFuWmFFUCtxdkM4VVNXVDJO?=
 =?utf-8?B?MVFBRXhwVS80UzlqU3E1amRyZ1VNSndwTWRpNlRmZnJZVFZjWFR5RDNGeHBK?=
 =?utf-8?B?dTVUM1drME1jQ3dXdlZ0UlpJYUN5ZkZYdkhzdGlWNXBJMEgzZDZ6UjM4Umg3?=
 =?utf-8?B?VGlGbld3RFFwM3BTQWlSSlZlOHNteHMyZWJNZEgxbUp4OVUrem5Gc3JkWG5X?=
 =?utf-8?B?VUlQa3laZFFkVjEvUENnWFJhVDFaM3JRZGxLL25iQzJRLzdUbi9sU0ZDOG1h?=
 =?utf-8?B?eUN5WVZGSzBXRVh4VVhsYTRFdFU3cXhqazFkR0hzMlRSdkVwRlJaSnpuSHhK?=
 =?utf-8?B?a1pBWWVEK2Jwckl2WkcwTlM0UnlKL2ZHcktUeTAxSWJOVTZ3WHNwQTBOVlBx?=
 =?utf-8?B?K1NrV1AyM1pDdGNIcjFrbHcvQ0cyUkNtTGVBQ1J3b0RLZnRmT1VBbkFYaVFP?=
 =?utf-8?B?cUNKeUViZ1RnV3JIYlg3WmxkSWJNbk1NWWhPYUwwM3pYYXM4WHVaVHpOUFND?=
 =?utf-8?B?aVpKUWFVQW1CdmxwVC93ZVEzR3l6L2czNzFzRWZSZGVSc1JlaHZCcTB2Smw3?=
 =?utf-8?B?cS94S1JDTEk2TnA0NlNKbkhnbHhKcjdYcnF1Q0VRK0hkZ2Yrc3BvVEdSM3h1?=
 =?utf-8?B?TWZhZ2JUemNSMGoyMEhHQmxVOXNZa3hNQmJXd0hUcEFnVm0xRU9lR1Y5eFZ3?=
 =?utf-8?B?RmVrcVI5cnJaR252RmQxNjdTSlJuRlNxODlmdzQxYzJNalU0RHFyd0VCSkVl?=
 =?utf-8?B?bkZNMnR3NjV4OTRXTW56Z1Y3cVcvcTVjVU1BZHhhNEN4VUdCczFsTDg5RndG?=
 =?utf-8?B?dExxYmUxQzlkSXFBZEYvK0IxNnhVd2UzSmpZSGVxdEs5dWI3aStrbzdIRWI3?=
 =?utf-8?B?cVVBVVBxK3krSjl1UW9HNmtRZDlhMzlaM2VWNFNXZ3Fya2hudUt2bHNBUkdC?=
 =?utf-8?B?YVJ0L09VVk9kV2JyaFVaWXI2YlkyOWZEWDU0T2tzbFhITDZ1S050U2FSMmlt?=
 =?utf-8?B?V3hibDltS2RMMXkzWStZY09WaGVDcUkxZld6d2FkYUwvelVyRi9NSm1GWnNh?=
 =?utf-8?B?b1hRM3BvRVR4bDJEcWlXczVKeVg3YlNzZmppbEE0c1pVcnVqczVQSGZHZVNP?=
 =?utf-8?B?WHhlNjdYellPMEhGV01zTmY5VUpMZHdpdjgyNHB5V0lhRDN2SkVuZGdHMGNx?=
 =?utf-8?B?S3UzUUFhRUpqWVk1WHZ6eC9CdnlFazA1bGJ4YlFid3FVVTYvRW9wSWpkV1A3?=
 =?utf-8?Q?rxNgB5A7AEY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVYrVkV0NWFpWlcyUUJVVXdCUWsxMjhBZHJRb3UrUk10M1piNDk5RTJvL1Nv?=
 =?utf-8?B?bzJUSnVVN3JteGNzZ2R2VWJvQ1kxb0QrTEIreWJvNkRNWWNiYjRxOWZKcDUv?=
 =?utf-8?B?eTNXdGtwNXhLMXlzYWpVb0hXRWRJRTZGWm1VNnI0S3hhR0ZCN1oyTTlkbmxv?=
 =?utf-8?B?djN1UEJoZGx1RFJNYnlaY3JUTWtvT3hRTHRCOE1kVFQyd0NwUitoZDlzSy9V?=
 =?utf-8?B?UHEwUGc3R1o2WThuY1F2QkFPNlBNS3BhZXYyVGZFY1RjT1g1NWpQZEZyc1JE?=
 =?utf-8?B?U2N1Vm9URjgwaHl5UHhJZFlNN2xaNSttdFNWVkRNV1ROM1hnM1hNdks2dWUz?=
 =?utf-8?B?dmNxWFZhcWgvKzNBUW9obm5zT0RoNUgzYlE1SnJ4K2pqU3RRTURLZ1hGVnJk?=
 =?utf-8?B?TWFQbTJ0dE8reHlZd0p2YlEyd2tFdm4xVmVrNEdkUC9vSzNid29HV2xhNzZP?=
 =?utf-8?B?Q1VncjM0eVBXUWRqVWFyYWUwSnd2YzRzNUdQUnRSNHozcmU0V2Vyc2hYdjhs?=
 =?utf-8?B?d3FYcEZRVFB3VE9VcUdKWUxGbENVUE56QjVqY3o4Um0rYTc3Y3p4clRyWVVo?=
 =?utf-8?B?Z2YzdE1oVnExOUM1WWxUWXZTWk43RXJnZStteWZxUUVtZjhpc0xRTmxzS0xa?=
 =?utf-8?B?aFFubzd5KzVscUh3VzhON0ZVenliNTF0MHljV1BzZ2pRcXYzM2I5TDhvQ2Y1?=
 =?utf-8?B?ZjV4bnhCN0VlOTgxVTRSMDVIVnRWN2lrRitiWmVZRGNDZ3RxV1Z6YzQ0Mit5?=
 =?utf-8?B?aGM2LzBXZHhoTjZzekJrUC9oNDkrejlVSlBNRmxuQzNyalNrY3F1MjNiK0c4?=
 =?utf-8?B?WldmbEFBWVRHL2J2SlNwS0xReDVmZENvWHBBYjFRSDZJMkFCeDI4VXlJcGIr?=
 =?utf-8?B?Smh3MmlFZCtSaXNJN2s5dm04aWRybTIzU0dvM3BndE1DUVBNYVl4N0VzMDNo?=
 =?utf-8?B?azFwSStYYTZRUXZVcmI2azcrTHRPYnp6cGtlUmRWOFdpQmlBMlZSOG9LYjU2?=
 =?utf-8?B?TXdwWmt2aXl0S2t0dlpzbUlqdVd0Q3ZJZkxJZTZlVkhHM01MMGJyMTVkTWRt?=
 =?utf-8?B?SHFNYURwVzh1aWZEQjV2WDdBa1pmVDdKZDF1RHFJSG0zbXQvQm9uSjdXUkZQ?=
 =?utf-8?B?eCs4V2NlNGFDQ0dmNUxZcWplUy9KSlBnK2xYQ0hQZEF1bzNiNnFvZFdJN05X?=
 =?utf-8?B?WFlTTGsvVHpUQzQ4N2NvZ016L0dVaThzOWRxVERBdmV3YnJhbHVNYkIxb014?=
 =?utf-8?B?NlVJWGFsTDdYeW0zejFzUlRTQW9hRUZmbXQ0U2g0em1iMmc4VXlpeWpWWGNn?=
 =?utf-8?B?SWZIL0NUV3ZBSXZlOWJLWkIveE9uOHhlMjdHL2ZJQ0J2N0puVm5TYWlacmE4?=
 =?utf-8?B?a0xuZ2YvOGdpdUFUdEtZR05JK0pXQWUzRUQ0WXNhOVliTlFJWXExd1B5RmFh?=
 =?utf-8?B?SXk1Umt1dnZqcG5JUTR3QnJQT3NKcmRnajRBTXM2YmJHU2xFdTBnQTk5aXEr?=
 =?utf-8?B?M21tdGY3Vis1cUVMWERyRm9tek9lYkhQbk9NRjFsQnk4bTFIRWxRMGRieUd2?=
 =?utf-8?B?WUlLYWRPZUpLL0hEVEdobUNqME1tRFRsQkxqUzk0QkJYdWlnWDZmdEt0azlv?=
 =?utf-8?B?dDdzU211eDhDcFBSWmQ0RDFrRkFKOUdSclFkbnp1NTVMVzY2c1RGVEN4QTBn?=
 =?utf-8?B?Q2dwd1UyYk1ZbmZuaXkvdzFaZjNubGt2Z0VDVW9USUZDdDEwdmRUdnFsMGNY?=
 =?utf-8?B?OExKeG5QRVhobUYvZTdYUEp5WENEazl6dXpNcTNwSkRhRmxmV1VTUEJkRGIy?=
 =?utf-8?B?cU5PTW1nTGUzR2ZFc1g2Nis5VWpQY0hkY3ZkcHNLMlJPd2hKZlFHU0pSaU8z?=
 =?utf-8?B?YXJ1ZUdSUTVSL2h3SlZWNEcyNWhHZUdYdXFTSHVsVVFZTnJtQ0lRRlBEUStP?=
 =?utf-8?B?UXZxdm1VSWJ6OUxvb2RkVGRWYzE2eFY0a3daNmJCcG9XUDI3OTNmQ1VJTDJY?=
 =?utf-8?B?c21qOHViYld1M2thdnJTV051cm5zVk1vRWhmZVpKdm51RGtlMDR6VjVGa0ds?=
 =?utf-8?B?MjlJR0k1N1o0ODlOeVVya09QN0JqYXpOejFDR0F3Nk9VYi92aHRpWXdGUlho?=
 =?utf-8?B?ZGtsN0VuNk1BWTFwNmszMENSR0NlK1hjdnFSWG9WRTdNQ1lWT2ROTGo1THcx?=
 =?utf-8?B?K2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad0b7c1-a274-44f4-343f-08dd9c4d4c1b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:03:16.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVfX+CPMaGFnaaZg60ZpBHcSZGKZU4lYtjZ2dOYJlTOeqcFOl5HnxyAeAz1acPS2h/UKKemlDqe6kUOvsBUzcpPFtddOiYTT7OsjU/yHboI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 12:03:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6926

Hi Robert,

On 5/26/25 11:43 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> Some simple rendering and grammar fixes.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Please keep the Reviewed-by, Acked-by, ... from earlier versions when 
sending a new one (except if drastic changes were made and you feel like 
it reasonably requires to have a new look at it).

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

