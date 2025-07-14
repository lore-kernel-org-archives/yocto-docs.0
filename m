Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40B8C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:12 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.40])
 by mx.groups.io with SMTP id smtpd.web10.80454.1752505685337316425
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 08:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Jd9L0kD8;
 spf=pass (domain: cherry.de, ip: 52.101.84.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=le+wr0+8ODsBgXqWnTKuc3EJWZJUzQlAk9MeVHbU9ssHMGqs4CcYNClY65GbTjvkEyouPpojrZ3nGS53KiG+tT4H87Fp3LHK+b6u4j8NxRlXgbdoZ0FMWB+yerr6pkODQT6m7pwKOxDvAtze8GouFEcB+7lOavVU39rXruEocypw70GiqJhRlI0L9diU/H3RAXPFbQylFYcVulPDJdmTVEOJ/08nrQ+hOSGcTKducjOjCA7rJ47UOXFGJS7wf/QgAFTpmN9g4oxQsbQidaMbCqaJZImLuYmFpKBqS/nQ31vsZXBthWC8j5FZQXLngN8ZX/KY7y/zdVT75WjBcFEdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEyaW0+GofqgYz1USfdw2Rkby9a8T7u14emOC+PUyAE=;
 b=FINS3spr2FTdyWqlXMX6pgYLPjnayTjp+6FVPbBURzQr77Xd3ZxB+wQT6AL+hMZosbX9lNhG9ZDeG7aXGH5Ve+2p55S5g23w40Vayr0dDXQGRkkd+dTG2adlzxNjRPTaOX7PdDxMILllUv7Ln5LXfNgGa2u0CmAKrf/1bjkE2jZIAyKeutzv370FFSRqhq6nxN6C2epOkhDrI/pgHP+hz2c6bVtHuimLIXOSyqnIfnVIlEn5mEQuV2HpVFgipUcALcJdxQYayg89Yp/8cuBjo1sMe+yBqZUKPaoNRgJua4VnHycdPxjPEO3iSb2CkixlP4/QKaBuoBbDV5wIwNOQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEyaW0+GofqgYz1USfdw2Rkby9a8T7u14emOC+PUyAE=;
 b=Jd9L0kD8cE61DesbmUS5TbD/70xfUU/jNJdI9GMVIDOomK3Xm5VXW/RUwVy4G3k2U6ntQXxWcVTZV7a4t6MI7AnuUj4g9axDM18Hnas7yIv8SaehBlf0niz8aM9aISiHr6cqjXbyMvQo2wryUsHbCzPyKc2xxRr8w2+zh5iuWyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB7649.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:08:01 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 15:08:01 +0000
Message-ID: <b29f83b8-593c-4ca0-82d6-44a95263450d@cherry.de>
Date: Mon, 14 Jul 2025 17:08:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] now i'm confused about OVERRIDES
To: rpjday@crashcourse.ca, Khem Raj <raj.khem@gmail.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <164f071c-7019-7d77-c49a-f0ba3e87c502@crashcourse.ca>
 <85161775-f95d-4de8-8241-414c4281e48f@gmail.com>
 <f73a4832-674e-5f16-1c8d-f86102bcde55@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f73a4832-674e-5f16-1c8d-f86102bcde55@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR10CA0089.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a8af9e-7769-41b2-d691-08ddc2e839df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SkFQN0dlclhzWlA0RzFLRzVZaTlueXQ2WjhEME1ndWlXcWJCOWhFdmVRNkJ1?=
 =?utf-8?B?b2Y4SWNodXRUUzFCY0QvcjZwQjd3VmZJTXRGQms0K29tU0xnNlNSWTU4UGo1?=
 =?utf-8?B?dEpGWmRrQ2E1NFhkNk9yVkN6NXl4b3BJZ2d5cVNKbjdSNmg0Z09xS01DWHN5?=
 =?utf-8?B?dk5EWENpMENwTE81OTFGRDNUZmpRVDQyMUljdXUrZ2hFVXdFZzJnMWVDd0Rj?=
 =?utf-8?B?RzJSb05OR2ZmNHdtOExTdHBxaDdnc0ZPbldoTG5Nbnd1c2ZlY1VFZHAyL0Jt?=
 =?utf-8?B?a0szeDZGMUtJNlpFdVVuVGFJY2FmTUtxenA4cm13dUNCSVNRa2NNTUZlNzdp?=
 =?utf-8?B?VDNWUjRrMm54Um94NzVoYW0xQlVXTTgvdVZxVGoxcDZERDBBbURQdnBVMWdj?=
 =?utf-8?B?dmxTT3drMm9NZ2JPNDUyWWlHZjVnZmdmRjBUdzYrUk5NaEd0eG1pMkY4ckxS?=
 =?utf-8?B?RjFSMU9jZjRjWTVPY3FYK2xEbXBDYzVKM09kM0ZLUHRFQWprZDdaYVZCSEhX?=
 =?utf-8?B?TDliZ1VObndDTFpNU2R1ZE9rdlFUem9uaXVzUHRoMGhZdUQzSlVqY0w0NmZC?=
 =?utf-8?B?eUJOZmk3Tk8zOUUxRVZqRjdCTXcxTnRQZ05tbjUwMUZHZHJsM2o3SlArMXpv?=
 =?utf-8?B?L3orRTFuOEZhTkJBZ3dFcUprNkpwZmlUSDU2TlBYWEFqNHgrejUzd1RlVUF1?=
 =?utf-8?B?RTNFTHd2NjRVRmVENEV0Q29FREtHM0EwcytwN2dNck9qRnl5cU9hekgyNWx5?=
 =?utf-8?B?bVJEYVJocnhIaHdFKzlEWkpVbmlPU2VCYnArMHd6Q0l3bEg2TGFaTis0Tk5R?=
 =?utf-8?B?WnlVdUxacFRtUFo4QzFkU25lcG1yTVp5Y1MyRmdQcEorWFNPZ0cybTdPYkpX?=
 =?utf-8?B?bSs3ZWp2ZlJBUG94OVhFcnNTSFc5eUVZSTR3VTZmYmtRa1h3R3hSd2lGUWpH?=
 =?utf-8?B?MENEclNlOTg1SWs0WWlQd0dPc2JtYnltL01KSzRLaGE5RG1XUnkrU2RpZ3lx?=
 =?utf-8?B?T3FjU1pKc2ZwL0YxZmdWeFZ5NXdvUTNkUTZxY2RReU9uVG9SUEsxOEh6WXpa?=
 =?utf-8?B?Q2lCZTZadHIwbmVLZzBQaHhMZVE1NlZQYXlRaksvRjJxa0JuVUxtM2VZVVIx?=
 =?utf-8?B?UFJCdXFjUWdaV0hhbEdnY3ErOVJsTmZhWGw0bUJjT3B1WG5vQ0JqVTBaM3hE?=
 =?utf-8?B?RnhBOGd2UEhSYlROdW5vdEp3d3NsY2tEVHhpL243c2VodWJ5dWxJM1pDL1V3?=
 =?utf-8?B?Q3B3c1dGZGE2dnVBckZQY3ZMQXI2ZDI0VGRqWU1nenljOVI3UG1BL0VoYUNT?=
 =?utf-8?B?SHNQNk1ERjA5T01ld0x0andsZUpOejlmTDl2ajYvKytueVE0YWovb2N4aEg2?=
 =?utf-8?B?QVRPSDhJZFlyWjVqZmZvb2MzNm9MZkNlSXI0M1JhUktEVHRlTGVlSVpnL0xJ?=
 =?utf-8?B?UEVuOXB6VmVHOFcwR3NaV1JueEw4ZEp3U2dkWlRMblV1WGQxOEFtTWduck1S?=
 =?utf-8?B?MTVyQ1BzbEhESFlLRWhVUmlzVFJ5QnZtSGExNUc1dE0zSWRiODkxU2RTN1Vn?=
 =?utf-8?B?dFJ0S0pFektnUzE3VU90U3gvVkZrc0hjMVh3d09QQ0lNUFYwdnRhZVllb0w4?=
 =?utf-8?B?djBBbi9rUVZKbE5mdGsyQjBIWWU0UUp4cVk0L04xOGYyVjNyRUdab0k1NFRk?=
 =?utf-8?B?dkU2Z1FiS09oWE0vL3FYSXFlL3Z6ZkFYdkVXR016VGpHSW1mVHhzdjVwSW5l?=
 =?utf-8?B?dXRodHE1RzBHRSs2S2xDUTYyNDdMT0sycDdUVjkrSjc4YzkwaEZWQkJEUDhH?=
 =?utf-8?Q?3inaM+L3+kIAAVYMY2zMDJO8KIP4aBBkrqgos=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?empwUDJuU0VrM0dpTW5NcHFmZkRaa09JeWNpVUtEMnh0eG4rTmZtb2xXRy91?=
 =?utf-8?B?VTRTL3FRQTl1RGgyekRJQmF0UXF3OUs1V0hEaTBjMWtETEdKK1daelN6dGlJ?=
 =?utf-8?B?UEJXZlRVUEM5Qm85SXBrRDZxaDRURjZFR0tiWlVLVHc3ZDU2T1V4NXYxNytm?=
 =?utf-8?B?OHhYcTdvRmVlSVowSnlMUENVREt1djZXdGQwSGp0YSttTFBocXpLMkk0VjhO?=
 =?utf-8?B?bkxEWWZ4QXpsQTU1bEhpU3QxUjA3M3FnWXpiSXRIdGRXckJhMkpMWW9IdERT?=
 =?utf-8?B?RFJSUlAyTEtwTkQ2cXQxQnFESGprc1lNY3VQVVBGNHN0S1BERXZLVkU2MGRr?=
 =?utf-8?B?YU5QS2xRZ2xVZGhNdEs1ZzNHMUVsUzJJQ1lFM3FNQXpLTWpRRVc2UlZzR09l?=
 =?utf-8?B?ZnE1K255cC9Lck5RMXlZSDMxNjdHenVJSVdLM2xyVmlDTEpyeTIreFg1emRt?=
 =?utf-8?B?TVRTRitocnp3NUwveVVWN0ptaTEwMkFHeVBvTFBEbGFoWHV2dGc1VHZLU1p0?=
 =?utf-8?B?c3JMVSt2NFNnYjZnay9PRjRIUjZ0aU80UURsZ2p5bW1oRUxtRklRUC9FN2Q4?=
 =?utf-8?B?SHgyKzluc1V3YitOMlU4L3pXa0xkYjFIdEErTlBWeFl0Y0xvSjBqR0ZpdGx5?=
 =?utf-8?B?SFMvOWs2Y1cwOVBheXZYWkZnQXYyWTZXZ1FLM3F4NTVYYWlmTVd5YytLelE3?=
 =?utf-8?B?aXU4elVrUy8yK2htc1dMcitrWElmY2NNVmhyR24yRGRYRVA3d3ZHaTA3MVhG?=
 =?utf-8?B?K0Z5ZlIwaC9hY0RsR2EzcGpKdWtsWWxHNlhZZDRHL2hKYy9nMU1FSTlnSllG?=
 =?utf-8?B?YUlIN1NJalM4SUJ5czdHb1NTNlNXd2Q5cWlUWmdnUE5ub2JhbWc3b2xSajQr?=
 =?utf-8?B?UENyK2xod1N5bGJEekF1c0w4NzBFdW42NzNibVRvcExaOHhIUkhUTldZYXNF?=
 =?utf-8?B?b1ZLcWJjWDUzSDlVR09MRGJIclR3V2VROVNvaUtLbjVxU2piZFJZS1BVKzc3?=
 =?utf-8?B?R3NsSzh6ZFhTM3RQNUpuRXJyajN5aVNjcHI1aVdEVDkxWmU4ZS9qWE1pWkNU?=
 =?utf-8?B?bEdWZUF3MGEzUXRWcXJWbWlYN05OT3hvVE1zM3lhckIyNHFFNFNtZGhnUXZK?=
 =?utf-8?B?WFFQZ0ZYYm1GTHQ4V3BqVUJJYkc3YkRDaWsrOXFTeWJIZFhnUVNrUGMydGsr?=
 =?utf-8?B?angzK0pNSDQyb3lEa0VvMHNwakJDaXlrUWdRM2lQVk9USlN0R1VCTUpMeURU?=
 =?utf-8?B?Vi9UWG4wdy9VNmFRNytkb0dYd1Zvamk3cjhWLzZNOUQ1aldwTkRTQ0owcU9r?=
 =?utf-8?B?cUl3SEdRK0s5MWxydThwVGx4cGtxNVh0T0lRc1VSd0NneTZjTmhMZlo1YmRB?=
 =?utf-8?B?cDArZTBzTTlYNTdQU3BCbkkrODNqWURmZDlKVWxNY05CeTRNa0MyL0JYTUlr?=
 =?utf-8?B?dldKQUNVeXErQUZvRkVGb0g1NlE1Z3VkVUY2NUs4ZCsxOUlMcm13U2IyWkhS?=
 =?utf-8?B?YWtlV244Ly9vdjlBMHJKK3NSQmZIR1dkZVFpZlduOVFBcU5SUTFyNVR6dEdw?=
 =?utf-8?B?bXQybWhWbndDcE9BazlCclBadng0QjUzbzRiNlk1cTdpYStxZGhrZUpXSW9T?=
 =?utf-8?B?bVFoUit6VmxQQ0JrRlVHUExrMzA3WXhpYjVtd3ZmVTVSelo2SE03QUNXSUxt?=
 =?utf-8?B?RHNMbjhUaWZudGI5U2FiRWhZSUpPcG5uQlc2TGZGdWJFdy9LQXNRaVpsRmhG?=
 =?utf-8?B?dVZnRG1lK3RoSmNnYmVSVkdnTXUrbXVkQzE5amdEUWhBRlZIbERYSTZaa0R0?=
 =?utf-8?B?VU1jZ0ZxSzZDdXc1MlBkN2JSNzdoOWhncXpMRGpyeEJBU3JEUVFsTEVQNXFH?=
 =?utf-8?B?RkQ4azJrREJRNXJCUTl0d2hsN0dobDBmMEVCSHQ5Wm5BZ0Fza3RKT0NxdSs0?=
 =?utf-8?B?aXhOcWtJYWtUWDN5cndCeElhUGladjM0NFV0TzFvaEtmdkVDWjVPa1A4V2F1?=
 =?utf-8?B?SU4yeTVXTkYxVTV5aUN2Q3pOY0RHN0U3WmhLL0dobDNXVFlNMUlGa2FwUjZD?=
 =?utf-8?B?L2tIVDJ4TnROTjhqS0pFSFZEYzUzUWhmMEpjMkhtRnVvNDB6T3Vxbm1xem9Y?=
 =?utf-8?B?RDY4c2tBMHlSSlF1b1ZQSFFUSkwwWmljREdqRFJtaXh6bFQ0R0VJVEc5b1dn?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a8af9e-7769-41b2-d691-08ddc2e839df
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:08:01.6636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/4xdydE751AoRBn6rwD29ascmVSpCqmAdOQJChKUENTZGboO2Ttl6jZtU9153OwZMOEvkisaTYrcMM1SmTyJpcKuqcvQ3kaLmhvXOcPx/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7649
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Jul 2025 15:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7325

Hi Robert,

On 7/9/25 8:53 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Wed, 9 Jul 2025, Khem Raj wrote:
> 
>>
>>
>> On 7/9/25 5:42 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>>     i'm reading the BB manual here:
>>>
>>> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#examples
>>>
>>> and, first, i think OVERRIDES are complex enough to need an entire
>>> section all to themselves, to be explained in detail with actual
>>> examples ripped from the OE code base. but here's the confusion.
>>>
>>>     i distinctly recall a while back that i asked about the (possibly
>>> misleading) differences between these two statements:
>>>
>>>     A:foo:append
>>>     A:append:foo
>>>
>>> and i was sure that the consensus was that the "proper" syntax was:

There's no proper syntax, they have different use-cases that is all. The 
most common (by far) use case should be using :append:foo.

>>>
>>>     A:append:foo
>>>
>>> that is, it was extremely unlikely that the developer really meant to
>>> use:
>>>
>>>     A:foo:append
>>>
>>> even though, in most cases, those statements would have the same
>>> ultimate effect, they could potentially behave differently.

:foo:append is almost always wrong.

>>>
>>>     so the "proper" form seems to be the preferred form, except for this

Again, different use cases.

>>> pile of assignments to RDEPENDS in the meta-raspberrypi layer:
>>>
>>> https://git.yoctoproject.org/meta-raspberrypi/tree/recipes-kernel/linux/linux-raspberrypi_6.12.bb
>>>
>>> is that syntax deliberate in the sense that it *had* to be done that
>>> way?
>>
>> this is seemingly a bug there.
> 

Yes that very much looks like a bug and should be :append:<override> 
instead.

>    a bug in what way? syntactically, those lines seem to be valid, but
> my understanding is that you really need some sort of rationale to
> justify having written those lines that way, so differently from the
> normal way of writing them.
> 
>    can you elaborate?
> 

Read slides 62 to 76 from here 
https://pretalx.com/media/yocto-project-summit-2022-05/submissions/SCYYWD/resources/Demystifying_the_OVERRIDES_mec_2lZOP3n.pdf

I really should make that into a patch to the docs but I couldn't wrap 
my mind around how to write all of this down. Even orally this was all 
awkward and I'm not sure it was "easy" to follow what I was saying. 
(There's a 2021 version which precedes the : OVERRIDE syntax; both have 
a recording available on Youtube if you prefer to listen than read).

Note that I made a few mistakes in the 2022 version but I don't remember 
which ones (I believe in the first few slides it's missing/having 
spurious whitespaces in some places).

Cheers,
Quentin

