Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716A3D0C618
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 14:24:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web10.13190.1729866262542951175
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 07:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CRpaT8V/;
 spf=pass (domain: cherry.de, ip: 40.107.21.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyD+Ds3d5vEcTPTDjAtZkrnb1czp8s7BOwDu+wemGnE9TE6PEikIrQXNiJ+1NzISiV+tRkmgjVRKXD4ZFKUnS7HXe1hiEhSG7StD47JViOPWLk5IJ7xuDxNRbj1Mi6i20HZKZLozlN4TywFVQH4siLJ9SDCggJspBHNA7Wp8S8ON+9kU8oy5eB8bRvURWoWynmwb7JWvgPk5vivk1+lZMkVffE8ojTnQw+Kj1wQsMG09Gp1ZhhWkqJCxnfqKOsth9BoQgsu9YpghlsatuRfkmKlwq1ZZCfT0ysk7QMXGM7EMPEsksaQg5W9pKZqL75RGu9MEoIzZh39NbwwbRsGg0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10fWmkrAYM6LZlcqK63jv6bHOu6c3YT/BzDf+u7jgMQ=;
 b=OrRJE3MYgBbMC/F6UCuGPo5r4Wh2376qqbMhb1KsFXOcHug6boyGt/zf63sAW1bsuhltYf/oEh7htvs0Eq2UJ/3yZXY/K2OkVlQ37/EuRGijT5/HYudEs7FGmq33zceE5NY2L6f+3SLm/uAD/kw/4cvf4BeuvEx4gAef9YOqb5YeY+HcF1e3tCUUWd6CirFZx/RuUq2jC0FAizUcJI07EUSiiKcKVixufrZxR6/FJjxUgB7NEggCm9nyGW7CVL2IAzJFqzz3kAUlyvFMsJJklHx642ABmijXZHmEPOvVMNmHsTIAYeCTPU54nu5PHJO5uH5f/mZpwwot4J9262yK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10fWmkrAYM6LZlcqK63jv6bHOu6c3YT/BzDf+u7jgMQ=;
 b=CRpaT8V/AcmsJT4oKGBKKNwYXR8J1akqSNgq8atSgTBiusAepcSfSP/kYyirN3yZOnThJofF+NhvPcTA6XWlFFRMhdf4ffUoAnLHl+kqlWttZ7Xub+6hIcNXuZdZpjxsGmbDx5dA6csRpp25je9saVcZK+sAE6qfjPCTWh9q6F4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9487.eurprd04.prod.outlook.com (2603:10a6:102:27c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 14:24:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 14:24:18 +0000
Message-ID: <0006cdff-a101-40f4-81e5-c23540bf4df6@cherry.de>
Date: Fri, 25 Oct 2024 16:24:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] docs: update current releases
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241025-update-switchers-v2-1-290a6c777a68@bootlin.com>
 <08d90707d7524f11e37604749c1275aa771fd073.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <08d90707d7524f11e37604749c1275aa771fd073.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b98918-b301-4ced-1872-08dcf500b5d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVpSOHZsbzdNVk54dHphNzIxaDl2VzlNRVJUS3pQTExUMlJOdk1keHJmaEk2?=
 =?utf-8?B?ZkpKWHpNWlRwVk82Y3BNNnU2UEVCcWFzL29VbEJGelJvSnFkcHBham5rRFls?=
 =?utf-8?B?Q2crcUpacHY0MllJUC9pZC9hckFYaWZOOGV1VFQ2QXFUZ1MvK2YraEN1bjdH?=
 =?utf-8?B?N24vTzN2VlB4SldVMWxvM1RqOVo4UTVITXkvZ1pMNEg4ZFdxb0UvNis5YjRX?=
 =?utf-8?B?YXc1bUMvRHdnd3VDVWZnU0VJZHZPdlZwQno2TmFpaW5UWXpiSUhPdk5vUHBO?=
 =?utf-8?B?RGUyckp1bkVMWE5CN1kvcXZTQVFtVkJ4WktVdTRjN1R2VnZ3b081Vll1WmFU?=
 =?utf-8?B?TDRWOUtXY3NubGRwUzBIUDVaUDRjZ1p1V0doK2FwUENsRm9OeWpheFAzdHVO?=
 =?utf-8?B?ODRuaHNvWXF5bCtpUFI5dHlySXV1RWZjSFp1T2hpU0VHMFIzd1dpYjM1VXV2?=
 =?utf-8?B?Z29RTzM1cFdvZml1TEd3YnZwVklPOG55SFhtSkFzajVxN3ZOTlEwaEJhS1ZE?=
 =?utf-8?B?TStkUlh4WGhqVUFVV25hRkxSZmdaWFVyWThWSDc2bTZIc1BhRTBBSUpLd2J5?=
 =?utf-8?B?dGhLMW5lY01Ub1NaTVZ6MHpIdVdrdGQ2K2tpMU1kU1p6dXFXdWVGekZXWE80?=
 =?utf-8?B?QVk4c2RSQlRXOWMwTGliTFhETGNuZFRFR0o2eUVvSGhibW1rMmpZZENIT241?=
 =?utf-8?B?QmtkaVcwYytrUEtaQ3ZDZUY5cVdFamp5Qk5Vb0JrckdXeHc1Qkk3WXBLY2di?=
 =?utf-8?B?L0FWVlRtYmpkZGlKVHdaSVNQU3FJdTNLNkM2ZG9FRXJmZ0NadjRuZENPUGN2?=
 =?utf-8?B?eHpnTnBSODFKUlFad0tCZW83RXNjQXFFVElLazRCK1NxeWlBbkhVTnk4N1Qr?=
 =?utf-8?B?NDJQTTBGT2tHQTNrV2FDSnF2MVdIUzhMcE1aTWgrKzQ2MmE1TEZucTJpTU10?=
 =?utf-8?B?QUxGeU1GMWNtbzRDRWhSSDNUWGhTaGFIYnQwN1Yvd0dKQTBnOHYzTFIvbjFL?=
 =?utf-8?B?S1dLeklhMUdDWWRBM3hpUEljUTU4VlhyRWhmb25tZFRIVzZoaVo4VitHS2Vy?=
 =?utf-8?B?Y2VwQ1pTdXlTMC9VaU12TkJWbzB6MkM5N3hmeGVpQ0d1YU8xeXlIN1hEL2dN?=
 =?utf-8?B?Yk1zSnpnMWZxcTFUaUFrb3EwVU45cHdYM3M5Q3A1VmRnU3pyUkQvakZOai9k?=
 =?utf-8?B?RHcrc2xJQ0JndHJmemRzbE9FWGI2N0dVL3JTRjBzanN6TEZGOWZQWU1MUlFm?=
 =?utf-8?B?WVJlbk5YM1BHYTlPOCsrZDlFd3Jqd1h4cmxIcFFxSE5BOGtheFFLRE9MVUJw?=
 =?utf-8?B?bXZFUXNINThkSDhYZ0wxOXQzYUJGdXNremRBOW5CSG1XOENJUFBWMkFKMEoy?=
 =?utf-8?B?N2NCczlGRWJJN1FYaGVuT0M1MjJvSDZvdTlyQUQ2UWVyOS8ycnpndXpEN0w1?=
 =?utf-8?B?dXVxZFBwY1NoMWZ4Nk10ZmlZM1poTUtiaGFCYVI3ZkNrdjN2NzcvUEVxZGdG?=
 =?utf-8?B?WGVRcTduRzJqNndhdEpjMUtObTJLSENQSjlRQWNFbHlQeDcvYjNENXBUOXNh?=
 =?utf-8?B?cjBCTWZBZTVXbE5ScHhSTnJHcGlFamZQRWVDZUxLYTVzb0JaTEtxcTJLTnV6?=
 =?utf-8?B?SkFBL0tjSWMwcFNnSENMY1pEaERjSlRNazM1cGJnb1BGdGVRellyMVVRQVY4?=
 =?utf-8?Q?LOX1bHn5e3Vjc2d6WUw6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LzlsRDlOM0J0eVZ5U3o4YnYzTGFtdndIR3ZFalBtZFUySkJpdlcvOXJsQkpv?=
 =?utf-8?B?T01neTMwckxtQ0gvREZYTTNQbmxXMDlEaXFEclMyN0RBYzBWZHB4MU1kOTkr?=
 =?utf-8?B?S2NaMDIydkxyVHNzdE5kSlVzUEJEVkRFZlNPWklLbjRMZ2FZQXlNNng3QWNN?=
 =?utf-8?B?RnlVYVZzMkY5RjJBa05zdy9xZ1A0MmlCZi9vQ2puMXIyYUp2SHduMkMrN1VS?=
 =?utf-8?B?WWI1Rkk4SVdMMHUrOXdabWNMU0N5UGZPcHVrM2pFTm5DYllocGlqNTlOM1hx?=
 =?utf-8?B?V090UFRVVllha2N1bnQyV0IyNGtPUkR5M0F1czlDQkhaamZnT043QmJmeHE2?=
 =?utf-8?B?STh3Wmpxc0xMN0dPbWw5ZUw4dnlEc204WThMTkhraEVibThWblRiVUNQTFdX?=
 =?utf-8?B?a2tmaUY0cGhuQldmSngveUlPR0VrbEh0eHdDZ01RZzNnSS9SMTYvWlFRWDVH?=
 =?utf-8?B?aUxpL3Q2NHpTaE9VN0VwaUo5ZlhnR0hjOG1FK1lTa2pBbnlLSnJqdzVQMCt4?=
 =?utf-8?B?a01GRzBmSjFYZU81ZDJjZ2NmUGtVeVBqY0gvK3RPMm5IMXNHa3BYSndwcWlv?=
 =?utf-8?B?eEhaTDRSUC9FNlhBR3hwMGNGQXY0UmE5M1k3ZVRBR0R0M294Z0p1aU1wZHds?=
 =?utf-8?B?TjVZYWFMQzFRRm5WWmRpNHpWSFl6azBGU091bFlnSjhFcU8zTmVvK0dCSVdB?=
 =?utf-8?B?Qlp1eG5ERkpuQURaRDV5RGx2cEdsWVBzS0NqZXZXVmcwYTNBYjlQUm03SGt4?=
 =?utf-8?B?RWsraDRBR0Y2VDlXOUlZMW5aeFRkRk5LenhaWjZyMDUvZklYRjRKMzI2QXoz?=
 =?utf-8?B?UTFxelFUdEFjVXV0VHJnYmkrcU5KUXhjeXFvTU1xMmFjVU96Y1VPN25NVkFL?=
 =?utf-8?B?TGxjdngwZ1dpOHgxVkZVWW5KLytDRHhBWnpSRC9laGNXMG93WjgvTFFFaVB5?=
 =?utf-8?B?NFk4MHJvMjhINkI0SWRRM3RGU0xTZmtvRW9oRXRRbTlYVEpuUjNTOUJEMVB1?=
 =?utf-8?B?WTN0U2JpbHMvMDI3TW95U3EwSHJ0R2xMNU9UV28xZi9SVHF2c1p5LzFIYjh6?=
 =?utf-8?B?RDNPN011ejMvdXpXWTU3NHl4SEZKdUlHaHpkVEtLb09OdjZVRWZ5anVzQmFw?=
 =?utf-8?B?a1VRaXg3UEV2dnZmSzRkamg3cm50UHh0RHFONFYveTNXZmtaY0dTZ2RPc0Nk?=
 =?utf-8?B?UXdCU3l4UlN6QzV0TkpRT1dpZ1lnZGdiSHlrcU1pUkJUc0Y2ZUZ4RVo0Y0JZ?=
 =?utf-8?B?aUxIK3QyQUFWMDNISDRMRXllSUp5azk3eFZQTHQ5TmJKTFg0dTR4eEM5K0Fi?=
 =?utf-8?B?dUQ1ZFNkc29LVlI5eXFNdk5Ha3FLOWRENG43Q1hOL2FJWGZXZVFjMHo1OHNK?=
 =?utf-8?B?UFNwKzhhY0JLTXZ2V052TWJQdklFalViL3lyVjZ4RmtPUjhvRVRZVGVlVjFu?=
 =?utf-8?B?VVhJcG45U0hnN3hBNVdWcXdHSHRGbUFNb3JLY1ljSTVVL0s1dFZ2Ty9RdUF6?=
 =?utf-8?B?UjYvcTQ1MitPTnRJdFMreFJkaU1KMEl6STg4M2l5b0QyeUdJekU0eEJNd2t0?=
 =?utf-8?B?Tkc3VVFWcENkUmlUS3BkWTl0RjFNN0VGcFZjQTY3czlYQ01vRHFSQTBtTWFv?=
 =?utf-8?B?TDRQTnBIazV0TVh3QUJFRUd6dmJvRzBrcW40N1lyd1BjUlhScFBrODZMVnNT?=
 =?utf-8?B?NjBMaXpIQ2pDanRhNW1ROXVWYU9jZFNwUm5LcmpaZG5mR3BNeFkrUWF3aURP?=
 =?utf-8?B?Zk40NGE2aEorYVdaRUVSTVRlbjRiSExDQlhyMkZsaEh3OW9EVzNmeWNEdjRy?=
 =?utf-8?B?bVpXRWM5MkNxelVwRU41SlFVWm1sT2lWNDFFdjFmMGJueXVYUHI4Y281aGRI?=
 =?utf-8?B?cWtpVVExSWZJbnJveWhsVzBvNVBscmMrSUVnYjFMMDk4dmlVOEdQTTArVHhw?=
 =?utf-8?B?RVdOUG5UZWJLZVpxRnQ1b25ES2VHYnJpbFlBR0M3RVhFSzBrR2JzSDU1QWRs?=
 =?utf-8?B?UzNXTDFTWmgzdWFKQ2NPRkQ5VWlUTzFiU0RyTGhaN1cvNjhDZzlqVXBVc0t6?=
 =?utf-8?B?ZmN6SGFuTTNiaUZ1QmJlRUlxLzRLakJFcW1MUnd6VUd0V0hTQko1eTBHbDlJ?=
 =?utf-8?B?by9FeG55YWFUSjQzYTRNYWMwc1NzdG5RVzNDRnRPU08vdUtVR3F4RzVGUmpB?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b98918-b301-4ced-1872-08dcf500b5d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 14:24:18.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHfYDl5YJ21z9YVT11DFH2RB0h8uDWJHZr6iF83izw7b4EIx5BNmc/8doAQ6/b3Bj+gWX8s72UIXMIsnWMerQGQgDw37CxgDOcrycVaTWHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9487
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 14:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5595

Hi Antonin, Richard,

On 10/25/24 4:16 PM, Richard Purdie wrote:
> On Fri, 2024-10-25 at 16:07 +0200, Antonin Godard via
> lists.yoctoproject.org wrote:
>> Remove dunfell and nanbield which are not supported anymore.
>> Add styhead as an active release.
>> Set walnascar as the dev branch.
>>
>> The switcher menu now contains:
>> - Unstable (dev)
>> - Styhead (5.1)
>> - Scarthgap (5.0.4)
>> - Kirkstone (4.0.22)
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> @Quentin: adding Walnascar as the devbranch does the trick and adds
>> Styhead to the switchers menu. And indeed, walnascar _is_ the current
>> dev branch, not styhead.
> 
> The patch looks good thanks. I just wanted to mention:
> 
> https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?id=51d842b5e0b14e5439b5c89ec314886218a62ebf
> 
> i.e. we do have a script in helper which we're also doing some of this
> in. I think that script goes on to generation a json file which powers
> bits of the main website.
> 
> Could we try and converge things. The reason for adding this script was
> to get the website code somewhere more accessible so we are slowly
> making progress towards that...
> 

We should be able to build the docs with only code from yocto-docs git 
repo and without network access.

One of the issues we have in the docs is that there are releases without 
tags in yocto-docs but we still have some migration 
manuals/documentation for those, c.f. missing_tags in the script.

Less duplication across multiple repos to build is a good thing though :)

Cheers,
Quentin

> Cheers,
> 
> Richard


