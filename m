Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601D6D5CCA5
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:55:04 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18736.1765878902960604227
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 01:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=B8XkNBCD;
 spf=pass (domain: cherry.de, ip: 52.101.83.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOPoGdJDzqX56s5dERi8Nkr+DgqlHXm4Rd9XnUrJ1chcEpb8yqPZyt/KjTggCs2MLiAdG14fFaevEXkLs9shxNbntzfAXAd5Qx32Xz9ko4uynyCwTTMCM056s8FsiwOOBGZgxsEV2Yb+UBmu52arusVmh/neh5Axl2eNuxQpTQABZ7RbB2Px/laCQL8qtGqguTy1mjJudUrQdMXHDU/SJUDxJpStshyyarOZd7RuVQlanM6Vl4J6dsP5pjtoerveyihXQBKYKukC+j5cdub2E8w/tNP4X/J7lb96eDj0fo9eLVWlLYrAzgXsScPmLVLBHCud++KhTuKlIdwySuDAAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2TlEnTWeOEw/vyrqZrruJJ84Rwy7X6BQHz8tMP8y5E=;
 b=L+Kzoff9D4MpEjtFgXSKIb+9Fta8dW4jLOeV4cbSYzwtLpXlPmKKQr2/KlpUz73LXJmy9APbJ3eW9f4ZB/OGPPyh/2eG7kc7GcHAG7knvaZmCSGH+0XfGoxPwjiB43NgGnN2t/rTDKnpr+8GjExm6rJlW5wUolk8jxaHzGO0bAxYYWCbua2yMGPgtaqFGOgVItOjjxHhDORXOjcnPs3a+MtAuuILLOm1KpvaLHF6EjatB4jbNF1I9V38QUfRAnB+fJmUevyKeDxquk9KtySgScTfo5ZH0BqWccMJmqi/QPXAmNVytOxWe3TmUp31dop54fTHQBTzhDZw1vBv3Hql2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2TlEnTWeOEw/vyrqZrruJJ84Rwy7X6BQHz8tMP8y5E=;
 b=B8XkNBCDTIUedD7yVVdpgMlBCJSFWrmDAi+c/9q5FseYzLNDpq/hh2+NiDsbYZHxPpCPR57ka/qipEonj5l83IXW8KWqzIyFq829Xs0AabRhkzJ24i93cwEq3uSlYvB+unJk2JmBMqaM1DHY+Kgn8yL1BrDpXA5mPa24gq8QwAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10763.eurprd04.prod.outlook.com (2603:10a6:800:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:54:56 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:54:56 +0000
Message-ID: <ce268dbc-882e-4079-ad92-3a601baead4f@cherry.de>
Date: Tue, 16 Dec 2025 10:54:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] convert SVGs to PDF and PNG using
 sphinxcontrib.rsvgconverter plugin
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
References: <20251202-fix-make-multi-target-v2-1-7eea1d64cf6b@cherry.de>
 <b3fedc48-fb69-451d-ab52-f170be87d013@cherry.de>
 <DEZIV7OT5YSJ.2GQ6UQM0O1Y4O@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DEZIV7OT5YSJ.2GQ6UQM0O1Y4O@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10763:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c774b43-dc42-4af9-dbae-08de3c892af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V280NHdqSDNGeW1xblU2QXlCY01tYlpmUXlFY1YzU1Vaem9rSzdKK3NTM3dh?=
 =?utf-8?B?bE9NcXZrQ1FXNXg4eXgyRDlrdFRnMWdVUFY4anNsQ2p3aXRxb2xVMkxXRDY0?=
 =?utf-8?B?M1o1UGlGQkUvc2ZmZU9FdUY0a1ZrbEVrMGFYSDBHUWNWY2tmUHdoa2ErdUxJ?=
 =?utf-8?B?WVU3dy9ONkJuNHF3K0ZiV0paNDZJZjN4NWJvSjNkZGlSNHpuVTlJdElNV0tJ?=
 =?utf-8?B?ckFKakVWbEJXT0xtb2JpR0QyUml5ZnJ2NkxLOXJ3YnEzNFVBbUR4VXNWNVlF?=
 =?utf-8?B?UE1FMCs1L3hpYTNmVldFTmgzRmFvR0RlRWZKd0VNZ1RjQWI0N2lNVXFTRWZ0?=
 =?utf-8?B?YVVBd1o0dDZSMzdzU1p1Z0loOGg3MXNWdGt4Wm1Fbkx5ZktPaXZvaGpKSG9s?=
 =?utf-8?B?L09qQXVhRllCZU1SR2VudXlEYWVFb0VkbXNXMStRa3RsYXNqclJlak1qTTFL?=
 =?utf-8?B?S2dhaWdpYmN1d0dVb2RYajdSTTd3QnpDUEdHVVV6V2xtQzg2N2grMmJGa3RR?=
 =?utf-8?B?SWdMUnMvOVRPNitxSks0RUl0TzhMdEk3WmR3UUl3WVY1aW5scjN2dG9DM3Yv?=
 =?utf-8?B?MDB0bStOTmxJSGNvTFp0VmlDWUNza25ZRTI4RUd5NEF2NzRBUmdCeTM2bVVW?=
 =?utf-8?B?dXYwYUFVT1FZYUNWVnU1S0lqanRmVDRyK3BaS3oweUVqYTc4MUlLbXNOVExQ?=
 =?utf-8?B?S0dyY1BmN3ZEbS9rNlBQbUtpNHdVeDE5bzFWRVhEZ2doTnU2dEVUalBjL0pP?=
 =?utf-8?B?bjNmVlE5eGhQeGxLOEJKVDJMcWU1ckRISi9ncWR2S29INUorMDBodlVJd2dC?=
 =?utf-8?B?bzIvREpMOHFTcHVqL1JHMzRCNTAwaW4vbVhWNmVSaS9QSTFkK0tiUURML3pM?=
 =?utf-8?B?MWMrY093b2VMNlZmNi8xVklZYnFBNUFPb3EraXRvWmxlRkVxeEdJNERLQVRP?=
 =?utf-8?B?cVkvWm9BWVoyanJveDZTcXpRYVpJOXZNT1JwR25tV293bVYzaGRiOTRvV25Q?=
 =?utf-8?B?WGQxc1FMUCsvVGlxLzBBSzdhNWZsd21LRHhWa2pBTHNJcmtBa2NlWFluVFhC?=
 =?utf-8?B?N3gwNk55Q1dzUDZGbk5MeEs5ZTZkYTRVTEgrejl6eDM5Y0dyMGZGVzFZSUd6?=
 =?utf-8?B?aVRjb3ZBVVc3bm9HbVp2YXVBbFloaERhRTF2K2VONFRHRisxUW9MNHEvS3da?=
 =?utf-8?B?TlJja0w1WE9XZ1Vock9mU2dPV2lzQWdBU1hMaXZtY1llTlhFSDBJQWtXcnVl?=
 =?utf-8?B?ZlF2a2lMUHVSWTFqYWVFQVo0djhoWklLSitla2hVSkY4QS9lRFV0aVdGcXY2?=
 =?utf-8?B?eFgyMlNoanUxR1ZUM2pPR01KbVp2S3l1Tk5yTkxZcG40UnVhd1JhZTBQWENI?=
 =?utf-8?B?WE9QYXp3b1Qwd0QwTW5JbXNDdUIwUWxsODYzVm04YmJWTmZmejVwMmY2UGJE?=
 =?utf-8?B?TXUyUkFTZDNsdmgwZHR5eGdnSFFWM242TlZUWGFHNk52NkNzTVBad2xxMzUz?=
 =?utf-8?B?VThqUTRZWWNzVnlDNFZ1N3FYOTZuWUFjSnR2OEMrTWxydHFkcXFGUGRKdUtO?=
 =?utf-8?B?aCtLNCs1TlpCQ3hmTGVURnk0clM1bWwzQVVEcDdzRDlCT1VydUFTVmprWkdB?=
 =?utf-8?B?bVhwYXlmMlhPZHlKckU4bFZxVEJuMmtZR1prYWdBUm5nenBDQ1NzdytEWFlR?=
 =?utf-8?B?RXFOT0N0aEF5UjMxL3RxMWRRdzNZRDlLM0JwbzVRaU5aSEQ2dkw2NmplaDhG?=
 =?utf-8?B?YWpaRWozb2lMY2xoTUw2RjhRcDljTnZSK3NjYVRFKzBrbGhJc29UNGpNMzF1?=
 =?utf-8?B?NFc2bExZcURLVWVnZGI1WGJnMkRLbDRlM05DZ2VEUkw0V0lMZlNyYUJqbDZ2?=
 =?utf-8?B?cmtWTi9xaWVxVmc5cVVXYmpzYTlNRWt5WC9qVGorOEh3MHc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZEs1eEE5ZGtzdmh3UGhKV2plYmFieXRNQTVIL21tYkF4aXoyZ1M0QncwQVE0?=
 =?utf-8?B?QUV1azNneWZqYTFQSjNCd2RqWHFwTldpc2xsK2ZYZW92cE9TMzY5Mll4bHVV?=
 =?utf-8?B?Z1p0RjlwakNGWjExeFFiNnlNNldiakN5SlhwdnVyQVkzU05wektzTG9rMm02?=
 =?utf-8?B?cmxvUFZoSSthV0pRcmFxLzVuVlFIdFVBc3RBODRtRnByeUJnZHhVUG02NnJw?=
 =?utf-8?B?RFhRUjlXM0FRbGVkOUVkUkp1d2FBeForK1NqZnIyMUdzeEc5Ymw0dm1WcFJZ?=
 =?utf-8?B?SGJjbzBKandYbkd3d1RtU0lsSWFtYWc3OE9NMnl0dFRuaVluZ3d6N09DdDlt?=
 =?utf-8?B?cDk2a2tkaGJiaE5ETVp5blhtQks0Y3c3aG4yUWZjWmFvcnFsa2hTNnN4a1Vw?=
 =?utf-8?B?My9LRmtJdzVpZmQxME1NQ3k1djB0dVFCQXBPaVVXaUVybEdmVUx2ZjAvTWJi?=
 =?utf-8?B?aDltenUzRW1QRFN1Z2R0UC9mY0RYUVVlU3ZhQkI4eHMrZklhOEpyZUhXbGNj?=
 =?utf-8?B?dFY5Tm11OXQ3ZEcrMmZzRDVoQnFKMDJvdDBsdk16WmVFVjBMdFJ0dnBPQjBY?=
 =?utf-8?B?VkFYZ3AzUFVPeStUcHE0blJFeHRhWWlDaWZOcFJQa1BTNndKTHpPWitiS0Vl?=
 =?utf-8?B?cktwS3REWlJ6QmorbktnOU5PbE9lMERwbW5JN2dmb2Y5ZzZ4dUE3aDJSZjMw?=
 =?utf-8?B?MERianlkTmFoODJBQmhZNXg1L0xxWEpXUml6OGVlVmlEUlhGWnRiZ055Unpp?=
 =?utf-8?B?b2ppOHgxQWxVc3JhZ2F2MGtsL04rZ2pqRXVpaE42ekllSkpUMHQyN1lmQ3Ir?=
 =?utf-8?B?OThlMk5jQlJvK1NNTU80M2JlKy9uOEY5Y1pBczZSTkQvU3ZCK3dlN1hZdTdE?=
 =?utf-8?B?V2g4V1l5UUJEcVc2SlZTOCtDeXNGYkJnNjVIM3VKeFkwRUw5c2JiRTB4ZXF5?=
 =?utf-8?B?TFRUaEdDQ3ZPbnI3cjBabHBFRkVqWjJBRjBzazNNQ2tuUHA1YjZUU245OVp4?=
 =?utf-8?B?UkVqWGN5OUdEYThjMTJWY3hCazhQeDhHSEZPZkNSdzR6eEs5OGJxZGd0MjZq?=
 =?utf-8?B?dFNRaWFYaWVuWG40NWY2WnAzUEY5UldNTFRQTmpHa3lIbEZJUHc0cEg1NU4y?=
 =?utf-8?B?U3FUQnRBVjQwdWFSVjUyMDFBemtWbm9sRUg5eVhOckhnRnVoSHVyK0hRK1Iz?=
 =?utf-8?B?em1LVHA5R0dzSmZOY2pIR3lvMStEV2llSkVYNE9MUDd6Qk1lN3piK0x4TTdj?=
 =?utf-8?B?R0IwZk8vVWt2UUowMEN0SmJZVEVsNk1ZeEZRT0szNGNqL0QveXRTZnMvQlcy?=
 =?utf-8?B?Z3VqR2FkakpLRnhUUytxQ1ZyL3ZYcU5zTmZqUStINWlDaTNtU1NtL2s0cWt2?=
 =?utf-8?B?dzk4M1lFSHhKZGVFRjRjN08vR21iTHQ2UUVJSGFLR3V0cGtJQjY3b0g0cHNp?=
 =?utf-8?B?c2kvV0NXc01GQ3Fjc3pJYjlxaFU1K1h1cHZ2K2FVK1FPKzFKaW54bytpVFhJ?=
 =?utf-8?B?NWpYWVBnSkhmbkFTZEsvREFkSlN5UllKMGRvWE5GKzRiUEcxdjhodWFRcmU5?=
 =?utf-8?B?aFhhQkk1cUVpY0kzWnk5d3BRRGtSaGNxSnFZZ0JzTk1Hclh5dnQ1RVIvdkJB?=
 =?utf-8?B?RDVwWXA1UHNQaVJ6WUM2ZmQzcFZKOGVubWVobWNST2tpNG92UXBMS3hhbUNU?=
 =?utf-8?B?bHZBbkhYNUJOSmJ4WXkzbnF2UHRaMmk2dk1ndGhFZ2dCZlBSZ1lFREFBcEVz?=
 =?utf-8?B?MDlLenN3VDZmV2NSYnd1WlFYSFIvQWNzdmptcTYrSWlNQncvV0NoZ1oxM05Q?=
 =?utf-8?B?R0pXN3ZFMkdZYmVsTVdxQm5GcitMdGRNVEhXZzhIYWExQWw0MHpKak5LRXNN?=
 =?utf-8?B?NWxDOTVmTGRUclBqckFmcXJkK3RnVDdGekZqRkJ4emJZaHJGYjRsZHNMSVAw?=
 =?utf-8?B?UW5ZK0NYcHBTb2FZM3BqaWZVRkNSZHY0UzFMWmM0WUQzdmJpYUtyZ2xWVXdO?=
 =?utf-8?B?R0trdDhnT0Q0MDBPSUovSWpkRTRQSFp6M2ovS2RQcjkxVUxRRUhscnE4cENR?=
 =?utf-8?B?VG15SlVzOStNTlhsUWk0S2xQNFg5a1pCZUxxa25yMUNNbTBtU1ZDUW55ZkU3?=
 =?utf-8?B?V3drejhLYmpXdWE1bEJoMHpCN1c3bGpNczVaREVOZUhGd2NtM04rZlNydTJh?=
 =?utf-8?Q?5MvLP3J45cpYSf7xEeRK/Lk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c774b43-dc42-4af9-dbae-08de3c892af5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:54:56.3033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rZSpzDtnw3ci22+nJQxPfx/usktIRQ4uxdnrPMacadAV6F2PH54zVzrr1CYCZbkHqmqisQJTgx1AULi+ZZpwN2np7tRhnuU0FTdNdv3S98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10763
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 09:55:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8281

Hi Antonin,

On 12/16/25 10:09 AM, Antonin Godard wrote:
> Hi,
> 
> On Mon Dec 15, 2025 at 11:58 AM CET, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 12/2/25 6:06 PM, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> The sphinxcontrib.rsvgconverter plugin allows to generate a PDF or PNG
>>> from an SVG.
>>> This is what we already do manually via Make targets but it isn't good
>>> enough.
>>>
>>> Sphinx generates a cache upon first parsing and stores it in a doctrees
>>> directory. Sphinx claims that it can be shared between all builders[1].
>>> For glob patterns in image or figure directives, Sphinx will look for
>>> all possible matches in the source tree and store those in a
>>> "candidates" map for each file, along with the associated mimetype. When
>>> building, Sphinx will then look in this map to try to find a match in
>>> the current builder's supported_image_types. If none is found, the build
>>> will fail.
>>>
>>> The latexpdf (using the LaTeXBuilder) target does not support SVGs by
>>> default[2]. We used Make to generate PDFs from them before generating
>>> the doc PDF though (see PDFs variable and %.pdf in Makefile) and that
>>> type is supported by default[2].
>>>
>>> The epub (via the Epub3Builder) target does support SVGs by default[3]
>>> but we disabled their support in commit ff3876ca4910 ("conf.py: use PNG
>>> first in EPUB output"). We used Make to generate PNGs from them before
>>> generating the doc epub though (see PNGs variable and %.png in Makefile)
>>> and that type is supported (c.f. Epub3Builder.supported_image_types in
>>> our conf.py).
>>>
>>> The issue is that this is done transparently from Sphinx. When we
>>> generate the PDFs or PNGs variants of the SVGs, we put them in-tree
>>> directly along their source file. Then, when caching, Sphinx will find
>>> both the source file and the appropriate variant. However, the cache
>>> isn't updated if there are new files in the tree and the source rST
>>> files aren't modified. So, the cache will not have its map updated and
>>> we won't be able to find the new variant when building for a
>>> non-SVG-compatible builder. Take the following scenario:
>>>
>>> - start from a clean source file (fresh clone or git clean -ffdx)
>>> - build the html target (which supports SVGs by default[4])
>>> - sphinx will find all the files in the source tree matching the glob
>>>     pattern in ".. image:: test.*", in our case only an SVG since the PDFs
>>>     and PNGs are only generated for the latexpdf and epub targets
>>>     respectively. The cache will only store the path to the SVG file
>>>     because it is the only source file that matches the glob,
>>> - attempt to build the epub target (which doesn't support SVGs, only
>>>     PNGs)
>>> - Sphinx checks for the file to include for '.. image:: test.*' and
>>>     finds an SVG in the cache map and then check the list of supported
>>>     image types for the Epub3Builder and find that it doesn't support
>>>     that. It cannot find anything satisfying the dependency and thus fails
>>>     to build.
>>>
>>> This scenario can easily be reproduced by running the `make all` command
>>> since the html builder will be used first, then epub and finally
>>> latexpdf.
>>>
>>> The `make publish` target works by chance, because the epub builder is
>>> built first and will cache SVG + PNG for each glob, then the latexpdf
>>> builder is built and supports PNGs so that's fine and then html, which
>>> supports SVG as well.
>>>
>>> To fix this issue, we could simply always generate PDFs and PNGs of all
>>> SVGs in the source tree, but this isn't ideal.
>>>
>>> Instead, let's use an ImageConverter from a Sphinx plugin. This allows
>>> to map a plugin as being able to generate a file of type Y from a file
>>> of type X. When Sphinx wants to build an image, it'll try to find the
>>> image with the type the current builder supports in the cache. If it
>>> cannot, it's going to try to find an ImageConverter plugin that is able
>>> to convert one of the image types in cache with one of the image types
>>> the current builder supports. Then Sphinx will call this plugin to
>>> generate the file and put it into the build directory (not in the
>>> source!).
>>>
>>> This allows to simplify the Makefile as well and is a much cleaner
>>> approach.
>>>
>>> The epub target is removed as the catch-all target contains the same
>>> instructions as the epub target we remove in this commit.
>>>
>>> sphinxcontrib.rsvgconverter is a plugin from
>>> sphinxcontrib-svg2pdfconverter python module. SVGs to PNGs is only
>>> supported since 2.0.0.
>>>
>>> [1] https://www.sphinx-doc.org/en/master/man/sphinx-build.html#cmdoption-sphinx-build-d
>>> [2] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.latex.LaTeXBuilder.supported_image_types
>>> [3] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.epub3.Epub3Builder.supported_image_types
>>> [4] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.html.StandaloneHTMLBuilder
>>>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> ---
>>> This depends on
>>> https://lore.kernel.org/openembedded-core/20251202-svg2pdf-v1-0-bf4bd322e528@cherry.de/
>>> in OE-Core for still being able to build the docs with the
>>> buildtools-docs-tarball SDK.
>>
>> This has merged as far as I could tell, c.f.
>> https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/meta/buildtools-docs-tarball.bb?id=056686eaf1a3a27f5e83537e5a1b7c837bc16fb9
>> so this can now be freely reviewed and/or merged, thanks!
> 
> Sadly, I can't merge this until [1] is updated. I was waiting for 5.3 to release
> to update this URL. The closest milestone that will include your new recipe is
> 6.0M1. This will be available in https://downloads.yoctoproject.org/releases/yocto/milestones/.
> 

Ah shoot, I had completely forgotten about the autobuilder. Sorry for 
the ping!

> So we'll have to delay this until this milestone, unless we manually hijack a
> custom built tarball before.
> 

It's been broken for a few releases, one more isn't going to hurt anyone :)

Cheers,
Quentin

