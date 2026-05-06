Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EFACD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 13:57:06 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19172.1778075817585217524
 for <docs@lists.yoctoproject.org>;
 Wed, 06 May 2026 06:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bD+G9n4E;
 spf=pass (domain: cherry.de, ip: 52.101.70.28, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btF9aXMCeUo1VBT5X9qMW7XLxHSVqC2JSIzI2WzYM+Jnu7JUCiseXfSAjZZp6h4oTmo/CcX3YWkx0trF6mYpoN1m0z9T+Wb5GocSBIwNh3PYmil4IbwLMhSilVAPZdW0jU4qccpF2BLKc1PIdpC8901ZsDD2GrM7sVaDUIRqEKM1EaF/OFh2JAHQ1KyszNoJp7l5mY7Xk/i7lyaon8uPXvW2ftp98dScTrumi/0hUA8ziTwJTkH1s5EWrZ5VmnHt5g/ru44PzqSnbC+i9x6nGIgsNWpkVFkkoeGgzqYQI/w1Wep1UtGVAHYZ6rKLqso7vpGOOdru4ZUlIBz96lqLUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ayzgdxBkxffny04ww/T7UKgCwPXYLo7Pfhnkmniy1I=;
 b=fbtU0fX0KF9NjeQCwci1aq6+O6n8BUb5QQevEh8HDGSVwrUKrD7L771Nj1rQZG3dFc5vKqIIvH8n7dhyFRTqx90Y+Qcrb1dhbZR2FrB8hUZnuPWOrpnFzbMXa6kKie1rsmO0gg8f0tC2jbhl8yqG/r9nwsn71RDf6eHZ9w6y+F0na/2W6Ip/H5Eplp/4TMmUOe08y5n5PzZCq3HJEUFrVW1w/jSOZZh2Ejr512RLzh6UI4kVIJkVb2SlMaz232dpw3UzCNsRyzh7M97XRLCyaNhEj67W2R8dvEUUb0G/ptTYTsUBC6zJYZqp1J65kvPz9AujiE6HfWymcN5oGH6qeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ayzgdxBkxffny04ww/T7UKgCwPXYLo7Pfhnkmniy1I=;
 b=bD+G9n4EoABaAtG9OgnEI1+lZ28CbqmBEY424PI+RoqlDHeOoDIatL6Q9gvAT7d9cDojedhMU1gtk5ezsxZtGsByS2MDWlmkBu7f2HZishfI+ehFXw55P9uMOcoDSpysfxTNI81jJRtiX6r8HLtxm+WzldHffoUd5h53q61nG3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 13:56:52 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 13:56:52 +0000
Message-ID: <dc814cd8-b578-407e-817c-4f71682100a9@cherry.de>
Date: Wed, 6 May 2026 15:56:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 01/18] conf.py: define new *_path roles
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
 <20260410-second-release-notes-6-0-v1-1-40213436c3ca@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260410-second-release-notes-6-0-v1-1-40213436c3ca@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::19) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9311aa-7cc0-4a7a-71ca-08deab775322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1bk5rQzM5pQDDZO+8zzPtdwFu1X92FNAcAaIpKao246QOpti89VkGsK4dkjcOIgPGxaVwKvq0r+X+NigtqeaP2EA7hH4Kxermh0Z5ljNoVtytM21evPJs3UuXw0xC8yDhPvuVtqMwrNGRqymMU9IoyqNuZwcQ8ctTr93/KOUpqgsoXlWU1pBOQYV4m5Rm83qOWh/CWeQ1wR+N+OlJ72Ec6Yyebj9c9Xu7sYaUSUxdP6aZfOZqh32UW+E0/Uyztb3IAJESrK9U/t9M/vGAaHufOKUptC9SPrLRSAcZOu4gdSGHdHruZABI87+gxVX4cVdIDxMJqxzoZ5uikm263uejiCgMkSySCAmyIbNzdBSEwMo1NFNW2s4/DCp52fHD1P85vwtlpa+UUdcbYovGW78bC/qvJZPTbsEi0ZetkkfZLAZ4ynt8JgcqkYjDeVyTXSRTLnP/j9cCrEXy9Tyq1TJcKQHqhbyhZLmWmbyLw0izXkCIZsdULNmfnc657Mb+3a8ESdcMzASGa4IN0CFLMWv0Sq0aWP8/dz/IqS4BvZdhVSJ+XiTWZ1EvrSZVXjU2XVNX0+BXsNnkw5T5H2uNUJxGmBsCvZWDCfj89HDrAy75e/KnWKJkH75JH825k8SEDocePc+WX11CLHBGyJpC2yv5GuEBW4ngBQUuBh9Aa95lIfdX4FMhwQpB7WQk4DrIkf6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WEExZGJtNnROTFJjQ0ZGSUhDTXhONHhDQk84eWE5WXk5MFBMZUxFMHhTdmx3?=
 =?utf-8?B?U1NLN3RjbjdFMDFpY21vYWFjMTh1UkVtdTlqbkJuZnRnZ2ZUSWhRK0hnZllE?=
 =?utf-8?B?V2Q4dEZ1eGF1OEZSaG5yV3pKVXMyRytyS0hRYklpd0JVTVdGMlNMWlN0a3JX?=
 =?utf-8?B?MzlncEpSR3RrTUgyRnVMSEdrNG40RzNXM1lkZ2cycWxhbFpXNm1PTTFyQm5r?=
 =?utf-8?B?cnZWOUJOcUZaRFUxZUc1ZG1vVUw3TGxNZldnVHpiS2ZIWVJ1WU1LakZtMzBp?=
 =?utf-8?B?R2JiRUtzY3JTenh2REVtWmxqdFhCOW0ybHR2amlQVWRZQ25SL0RhS0QybFNW?=
 =?utf-8?B?eGZQUk5VSFNGYXNqRisxalQ1bnozQ0NmcUxHWFBYSWhaYW1IOXRIQktnZFZ4?=
 =?utf-8?B?SC9FMjBFa2kxU3N2RWFDS2FrOTZ0ZFRhL3craVNuQmVEaFQxRit2VXRDU2NH?=
 =?utf-8?B?bVlCa2xsWGYrTkpyQytwMnc0b29nQXE2OHNSbFlDVnBKSGNLN2ZKV0h3R3Rj?=
 =?utf-8?B?SXdPcEgxdEpVSU5tQTVDWGM0THV6OVE2Z1NMbE0vTS92R3NVc2MwZlA4ckJv?=
 =?utf-8?B?Uk10bGdvQXFZbGJrc2hFMGllekZtbE5IQ0RqYU5LRDVBR1orYldhVVlKUHNk?=
 =?utf-8?B?MGNtRVV1UXpQMU1sUGR3YzdTVE9tMGU3cUZmdFZLZzNNUE0wOXFJbHgyTm5D?=
 =?utf-8?B?cEwrLzRiYlVaMzR0QkhHUjFWMWVTN1N1L3IwY3cvNkdaK1Q2WmZETjlWZUpz?=
 =?utf-8?B?eXpHT0k2ZDlPbGVYTG5IYVN1b3UvUEIyVHpIZGJyOVpuaU9pT3ZpdXFMTTIw?=
 =?utf-8?B?WkFBdUl5YndaNUdoM0ZPa21zdEdENG9nU09UV0U4Q1B1UHZLeXZCVncwbzRK?=
 =?utf-8?B?S2VHSHhkL0h4UkRaQlFvTlk0NjRDQldpeHFCTGdtY0xvcUxIZUhhZVg4T3lM?=
 =?utf-8?B?Wng0L1N3MUxETSt4TGRvblBBR1ZZTjVVWjZOWlZTZ2hkaUtFc2t0SjFVeEZY?=
 =?utf-8?B?a0xlZlQ0aE9Pc1RTVXhIQnRiSnNtK0ZJYitZNW16encrR00rU3Ridk0rQnJF?=
 =?utf-8?B?T3RUR25sNlNtbkp6Z1dOem1WMm5zVTFmeElCdGxwbmJ6cW5PenR4UHdRWUho?=
 =?utf-8?B?ZmhrNVIrNWhHTmlmUDgvNWl0ckpDY1lFVXdBdW1pUFdXRzJmWGNyem9DUHN1?=
 =?utf-8?B?WHd1c2VWS1MvWENaekhibjR1MmF2MDlLbTJRSFhzeEVSM28yTmZ3ZVErRGFS?=
 =?utf-8?B?ZXZGWmtTc3NxeVVEcUJqQUtVeis5cHhIWGRraDRKRTRxVXhXelhYMDluUm0w?=
 =?utf-8?B?NXIvTjkzTksyYXl0M01EbFR0ZTBZQmhZdHlNay94SkluUlUzZ2RDRXlhK2xr?=
 =?utf-8?B?Vk5VWWVLVUtMSVB4dzFJOXVqOUcvYnY4T3RuNlkrV1pJK0cxQUZuMGd0UEw4?=
 =?utf-8?B?U3Z0cmdtRjh4ZmxUOHpWdnRGQmUwd2RweStTYTR6aERqRkkxeU1ZK2J3WkVQ?=
 =?utf-8?B?bU5NaDFDSWZjMWhkcU9MT3VRUVVGbzJlWitoZVFRMURRY0l6eEl0SmdCZWFN?=
 =?utf-8?B?VE92TVFIbndGVEI0MlJTNkx4MFlWbFNkeXdwTTl4Tnp5VFBkYTI0by84ZWJT?=
 =?utf-8?B?WkRCK214dDBDdGZUcjg1V28yUkpqd2E4WGtGSExSNkZORTZIeWdXYnRLWEFa?=
 =?utf-8?B?REw1aGNjcStyckNaMnkydnUwMVIvMTlqcmxLa0NtbU40OC96d2hBZ2hPa2Vw?=
 =?utf-8?B?T08wWE5pTTh2azVkSmh1L3BvWVMvZWl6bTBpaC9xUTFINXdEVDJMci9yelZy?=
 =?utf-8?B?YnY5REpYempTYWpYYURMR295cWZiSklENnFVRk40R2lwVlQvRTF0RWlWTnBr?=
 =?utf-8?B?VFZqemhSdVpOSVdWazNqd1lGc0x6czRUMDRxUEhINnFBbmU0aTR4bEw4VGJp?=
 =?utf-8?B?Y25pNmRScW1Nc0cveUJNb3FXSmVMdU5vV2JqaEZOd2pLOUZ5a0xFQ2RXTFdD?=
 =?utf-8?B?YWowSmRxN0RLQU1zcGtzMnFmMCtWWGg3VHZPcC9WcjkxdHZUMHY3NnhkWmQv?=
 =?utf-8?B?VUo0aEdBRGU2Tm1TanVuSGhTL1htcG9RdHF6UG9na0FyVjRWSnlhWitvRGkv?=
 =?utf-8?B?OG9LY3czRUFpYVJRc3ZsZnN4WXlJVW8yUUw3STFscHBNWFZUZndvZWhJaHBI?=
 =?utf-8?B?MGJRTCtHaE9zRGNDTllpZEZHZWc3QURDcXA1Z0VSeWVsOG5qZlk4am5vMkQ2?=
 =?utf-8?B?N1BnTTJIVWkvL2xxcW9ORDZoc2p4YStxZnhMZ3Q1QmVOVEdldC8vUytaU0dY?=
 =?utf-8?B?Zm5QeWV0YUlzRDBJU2ZQZGVNNzYzYjFpRkRaQTRaeDc1cGV6blVuWm56MFQ4?=
 =?utf-8?Q?vXGh6j8txsO8UCGZGMXEkCFmCwZBfrTxFpylGYGFjf6so?=
X-MS-Exchange-AntiSpam-MessageData-1: TZzRqdUbd6iEkVqRatk2WWJn5+hBKmvqVGo=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9311aa-7cc0-4a7a-71ca-08deab775322
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 13:56:52.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD4SF0a+TinfZDG0thj6g2WoY7NMWGrcHb/L05Aj5l2p/fAOn3i3MRIYvYPhLyMpuEiMUUpfkieyX08t7s1VHsWTgHU9VdgOG/AmBWx4rbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 May 2026 13:57:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9394

Hi Antonin,

On 4/10/26 4:43 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Defines three new bitbake_path, meta_yocto_path, and oecore_path roles
> that can be used to quickly reference a file or directory in one of
> those repositories and link to our web interface for the path, e.g.
> :oecore_path:`meta/conf/bitbake.conf`.
> 

But that will be using the master branch which is a drastically moving 
target. Shouldn't we rather add the bitbake/yocto version branch in there?

It seems like we can provide the branch to use in the URL with ?h=<branch>

Cheers,
Quentin

