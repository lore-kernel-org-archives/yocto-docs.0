Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3D2CD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 16:23:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20558.1779467014039469106
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 09:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Oji0p8Ka;
 spf=pass (domain: cherry.de, ip: 40.107.162.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEaCcZUQf2nxrbpmWO9zy1EsAbGlY5gmjNigewSHsVDios3W129Y/SWL23m79Zm1hvUvtUaroKC807KQmGg5aYv1T59PX2J0YZzfOjE72bu2GKTdMkhLBppXM1qoeo3CI8FpbFxh2Fb4fWTNsBIsP2VUSccu53cDOHKoKVVaWJ+LTZmGxGP9h9Qi8D1luWJavO6ODT5XAsTHIEpBNoUIdJtjzgkHa2O5uReWCeyghr77mFeghDO0JvrP17iE4/ZID5RNATTSalm8VbFyRdNmApOWDGqYM47wtT81gVZNwdgGiYk6yr4n3rB8UVxRBkFnsD6dyBS3zTZyq7/AuG1rYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je09PvTK5ofT0htMwSyccYmheDTohThzKVF/OMQRxTI=;
 b=Wgrlfllumj1vEAu0KxwDAEhKVE/LJ/18nJkB8NlRczrQyCxWhM45W4ivh19OqCouuiLynDNeFoQ3GVYnxQ/nlmuHK2thOT6aNlWCCmq5YzlDoc0X0cu6Frj/FCkItEzucPX/gWFi9AU1Ke4hJCgYCvQqTCopM8dmTVZQiBBm9hZJ+8+8RCcdztOMKAcbHSzHlex84eKYmL84KGMuVIbZkyrpPnnaolD2xPgiRTuDNY+Qs/HLrFtQB1kYaUIFoFn5YtW4ppmlUvsKQbEY3zBXMOfNg+d88YvGKqLqJFbR6PIpqQSXJ1qG5b6UzoLn+fOPPxgWHYH+LozSpgPK7lkJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je09PvTK5ofT0htMwSyccYmheDTohThzKVF/OMQRxTI=;
 b=Oji0p8Ka2Vm4J19VbBSVkEo8D/JIlYM/8B5JCUNOLsAbU6ZwdTloqBZFTL/3gxFK0jnDuEkPB1peWJKU+j8L52G5jwI9+MQ3Jb9TPk9eOsf154+Wpyej3+uv7QgYBbEnLTFHpFXvtvyb9mJD28O0Hc/8K6AUOTZtQia4VjkYuj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GVXPR04MB10204.eurprd04.prod.outlook.com (2603:10a6:150:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 16:23:30 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 16:23:30 +0000
Message-ID: <36d0ec5d-8965-44fd-8886-ac3a014d6fab@cherry.de>
Date: Fri, 22 May 2026 18:23:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: clarify that PACKAGE_EXCLUDE supports
 DEB packaging
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <cb7c2ab0-bf11-5fa5-5730-2776d56dad0d@crashcourse.ca>
 <005af954-7f10-4b76-9257-d86b25713d32@cherry.de>
 <3ef2473d-af97-e952-6279-45e8438a7380@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3ef2473d-af97-e952-6279-45e8438a7380@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0098.eurprd09.prod.outlook.com
 (2603:10a6:803:78::21) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GVXPR04MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fb3d56-8ab8-46d1-1798-08deb81e765a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|56012099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	2HedfK8JB/sEFAKNwh5NERuadfF1D5n5wFpODf9JD57MFVrANRTE4FgwKdvVSltjwVVobz1jOwF0IzbmZ0boiIMMZV8MKEQnjzG62Mldv+3Ka/RM7XB8XafeJd0WJt/t5/hhxkuLGC7ivBDDyYtJYP/+K/jqfcyJQywYvWaquKiSJqjQk7Qi9z+KbnNkx6FXJrnsiLI0WuWgn6luuopGVKBCxQ9qCkPtXisZcwVGADQGUWNnzHerOnxGTX06rKmjQQ+k+y4Y1YNd17dnzrY5Pr5EbxE87et8j9LydhkgcHeluyBL2eamcmrA994dA01xO6wMmYZydUYZZmBMlpKmm8FNiBeLSL1+Z/4ADZrA2Cy2+PywjQ1S3I+4cjxbu405VW5YWSuE2NeKCno/d+MGW07gaPOouEcUYT12pI17eqltjYUMRwaOHgQpshGWEqtCDR2M2Bpu3INwywEZeZTSnN1kfdDSAH8Ph8W1vBn3RaHQl5wJFYRf+BlpyzO5uOHn9Ym+kp7wQ2oLwOEDYGAn5sv78NyEZMhZ10ecsgojQMS4FM6evFUxNenmuqnzTIAZHsRCTfO4NZhNYnKXRT6LpxjU2Xy0ISa8e9dEAp6AuJ362uHBKKhnaNG8bbLvilx8z/24A279gIhvniKTnpuVMsFEqBJkb3LQkPtMdiIL7hg4Uj2jptYdYF3eRfxFmbk4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ajNsdmI1d2x5Zk9KbkRvaVc5TmtjWmt2OWNqS21UN0VPRXdwcXJ5TkJ2eFgr?=
 =?utf-8?B?a1p6SkhSMitoOXJEczg3Zmd1ZDhIQlMxTk4wbVNJZEI2elM1U2thOEI3R0NL?=
 =?utf-8?B?OHdDeHAzUUNIVnFpcjczVFdmSllmSHFIVHc3NVZJY09ySGVuQTErN1VYcGgz?=
 =?utf-8?B?cVVpZ25weTZoaWg3bVVZb0ZkaWxBRldVaWtrZ2hQbjBUaG0vUG5BQ2h4SU1l?=
 =?utf-8?B?SnQ0clRlcVFlSllEL2VrVkQ1OTBVV09FWE4raExRNTZkWUEzWDk4TzZ4QWxr?=
 =?utf-8?B?c0E0SG1WYzFXSUFXVlk1aGo4ZS9HQ3RmQWZVbi9CQmYzZzA2U3IrRGF2MGdH?=
 =?utf-8?B?N0dxdU1tRjBIaWRTSHFCbHkwNU9XNTFmcUlabSszdVhMekh1T05tcm9DVGZG?=
 =?utf-8?B?UHU0NFFYZXQ0RUNWT01CeGpBV0lWRWJBMzBObHFIRjZXYW1wL2xzS3ZlR0RB?=
 =?utf-8?B?Y2F2K2JmY1RMblJPZndqNmU5MnNNQ3JKUFZ4UmZuc0xmYmpRT2h4OTlQeTlq?=
 =?utf-8?B?ZEtGWjFNdWh0UXpVeXd1dkhWbnIzcWdXVElUU0lVaFh0QlkzVXM3Z0JwMjU0?=
 =?utf-8?B?Zk1hK29JQUNvUzQza2xtZUFBNXNuNWZxT1U2clZHNEpmZFlGNGFkQ1cxMUc3?=
 =?utf-8?B?eE1COXFuQzFZVUxOdEFWczJvdmVYNFJLYnN4d1paVE1RNzNTditrcFdjblNS?=
 =?utf-8?B?SEs5REYwTHQxS0FaRnFGNDZBZUhPV1hjNmM5TDlGNTZIQ2QzQ2xxWENnTEJH?=
 =?utf-8?B?a1MvNlg0Z2g4MmRnUFUyRnNKNmhWZ1QrMEh1bUxJMVowMWhheUl6RThURncz?=
 =?utf-8?B?eHpyRDRoVGxobEFaRm54R3ZjVVhyT0FJczY1ZXJqZkFIS1VOZ1FkSExwR2h3?=
 =?utf-8?B?d21hcVV6RFdNOHZQYXovYnA3elJ4TS96TTdjRHNoVktYV0RjQnNNNFkvWGZB?=
 =?utf-8?B?K1l3eWZMaTQwS2MyVXJaaHFJL0ZUS1prbzBsK3Noc1Q4N1RmaExmREVoTDg3?=
 =?utf-8?B?bkFnNFZaYm51SFRNOTdiYWI3VmJFNGlDMEwzNE5qYm9jalRGSWtWcytVWVIr?=
 =?utf-8?B?ekJSY2tUQ1Rrcy9rZXZzcE0zNjJ0K0ZWMkQ2SnUyVEJyRzEvRk5LYW1rWEVR?=
 =?utf-8?B?ZFNyY0Q4dHJ2ZXFMM29YMXNFUXhUT3FJK3F4OHZqNWxKUmJybnA4M0EwNGFM?=
 =?utf-8?B?RGJGNk15RzR0RUhTWmUrQ1NCVkFoSWFqcmlaS0pia29hclRnNlZmb1VvM0pJ?=
 =?utf-8?B?SDNwbFA1UzJKRzl5dnlBeGdwUlpEamJ0VXJESnN1ZS9Na3ZXTSs2MmdFeC9N?=
 =?utf-8?B?NkJ5ajQ4ejFMMVJseVRjbkd2WEx4VkNDMDQ0TWVrSmFCUXlyWW03YkxTckND?=
 =?utf-8?B?eGFWVTNNcE9sdWJzcVk3YmxuTFhBckppNzFRQ3FxelpoeHVRQVlSRFpBU3lZ?=
 =?utf-8?B?UHgvSWJWd2NwcUpkZ0Q5Zng5YjRRSjExZkV6MFpYeVZuOURwdVpmdXBxUlRr?=
 =?utf-8?B?eGR6dm1RUVBuY09yUjlXYWw2dlJQZlpSYmNxYWJ6K28rSGQzMzJ1bS9aVzQz?=
 =?utf-8?B?UE02MkhieGJtbTJQajBkcDZpMzlNdUZxOE84djkwNTB4ZjZUU1g0MFoydndr?=
 =?utf-8?B?eDY4R29tNzMrZ0RaWGJrQkpMdk1hK0orL3VpeUVNVFFqb05ScTR1Z3RGUk1E?=
 =?utf-8?B?MXM5MndqV1VtNmxGa3hhUUZOMXVadmw1YU1GcDc0ejA0S0ExaVRlM1FPSXZ2?=
 =?utf-8?B?WkFqZkZEb2FPWkxMK21GK254UUxHeTdIMlkvUEpRdUdYcWVDOWJkcHRKbVov?=
 =?utf-8?B?R2VTaWVzZ1VVL29tWmJjQ0s5cHVYUjlmUDhLa1RzMDJ0d1JpWlMxUlN5L2Zs?=
 =?utf-8?B?d3U4QksxbWFaUUNVc1dTWm01K3dZQnc4cEhJcTdvS2gyb1l2TFdMMHlwb3JZ?=
 =?utf-8?B?Z3dWMmd4cVk3UGlBcUc1TjJJR1A5dGlrZE5TU2NrOU9XV1FBK29oQ1E5UnRQ?=
 =?utf-8?B?bFZaYVJCeTRpMTFlOHpsYjI3RWFZMEtBdno4MGV2K3FLdHBGdzhjS2tJR3J3?=
 =?utf-8?B?SlFUK2VZMFFjeHEwRE92QWlneG5zTFNzUXNhYy9ZRk0vMGNYTExGK2Rjc1Er?=
 =?utf-8?B?dWNvbXBLaTdrNjE1c29iVDFBZlFzOHBuQjJJYXN2Sm5ibG5JYWhMWGtDc3k0?=
 =?utf-8?B?Z0pibDNUb2pHZ3diWUJSOUdYcExOTVMxZHMydmFLN3RpSk5wcFFPWWdxeUQz?=
 =?utf-8?B?ZXpyaU9ESXBZeVMrdkY5dW9EemhLbHhycVNYNDNkcUhKYmNZWTl0bjhvOVNY?=
 =?utf-8?B?RXZqSXhkTHh2L3pWY0tnd1BpSUhVcXRoS2xMNUErdmRPbEFpZVVrZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fb3d56-8ab8-46d1-1798-08deb81e765a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:23:30.8234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMApbi1T2X8b+Vg1Dr86SLeUaZswpblBfM49MUAaH+deACWtjPtNMD51rMSnydqY7L/00qwiOGRF0bpIQjNlvDm3l/AUedXyvWpxjdQsEcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10204
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 16:23:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9532

On 5/22/26 6:26 PM, Robert P. J. Day wrote:
> On Fri, 22 May 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 5/22/26 6:15 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>> As an accompaniment to earlier commit
>>> 0d05dedd62a6d4c726f120a23654ede1f0b23d8e, correct that the
>>> PACKAGE_EXCLUDE supports the DEB packaging backend.
>>>
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>>> ---
>>>
>>> diff --git a/documentation/ref-manual/variables.rst
>>> b/documentation/ref-manual/variables.rst
>>> index c65794229..2773e9864 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -6927,8 +6927,8 @@ system and gives an overview of their function and
>>> contents.
>>>          an iterative development process to remove specific components from
>>> a
>>>          system.
>>>
>>> -      This variable is supported only when using the IPK and RPM
>>> -      packaging backends. DEB is not supported.
>>> +      This variable is supported by all of the RPM, DEB and IPK
>>> +      packaging backends.
>>>
>>
>> Considering those are all the backends we support, can't we simply remove the
>> paragraph entirely?
> 
>    i mentally flipped a coin and thought about people who might have
> remembered the earlier situation, but i'm happy to toss that last line
> entirely.
> 

Fine either way, let's see what Antonin prefers :)

Cheers,
Quentin

