Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3752DCCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:25:32 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.43])
 by mx.groups.io with SMTP id smtpd.web10.4645.1760610329681272295
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=d3CSNZXR;
 spf=pass (domain: cherry.de, ip: 52.101.83.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OF3/1Mt/vk+xMdA1vHGjaQxgQPdyFPuFPY6nMqQE1U0Zwh4/ksLsJ8Mj6ek37xFiwcEFKK5nDxwvWJrGb8ErEYsnQbQUScRH6k4MK1QXwMiqpa7AHHXYfjhBOEj1iV6J1G3Z87CKKZYprmisq62hMtj46rIwO5/A17dsBIjsJhf0IRaDlRvewePHIn8Vo5TmRYX7S98RgBUypARtSs7w8aeZ8G6sEvXNahTNk9WQmRLjvl3wfKWYPZjnsVAfywiU0a9pkmxgjr9cWdA2ae6DR1/XrRCf3V7IxYT4aJddQ4+gcWyDP0cNPhrrl//SOvctv3Y+kjV3ZJL4GsHWp6dogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIpuMakPky/pJ1tV/vPCgVp3uuaN/VZfwPye8qPse9w=;
 b=M+iLkGMS3cxbgqUcyj8BW3M/+YFTXK+CvHCDaSFSM0L5pr6RnDt9vQkA7PDMsYqJ7ZLsARzJRKump7jBXzyHn8akPZb/GyJ7QBrsC3amOqBuwCwoWsMypXLRN3ae2Wd/k+ng2yNYlwEPAdVNpZqcHeEGS/ulQscJiEJcrU3SzoStNbwr0vuiZQ6BMzbfx3T4FvpXYmIy2Z3YfP/iC6mUqsH6y8qaMYr43dXhrDrdOUQYGaE13uDaBCyw43iHMgyPPo/FJ2IclZq1W5vRNWSsQLWBWPxJHyxTpvZAqf4waFEJGeR9HBCqnHjx1jKkrdIUi0V36AWb5ocJOBGRWbng6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIpuMakPky/pJ1tV/vPCgVp3uuaN/VZfwPye8qPse9w=;
 b=d3CSNZXR33eShHUkQ8JW6xOGA2zkqQmsCpAtgukwLxb7z+mydj9sH3GfMBo5EyQ46OAPLIUGCVmHrzPhJlM7XSp8WJ5HP9j143Yg5VeIBxbPcRkbHi4dgfkfJoKQTbZ6zTn1Gxl+CUXmlDqH4oTM466ztcX2uVR2+0oQuukcGzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS5PR04MB9943.eurprd04.prod.outlook.com (2603:10a6:20b:67f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 10:25:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:25:25 +0000
Message-ID: <ab7f8415-16fd-4abf-8cab-8c3245541f1c@cherry.de>
Date: Thu, 16 Oct 2025 12:25:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 10/17] ref-manual/variables.rst: document the
 USE_NLS variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-10-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-10-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS5PR04MB9943:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5a924d-3c76-4dd5-648e-08de0c9e51a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N3krWXV2UmtRb0hxSFhpY00wY1U1U3c4QVhRRUFVNkdyMk9VOUlQMzJLOG94?=
 =?utf-8?B?UDFtclh5Z1lSM0JlV25ETWpra2JEaktjbzZYcS81TVlMY3ljZlFLaGJkc09w?=
 =?utf-8?B?OEtacS9WNlU2UTJtRWJLM3daTlRGVllpNUVacG1yZDh2Vy9Rcy96aE9OOFhx?=
 =?utf-8?B?RFpOV2FOL1hpWUJLbERBcjhad0tjLzk5RnpnNG9tbzhPYVJYMGNQYnVLbDEy?=
 =?utf-8?B?NHpxOHY4akJTNDJzdElhc1gyaUtNVWFoT3VnL2YyUUJyYlJ4SC9OdjhwdmJX?=
 =?utf-8?B?ZzJYK2VLYi9lVkNlOGFqbU92MjJ4V09RNXQ2YkZSU3FobGZOeGRwVGh5RW95?=
 =?utf-8?B?T0RuQ3lYUWdLZTJFajhXUW5zUmdhQ0NSb3lZS2wxUXhGbmVpTTFpUXdBdW9B?=
 =?utf-8?B?dytwRmtaYjNEUmRUZ0pqcXdzWnR4Y0FOOFYzZkpwdVg5SjNOSTZVenQxMmtp?=
 =?utf-8?B?WWo3eUYva2tiOWZ6ME5SR01Bd25idTZiMzNqa1VIUDVia2NFSzE2eG1EWCtD?=
 =?utf-8?B?TEN3VGcxMlpndDlZd3RNKzJWRFJrcXluMllwSVllS1dPMk40V3RjVDk4RXRT?=
 =?utf-8?B?Y292dEFjalhpb1lsc0NkWWpmbStBeTBWYTlRMnhZdXZCWUFDZnlPcEdvTjF1?=
 =?utf-8?B?WElmVGJuK2d1NFlnZkYyTTMwRnhGVHMzUDRzZ2YrWFJiUWYvaGpXSy92UnAx?=
 =?utf-8?B?bitORE55TmhJNUF6OXJoL0cwbXJTeHRJVHIza1FLaHdEUzdOblQzSHlmbito?=
 =?utf-8?B?QjMzcy9lK21Namk1VmR5b0t3QXo1a0tlcExNeU1aTUIza3MwY1JGNlM4ZTN5?=
 =?utf-8?B?WTNjWndLVzVGdmtsdXRDdVJtNEYzOE5vL0FOTGplTnJRTmFESnF6SUlZNFJ6?=
 =?utf-8?B?cFhDWW1NdnNjWlJQODVHdTVLSFlBL3l6dkZBQW8rdHNNejY2VU9reXRVcGsz?=
 =?utf-8?B?ak9vZzZEdnZrYTlYbE1lVms2K1Q0RTJUUTNtT1p6RXQ3dVo3QXRyU3BvM2lF?=
 =?utf-8?B?RVk0U1lvejIyRHBwS1FFL3o4MWgxaWZiQ1g1M0lIWXRWQTNFa0hOTlNraXV4?=
 =?utf-8?B?Ymc2MTd4WTJaV1ZKMm01Rldaa2FjSm9jNWhWbXBGZ0RTL2F4V3c5a2xSMXYw?=
 =?utf-8?B?cy9IaUFJYlFLM1cwSVRLRUZXQUZ3cTl1cVBlVjgrL3ZXV1Yvc1JxbUF5TU5J?=
 =?utf-8?B?djdRNjFPRzR0NGRtSTZBOFR3QmlQcnZrRy90MDduR0YzdTdpN3B0VUNWclFy?=
 =?utf-8?B?T1NMVDYyYzlkdFZ3NENpM3NVRDNKV0o3K290WDg4cEtaYkRSTWJwTExFamRU?=
 =?utf-8?B?amlxeVB1KzgwVTlNT0NsaUZ1eEY2T3cyczh0NldJQnVDYVIraEY0Tjc4aXA3?=
 =?utf-8?B?WS91ZUNMY1BpcGh3WVNET2VUeUp5bENhRUFRZC9FMmZ2UjlZRDh6TUdDSVZ6?=
 =?utf-8?B?SXBUc3dJRU9peVlxNUtWY2xUODV0N0J2TUFKUEFaTVBDVnJ6WUlRNGdoeS9x?=
 =?utf-8?B?NkxNVTZ1MDhNT1htQlAvZHdLK0EzZnhIMy9VM3drVVduRDlvaEkvNFNmQzU4?=
 =?utf-8?B?VkQ1WE40S1hIQS9uelVpdW9DRzlRRTdlTkgwRG1hWlZjQ0RuUUhhbFFYRDBJ?=
 =?utf-8?B?bG1RS1J6UHlJNW01aG1UTXh4MUhnL25WRFE3MG42TjVNVkRveTRINGJUTjBn?=
 =?utf-8?B?RE15eW5XUll5REJIUzJZY2xCRU1Pd3g2eXVRVGV3clViUk9HNkNYVC9uMUVO?=
 =?utf-8?B?d3hQc2ROTmY1eFFjU3dqdzk2c0N5S2VOYnFWb3NZVWtaWXkvWEtIMmJ1akhZ?=
 =?utf-8?B?UkdHVGdMZW45aE4yOTdmTk5oOGUzUGZyZ2drREo5OVBsMW9mVHJhVGxreWtx?=
 =?utf-8?B?Q1Z4bnFXeTYxcEdQYlU0UmZySjNLM2xPSlhjZzFVb3dPSDllRFQ4V0QyMkcz?=
 =?utf-8?Q?NuKGhib70EsHpX/llsS3Vx2Go8zUzTXJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3lTeUJhNytqdWlFUWF1b3ZZSndYbW5tN3M5Z0lFMVZrTDE2dzFLRHM4MXQz?=
 =?utf-8?B?R2oxNWpkQS9JZ1RRZmNqeS9RWHdBYkdyeEhUamxtRmFGdlBod21UOUo3NnNl?=
 =?utf-8?B?RFdXcjVkbXlYTTZ3Y2lrOWFzWXFVOCtFZjdkckZPb3Jyb1EvS0dpNndqZ2ti?=
 =?utf-8?B?STN0bmdCQUxwY3pDbklLTGthQlROL2o2dGtLWm96NXc3U0VaYVlxZm4zdDdP?=
 =?utf-8?B?S1IxckhZOVNSejVaK0NtZkFXUlZuZVRmcTNMQ1lkMHoxTS9vYlJHV2s3eVBV?=
 =?utf-8?B?anBGS0pqSTBjQmZpL2xrL1ZIL0NWTTZVc1ZBMWtjOEhQMThvdGlObXNCZk5R?=
 =?utf-8?B?SFYzOXQyYmlYVzJiTEowSTUrMzJaVTRWVXFTeUVyYm5WZlJYaE1QbFBDZlBE?=
 =?utf-8?B?OGRpWlNpWjJYVHJmOTV4NjZHNkZEdXdBeXBoYzRpV3U4ZWxqQU82VU5BVXRw?=
 =?utf-8?B?MGhnV3hva2xWR3htaTJVSUpaZ0s3ZkFTbS96NS9MT1hWQXFtOTQ3bkdMajFM?=
 =?utf-8?B?ZnA4VWFLM0NIWTU1ZEtnbXJnQVRrSGFOZ3BhekZzN1FNUmthWGR1dnZHOUtu?=
 =?utf-8?B?eHRzSjlvRlMwWFI4eUM2UDFiV3Yyb3Y2RkFlYis1SHNkTEtKOUdlTDZhZWF2?=
 =?utf-8?B?L2hRNHdoQXd3SnpmQ0M4aHhRKzRLUG4yWHBveUM5dzVHRTMzZlZ5TTVBVklx?=
 =?utf-8?B?RUc0TTFmZVVpVXVmQjRJcXA4NFRwUzhNdXJOUUd6N2NLWE5yb1JlZmpicG5P?=
 =?utf-8?B?U0ttRm1HSnBMUGZTSVZzYkw4OTRtbjlDMEJnY1NnZ0RPdER6cmhKaldMVmJM?=
 =?utf-8?B?bnMrL0hyMmdBR212a2FaV2tSREFyZ0dDTXY1a2E2NVFORUQ5ZlBwbnlYOWlv?=
 =?utf-8?B?M0h4S0hRQllJWmR5czIxd0IrVEJUTVArd0tFYUQ0c25zelFtbzFnOFl0Rmha?=
 =?utf-8?B?QUVZaDc1UTRNOEYyTGpNdjFWQ2sxNExPbGxDSFFlMktSaDd2bE9MSVlyQUdr?=
 =?utf-8?B?T3U2SzlZWmFaRWlPSE5yVWI1Vk5VU3hPaHR3c1JOSXJ5V2V4emEvS3VUcHFN?=
 =?utf-8?B?VjFsZmxjampRcG5DaGJpb2hta1c1ZURiNWFtcjViay9iMUd1US9rOWdhR2d0?=
 =?utf-8?B?SUtWdHRzaG9sQ3lCdnJtL2tOQmNTWTBzclZJZmR5WmJpeXJXVEhvMDN4aHd4?=
 =?utf-8?B?VzlYM1liblU1WXkwTjZWYXVPQXZXRytwZExqb01JOXpLMElCWlg1eVVBclcy?=
 =?utf-8?B?WC9UN3R6TmxWTzFlZjI4Wk03c0Y3ZFRMSnpDZVE4WFFmRG1HbUVZbjdyNG5C?=
 =?utf-8?B?Z1hkak1SNTNvSXZ3VFlzeVA3ZzR2V1FDMkprdEJJUmEyY1kvQmVndzhSbWQ2?=
 =?utf-8?B?clVmR1RVSXMrUmtFVzhvbzNhMmI2ZFRKYjFleGVoUDZvUHM4czFMOVRGamh4?=
 =?utf-8?B?b0JMNkNlbVJZdEhvRkFoK0l4OEk3YzVOQXdDOVF1dCtnQTVoTWxnSllDS2JW?=
 =?utf-8?B?YjBYWEplOEZRek9aUUZmSmozQ093SS9MM1dJR0ZsR2FBRGh3MEptZjNEc2ll?=
 =?utf-8?B?WlBnK3oyYnl6ckxkU3UxTXZ2WGJUWkJDbU0zaTB3UmZkNTI0dUtUQzgxbHZW?=
 =?utf-8?B?ZlVOczNQVUZRZXdYcnM2TGJ2dE5kSkxKRk1TdEJ0YnBsSE55T1pzUTN4UEV3?=
 =?utf-8?B?K1JQWlVNVElnMlFPRFhSZkJRVy9IeGkxQXZDK0R0TnVteU5EMzNtekFMaHBm?=
 =?utf-8?B?K3VTWlFjU3JsTTh4U1hBVGVNNlJ0NGNreUxmTE83TnpIL3ErajBBYktjc3dO?=
 =?utf-8?B?R3dVNkZCQWF5U1prM0pCaHYwWWczc0dHMnFVczRDbHBFc09PN2VZdXZOTWJ5?=
 =?utf-8?B?MnVlMm96dGN4cGZXMFhPRWZCOTkvZkdwRVZ6aU5GTVFYOFUydFZiOXFJNWVj?=
 =?utf-8?B?ZU5xZUlkUUgzZXVvcks4Ym9SbjFMN05PWTBxYzBwQUlxYnd1NlBCU1RIamkv?=
 =?utf-8?B?L1ZVQ3p4emVPUWsyYTd6WW1KRkhwZzZ1UXhEMTJHUUVpNXhXMDNTQ0VoeTZq?=
 =?utf-8?B?eG1QMTAwREY0eDNGWnllZjl6bEhTdFB2RUk3MThDSnFIaTVNTXJhQ284YVgv?=
 =?utf-8?B?bXJMMmhjc0RMVVhSU2pPSXhPbXZPNm1hcmdzVDVvT3g0c3RWbThISG44ZU5k?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5a924d-3c76-4dd5-648e-08de0c9e51a0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:25:25.0448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJFj6aONJqyjwDeQqGKsws7esKY+5/O66r8zEh6524NopGkU6WV+bguiTnxZcinwfFmB8xnTLLJ8da+WvXJwiTn31ZgE64EjivwciDKmnjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9943
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7734

Hi Antonin,

On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Part of bitbake.conf, this variable allowing to enable or disable
> translation was undocumented. Add a entry to the glossary.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index bb24f2583..f16ef9aae 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -11117,6 +11117,19 @@ system and gives an overview of their function and contents.
>         the Yocto Project Development Tasks Manual for information on how to
>         use this variable.
>   
> +   :term:`USE_NLS`
> +      Determines if translations should be built for recipes that can build
> +      language translations. This variable can be equal to:

Suggesting:

Determine if language translations should be built for recipes that can 
build them.

> +
> +      -  ``yes``: translations are enabled.
> +      -  ``no``: translation are disabled.
> +
> +      The :ref:`ref-classes-gettext` class uses this variable to enable
> +      :wikipedia:`Gettext <Gettext>` in recipes that use this class. Recipes can

Suggesting:

It is used to enable :wikipedia:`Gettext <Gettext>` in recipes 
inheriting the :ref:`ref-classes-gettext`.

> +      also use the :term:`USE_NLS` variable directly to override the default
> +      value of the variable, and configure themselves according to the value of
> +      the variable.

I mean.... the same can be said about any variable? But the "magic" 
documented stuff that happens when setting USE_NLS only happens if you 
inherit the class, so I would simply not document using this variable 
"manually"?

Cheers,
Quentin

