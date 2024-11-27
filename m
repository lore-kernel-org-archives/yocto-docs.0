Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847C1D6ACDA
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 14:08:30 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.83])
 by mx.groups.io with SMTP id smtpd.web10.72428.1732716507160643955
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 06:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KMn8Nchk;
 spf=pass (domain: cherry.de, ip: 40.107.247.83, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdqHQES+aau1wCufuKmf0paBruDZhQp2WOQOIXImG7p+ii59+3n8cSXuuQ8BjJOtuogQ02ut+tBXPXsFsCdS3BkNKArswHaIk8g9PD2/SO1tXSicYj+c/YLvoo/w+Q7YyCpFr5CiZLsimLd5YlMYanPA55jwemvhZebRbV9rrTzNpQz7jEIHkyUsl6ssGlx81MyS2nh+FUpjcYII9XmwO8m2uPQqIvHDJ9F/sx7D00uoHqnbrNlDPyK7ihihxjO+h51sKjdJhK6Dpfh7BHAYZmn/7AK1P5peUKmbT9PRgusQlIwWs++cCFMB2BsCmKmsDOQl1XKDlGYgEbErLRJRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fv7ghD37E9GfQyOcGsEJBmA8xvcW9rtievVxMQDMsg8=;
 b=tli8ObaJmt6NHIu9gJnjdJY7VdRO1/ck2ANfqKDCbV0D1QQQ9evjoUcSKm3Pnu97zkUOPezAiQy80DnZkGgXnb3T0hGLSZijqByM72AluVsrb2sCuBVEE3PP9An//eLj4A/uuT6OFmj8xO2PIqMx/WvABb+diaA8HKHx6/9rORjL0a0+azCPEa6PQFdJL1k8XQNFjaPDUt3ZE3nZ9M7BvMzvATwD4o9spA/G//pGptJsCozz5ID3fIG0XMYROR/jftjCyFPs/SPCko31yG95tip1Um6EzOIk2La5XYnx7Pun6tFFNe/z+sfmIfaBX+M1GYwY+l/LuegenFSbVoI0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv7ghD37E9GfQyOcGsEJBmA8xvcW9rtievVxMQDMsg8=;
 b=KMn8NchkF6UzTWr33tC1Be/OD0X3hBtAFifhEnQxddxCZ2cscnYRq3ihXDSwStYmq0MY3HjJHbJsttZdkODPgUdf7R/nXkep4AHSUkGSL8WuCOSahTd+hz8hn57OtS/LSNv/8zLwHeniWwG4kRllqwLJNxE3af8h/XftGvHESik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB10052.eurprd04.prod.outlook.com (2603:10a6:800:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 14:08:21 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 14:08:21 +0000
Message-ID: <caceb002-6c62-4acd-87c3-41555e3344fc@cherry.de>
Date: Wed, 27 Nov 2024 15:08:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH v2] Update the documentation for SRCPV
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20241125-deprecated-srcpv-v2-1-89bc3afc78db@bootlin.com>
 <a8f7ee5a-0733-409e-a9eb-a5531c6eda23@cherry.de>
 <D5WTAZ2HJTBW.NLAN1YRHN9IE@bootlin.com>
 <f6b6408f-e156-4b24-9930-0335b70f45be@cherry.de>
 <D5WZNUEBWRXT.18H1Q0G3SGRE6@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5WZNUEBWRXT.18H1Q0G3SGRE6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0152.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::45) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB10052:EE_
X-MS-Office365-Filtering-Correlation-Id: ef016f6b-6cd9-4733-7dd6-08dd0eecf35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VjhGRWtYOE1pRElRUEhXQ2JEOTRDb0hWTUN6d3pqNmRaOXJkQlI4U0xWaTlN?=
 =?utf-8?B?Q2NOc2YraGxCRkxOMWkyWGFneStXZ2FsK0wzVlFsaEdYL2k5eVoxOStRNHE0?=
 =?utf-8?B?bG5CK011aHY4WFZPM09lSEFXNEs0WHFHdjlMMVFtV0FKWW5WVTdMTklqS2t5?=
 =?utf-8?B?c3pUbDQvOThPM2J2ck95bHY0VytiUzBmYTRkR0RZMGhGcXoxM25OYmNVZ3h0?=
 =?utf-8?B?L056UUZHY3ZndWoyWE9YSmRJYnpiR3BacU5nQzlCbVpQYnRBMXdPY3p0QUNB?=
 =?utf-8?B?SjFnWTVmV1pGWGQ2R1NiYVU3blR1YWE0L0Y3Rk0xRWNTTjBOYXg2Ly9oR2t3?=
 =?utf-8?B?ajBsVnd0QUhLZU1ZVlg2WVQ0VTIyMEdPWXVBUHlJMFRSYlZXQ00wL1daQzQx?=
 =?utf-8?B?Z21Jc0hwRlVGMkNTZzdyb2NidEJyb2ZkR0NZMHc1UGhQc0RCaDZCSGlIcHhk?=
 =?utf-8?B?MGpHbktGUnFFOFJsWE42SGhudEpSTkJWeEdTL2Z1M2pEL1JaQTFiVDVURTlE?=
 =?utf-8?B?bUJvN3NhczRQUDJQaXphNHh4ZUkxeUJjNjBnVlNJSDFYamhVVjJ3RXdVbnY0?=
 =?utf-8?B?aHB6T1VFbzcxQjBpNkN3RlN3dko2ekhvR05NTzdvdGZoWjFkMzNEaTI0Yzcx?=
 =?utf-8?B?bjNCYmZwdkMwWlkwNWxmL2s4Sld3QjZFRERZaVNRSi9YVFA5aUlYTWJ2a3Fu?=
 =?utf-8?B?ME43U1oxbytyM1l3dXY2bU9GRW4xZEZvU3Jqb3ZMd0h1L0JWSllQWUxOK1po?=
 =?utf-8?B?eUtUMHpPeHcxZVVza3NZczdKTHhHTWFvSmk5cTRzczkwNFoxdE9Oczh5cFB5?=
 =?utf-8?B?K0svbUVRbkVtMjRwMk5OdHhUQ3lUSGhMV1R1SlIxbjYyaFlHRVZKQWYzbnNT?=
 =?utf-8?B?MkNXZnVRTWVWRFhRV2ZKS2lvQWlPdlJYUzU1VzlEemxtalBoOXBuUk9yWUVu?=
 =?utf-8?B?QUZZaXJEQW1CRFNuc2ZOQ2hzbUgwSTQ4WTlwTWF3Q0RTUWRhNk04eFhSYi9Q?=
 =?utf-8?B?N2VvcWtzRW5uSUxvNlkzZHB3L3pKTXh2cWgxNmlYWGhTZXppNjhPU2t0RDd3?=
 =?utf-8?B?WVo5S2N1cG0wNGNNWm9pbU51OXdzb2dCRC8wNTlLa1Z3WStEdGUzQXFnem1Y?=
 =?utf-8?B?MlN1ZEFWTkQ3NlVSeXBIVFh6NGpKb3FoN2ttRkpXU2dyOEJlbWxYeUdKQUN4?=
 =?utf-8?B?SEw2TUM3Ulg0Ti9obngrRzFJcXBhcHN3Y1M2NlZSWWVFd1l1a1BWT25FQlZ4?=
 =?utf-8?B?My9oMnkzd1RiNnV5dXpPWGxnWmNLSHFBRE1vZGJDdVNEUkpXdXdJQ044U0Z0?=
 =?utf-8?B?YmZCcGxsc0R4ZjlianEyTnBTaElmZXJSUE5zcnJtbmdoTTZNbXRuZ01lZkV6?=
 =?utf-8?B?TnB1RFRmbjFLRFJlNlpHZmRqYTdoNlhtZFZrSjZXSXp3YUFKYlZHdXhCSXJS?=
 =?utf-8?B?M3lFb2NqV3MydmRSZVpxN29lbnFGWmdXY1JrWDNsTnhsZFcvblZVYW5oU3ND?=
 =?utf-8?B?Mm5nRjdQOVlEQm84R0NtR2FOUk5tRWZ1ZXl5N2NNMnlSR0YvdXV0VnFXMEpB?=
 =?utf-8?B?TGJOZ1RpRW1OeU5XTlVsWjFpUFY4T0hZalN2dnNXcDdCaXd4aWNqV2NGb0FR?=
 =?utf-8?B?Ym0vdkRwOGJPdUs2Sjg1Z1Jjc1pjQU82N2tNSElTaXpXN01zQzFpWTByTXBM?=
 =?utf-8?B?RFVFaCtpanRweUhhYkZaSUM5UnhLelM3dDRTVVI0MmJmUklmR3FFRkk5ajdS?=
 =?utf-8?B?WlgvREdWRmJtTXpGNUlhM2UvMFFGbGtUYlE5RWxwVHE2Q0VHTWJVYTBrZ1hW?=
 =?utf-8?B?T3lpaFVQckp1NU1SU2hsZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlFFZ0JKb09mUDhyTmRINkRtTUZpbCs1QVZtQWdYR3hWMzVxa1YxRjJqYmFK?=
 =?utf-8?B?S2FGbFAySVdBUWFMbmk5SGljOHduVzNHeVo3NnB2UDhMRVJXT3JKaXBScUY3?=
 =?utf-8?B?QTFlQzZ6Q3R3cmJ0NjZRekRUbk9lZ0FTdWN0OG8yQzlMaUdobFBoTlNTaW9Q?=
 =?utf-8?B?blNNYTV3VmNIRXVkcXNvVm5mcnNVSGtPbWxNTHJEUWx6azF4Z0xlRVFmWXRq?=
 =?utf-8?B?cnRxaDB2d000VmN4UG1nSExpRE5DM0pQa2w1VVhGNHJDT1hsclMxQVpRSnpY?=
 =?utf-8?B?cmlnY0N4TGNSZ2RlMDY3RlNtNzdaRHNldzhON3oxc0FoY1pqcFhWbGtXNkoz?=
 =?utf-8?B?aWtnZFpRRTMxUE9mSG5tZkUxRC9DdUFjSTZONmJGN0hWTURYYVRDLzdqTlV0?=
 =?utf-8?B?UXV1UzlCWDZYT1pmcVJxcmtBZlp5TGEyZEVwSzBJeVhYcS9UcVNYeDFmaGhI?=
 =?utf-8?B?Sk9wNmZxL0drNGkvV3BCSDRuUWZSVlJvUTlSOCtJb1RPR0poSlhOUDc1Mmsy?=
 =?utf-8?B?VHRVVDZ3RGlhWFE5UmJ3Rzh0RHE4dGJCbmhKS1lyQXhWaTkzUHlHeGNoV2Ju?=
 =?utf-8?B?M0RVYnJqcEpKblRaZENGUEJodm42T2k0M1ZMTUJ3TFA3Smh3dEhGZWY3OG1x?=
 =?utf-8?B?VUNraktrdGhtRTlaSnlRbmdsZ2V3aFY4SVA2NjQ5a0ZBMGxtbytuLzJCWmFr?=
 =?utf-8?B?dzRhUlQyaEdUS2c3ZG5QRm5VaG9EYW1KUWMrWlBjKzY5U0tOTFRPcEhCdExJ?=
 =?utf-8?B?eXBNUnNTeWw2OUJoQkwzbWp1QXphSS9DWHVXUEhDNDErV3ZETWFweXhpSHAz?=
 =?utf-8?B?VTJraVNnUko0d0N1VXBoVDhOWFNpbW9weWJkK3NUbWtjNzJJbTdTT2NUMENz?=
 =?utf-8?B?Yk80L1Zyc0d3Y1ErUXliNzZXaUdtdkFyWDVYZ0pmaDZnZGJlb1djR3lzSjBB?=
 =?utf-8?B?RUk4Qytsb2cxRVZFVk1MeU9EaHRFVjBVOHBvT3U5ZDREWHl3U292blZpR1pL?=
 =?utf-8?B?ZE9GOUNTNDdIWVY1SEQyU3Z0SFJUL3pWOS9laFVzemErcWY2eis5elQxZjlM?=
 =?utf-8?B?SktXYTB1YzdNTTRCUFFzYnU3K3NZY0FQb1JoeG82Qk5WKzNEK3FEbEdaOGpS?=
 =?utf-8?B?TWp3QytRMFY4RjJmYjBDeEgrcms0QjJ6VmFRV3RzbUY2YTFRR3A0cXVHMnRH?=
 =?utf-8?B?c0FqMUxCZTJ2OWlyaHdmMDIvS2MreXRNQ2ZORTEwKzdTL0xQSXBHQXpsZUcr?=
 =?utf-8?B?U21Ua2tkSTFXcnQxZG5VTVVUNkFyUS9INkZBVllRdnFQOTliUXF6ck5DWUpR?=
 =?utf-8?B?L01USGRkOWZDdzlsNzFXWHU4QjN0MDgwaHIzUDFxT0JRWmpJSldES3Y0R2ZE?=
 =?utf-8?B?VTJBZENEMUZCV1ZDaFBIQ0srLzFiUFpnNFZpdCtDdXkzR1p0amNBM1oxTWIz?=
 =?utf-8?B?UWxHQ3Nyb0Z1ZWR3aXZJbHdxYXloWU53YmNRZENlN08wMExCQ2kyRndNYXRS?=
 =?utf-8?B?czhCU2ZQT0NMeUhoRjBxTHVkZTRSbDJiaUMvN1hYLzlSM1h5TTFkOWlCQWNz?=
 =?utf-8?B?aTJrZ3lnNmk1bVVoZ3dFMkl4ejFaZGVTWEhjd3ZQaHFYbC9jL2RTc0pmbi9o?=
 =?utf-8?B?TUo4bHFWSlh2bE9JMk4vNFlZRFErTnNteXRZYWJsd2lPbnF1VzZqODZXR3Vp?=
 =?utf-8?B?SFprNXpSMWFvK0ZKcDFJMk9WZXZXbGYwNzVwTmg0YlpoekpsejVDWEI5bFZW?=
 =?utf-8?B?c3dJbUpLdHBSWWtHZkJ2UkZyVGY0WlNSUTJMTFRwSXhDaXVRUEVaUHM1dGlU?=
 =?utf-8?B?aFBWNUZQZXp3SUsvMm5pTXRvNWViSGRVWFlrK2JTVlhNRUhZNStYUFN2NUYy?=
 =?utf-8?B?WjhjKzQyNE5yOGpsNVFSaUtmTWlvR3dRcFNYUUhkeEdXVVNpWEpuOXZPaHk0?=
 =?utf-8?B?SFpJRDg5US9SdDRCZHJqRHRIMjZOZ0tvMEwrbXBTUFp4ZU1FM1huRG1ENGlX?=
 =?utf-8?B?S1dRSCtZaGRYSEE2Tkowb3V0bDc5dWsxTnc5Y1haclB4ejZXaFcxRFJjUUZD?=
 =?utf-8?B?ZEpRcExqYzlVNlhvY1Y2R0ZhekI3dnk2VkVMSDcraUFkaDJWWmZnYWNEZWQ3?=
 =?utf-8?B?b1hiaGltaEJIUEVKd28rd3ZESkVXZk5rb255bHpoVGtnbWVjU3I2dzlQd2Q0?=
 =?utf-8?Q?0uAVnB1XFRrzDF1ZPOwRzYk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ef016f6b-6cd9-4733-7dd6-08dd0eecf35c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 14:08:21.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcZETLUeOrGCRMYMvMs2fNjIrCL16n6HO+ODwFZzedAyR9bhSKT2LqtAPYzcfujz1LJBv4EX9M1R85/8YSQRkRR9vjyO+suEeaAgq/Js8d8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10052
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 14:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5834

Hi Antonin,

On 11/27/24 2:17 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Wed Nov 27, 2024 at 1:51 PM CET, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 11/27/24 9:18 AM, Antonin Godard wrote:
>>> Hi Quentin,
>>>
>>> On Mon Nov 25, 2024 at 4:57 PM CET, Quentin Schulz wrote:
>>>> Hi Antonin,
>>>>
>>>> On 11/25/24 9:17 AM, Antonin Godard wrote:
>>>>> The variable SRCPV is deprecated since 4.3. Instead of including SRCPV
>>>>> in PV, including the sign "+" is enough for bitbake to add the source
>>>>> control information to PKGV during the packaging phase.
>>>>>
>>>>> Update the documentation for SRCPV and the places where it was used.
>>>>> When instructions previously referred to SRCPV, replace by mentioning to
>>>>> include "+" in the assignment.
>>>>>
>>>>> In most examples, "+git" is added to PV as it is the most popular SCM.
>>>>> Simply adding "+" is also possible, although it is better practice to
>>>>> include the SCM name, so give that example.
>>>>>
>>>>> Update the gcompat example with l3afpad as it didn't include "+git" in
>>>>> its PV definition anymore.
>>>>>
>>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>>> ---
>>>> [...]
>>>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>>>> index ec4d7ab73fe3ac1bc64f5378c65d19ae0b749809..f611edae9f37097734234805faa34b1850e5cfd1 100644
>>>>> --- a/documentation/ref-manual/variables.rst
>>>>> +++ b/documentation/ref-manual/variables.rst
>>>>> @@ -209,12 +209,11 @@ system and gives an overview of their function and contents.
>>>>>              SRCREV = "${AUTOREV}"
>>>>>     
>>>>>           If you use the previous statement to retrieve the latest version of
>>>>> -      software, you need to be sure :term:`PV` contains
>>>>> -      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a kernel
>>>>> -      recipe that inherits the :ref:`ref-classes-kernel` class and you
>>>>> -      use the previous statement. In this example, ``${SRCPV}`` does not
>>>>> -      automatically get into :term:`PV`. Consequently, you need to change
>>>>> -      :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
>>>>> +      software, you need to make sure :term:`PV` contains the ``+`` sign so
>>>>> +      :term:`bitbake` includes source control information to :term:`PKGV` when
>>>>> +      packaging the recipe. For example::
>>>>> +
>>>>> +        PV = "6.10.y+git"
>>>>>     
>>>>
>>>> I believe this is not properly indented? Missing a space here to follow
>>>> our standards?
>>>
>>>
>>> Good catch, thank you. Some others below are also not properly indented. It
>>> would be nice if sphinx-lint could report this, but I don't think it is able to.
>>>
>>
>> It's open-source, so maybe something we can contribute :)
> 
> For sure. I took a glance at it, and there's no support for any config file at
> all so that would be a first step to add, considering 2 or 3 spaces is a
> personal choice.
> 

Another option is just to check whether the indentation is consistent, 
which wouldn't require a configuration file.

> [...]
>>>> I think we could simplify the example. The point is not necessarily to
>>>> use % with a git-named recipe but rather that a git-named recipe is not
>>>> going to match "git" but the "PV" defined in the recipe. What do you think?
>>>
>>> Ok, something like:
>>>
>>>     If your PV is equal to "a.b.c+git", you can match it with "a.b.c%" in
>>>     PREFERRED_VERSION?
>>>
>>> This makes more sense with the current state of things, and simplifies the
>>> example a bit.
>>>
>>
>> """
>> If you want to select a recipe named foo_git.bb which has :term:`PV` set
>> to `1.2.3+git`, you can do so by setting :term:`PREFERRED_VERSION_foo`
>> to `1.2.3%` (i.e. using simply `git` will not work as the name of the
>> recipe isn't used, but rather its :term:`PV`).
>> """
>>
>> or something like that?
>>
>> Is PV really extended with the git hash when there's a + in there or is
>> it only PKGV that gets it? Basically, do you even need % character when
>> we have a + in PV now?
>>
>> Not sure it's clear, lemme know if I need to rephrase my question.
> 
> So yes you got it right: PV will never contain the hash, only PKGV will (and
> only during do_install iirc, so bitbake-getvar PKGV will not show the hash).
> 
> Which makes me wonder if giving the example above is any useful, since you could
> just set PREFERRED_VERSION_foo to "1.2.3+git".
> 

It is useful! The point is to highlight the "version" in the filename of 
the recipe is not the one you should use in PREFERRED_VERSION, but 
rather the value of PV. Incidentally, PV = version in the filename by 
default I believe (maybe for the git ones too?) but it is 
recommended/required to set PV for git recipes. So in order to pick the 
git recipe, you need to use the PV set inside the git recipe and not use 
"git" along. I believe this is what the original author wanted this 
example to transpire?

Cheers,
Quentin

