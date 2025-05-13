Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6122C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 08:00:10 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.58])
 by mx.groups.io with SMTP id smtpd.web11.71164.1747123203669958850
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 01:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=e+ae1wBa;
 spf=pass (domain: cherry.de, ip: 40.107.130.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUseQg7aAQgN/kwt2UmWmuwBIdCu+hRY91Ote23ny7P6d7lkynYLeQNifKkbioUfHkcmtYJlVkP+DUISk+G7f5S2Vjw2//bdTqTqAjTiAdhC3oNxfGnpzNWP/hPZvweq/nrGCa0E6iWR6j30fOZXXfWLXQvqxdhxWupmwGQIba+i9lYicx+Vu0MMFhrW5fxwU18vXpeQDrHXTyeDQ0CJb0bnwVI2Fbw9ELmV8oSr9xCytV3nuSE2EXM3MHMY2REwf+bnlmuSE9ZTGxuOO/yifQIyrfSU7qE7lVpIUFBtVcP+coCkcZzr8d1Ypa1E0MyxhHiUz3fSaPgC8CIvoti/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0OpLbSn+/cnGzSbEBtGhSHoje+cgGKSBdPR47gSyAY=;
 b=tgHiAc+7dnvYdfC9sI6DwYmeKeNFo0mTXj0astJ2m12UdoxzI/j2+tWSIpkrZWfuhuI30nvmLxVAt9UUYi8KkoubjqVF3YPrpIT+6DxdIZuSRmX0RWucjeCydLezMRxxj01ifbN6FIEKZCG7k9VQ2OHBb+CgN9in1ZEzAldUc66k3N0xwv+KcRmDh1OderWyKqasBg+rWP22AGqqBOois620uVz8Pmuilru/kqo8E3+OPOC7wNAnO+Gdy0VmtNVBzK4IMi8qUe1JpEsUo0QNh3w3QDmMAj4f2RKRBtHvlCy1bEqdvvo5SrE/a22Z0e4Nl2HObkhrq+cUIKlKIRiHPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0OpLbSn+/cnGzSbEBtGhSHoje+cgGKSBdPR47gSyAY=;
 b=e+ae1wBaCgOQrRcAwd0Beoi1e4KGGMizlg0MkmnhkAT9qzd+EObT4cPYkSzf2aRjBi3Z6Ut/g0krM+jLFKstFZ+x0Nw3tOpOs+DMUjD3jZMm5JsFdjLZCmDb2uj95h2jhAsub2WlnywvgV5nqbtewBhL4dnSXSFX2pmg30laz04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 08:00:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 07:59:59 +0000
Message-ID: <788da1ca-6e56-41ed-8814-4771710bfb69@cherry.de>
Date: Tue, 13 May 2025 09:59:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 WIC_CREATE_EXTRA_ARGS
To: Trevor Woerner <twoerner@gmail.com>
Cc: docs@lists.yoctoproject.org
References: <20250506172300.19220-1-twoerner@gmail.com>
 <8ebddc9e-300b-4e82-8ff7-20328f06d7a1@cherry.de>
 <20250512210120.GA25174@localhost>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250512210120.GA25174@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c320dda-8bd2-4987-917c-08dd91f428a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEhjTWNYdklsZkpPSXd6SWtXZzAvSWhtWTVieW9RNnNPMEFBL3MxbmExQ0Ji?=
 =?utf-8?B?VGFlYWtkb3UwRnZmTlpzcGtqcHpMd0loVjhnT3VWbW1Da3FZVWFGKy9zOXM2?=
 =?utf-8?B?bkxPaFg4VTMzcVZtK09aenAvMTNrMlhCc2EzWks1ZXY0UERBYkJ0YkNLcE5h?=
 =?utf-8?B?eXZHVzg2S1N2RTd2VnZicEJTaFVtbCt1eElnUHNTNkNtVmovTlduVEtoaTh6?=
 =?utf-8?B?UjlhblJ6Q282NmRJcG5jeE1XSjZuYUczOGovRERESXFFQVBlNFlQVWVlUzJR?=
 =?utf-8?B?T2VhR3RqS1l0U3oyM1MrazBVcjIzQmhjOFAwWnR2ZHBIVVJYdUc5YzUySVBD?=
 =?utf-8?B?bmVFV0VHUWhQdjd6Qm1uTzh5NmhMZnFrUnR2WEl6ZFJVZ3FjZzQ2d2Q2LzFW?=
 =?utf-8?B?akFNUTA5ZEJuSFQvWkY1SERFa25FSHJlUXUwbDBSWTRaV1Z6THUxdkFDbHYz?=
 =?utf-8?B?TzJ4U0hQOEZFWVBvOFk4MER6cUg1U291S0RJVFNPNW41RTJKVGh6RG5BV2pW?=
 =?utf-8?B?dGJQV2FzM2laYjc4UCtzR3hCVjM4bVgrZ0xxRVBtNEJpeVBhaVNEMUFkRVgx?=
 =?utf-8?B?UlZubWllWjdYU3NqdXN6UlVISmNjdStvTHN1TXBuTkJnd1J6SnJLdzRSUlMw?=
 =?utf-8?B?bTZxQXdQZFpQUCs2aFZYd3d1MU0vcHBYVDZwRnBHZFh5VDdRbnRVUWgyQk9D?=
 =?utf-8?B?VWcrSDlJRlloNDh5UnJLMUFVNFpzbmJ0ai82MXZuSS9Ia0wzY2hqdTdXbnBk?=
 =?utf-8?B?WUxpcWgzK1MrTGpDTkY0d3BxTUoxaXd1cVYzbUVndzhPRjhCZUlNQmJUc0tE?=
 =?utf-8?B?WHZXbGM1OTMwOU1FVHZYRWFUaWVYS042T0NsUDJKZ2F5MjVjUEVxU2J5Rzhu?=
 =?utf-8?B?NUZ4V25VN0ttMkF2b2xRY2s3d2t2aUo3Y281MFdZL1ZaL0NTSzdNa3BNdXZi?=
 =?utf-8?B?SkdnWno2c0lBYzJVcFBUeW40MlVaVitCUmxLc21zZTFNUVFGNkRmdmZIRW15?=
 =?utf-8?B?STAwTVNNZ3RuTlpZNTNCRzVHcThyR0RUbUllQSsxVjg4UlFLN3FFQm5LQXgz?=
 =?utf-8?B?UExxTVlrTCt6ZFJIU1pTT1dRT010ZWU1bks3T1ZWaVRya1hZNlB4QzZxK09y?=
 =?utf-8?B?RHNUZ2VGaHJVTVZEcWpaSktDUHpYdW1mczVMcnA4YmcyZGtmYnpHSFNJRm9S?=
 =?utf-8?B?Y0kwcU1LMEcxRW15WWhVK0FPUlgxQnZXcS9rV0ZUZVJIWkVmcHdPYXN2VmJk?=
 =?utf-8?B?dFNPVmdoY0VFeGYrQWZnUUUxTi93bkZ0OEE3QmNZanJOQlZ1STNVRVZudElP?=
 =?utf-8?B?aVZuT3hQSy9PT2RkVDBJS2Z1VjVzRUQyR3kxT3JHcnpCUGROSzNZcSsvZlNY?=
 =?utf-8?B?SE96N0xETG1sVWt2N1paUERzVERPWXhRc3lTWEdNYTJaa0ppblBqdUZ5dThS?=
 =?utf-8?B?dW5aMHpSbXZMWERBdXB6UmhqbzhnMFlWWlNrbThlbFdoMU1RVFlNMkpJbHdB?=
 =?utf-8?B?NFNuNk1IdHpmcWxGZ3hGZ3UrS2toMFlKZHNrKzdPT3UyYVRyQURsZHZHbXJD?=
 =?utf-8?B?Ym5ocmQ4YmhVVWpZNlBqTXVSM252ejAwNVVIcWd2RTZOZkh2K2FWQ1JRcTNW?=
 =?utf-8?B?WGc4NVlWa2ErVUw5emJKUzNBNVNBRHYxQVpySUtTVkladjY0WmZqbGhlMEFr?=
 =?utf-8?B?SzUyTEdGc0lhR0pJR0FwazFyellWRE12cVZUQTAwdlJveUx5WHU5LzMveTRu?=
 =?utf-8?B?SEtJclYrT0t2TldQMlRCVElPTDNMcGY3N2JIWEpPUXlpL1lOUWRIRU54VVFR?=
 =?utf-8?B?ZHBPRmxQYlYvemhBZHhQSXNpV2RFbEJzMStwRlpKQmRpVy8zc1ozSlZkb1Bh?=
 =?utf-8?B?S3drRzhKZTRlaklQMXhOQVgxRnl2c0dMcmRWN0s5dnZEb0RsYVJDRzRuRFFh?=
 =?utf-8?Q?tAhGM02zCow=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZjRrYkhtbGtFS3hFdjR1dTJsd3pqa0lTd3ZMY095cW5zd2h5YTJCanhmSkR4?=
 =?utf-8?B?UVNScUhEYlFxRzNCMGVpZkIrNTRYdGFVRThIQmVkK0Q0Tk16Tk5Gc3NXVVZG?=
 =?utf-8?B?OUY4Q0lnYzBwSWRld1hYYy9PNWxOTlljVEg5UHdodGxiZTgySXhGMVdaRDlm?=
 =?utf-8?B?R2J2SG5WQ3dzQW1lWlhvMEJrOGd1cXFXb3RDSm9oRm5GblBJaEdCZHNkKzN5?=
 =?utf-8?B?ZXpUWVd2LzVyQ1NhL3M3S29CQUxkbVdsbzIxVnZjVlVsaFkwd0NodkNFall6?=
 =?utf-8?B?dFUzNEZCWDhqNXNheUVjMkhmZFQzOVVvRFkxeUNKL1d1VnBBY2RWZ3p1MDI4?=
 =?utf-8?B?ZVNScjBCRnBrUFoxajRiUlFOWWtvNVI5SndCL0FBdTc1YTBlYWlkRjdMTnFu?=
 =?utf-8?B?d1phbHdMQTZZRGcxTDd0bTlUMEU2NjhOeGVmcW9aQUxsbStCWW9SSmovb0VQ?=
 =?utf-8?B?RXV4Nzdqc1VkTzI0L1JQbjRvTUdIUE9BUm9BK1hOdGZwbUVMU0RWdjNSN2lp?=
 =?utf-8?B?OXdHWTlqMGlhSTl1RHZzNWtBSDBvQmY5bUV2SFRlTndxZlRUSzBGNlpqblZn?=
 =?utf-8?B?RCtiOHJ1azhIRThta0JlKzhTaFEwSlFuMlpTL0sxN3JrQ3FjOXovSG4vRFRv?=
 =?utf-8?B?emxwTWwxa1VGOEM2V3FPaEZOa1hpY09uQkVIczErUVV6QWtVNXNUQzlGeXlS?=
 =?utf-8?B?cHJtR3lBNkpUWTkwZ3lkNkErb2pmeFNXbVJ4SThZYXlIWWsxZHIvQkVrcURv?=
 =?utf-8?B?QVZsUER0V1FvaDFWa2Q0a1lhZE1OVzE1Skw4TG5UMWJYZG15L0xuc3pzcEZa?=
 =?utf-8?B?K3lpVWlWY1RLUnZmUkJ2eWtVZWRoRTQ5aVdpbDYrYjJUTVVnd283aGJvRm9v?=
 =?utf-8?B?aDQxRlBkRmlFUFdEUVFGdHZZVmRPdEVoNmhDZlM1Tnh1cjhleDVLemdPYisz?=
 =?utf-8?B?aEVobzR4MzNHZ0FEa1RjMENrZEI1QTZxeXJzMWo3dGFldExPM3ZnT2k0Y01t?=
 =?utf-8?B?NklhU2Q0SVVUZk9FS0ViK2FleGplZGY3VjExazgrRUs0NFdicjlWTEIzWFln?=
 =?utf-8?B?MmFwWUFpazhWTEFkK2Vab3EwSlVlY1lIU1BjZ2FNZ0ZEZzNxamVKLy9wZDlN?=
 =?utf-8?B?M0x3WnFxQjVrcWxKdjQwa0pYOUhKclovak92UW8ycm0rRkxjcG51ZTFJMUIv?=
 =?utf-8?B?SUUwNTg5SndZUWhtbjB0cUZxK2I1RVc3ZG1RTllrYmNHa2xVYitRNWdEclo5?=
 =?utf-8?B?RlRhUm5TT1lsSXRlV0JBS09ab2hNUmdmZXVWc2ZzbWtKRFo2aStiaVNKTFVw?=
 =?utf-8?B?MGFGUk1TN0ltWGdHaU84N0lZaGFrSUtIWHRJbFpmbFNkUEdXb1llYkxrZ0x6?=
 =?utf-8?B?Wm10azVIUGh5L005MmZZZmxsNGFXWWpWakUwNkNuVFkreU02TU4rbk1FQ203?=
 =?utf-8?B?Q1pXemhJM2czU3o0RW9mZG5jZThQNC9Bc2N4d0FxQU1KZXlGMUFURCtIa1Nm?=
 =?utf-8?B?VkJielVVVm4vSnVNaVJiQm93VXhGVU1ySUpFcU9OR3NPcktzbkxZNDQ4UERV?=
 =?utf-8?B?eFNyZlhlQ284NTIyTGpTUENEeWdlWGlLVWxaclYwS0F4TTVFZTdVcENYb1dO?=
 =?utf-8?B?ZCtSVEozZGk4eXdzNGtFT0ZtcTNZT3M5KzY1NUovazR2eFg2dkZLVEtUK21o?=
 =?utf-8?B?RkJQSXF3dFVtZStGd21Zd2d3dTdUeHQ4ZWdSN1lXL1V6TXZ2UXdGcngrTmxS?=
 =?utf-8?B?bU9UbngwWmZGN3FqR0U2aHEwUy80akV0RG1qMVVuOVlNTFFZZmdVRGpTWEVF?=
 =?utf-8?B?RFVDOGxZcW8yU2UrcHFKdEVKVzZTUHpHYlpVc0lCWHJ1Vzc5Q2NPUm1ldUNi?=
 =?utf-8?B?R2FIeTR1WFVCTG1hU1hoNC90dndWeEx1eGxHaERIeUN6amhNQjJzVWhnS1g0?=
 =?utf-8?B?NDNxRlNreXkzdkpoMFBiQ3ZvU1YxOUJnM3FYMnJ6Q0ZmMzRYYVJ5OHR4d1ow?=
 =?utf-8?B?WW4yNmkwaEVCS1cya1NBNGowSUhjeVJYNUpuWWJJZG14ZnEvaFk5MXo4N2lM?=
 =?utf-8?B?V0ZCUHRIUmF3S2p5alBVVDU5WXhXOUNpUUcxYlNNcXJYSytaUzBoRmxjNG9U?=
 =?utf-8?B?ckpoem5pRnBOMm1iZ2duYVUxMUs4bmxwQWNDTmV4bGhvcmVjZTJWejVsSnJ2?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c320dda-8bd2-4987-917c-08dd91f428a1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 07:59:59.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdL7pRd9ycTBgTYhO78nuNsKh5KDQAVJk7Hf/fC1PyzLkXhfke2IKqr6xs0nQouw5bir4Zk7FO+RwxtNreulvknHmEdAj0u9xk6XFRH2Jzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 08:00:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6813

Hi Trevor,

On 5/12/25 11:01 PM, Trevor Woerner wrote:
> On Mon 2025-05-12 @ 09:31:27 AM, Quentin Schulz wrote:
>> Hi Trevor,
>>
>> On 5/6/25 7:23 PM, Trevor Woerner via lists.yoctoproject.org wrote:

[...]

>>> +      image recipe. As part of this process the Wic bbclass will call the
>>
>> There's no wic bbclass.
> 
> I know. That's why I didn't write "wic.bbclass". I wrote, generically, the Wic
> bbclass.
> 
>> I think you meant to say image_types_wic bbclass? It
>> would be nice to provide a :ref: there but we actually do not have the class
>> explained yet so cannot do a :ref:`ref-classes-image_types_wic` like we
>> could for image_types.
> 
> I didn't want to give a specific name and wanted to write something that would
> be immune from changes in the bbclass's name. Also, layers might implement
> their own bbclass that uses wic, so I wanted to include those as well.
> 

If they have their own bbclass that uses wic, they wouldn't necessarily 
be using WIC_CREATE_EXTRA_ARGS as this variable is specific to 
image_types_wic.bbclass, we also already list the name of some classes 
so it isn't a new problem.

Cheers,
Quentin

