Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CA2C77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 15:26:52 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.48])
 by mx.groups.io with SMTP id smtpd.web11.1674.1750692410578393158
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 08:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=k6gDjeNm;
 spf=pass (domain: cherry.de, ip: 40.107.162.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DadZr6SzlgNfQ5/ugrz9NfpC/5MpCkMcOwd8GPSa73eT3yBcLzT5KaJznjlZZXqTEmwvYkO9TZCFk8NV24IscCkLek+/5Zwq/njQG7rBqs2rCPF6cHDvYnYyCiNroqn9oa9cQiRDs7N+8S0K3Z2wfoVibuiTCSN8+OduaJ5f/esEzjHq2uG/6GZAzzPltgW2PPQ8pu6tVoUjF9p7ynVWzJZB6sCJo99njnucc295VFlgXScMYFOjDmEoOuEM1AvG5rI+bSvFInA9KKLAvPRLh2OzrFI7TxireRCRLbt1zR7U63suUB/Fdb37Th3/g6Ig7M2NqCfvLlMbFFpRB/sOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6khBOW7YrL9OCK1p2VGD6zqRtJNHJzuH04+nGXoBe4=;
 b=dOPs8vdYWVeqEs+KV+BmZJLX99JUdGa3lW3tlCMTOZFcBhp19/TWu7AGUgfp5wqfQulDVUky8Iw2hY9fMNVN24ntm7qvRW59vDvKmK4aPyZVE9lanXJYe3BKXbmyuv6XTPTVoW6X2uYE2NDYs3J4ilxRUMh1SrJsR4Zz34o0EZtFckV7KzSYTAn8yFGAH4SG4Nt04h0Yaoy88HgTshAyIGhOB255PNxHgaUp643DlPA5b97yEdALGO97MHMOkpuMDBi6w5Fg+r9meYWCk7moTS4cOwk/tVcJieY1OIPHIpSj3h/1vNF20LcFhpJHbI34o9ZcbTaKfaw8x3ekU3yajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6khBOW7YrL9OCK1p2VGD6zqRtJNHJzuH04+nGXoBe4=;
 b=k6gDjeNmlBkvASuMWdUi7KD3pQYRpJQ83g8VsZ55My6naM6Eyy95M6eBZ25AOv/O3yX5s92Vc1RYImSoNxqzJ612qsAAQ+OsibarbMAfBpk672NgcbQO7eFy4u5IOOi+c0i1AY5UVgmr2UXGDKP66h3XHHm9oVuJwN8FAvWV00I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7581.eurprd04.prod.outlook.com (2603:10a6:102:f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 15:26:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 15:26:46 +0000
Message-ID: <ac1fb448-3a49-43af-b8cc-319210a127d6@cherry.de>
Date: Mon, 23 Jun 2025 17:26:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: Replace "On the contrary" lead-in to
 sentence
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <b651b956-eb9f-6d46-f878-f09bc6bdc460@crashcourse.ca>
 <2ee944e5-392c-4023-baff-57684d6a2cbc@cherry.de>
 <831cb5d3-e93c-5f00-fa7d-a3b3333e4145@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <831cb5d3-e93c-5f00-fa7d-a3b3333e4145@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0145.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bf5422-6de1-4510-eb73-08ddb26a5dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SEJyRytQY0hpdUtFWERIUysvUzFOODYyTmpLdWErRG1MN2xOYnAwd1UxWmtW?=
 =?utf-8?B?b3JTYWt1b3lOWWF5ekxRVzlCYkthczhHUUpXSjQrSGliVW9BbXdHanlQa0Ra?=
 =?utf-8?B?V3dGcGs0RVFQd1VjcU9lWFZYejBqTkFxeG1waHdla3EwbDdialRuU0p6bFl6?=
 =?utf-8?B?SW5mNldId09yZnZ4RlB6UncyTUFqenJicS9sMlJWMXdOOG9OcElEN2hvMWw5?=
 =?utf-8?B?Ry9YcmRRQlZtOFlHTWpUc2ZhdHJYUkVlWUYvZ3JQdUx5WVJjamsrTjhPVWda?=
 =?utf-8?B?azNndEpjYXNpbnZybTczcGwzclphS3Jrd1M5eFlmakZWSTI0MmNCN3o5TkRW?=
 =?utf-8?B?czN1VUhUZWV4OU4wREtRb3lWVVZqQ0l1anlpc2xja09ZQ1Y5cEUrcElCRHgy?=
 =?utf-8?B?ME1Mem9hVk5VVkJQZFlKWW9ieEtaMXo4bU9GaDgzVUQzdEN2WXR3TVJOTmFL?=
 =?utf-8?B?dGRiazkzd25FVFRxSk16b2poTlhUSnhtMHJ3U1BTUDNvdVQxVjIrU2VJRjJ2?=
 =?utf-8?B?aUNMU0NCY1FMN0tVdFMyV1Y5aVZBbG1udzNJSE41R0JSaW92UjZFdkk1UVdh?=
 =?utf-8?B?Q3lNWHpSMjRjR2d6VW1FaWJvd2RKMUU1anZTcEsvTEZLUTkrNDNENDdEZVpr?=
 =?utf-8?B?aVUxdFUyZVR1aE0ybjJEaEU4R0VXRUhlREZaSml4ODNwRTNsbDcxMUVlZVNy?=
 =?utf-8?B?ZmQ3VHc1MW11Z21tbkk5MUlUNWFWVGZzTXdnMnNDN3hpa3BoMVJZK1I4b3Ax?=
 =?utf-8?B?MUpqWWlUcWcyTUlyM3R2clh2Rjk5dk9zYVBpbG5ZUzF3TkI3cWdQdDlpUkRB?=
 =?utf-8?B?bzhlVExUT0hOWGNKMER4bHFDdUh4akhBdktiK1h0bXdZNWZDT3YzQjVjRjhs?=
 =?utf-8?B?Wm5wZkIrNmdhSmFWOURKZ1pWUDBqbUlpcmxzaFFQSE9VNlU3QWRJdFRpRW9s?=
 =?utf-8?B?cGp4ZDNZM0hUQ1B1RHkycFkySytxMmY5UTMzT2lxWk53QVcyZ0ZEeVNnc2ZX?=
 =?utf-8?B?WW1sWHRhN0FOeTNCbzZQcUNjLzRxNFhRMlYrbWN2SWdUVWNrNjJPSDFDa0hY?=
 =?utf-8?B?NXRTQkhCVTh4aHpJenJObGdYRjd6MjM4eVpEMm5sYVNmVmlLSWJtMXFxS1M4?=
 =?utf-8?B?Sll4VmVoUDI2ekkxZGY1YWh2eXFDckxJVFlLb0dNY0lyOFJSNkZxb25EaE5G?=
 =?utf-8?B?ZUdiYTlrdC84RDJjVjJZUk5vNlVUSjVtTEtuVW8wYWwzMWRGOGNMdFJYcEdr?=
 =?utf-8?B?UnNWVm9WbWM3QkROeGxsazRhQlpHMVR6dHljVE9QdzIxZ0hZR1kvMWRON2x4?=
 =?utf-8?B?VGNmbUxjcEd2QndQdVdUUVpmeEc0ZlRzSk1KTm5HbkxseUU2YlN1Um5zYVVC?=
 =?utf-8?B?MXcyUk1RZVE2UytNQkxzUFBacngxUnVORHdZbmxLQXZ1UHRydFhReWRrUHNq?=
 =?utf-8?B?WStPTytYamFQdzRGekhzbkxVTnpPOVllMEdFb3ZDUmdPcS9ESnd3bFlmQ0Ri?=
 =?utf-8?B?Z1NZVnpYSjJuWG1Zb242RE5hUklDR0l4VGplallaTkVtcGR5UnA3VmtGVFA1?=
 =?utf-8?B?SkdVQVdPWFJRRXR4UFF0WnI2aGpIZHV1VGZMNVg3cTRtdDNnWXpsMEVVM2VL?=
 =?utf-8?B?VjBTM3N2WmRLcDBCeURyY2FnRC9vUHUvN1g4VmZqVy9TSFVCcVlmQ29FR25q?=
 =?utf-8?B?dlZLZjAzT2VCSXVSVnZpc2hGNWdiWkJmUUxXYUMyLzVLcW1LQkpVRHNiTjBQ?=
 =?utf-8?B?eHNsNm9GeXhsOVpjM0lCaWxQL1ZRcW92eW1lRHFpaDVoVFZwUEtlb3JvTGlX?=
 =?utf-8?B?R1lNamFWQ0lwSWIxc3paZ2gzZ1dzZktxZS9BV3lOT3R5M09XeXM0ZGJ5REd6?=
 =?utf-8?B?M2U0d3RrV3dKVS9nc2NlL0cxbWVZdFB2Q0VOcVFTY2FJZGdVOENKNnBMaS9p?=
 =?utf-8?Q?hn7sauoeXVA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0xxUTUvRlFlRkFwb1RtNVhjMU9pRlVUdmFuY3ZpQ1FDREg4Z3VwRm8vR2Nk?=
 =?utf-8?B?WlRrcElhazV1dzhhdmNNN1ZBU0tFa3AzeTFxSThSN29QWnBwa2dReWhjeU9o?=
 =?utf-8?B?eUNUQXBTdVNlOW1aUVkyejJoS2R6Zzk1VHJudDluU0ZWc3JYd3ptRG5ObnpU?=
 =?utf-8?B?Z1htRStkeEJGRnBtQXRqV2t4RXAwRjRHY0pUeDY0WjF6NWk1SXNjaExGckVy?=
 =?utf-8?B?Um5EdnNXaVNXSE95MldrVkY5NE5Md2xKWlJUZHROalNCUllXdndId09lNzJx?=
 =?utf-8?B?SVJldHBZbGJ6ZjBmNXpCMFlFbGlWbGhwNnhPd25pbWFlY0ZEL0dXWmYxOERr?=
 =?utf-8?B?SDFHNUhkRkJhWEIxM0Z3VzF1cW94Tk5JeWh0QWxXUy9Ka1MyUEhlL3JiSXlZ?=
 =?utf-8?B?VmRxQ0NvTXpia0VhK2x3cjVHSWZyaURsbmVWMWtBeXVKb2pQYXpXd1p3T0Jh?=
 =?utf-8?B?RkdBam5tc29OUnhHcUEyMnAreXVwUEUvSzJ2Vlk4VUYvbFRwSUdXRng0YmhT?=
 =?utf-8?B?cHJHdWlRemlMQ20vYmh1OTlEc0dYVitkaStZSDBkVkxmU0tLeTY1d3RJUXU5?=
 =?utf-8?B?T0RuWkg0VDRsWnB4V25xSlZkTXlVYWEvSThCUzlDNjlwbkFkMzBkMStXc1pi?=
 =?utf-8?B?QUlxNUo1QkwwRFBWWkdLRno4TGxwZEtZMWxHbGN0TGNMcnJXeEIyK3hWYXdN?=
 =?utf-8?B?YndoOHR2RFZheEZ3WEVZdWpCNUQvZ3IyRW82cXRTSnhkMEFYcUIwQ3Z6MmRp?=
 =?utf-8?B?amVMM0dnRzZ5ZTVZUVhRNEFBZTQ5VTN1UkJEdHpxSlY4dkQvalJmY1BjVVFZ?=
 =?utf-8?B?VHRRNDBxdm1TKzlnWStWTUgvRE1ibDU5eFd5TmZiV3JiWXFYbzVoYWl2TXhI?=
 =?utf-8?B?bFVIS3F0VWlEY1BhZFd3bytmOE9RTXdpTWY5TmNsSjFiNHlPS1p6NC9US0xQ?=
 =?utf-8?B?MHhidHFlWTJxdGRXUkhoUXZkL1RuT1lNVjJuVlJPQmM4TzQ3d3IzaHBBdSsw?=
 =?utf-8?B?SEoxYTlCQmRpUVRwdE5YRUk5cng1aFFaOGdYK2ZVWDZ3N1NiRHpaVWFuTHg1?=
 =?utf-8?B?MXhmT2dtWE1ET1lHdTRjdiswS0JEV2JmVWhnNStDYTZISU5Fby9jOWN0SE9i?=
 =?utf-8?B?d1dGQWV4UnJsYUp1cEgrN3lvQUVqMjZock9aS3V6ZHhPNWFjVkNxTjIraVRH?=
 =?utf-8?B?cnRqUGFET29mRDZBb0NkejRZOVFUVTZzWUYwc3Y1bkxHZzVjejhkbDZ2NFQx?=
 =?utf-8?B?ZnZhYTl3OUhxeTY3TGFsQWI2RFp6UmhNUjdNYUJJbGcvOEFqRjBUdnNLQ1Y4?=
 =?utf-8?B?YSthc1U4SUlCd1ZrYXJVVmlPV3VlWXk2QU0rV2llZFdMYi9rbk5IYVJtWDB1?=
 =?utf-8?B?d0FMMWlUZ2E0S05UWk45Y0xMY243TzFzSG1GRVJoRXY3N1J4VFZyVlJSd0t2?=
 =?utf-8?B?TGZsSjVjWkZUeXI0TnAvSzdhcGVndXkwZjZkdkRHSlAxUlEvUzEraE1BbnU1?=
 =?utf-8?B?aDFqaForbjYzT1ljREMwMUZqQ0l5K3AzVy9NcWovUEdJTDhrZ0FJeE9wM0hB?=
 =?utf-8?B?MFk3T1doNjQxektYcENjRkc4M09PYkxOQUN6K1ZiQVBZRXg0UkxEZlhrT3hU?=
 =?utf-8?B?L05IWUp6cFhKQ2JvUnh1NmRhTXJ3MEg3QURLcnVPQ24vdndmUkEvQ1VEVlpk?=
 =?utf-8?B?b1BScW9tWTMxaWpYaFN5UVNPWkVuZVZFTVRZY2tNQUozMHphU2VPQXc3SGV2?=
 =?utf-8?B?eHRRbTByWGdyRjNqUUpBUGR2aVNnTm0ySTExL1IzMlJFQnprbWNDV1QrWXBM?=
 =?utf-8?B?SjBWWlpUTndoZjlmV1MwM3N0b1pnVkhKR3RuYUY4d1ZFRXRtRGRTWnAzZjVD?=
 =?utf-8?B?NzhPQkRqbFJSR29ubENwWjRYODdNbnU5QUNMMEl0d3l1bERsdGQ5THJVenhh?=
 =?utf-8?B?aFlMR0Qya3FCRmFLQi9MT0llQ2hUREw0dVJCWjFMckNSZTdkTGhKRFQ1TGF4?=
 =?utf-8?B?eVBQYW5BWUhzWTI2a09XaXFVL0NESGM2SjdWeE0vY3NNa1V1UzBvcStESjdm?=
 =?utf-8?B?UnZWQmpJd1lJN3dsSDJzS1BYajhTSDRjNmZVbzZwaHFoVXVwOThaS2pvQU42?=
 =?utf-8?B?NXlyUE9UcE5zR3hmUHRXaGdzOGtlYzhXaHB2MENFV00vYlhha2NkL25lUG51?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bf5422-6de1-4510-eb73-08ddb26a5dc6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:26:46.7587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/GaK/bQ6Dao/1AKbdM2YOayfrJSrym4eD1wfMfoc+LzLRG6cK/utbNv3UPY11JivmRKlvNApAWk43Ps73SbOzGvgpowVE8pwX+i+7IWp+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7581
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 15:26:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7165

Hi Robert,

On 6/23/25 5:22 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Mon, 23 Jun 2025, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 6/22/25 5:09 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>> "On the contrary" is entirely the wrong qualifier to us here, as it
>>> typically introduces a *contradiction* to what has just been
>>> expressed. That is not what is happening here.
>>>
>>
>> Not a native speaker but my brain isn't too happy with the suggestion either
>> (but that could be solely due the fact I'm not a native speaker :) ).
>>
>> Would "Alternatively" work here?
>>
>> But I agree "On the contrary" sounds wrong :)
> 
>    I was actually toying with "Alternatively". I think that, given the
> contrast, I think I will say, "By contrast, ...".
> 

Sounds good to me. Wordreference gives me an alternative to "by 
contrast" which is "on the other hand" :D

Cheers,
Quentin

