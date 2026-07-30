Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AADAC55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 11:39:55 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9519.1785411592109039002
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jul 2026 04:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=l3xcOCys;
 spf=pass (domain: cherry.de, ip: 52.101.84.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7fe1DnZxSj2u15bJt4G8Mo5ZP72z1dCWQEVx/ydfBFvDHsI6O/xhQxu4BzCtLi5RGWkYp1P/X+fZ6S+jjjqCiPF3nbl67SoJfSGHbwkD6KpaCkxvg6rq0fxI8ABCSTKrrneOdItYDx+5aL+0FbiggZxee2oqNsKFi01MPZSBjUIBC/s47sZJIGeMxCEMHl8FSTNkEzM7ll1to2wa8DjbNOyPo67R5LbEQiOoTRAIbUWOyl8zMheBFMMxwJOSwfu3tlj75Vzu6bOwDD3HNmFqPzx65xHmw4P38KlGoFxsEWU0h13BQNWvE2jEAWpjfBQEpiE2AMSjOtqXy6CvgANTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhSesPiFDw/cv8JjFhGnC18EXhR7YGepLHFsq33VkFM=;
 b=k5eupbYWuelmuuXEz1VELNz+wsUT4R6yZtWQ7Yt+HNRxzPqvmNQfhEEnlGZtgGvyNsLR9DmrYJsl66V01atZlWlf6VVngFZyHKBI/mdlNJHHJ5D31b12HYD4FpQtJNAjAMo3FudJAPiX8PMyI08Kp0o1PS8N9NbFi+gVl40vmBZ7TOHfHgDAEwll06HtfOxxzGkCAsC+h8qGYODyM9STiqf0KSUAkgl9WWcwW72FxR8nQnd5V4wdJpVSQBjkQ9DFMxKDFQqnc82gu3ksAmbGRKFIbv6MjZkJKi1toMEFqRU54YQw26P1Qe00V3wXFxDoo3ko/wzhGVhYD5rZnA5Z6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhSesPiFDw/cv8JjFhGnC18EXhR7YGepLHFsq33VkFM=;
 b=l3xcOCysXOOCvqYn9tN2uFRqwDV1dMadVrzudxtQf+jUJfJV1JGP1JrocNG7woDQz7/gwysyF0z/gtREyfzo8SkYOax01ShxvBLNuyPL5wPjiQoRLJNF1DxsIITzDxk0eWqYp94hsTDHQqcZZv3xk+oLE0OozYJ9Fvxag5yNkp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DB8PR04MB6826.eurprd04.prod.outlook.com (2603:10a6:10:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 11:39:47 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 11:39:47 +0000
Message-ID: <c4107ff7-d2db-4da6-93fd-4eb850403f31@cherry.de>
Date: Thu, 30 Jul 2026 13:39:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 5/5] sdk-manual/intro.rst: detail differences
 between standard and extensible sysroots
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
 <20260729-sdk-clarifications-v1-5-661e65201bc7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260729-sdk-clarifications-v1-5-661e65201bc7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0047.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::7) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DB8PR04MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 69fdf525-9e36-45a9-11a5-08deee2f41d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|4143699003|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vJ7utzalQTC2rfWMoIRHF4TJtCZuIZpe6dy+jE+UPJBA1iEHLB6+fr98BXuw/q4ffUkg5W/BfD7c1kbn5WVqsNaHq4UZev1T1d9ojeb1oJwokDKwAvII3n5Cg2ET2DvT6pBnR4m3j7Z6Adg8RwOpf+937dDNBRPyTdh4D7S2txmr54oad/iAiQXIV8Y/sfJord8BxoHdupW5QTDP5nDqsIaWRC7LW+wvcFPGNDE3l3LXtZv3R+YGG9YXKz9SgrfDUe44N++Fko1u0OPLUdd5AVpHWrIzPATdnT43Pcfav9v/hKEbQ7ymGPWddg72j5G/JroFxd5t1BAEqyQ7EY9vAgY/oxLeOF5eAaj3nIlddgR7Hly1fL8YQtNESf53HNnsXQcGIgjMQbGhdlPoR6Bpld3CCCoU8SCoDldXRPUj2eriyot48mwJdYXoH1p/OX07wmi4QfOqDw+tC4r4i34MGN/bBghF+2Oc6IZSWUVz4Yh0dRE8x4FL4j5WxdxPEB8sxcPhoqd42VBMyOcOAv+7ZDrNj78D+pR+RIDuhTC4/AU6XscD8YpJlC2dt+ljFTlV5xW6uoGEEjtQBhbgujHGMcurDz17T1GHLwoc38K4400dCSE+juCC3kHPGwU45mtj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3IvVDFPQWFyM2pMb2g3Tkw1NGdTUHBGZlREaGRhZ00wcHRtZTdVNTQ4OUgy?=
 =?utf-8?B?eXlVUVdKRUtoM0pPVVBvL0FPVHBSV2dSSWl3UWNFQWtQdTFvUXV0QTBJaENo?=
 =?utf-8?B?Tkx1V0pUelJqTk53eG1EcE1NVHRyakc5RlFhWTlwbDhmSnNROGxiSlEwVU5J?=
 =?utf-8?B?b09zR2MvLzJPWFg0N2orRU55ajNhVWV1N3E3YllMdVJrNkNaMGx4Z2E3UU1z?=
 =?utf-8?B?T0FUWktiYVY1emRyMzlvaVQ0b3hWM0hIVHROT2NVOG9CK0Z2Ym9VclBIMytZ?=
 =?utf-8?B?QlMrNjcvQWVqdVNXRk5VVkRSQ1dWallxU3BKTHptaGh1ZzVpSElqRE1vOVMw?=
 =?utf-8?B?SHdPODNDTUZFTTlMWW1XYkZUMEVrZG5ocVpzYnI1WGJ3cEZGZW5pa0FYRTMx?=
 =?utf-8?B?NkZKbG5NbFNWdDFDbkt1YXZGbXVXNXNqM0ZaWEt1NFlPVmFwVGhmMjZ5V3NT?=
 =?utf-8?B?UndQRTdqSVp6VjFlMHIxS0JaZ2tCUk9BNHJYMTNyMDBKWVRKU2NaRzZwd2kw?=
 =?utf-8?B?b1RQLzg3czdaN1hzd0l4VE9uREFObTQvNnM3TVZkQ0xodExKQU1ST2hwRDlJ?=
 =?utf-8?B?VzlJZGNxaVZFRkZsSTZLb0lhM3Jvbk9rSXBmYXFqVjBJWnBERlFOTHIvNXd5?=
 =?utf-8?B?V1gyS3dmMWEvTm8xQjF5L1Z0N0ovVTlXN3NYdXo0NFZMcHRTMkdJYlJXd1Iv?=
 =?utf-8?B?SDN1UGpuRGg1Wm1rL1o5eXk2dzV3YWJmbFNZSFZRbStKaS9YYlNRVzhLa2dH?=
 =?utf-8?B?RnJLcmY0bmFLdjIxamdUL1pCWW1NUjhOYjdiV1ZJM1F1SGhKcFNMKzFVRVJ2?=
 =?utf-8?B?SEw4Njh2dUh3SlNFdHREWUQ4bm9KbjlONTBPSDhpMDByV0drZHVtSDB1cG90?=
 =?utf-8?B?ZEh2UXhmVG96bVFSb1V5M2cxbGNpSXV0cGhVdWx5YlNBUWFYdE0wNWsyV1pG?=
 =?utf-8?B?VkQ1YVBFd1o0dmx0RGh4Y2M0NHJROURjcTRNK3V4Um1QUXMzbkFPKzVFd0lS?=
 =?utf-8?B?QkF2WlUvSHZLRlJmQStkQW9LMnVSdi9LOU4renRnY3VIRTA5aG9nMlpLYmJI?=
 =?utf-8?B?bkxQZ1FYUjdrQ3dwTjlPQm5Cb0JaNEYxQ1ZHbGVCTlkrSjhYczFZQ0ExYlRY?=
 =?utf-8?B?cHFMd3NLS3dCM2Z4U3RTOXh6UjNiek9ka0VNT2FVL1M1c3pCQ2R4Qk5IOEpK?=
 =?utf-8?B?UFp4WTd6YkYyTGFua2dHZE1hN1FQdWpnWmROM25Wb3gzYUZ4eHZpdGJJVklU?=
 =?utf-8?B?RTlOTnU3NjRIWFBIbE5YMm5ReEFPQ0thcWpiQmpSaTh0Q3lKMXQ5bERMWmFy?=
 =?utf-8?B?QmJYTmx0WVJLQ1VtSytMSE5UMmdyNDRqS1ErUzFzNWZVTzZJRVVUTnhIbW82?=
 =?utf-8?B?dnNCMjFxaVB0Q3ZHbzFjdEZhK1Qxd1pnMmVVUm55V3FBZjdoMVJSVkp1K3ZP?=
 =?utf-8?B?MEhHODZSeGVxRm5QZURrUDhCamlDcm52YjBNQ2hXYm1ZU09GRWVTWDFMZ1VZ?=
 =?utf-8?B?MGRibVVrTjM1ZWI4NFNIeGptTmdnN0tkNlErbGtqMmtUbmxadG5XM3NLMmNN?=
 =?utf-8?B?VEE4RWZvQUk3MStmUG90OC9ocStFaTJRSkZOanY3eUxtb2pHbkhTZWtYNmsz?=
 =?utf-8?B?aGEyQlE4RWd5dDhZeWsrdmZaN3hYZjk3Sk80b3hRd25tMVhjRGhqYTZESkhB?=
 =?utf-8?B?aGltK1U0Vy9ENHBDNUNpbzBLU1IxNGNlTTQzNWVpeDhTUUJkalNXaE9BNWx0?=
 =?utf-8?B?NnQ5bXgxTmppV0F4QjA3VzNDOE5FQVpTZzEvL2lnUmM1NEVTZ1NkNUtONXBY?=
 =?utf-8?B?dWpkajJlYm5MaVhCVnFQT1VBTUxvczM0MEcvbnB1QkdPbXo4NEFWTTRzMENJ?=
 =?utf-8?B?Z3ZiTHR2V1J5U3VqdndhaGFORERnRUlGRG9aZER0RlZmeTdjYkxRZGd6enJU?=
 =?utf-8?B?b0M3NHJ2Y1c1QmJ6V1V2L2Evbzl5QVhGT2c4bUJnbzlsRHo3MkV5WnN4SjNo?=
 =?utf-8?B?a2pzV0NtcEdZdzFCRmdWU2ZoY3ZyRnRVd0lIZG1qK3JIelF3M2ZHM25STWFE?=
 =?utf-8?B?NWtCQ1A2R3RWYmk2UkdZRVl4c1dPL3gvbDVzV2VWVnJrbVp0NHNpMVFqeTVt?=
 =?utf-8?B?VnRadlN2amlVd2ZLQ3ZJcmhKMTBYb0FMbURxRGZObmQvOEgwUGVTRXNQMkpp?=
 =?utf-8?B?TjJMcVBZUTUwM2RZbHhlamhUL1c2ODJEeENMVlZabHlYSnVwUWhBTVRwd2xx?=
 =?utf-8?B?Wm1Qb0FCd3dkaS9uUjJ2aUhBQkZBOU9YYlAzajFpU3l6aDk4NnpMNUJUMmla?=
 =?utf-8?B?c1lLK3hCVnN0NW1tT3k2WDdPcDVtZUg1RXNNLzAxQ1JBakthS2NTZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fdf525-9e36-45a9-11a5-08deee2f41d8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 11:39:47.1618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlgrjiZvIV/4n38eciNQ09TPTum5OO2thAve01bp0MR0ivI0WBcUGZ+crFUvQUYYi+4I5Ax9gqZPFN1Mv41IY8B2IX+6rTEOmk7GM2998AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6826
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jul 2026 11:39:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10197

Hi Antonin,

On 7/29/26 12:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The sysroot in the standard and the extensible SDKs are managed
> differently. Detail this in the Sysroots section.
> 
> [YOCTO #14830]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/sdk-manual/intro.rst | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
> index 8ccbcfa20..2e5f73f0b 100644
> --- a/documentation/sdk-manual/intro.rst
> +++ b/documentation/sdk-manual/intro.rst
> @@ -123,6 +123,21 @@ sysroot is based on the target root filesystem image that is built by
>   the OpenEmbedded build system and uses the same metadata configuration
>   used to build the cross-toolchain.
>   
> +However, the extensible and standard SDKs sysroot differ in content:
> +

Why did we stop referring to the Sysroot term (:term:`Sysroot`)?

> +-  The standard SDK sysroot only contains libraries and headers for the packages

s/for/of/?

I think we should also mention this brings the libraries and headers of 
their dependencies (recursively) as well?

> +   found in the :term:`TOOLCHAIN_TARGET_TASK` and :term:`TOOLCHAIN_HOST_TASK`
> +   definitions, for the target and native sysroots respectively.
> +

I know we have a nativesdk OVERRIDE, so is it still a native/target 
sysroot or should it be named nativesdk too (I've never built an SDK so 
I don't know).

> +   See :doc:`/sdk-manual/appendix-customizing-standard` to learn how to
> +   customize it.
> +
> +-  The extensible SDK sysroot is completely managed by the ``devtool``

Can we maybe point at some docs for devtool? From a quick grep, maybe 
something in documentation/ref-manual/devtool-reference.rst?

> +   command-line tool, and its content is the same as the sysroot of the image
> +   recipe for which the SDK was built.
> +

I guess we could show how to do this here?

I think it should be something like:

bitbake my-image -c populate_sdk

(or maybe point at 
https://docs.yoctoproject.org/sdk-manual/appendix-obtain.html#building-an-sdk-installer 
?).

> +   See :doc:`/sdk-manual/appendix-customizing` to learn how to customize it.
> +

Thinking about it, we probably should update 
documentation/ref-manual/terms.rst for the Sysroot entry in the glossary 
to explain sysroot for the SDKs (or at the very least point at the 
section here).

Cheers,
Quentin

