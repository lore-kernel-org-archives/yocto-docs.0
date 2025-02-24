Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0142EC021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 10:26:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.42])
 by mx.groups.io with SMTP id smtpd.web11.86431.1740392776829062235
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 02:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bcq4ZXv+;
 spf=pass (domain: cherry.de, ip: 52.101.65.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKWj38q6Pp0FV8ETpMMXd4XI/bJGdjd+mJEwsMda0cDUkxCU7wSlLwmd2t4opaw8nvfyVWGES5w8drEVDffhx4DLPcD9tSEpERW1bzs1Fckb6diMnCS6oQATtCtMfzRiGe98dbnE7ID+NBwbm8N0sVxEcJuw7RUHDT1Ezblp6Lbuk8+JOxRU6KixsnCda13rvX5sUPoD1Ab9g+BfUEcWMQUGYQCMIkM2wPgX8RKZnA8ieTOxdRGlVneU/yFnieMkpHKYQcw7oY9dVbgjZvyh+taz3DZYEV8aHEJdGd5FWl++FUc+eYqW+HrCObc0CY6Oo/dhRm9DNwfw/kmNflKnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1J8Djq94cjC+Yx3NPbzJGW0sQh0Dn9DFgESLUEL7cWo=;
 b=npUrmYJtOjzpaw75ZE0/d/0UspEbuxtQOV/ewCoVVxypn64jGmK+zSwGra/8J7GKmXaChcCj1uOp6GNRjy3XWG6+kC1U/iG7b32D7ZNj0DHTuJqF9zvnaRv6dJEeNNw5SvZZSqoNxJOXBpDK7N84x17B2lD+qGjWk/ltZuxq1BiuwZ/0zLIzstplZyJhrTUD0BWT++TgPfZNcYpBoGzbPvHS3vYp9O/kbZ2jmeZKdisXxuUAbIz3OhV5lUVPj3u5rhIsweDv5dfyFCH/0i6cAeQsS8z1x3UP8pwIbIxCbOA3kMPrEvw+kCIKl9TDYQlYpyE4z9QkZ3L3UpEPs4tDxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J8Djq94cjC+Yx3NPbzJGW0sQh0Dn9DFgESLUEL7cWo=;
 b=bcq4ZXv+ThfAXwCyoBKF6fkpEg4Zf5HmvgkYRb/+8Z6NU+66qZchk64KZGu8NWlT8ckP8aZViaS845XgU6qP7H+eLvfM2p0z9jSxc9r9jnclLbjLwtWy2lTEwPIJF1R9sQqF6Fluo02Zl5UQnWzfoiHRBpm1BJJ5q1PJvPizxj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10877.eurprd04.prod.outlook.com (2603:10a6:800:25d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:26:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:26:11 +0000
Message-ID: <4fc256cb-9ecb-4f75-8f11-72ee88fa517d@cherry.de>
Date: Mon, 24 Feb 2025 11:26:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/6] overview-manual: convert
 configuration-compile-autoreconf.png to svg
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-3-75d23b5e7a88@bootlin.com>
 <b78094a9-4994-4f7d-a6c4-beca36cf652e@cherry.de>
 <D80KBPWTCLPO.235WHNG2ZFZO0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D80KBPWTCLPO.235WHNG2ZFZO0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10877:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3f1a35-7cfe-4c40-3304-08dd54bda8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXdZbU5OeEdIc3pwVGFmMGZzN1orNFl2SCtQa0hFSmMyMVlBWXdoN0VNR1Aw?=
 =?utf-8?B?ZUxkdmRndmVlN2JUbGphaUdSaWI0N1JsQ09ERVJJV1R0dk1zT3Byc3FUdkY2?=
 =?utf-8?B?SnFxMml2YUlKMFRqdE9vMFlrTy81Syt1OC9GaUdXTWJ6SW9uUGV0bHQ4dW02?=
 =?utf-8?B?bUovaW1uUTlKM0dBN2dBTHRvd252RXc4cXkwVFk2c21SNUduUFdGTmZ4ZlFL?=
 =?utf-8?B?RFAxRzBVcXJ5Zm9rbVZVcnlpcE9hZ1lZZm1hcEpNeDlJQWlRK0QrUVUyb0g3?=
 =?utf-8?B?WUVMMTREMlVqNEh5d3VqSFdOVjVlQms3WDcwbzBwMEJMSGs1VElZcDNLZG1C?=
 =?utf-8?B?YzB5c3hWbCsxV1RORE9sRmtid1ZwMlFjc0x5Q2V4UEp5SHdtUGEzYy9xVUMx?=
 =?utf-8?B?VjF4YyttMWN0RjV4R1ZFSHFhWGVFQ3dtTDVOZ1ozOVJyc1dGYXlBRDJNYTI4?=
 =?utf-8?B?Qk9PYnEwTlNLVEdrdzhuVi9CMEtrU0NleHJhc2dGSHZvWE1SdXJLcDhZVU83?=
 =?utf-8?B?cEJhSC90bk01dGJIbWVHNVFmdGRKWlpiL1RiM2RHUHhyS2p5QWxXc1VDK3lq?=
 =?utf-8?B?NnNvditNUDAwN2FGaEQ2MFNnQ2syV3RLalBGNzYyb0hsWGhMMG4yU0RyUCtH?=
 =?utf-8?B?aVdrbkROaXVkb0Nrdlp2ZzE3VHhYVjhsNzdBRjdMalpsVGRzRFVxaVJJeWFB?=
 =?utf-8?B?d0Z4TGY2SUxIWUNvNkFqM2ZCbW4yUi9hVlNtcnFOcnluVndtOXlSQ0Fic3p5?=
 =?utf-8?B?RDF1TWRXN2pGWlZhMmZJU2c3K1NGYlFFcXowdTlnUis3ZnlNYmFXY29IRGtm?=
 =?utf-8?B?QnZKcFpzM0ZJVSt2UGF5cjlQbndTM0MrcmR5Umk2cmFHNGJrZ2NUNjQwTVhW?=
 =?utf-8?B?ZmtlU1pDb0hjSHdXcWpwMTFvKysvU2FxTlNKWDd2bi9BcmlyVFhzT2VmaXg2?=
 =?utf-8?B?OUhZaWc5aUZzT1J0T2pGZGtzVTVjUmhFdjZZd0NGcWVWUVE0UnBSeXljVStY?=
 =?utf-8?B?V1o2RGlLWkxTNUkyOEZEd2dhOG1mbkhmdFFZM2dyejN4MW94NmVhSmZSZ0gy?=
 =?utf-8?B?RVh3NHRtQjFkSXE2NnltT3FNQ3RHMWdvTDJ2THFTQmllTWxURVBBWENTbVhL?=
 =?utf-8?B?MVJiQ3dWMzlYcm1aU2p4T0Z5RXh4WEF3UnAxdVBKOTF3MmxDMzg4Z25tclJL?=
 =?utf-8?B?K3I0Vmg0SU8rVFpJZVlLMkxLUjJheERLaFprUVN6QVZyaWt3RFV4bXdKUEVw?=
 =?utf-8?B?aHMvZzVqREU3K0pFVXg0L0U4K1drUVFkaHhmek4yY0lIUkticHE4dzhOdWwv?=
 =?utf-8?B?Ykw3Uk1rQTJUYVdWS2pubzlTek0vd1dVMzFGLzhUMzVWSzFoVElKT1hQZ3M4?=
 =?utf-8?B?bVY4L1hqTGNxYm9SMEVYZks0cG8vSHJiek5nTi80cU9KUHY2Y1YrM0JWaHBv?=
 =?utf-8?B?RE8rM3Z4bDluS08rbnFkaWFacFlTQWNnRXh6WnV1QWlNaGtCZUNNdVhuU255?=
 =?utf-8?B?TkhWMHNyaWJaZ1lsKytyOFh5OXlSYUpuMnorUCtZU2dyNnhtRmNMRjR3dVho?=
 =?utf-8?B?Wk1BcWVvRlhkMytzVy95T1pDdXkwSzViQW1GMHRKVThXSlJMQzJSeXdIeHIw?=
 =?utf-8?B?UG9yVDN2MXlockluekdWRGg1WXFBaVk2RjRRUG05ckxURitNR0M4enhyRjlm?=
 =?utf-8?B?L3E3WnBxbW9vRzN3RWc5SUwyZTZFb3ZNK21UMXE3d3JxTXhmS3BTRmlYSzRM?=
 =?utf-8?Q?hCy4bhYQ+Z82pYqFZC2jp5ZHT8VCHsJwlVKDLes?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qy9KQThLampWcmhjd3lWdVFIbkZTZ0wxN2EyT0JRSCtTM3Q3NWNIaFdBOGV3?=
 =?utf-8?B?OEZrdXZnRTYzblJoMVM1TE9MbDU3ZUMvdVg5cndrWmpxZE8wSHF4NGhkSWUy?=
 =?utf-8?B?Yk1EOW00T1FuWmVabytCQ212UWxybGMva3Y3M01wUE5xVGx6bFRDZnVtQVJK?=
 =?utf-8?B?dTMva3FQdXIzK3VaYXVxWU1aSUloZ0YySVNzTTFQYldRSkoyTTZFditGZ2Fa?=
 =?utf-8?B?UmRGZkJOZDZtSUxYbmNRVjU5SiswcUpGUWV6UVlTTXFkY2NjRS83em1WZG43?=
 =?utf-8?B?ZXd2WFJVeGk5cnM4dW5tUVk0a0F3SDJMb2FXTGtJK0xJS21OUmF4MmlUcmg5?=
 =?utf-8?B?aEVMdmd4WXNQazg1SUxzU2JSc3IyQTl0cWhxSVJ2RWlwWkxwTDN4L1lhUHJK?=
 =?utf-8?B?RG1aMjdreFpzT2NDQkFVbnpTSlFhejdFbnZOdmhwdkQya0tuZ2JvWXB5Q25h?=
 =?utf-8?B?RDdlaWZSRmc2Wnoxd2xCMkFWeitmbmxYN1M4dG9icE9DcjVRTDQvbld6TXRr?=
 =?utf-8?B?c3c5NG5ucDJOYWwxVXNiWTQyZFJTTzJnalBzNzlTWGlCT1o2eHlTQ3lwYTdS?=
 =?utf-8?B?UmRGeFlRVEJCVExiVU5ZNU0yY0p5UUg5Vy9veis1OGNiVW1QMkRXZjVRZWN4?=
 =?utf-8?B?MUc3VUxUMEFjTVVGTTRHVXdwbFhnM0RrVXVxdFNwcjZURmpOQ01XaDZrS050?=
 =?utf-8?B?dEF2NjVFRnBFcmNxTnA4dk81Q0RPeVNZNzdTZmZqQWE0NUNKcDFvRlk0akpi?=
 =?utf-8?B?aVA0NEdWU1JHUStMcWRSTVpIQ3NVcnVHc0J5RlJMc1hBRzFDdVFBMmRGT1RL?=
 =?utf-8?B?RldUUm52dW1DVTAyL2xyVDZGb005Y0VUblJ2ZkNPWUZKUmVqaXVlRmtmVi8v?=
 =?utf-8?B?Q3krN251ZkwwRC9tejlDUTNyV2JrN2pmQ1dmNllGZ2hoaWFiUmlaUFNhdWJ1?=
 =?utf-8?B?WGY4bkZ2L3pQTFpUU3Q3OWd0VkM5STFFdjZNRmh0dzcyL2gxQlJ5eFkreklU?=
 =?utf-8?B?YVV2WCt1WjhaRjVHVUZqTklwcnpSRnBKT20zYmV4T0VkWFFvRm43RUdxbjVZ?=
 =?utf-8?B?U3djeEJWQjFZd25uQVA5R1VNT0d0V2pSdVVwdktPcjY4VjA0OUpBa1d2ZlJn?=
 =?utf-8?B?VHlwdUJxVCtrSjNVQzZsb2E3L2ptYTVGeW5GSDdVYVBtdmV5RjlJVVdDUzBG?=
 =?utf-8?B?c0xaNWZJQmgyNTZlUG1iZWZKVm14bmlYc3dVSllNRU9ZTFlhWGIyTExrQVM5?=
 =?utf-8?B?NzBKejcwbzlKR2drQ242MzJ3bTdDMHVkSk90RU9YYVFnaE1VTE4wVVA1ekxQ?=
 =?utf-8?B?eERENzhqL2k3TEtMbFJSZEdUcE0wSHlFeTB1bEVscUswSHZHbWtjQy9vdDRJ?=
 =?utf-8?B?TWFxbWx5Sm9pbXF6SlRPS1VTYmdVU0piV3FWWlV4TlN6dzVHRCtQVTU5TjF4?=
 =?utf-8?B?azNxMzVkakJCeHVFdmV5MlN0REhZZkVic3BEeU12Y2hQemdaU2ludGZLTG9C?=
 =?utf-8?B?U3JZWjVlNkRWV1k3ZmZEVnZkZnFuUk9sUnBvM2YvYXVnVHIvRUdxMTJLWDZU?=
 =?utf-8?B?LzhsUHlpQUZDZ0xvcGRnMGxyTEV4aFhHYmNMN1g2TE9jQW9Ka2EzQW9TV3kz?=
 =?utf-8?B?VG91eVAxTUpNU1RmQnMxRXB4U0REQ3RpQzF5c1BTQUV1ak5SUlAvaWNqc3dw?=
 =?utf-8?B?OTdmSUdKbURiUUQrc2dWVW9NMTkwWlpYSlFZZlIyMEx4YnRQTGN6YVRLRjZ5?=
 =?utf-8?B?ZG9mMk9jd3hMRTYxM3U3R2l6ZGxMNmhoRVlDcVl3UytUUEg5eVB1SEx0bFlM?=
 =?utf-8?B?R0dJc0ZVYnRTc1E1RnpPQzU0NzlkYWVZZ0U0UU5WaUNrbFd3KzExV2dwSUJl?=
 =?utf-8?B?OThqQWhIOTRHRnZuRDduTWg4UGkvdVI4TnVuQTd5bUJXVk9keWptTzl5ZU1I?=
 =?utf-8?B?c1BiWS9Ea1U4TGZNWHZoUys5N2VDV1dBYk9IRk9WbzdwaWFEc2xKczFhTThG?=
 =?utf-8?B?TG9LOGhRRmY5VDhZT0FNWGFnVFRub2V1R3pGcVZmUDdBK2hTd2RWT3BkdEgx?=
 =?utf-8?B?VmsyRkkzZkZXb3M4aVhZcFJpajMwQnNPWTYvMXZhZnI3S01wblR1bUpTWlVK?=
 =?utf-8?B?TmtZVTQwU0hNRDI0a0kycSt0d0QxWjdCODZiNE43WVpPSHRTKytObVBvcFBV?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3f1a35-7cfe-4c40-3304-08dd54bda8b9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 10:26:11.4433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST1ZnVXFJNb7MZKe8G3JTKdu7Vce+5RUklOcaKiDZj6p6cCZHLNfMSyDehI+BDTet5aNX4FsIb418m9NYmnyzH3rwajTPq3X+2JwTjZoTmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10877
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 10:26:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6436

Hi Antonin,

On 2/24/25 10:19 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Thu Feb 20, 2025 at 5:13 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 2/18/25 10:11 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Convert the png file to an SVG file, and add the UNPACKDIR reference.
>>>
>>
>> The arrows for the build directory are misaligned, especially for the
>> machine-specific package.
> 
> Yes, I noticed afterwards too. There were some font issues, rsvg-convert was not
> properly picking them up. And also having so many arrows require precision that
> is not taken into account when converting from SVGs to PNGs.
> 
> In the end, I think having the different arrows as text (for the rightmost part)
> is much better and will always meet the alignment no matter what the font is.
> E.g:
> 
>    ${PV} -------- WORKDIR
> 

Maybe

${PV} <------- WORKDIR

?

> So now the output is this:
> https://lufi.bootlin.com/r/EuK0sscTNP#uV4rb2CQCPCMXONMGiBTfR9PY8BTDm0g0xeIAI+AsH8=
> 
> What do you think?
> 

I do not see much of a difference with "real" arrows, so that's fine by 
me :)

>> I'm also a bit skeptical about the position of the star before
>> EXTRA_OECONF, it feels like it's somehow part of the variable name.
>> Maybe add a space or make the star appear a bit higher (like in the
>> current PNG?).
> 
> I will adjust that.
> 
>> A remark for the original content as well, but I don't really understand
>> why B isn't passed to do_configure and do_install as well? Isn't it
>> where build artifacts will be configured before do_compile runs and from
>> where do_install will run in order to install files into $D?
>>
>> do_configure[dirs] = "${B}"
>> do_install[dirs] = "${B}"
>>
>> in base.bbclass for example.
>>
>> I'm wondering also if we shouldn't have a bidirectional arrow for B for
>> the configure and compile task as they are run from there, i.e. they
>> generate files in there as well?
> 
> I agree, B is used in all three.
> 
> For do_install, I guess a unidirectional arrow would make more sense as D is
> already used to point towards the other way.
> 

Unidirectional D arrow makes sense to me as there's nothing D before 
do_install I think?

Now to come to think of it, I'm not sure there's anything in B before 
do_configure? So should we have unidirectional for do_configure and 
bidirectional for do_compile?

Cheers,
Quentin

