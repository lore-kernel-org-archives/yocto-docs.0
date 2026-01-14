Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AF9D39001
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:41:07 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16202.1768412462822144582
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 09:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=B/3TSblX;
 spf=pass (domain: cherry.de, ip: 52.101.70.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAje5Y6q9eXFnIvgtWZKp8Pgvkey4+nccvIdIKtXCIYwetHnIu0ycfg649niYV3TWGaHKq+k+AtALQ+a4Jt42N+IA4GHv9HDJYIgoXlzDgdYpK7uJt0AJyXzNyPQCWebGw3RhGkAkXvsYWLl3j576UqeDg31vuXePZxvDCbxKeHWT25xBpSqKlclwRBSnM/CLcR8vIvFRycGGJs6NiRW1N9lwRNG2lZFYcDzT6xiKkWMrXF1FXhFMBHPvyFtHL1BcwfIXALFhimAgd5iX0ZVW4BEiQ2TUixUIdfLomfDFdWX5AWTDXtWjtKrH5saJmDIMez7J5Z1TFcbXB/tEZbEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38ormJQ7L0TrJfq+PN/lfZ3OQrQLYF9cA0cmuT5z61o=;
 b=W31tOmeNtEi/AlUxflPWWVix5YhqWiFkyDdWn2XxzCJx9VYeXkIyuwr9yCmu+3rgF+AQzAefyQitpEQoRJK7NhKt6trT5OxZQtzjUGBlp3g2dAMmAJVU2ExMg/ScGnOda8lRzK/Ex13kEhdlOALGIE8hVNwEEQFo9V9Ce7M1FO/0AdUoaiXY6oEDJWBiEyUPGzDtHX0Es1b25ZrcDe5wD1TuDxGJJFJwR6mL5hUo3sh8ZHEgthYnrNjJRDJid5Mg2uu4GUHi9e03g/cLZar9BnwrobLf+W3SClPQeRXQse34LeS6XYSKsT8Ge3+RJWDo0NS5cqGyHi7vrjROjRgZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38ormJQ7L0TrJfq+PN/lfZ3OQrQLYF9cA0cmuT5z61o=;
 b=B/3TSblXtsUdjBH79Bc8gceTyzaDd5Ig1sZuyclfToMP8czQ7dCbPwpiVbptlXvcQFAju0TMCbDFhFi9s/xIeNlIcVvXcIq7mFOMQ3Y/3ZEOR77vdPTThSkQ31x8zljVVpHONugnjTGhj6YVHFifEGrJU+apTV4sss+kVv7fMpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10708.eurprd04.prod.outlook.com (2603:10a6:150:225::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 17:40:57 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 17:40:56 +0000
Message-ID: <4c573ac3-2c69-44a3-b9ac-42dd3dbc136e@cherry.de>
Date: Wed, 14 Jan 2026 18:40:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] must BBFILE_COLLECTIONS use "+=" and not just "="?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <824c542b-08cf-0ded-a1a3-732a363294ef@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <824c542b-08cf-0ded-a1a3-732a363294ef@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR0102CA0098.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::39) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10708:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9ec10c-3661-4c1a-0fb9-08de539412c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b2ZyaEM0cjZmelhzQTJ3Nms3MmRRVmVsaEhPcWZTOVFCeDdhcjlNMnkzTlUr?=
 =?utf-8?B?OVNtemFrU2NyNlFWMTVwL1JYYmJrcytLVDkrNm9Kc1hCTUQzOTVVOWxrMFpR?=
 =?utf-8?B?T0s1bFBjVVg0angvYVdHazk2c1pBQTNnZEZXaUllV3NJYThwTzEvbDBuTmpP?=
 =?utf-8?B?OUg3dVQvM0UxRXFmR214Zlc2Q0cvbDI0VG80RVVQRElnN2JBY2h0cUdMTWth?=
 =?utf-8?B?dEFDMWt5YXM4eXVQWUNYREVoTTFFdEV3UFN2MlVQRysvVXFFWTZhYUtBbHdk?=
 =?utf-8?B?RmdaV2t1UnpmT1dxTzZjOGVzUllHZkdzc1htSkQwMWg1bC81UDZOaU5JS0pu?=
 =?utf-8?B?dDIzVlcxREdxR1dackt1OCtWMCtCZ0IzZUJUUlgwWEc4enI1SjZGM3FseHQy?=
 =?utf-8?B?S1VYbjIvTUhVVE02N0RVaVI0V1NvWW5LUXdScVNFL1R4YjRheWNMdmhQTFBa?=
 =?utf-8?B?SGlvSXBEUFNhaE5xOFFsNnZiZ0hPUzJ6U3J3c0VTSWZBR0FTenFLclFOQTV4?=
 =?utf-8?B?TitGSlBXTEF2cS92YWlnUFY3L1hwN2tpMDlnNlNrSVVKOWZIUkYxTWJsdkY0?=
 =?utf-8?B?dTlnaDBYNFhyWG9qSVBVWFlSL3BPTjk1UHJhMHlPRExnVnM5OVcrVkovclpB?=
 =?utf-8?B?OTBpQ2NRd3FvR3VLNUU1WS9GYm5oRUJTdDcrMTRZM2QrZTdtWnpTeEx6WlY2?=
 =?utf-8?B?RVROZS9zQ2VyRkoySlpFYlo2ekxDcm9zdXE5clN5WHIvZ1VuWjk5MW43YzMz?=
 =?utf-8?B?a2hmcGN2czZ6YXlWamhiMHNxc2liQlluVEJnTmNaT2MrZGhYdFhCOGEySThi?=
 =?utf-8?B?aXBhYWc0Sm5TQjFRN1p2R1pmUW40bTN3OXZBZG1GVkdSTXNRM241dk5DUnEy?=
 =?utf-8?B?Q3Z0Y0p4NE4wdUdwaVdOUE1Sb251RmpLMUg5end0R2JDcU44MkVyT0NDMjlX?=
 =?utf-8?B?bTlSSVFhemU2Z01BZTBIQlk3K2NBcncxcHJRbmZrSEtTUWpkZmFlMHlXdzY3?=
 =?utf-8?B?S29sb2V2b2JxbFRjRjZTcGhmbzlzWGFSb0E4bnNWQUJ1a3g0eUdyOW50Y2hS?=
 =?utf-8?B?Z2dsMVkySjJFVkVQajFnZDlIcWt3SWxDVmFITnZYU3J3NDVHL2RZanp3RnBY?=
 =?utf-8?B?TUo5VS9qMXlWbUxKM3RRcGI0cTNacnlqa1kxK1lTQnFWdEhRalhMMkt2cXky?=
 =?utf-8?B?Vjgvam55bDJiQ2RkbUljazZUcTQzWkJWdE9KdFpXTCtNNXU5SFlhRFJlaFRR?=
 =?utf-8?B?MlpnQ1Q0aG12VlFUa1pNOXlSdHd4Y1NPR3dKNGFMZUpHZW9ESFl0UWhpbTU3?=
 =?utf-8?B?ZnVSLzVWdW1HSytBOWw3c3JnZEViaGFLcVJiaUNTQmc1empBN0Z1MUdwdThs?=
 =?utf-8?B?dStVU1pxV1NXT2NJN05hLzRTTnMybUtOdHU4d2JnYUlPZEJrZGpVZXgyakFr?=
 =?utf-8?B?VlFianpPZjBtNmthRTVlWTlzQml4cS9yeTJ5RWw0VzdHaVN5cDY2OXNUTWN1?=
 =?utf-8?B?ckZITWZnUDJiY21lY0dWeWhHODV3M1BFSXNzRDVNVFc3S3UzZVJ5WEU2UDFB?=
 =?utf-8?B?QldyeThLc0FqSHJ3QXRaajdFREpEdWc3ZlE3T0I4c0hIQTRvdFI0cHVwRXVJ?=
 =?utf-8?B?QVBHNm8velZjR1Y1MlhGcGZvTHk2ODBLNnRKZGo3Y2FoQTdtbGxBYlIwZUkv?=
 =?utf-8?B?TWt6TndWY3ljbGkrUXR0c3J3bkZoNlNHa1MyRkF3OXhNT3Bwc0Vzak9TOWQ4?=
 =?utf-8?B?WnliSXM4bnBGN21iN3UwMzlGTDl3UlVqTUpKYlAxaU5JMEdQSGxXUGVnNHNU?=
 =?utf-8?B?aThkeWtSOVdQZG1kbW9XTEx6b2hIaE10TDAvUkV5akpwcThrTm9sYzlPaDRy?=
 =?utf-8?B?V2VNM2MvK3prM0FYd0kvSXdyNm1La0hSVTR6ajlMSU83OUUvR0hvMjBYK0l2?=
 =?utf-8?B?Q1lHM2RibnZ1WUp2RjdmSnp6dWJVb1YwVEEzY2hsRXQrc1VoM3lJZG5pZGRP?=
 =?utf-8?B?S1BCWG5uN2lEcm9ya2lyRWQ0d0lrL0JVTHNSbkxBZXVCcjVqQXFUV2hwNGZO?=
 =?utf-8?Q?x6xhWP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?REJXL2F5ako5Z0x3WVN6SytGM3dsTkthNklvMHBWbGF4WldnVTZPR1VlVko4?=
 =?utf-8?B?UmRlZFBTeEJWYkYzM3Z3QlJKYnhxQmpFUE1sazAvYmViMEowYlJBQ3pjNXZa?=
 =?utf-8?B?TjNEbGFUYWxCTUpYcmpMaEZibE5scmNWclFGMnFJQTl3TDRNVm5kUFRsY0NI?=
 =?utf-8?B?RVhLQk5nNEovam9TTUVsaTcxNmRuZGZHdDhYVWd1Yi84NUgvM3B3U1grb0xt?=
 =?utf-8?B?M1lqTWU5WnZoZ1F4M1BuUHRIK1VIV3N5VWpvejdWK1hhZlE5cEgzdDVjQk92?=
 =?utf-8?B?RkxENzFNV3o3b1o2SGJDSFhrOXNmcCtheTBSeEhzV09Pa3poRlozTU0xZitY?=
 =?utf-8?B?TEJqTG9PaFozQVNLSi9PQWJaU1BJeHplYTllOHpWbjVkcG9DVXRVcllXaXVL?=
 =?utf-8?B?TGc5SlNjdGJ2WmpPSTloVThiczlEWVJWUFRxUTU5TzFIZk5zWG4wTHhMZU5K?=
 =?utf-8?B?UDAzRkhhNFV2bHNRLy9ITWtZUE9ycDlnNkd1WFN5RDdFald2WkJJMmlpK1dx?=
 =?utf-8?B?VFF1KzFkeUMzOFJCQW9rbU5WUXUwdGIzcEQ1bFoxSHFicW1PeGdvc3ZZQUV0?=
 =?utf-8?B?c0ZscVRLbnJyL3JjK25lTU5QbGRWUGtMN0FjTWpSMmVBVWRTVzU4T1ovWE12?=
 =?utf-8?B?TTJsQ3lKK1Q5OWtyb3BDVUJqNk1EZHgzNWUyU3plTmtLVzh3bmk2d0FCZmNw?=
 =?utf-8?B?RlJ5c0ZQaTY5K2NBM0svcWNRelV5UmJyMm5nWnBuU2x1eGJPQjNjTSt6eE1a?=
 =?utf-8?B?R0EzczVTdU9MblZwSjdPNlB4cHFsYnZZOGRPalo5NEZScHp0OTFWS0pGcjBz?=
 =?utf-8?B?bXRONDhkcklYSG04a0k2dkg2d1dFNFVWSDFQSkJXekxDWGNObEtFWDMvNGF2?=
 =?utf-8?B?cXBibFhOUlp0NGxuTGM1T3FUdlBCUUNCbFBXMkZieitXZ0ZPY2cwdzBnSkNp?=
 =?utf-8?B?RENNQ29pMmdsN1pPOUI3Q2xFOUkzTzZ4Z01ZVUFsQy9IMlpYVWlkdEUzOGk5?=
 =?utf-8?B?VWUzZVBYbFBhZnFndlEzUlZPK0srT0JuaGt4bUdRY25hb2MxVHhCT3UvYjhQ?=
 =?utf-8?B?bjY5cEhST1VxTUZ1dUJKWjNsNTFTTFVNOURPVXRybzVxR1YxbFgzNHN3V1Bt?=
 =?utf-8?B?Z1o3ZXUyT2VkWG95L2F4a2crK0dxc1lGVUdEenZiU3VwWG0wSHlKaExza29M?=
 =?utf-8?B?VXNsTlBmZjhGZ0Nad0lTYlY0dTZxK1hab2xzMGx4U2xWOGRNQUNTd0hvVEk3?=
 =?utf-8?B?ai9LVmJZc3RQTXFLOTdUSEhiZEVoTTV3UDUwMUVmSlhEWHdualliNnpGOVJY?=
 =?utf-8?B?eUNrYmROT0E2cW82VXJIL2Q4L0pYbkJHVEFZdEFwSDA5dVBtMDZBZUdndmxv?=
 =?utf-8?B?VUowSlRHYWpQdWg3ZUhwQXpkL1F2bXNBYndyZFNOb2VjYVViQzFDUDFaM2pj?=
 =?utf-8?B?cEl0cEJsZ056RVhSK2V0L0szMDQ5RUxVUVlaWUZnellNOS8xQmtrbDNNYnBL?=
 =?utf-8?B?U2Z1TzhQdnphOHQ5ZmIzSnAxRkVjUFRDcVBXekpPYVVpQVd0bEVWa0dQaDcy?=
 =?utf-8?B?MThrdWtvMXp4UVhVNUtVbU53VDRHZDVMZU5rcnlObXpSUnVjVmU3MmJMbkg2?=
 =?utf-8?B?Qy9sdE9wUzVMQmk2eUpDN3JaMWw4bnVlL0tCUEg1ZzYwMVI5WTRtSW9Fekpq?=
 =?utf-8?B?NDBBczVRZFdLL2crZHRYbW9CZkU5VUFNWE9PZDRsR0F3NlBTSTl5OVJKc1Vj?=
 =?utf-8?B?UjJFRVdoTG1IenkxcElXUnlQSXhTRzRtOFNSbDZvUGRyWDl1SDdIRUhYMzZh?=
 =?utf-8?B?cFI1MWVXbzNMTkxaZlYwTFJUOW5MK2ZqZnAzK1VxaGhWdC92Qm5jY0pDQ1Zi?=
 =?utf-8?B?QU44RUo1blVQT0VKME1hcTZVUElZekR6anAzRUprY3JNNW1DVjhtV3JMSE9N?=
 =?utf-8?B?dUdGZm91YWVnenpjUk9DdUJ0RWhMRklHcUFkUEQxUGhvbG1yL3diaFhXT2ph?=
 =?utf-8?B?Qnl5aWcvTi9MZWY3SVVRR0dMWXh5KzZCQ3kzbklGSjBvdk1qU21IMm9Ob2pv?=
 =?utf-8?B?R1RMQzkrYU5JVGJXK05MSUx6MlBqWHZNdWFTNkdDcVAyaWprTmdRb3Nnb0xn?=
 =?utf-8?B?TkpyNVFWZVNONGlNQkU5NHBieHoyeHUzMFQ3eEZES3VHcWdYYzFRWXFOU1RB?=
 =?utf-8?B?UHJGRGo0Vm8ycDdKUW9HdjBRaUk2QTJWNDgrblo0RXJZTGNybWh1NkJ6ZHNG?=
 =?utf-8?B?ZCtMR3R6djB3eS9RUkc5T3A0enUzc3cwM1lIRjVmdjR1bXBSeFNmaElOT3dk?=
 =?utf-8?B?dWU5YkJZSStYM1pFdUlOUW5SY1ZFWFZEVkJKMzNNRlJwVkFUUUxHZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9ec10c-3661-4c1a-0fb9-08de539412c2
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:40:56.9148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxYFyrX3TSvTUtYNvMVLj4Fz4Gm5Kq5rV6x9+gT4bY0zu38goJTu4Cb+HUe0pcJpKwNS3fhfNp5ok3q1sHx5dRKtDybxxLx9xDr53Z/NT1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10708
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jan 2026 17:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8561

Hi Robert,

On 1/8/26 6:29 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> here:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#locating-and-parsing-recipes
> 
> you can see a snippet from a layer.conf file:
> 
> BBFILES = "/stuff/openembedded/*/*.bb /stuff/openembedded.modified/*/*.bb"
> BBFILE_COLLECTIONS = "upstream local"
> BBFILE_PATTERN_upstream = "^/stuff/openembedded/"
> BBFILE_PATTERN_local = "^/stuff/openembedded.modified/"
> BBFILE_PRIORITY_upstream = "5"
> BBFILE_PRIORITY_local = "10"
> 
> am i correct in thinking that the assignment to BBFILE_COLLECTIONS is
> wrong, as it must use "+=" and not just "="? (that is, it doesn't have
> magic properties like PROVIDES where either operator works fine.)
> 

If you only have one layer it doesn't matter. Otherwise, yes, that is an 
issue. Try yourself to modify a layer.conf in one of your layers to use 
= instead of += and see BitBake complaining about not finding stuff.

One of the tricks is that variables in layer.conf are sometimes 
different. You can do very cursed things in a layer :) (like modifying 
another layer's layer.conf variables, and then it just depends on the 
parsing order to know whether you'll have your or the other layer's 
content in the variable).

You'll have the same issue with BBFILES = (instead of +=; also in the 
code snippet where you complain about BBFILE_COLLECTIONS) which will 
erase the value of BBFILES before the layer is parsed.

The other variables are fine because they use a suffix making them all 
separate variables from the other layers' (but I'm guessing you could 
modify those from another layer.conf without any issue).

Cheers,
Quentin

