Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13152CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 09:34:16 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.67])
 by mx.groups.io with SMTP id smtpd.web10.14077.1760952851617609623
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 02:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mmUTAerI;
 spf=pass (domain: cherry.de, ip: 52.101.69.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUikxFXjGooWqxRnB6olfQHX9i/TyFLVpPiug7oJrX7dXYTb45IDvIaJ8ozQ9NqaIS/pbGtJwt5fxC/daSZ2+Oyv9AvQBAbvkikwu/LL41pojB1cyk+9EnI5J2b2+aYuj0U9+Z6GY4z2hUT5u1VwZ+rokTqmRy9zgHTuqt0pvwD4NLfrLZ02gOcVSgCnuen8AjQ00gU/Gg891JB8hZvDpcIBsFb7YVmrP7dZsnSZNE1afm+cKb7Qd0wvGfKp/8TofLlditX8UuhjN29aVAKojnbWepmq3AgYJ1CyRnnvcwDemVF/t2GGRVACS/BYiGxKh7KPen+m5vKt7RJmDWpaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jxWM/H2r5xpSHYedRaMnJRXgHSmuiNNTZmwvPQ2WPc=;
 b=XEhRPkGiLi/z5INLRipueFOVIwcrLB2IDNmoibzFOaC7DC2vnJsgpetgyyKOqozCeqbIhnBYaTUmG4NugY1+tlA8/VoAm467EmuPDQ8tT2hPuNxNMsFAce9BRoldUeNfeASG2XXMKsp4oNo0aExnMiZzvxZ1hqrWPUAt0Q2HckW3eHDNaQf9HLlsGufGoynBsrVKH1e2Cfgd48Q7CtTAaCWnt/wPsTFWJVhutYQcTw3WtbWjmkzA9Th20ECsrJsrMkKJfzNrSG3tAQ5vvF4qRbwkyRy9zfQryDdJAkgDRHjf6fGbr5Yu7gHwDpAhuYLaMeLoMCUrFvPRTpzTPt3f4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jxWM/H2r5xpSHYedRaMnJRXgHSmuiNNTZmwvPQ2WPc=;
 b=mmUTAerIq5vBTYfkN51EKC+F4jNdlNaEQiBwEBfNhcmIJLWOHFTjUscccOyKxnCCvcVtCsI9p92WR0W47xREwXomNjQ2rBhfkzshAwJaSifzYGYJp4mM8jIUBUfDhtynUhp0qPlS1wqtOaylfAtVIIIW4nuizYZoq92FiTxxvSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 09:34:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 09:34:07 +0000
Message-ID: <e0f16bec-0d1d-4198-a74c-020c1227d63d@cherry.de>
Date: Mon, 20 Oct 2025 11:34:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 10/17] ref-manual/variables.rst: document the
 USE_NLS variable
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-10-20f21db1f93c@bootlin.com>
 <ab7f8415-16fd-4abf-8cab-8c3245541f1c@cherry.de>
 <DDN0T777T36V.3VTU8P3CNGR2P@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DDN0T777T36V.3VTU8P3CNGR2P@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee84f31-506f-44af-be77-08de0fbbd0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VEtPWkwxU2NLbE1jc0lXcGc2VThtWmozRXhJNnVkZ0pkQXFnRGZvMDBaem9v?=
 =?utf-8?B?N3dNN3JtUG00NGZLak43MjlTbVIvWUFpbHZpOXdWVVdZdHZXeFF4eUNnNXkz?=
 =?utf-8?B?WlBHczBZYnRCTU9JcVVrdHZnQks2K29EdVRCSnh4Sk5JWHpldkFFa3d0RGY1?=
 =?utf-8?B?THdRa2JzRStoajlMb1NrempiQ3AybWJoT0pRV1h4MGQwZ3gzdHdZMU5FOHlZ?=
 =?utf-8?B?TG5RbDV0RmhMT3FSMXNSTjI3bGZsb0hLcFNLNE9XRlRGVEU4ekVGb0FuOEw3?=
 =?utf-8?B?QjdxNFJxKzdyR3ZoVEJyaENTTWlyam83c3RiMVUzOTdnT2diMnR0TnBhejEx?=
 =?utf-8?B?eUxoTHEyYWZFK0l1bDREd3hUdzk2amUycDhES2w1SDNrdERHdlRXS2QwNlds?=
 =?utf-8?B?WnlqcTNZd3QrbTNUblJNNEpnazBnN2RETlVPYmJZNWdjdGY5VGNCV2ZoWm8x?=
 =?utf-8?B?M2R6ZXBsdHJRN2hzZ3lhNWdISGcwYXNwOUhSc2ZvUlZ1T2JSR0VhNG9oV0pt?=
 =?utf-8?B?WGNZdjY2QmMxZFpLSE14cld4UG1VVVdidTVOemYwcUY1WDEvK3BjR3pJVnor?=
 =?utf-8?B?cTY2YzV2UjViTVhVZ2FNN1g1dHNGWlJqYjc5blUyc1MvZEJ1R0lmODhmYWpP?=
 =?utf-8?B?c2F4cjJVWm53UnExNE5BUSthS2tnU1JhNGdRL1VKR2twOXV0NTFZVzU5STVQ?=
 =?utf-8?B?SlRYUUcvdDFkVFZMUXFoQzM3a3QzcU1VbVhvbVBDQVVkb0lqMUdlRWFmVDBP?=
 =?utf-8?B?aDVLZWJRanlxRmZRZ2VPd3JTTlc3Sk51bG9zeGUzSklJWnM2Z1dYb0VhOUU1?=
 =?utf-8?B?WDZoNU1wVWNwYTE2aGk1T0dEY0hZK01HWi9hcWJKZU5NTzM3eGt1RlhyTDhV?=
 =?utf-8?B?NWNnS2ZyM0ZKNlY0V216SmpmTm9vK1ByQUJXNEJ1MmE5VGtwWnd4QzkwcHZn?=
 =?utf-8?B?YTNUWW1FVURiKy9SODBJWFNkNHNKWTlPeGhzRThLWS9FYWpTa0N0NnlmRDBn?=
 =?utf-8?B?em4rYXZNWjZEaS9FQzhqTjY2RXM0R0E1bVZkaDl5UFEySFdveWcrZkI5L2Fn?=
 =?utf-8?B?blJ6U3ZwL0xhSWJhSVp5MzFyNS91dDhyN005UjRTbllTZnl4T05OeElOQWxo?=
 =?utf-8?B?anNPV05XRjVoeWYzNmZ0MDIvZy8xZjBNWXpYZ1VSRlZhdlFRcm8yL0h3Nll1?=
 =?utf-8?B?bnRVTjluQXVyMGFvOHhYQnJYNmFENk1zcXQ0UjhHOHRnSVFHVVZCNFZIaHJr?=
 =?utf-8?B?c3hWMmR6UnVnZ2tzbTFkcEt5dzN2TTluN0t2akVwZjNvbjhFRHhPaStsR1Ev?=
 =?utf-8?B?Q3dDcXdvQnFwUXo3Nk5URmtIU1RCN2lCZTVGMG0yTVNDQmF0MlBQcWVnazJS?=
 =?utf-8?B?bHN2cUFkTWdMVlhzMStxNFp1aXI2SE05WWpSa3U3aktOOENId2Y4bzVTT3Vw?=
 =?utf-8?B?b2liYU1kdGo4QTR6cjU5Vi8wR3RrajJ2Nk5ZRXF6Ly9OcVVxcVVHWHdDQ3Yy?=
 =?utf-8?B?cDdCNmk1RTB1ZDkwT2JmeWU2ZU82Qm1kcEkrVjd1amtTS2pHTVVwdnFKTkJQ?=
 =?utf-8?B?T0JtRXp2V1JQem96c29mTU5DcjEwaFBHVzdYbUY0TCt1Z3daL1hFZDVwaWdo?=
 =?utf-8?B?RnNZTlpBUFJkd0xkNEpCTFNMRm5MRU1ES3hZV29FMEFNeE9TenRIcWxzQTIy?=
 =?utf-8?B?QkZiTnUyOHhaanlnclRvdHByK2tETEtrYVkySnF2VWFtb1RuT3VhUDRDQUF1?=
 =?utf-8?B?SmNYRURFNkVRT2h5YnExK3ZFckpGOWZuQ2EwbkU0OTU2Y3BHcWgwYUVCdEtp?=
 =?utf-8?B?Y1JCVjlYdzRoTEZPNXIrSUlpaEVZNDhIb0RSUFRTMDREeDdFRXlVSHBVYlBR?=
 =?utf-8?B?dDhyRkJKZXp6Qm9kdGQwb2E1akMrcUlQb2J3bHFRUGlhd255ZEpYS1N0b2tr?=
 =?utf-8?Q?aorUsttYGTIiu2IIqUFto+lMVZeBlEdc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?blcyOVp3eGJJQ1lBQVdrSDhjSnNjUVY0Y3AxV1hJbkNiY0wvWFU3alJNQzVD?=
 =?utf-8?B?aE5jMS83T1Z5dktGZjBiTUF6ZnhBSElBMUo1L0x6Z2lQcnFVdkhJaGVrcWpm?=
 =?utf-8?B?c3ZmVi9MZ2M0K1F5VWZJMzVvMUQybWJRZU9RY2hRNkVwdWlxRldzWVRpVU5q?=
 =?utf-8?B?VC9wQ3JRNktDUi9KV1llLzFwV25BVFB2WUtNd0hZMGl0cTY0SEozTlBZcHFo?=
 =?utf-8?B?MjAxQm5CMXRSbHNFcFJsS0JhV0lMaTZrQWlVUEJxaFJuQXhOaFc5Wm5tWksy?=
 =?utf-8?B?c3dUc1pJbi9DZEJ6cXY5dllZYjNybU40RC9yd3NpUXhvT0xGTERGRi9UTnI3?=
 =?utf-8?B?NmpXbFVzUnV2TEtUbkRVKzBIN3AzdUVpdkJOcVB5SXhEYTJqaUhvN3NVK3l3?=
 =?utf-8?B?WTZweHJqbXpqb3BZT2I5Q1EyUWp4UTIwTzlLNUVBVWMwMm9JQXBVbDlPSVBP?=
 =?utf-8?B?UjFWSDVESmw0bGRLRkk3Y3Nxb210TUcyRTlWQWd6SGcvY0VPcksxeFBBcG1T?=
 =?utf-8?B?UjVVL2ZQbnFqbmcrWXpTd1JUaGVyTVRlbm1CQkxJcDFveURZWUt4U3EvS3Zh?=
 =?utf-8?B?SSttaDNMWWJhWTdaRlhwNmZBbTcrc0F2K09QZHAzdWduOTRVcW9YOGZBZzRJ?=
 =?utf-8?B?bXlzTUFCL2NYN0UvU1ptbDVyZ25Fc2IwRm5ha21oNkZuUm9XaDJhWXFTcWN5?=
 =?utf-8?B?aW5lMUg5YTBhM1pwblVDUk5SSjFIc1JjazJSUWl0eEc4c0NoMnVDaHQvWmo2?=
 =?utf-8?B?UU1JV0ZBZmhmVGdrejJVZlJJSU13SkFsZnI2MVRtQkR6OWtXVThYc0lwbG9K?=
 =?utf-8?B?RHFPc2ZiZ2lxcFN0aGhSQzZLR1NBc1Eyb2M2aktqNG1yRG9yR1BFL2x4SWQr?=
 =?utf-8?B?eUhkemVZKzVOZ0NCaWhxSjlLMUhqdHBrclR1allDYVZMRTMrMVY4cjJyRUFj?=
 =?utf-8?B?cnhML2RocmNXRzJPdlpIUTJlbEtHNytBTi9aOTZ2NXNybG43ZVFRNWhMdkUv?=
 =?utf-8?B?TjlxcGR4RUQrS2hVRjFKOHVoSHc3V3FXR2YyVzhDbThpWVpwcFQwT2lsUS9v?=
 =?utf-8?B?am55MXBXYVZVU1g2U2gzbXYvUVEybnZEWVh1N1Uyc3J4WHp5ZTQ4d1MwV3lj?=
 =?utf-8?B?akprZXcyMmNraENTaG9jQVlheFVnZUU3akhLMER5ZG5aRk1WeWtQb3hxN1RY?=
 =?utf-8?B?VGZLdU93MFIyVGZtbU9kRXFpOVNxUE5kQnczN3hCMzdXUkZOMDd3cU9hZ2NV?=
 =?utf-8?B?a01ld3VTbWRkVVNZdDBJUFlYdVE2TTcvNzNGTkc3NzFZZkVKOVZQT2JMNHE5?=
 =?utf-8?B?ajhrUHZmZHVmWko1eC9FdC94N0daRFQzNllxakdqUDRDaVpKV0d3VmVXRlVy?=
 =?utf-8?B?dWMyZWIvWmdwd2pXT3pWYkpKbGhPbTI4TUpiSkdMZWJpb0tPNXgvRTcyWmZH?=
 =?utf-8?B?Z0YraVB4MWVQdGNCcEpaTVBBWUhVRElTUjhwYWhpWnNTM3ZIbEhRRTZ1SVNv?=
 =?utf-8?B?a3FWNU40dHNTMHZFTUp1S01zQW51MkxtdkNwbFJINnBNaVFYemg4Q0hDcGY1?=
 =?utf-8?B?RURVbUpWZEgrT2U2MEEwb0IwTWRzNllNU1U0UzJibGlTQXZMVHRTR29ldncw?=
 =?utf-8?B?eWZ0ZUNpZXVOVllRQVVpek1ycHFER0ZsK1FZbDBUSEJpNEh3QXJ3M0VLNGta?=
 =?utf-8?B?RGtvenp4MEU0Qm1nK2tKWk1wWStPcWhjcmx4ZWRlMkZpY0JmQ2lWdU9KSWVD?=
 =?utf-8?B?SlE5bWhsY3RCSVdNNEVuOEhXUUlnSUI4L1NLdUcxNU1qRytNRUJGeWErWVhk?=
 =?utf-8?B?TEY4VWtmb0NUOC91T083b0pRUGl4ckgyMlh1dGY1M0ptNllvbGZVbDkrR0pJ?=
 =?utf-8?B?UTdDcTVCTUNYSFlabUJoRWYycG5ia3lBVUs0czVPM3hwRWszZmgrSlVLN0dj?=
 =?utf-8?B?alllUFRZak50T1E3cW11dCtQa3NnOTlicTRzT1FtdmtFR2QwNGNHUHpuUTkw?=
 =?utf-8?B?Szhic3NGMGx1a1I2TWt5OFJPSitISVlnakluQitLOG5xcVlSU1c0NnFidEp5?=
 =?utf-8?B?bWhJWUFlS3dwQlRLd0RVT3hkVnErU3J0aGRiWEFFN29JeXo0ZjNpUEVqVkRF?=
 =?utf-8?B?a043NlhlM2NxeGN6SkNOWmlKSCt0QlorM200Ri9XWGVhenI1KytLSE9oL292?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee84f31-506f-44af-be77-08de0fbbd0cd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 09:34:07.1220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ghy+HOvExczQd3ql9n7sbBeB1m5qC4KC23smNq1pZnYjgH0hIrwUHCwFLsblnFCf2TwzNGD6WwcOmv/K8Y6StdvzxniLE0+cjRlwIMWffw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 09:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7757

Hi Antonin,

On 10/20/25 10:52 AM, Antonin Godard wrote:
> On Thu Oct 16, 2025 at 12:25 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Part of bitbake.conf, this variable allowing to enable or disable
>>> translation was undocumented. Add a entry to the glossary.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/ref-manual/variables.rst | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index bb24f2583..f16ef9aae 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -11117,6 +11117,19 @@ system and gives an overview of their function and contents.
>>>          the Yocto Project Development Tasks Manual for information on how to
>>>          use this variable.
>>>    
>>> +   :term:`USE_NLS`
>>> +      Determines if translations should be built for recipes that can build
>>> +      language translations. This variable can be equal to:
>>
>> Suggesting:
>>
>> Determine if language translations should be built for recipes that can
>> build them.
>>
>>> +
>>> +      -  ``yes``: translations are enabled.
>>> +      -  ``no``: translation are disabled.
>>> +
>>> +      The :ref:`ref-classes-gettext` class uses this variable to enable
>>> +      :wikipedia:`Gettext <Gettext>` in recipes that use this class. Recipes can
>>
>> Suggesting:
>>
>> It is used to enable :wikipedia:`Gettext <Gettext>` in recipes
>> inheriting the :ref:`ref-classes-gettext`.
>>
>>> +      also use the :term:`USE_NLS` variable directly to override the default
>>> +      value of the variable, and configure themselves according to the value of
>>> +      the variable.
>>
>> I mean.... the same can be said about any variable? But the "magic"
>> documented stuff that happens when setting USE_NLS only happens if you
>> inherit the class, so I would simply not document using this variable
>> "manually"?
> 
> You're right, initially I had in mind that some recipes explicitely set this to
> "no" to skip this feature unconditionally, but it doesn't seem to be the case.
> Misunderstanding on my part. I will correct this to say that this is not
> supposed to be set from a recipe.
> 

I actually understood the sentence as "you can use this variable even if 
not inheriting gettext to do stuff related to translations" which is of 
course not something we should encourage (that is, using the same 
variable name for different things). But re-reading it with a fresh mind 
I now understand it like "recipes can override USE_NLS" + "recipes can 
use USE_NLS to configure themselves". Not sure what would be the usecase 
for the first one, but for the second I think the point is "please use 
USE_NLS to automatically select building/supporting translations", e.g. 
with meson build system. gettext bbclass only sets --enable-nls or 
--disable-nls to EXTRA_OECONF, so I guess you need to do a similar dance 
for recipes that expect a different option than 
--enable-nls/--disable-nls or other build systems (such as meson for 
example, c.f. meta/recipes-support/p11-kit/p11-kit_0.25.5.bb).

Can you tell us a bit more about what you meant with the last sentence? 
Maybe we can reword it to avoid confusion.

Cheers,
Quentin

