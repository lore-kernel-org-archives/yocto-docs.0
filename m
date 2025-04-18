Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEC4C369CF
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:28:56 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web10.9620.1744975733691582880
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 04:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BaoOvOPI;
 spf=pass (domain: cherry.de, ip: 40.107.20.76, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvr7y3qIxZLULDTf11o4qUhCXA+lS8ofsOgoPT1KHScIP8oeUuEU4pO28MUjR13xk3McH1HyPrVbZQuWEvamaTexzCWsLqlqZW1FifT4vBcmoRPxopzpNl1B2xYtHid3+6qbZHQqzELWVwecCpwXCnGg1D9uT0FGwr+YFxbE6PDQBPgFkLUmXJa3UC2AHgkPXHO1HdIfab0AtAdI69a8/l9IvPLqgTL++FBIEKM8pq2qUGco64tuq7hQdLiIeTILYeNWFZw7V+0/6EryoZODjRXxQw+5UM57Sy6niV51hA6ebBzKNZ3Twfuye56C9kZjSYzXra8RmFuDTn1L9eMx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFU5ITfJPxCFpPdtx6HiwMSoWdGGKChnQso1nxPyu94=;
 b=IYNABbuCR+pPh+0DPy05X+U74IvWozlF2H+hVHn3jJuOUnHvDGXshwLiOijgc5Q0sBCe5XHWuPf/mSZGlDBNblFct0DRze6t21/EZWNAx/ZEke2cpcC+5ZXmVvVTi3fs1JBNdnIpwP/L4RUFxNzh4Lro6ctB9rkPSMk7q8H69N1Y6EkINYdY9Dconu+UcObXavHoRRNxVYsRDYOFDp5PEkKJEmSWXO0saILz0V//fcD6+QhTtvmLeHBD+8jM91vfC6IWJq6ByE+um95Xfkumqvhxc2Q5gvgAUguDz33/njBVDQ/DEWAlISERtWI9K0HXoy5utBi4TS1CwHNSOoHSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFU5ITfJPxCFpPdtx6HiwMSoWdGGKChnQso1nxPyu94=;
 b=BaoOvOPIvi8roX+QuXqVHQzvp3EwuM1Tw54U19dnMNDgisaRiLC75gjEMlNUBVmxJxXqCBlc2FH8DwTcYNCFEl48C5F4huLRYc/knANQ/3Ge7XtyasoHBI/vf2uTqpkMT8z4gsMzN/FjtabvUPYl8zsV88eEU7ndVCz2k6XyZGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VI0PR04MB10542.eurprd04.prod.outlook.com (2603:10a6:800:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 18 Apr
 2025 11:28:51 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%6]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 11:28:51 +0000
Message-ID: <62fb508b-741f-458b-ab7a-2ceed64a95be@cherry.de>
Date: Fri, 18 Apr 2025 13:28:46 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
 <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
 <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
 <D97WADVD9D0D.3PPCH5GX3DOL0@bootlin.com>
 <0f03eef3-4de5-4276-b692-0fd18571ddbe@cherry.de>
 <D98QDOH9EM5M.2LNH55O8DZ8IC@bootlin.com>
Content-Language: en-US
In-Reply-To: <D98QDOH9EM5M.2LNH55O8DZ8IC@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VI0PR04MB10542:EE_
X-MS-Office365-Filtering-Correlation-Id: 9785c488-4761-431f-b3d2-08dd7e6c3195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RzFuNktFcGdzb0N6MzVQZC9yUHJqTXJrMnM4elhpajMzUnNVNmY4L052Y3pR?=
 =?utf-8?B?L2VCYTZEVk9jbit0N1VxRmNEZ1hzT20wTGx1MmpadHRBTnVVazRoZnk3dW5m?=
 =?utf-8?B?WWJzb0czRTllK3AwdWdaRVQxR0tHdE9rZXlZZEZwdU1KbVg1cGFUYi9ZSVJY?=
 =?utf-8?B?RjQ3eVhnQzl5cE5aVjVGYXNqcUdVbGh2cDFYTU4xRnF2WDJrWmpjNHBpdjJK?=
 =?utf-8?B?dFJCVkFiMlZxdjlDSTlVWk9XSXlkVDhVK1AzNmxkV0p3eWwySSt5aEJ0d1oz?=
 =?utf-8?B?VEdzVnA0YUhUR2pybWkvOUdyUHdvbTdCV0VXN0N0M0NnZ2VkNU1RajlCdThO?=
 =?utf-8?B?YVJWLytJS2pIZStmc05kTStaNzRjOVNsc0RWSEN6WHYwZDZGcEtjT1hRTElI?=
 =?utf-8?B?ZnBUSFo2UDI2ZExNZGdpVUpVTHZEZGN2enFGSlFxU1BEdHdPZnFFRS85aWdU?=
 =?utf-8?B?K2l6SVNpK01xNW13RDdQVTZwSlhnbG81NmUzYUR2dndzQzM5a2JJZmpscytW?=
 =?utf-8?B?dUJTUFVIZXh0YzUrY1BSMmlFd1o2UFRuVzZ0Q2Uzdk0rUDBCcldsZlBYS1dk?=
 =?utf-8?B?UG91R09kR21DdkpjWmpVZG45K0MvY2ZtNDBqSEZ6c1dGdlE3eUZyYUU4UlRE?=
 =?utf-8?B?ZTJTWEtXYnJ2UmtqdUw2aWV2dlVGRVhkaldYclB5bTIxUk9TajIyWnZaQVdu?=
 =?utf-8?B?UG5ZS3grWDlVTGNWdnkyWXk1M25EdXZjcXlkWnlwTzR2SWREV3ZDNHBSZVZ3?=
 =?utf-8?B?SSs1UmNNbVFlMklnRDk5Rjcvbnc4UG12MHNGUmpINGxDQVdRc2VaamtzWVg3?=
 =?utf-8?B?ejdCc1RtYWJVTitDNDh4ZVZVSzlEZjAvczdDSXZzSWdGRWUyY1JuN3hReGhk?=
 =?utf-8?B?cEQ3WndUeGl2Qlg3OGV5b3dvRkVWZzdiV3JWV0Y2LzhIc29IZVdxUkVLeU1W?=
 =?utf-8?B?L2RJa3FDUmJoTXVXWlNTTHFyUm5mL1FlQWg0NEVFVmtVdWRuSStUUmxXc2dV?=
 =?utf-8?B?SE10MmV0aEoxaitPYXovNGtVbHhYeC9PN3pIS3VsVWFJNThrbXVJR2FTL1g1?=
 =?utf-8?B?bC9xTmMvVnNKY09DTlRCbU9OZUcyOG80eG5ndCtHZW5uZjF3b28weWxIRXl6?=
 =?utf-8?B?WllaNDd0dkJjT0NodjYwSnRuNThOQjVYUStaS2tlRURvQ1hCMzlrdU5tdlpF?=
 =?utf-8?B?NWZBcUEzWWM4TnlYdzJOT0hreU90R2lHTnpSemE3TUtYc3BseVFGOWtsci9N?=
 =?utf-8?B?eTBpSU9yS0xqZ0dCUnBFeHF0NzNYaEFLSGIxK0FjN0RxSmFiQ0h6TUdDM0R5?=
 =?utf-8?B?V2dvQVJMbGhiL2x2aWRUVWFYMnRJcWMxcmxIZ0ZuZ1F3MFo5OHdhalRKaWtl?=
 =?utf-8?B?amJpelJ4QWNCUjhCYmhZdUppa01LdHA2VHA1RlVrZmFkdG9yMTU5dlhCV09i?=
 =?utf-8?B?ZWVweDVpNkkwV3V1a1E5Q29WYTUrbFoydU9TenUveS81ckg4V1oxRWxmWmZr?=
 =?utf-8?B?Q0RQL2JtWUlPMmJpTjFyRWVhNG96UE9vc0xCdHo4TU9Oa2VtNjV4SWNHUjRD?=
 =?utf-8?B?SU9VVy83eWlJdGgyWDNFZXU1S3ZTS0lEalNCbzdwWHpNbUplSndkUUp1d2hx?=
 =?utf-8?B?R3A0dUpOZFhYZUhlaUdXWWxrQjhtZG5hR0xuMmxJbDBDMHlDRElJSGhaOXVn?=
 =?utf-8?B?N2UwZlN2QUZuRnZwRWFNaHpwSzliTWtVSjRYai9CbVJGYUpITUVHUjhWMWtq?=
 =?utf-8?B?TFByZVpOTmhvbVg0M1NWWStlNmJWbTh5NXVMV0VLbDJGUGUrTWtPUHRMQXlY?=
 =?utf-8?Q?GexSsSU4fMBp3iRNoQSpQxqUBAcA00X745o6U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDRGNlJ4N2RYbWFFR2xYOXRXMndPUHJvZldWczdUSldxNkszZFBjNGVONlp3?=
 =?utf-8?B?czhZd2FxUGJ1MUkwQkp4MDVJOWhKbFlwSGlzUHQvc2NQbGYwTGxPTHFoNlkr?=
 =?utf-8?B?RDNOUFVYVUhCZ3hOdFUxeU9nVTd4eG92Qzhwc2RLcThvUllhN0RKNnB1cVZK?=
 =?utf-8?B?NmdBYUR5c1RBNUZWQkdKWkRuQ00vdDVrT0xveUU4QjV3VHZmSDg2Q2llUkNh?=
 =?utf-8?B?VEpLbU5zMmpnLzBQNDZvM0VZK1RNd2ZOSW0wOEMvS3B5SVpBcG8wVDlKMWJ6?=
 =?utf-8?B?cDVnWHlyaWdxWElGOHAydGtLRWlHaHlQR1ZKTmZXOTZtWm53UGJLVHh6bHpP?=
 =?utf-8?B?WFhnaStqeEhaRWNwVzJiM2JOdzg4bzNDVzZJL3Buai84bTRTZ2FWY2hEV3Ev?=
 =?utf-8?B?NTRSWFdUSzZrOEwyUXBtT21GS1VTWG1QM3IrdEN1c3BJTzhqV2FnOVgvR0Zq?=
 =?utf-8?B?a1k0WVJKNy8yakExUnhoOGdmc2p3SVhjR1UwYzFNc2FUMnVuREMwRmNMRkU5?=
 =?utf-8?B?UG9Fc0RKd1pSeE1LelYyQjZoS3dEL3g1eUxVTHhuV041RWZuZTZIZWMzaExV?=
 =?utf-8?B?YXB4cGJxbk9BWndacWc3MzRSV3FET0JSWEZhQzk2Q2NDMmJ6aFlMc1owYlNQ?=
 =?utf-8?B?UVpBUWJCZHQ1ajFLVW9hdjdBSTE0Z1N3YTRFeTJ0ZXllb2dDTWRlY1JueFVE?=
 =?utf-8?B?YmFCREtXQmlwUm85bzZVREIxdkZDTXZ0U2hVM1RjcEtacExsK2RFckF4ZjUx?=
 =?utf-8?B?Nml1TTlyWTV1K3pWY2ZuMGpGakcxb1ZKYWJEQTlJL0pNYUtVT1pXMUFaaU9H?=
 =?utf-8?B?S3hNRXhKUUM5V3hxVW1LY3dXL2Z1NE0zNG5TWFM2RGI3NUxZbFM0cWI1QWRp?=
 =?utf-8?B?QndUQUx3NzBMeWVYcjRFTGdkKzZRQTRvWXJPUnN4OWo4R1k2S3FMZktxR2VY?=
 =?utf-8?B?b1MxNDl4Nk1KRGVrYjB0K2Vxa2k5TTVwVDUxZmthcldqalRLbFZydGhCYjFE?=
 =?utf-8?B?QW5vRUNYRnVad0tQbCtjcDRQLzBYTE5EeDRyUksvQTByNWNRWG1wb0pMNlM2?=
 =?utf-8?B?UEowdTJnSVVnWWtFVHdlVllwaEhjTUVISU5JTlo3REplNWJqcVhmeDFWYUNK?=
 =?utf-8?B?UGJEaHp5UHZXTVR0TkhuMG5oSTA1eElzTVQwNStwR3dwdkNxbjR5ZEQzOUt4?=
 =?utf-8?B?VmwzdEVESUk3RFd3eTJLeW91ZDlzV0xoMGlkYUMyM3BxOXMySUxXYm5TNDEz?=
 =?utf-8?B?VmlLUGZKMzRBUzVoTXBqd3ErMFdyanRMeFE1aldRU1Z1Vm5OK3NVOExJRUdE?=
 =?utf-8?B?di9mSUZuNnBidkw5NEhpUXF5WTBjeFQxVDR3Yi9nVVcvWXN1Tk1SNWhiQ2Ny?=
 =?utf-8?B?NFRld01ZWFBhbkpQNk9mUWxsRnhLQ2dGNlNDMzdJTUgwdUNKSEh1ejhSSzJW?=
 =?utf-8?B?MlpUYTBRMXg3elBlMUVSMTdjRDBCbTcwZWV6RGRjUDRkVjhQc2oyNG5Ga1F1?=
 =?utf-8?B?WVdiNGZrQWY0YmxCK3NTM3h6WHN6TEdYMjlidENJK2xlakJtTU9xY0MwYXFK?=
 =?utf-8?B?U0o0K2Y2ci9wY2RLRUJLM1M0SVBKZ0l5djdCZmhBMHhDRzA5M29DMjdCL3h1?=
 =?utf-8?B?YTBlUmdubGpUZzJxWGtpbGlvOElwVXVMaWw4MkZKMk10eWZsRGJ4ODBHQXFx?=
 =?utf-8?B?YjA4dzA0dGJMSktmL0ZHYUZDeHdCdmowQnA3ZTdkRXp4Q0c3ZCt4YzVCSnhD?=
 =?utf-8?B?MFM3UVJ6Qm5RZm9UVVFyZjNFVnZCQ1k3YlNIQ0pjYVNnYUZ5K2Z3NkE1aXYz?=
 =?utf-8?B?Z1A3QnY3RUF6K2E1M01qYmVjZ1hXQ20rNklEdjE3QmdRVzhsbllna3JWZFpv?=
 =?utf-8?B?UVhid1czMUs5T1E3QTFudU00UFFGcFQ0aVBhalhNNGtmc0ZhbForbE1XdDNr?=
 =?utf-8?B?dnZ6RUQ3R2lqNU5rbzU1a05ua1BzR0Yyd3NiTDJXanNtMG10NHZaTG1jRVNV?=
 =?utf-8?B?dUVVRDloZWpPcllrVkkvOWpSSjFGY3FHQlllTXlhdkdBNy95UE1FcUQ2R3Bt?=
 =?utf-8?B?VS90T3JUakltUklIQTh6TncyYUw4OElwSElnU0haSVJUZktnVHZBNlZwL25Z?=
 =?utf-8?B?alRPTDl5b1JTRmF4eGVnUnlJMjBXUmFveTdpbElTSnR1QzNzSWxLZFVLMndY?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9785c488-4761-431f-b3d2-08dd7e6c3195
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 11:28:51.1873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOZ690IyRB3UAclBcqGtqEQ4a5neYkHChDUC5PaSeveHwfqZbYNVDkbZtcCndhPhaPNguRJbQzja97BEI6WAR1wl1T2dMYfCdwKXsbxwDPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10542
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Apr 2025 11:28:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6757

Hi Antonin,

On 4/17/25 9:21 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Wed Apr 16, 2025 at 11:58 AM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 4/16/25 9:46 AM, Antonin Godard wrote:
>>> Hi Quentin,
>>>
>>> On Mon Apr 14, 2025 at 2:18 PM CEST, Quentin Schulz wrote:
>>>> Hi Antonin,
>>>>
>>>> On 4/9/25 11:55 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>>>> Introduce the DISTRO_LATEST_TAG macro, which should always point to the
>>>>> latest existing tag in the documentation, unlike DISTRO which may point
>>>>> to A.B.999 to represent the tip of a branch.
>>>>>
>>>>> This variable is needed to fix dead links in the documentation that
>>>>> currently use the DISTRO macro.
>>>>>
>>>>> Also, make DISTRO_REL_TAG use the DISTRO macro directly, to avoid
>>>>> repetition, and add a DISTRO_REL_LATEST_TAG macro that has the same role
>>>>> as DISTRO_LATEST_TAG but with "yocto-" prepended to it.
>>>>>
>>>>> In set_versions.py, run the "git describe --abbrev=0 --tags
>>>>> --match='yocto-*'" command to get the latest existing tag on the
>>>>> currently checked out commit. Fallback to ourversion in case we didn't
>>>>> find any.
>>>>>
>>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>>> ---
>>>>>     documentation/poky.yaml.in    | 11 ++++++++++-
>>>>>     documentation/set_versions.py | 16 +++++++++++++++-
>>>>>     2 files changed, 25 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>>>>> index 836f11454..26c21e346 100644
>>>>> --- a/documentation/poky.yaml.in
>>>>> +++ b/documentation/poky.yaml.in
>>>>> @@ -2,13 +2,22 @@
>>>>>     # Macros used in the documentation
>>>>>     #
>>>>>     
>>>>> +# The DISTRO variable represents the current docs version. It should be used
>>>>> +# when referring to the current docs version. See also DISTRO_LATEST_TAG.
>>>>>     DISTRO : "5.1"
>>>>> +# The DISTRO_LATEST_TAG represents the latest tag on the current branch. It
>>>>> +# should be used in HTTP link referring to the current docs version. In these
>>>>> +# cases, the DISTRO may point to A.B.999 which does not exist (just used to
>>>>> +# represent the latest HEAD revision on the branch). DISTRO_LATEST_TAG should
>>>>> +# always point to an existing tag.
>>>>
>>>> I don't remember why/where we need A.B.999? I assume most shouldn't
>>>> point at .999, ever?
>>>
>>> The default landing page of docs.yoctoproject.org is a 999 version (tip of the
>>> stable release branch).
>>>
>>
>> That essentially should be for the version number in text and in the JS
>> dropdown? We should really check our use of &DISTRO; in the docs.
>>
>> For example:
>>
>> documentation/contributor-guide/report-defect.rst, not sure we don't
>> want to use &DISTRO_LATEST_TAG; (or another variable) instead, as it'll
>> always be wrong on the default landing page of the docs (always x.x.999)?
>>
>> documentation/dev-manual/multiconfig.rst, I assume we also do not want
>> to have x.x.999 there? I'm also not entirely sure why we explicitly list
>> the version or if it's still appropriate?
>>
>> documentation/dev-manual/start.rst:774 we should probably get rid of
>> &DISTRO; (but we can keep &DISTRO_NAME; as that matches the code block
>> under?)
>>
>> documentation/dev-manual/start.rst:843 is plain wrong as the tag does
>> not exist so we should be using DISTRO_LATEST_TAG. Same for
>> documentation/dev-manual/start.rst:854, same for
>> documentation/overview-manual/development-environment.rst:459.
>>
>> documentation/ref-manual/release-process.rst:15 should probably use
>> DISTRO_NAME or DISTRO_LATEST_TAG? (or probably another variable which is
>> only X.Y and not X.Y.Z if there's one, since X.Y.Z is a minor release).
>>
>> documentation/ref-manual/release-process.rst:59 probably should be using
>> DISTRO_LATEST_TAG too?
>>
>> documentation/ref-manual/system-requirements.rst:58, could be using
>> DISTRO_LATEST_TAG but probably not a big deal if we keep DISTRO instead?
>>
>> documentation/ref-manual/system-requirements.rst:349, I woudl assume is
>> completely wrong and should be DISTRO_LATEST_TAG instead? Same for
>> documentation/ref-manual/system-requirements.rst:350?
>>
>> documentation/ref-manual/system-requirements.rst:403,407,411,474,478,482
>> need to use DISTRO_LATEST_TAG to match the name of the buildtools.
>>
>> documentation/sdk-manual/appendix-obtain.rst:66,72,176 needs to match
>> the toolchain you can download, so needs to be DISTRO_LATEST_TAG.
>>
>> documentation/sdk-manual/appendix-obtain.rst:275 probably wants
>> DISTRO_LATEST_TAG too.
>>
>> documentation/sdk-manual/extensible.rst:120,124,126 probably wants
>> DISTRO_LATEST_TAG too.
>>
>> documentation/sdk-manual/using.rst:74,78,80,101,102,104,105,110,130,141,
>> probably wants DISTRO_LATEST_TAG too.
>>
>> documentation/sdk-manual/working-projects.rst:85,88,219,223,225,280
>> probably wants DISTRO_LATEST_TAG too.
>>
>> documentation/toaster-manual/reference.rst:161,295 DISTRO_LATEST_TAG
> 
> Thanks for going through the different usages of DISTRO. You're right, with
> DISTRO_LATEST_TAG now I also think it would make more sense to use it rather
> than DISTRO. I will try to work on that a bit later (or feel free to send a
> patch :), the initial focus for this series was to fix dead links .
> 

I haven't checked if all links are now valid, but for sure some of our 
instructions aren't. I think they are as important :) or even more so 
because linkcheck wouldn't be able to catch those issues.

[...]

>> I seem to recall we wanted the variables set by set_versions.py to still
>> be able to build the docs from tarballs and not force the use of git
>> repos? But it seems like we force to fetch git tags at the very
>> beginning of the Python script.
> 
>    $ make html
>    ./set_versions.py
>    Please run 'git fetch --tags' before building the documentation
>    make: *** [Makefile:72: html] Error 1
> 
> It is indeed a bug!
> Created one here: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15834
> 
>> So I'm wondering if we should only have variables that aren't replaced
>> in poky.yaml.in and eventually have the ones set_versions.py adds in
>> poky.yaml (instead of replacing for example) documented in comments to
>> explain what they are and in which context(s) to use them?
> 
> That would be a bit cleaner yes.
> 
> Maybe standards.md would be a good place? i.e.:
> "Use &DISTRO; in the docs when wanting to refer to the latest possible version"
> "Use &DISTRO_LATEST_TAG; in the docs when wanting to refer to the latest
> existing tag"
> etc.
> 

If we need to restore building the docs from tarballs, then we need 
default values (and appropriate ones!) in poky.yaml.in. We could still 
explain proper usage in standards.md , though, up to you.

I would simply split the file in two with a big comment before the 
second section where we would define overridden variables?

I don't think we should be using &DISTRO; anymore? Most of the time we 
don't want to be printing .999 on the landing page of 
docs.yoctoproject.org! For the dev page, that's different.

Cheers,
Quentin

