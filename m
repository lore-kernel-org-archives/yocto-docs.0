Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F59CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:01:00 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24210.1781107256537619061
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 09:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JoiddnR8;
 spf=pass (domain: cherry.de, ip: 52.101.83.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoTJMjBwzkOwVMJpr/0k0K6dipTXzcV8bxlwJhX0hjL7qLSYPcEzxMK0SWuWpAL7VlE+NCY+uhraRACS/3DUTurTmnECW3wLQN4X6sleGabqMtCtVn3S1PU0CNTbbn1dkomBX5f0vKLcX+ONzOSTzD3W7bjyWz+WVXMTf5xYhts21mPYEGrzUig+8grYEcOWTDwDzZvQbyUFHkjQ4IzjyjFP3mpH3mz7qj2locjkSu2pcEJOQq8GQCb1to4JBmhEGSOO1eLzBKXFWTIfI8ARbvyzP0Cbr3k/wC/VeKfTGF5rlx+R+lW+8YlDglhilUJvoeh5S/uqjOfwI9eZbyhQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxUFJ+4qVQjbebzIjzen8XsWS6CXGuteweQGt9lrTQI=;
 b=kAN8JrTsz2CI5bPUl7SsSrBqUE0FJJPR2yaLeJh1n37K/iMRTn1Zj8MNipoiy/jsDpFxLOWZ/Gw2Rkt+uzPbhsEJM5B/K7eQVngGPZ3iQgvDCZxntALKHzNLOVv2zrnsh8v+OnK6a8FXU7HiYVXUXwzNdfYM8dPbIQSawh/K34psRN2qowGFPo2kdMvd2QWpQ42L08cTNXgneU6NrApP4mXzzkQjZC5gFJGX465A09soZ8x3pfl56WToAm6QfXbr3m3LAvBsm4quJB5yfW5fTtvelpsqSeO7V3C6PHNqiUcrjZKh1oX8XpEZAYpkG/HSBu7XiMVem7R50ykb3cSRLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxUFJ+4qVQjbebzIjzen8XsWS6CXGuteweQGt9lrTQI=;
 b=JoiddnR8FgLz1cP/uEf1RvNNg3FB2+HZuPvhDE38J9IR2FLQqH752F/tfE7OGiJlRb44nT3T38/JX44uFfL3rHAaSEkJCRZmLGx6WbHmTf3NfE3ycp1tE0l0ao7JNhv00+TVORWkXMPZy49CVjMT8vbDvJXy9oGrRVV5ygOr/eE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.16; Wed, 10 Jun
 2026 16:00:51 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Wed, 10 Jun 2026
 16:00:51 +0000
Message-ID: <aa51821d-03fd-4e28-9c67-7d0cf0a2802c@cherry.de>
Date: Wed, 10 Jun 2026 18:00:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] "FILES" glossary entry does not mention including
 "dirname/*"
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <b3fa7dbe-ace4-86ea-b747-fce12c32125c@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b3fa7dbe-ace4-86ea-b747-fce12c32125c@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a08439-5e5c-45e3-76cf-08dec70971bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|5023799004|6133799003|18002099003|4133799003|22082099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	ORjP3dda6leLTcrIaHMyQVCxokoFzx/Cvlhygbinw6EVL0V0QII6GYa8CjfkV+W1JFaG+pv/Z1q4SZFzLy3qzZMuzfDI358ZsuUwdwqgMn5nLyLpUX0Jnf4+UCaTSqgvhlexneraxjdqW/FZEzuF0N8xqd6TIIBfJ8a9eEf6EDn/vKa5Hg8Jl/H00OtQFxcKvddkIWP8gVXzqIaY4eZ4NYFC/43UG4XdmYg13UwURCUzl6vqk1nfAG1G1OMkoaFNtKLCOh6uuRFU8owXiQU6UUk/VT1stzXxYHKT4h1RT0cZmcWCap52Mnj+cWjgugrTPeg2PMpeBAnEnVjtAk8IHcfOM39CePiwKO6jFLqLxg/TdKicoOYkGUGOEw8WyYZcUWbPUSZF07HDt5XxgacKDsoKt9LzZ867Yc9xrxitBkPXU/AM50pfSM7L1wRfQDLmoGodC0xEqGQAljqJBOg5tKMWsfFPFGpB4/UO6TVcGsjp0fcVM6fTKWov5AqrQ0e7qEzCRXBKNhsJdIc0teB8p/dEXajBH0Pp9eb6HwPLbcyz8nylvkl9PYyEAw3p03ujOPDsncKxqmZVeFZFFr42/rUaiMJR/oK/jfZ237mMWMou19mT9oPCOPJ0XKncTL9fcJzVIJlaH1f6Inx+G6irIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(4133799003)(22082099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHpoKzl4MkR1UGhqVUxYazBkRExVTUJ4dWNWQ0dDbExnOTBhWG5QbThEVU92?=
 =?utf-8?B?VmZUNFN6WTl5ZmU2TWR2bXRYM0FJWXo5NEJBTXAvdXlMWlV3TUkzUWwyKzhY?=
 =?utf-8?B?ZlQ3UVNjVEk0eDFtaVhLMnZFMVFBNmlHejkzNGZXRGZLNllhbkk2UnlCcm1Q?=
 =?utf-8?B?a0d1ckFUS1ZBbWlqZFZKVlVJeDkxUkpRdmFCQ2ozeWFreWFjREZKZDI3aElE?=
 =?utf-8?B?QWhjaXZTd29pWjJVSC9EdTUvanFqTnd5eVQ0dW9pRXBvOE83U3hHalpDY1hz?=
 =?utf-8?B?UFlUbjdWQ0JqbEQ3dTNtdXY1VHMyMnRKcFBzNk95VVFDRHNBQVBoUGlGL1lL?=
 =?utf-8?B?Uk52RFpGRk5LL3JJMm5JN0lDdkZHZ3pQWnV6SVhDSFN1V2JjODJtbkRFZnQ0?=
 =?utf-8?B?dXJHOGlWWWRVdkU3MmpoVHFSSjFxVVYxNCtjMFZicTk3OHFCRFk4SVpMRVRU?=
 =?utf-8?B?bGhyN2VCbC91K3piUVRiQU9waCtpd0wzV2ZNM09iUEtPL2VXVEZpYVlKTnBr?=
 =?utf-8?B?aXZQckZodkFjS3Q1dnFYMlFRSTEvSHJyRXM0QnovZEtZdDVhMDh2UFhxcmV2?=
 =?utf-8?B?Rm1RNTVjN081RWRpMUZDWEtJMWhwZTIvdjcyL0pzN2M2dnBWbUw5UzUvR29Y?=
 =?utf-8?B?ZE56MVZNUmtQK3RVZlNyb0h3YmFRS2loN3ErQmwvQWJKNm1HUjFNQ3FIdWx6?=
 =?utf-8?B?QjJGVkI0bERKL2FrMmxDTlM3Z0xabk44Z0RZcloyZGZON0FsbEhwSW5aaG5y?=
 =?utf-8?B?ajdvNHozd1B0N1NTbm9QbkcrMFFlVm9UMkhWQzE3ZzcrTHJLSzM5eGNmU2JR?=
 =?utf-8?B?eVZIckpqWnNMNEZRRWRXSlBrN0VaTkZtR2VoS0VhblNHWFBUN1FidDczWHhX?=
 =?utf-8?B?WmExZE5rbThZY2JUYUhrY25Hb1dsU2pCSmV3SjV3RmYvMkZqMTBwODFZZnJu?=
 =?utf-8?B?R000VjdQODZFS2xydHZCVDhBVHMzM0hsWXdmVzgxUXM5YTR3NWhjUmhxUSts?=
 =?utf-8?B?enpqVmhhS2g0YnZhNTJQZy9RalFoTUk5aXhFSENSenFTZkJ0MTlUOWhWVU5D?=
 =?utf-8?B?YUplNDJ5ZjRST1RmQXpCRVc5TndVd1FuR3pCZENrOEpNeDk0S1hGaGx0QWtL?=
 =?utf-8?B?c0VKcDdkY29jRjh4bTQxSHpsMTZiTlhLQWJxbEZiZmdPaDZ0SkY0ZXNkbWUw?=
 =?utf-8?B?NWlRVXJoS1FWYTV4enAzNUhyVlNGWUdnRkVOdXdadVhMTU1yZ0hjNStJWFQx?=
 =?utf-8?B?Z2hVMWYyenU0eGpXMjg0cWlrYkVweFlMVFhOYUJiMmFvdFRIWWpVbkVMV1d0?=
 =?utf-8?B?bEVTekY3TWQxZDhMRWVVdUprUUxIUVFpSzBCNlAycDhEaVNoaFR0NXAvWE8v?=
 =?utf-8?B?MExKVHBjb1BRQU9zNGMzajZJZENjeGdJcnQyVHFCSEppajJNZ0pjNkFYanNZ?=
 =?utf-8?B?RmlMc2ZkQnpTei8vOXNEbW9IUGFXL1BLaHFYVGRPT2NaS3RSeGZaclk3a0hm?=
 =?utf-8?B?NlJVbDhaRk9pNG5ZeUJrbkRaOXZ0VDR0UXh3MExwWkJ6eVFGWnUzQi9pVDh3?=
 =?utf-8?B?QnVmclRjL3pBaVVFRGZPNFErQ2hvN0N1SDBreDF0Z2JMUlpwN2RhRTkrOVJp?=
 =?utf-8?B?RldmQXNVbTBmWXR5ZlhvUUFzSXJaV2lmWEZoTzNudjJpOFdVcHN4OCsyaDEx?=
 =?utf-8?B?ancrV3RJdjhoRHB0a0Q4TzBiRkZ3WGNURGkxL3hkNkI2Z1pxM3NpVGRLb1FZ?=
 =?utf-8?B?QmFUOUgxRlYwTkZ4OVMrcFJ1ZitkR1VlMWw5WCsrbG9CWUVUcWRWaC9ZMEo2?=
 =?utf-8?B?Um5MajAzcytWRVBnQUw1WjRyZXF0RnFwQnBxSUNSdEt0N3VkN1RtbWNkTGxY?=
 =?utf-8?B?dmpycnkzY091akNwY2ZUMzFZQWZWYm5jVDhycUkwZ0srdzJIdm94Ymd6MGxJ?=
 =?utf-8?B?WTJOSEJYTjIyQUxIQ1dBdHlSSVpWek9EOUxwRXFjb0dxYkRVK3NEeERwaDQ2?=
 =?utf-8?B?dnk0YWIyRkVSOTc5VDA2ZzJMUDFXRW5MU295dmVTeUovQXFmMDkwLzJPWVJ3?=
 =?utf-8?B?Q3NQL3o0MlNrbWFoSUZHeXA0MmtsNFN2eHFpYWlaNmNYS1JPa3AzRDZIWWt1?=
 =?utf-8?B?eU8wNytKSVM3ZFgrelI0Q1VFK3gvemI1NCswWkc4bjYxektFdjd6dG5GQm5O?=
 =?utf-8?B?ZnhBUmpnVkpnOG9LZmFySmtQVk9NZHNKSForcStkNVNpdWdjN0VoNXk2NnRJ?=
 =?utf-8?B?WG4xdmNueFpuOEhoSVFWSUMvZ0hXV1ZsT29ycWhzTW4wMlNwbmFWQzFTWVM5?=
 =?utf-8?B?MmY4bkZWZWpaSWdDM3BtREhYYUtrNW5ueEFkWEkzOGJoT01JckZqZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a08439-5e5c-45e3-76cf-08dec70971bd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:00:51.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JqcaZ1U0tIiaIVWkawTrQDAeA4ClrrJbvTIXUOjVL7ksidWnbFiZDxTF1kCnX+85JACeb3hAypTO5vMhu9O/ZEM3elkkjpZswpaigu36mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 16:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9684

Hi Robert,

On 5/29/26 1:00 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    explaining to a colleague how to properly define a package's
> "FILES:${PN}" value, and noticed that the explanation here:
> 
>    https://docs.yoctoproject.org/ref-manual/variables.html#term-FILES
> 
> has a subtle distinction from the default value in bitbake.conf. in
> the glossary, the sample setting:
> 
>    FILES:${PN} += "${bindir}/mydir1 ${bindir}/mydir2/myfile"
> 
> shows how to include an entire directory -- just list the directory
> name and the inclusion is recursive.
> 
>    my colleague had initially used the notation "dirname/*", and i
> pointed out that the "*" wildcard was superfluous since, you know,
> recursive, but he showed me the sample he had used from bitbake.conf,
> which *does* include that wildcard:
> 
>    FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ...
> 
> i couldn't immediately explain why bitbake.conf used the wildcard, as
> the only difference i could imagine is that explicitly using the "*"
> wildcard would ignore hidden paths, but that seemed like a weak
> explanation.
> 
>    is there some subtlety i'm missing?
> 

Did you ever figure this one out?

I started to look into it quickly because I vaguely remember some 
gotchas around including directories and symlinks we ran into at my 
previous company years ago.

I'm assuming you want to have a look at populate_packages() in 
meta/lib/oe/package.py.
It'll eventually call oe.package.files_from_filevars() which runs 
glob.glob(path, recursive=True) on each path. The issue is that:

 >>> import glob
 >>> glob.glob('./tools/', recursive=True)
['./tools/']
 >>> glob.glob('./tools', recursive=True)
['./tools']
 >>> glob.glob('./tools/*', recursive=True)
['./tools/accounting', './tools/arch', './tools/bootconfig', 
'./tools/bpf', './tools/build', './tools/cgroup', './tools/counter', 
'./tools/debugging', './tools/firewire', './tools/firmware', 
'./tools/gpio', './tools/hv', './tools/iio', './tools/include', 
'./tools/kvm', './tools/laptop', './tools/leds', './tools/lib', 
'./tools/memory-model', './tools/objtool', './tools/pci', 
'./tools/pcmcia', './tools/perf', './tools/power', './tools/rcu', 
'./tools/scripts', './tools/spi', './tools/testing', './tools/thermal', 
'./tools/time', './tools/tracing', './tools/usb', './tools/virtio', 
'./tools/wmi', './tools/Makefile', './tools/certs', './tools/crypto', 
'./tools/mm', './tools/net', './tools/sched_ext', './tools/sound', 
'./tools/verification', './tools/workqueue', './tools/writeback']

and I cannot make sense of the rest of the logic in populate_packages() 
which checks whether the path is a directory, and if so, seemingly only 
runs a homegrown version of mkdir -p. Something's not adding up here.

Note that glob.glob() doesn't return hidden files by default, c.f. 
https://docs.python.org/3/library/glob.html#glob.glob (feature only 
added in Python 3.11 anyway, which we haven't set as our minimally 
supported version).

Cheers,
Quentin

