Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D62C5AC7A
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:42:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18853.1786020133943842754
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 05:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QCEj8J2X;
 spf=pass (domain: cherry.de, ip: 52.101.66.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UILGZGvst+sCaHJrWCKn2MHgPuQN6DLsjwhwlnkPevslOSWsP3bVIOoPccIJzq1MMwR0kYJT1+gdCT7wpBIc/kCYKScqDZjCktH/8G7nP96P3ngoJajMLQcETynx3AHhVNNtMTcWa6wVd+qaQZY0NnK2+7p8M2i6hH9ea5gSQbzNIIwuauXCfG+c89duaLjV0s4xN7df5rivN2NXOW/yzA+pza0/A3zyZ55LiQS/V1VsI7SKBFZtjuESJ/WaCUqGycaLw73Ni4lJZpyP4v8JiefuP5cVuQhVieCvjUml+8vOnUpKBPd0eehrkbl8OZ6kIN5TV8l8JqFQNoyRXZvGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsaR/ideY2MMYGQ7aTcroj/S15ijaNQnM/kLW73BMzU=;
 b=X/6jTf6WmUzl+1lItW0bAGDDZm1/gU2/+sK4cf03LaUdNnoBqKSfMeg62kNu8cSdjLdB37GVQIsoN9dA95d5T0375gPkttdqoO2+kIe18YHaHy+hXC2WkzE0L2H4sJySJ4hIv2oS3Lrr6+6RNBeLu0pcwYdFYIrI/8cOdY4GEl4NaBp8TwN5gcUsiBIkKnPmjrl+PKzIeZg+mb9EBYBuThNhrpFb7/10cvEPmKV4sGdTaG/fyQI2IsFgTM7QceSeKO2fKHIz9ImIAnBd/LeRQZAyiCNwkZo+drqltsx4s8DFDdKeUo9ScaU82V/l3Oey6aTc0UXf5O5w7s2gAlAesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsaR/ideY2MMYGQ7aTcroj/S15ijaNQnM/kLW73BMzU=;
 b=QCEj8J2X2o4RVz4WwxWe9VcaEYKIJyY71z02QiMsG4vDyLKHuBJhyaARmcmJpuwXGg8+edkYgAHr+VgVQBTjQfgPuaNUFQooQSzyNggHnY1SjgnWntlWS6BxVPHs71qgGe9TEQdgBMuWkUgkppq1OzszpkK9A/Cla18n39kRYUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com (2603:10a6:20b:288::18)
 by FRRPR04MB12571.eurprd04.prod.outlook.com (2603:10a6:d10:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:42:10 +0000
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5]) by AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5%3]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 12:42:10 +0000
Message-ID: <2afe491a-cde2-4d5f-bf1f-4547407e675a@cherry.de>
Date: Thu, 6 Aug 2026 10:44:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 5/5] sdk-manual/intro.rst: detail differences
 between standard and extensible sysroots
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
 <20260729-sdk-clarifications-v1-5-661e65201bc7@bootlin.com>
 <c4107ff7-d2db-4da6-93fd-4eb850403f31@cherry.de>
 <DKCMQY8VIU9R.23GVR5E2BW4AA@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DKCMQY8VIU9R.23GVR5E2BW4AA@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PR1P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::18) To AS8PR04MB7733.eurprd04.prod.outlook.com
 (2603:10a6:20b:288::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB7733:EE_|FRRPR04MB12571:EE_
X-MS-Office365-Filtering-Correlation-Id: 68322a78-a4c5-4716-2ec1-08def3b82215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|376014|366016|6133799003|56012099006|11063799006|10067099003|4143699003|4133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vXfnRFjQllwYZAV3kdTVe7OKuDxFg28JstDSEjDGQHpLKpqjDJo2p5JZKD3S12GW7puIYkz4PF+xGWqFcgpkMbiirouAiLPplrvBjhcADKf5k1tOJEs76/zrSlZk2vnKPCxNEMyHBNQLjzM9fBv9KDVIcEBeNOBra+4lfJSa9VT3x/vdgzg/1N92fIKLqUALfrc7liRoZ7yM8lzOHcpTZNn2GMVFzngurYWYG456FW1DzgRahocDzLx2ESP5qWULs0lPehngz4RRlnHzxtJrWV26fQAe5RY0OelWNqPTkm125ct0kxl3EbxjMhEajxdj0eFjdcS8p63JfZVNjZYSMoMYSArv0ovcA7RByiWe8VqfeNtx6yQ5xzmJETKE3XnjZ7nefQsVQ5nK123qU944cKq2oW2lGhEDV+H1YBFJ/Vi3M1Hzitch3eeww1q4BTkmeP7p4q/6tn58pifr7/ieglvgfSw5ckZB6lzZUpJHuPNHfogytRaCb2B8zDb5cCDFpXsFwhnfME3A2RSaZTL3fmBvOp0qD0z/f0E2TxCHAF0yI1sfLrrUjvxTrIVh9gmQgatC5mtD3Ln4vz76D/0eeibDlnYqge42rvo3CkgM8CCKlG4qDndSzbkEVfcLVS0iPqAsxJdBItNLa9v9iB1QSdUT5WpiEjmagqsh3+d+NyI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7733.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(4133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHFXbFlDL2dHbmFNeHZrcFNJRXBQTGNnelA2R2JVT1RhTGVXT0x1QVp4YnJ5?=
 =?utf-8?B?Q210QXphQTgvQnEyR2E5R3BIYVRpa1dncFQ1amhTQytDL3FmTVdLTW5nZEkw?=
 =?utf-8?B?Vm9Kczk0UW5HVzRQQkpmaHdmZFA3eEhTRVF5bVBsZk5HcjZ3VnMvYUxrTmtP?=
 =?utf-8?B?ejZTbXJoRStIV3RKSEt5WXRGY01nVGFOSHFxZVk3N1Zyc0dNd0VlYUpFVmYv?=
 =?utf-8?B?eW5Ib1A1MUt6OWVTdk5ranp3TmphNXJ2TFZVdmlwNGFCYjhhS3J3ajlwUU0z?=
 =?utf-8?B?cVVyQWpkVmt3WXhCSERHcks0a1dwc3hhWlh6TGVpZTk2NWliUDNzQ0xvcWpK?=
 =?utf-8?B?eG5OTlo5YWFmNUZEZ25kblp5WGo4aFp4VEJ0NnpRU3loSG5DanNORmorNWFw?=
 =?utf-8?B?cUxLYVlVMnV3MHZidWczWlN0RFc2NnJucU5EZFdodCt0Q3YxOTdKZXVNWnkz?=
 =?utf-8?B?RkFDOWRVOUNlSWpsUmFnWHpDcHNLQ01QTElEWFVtdXE4b09vQklDK2h1U1dJ?=
 =?utf-8?B?MVNoWDF3MXE4ckJjbzhYWnlzMjFQWFVzSnlOdVBnazVXeEpNWnUvWnhpZ0c3?=
 =?utf-8?B?YXNiUzFTbm5oU2ltS1JRWTg2YlpyYSt1cXZMUXlVOWp5U1VISCt3VTFOM0Jq?=
 =?utf-8?B?bGx2bHBSdDd3QmgzNXgzOUw0RlRmb21UanBXazBOV0ZqZThYbzZHYjFGaWxi?=
 =?utf-8?B?UEp0MFFJL1RGaElzT0RwSWNwaFlmSERES1FOeTh1V3dwWGxWekRvSUZ3NHJN?=
 =?utf-8?B?VU9KWHpXVjNyT0ViZHlwNjBpZFJMeS9kRDByYUpBcTM4WUFtN09aNlZBcnBC?=
 =?utf-8?B?K09lL0lHSkQ0Ky8zM1RkVEJ4blFBYUliMjNkOXlEdEYraFdLNU9NYUhQRmdl?=
 =?utf-8?B?R0ZCNnRGYVQwNHBzbTM3MEpoYmI3alNDMXpOajFpNDZ0SlJFUDdYYWR4ZWd4?=
 =?utf-8?B?cVR0L0hocC82RGRnbmpZakltWnN5Rk5NdERodFc5bTJ6QWJBVkFlbVcwQkZy?=
 =?utf-8?B?VlZKK3Qxd1RLTzJNVUhKWkxQZWxtaGVpcFBGWDZzOTdlWG9McmxvbllNZjlM?=
 =?utf-8?B?N0lCdXBIT05ZbVcwTmw4MzBqTzgwVi9NOWdOZUxPYTFvMklFeW5pU0wrb2xF?=
 =?utf-8?B?SDJFU0hqUGUySnJzMEZUMEprQWZOZC9wbkVkNnhhZ2s1NlBPMEZyYlp3c2tz?=
 =?utf-8?B?Z1hDUXZIWlE1OE1NemdQZW1zR0FheUFWZXZ2MHNxYTZkVGU1SjBsNy9VZXZF?=
 =?utf-8?B?eC9Sb1RhV0lEb1dFRGZHejVsVmR0T3I1R2JLQmord1VHQVJ2bWVjTy9TdmJT?=
 =?utf-8?B?UXdFSEZtS1g0VUtwYTFrak1VNEVtSXAraG8yUXhrWXlPTFVadmZpWVYweUE1?=
 =?utf-8?B?ajdiY2RGTW9jcHMxMDQrZnBIcEZmQWZVS0htRGwyVzhrZWNCbDhZQjRCRG56?=
 =?utf-8?B?YTRLODVnOGFBR0VJUDEycGMvZWFhVGRhaXRveEJ0YVozWU53TXYxMUxOSjFj?=
 =?utf-8?B?aGU1REpJcG1oc3dBY2tsdEttUWtXTmZzNVFMT2hmdDZjbzBzNEJmb1I5T3c0?=
 =?utf-8?B?K3RUQW4vTjhaaEprRFlFSjVlaEhqR3pKcHpjbjUvV3FjaUhzM3h0SlQyaXJv?=
 =?utf-8?B?c0lWenBKbFNjcFJnb2F1dW1saXlFUjlaNGhhS2I0OFRyRUZTZ24wWnlPRVhs?=
 =?utf-8?B?OStYeTZ6TExpb2w1bU10Y3BzQlQxV29LWTdWVXRHTjRjQVlycFRtRXAvUFRa?=
 =?utf-8?B?KzQ5bUJWdFRGb3FkNmhTQ29nMFlKLzFYV3NXTDJxQ2xWSDZZbENDYVRQZzV5?=
 =?utf-8?B?OS9zWXRMaWNhNEk1V2kybXFZRWJTeWZTTmpkeDAwWGZSNFdkRmZ5QzMraEd3?=
 =?utf-8?B?V1lvNWlqdzh3bElpb1I5MEU3ajZ5bEszVEtRS1hBRHo4OTVqS1VTN3d4Ty90?=
 =?utf-8?B?T3V0MGEwZTI3eWZPQWc2K0tDRjNUaXJ6c1YvbkEyNHJzQWlGeE5iNmNTckZ6?=
 =?utf-8?B?TUlpSW9vYWE5aWdqVHd0dG9RVTR5L0owZWF3QjFIZ3B1clkrKzIrNFZyZXVI?=
 =?utf-8?B?WmIxVlhMNVgvOG15NHl3TWhJdVJwVSswSEdxSFZPZ3FCcUVxbi96dUoxaEhV?=
 =?utf-8?B?aDhDazV5MVgwUC9VeE0wMVFOcUt1b1Qwek02eWlKS05LRmdkcHR1YUNUQnNm?=
 =?utf-8?B?NTlPNW9zdlJuQkFBQmlDV2hubWZzZ0J4ckplSTVKNU0yd0VKQmROMW81UkpK?=
 =?utf-8?B?SUNNYUpUSVRNYzNnb1ozckRWdm1SdkN1cFZSMENyYk15WUt2bHc1K0NGSy9Y?=
 =?utf-8?B?UjF2UUpjQVROUy9iRnRyVUZqdGtob0ErQmlkaWpKK2ZoMjNWTHZCcVdINEMy?=
 =?utf-8?Q?ZgRmSYnP2Cz1jgKm5eOwpqXWIwN43NsW1m+/c1zJ0fiKX?=
X-MS-Exchange-AntiSpam-MessageData-1: 8gQ3ZYYKzd0zQG/4ltXAsR+EksJBlRtRU4I=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 68322a78-a4c5-4716-2ec1-08def3b82215
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7733.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:42:10.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RomrrTPlvNEY/WoU26v/cLTAId0eKUW9O7FMHFk7ZY6SQTlOsFOd67ko+dTOJgOTlJ/Ykf+4H5C0WRDwy+g1e8X/eY3HT2Rb6dnPtwDoXtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12571
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Aug 2026 12:42:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10238

Hi Antonin,

On 7/31/26 10:56 AM, Antonin Godard wrote:
> Hi,
> 
> On Thu Jul 30, 2026 at 1:39 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 7/29/26 12:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> The sysroot in the standard and the extensible SDKs are managed
>>> differently. Detail this in the Sysroots section.
>>>
>>> [YOCTO #14830]
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/sdk-manual/intro.rst | 15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>
>>> diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
>>> index 8ccbcfa20..2e5f73f0b 100644
>>> --- a/documentation/sdk-manual/intro.rst
>>> +++ b/documentation/sdk-manual/intro.rst
>>> @@ -123,6 +123,21 @@ sysroot is based on the target root filesystem image that is built by
>>>    the OpenEmbedded build system and uses the same metadata configuration
>>>    used to build the cross-toolchain.
>>>    
>>> +However, the extensible and standard SDKs sysroot differ in content:
>>> +
>>
>> Why did we stop referring to the Sysroot term (:term:`Sysroot`)?
> 
> I can keep referring to it, but thought the first reference was enough. Will try
> to refer to it when I can.
> 

I see it like our rule for using :term: for all variables, replace 
whenever we have a Yocto-specific term, be it in the glossary or not, 
use :term:/:ref: as much as possible.

Maybe at some point it'll be making it harder to read with all of those 
links being underlined but maybe we can worry at that point and figure 
out finer rules later on? What do you think?

>>> +-  The standard SDK sysroot only contains libraries and headers for the packages
>>
>> s/for/of/?
>>
>> I think we should also mention this brings the libraries and headers of
>> their dependencies (recursively) as well?
> 
> Correct, I'll add that
> 
>>> +   found in the :term:`TOOLCHAIN_TARGET_TASK` and :term:`TOOLCHAIN_HOST_TASK`
>>> +   definitions, for the target and native sysroots respectively.
>>> +
>>
>> I know we have a nativesdk OVERRIDE, so is it still a native/target
>> sysroot or should it be named nativesdk too (I've never built an SDK so
>> I don't know).
> 
> So here saying "native sysroot" makes sense if you're only look at the SDK.
> Under yocto it's true that we have a distinction between native and nativesdk,
> so maybe replacing "native" by "host" here would avoid the confusion in any
> case. Will do
> 

Yeah, we just have to be particularly careful when using "host" and 
"target" when meson is involved because it has a different meaning than 
what we have in Yocto.

>>> +   See :doc:`/sdk-manual/appendix-customizing-standard` to learn how to
>>> +   customize it.
>>> +
>>> +-  The extensible SDK sysroot is completely managed by the ``devtool``
>>
>> Can we maybe point at some docs for devtool? From a quick grep, maybe
>> something in documentation/ref-manual/devtool-reference.rst?
> 
> Agreed, will add that
> 
>>> +   command-line tool, and its content is the same as the sysroot of the image
>>> +   recipe for which the SDK was built.
>>> +
>>
>> I guess we could show how to do this here?
>>
>> I think it should be something like:
>>
>> bitbake my-image -c populate_sdk
>>
>> (or maybe point at
>> https://docs.yoctoproject.org/sdk-manual/appendix-obtain.html#building-an-sdk-installer
>> ?).
> 
> Since there are already references to appendix-obtain and appendix-customizing I
> think it's already enough?
> 

I see you added it in v2, thanks :)

Cheers,
Quentin

