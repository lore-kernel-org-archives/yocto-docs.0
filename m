Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C628EC61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 14:23:25 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37586.1787840596182469999
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 07:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=n9lWbJ1M;
 spf=pass (domain: cherry.de, ip: 40.107.159.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HexV2W/dnEXlg+xxjauCUYJSuGjQfpQoMgyytsxYcezIin35Wh5JfxqRJJWLJ6wazE/euJ1rkOVbaewBlOX+gRY1EnPIi7m0O/b1eS4vZiTqga0qQNMG4hxzzxojVh7aMY3NiPdb3aJJ1ZQVWNeFQFM3bKF2PO6fudPHA83hi22QMBbkuyvl1vm4mLvtBE0GC7dyvaBvYrijBJoyA/L+NNAvjitgZD6rvLD0d+cuMNf2qfQhx2v7LVmsYricS5ZmehEAIjev/wae6D/yNAZfFhdQH50lIDfHw3B/Xrn55ctH+yUc7RnROvSJdbBegfQwynE2462hxwM0gpygXJMs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oADOi20OMyZ7CZBdIWDnNqOV8MBWKHdvX45YwHZ2rIw=;
 b=zVzqNgPmhKPD9zh1U9h2CoTGcFm/AkEBgcIXxou12DFAARLMe2++MnVAWJJwMyuKKlarBbQbCQ9ki4JMnqoXZk5IcJvrvHcQD6MlJ0EL/kkX6UC9JELKE1EG50sYKWa1pPbxWU9wJxVcHH36+dFnvzJYw9g04NUE/ZsuQSbgA099JoMsXOwAkp7l6A4mYPThQee3GMgus334Qc20mnMvQOPNmKp9WRgI4lJDLkPA57+47lWh+oKAhiGVwqNTicBnIHqwNsjVp+Qwk+vmB3uhbUyF2/Lz0XC/dOcwyk7YrzJHGgZ8VB3NpmMUfUCes/9TdQ2EC80WbJyIcMFa0J2pQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oADOi20OMyZ7CZBdIWDnNqOV8MBWKHdvX45YwHZ2rIw=;
 b=n9lWbJ1MTA1UBL5GRbXkS6Hh5eqsO4APBCJjv0Zu8voZiLnIUmsGxaKgVJY3EWV8woD8DlEMAXNiTW9U6ec5cMNnl21rzLEJgRcQcPO6DOoSC26XNmZb0NOyPGNi/RFTTKl3pKIvpPFF5CZhC5jEkANyzlTSjDA38Y3YixNby5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by BR0PR04MB152861.eurprd04.prod.outlook.com (2603:10a6:2c8:44::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:23:10 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:23:10 +0000
Message-ID: <3e21159f-939c-4e66-9c8d-e6208b1bb2ed@cherry.de>
Date: Thu, 27 Aug 2026 16:23:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
To: antonin.godard@bootlin.com, Trevor Woerner <twoerner@gmail.com>
Cc: docs@lists.yoctoproject.org
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <DKZL9X7BV6TH.1WARGZV04JK2V@bootlin.com>
 <apAgqQXALqu6eX7W@localhost.localdomain>
 <DKZPWL5N9LAS.EB6LNEC08FQE@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DKZPWL5N9LAS.EB6LNEC08FQE@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIXP296CA0027.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::7) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|BR0PR04MB152861:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e5fcaf-9367-4f4e-9b29-08df0446b88b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|1800799024|10067099003|4133799003|6133799003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	47iGxDJYAnkijUnoeus5AcDi3uEZ7rSJahvAZH3LACi0eL13wxAH1/0ME6vCTM0MiDIzn5M3nJrIb5qx5siMCgCjPWBeuMbOnFff0IclyNpZF3GiW5gPyOFI+3DnS6ThusrX7eUI61KsyOOOpxPBS1nnbY8OCSLPZnfIQadtxlLVLigO9BZfJRwVpU8hMEdDshHrBzDZGrm6YCQxyDkpRL5WZz2pnwJoS1DfLxF/AgDTpW9doMRvtOwQ8t7goAuZYeLEwXVM8xs652yrXHqoJYLR6BQ3PMQA3LezyHXbbE0BDGXmWXB0Dha+GFVRxszIyrr+++mrxjSqRRpNtlwMfPnhl2Uk1sgzIfXc6OVIgryFIvKcZgn6dAUWonE5X2yILhRJiG9lEyx/uTXbjxHmFlHkApfDge0n/nR1LuAy2wMngYGN5lyf8f5aF9pwBjUznyZXfWNSsmbxGs+64rPMhGpbjQsKy2pMRQQBlvnVCahWV0yMK8A9fFMlQNIpANFAUbj2DSr8B3i+Tx+jLgmPUUnW7S8D3DstbOdrgHIxUMpBtD1nEqGIh5UiS/GtS1RAdJgA/8yOr3lNh3qWOafc8jPCerF00tEd/oGTxHPRgvB1OhMn4/Qxhp1Z/upjIuQJdHKliWZbfx6HaJZD2HsBKqDbstV3MWTg9RlRCyyLBis=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(1800799024)(10067099003)(4133799003)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UE1MOVF0RDdIc08xVU1ySm13anFQWEdkc2V2SVBraW13WUl0bXZyZ2xvZ1BR?=
 =?utf-8?B?WEpqRVVJOGc2K1pFNDNVWlQvSEVPLzBjMklzUnhlLy9CZ2t3dFo0U25qOE9s?=
 =?utf-8?B?Z1JkOTBqcWk2SGtOZUdrMWJEaDFKNWJLQWx2a0dsMEpyS05XL05HRTc3dzMy?=
 =?utf-8?B?WEpmVE1FVVJuTVpYbnBOTjVTOXlWdTl2YlNPNy9RTlR4MCtZSjBLenNkZll3?=
 =?utf-8?B?NmRLcDNic3d5Qy9RTk1YdjFZakhHNFlRdXZCVzI5ZDZKMzV5SUhXT1RaakRz?=
 =?utf-8?B?NWFJVXVXczdpOWFSSWlOaEdYK3BmMFFUdUNHaUlxUUtyUytUNitRQTNQSVFQ?=
 =?utf-8?B?cDd5LzVzcVd3VVk1STFBeWNvYklKbDBWOUQ3QnpxN3YzcHJNZ2RmZE9vWUVm?=
 =?utf-8?B?RVNya1U0Z3pXOVZhWVZUTDQvYXBvZkhGZDJ1WU9EZUV1cTVxZ1VPdlRaWDdN?=
 =?utf-8?B?SlhiR0E0RDJSMlVKNFFlU2Q4WDYrd2lOTzRuVmhSeWhON2FlZlFRRk03K2Z4?=
 =?utf-8?B?QS9rUEJRSG5ScVV0UnNJemJUSlZXb1pibk1kWlcvZEZndnBJQmFqVndBMUZy?=
 =?utf-8?B?N0hxMnBwQjBFZ2VPSkxYeDFzYWJudE9SNldRbWpHS0hnaXhtdG1JUE5PVXJs?=
 =?utf-8?B?SGRUUVFvcTdzaEw4M1VMOHp3amh4TUJNVm4xb3hFTndEL2hYL3lIWHBBUENI?=
 =?utf-8?B?L1ppVnhmOXhMTzdrMmQ5T2F3dGhQRndiZlZZYzkzTXpDU0tuMmM4REwvVllx?=
 =?utf-8?B?ZHRJb3ZsV0tFc3NiaStHUmtrelpOUU0yWE5Za2dxeDBSaTVNUWRmUmJ4V0pY?=
 =?utf-8?B?NnJEQkJpMXlNclY0c2F1RHpMK25QS3FCclhGckhaZTFsSC9NaGluSXE3cDhQ?=
 =?utf-8?B?ekhNZHh0YjBlSGFFa1l6VmhQY2VyT3JJSktuaXZCczVmRkdtaEgxb082Zzk3?=
 =?utf-8?B?NW9oOXNtYVV6QldUaXFFMk9ydHBKVC83c1dqc3BESm5QVHo0enk1VDVIbFZQ?=
 =?utf-8?B?QVBCOHVHT0pUTGFURUI0dHMvVzZOZXowMy90cVpVWUswQno3ZW9aNDRJMm95?=
 =?utf-8?B?dEdLVDNYMWFDSTdlOGFzT2ttL2dJS0VKanJGb1U0cmdBVDJycWZSNGlYY21y?=
 =?utf-8?B?aHBhazVhaFlyTlJQL1lkTXNoZ1BISmF2R3l0M1A2TGVwTldiRHNWcWxWTDFs?=
 =?utf-8?B?U1lIa1pWVlpNd1NxK3ZzZTNGOEQ5SXpkU2YvRFhuTW9jOTFDb2FDK2poZnlX?=
 =?utf-8?B?RmpkUEluSzBYMi8wKzY0aVd5eDB5MnVSUXhQalMrcmJOc2JON3hCM2VQckJy?=
 =?utf-8?B?c1hPbk9WN2c4NnMxWHIxa2dvTm9XWmQxbUV0Y2JoNGNrUFdFYjBtYXZiR01k?=
 =?utf-8?B?MWxwaUtLam5pWHRUS0NCc2ZTT2laQlpyUXBBbVorNElpa1JPejJ2aEF2QXJU?=
 =?utf-8?B?MjJXWVhQSUZLL0FuZ1c4L2xva0RXSk1VSTVkWkRxTGJjT2R4RVIyeGxFSEdk?=
 =?utf-8?B?RHhOYklsdEhnbEs3a05VSTBWZmc2eEZacm9LRmVkeTU1SEtSSjg3U2N4cFZw?=
 =?utf-8?B?YzduT0hrYXhDTFZubVprUXJXYzhHSjkzNk9TOVJJR3owWnptRFgvdjBUaWth?=
 =?utf-8?B?S0ZTd0hXRFBrbjc3OW5EdXdyL0hXRDk1WWdmc1FXT3FVRkRDcVNKMDJ1KzhW?=
 =?utf-8?B?SVN0T3ZRNVlETTl2a0hGQzRuOUlxNk8zZEFXcTNmazJmU2IrajUxNGN6c3I5?=
 =?utf-8?B?TDlPYjA5VGYvTEMyY3hoYzhlNVM3YzRCRnBQOUE1Q25WOHVVdmpDQnlpWVRx?=
 =?utf-8?B?YUdMU2pCdko5YVFISlBpMVc4T1U1bTVYWHNEWXgwdFZ2dGFpcTF5aGFjVnYr?=
 =?utf-8?B?NmxhMDJpeWRlSWVMcDJNRWg1R2E0di82cjJ4dUowVzZaOU01aG5qNUV1L2ZC?=
 =?utf-8?B?M1JyUnNKNmpBRU1xd0h2OHF2WHk2ZkljeS9TVzNBVE1OMTVOZkdMS2ZBbmtS?=
 =?utf-8?B?cDgyRzdnZzQvcWlMSVJPaXJqUTBZcG9DNFZZVjhPcm96OHJZTCtHbDRVaHdl?=
 =?utf-8?B?ZTJUdmNJZXZ3ZjZibzRic2FFYndjblp2UExsdXdDQmgzbS9YRExQVFhwU0k2?=
 =?utf-8?B?bDFtUCtLaVpOR2tTejZDZmcyc2NpTE1nVEhMWlE4TEJMa2lmZ2hYN0lsY0Uw?=
 =?utf-8?B?V2VUbTdGd0xvVk9MVTVMMVNjNWViUkFkRm96aGdLV2pEMHZZRlZHWUlpeTNF?=
 =?utf-8?B?MnpIZTBLMVVFRGU5eDdObUcxSEJGVVFqNEluYnp6WHhyMC8zQ1hIRnBmTG1s?=
 =?utf-8?B?UzJVaEJpTWI0dGRndUZxbFBnSHNjQWU3ZktwaWlqT1ZuaEJuTXpmK3ljR09G?=
 =?utf-8?Q?0VCigyVtORCUOZ6HREKd8I4Tv7jN/39nze5rhOHwYZB4E?=
X-MS-Exchange-AntiSpam-MessageData-1: pqpx+vI1g1rb0/sRDZCIbSjZp83SoDdSa/o=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e5fcaf-9367-4f4e-9b29-08df0446b88b
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:23:10.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGodRH1GSduUPAG5ZTQgO5eEuZIaD3RiaiGOkniqnh4yHc1/XZDpF5vNzQ0azhzNQqTtdtVe9+bQHbWh15lbKh7yn7znya8i5G5/KyvFBro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB152861
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 14:23:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10383

Hi Antonin,

On 8/27/26 2:16 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi,
> 
> On Thu Aug 27, 2026 at 1:34 PM CEST, Trevor Woerner wrote:
>> On Thu 2026-08-27 @ 10:38:58 AM, Antonin Godard wrote:
>>> Hi,
>>>
>>> On Wed Aug 26, 2026 at 3:34 AM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
>>> [...]
>>>> Not included
>>>> ------------
>>>>
>>>> Six blocks in ref-manual/ trip a defect in the released BitBake lexer,
>>>> fixed upstream but not yet in a release. They are a separate patch, held
>>>> until that release, so the rest is not blocked behind them.
>>>
>>> Would it make sense to apply a patch to Pygments in OE-Core to fix these issues
>>> until a new version of Pygments is released?
>>
>> It would be very easy for me to provide a patch that would fix these
>> things locally until (if) upstream pygments picks up my updates:
>>
>> https://github.com/pygments/pygments/pull/3284
>>
>> I had wanted to add such a patch when I first developed the bitbake
>> lexer for pygments but the last time I proposed adding a temporary,
>> local pygments update it was decided we should wait for upstream.
>> Therefore I stopped short of doing that here.
> 
> I think you misunderstood me :) What I meant is that we could patch
> python3-pygments in *OE-Core* (*not* provide the lexer from yocto-docs)
> temporarily, until your above pull request is merged, and we drop the
> patches in OE-Core after an update.
> 

Please don't, otherwise people will be forced to use the buildtools to 
build the docs.

Cheers,
Quentin

