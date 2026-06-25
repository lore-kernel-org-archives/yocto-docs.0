Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0A2CDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:40:26 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6758.1782376819176457633
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 01:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lrMN5LeE;
 spf=pass (domain: cherry.de, ip: 52.101.66.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHCdcAPMFM8zLUyQXcSsQqNbJgIE3x+48rV7K9sNclS3GYXbxdydZkr1mdsmotwn2x9uxmOQL/+MwuFACLHA2x/Q4MkEn6JpuZ6EK6VGKjiXjoCjzsUhBt0cDmm10beVJgB3lFNJnNR3fcNt/JN9aTWrwrXYSbX4pCa8gVOFn/R/exxRE1Uy0/CieuFGclpiIHjkNXmwQby1PAAAofo3GXrYt3+sWq74Z5oAxXHL0tKu28rzTXDklYU5IWAcFPAhy1KW/skbWvLUFEXw+Gru+In0T4ea7GzE9dBKTDrYx0Jx8m9xatcWqfVNGaq+yyAg4zDW93iCR9tUJ3JciF8yrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKw0BIZlHOssAQ8JbgLDYakRsz21stKD6adoNpdOqHA=;
 b=ljpZkHTdOjcxSl9TvpiYBR+cDiWP5X2cTbqqqlPDQIMfnVu/qA8Elr9aGrSFZXhyvcJ9tdcHC1HLCg+PhOCTWscfWSWD5jxxaYlDFAh7o1HN79OFRoEtIjIHKaHWseRDm+xWuXX5bogneB824FTWKb1OkU7d37AuXzgnoe00g8iIzwfyeRloZ2tPKwDVgtsoLP1JKQzVDv5MNzHWbY8t8D5VJTR59MtZA/HNnIk/sHimnvFmIli9qJVDuEny5VeALdVo5CzyMa7tUJDCnPLjg5179bVwFkJcY3tZBJXaCBFDu3gqolApjWmaKi/TOd3ZxGRMqPhf2jxS/SPYGOd/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKw0BIZlHOssAQ8JbgLDYakRsz21stKD6adoNpdOqHA=;
 b=lrMN5LeEQBODCTzxBlyV/9gOYlKOtZ3TNQixwMKHeDU7/muxCleKG0eJkBCRN0yUZDfOnteOIWDYklHWFdCogCu1HgydfTgV1hxBU+LobPtiWDhRcV/lNHGI72gnXjj6gOgsu0LwhjFKtNLd7GE8D9j8yePt6H1yTFBhJz+JhQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM0PR04MB12075.eurprd04.prod.outlook.com (2603:10a6:20b:740::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 08:40:13 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 08:40:13 +0000
Message-ID: <80bbfc30-3b10-4871-bc56-7c3af61eb50f@cherry.de>
Date: Thu, 25 Jun 2026 10:40:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] why not rename "Maintaining Build Output Quality" to
 "buildhistory"?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <4871863c-1d5d-1ff9-2918-a2d9c6e19041@crashcourse.ca>
 <cfc70f67-3220-4766-ae57-035f66eb56eb@cherry.de>
 <5611a1fd-167e-a1a0-c644-7e92248a6afe@crashcourse.ca>
 <75af20a8-4f59-4106-9cf1-cc750afe38b7@cherry.de>
 <7d188280-b5cd-f8a7-3d8e-dcf1aa02059b@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <7d188280-b5cd-f8a7-3d8e-dcf1aa02059b@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIXP296CA0032.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::15) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM0PR04MB12075:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a432cef-78ff-466e-1ac8-08ded2955fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4133799003|3023799007|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	bLN04SW8s7yGp9xGMuy+xjd8SA5Wi9KyyxORtLwD1afArGWwlK+576Dd/K0huShfRl1gpWC8gsSUo+CnSutT+8CgyOljLPfcx6rcOpqXjl9IyYI9s3apVrviKKRtzT7fwWGmnmumyh2KN8/j3F/VJm5T14i/wEdd3AaDS2tpR5tqi/9kZJZTu/ZzniSG0x4OmdpaTiw6QpL05j+5zPbZU76APo13SpG8hPBoWpwpuZ0UOqTcYd4g03y92haknz4qCG3n/Q2qV7Cu5ujH69kvBRmtlVofEe/yko9BX1ft7GB7RiWzXJYVyYhJR/FmB4s6EJxLxNW9fMP82Bo2tQRiESTIZNpmySpYjzd2YK4a1F0WkF7K2X6BQ1jkQYRyZa64slqSwnCsQmrG++dGekqe3r/+qmXaFSaw293CgwrQ2M9UtmU8fitIGIbVaPWxFWBes5/zjl36p6/yjhwJZTJy7PJ3Q7NOC2v1rk/NpZkHDMmrSwtLO3yOol/8nwD9+nOGIsNHvTfH4e96yuj7bCNZxfagd3IXVK9wQF3Gklko7NtsGTQue60J6V/NGxgh6C+eF6q1dqyvyTAvH38pyjoCB2a2lTUkSRYZCs5Gp6WetmlhzVUH7oKU4em3kmA7ONKgBBRxEpJLGaZIUFsP9rtVG/TpvH4RHWHwgTbL/nQBbbI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4133799003)(3023799007)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STA2NTU1cnMwYVViWVY0WWlIQnFHUUQ2V1Byc2Y1WE9VT3VrMVpqelRVby80?=
 =?utf-8?B?TjVHbmVNTWVWdE91U1RYT2EzQlNxMERmQi9CVitEVTdlMXF4Vy9kZEZQa0Ir?=
 =?utf-8?B?R3ZGQTdzT1JBMUU4Q1RaazhHeEhObGJQVFJ1cmlUeDhXdXVueU5UOUEzTVFL?=
 =?utf-8?B?WDBjRDlRNDg5Q0c1ZjU4cE96K1daSG9icjhScE52Y0lDdFBsWkxpSnZ4RWNI?=
 =?utf-8?B?UVh3Q2RGbUhsemtvZTlSMFNpbCt6UHA1ays4OEozcE81RnlISWpPZFphK0tX?=
 =?utf-8?B?aVUxSXcxblc2RTlocDRzYkFyL25LeWd2QUk0bEN0WkRFaDl2d3E2ZEp0RkVj?=
 =?utf-8?B?U3hGdkdOa2Zjd2ZyTTd4cEpuclpTSzFzNlNMSktsaWVWUE55ektlYmprTEE5?=
 =?utf-8?B?S3hXejVKTVlCMUp5TG5VZWdEdGw0NXJhTXRORkE3c29NL1BKYmtVR2dyZm5m?=
 =?utf-8?B?bXBpZmtRaXVwRmRjTnZhWkRDU3JXcWhReGp5MGdXR21jTWhWb01ZcUFxZGF5?=
 =?utf-8?B?TERMZ0hPUmFkTDhYUVJMSmViMjVxZWtKTmhTak0wdmtlNU53bDJNTTJIRUJh?=
 =?utf-8?B?akpFK2VDUm1IZXlzTHFsTlBPa1U2Ny8zb2xXeENjdUI3eHZPOXhvUHdDM3ds?=
 =?utf-8?B?SENKNDVZRy9WK1U2d0xqQzlVZ0JraER4Z015SGdFbDNTdWJEZ0VqdFRNSVlD?=
 =?utf-8?B?VXFuazdRYU9XTVZSYjRBRFZ4bWd1RlkwU0pLNnVLTGFYYStoZXFEdis4SytJ?=
 =?utf-8?B?OG1uZFg5N0JMZE91OCtITzJtT2h2dXFBQXhuLzEyc2k3dXl3eXJMdGgvUk5C?=
 =?utf-8?B?aGVqVlZLc2FSSGdKK1J4ZDdTdnphTWxyUWVRL09jTnZvZUN2NkEzaHRXUnhR?=
 =?utf-8?B?TXdSNkw5enU3bXBSUVZSSTVYajJHUW1naDFBZ1pVM3NHREMyRVRkU0twc2lR?=
 =?utf-8?B?S0pOcXY2U0hWM2g1dlVTSERKcEo2Um1Nd0IrUlVhWWdYeThOYVdGR2xrclBo?=
 =?utf-8?B?WTZ4UHJNZUpYckpLcUpuUUxhYlZZK1RGM05ZTVRNTXN5bGNFM1JCWnNIRlRq?=
 =?utf-8?B?eWYrT0JmZmoydWZHZWZFK0JuUDNOejZFaGRHK0VoWU1EMmpralZkMGFkVFBB?=
 =?utf-8?B?Ti9mcmFlbk1yQmc1YWV3TmZuYk8rK0xmU1BWYnM3R2Vyb0FzZlYzeWdhczV4?=
 =?utf-8?B?dld4QUVSbGliNVphUGZvMmlUYnlSTERKRXFVMklsK1hrbmFvUE1xNkR3SXVh?=
 =?utf-8?B?cjZyRU1GRFY4SjJXd0lMYWNOdzZSZnUrUHdaaHF1dmtYQmNrNU1VdXNjRFI0?=
 =?utf-8?B?ZHdlTUF6bUd2SFh2OXV2TEJteENjYnhrbEZCNFFsckNyREtBTEVodlpIY3ZW?=
 =?utf-8?B?WDZETE1NZ1VtUjhCVkkyQ2FEaWY0NDdKODBiUFBjLy9KbCtpTG1tbThoR3J0?=
 =?utf-8?B?NklHNzBtcXJNMEs0UXpCK2VucXo5SW5sOXozNjVoSVZtNG5PcXcwRUp5ZFN3?=
 =?utf-8?B?ZTBVSm1DWng5MTRyNU5OaWRZZWZBc1hqOVdRTlFuc21GNzN2SFZSTzdWME45?=
 =?utf-8?B?SGI3dHNUMzk4TjJ4TEp0UWo1SFIrYzlOVFNjTEU5VkNmZEhKUWtxVHRoaUhC?=
 =?utf-8?B?T3Qxamx3ZmpHcmw1YlRMY1BHT3NwaU9Ta3QwOTMwbjM4YnJUUmtWWHpoTi81?=
 =?utf-8?B?NFVyQlBza1poK1pUUnh1bWNIV3c3TzFxaTVoUXpvZ1hSbkZXajNxWkxQY2Mz?=
 =?utf-8?B?a0NzMTlUUW1NamRyS2NMVWsvWW16bkpYeVRkWWNQY3g2UUFaVWRsZnhvRjFH?=
 =?utf-8?B?bnU0VWpnVy92cVJtZFhZcWlIN0FtYkdiaHhzOEgzWjN1OTA0ekhFQ0FiMnlZ?=
 =?utf-8?B?elI3WmN0N0Q5VW9DbkhEV3FEaDJsKzVmRFJacy81ckhYRnRaZjhubHp3WS9h?=
 =?utf-8?B?YWwvNWs5VWIvYkNhSi8yajY4RjVhbEtoTlpUYWR3cndzR1NkTnhUU0lqOWdY?=
 =?utf-8?B?Tm1Ra0FuM3o3UWw1RGxsSXpzOGFURzF3cXU2VncvU2JGcGxKZlFoT1VoSzhU?=
 =?utf-8?B?d3BaMjlCbWhKSGJtSzBicCt6Q1kxUkpQMUwzVU9PQmtSVTlQb1J4VUIzZHpt?=
 =?utf-8?B?cWxGM25qSFNYYS8rOWhQaXdXK0dTRFZYSVBmcXdpRzY0UURqNHY4ZTJ4bk5P?=
 =?utf-8?B?N3N1NUd3bGVhVFlUb1grczBSWU5Lc0lvVHZJeHhoNHN1VmhIQUxRU1cxN1dl?=
 =?utf-8?B?VnI0QVR3OHBwNlNCenBiN1dBRjl0SktqVlc0VDQvektmM0JMOUdFL0lteS9t?=
 =?utf-8?B?OEJ4U2dsNS8wOXdqbW1CNnlXaFpOS21OWkFBTE5FaUJ0Zmh3d1ZnQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a432cef-78ff-466e-1ac8-08ded2955fbb
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 08:40:13.3824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9hK1PbPWy0U4x6mNNrjwiuf+gAWFMEAFZYgsKkL4Ucx7uRQ5hXM5Ixzx6vr0W/pZUKybiCv5n49FY8cSvxYCX9EwG7qigiy11xkhYfdkCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12075
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:40:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9880

Hi Robert,

On 6/24/26 8:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Wed, 24 Jun 2026, Quentin Schulz wrote:
> 
>>
>>
>> On 6/24/26 11:35 AM, Robert P. J. Day wrote:
>>> On Wed, 24 Jun 2026, Quentin Schulz wrote:
>>>
>>>> On 6/24/26 10:21 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>>>
>>>>> while this section is titled "Maintaining Build Output Quality":
>>>>>
>>>>>      https://docs.yoctoproject.org/dev-manual/build-quality.html
>>>>>
>>>>> it's really solely about how to use "buildhistory", so why not just
>>>>> call it something like "How to use YP buildhistory"? the title seems a
>>>>
>>>> OK but why would I want to use buildhistory? How do I hear about
>>>> buildhistory
>>>> in the first place?
>>>>
>>>>> bit misleading and even a little inaccurate.
>>>>>
>>>>
>>>> What's misleading or inaccurate about it?
>>>>
>>>> """
>>>> The buildhistory class helps you maintain the quality of your build
>>>> output.
>>>> """
>>>>
>>>> This matches the title of the section (which appears in the navigation
>>>> panel
>>>> on the left.
>>>
>>>     because the title suggests a more general approach to maintaining
>>> build quality when the section covers only buildhistory. so why not
>>> just title it that way?
>>>
>>
>> You're looking for ways to improve build quality, will you read a section
>> called "How to use buildhistory" when looking for that?
> 
>    no, but if i was interested in how to use build history, i would
> read a section called "How to Use Build History". you know, the same
> way that, if i wanted to know how to test my packages with ptest, i'd

You would likely search something like "how to test my packages in 
yocto" and not "how to use ptest" because you would need to know about 
ptest to begin with.

> consult a section called "Testing Packages with ptest":
> 

So this would be fine because you have both info.

My point is that the suggested rename is harmful for discovery by 
beginners/newcomers.

So, maybe we could compromise on

Maintaining Build Output Quality with ``buildhistory``

?

Cheers,
Quentin

