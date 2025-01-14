Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25253C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 09:52:54 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.63])
 by mx.groups.io with SMTP id smtpd.web11.41356.1736848367826664887
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 01:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NQKGErE3;
 spf=pass (domain: cherry.de, ip: 40.107.105.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3jS9SvVbTwtV7J0lk9LV531XCFtFAIUw6xzGjV0QcDLV6Kxi2d5PesH3noiZqbq7JmTlD04xRWvox2yz6ZIRjBHZ/5rpdZC14pY0Z/52CXdJWFqAfc+rg9X54+7tBLQtvsf1iX98zzVzpgAY7Va8e7EVnyRRt6NoxbQebeiru8lLb59wKOSkLbT0N9wj17GBcxEqiJYsG2ceme4p/GBW2Z5bnBc2ofcyOD7S7qXhXklp8UYTSerViH7bHmc0Mw7NKvRsBjXSUPCjEdJzOV0TEOVpY4Rtz2xAISZbyAWwACSMh3uWlDh+81V410F0JSDOKBeCpHHZq3yZp2U+eqFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oibbwi2DyT5UT3ko9aBUieAIxxz1eXhHut8dKA3VR8o=;
 b=PkUzNBFc9lWg/K2PIC3IynQYW+AD08fz6t5OpUbz+JyMkFm+3pj/h/ojG6OP1IYBq++KC9crrPo6p0NhDbWq7E23uF2QGUVWVLBWtEtyP9yQa0Mr15b/jCP0RgWeypgsVp3SHN2Nf5ZkJjfCqNTqu7m3JijIMCxsP/Eq3Sqk/ZB3zWJp/vr3MLolWpVzbjYBjUsoElWGg4qsqVLTNaUjaW6Gp6WCHz6kSXcvdyopnKTjGHM9e9emz9D+eTIfAuLaH20pcHI4lfdgcOG2ZdPtDFsZ+4lDb+QK6Rzl9NyzB7dJEHJjVl3Kv8wtHAiS2qNY1zi+Od7mT6aMuHayqxnAAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oibbwi2DyT5UT3ko9aBUieAIxxz1eXhHut8dKA3VR8o=;
 b=NQKGErE3Gol+MjQEfQbnGAUpIVVdDoxOPhELnu84vL9GC/Tsg46l7wLBaN3M39kvZAE8KNkAF36wo8KJu2jd+8EW8j/+jpVXy/XwkvUXG589NkYLIZXYnhHzsBUlee+byl+SUJDpO1EvGvmetak/7L7e+k/D8gqgYfsVNLdrBW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10375.eurprd04.prod.outlook.com (2603:10a6:102:41a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 09:52:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 09:52:43 +0000
Message-ID: <fa26c3be-81a4-4927-9941-42b07f53cf18@cherry.de>
Date: Tue, 14 Jan 2025 10:52:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Best practices documentation for multiconfigs
To: antonin.godard@bootlin.com, Mark Hatle <mark.hatle@kernel.crashing.org>,
 docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cb8cda4b-4b71-4896-b355-d628336b11a4@kernel.crashing.org>
 <D6WSSTWDW44E.3VZKMQHM8HZLN@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D6WSSTWDW44E.3VZKMQHM8HZLN@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10375:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c52a8e-1fbc-4775-45c3-08dd34813123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VGM3R2FvNzBFcE5IQVkxb3ZkZW1vcm5PbFN2SjBOQVZPa1RNbzdmRjQwZFE1?=
 =?utf-8?B?ZXp2M0lzU1BNTDRDb0JBeGNETzYrekw4NDVMUDBpRjZWZ2UwZHFmVlBBQ2R3?=
 =?utf-8?B?SlE2NjVFSkhkUDdzU002czNxc1YzaW5UK1RSb3FZOFBMV1Zhb2FuTmp0YXZF?=
 =?utf-8?B?a09TY0NuaE5zeUVoVXZSZFd4Z1NmQTcySzU1S0ZRMXV2NFpYM2x6MEtmUmk5?=
 =?utf-8?B?QlovYllTMVEzWnJ5dXE4RE90ZWQ5QkYxR2NjRUxiSytubm9wTW13NFF6SGpp?=
 =?utf-8?B?YWg4S1QrZ0JPMDN5cWRDWWwzOThxY2F3TXRMQ1d0VS85WC9YcjlSalRHaUZR?=
 =?utf-8?B?Z0R4QnF6bGpzK21ueDdFc3FmN2dydVd2QTJmbC9rSlZwMk9jazV3ZFNwSnht?=
 =?utf-8?B?dmVnSzJQbU5IYW8rbWgwZ0lDWDRMNFpsT1UyS1hoSStBUkFkcm9scW5JcmVp?=
 =?utf-8?B?Q1ZlcXJyNG5qT0ZyVU00K3FOdmpGRVFkdExNUHFoblRkS24wN01IUzBZSkhV?=
 =?utf-8?B?TDc5MDhZUlpIdnlqL1RIaUVpUmdFQ0lTM2RzZGlMSmFxUXRDM0dOMWRYSDdp?=
 =?utf-8?B?aXJTK2RoRW1vdGJEbkFvMWV2dmsrM0ZqRFN5Tkk3Vm9ucllFTHBQOUtuUDJz?=
 =?utf-8?B?VzBNMDJscXIxb1VxcWYwOGhXcjFpMjNBNnZlYmVIdEhsVFBiYXZ4VGpBWU5h?=
 =?utf-8?B?SXh2ZzRXN2gxRW1pQVQzSDF4ZUREUzg2NzFPSU1jb3hKdGJmWVRHR3hMNmFL?=
 =?utf-8?B?cGZJSWVRbm1pYVFaMUk1YU8yR1IxOUZYY2gxNlg3K2l4NXp4Q1BSR2RnV0x0?=
 =?utf-8?B?Z1AzblNTK2c3NUJGSjNZUC8wQ2o1VC9RaDVtamtocnNqNmE1TVMzbkF1QTJS?=
 =?utf-8?B?d2xPQVg1MFo5TzhIU1IvZ1NVVVVmb0VzUWsyWExWdlBJaUhmQzdOVjJBSnk4?=
 =?utf-8?B?dFlRZEVqMU9oNytadlE1akdzeUZhWGRJS2U2QzBtSlBKTjJCbElrQnZHUUM4?=
 =?utf-8?B?bm1kclo4emZEaDgxWUo5WFAydk5IWFdXdm5ZNjh2SDBWRjFMV3QxaERqajcx?=
 =?utf-8?B?WmNVbjg5Wmkra0U1eTd6VVhjV3NJeGxkMzFhL0QyRmJwSlROUThTZFpmZkt0?=
 =?utf-8?B?QVFNRDc5bnRGODBzUEkvUDJ4TTdJeFFCUnMvZ2RRaFpkSkZ3YytScDZGNzhw?=
 =?utf-8?B?c1pXMDQ2Tk9YRHB0T2NkZWVGZ2lwdUdQSXVURkRDQzVVYmh5YnZTb0RBTzBN?=
 =?utf-8?B?M0MxZjhXRjh2UXk0MlRBRnZhaXVyVGM3TjhhMXc0NmRpNTZwTDkxODdUSDJ4?=
 =?utf-8?B?VllhZTVWM3ZnUkVHVGR0K1pBQkE0VlY0dVEzLy8rKzR5dlZzV2ZLSFVRd2V6?=
 =?utf-8?B?cE5zRmRna3hqcVMxMU5WVzJqVkZSMmRLZVZ5MjNmQ2t0SmR4VzE4ZU1GZ1dL?=
 =?utf-8?B?YzVMNkdmN09qOTNPZitBOXU0emJ3VTBoVFRDUmpEMUtUaWpHdVNtM2lvUld6?=
 =?utf-8?B?WnJIVU5XRUtwazJzcFNwNElPOFk4QmdDUGVyZDBWMUI0bkVsWjFGU2w1eWFV?=
 =?utf-8?B?M1RhSGhUYmh5a1JJSHNWUDB0a0NHVW9HTmhOcXduS0JFMDlJRzVKRUhDclhF?=
 =?utf-8?B?Y0hYeUErVHFJaW8xbVhNZWtidmJKRm9lSkRUM29qSjBlbWdyTFVETUhlcEJq?=
 =?utf-8?B?VUI1V0VNbFpvRndxRFBxaDZjc0dEc0tnR1FjTDlVSlIvT1J1M0NZOVludE9B?=
 =?utf-8?B?Z1FMcjZRK1JtOWtLOVNsQ0NOQjFHL3psRWxUUHhpaTYwUSsrcmg0Rmw2a281?=
 =?utf-8?B?V3M1cE8zSkNKU3g0dS90QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azNON2djcUU5dGFZWEhiMXRNczNwMFVleWhWQUF4cXJ6dDIrdzl2VXI3QjQv?=
 =?utf-8?B?SzcwbHkrL1h3OWIvRy91REkrWWxMOVlPV1VlR0Z1cVJXRDVHUXg2QkFGSkx3?=
 =?utf-8?B?RFhxUFBaNXFlUDAxbTVITFBaU2NVdmxOdnZPUDZ3Y3dPVjR1R3N3aHNyaHB5?=
 =?utf-8?B?SHVpUGRvVktBazM1aGN2dVhzaEJRUlNRaDdSeDExNjcwT0lYeUFDelBCV3lS?=
 =?utf-8?B?R2ZiTnViMlY0ZnhKd3poM0R6Y3MzZ2huZVl6N2tOR0IyaFFiTC9RSVJTMk52?=
 =?utf-8?B?eHBQT05QUGdJZzF2VjdkS1NHVDA0OGZ3ZHAxY25lM2VjdzZDcm9FdzJscFZh?=
 =?utf-8?B?M3h4RXBncTU5bHRualZBL2FBSzJuMUlUUjhUdzhOSVM3TC9yMUNmcklWYmRq?=
 =?utf-8?B?eEVVdkZ6VVE3bjhLcjRtWFVsODVJYnNySlBmbUdNKzV0T0s5MDh6UW96VWdO?=
 =?utf-8?B?Ly8vVTN5TWwzUWpJd3VVKzZIMGlhdmJMckVWTnhyNTRaRXdxK2VBZDlxWFZQ?=
 =?utf-8?B?WWg1Z3ZOSUtacWNTanE0cEdFY0VxOFgzdGxWRk54Y1drRWNaNjh4MnNGZnJN?=
 =?utf-8?B?aWtQMmRLVDl4NTR6aFIzZVpyWGVYSXAwVlhsckxoSSs3cGZpdWtVTjNaM3Rs?=
 =?utf-8?B?djhxUzhOMnlDZHdkVFo3dFgxcE81bGxnMlArelZ0bWorb1pwd0MrUlhJRUlD?=
 =?utf-8?B?MEJTVHloZ3dzWnFZK3JqSzF5Q0lyVXdRVEs1RDRxMnZhUGxucUJhcThpMmdm?=
 =?utf-8?B?MFFnbkZIUzRma1RrR2Q4dEhJVTNJMHZKZk9TcCtmT3U2MnRYNk90M3FYK1Ji?=
 =?utf-8?B?Y01qNU4wbTVueFd0TmN2VnNrL3VQMmFuYmtYcy9iYzFJQUcrbzVOMmx0NUF3?=
 =?utf-8?B?VzlwWXFjbWQ1cDUvMnF4ZHp2UnViOVRnRWlkbDgwMUNsNXNMODhockdUZGN6?=
 =?utf-8?B?TGpsRnNtNVRCdWFNYnVwdjViQzRXVitNcHZGcGZSNXFOSEdIRE9mZHNlVHJL?=
 =?utf-8?B?UTIzQ05jTjZUSXRXNTdYd0tnQWhJVEwyaVBxb0NPTWMyRkVRL3NyNHFnbERH?=
 =?utf-8?B?KzBxL3VweXdFZVhDZVNGL3FjSm4vWjZjQkxQQndjc0NkRGoyeHhUcGR0amI1?=
 =?utf-8?B?MFE2L0EwbzcvUEtieXdGQjNweWlpZ1cwbTBsdVBrQnlwaVVRdVlUREZIaUcr?=
 =?utf-8?B?WUdXYnJNWkhmT1F3VEtIQTRwcGd5SE4weE12VHBvOUQxSGdGaldZSnJSMy9t?=
 =?utf-8?B?WC9pTFZJKzFyVlJSOGtLdUF3eE1EaGFxZUU1WmlhOW5SUHphVHg1Mi9pZy9i?=
 =?utf-8?B?K2xwdmw4YkMxcTUxTHdqdnJSOFF4d0QzdnhMNGplQVZFMVdoR2ZnQUljcDNn?=
 =?utf-8?B?UzFPRTBpUXNINFk4dkZSNWF4N2VweW41SlI4UXJJKzFrUW5vcmZtRGtzYVA3?=
 =?utf-8?B?NTI3eE1BMUlZOFVKdUNNRmNtOGRzUjFOazBsN3paQk40YzlPd25WMStLbXps?=
 =?utf-8?B?c3Q1MHNkRTNJQy8yOGFqcUJFU3FodGFBWVFOUG5ObUhPREhqVW1VV3ROU3NS?=
 =?utf-8?B?bUZOa3BKbzYvdzQ1bjFkeWFRa2tIMy9FZUFTYmpQT3BuaU9zd2RKemROL3Vp?=
 =?utf-8?B?bW93UzVYbEhyQmZldXpjSCtIOWVacm9WVWVCU1U2MHF5WStJWmxRbHZjT0wz?=
 =?utf-8?B?QlRITWZoeC9TVnNRZmNhMEIwY3FuQzBSUGZmUythVURRYTRiZkZ6cGw5czVr?=
 =?utf-8?B?U2RoNkk1OTc2QmxQTDB4L1hlc2tMMFZxN21WMlRXTkdaZHNYanQ5ZUlOdUZR?=
 =?utf-8?B?dTN3R0U5cVM4Tk1NaEtreS8zUmY1TGVmK3d2MzVzNUxTSXhOcVRvZ3c0Y0F2?=
 =?utf-8?B?NHRZNzUxNm8vYS9KQXhFZWw3OXp4Y28zb1NubHNwTmhlaXhIZ3VxZVFnT2xm?=
 =?utf-8?B?dFF5ZGtIL0J2RU1KenR0MmtJbUhuL2V0UGk2MkFWeXVFY05zMVBQeGJvR2xl?=
 =?utf-8?B?VUdjREFkMjFLOEdFY1FGTTN3Qk93ejFCcHFrc0d5VHBNdE1DcEYxSmFOZjBa?=
 =?utf-8?B?VXlhZFlPR0REd3FseTVPVGt6MmpUdGhOWmRTbkVZdnN5RDhTSkxFaEVQU3Vp?=
 =?utf-8?B?blJPSU8vSjM4OFBrOXAvNDhRS0ViVzRuYlNKcVlOeVVqdDgzUkNJWE9Wbmh4?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c52a8e-1fbc-4775-45c3-08dd34813123
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 09:52:43.8047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvA5OBtxtvBikYGV21p4yAJJpSWnrB2LRCspYjYDnrltC42z7RcBMfRogBUDjsBsj6X/aCIWI3WnFL7MvGrL3dcSjn52XICgw777dWNpKvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10375
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 09:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6099

Hi Antonin, Mark,

On 1/8/25 4:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi Mark,
> 
> Thanks for this. I can help with formatting as well as where to put this bit of
> documentation.
> 
> I already created a bug for this, you can add yourself to CC if you want to
> track it: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15709.
> 
> First thought: compared to what we currently have [1], your doc seems to bring
> better details on multiconfigs. I'm thinking we could merge both to have a
> complete document on multiconfigs (and also make it its own document instead of
> a "Building" subsection).
> 
> Other comments below.
> 
> [1]: https://docs.yoctoproject.org/dev-manual/building.html#building-images-for-multiple-targets-using-multiple-configurations
> 
> On Wed Jan 8, 2025 at 12:07 AM CET, Mark Hatle wrote:
>> I was talking to Richard on IRC and we think that we need to start collecting
>> and documenting examples and/or best practices for multiconfig usage.  Below is
>> my question attempt at starting this.  Hopefully we can expand this to something
>> generally useful.  What follows is a bit rough, and will likely need editing...
>>
>>
>> A common use for multiconfig is to use the default configuration as the regular
>> Linux build, while one or more multiconfigs can be used to build special
>> components (often baremetal firmware.)  Enabling this workflow requires us to do
>> three primary actions:
>>
>>     1) Configure the multiconfig builds
>>     2) Use multiconfig dependencies to trigger builds of necessary components
>>     3) Pick up the output of the multiconfig build and bring it into a different
>> config
>>
>> In order to successfully do the above, the following could be considered to be
>> best practices.
>>
>> Configuration:
>>
>> All of the (user) configuration starts with the local.conf file.  A default
>> value of:
>>
>> TMPDIR ?= "${TOPDIR}/tmp"
>>
>> is used to control the location for temporary build items, where components are
>> stored and built components are deployed.  For the deployed items the settings are:
>>
>> DEPLOY_DIR ?= "${TMPDIR}/deploy"
>> DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
>>
>>
>> Each multiconfig requires a separate multiconfig configuration file.
>>
>> See:
>> https://docs.yoctoproject.org/dev-manual/building.html#building-images-for-multiple-targets-using-multiple-configurations
>>
>>
>> At a minimum a different TMPDIR is required for each multiconfig.  As a best
>> practice, instead of defining each TMPDIR separately, if they are defined as an
>> append (.= operation) with an expected format, later steps can use this
>> information to find the output of the build.  For example:
>>
>> TMPDIR .= "-${BB_CURRENT_MC}"
>>
>>
>> This also has the side effect that if the user changes the default TMPDIR
>> location in local.conf, all of the multiconfigs will follow with the same change
>> automatically.
>>
>>
>> For example:
>>
>> conf/multiconfig/baremetal-firmware.conf:
>>
>> TMPDIR .= "-${BB_CURRENT_MC}"
> 
> I assumed the `:append` override to be better practice in configuration files.
> 
>> TCLIBC = "newlib"
>>
>>
>> and a custom recipe called 'my-firmware.bb' that uses newlib to build baremetal
>> firmware for the device.  my-firmware.bb should define a do_deploy function that
>> deploys the baremetal firmware to ${DEPLOYDIR} with a specific name, such as
>> "my-firmware.elf".
>>
>>
>> Building:
>>
>> Using an 'mcdepend' a recipe in one multiconfig can trigger the build in another
>> multiconfig, such as:
>>
>>
>> my-special-firmware.bb:
>>
>> do_compile[mcdepends] = "mc::baremetal-firmware:my-firmware:do_deploy"
>>
>>
>> The above will ensure when do_compile is triggered, it further triggers the
>> multiconfig build which will deploy the built firmware.
> 
> Yes and actually this is lacking in the current documentation: this is the
> way to add a dependency on a multiconfig from the default ("" empty string)
> config, which is a common use-case of multiconfigs I believe.
> 
>>
>>
>>
>> Using the output of the build:
>>
>> However, just because we've built the item using mcdepends, we need to use the
>> output in some way.   We can make a series of assumptions, based on the default
>> Yocto Project variables in order to get the binary for packaging.
>>
>> Adding a do_install task to the example above:
>>
>> my-special-firmware.bb:
>>
>> do_install() {
>>      install -Dm 0644 ${TMPDIR}-baremetal-firmware/deploy/my-firmware.elf
>> ${D}/lib/firmware/my-firmware.elf
>> }
> 
> In my-firmware.bb, is deploying to DEPLOYDIR (defined as "${WORKDIR}/deploy-my-firmware"
> for the recipe) enough for my-special-firmware to pick up the firmware in
> baremetal-firmware's DEPLOY_DIR ("${TMPDIR}-baremetal-firmware/deploy") here?
> Shouldn't it pick it up in baremetal-firmware's DEPLOY_DIR_IMAGE instead?
> 

I believe the hardcoded path is missing the intermediate 
images/<machine>/ directories as the deploy.bbclass installs in 
DEPLOY_DIR_IMAGE, which is where the deploy bbclass stores the sstate 
output of the deploy task. This is the default according to bitbake.conf.

>>
>>
>> Doing the above will allow the firmware binary to be transfered and packaged
>> into the Linux context and rootfs.  However, this only works if we are careful
>> to not affect TMPDIR outside of specific places, and we use the default
>> DEPLOY_DIR (or other) deployment variables.
>>
>>
>> Suggested best practices:
>>
>> TMPDIR (other then the default set in bitbake.conf) is only set in local.conf by
>> the user.  This means that we should NOT manipulate TMPDIR in any way within the
>> machine or distro .conf files.
>>
>> A multiconfig must specify a TMPDIR, and should specify it by appending the
>> multiconfig name via "-${BB_CURRENT_MC}".
>>
>> All recipes should following the best practices for do_install and do_deploy.
>>
>> Recipes that are used to transfer the output from a multiconfig target should
>> use task[mcdepends] to trigger the build of the component, and then transfer the
>> item to the current configuration in do_install or do_deploy, assuming the value
>> of the deployed item based on the TMPDIR.
>>
>> Suggested that the dependency and path are specific in a variable to make it
>> easier to adjust as assumptions change, or the user has specific environment needs.
> 
> Not sure I got this sentence, could you explain what you meant here?
> 
>>
>> (we should have some proper examples for this.... i.e.)
>>
>> conf/multiconfig/baremetal-firmware.conf:
>>
>> TMPDIR .= "-${BB_CURRENT_MC}"
>> TCLIBC = "newlib"
>>
>> recipes-firmware/firmware/my-firmware.bb:
>>
>> do_compile() {
>>      echo "testing" > ${B}/my-firmware.bin
>>
>> do_install() {
>>      install -mD 0644 ${B}/my-firmware.bin ${D}/lib/firmware/my-firmware.bin
>> }
>>
>> do_deploy() {
>>      install -mD 0644 ${B}/my-firmware.bin ${DEPLOYDIR}/my-firmware.bin
>> }
>>
>> recipes-firmware/firmware/my-special-firmware.bb:
>>
>> INHIBIT_DEFAULT_DEPS = "1"
>>
>> FIRMWARE_DEPENDS   ??= ""

Considering it's empty and the example does nothing in compile task, I 
suggest to remove it to not confuse people on whether this is necessary. 
Or provide an actual valid example that requires the recipe using the 
built firmware to do something with it in compile task.

>> FIRMWARE_MCDEPENDS ??= "mc::baremetal-firmware:my-firmware:do_deploy"
>> FIRMWARE_FILE      ??= "${TMPDIR}-baremetal-firmware/deploy/my-firmware.elf"
>> FIRMWARE_FILE[vardepsexclude] += "TMPDIR"
>>

This vardepsexclude varflags would need to be explained.

I would suggest (if we haven't already done it) to have a minimal 
multiconfig example in poky that we build regularly and whose content 
could be duplicated (explicitly) in the docs like we have for baremetal 
hello, kernel modules, etc... so we avoid having the docs have outdated 
examples in the future.

Otherwise sounds like a good plan!

Cheers,
Quentin

