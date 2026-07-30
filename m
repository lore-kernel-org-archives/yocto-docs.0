Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F39C54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:21:34 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8446.1785406888263735009
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jul 2026 03:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AmMTqhdj;
 spf=pass (domain: cherry.de, ip: 52.101.66.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LA8YDEwjXYLRv80pZTgRd7bTmLWAKyn5V/5wfrfhg/jvjxeqloiD1eAJ4W4umrQfxHS670hmUq1Qk7rMUf99PMZsHR25qtik6HCqQTAE2DqHr02xb1oILBkYmWE67E/iEZpfkPkUQ8WTeRMjPtsNnqsYht9P0WD4q33II4XOor5BFwRKRjciTubI6gAQ15Ylhz2i1RmGg/HyYMC7NHCDtjm5oe647zTc3daV9zCSlL+zz9eMkaVg3ocsgmeoqoZfyBd2/iMKqLl9rjmWKWaeAH+NJrG18yrGKGOW3rfX+93qYHbRvpm+xSpOaAfZYwGZXAIfjJO9pTwofxZV7g2wSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAP8Jq+klg5BKqu0a3cV7Z/qnMPzuyslf0sAm8C9eQM=;
 b=l4lt1AfT7vUbZ3QaH+ejXus85yVAYTNLb8c0OPcLzvqS04I8RhbACZvJoCxVojgbEfPpDM8GQ53r4hqLzcNkJAce4mGJ+iXG32du5lEizv8Kktf4hFzTWqquQn2vojYfUjLk5K5+U8ZxjRS3ZA2oPrRfuzuADUH6Q2hFBQ7QuOODh6iUM40fKWZZpnLIxx7Vxur2nMAdZuIcCjxo55soX2jQLrEQDN6zywAJLD8xr7k1Q4CYoq4nV1chdApjlNC1L0kkVqEAs8RRP1ykNq5DcH0fkKkFJiZmXptZ+PT3qo89cmmvaU+frQOZ5tT17BLuobI9tKh0z/OcC7qe6JTI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAP8Jq+klg5BKqu0a3cV7Z/qnMPzuyslf0sAm8C9eQM=;
 b=AmMTqhdjn+L2sF9LSl/4T/jdureoMlmSkPtDpEsZPzEsH+a2I1Nv7U2NXYlNz0qnt3O7ulAEu4YutgY7G9yZ2NGSzYiPLFJLj1q2YO4VPcRaRxGIRW0bWSEpc8JUoHCQYQwzfZyyljnQqYU87vmhp7iP46mJDz/pNEnsvK0ge4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI0PR04MB11782.eurprd04.prod.outlook.com (2603:10a6:800:2ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 10:21:22 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:21:22 +0000
Message-ID: <50df6c06-244a-40aa-8878-5d2e67bb29c9@cherry.de>
Date: Thu, 30 Jul 2026 12:21:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/5] sdk-manual/intro.rst: remove a confusing
 sentence
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
 <20260729-sdk-clarifications-v1-2-661e65201bc7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260729-sdk-clarifications-v1-2-661e65201bc7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0004F08C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::634) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI0PR04MB11782:EE_
X-MS-Office365-Filtering-Correlation-Id: c00e63ba-2f10-422a-0935-08deee244dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	u+j5eFZdDN3DOkWRtUIhV55AYI+X7cgQAU5RdBiBcOcJgTS3r8OFTsxJwaGq+XLvvDKMIHR0+ivJ/ZIb2ruFpuT0ycA8OtA0u6GY+1sneHmaF1AbyuIfEmJ/CbE6Nkk0DiVnjjBekXk2hSmKUucFx9bnDXiYCJs7cJqmWMog3CF6gI7Sqhf8ISvhrBKzCeI7T9zq87PHZbmOUbeNd3HiR34NTKjfadL6afM2q6a5OagK/7mfFNc/vtACFIHdig7VzoZUOB+FY+3PXA5+fz5MWaBaavLik2rU5CXd32zCm5wEWgsWs0QducBtEzZsIixaeEiI0H6/PKN5tORvDdBSueLGxyhnE6Cali0oMmtcoaZOAuw+tFDBRdsTAJkHsjBwMwNIbpl4px1YQvWuYahkcCefgHNuH9Yon4PN5lUz8y+YRPMS6XPq+tCJvwLUdUph4PjCEU7ZfXVmiqVwpUMwSKPRP9WfbXuF9hd1VqBxuoMfDdp2YUmi7SprWTSvTRWJEoJvF16YBv71XCJNGOmdKKzjD5C3XW9k75C4MNYBFVpi1TaO2Y5RmGI9U4UT8pr2rGSckbKurQYDMWePO9TqjZ6k338uQ28EX/Iw9JxS1r/r7ezIPSuuYLp83BZub3mfBpb35pdkHFo3+eFKMafBwfPlbbAMeyHv1OPOUFExVN4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a05XMncxeHRnNTNjVjRYQU84d2JVWjlLWjY5ZXJob0JITUU3MTVhblllV2Fx?=
 =?utf-8?B?cTlDenNrNFhoWDgwM3c5UzM5RG5CbzRJaWphdzFwTmtuaU1EV05vc2dVak9P?=
 =?utf-8?B?UjF2M3JZTWFoMDBLSHlEOHd3ZUhWQXRvTFRyTzFqMFBYcWQ1eTJmNkdMbG16?=
 =?utf-8?B?ME4vcGgyQ20xa2tmRHljT3lLVnAzMXF1dnZyMDNIaVBabzdzMUM2Wko5SElD?=
 =?utf-8?B?QVdnSjhQeUZzVUNWekh3R2FoNGFtZkdwMmZOSDgzaWJNbUpYb3V4Vm1KU3U5?=
 =?utf-8?B?TVhyYWtSZGtBN1JORXFYOHhMRlZ0UHI5QTdmUWE5L2RPU1BGc0lCYnA1YTJt?=
 =?utf-8?B?VVJsMWkyQU9wZTR3N2lpdFRKK0V1SVRoelVhNGI2elJvcEE5dkxMS2REd2tD?=
 =?utf-8?B?TlhPajVIcHU5OTZmYmtaSGRudjYwQmhhb0FrM0V2YU00WHVETDFCN1l2QzZR?=
 =?utf-8?B?ckxBQVFCazNBRjY0RS9pWFhkOVZpYmZFbUVSR2FzY0hvb1pjamlaZnpmS1N5?=
 =?utf-8?B?WXdIVlpjUCt6WkZPbVJHQXF2WFY0WVErazArNEl0eUtBM056cVV6SnlxK3p5?=
 =?utf-8?B?eUVMY1RiU281V2FtblA5S21oS3IyNE5pK3FOMHRMSkozUkNmU1RDR3FOWXRt?=
 =?utf-8?B?NXlNQmx5UXg5dEJJRDN2ckhmQmlqQlMraFdaa1VCUW5OZFVDT05iaklqbUkx?=
 =?utf-8?B?NDB3b3RIeDNpSFpFRFVSZXk0MEVDU0htZXlZREVLNUpRU2M1aDV5MnZWUi9o?=
 =?utf-8?B?STlDNEhHdzk2OGVJSEpuaUUrbWlKWGZnaUZaYWg2NE1KR0thNW1tMlZ0VEl6?=
 =?utf-8?B?aXhjTFMvQU4wL3R0bWFxUUFOKytQbjJFUU1zQTJBWHc0SmkwQXFrcUVVQmJI?=
 =?utf-8?B?NDFzUjNzUHZSSHRxeS9yd1VRZDZHSW9XQ3Vxd0p4ZGJKRG95UGxVeHlQYzJm?=
 =?utf-8?B?N0N2NXZXd2ROamd5Q1VNVjd3MDAvVE5pbTREUER4cGNTYzBMY1RHcTA4UStI?=
 =?utf-8?B?M3dDeEh5eXlTUExHcDlnR3R0N1VrOFpNQzY4NzZ5WG9HbnNtUnJFbFY0Yk1n?=
 =?utf-8?B?dENsbEF6R09oeWxRUzlJaWhPdThRVTRqMllNY3Q1WWVVZXZ6bE1QeGdUeUht?=
 =?utf-8?B?L3YzUjZOM2ZMQjZPcS9XbzZPTU9UeWQycnNVbmVGclZuOWtQVWY1ZVZ0Rkg0?=
 =?utf-8?B?OVNhQlZwY3lyeWE2cWF3NXExS3VFNXNTelJicFhrd0pwcEZIMS91TEdpcy9K?=
 =?utf-8?B?OFlKSFMrSEpjcURRNmxqbFJxK0FrejArOFlsVDV2c0cwY2IyQ2Z6RUFZa3lT?=
 =?utf-8?B?VitrbU41U3g0TE1UU1NWU1M2dERZSjVJa0l0bENmb09xeU5KakRkVUgwQ2t2?=
 =?utf-8?B?QmV1akhLSXNQdGNsZ0p5c1RNMWcwSGFJbFJXTS84ampYR3pOVkNaZ0hwUW5F?=
 =?utf-8?B?MU9tU2V5bW5RMlRPMXBXRXJhbUZtOVBpbldEbkE4RWJBVnJOZmlPeWtaUWpH?=
 =?utf-8?B?MWZYL2RndDYwWVczQXpaaU9kd3NMU2gwanYxRE9lZ2Q0cVJ2MkN5VGtOMmxM?=
 =?utf-8?B?UThoSWV4WkZtYXJXN1BEL3N5bzVMWVE1TUdmdmM5QlY3SXordFBlMEdVRmhT?=
 =?utf-8?B?RFdESnFsYUt4S0txOXFjZGJIS2NmWlp2UW9kMlNUMEYvTmVPVjBGcjcySTJX?=
 =?utf-8?B?QzVPd0Zwd2d6RWZVcGMwSVRwOXhWZndWY3VTR2dCYXJ4bktQTDZuVmpjOUhn?=
 =?utf-8?B?aGZvMFB0QUE1a0NJd1hsWm5FTkJSb1BCNUI0Z3IzV1YwQXp2MWtieU94MkdG?=
 =?utf-8?B?UG9la3o1bUcwMHJKSThnbENRdXl4NWxwVHFKN25DL25DWS9pK3p5amVmTk1R?=
 =?utf-8?B?ZFM1OFdqdmdkRFI2RmFHcUNWK0o0eENVNUNTSWhVRzI4emQzaTZZSzhBS2Jr?=
 =?utf-8?B?OG5pRmgwZ2NBOUI0QlpOZVVJV2w2bFEvbWlWZGZtNGIvdlREUzFTZTMzTlZO?=
 =?utf-8?B?TlVZVG51SUNYUy9WdlJ5MTF0MTJKdzZFa3kybWZ2Q0hjUmxQM0JXWlFVZHVm?=
 =?utf-8?B?a3FiSGRaZmVxcExNT044UWRsZDhIamhaOFhkckJnZy9EV3gwU082U3A4QnBa?=
 =?utf-8?B?KzNtUCticHorR2xsRFBFOUMvUnBlSmZPbDlhaWZTdnNLQWQyRXVBeEJTdkhB?=
 =?utf-8?B?Vm9WZVd5VVkxMFlrQUVWOTFWNW0wb0h3ODBrVjBCb1g4VlJJUENjYlg3c0lz?=
 =?utf-8?B?VEszN0tRSTdGLzJiUEIxaFdRcytFTnZQaUlaL1cyUnJ2YU1LeU94WEFPb01B?=
 =?utf-8?B?dEVnVFY0OTNZdmlCTFovcnY4VkJHZHRDNFBxYlBtakNVejcySWJGUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c00e63ba-2f10-422a-0935-08deee244dba
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:21:22.6405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQLTFXB6RplrC//NxyzQelgJk2CAxbG89iokVOB3BM1Y7a+e+H4pFgj+x/BQ2m/HzB1Vxzrq35Y5thZQoOTzOu1qb62OD2MpdzyQkF6nO1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11782
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jul 2026 10:21:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10194

Hi Antonin,

On 7/29/26 12:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
> I have a hard time understanding the meaning of this sentence at this
> point in the manual. populate_sdk and populate_sdk_ext are best known as
> tasks, so the meaning for them as "archives" is unclear.
> 

Same here. Going back in the history, the commit that introduced this in 
the docs isn't providing much more info, so I guess:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

