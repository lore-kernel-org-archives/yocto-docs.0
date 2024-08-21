Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91605C52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 08:24:22 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.70])
 by mx.groups.io with SMTP id smtpd.web11.15342.1724228652876609150
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 01:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KasEktO5;
 spf=pass (domain: cherry.de, ip: 52.101.65.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krn+2zzA2L6y46dL7qkkK1xvcvdez2rcT/BumNIstPyGd+NPpTch+5EHPK2AiQGMdS5vZQLGYB87lWcJSsbbYoqENRaW4Y4SYUqAyfKO5XtS5zyY2yT/Sy/+n0k1nFrtGhtyHGeJc6OnQCD8V9n7CTTUjZvuKP43hgYdiTnzfmh8oZD6NbYDoQVKA6DK1FwSloII34EbTV9maD/rM/RUKhf8j7nw8x048D0176Pk3Zl2GH3FYtkpMCw2kNNmBdTA9qaZh0c7yuViX5Fsoqt9CMdu4nbFK2453kWMk5SsLl+L8qVOP/qiHMwhIvbbZZpFzOUJkqYttbDN1Bf/E2+fAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAwgrTQ0pNIRmH0CnwwxG+jwP7Em/m8k/wOh8jSC+r8=;
 b=sRPpVimAKmB5l/hAObFBjHuzSqyBZ3Q/LWdtEFxkVbluBhDgyKmhW8Q4ZGyHquH21YK6RgudzyrEzLc36nJrtBVejwmcabgPe4dQpgo5RljhQo0vLU5fGzc5MbDRi3fffnhMSOEw6E2vdXFq8FWoidr0zmr4iOU/MIwfS4pXZL7QCfxzAMV6Yvb5VJNi0jYvxyArTGWiCpQjP7Acj3KvOFXrmJ9WWxWKrbrNIVb/2x6CdRlHPNGkzNtpgIa0lHfjdXgAAd0ueSKKpVblLjVfkjnj0x2qYFj98xyBSHAzNNN1cQUwPFDoBg+FKhFjyQxZGzighXt6BIxmmDOjCt9VNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAwgrTQ0pNIRmH0CnwwxG+jwP7Em/m8k/wOh8jSC+r8=;
 b=KasEktO5db4TNq7uR1n1GFfv4xC9YPMD0hgAa3UUHnRH6+23lTQnjJ+VVc6c7AbSWqUGm5dQHUYgZn34tfJIGxFcrAE+dDa2eaeguT0QSi0eNeZ0aQSc8iNO7D5A4bhXckOtQ11UX+zsm+0boFUakSppyH3VV0aBq9XN18pRyZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10441.eurprd04.prod.outlook.com (2603:10a6:102:447::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 08:24:09 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 08:24:09 +0000
Message-ID: <e2dc2b8c-9b01-4f9d-8e7c-f0d6f4e8a751@cherry.de>
Date: Wed, 21 Aug 2024 10:24:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] test-manual: Add a missing dot
To: peter.kjellerstedt@axis.com, docs@lists.yoctoproject.org
References: <20240820174639.3510467-1-pkj@axis.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240820174639.3510467-1-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0352.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10441:EE_
X-MS-Office365-Filtering-Correlation-Id: a2887af2-4508-4611-3cc5-08dcc1baa136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmtyaEROaU9pL2FlTm96cnZFUkNOTXNWdVNES1FZZm02NzJEYW5ta2tMRVds?=
 =?utf-8?B?dWYyakY5U3F4VnAxOXo2TjBCdVN2c2tTNnRldE5vSU1RU2xJUzRLRmRWajc3?=
 =?utf-8?B?YVh2LzhUUkZobGhzVSs3ZGIwNUd1VWk0TXhYeDU5M05YSXRBME4wN1RLTnhY?=
 =?utf-8?B?cEFmUXMrQjV3aWJZcjlzWTVlQnYrYzdUUWRJUkg0a3lzSk1URzhSeTJ2VVV1?=
 =?utf-8?B?dzVNdElWMmRzZ2FBQ1dyaHJyVk1qUEF4YndaMUpyNlB5eG9ZazRGQ1pndkJa?=
 =?utf-8?B?VjU1S1hnUW9IZ1h1T2toR1k1S0RidVA3R1ZORVI3ZkMzQ3FVNDNPeGRXRU8z?=
 =?utf-8?B?eUdoRzVoSDlHNkQ4cGNOM1RxNG0rU241aDRzeSs4TWowMHc1V0paRFFhbWJ3?=
 =?utf-8?B?UEIzbElFU0JTNWxVRjhLOGtsOFJUZDVmK3lINGxpQVV2TTF3L01hZ3gxSWhk?=
 =?utf-8?B?NXV0S2JuQzZCc0p5elZTTURwemVlTlp3bnlPaXlXc3EwaldOZVNhQU1ObWtL?=
 =?utf-8?B?TVN3RlBxY0xsSDhIZGczSEZOQmowck44WlRsRktySUdoVG44L3BZMXlLZ3hm?=
 =?utf-8?B?TlZmaWpkN24wN1ZYTTlFdHgwa011ZFVxMVZuSDljWkRBbHpOR2RPYTRCZDR1?=
 =?utf-8?B?U3ZQU0hxVEJVRTFHeE92QUZ1NUZqYmNrYmdEMGFjVHl5RGRzTGNJMlFrUC9X?=
 =?utf-8?B?TUVnbUV4c1huTWtOS01sYWY2UndTS3JpU2EreDdtbjM0RkE0YzBiZXJEVS9l?=
 =?utf-8?B?WGh2NnV3Z0lmcTZGR2Y5aGhCd0kyMHlhZFdaUzFQQnQxaFp1S2RXNzRKbGxn?=
 =?utf-8?B?ZFdNTFg4OFhzczZhRG9NdXZWdGUrZzJOTGQrbnpvUkFtM0FydG91SjlPTXcv?=
 =?utf-8?B?TjFOcnBMVXZaN1FuTkl5amZBbDdPajdDZVU0eEZVWDlKZGQrWmEwSmx4VFZi?=
 =?utf-8?B?WHp5Y1JucXh4RmtjZUowVGpIeE5BYjI3RDc0SlFsSHFjZGhCUCtjSXNIQ0FM?=
 =?utf-8?B?bFhPdDlncnFlZnczMjJPUUVsNmVFOFlQbjNiQ0FOUlFsRDVRSlBiR3h1ZUhY?=
 =?utf-8?B?UXhtTVhKSnUwMWxaYzJROXQxZDg0LzM5cmdWamI5aVdSRnN5U2tJTGhBd0FE?=
 =?utf-8?B?cW5hUnhySkFxU0N1QitVUW9pU2ZjbDZvWDUwWElXdG96NXZQWUFhN1hEQmI1?=
 =?utf-8?B?eEVRUzZlVDZOdURIeG45M2o3VUNOK0I4bXhYdll1MkdKbW00d3o4UXFjV2xH?=
 =?utf-8?B?ZXBxZ3g4anN6Y3ZCUEVQZkJkeTEvRDRTQ1VVVTRFbk1xSUluUFROOEU2Ukp4?=
 =?utf-8?B?aGs0enNGL2RaT3hZeVc3ZlhLd2krNWhkbVlURzVURHdjNlB5Z0dxVUhrRjQz?=
 =?utf-8?B?cms5dTcxN0VyWGFrV1N3VklZeVg0QjBwUWFyTStqNnlyYXlER0Y5NUFiY2N4?=
 =?utf-8?B?WmQyTVNITFc0cnplR1NSRG1WZ3BoclozK0xwWGFWTHhDbGhQM0tDU3FmL2xW?=
 =?utf-8?B?Yi9semlSRHpqOE0vdHJ0NmRkaVVxOG5OcHV5Ukg1dTRNN0hLcXo4RlhKenhr?=
 =?utf-8?B?Q2xYblhvUkJIYTZyQUgrR3Nveko2YnVBa25BZXV3VVEzbitldEx6OEp2clRk?=
 =?utf-8?B?MHBQa1ZOZVNRd3VMSE5KN1VFY2JxVjJHc1FYTXJVY1drdi9lajRiWVdvcEcy?=
 =?utf-8?B?Z2sxK2tadlVlZ205VHdWNlRkY0Q3bUQ2SlZTVlNxOFB0QXliUlRzb1VXSmtm?=
 =?utf-8?B?YkI3ajVqaEwzL25mN3BHWWV1RXk2WEtUNkJsMW9XOTA4a1FzMTdwN2hLR2lJ?=
 =?utf-8?B?ZVJ3VUgybGtFM0ErRFpxUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bS9lNW1sMzNmMEpuNDNXdXJsU1l2blNITTFKWmM3K3dXQXIrWSs2Tll6a01U?=
 =?utf-8?B?M0pFMFVGNDJUN0lES2pVQ0RncVMxK05XVUJlTytSMGFzbW9LZXhVYXJRZGMr?=
 =?utf-8?B?UlQyUjJXVDQxUGtNZ2o1WW00RmsxbUtaaXFjekZoZEU5SzJ5bDh6STl1VFp2?=
 =?utf-8?B?ZWhqVXVpNzQzMzhUU1JTQkxzcFk3T2xxUk83MHp0K01Oa3VHbkVxSDNMekdn?=
 =?utf-8?B?bzd0KzZvTWhld2tmcFlqSnJHTktBRmNodHNHMXNpYmUwQlBmRG1VVjVEN21w?=
 =?utf-8?B?Nmw5Q0lGUm1mVjBmM3RjV0NEOXczWE5QVkMxTk5EZjNyUmVWQnBwaUhNWGJu?=
 =?utf-8?B?aDNvQUdidGRQYUNJb1B2SllCNHBJNkJFQ1hBbm5qTnpTS3NScUl4eWpQTjda?=
 =?utf-8?B?aTl6Y2h4bUNtVFRjNEl3eFl3cjBzNGgyeFRuM3dPOTUzbzlIbjU5VHNseXRh?=
 =?utf-8?B?dFlkNHB6Sy9OT0RVcHF4alVJaEtZbmpKTTlzUzNhZFppdXVSTm5EOVJhb0VM?=
 =?utf-8?B?SmZnUkUrWkJuNy9jOWx3MzBNQWNWall2UHdaYU1aeVRCcVJVdVJhRS9DeFky?=
 =?utf-8?B?K1MzTmt6bE9kcXVjb0tTbHBjTmVSTXlxUm8zemtzZmdhVTE3NTJJU3BLWUtV?=
 =?utf-8?B?dkIvRTF3dThnaEh3R0xidzV4WTZ2TDhwWGJmNG96UGo3dnQ3RWpNN0dIOFh3?=
 =?utf-8?B?Ukw4QWYvSmZmMEdjUGd6WkxRaHRNaTd6MVRVbnV0ZHVla28xTDJQQ0xUTmF3?=
 =?utf-8?B?SmMvdjBTdHFNTWNwOFFaVDNBSWg2NjVWWXNTZTA3VnJEY0pKK3BGQk8xRDF5?=
 =?utf-8?B?YUdFa0tiQ3hYY3M3WVA5Sm56QTFqRm9PUGYvbVZ3ZjhudU1DR1hOVURmdCt0?=
 =?utf-8?B?MWxLUVgvaEE5SzA2SkM3bVg3S0tMd0VaRnFIZmhlMFI3azc1RmtOS0JLV2xo?=
 =?utf-8?B?U2MvVHFMYStzYTFzMnBCTkp4UUFaTHhaVmdqV3dHNE9jVHJjVitzOTkrdnRK?=
 =?utf-8?B?N3gyYkhCcUtOWFN4NUxLSzNrRVRRdkFvSG1lQXFHeXY2MW5KWGRIczdlbXBm?=
 =?utf-8?B?UTRpM3BHYkN5REMyd2JSeHRRSFN3QjhuSFBoT2pRb21NMGJiMlcwZVdnamVV?=
 =?utf-8?B?VDV5S3U4QS81Nzg4aXJqeVd4c3ZRcUFBKzJ5QmZLZFNzY1JIQ0FKNHBTb05G?=
 =?utf-8?B?TVloYzlzMjUzdkd1ZG1LblVsRWpqUWhFWUdocXRyWDR5YVJHek5MZGM0SVNN?=
 =?utf-8?B?d3RlUEJ2QzNLVHFoWnNlVUdRdWRKMmtoZGVhNUdXclVmc2svRnNLSE5nOWpM?=
 =?utf-8?B?RWJ3dEdlcFkyaWhVbWw4bTd0T1VSbVA5UHN1SFRQTWQ1aXNQYjE3VXNZU0w1?=
 =?utf-8?B?dE9QSUpZa1VHV3hBbGtERDd6OHFoNnJIdU9RY0dXY3gxRENWY2pDZENpbklG?=
 =?utf-8?B?Z2hjUWdDeUpSMkRTbjZ4RmRuSGNpUndqMVNWUXQzV05SV3U5MnJmdkV1V3Q3?=
 =?utf-8?B?NHhpcEpuQTFWMVdXNTFIbHVGOVBkQ1hxMnNKYXp1N0ZSRlkyZjVUMFJUQjNj?=
 =?utf-8?B?UXd6aHdTblF5ckNaMTdLNVQ5L3JZdmlCcWlON1NHZStqUXpUVXQralMwY3pn?=
 =?utf-8?B?MWp0eWwwN1NqUTFVVGJjRE8zWmNjLzBiblhkYms4V0M0WHd1TTBCbkxCS1VS?=
 =?utf-8?B?cEtEM0FYakI1dWNtMnUzRzNUYVp5NTBNWi9TN3k4NktCQ2YyZDhGTzlmYXBO?=
 =?utf-8?B?MTB0MHJmRHZ0V2NWRnRIT2NXbUtCU3puenNOUXVGSFVpM0dtV1F5MTY3Q3dI?=
 =?utf-8?B?bllxVEZObSs1aVpTN3Z3VGtLUlN2N0hCT281TG56RTdZamVVdXovNkJsRHJV?=
 =?utf-8?B?UmNCTmwrT2NDU0hkdm9KWTZ5RG5GUkh4RmtoSml2MnlUL1licU50UUFmY2Uv?=
 =?utf-8?B?ZHlMMVZwNFVNYkxrWGNIV3ZBaHBBdnU0aDVxVm8vWnUwdUk2NG9xWVg2T0R6?=
 =?utf-8?B?Sm5ZV1hESmxTYkJiUkNCc2U0a3FqYjJpdE9tZ2pzaWczdEZVUTNEQUx0U09a?=
 =?utf-8?B?bFplYnE0L0JOWlh0ams0aGV5SlpoQjFMK2FhLzZkaHYzZlVEM3NBOVdMTDRG?=
 =?utf-8?B?aEl1OHlFaDU3cnFyVjFxQnBmcFlURzB0dFozMXE4T2JSRHVGazlSajIzeUJ6?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a2887af2-4508-4611-3cc5-08dcc1baa136
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 08:24:09.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ax2UPk3PryhmafpeonP9rmOtFZd0l2RvbmH1jdaKIZz1QDVJ2Z3axIRsxubed+TDHGsmfPuev0/+q1lBir5wBCV3LWKiNWN7GbnCNLWELw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10441
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Aug 2024 08:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5337

Hi Peter,

On 8/20/24 7:46 PM, Peter Kjellerstedt via lists.yoctoproject.org wrote:
> [You don't often get email from peter.kjellerstedt=axis.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Correct "oeqa.utils.commandsrunCmd()" to "oeqa.utils.commands.runCmd()".
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

