Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F44BC43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 16:38:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39248.1782491916712598795
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 09:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=g2EKL8+Y;
 spf=pass (domain: cherry.de, ip: 52.101.70.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzwTYkhxEW1HMJddXUIjcTAcdDK1eZRz382/gUoYfNlSmOpYwqArZdQFzADukNJdUv20ABVTrWGmI1PPpTYkGZnq4cdVLtTvDylSJ+AiM5ZFAmJIrsYZkULgb4DA2P2vV1XtxRcbjOwS7O0c2Ph2noHF7z/qfatN+22HUbzOJ4lArZ6g6FcaVkMGbVgWqxr2buL4oOzIkUW7FMV/9RalWStZPQKBuHNfAbp6hha2aLv35Zh9im0n/Xt4rPqm5yVBjiKV6ko30nRaJlxqQpPqz1bLMNeHZa4ufjWgqzj95x8LOxIrToVl+b2iV/69l7ueTOh38S+UiQAyUEPC7MYn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJN1y5AqFDSkUcm00ygGmJt921z++0rCbTa3teB8ZOk=;
 b=bNviQGoMI07FaYd7mFIVeAIYqLPsYUbm1Bbcn5RZiv1NU1MEBFA/FqSHWfCGNVemcWJQLuLJufUQaPLSQPfgIG1P5ppEpGz4Qk6qo8jYUuVZJTZnN1GgnfkpwTyveyWZLBK7QCtPxTRD0eU1sIZNF553Tg6rkJgJbURgAkZqo4xZp8xAcOB+Kyz+KrXrthZhxJqd0IjveWVSGxJv2sev81AjwMW1xM02PpLs6Q//SfjzsejDbQC/fhKCUZcS23thyH1piykUqKCxbIos8VBsI7FzTWfXwUi2A6QV+TbN7EV4Ec8tbferAqJz+0/mNJ2/Gv5U/oef2ZsJ78YUasso2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJN1y5AqFDSkUcm00ygGmJt921z++0rCbTa3teB8ZOk=;
 b=g2EKL8+Y2R0l9tAxexQgjAFgicpa3V0m4Sqwn/mpXJJOwCOQQ/UTbJRyZ5vMA3ScgPts5HnnGM5MvlbEEnVNr9y1ivMfrSUyQPgqgtGuLrl1f2x4sMsLW9XcKK12giKSiWg9MJ1IbP6Sc3xPRSbzOFTzoUd4TJ7Do/pC3aLi6ig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI0PR04MB11865.eurprd04.prod.outlook.com (2603:10a6:800:2f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Fri, 26 Jun
 2026 16:38:30 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 16:38:30 +0000
Message-ID: <7cd69d55-5e08-48dc-a31b-004ba88f521f@cherry.de>
Date: Fri, 26 Jun 2026 18:38:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <70a7a488-e6f7-3997-230c-ce8deb26308c@crashcourse.ca>
 <eb993591-b3d4-4292-8409-7c7db83841a0@cherry.de>
 <21e3387b-3b80-34ac-6744-9b028a5c282a@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <21e3387b-3b80-34ac-6744-9b028a5c282a@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR03CA0066.eurprd03.prod.outlook.com
 (2603:10a6:803:50::37) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI0PR04MB11865:EE_
X-MS-Office365-Filtering-Correlation-Id: 81260ed2-3a2a-4696-36b4-08ded3a15b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|22082099003|18002099003|11063799006|4133799003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	DdrmIRBgN+psIpOJLnRH98zq/FqhP0WUF4QFC9FT2nDVCEtBMaHOUwryPmJG1/emf62mpbsDxmJOVrF5bYiG8mtdymDBV82QQ7N5uxRLkNVbmi2bK2Ak+Srss+6LJOUUBEcAXmnopLG9q5A3gSGrMtrGhakQaDEWs5dxsCv3hYeTl03TlUpzOvHuK6gTL1iZNLxHyp4sOSAnUYHIB0+UCfuePLAoKYy4cgrG44TxsfptuqBuQ3K32bAkApKAUm9WdxsYx/nyqWv1R5qX7alrqeIencT5f42rXLs6U5UX49Gx+FH7zWVQNDg6l2r3A+zOFqDNehJKv2C3pFvsB+3FRAc3o+lSwg+N/PkMoTm348J3NqhofXiJ7QGCmn9uP3q9FIC/c43ZywH9FEmqI10y4PV0Q4gRfdiJs2BnRe4+LJ6Olhn4WeUK+59BS9iSAVIHCWX1gcdZzXw3Sq+E7c1Aw6PF6q+BehuXhU/G7NXoWPwPc7XAeYQIIL2wM95VQswlGjIbalOmZqbsFF9TJhwzmsUYqaaQSIsJMjmpllBlQZMb9zqPJWkMvFNXL9lE8ySHXAyoiFbxJaUGg3eZ35Wz5VFsevLURX/wcNs4t+C3Dgh5Daa6WuMa66s507G9V8Rhrns/nwjQku4xwxiWb+O9t54b7D+aHVniNo9QDuOp63g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(22082099003)(18002099003)(11063799006)(4133799003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ck1iZjB1US80ajJoSUhGZ1Y2TXd3a09MWVJxQ1ZqT2x0TGFVcHdxVDZRbVBk?=
 =?utf-8?B?WnNxT3RKV0wyUHpTOWM2azF2ejRNUjEwUG96eEJvNS9SMUVaUG1HQUprbDhS?=
 =?utf-8?B?dUJEbzE2bzBldzZHVEtTbFZFbVByTERKUWhieWdqMjFzQlYxMEY3WnJFbEVU?=
 =?utf-8?B?clFPRWZsLzVjTzhjd2piK1dnM3R5ZlE0SkRwc0lXK1pya0xIYUkyMUc0Smwr?=
 =?utf-8?B?Y05KejNydURIV2ZmSnFjYjRGVDQrQmo2dHRYY05FU3NnamMvaDVuRzZTeDV6?=
 =?utf-8?B?WG9DTlNOV3RVeUdqQkZLNHJIMlJxcjJiVEgyTTgvM1R4ZXdzRGJuR004cDZt?=
 =?utf-8?B?TjV1ZFRxOFF0ZFZjM0JvYnJEMHltMTZtd0lQNlVkdnBrdlIvaW1XYUNwZitN?=
 =?utf-8?B?dGREKzlsWEQ1YnpOWkQ5Sm9JaEpaUEpORUVUVDVFc1pFdGJzU1ZkTi9LckZj?=
 =?utf-8?B?VVMvSkUrc3JQemxud0tDUWtnZlZGdjVrSmQ2a1JHKzJGdVVjVmRUUldvSEhp?=
 =?utf-8?B?cGdyUFJKTVBLMzlCVXdLT2c0Szh4Tnc5WHh4VHdibTlZUGNPRWRadG8yRmN3?=
 =?utf-8?B?d21qdjh1em5SWmpwbEIvaFFrZTdja0hJQ1FMQnFtb251L0tVV1pndnhhbDZN?=
 =?utf-8?B?MWJYQXo2RFJPaXpaeUxxSVN5SnkzRVNzc21rbEZzTERIR2pVR3p5N3JneGlS?=
 =?utf-8?B?UFdhbThua3hFc1F4a29xSVJLaW1rYlNDUW85WXJrb2FqanVvUkFlaEhtN3RH?=
 =?utf-8?B?bUltdFdRSzhwYTk2ZEpnN0Evd1RIbWlsZGtHN0FkT21tVTl0eWNYVHpsbVBh?=
 =?utf-8?B?Q05aeFBOcHkzRVp4NzYvMnpJOHljbnhOODlBWHJkVUdFNS9HaHo1SnN5alRN?=
 =?utf-8?B?Q3k1UTE3YmpGT2xUa0hmNzloZlhSWWR3cktuS3c3b3prZFdubnJSZm8xZWly?=
 =?utf-8?B?OFVZR0ZQZTFLd0pWVGJRT2V2cHUydkI4TS9TOWFOOVI0WEU3TndFQ2s0L0Zv?=
 =?utf-8?B?WHdVOU52ckpJejNnMWpWaUpkT2s3NEhpRzQ1OUlUWHBidzNJOWNjYW5qMzQw?=
 =?utf-8?B?bDdvVW9UcXdwSG4wcWJacDdOckRRSldsQy96bDZWTkVqUEhFMXdMcW5OZGY2?=
 =?utf-8?B?MU9XLzlJN2YzcWN0Y0pvR01zYnpvY25xd3hQNnY5bGdEVG1ZVUlpVjYyRWcr?=
 =?utf-8?B?N3U0OXZmRDRwQ0lOTm9JcUNmdWZadHlxa0lrV0N0dmx1RGFrVWxQSTJkUnUz?=
 =?utf-8?B?aURGZFNmSU5vWlJxYzlQcTRJd1Ziem5ITFVpZU9mVWRoc0hJUllkei8zWDhM?=
 =?utf-8?B?UmlOSXl1ZzRKdFhkS0RyKzJKM1VJemxLNW9TK1VzR0Vzd0lFUVpYM2NRZDZ5?=
 =?utf-8?B?Q0ZTZGVGMTEwa2hlVnc1RTQwUnVHTXI4a1F0V05nb3YxV2NtdWZaM1NNK3Rm?=
 =?utf-8?B?M1RnLzBJVnJkVnRPSVlYK0xvQmN3MkYyZ05HY0RHVnVHTkVJbXE0dHpsdXdD?=
 =?utf-8?B?Y3VGbjR2UHN3eFpmZFFMYllaZG84MXJWZDdLeFRudEYvZ3FhSkxVQkhnZEs3?=
 =?utf-8?B?YjN3dkJZZFo0REpEd2hxT2NSUUdMblMrN201M211Z3Iyd2hmWmhyQzZXd3ZW?=
 =?utf-8?B?WjVlOUFLQ2JrZVRxakVOYlpSWDhJVVhkUUR6K05Jc2pGaXNDa0Z4cHBmTUlZ?=
 =?utf-8?B?UHB2OGt6N1M3b2gxZXBhWlZhTGN2VW54Lzd4OUk3MGsreGxrczFJektCZDRT?=
 =?utf-8?B?RXVycEdBdnR5cmZYNjVjand2S2JpOVloQW5WYzlxY2IxWjdrR25lZGlUMnpN?=
 =?utf-8?B?NjFNNmVjRnJ1Tm9yNEEwbDI2dWVQdjdReUhkWFlhU3oxMUFVbjIvcVFPdldX?=
 =?utf-8?B?VkFNQkRNUnc2YktIampna05hdjRMN3B2bWMyY1cvaUtrQWloS0JndHhZVWo5?=
 =?utf-8?B?YTZoeFhoeVpNMXAwSW1CV2RYRzFBQnRaWFRFd3liZFFRdkM0ZE5tUGhFejdM?=
 =?utf-8?B?WWdwOFNXL3A3RzRFOXRQaGVXUUFLSDFUTHMreU1VTVVUaXdtbUpvZ2c1OHpn?=
 =?utf-8?B?QU4yTytSRVMyVGEzeCtLWlZNb2J1aFRxR0lnZW5DaG9wcVV3UWxQaFRLdFY2?=
 =?utf-8?B?WXdkUmZMK3Yzejh3Nld2S3h5NFU0d2UwY2MrSGxmOXVlVW1wZHgzL3FoaC93?=
 =?utf-8?B?RktxWTBwZWhkY1poRU1wOFlyUjI4TCtNQ1RXUmJBRXAyL2pzSkR4Vmdjcm1R?=
 =?utf-8?B?L0xac0xLTW9UVEo4aml5ajJqYnI1S05UeVJnWWVQSGtTZWVGMG5yRmhXdVEy?=
 =?utf-8?B?c3ZFTExaUDRxUFdjUlh6U0tDNHNPenl5bmsxN0NXQURyYksrbDNIdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 81260ed2-3a2a-4696-36b4-08ded3a15b00
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:38:30.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9alOn88hByB2EsE/rHxFLjhYRcwWXqGgCgB4E7ghIXFqJN2NtVkQl6ATDl/j/LfBI/VnqIKkO0uKe0WGcD6EuHY9OJghe5gWjbUvqWRcbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11865
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 16:38:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9911



On 6/19/26 7:10 PM, Robert P. J. Day wrote:
> On Fri, 19 Jun 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 6/16/26 6:46 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>> Warn the developer that if they need to set "PACKAGE_ARCH" in a
>>> custom packagegroup file, that setting must precede the "inherit
>>> packagegroup" line in the packagegroup recipe file.
>>>
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>>> ---
>>>
>>> diff --git a/documentation/ref-manual/classes.rst
>>> b/documentation/ref-manual/classes.rst
>>> index 95e07f85a..839a89d4b 100644
>>> --- a/documentation/ref-manual/classes.rst
>>> +++ b/documentation/ref-manual/classes.rst
>>> @@ -2130,6 +2130,18 @@ section in the Yocto Project Development Tasks
>>> Manual.
>>>
>>>    Previously, this class was called the ``task`` class.
>>>
>>> +.. note::
>>> +
>>> +   If you're defining a packagegroup and need to set::
>>> +
>>> +      PACKAGE_ARCH = ${MACHINE_ARCH}
>>> +
>>
>> OK so reading this I was like "but who would need to do this? packagegroups
>> are only supposed to include other packages and not compile anything!
>>
>> Then I looked in OE-Core, and there are as many packagegroups with
>> PACKAGE_ARCH set than without. It seems that the need comes from using
>> MACHINE_FEATURES or other knobs that depend on some configuration variable.
>>
>> I think it'd be nice to document this (if not already, but since you're
>> scouring the docs now maybe you'd come across something like that?).
>>
>> I'm thinking this is a big enough footgun that we may want to document the
>> order in the variable glossary as well.
> 
>    richard purdie explained this once upon a time:
> 
> https://lists.openembedded.org/g/openembedded-core/topic/patch_4_4_package_add/87011325
> 

That sounds like a great thing to add to the docs. Both here and in the 
variable glossary for PACKAGE_ARCH as well I think?

Do you agree? Would you mind sending a patch for this?

Cheers,
Quentin

