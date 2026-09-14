Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F659C88E6F
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 16:40:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2179.1789404005931273944
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 09:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UWTCH+fk;
 spf=pass (domain: cherry.de, ip: 40.107.162.26, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z42e7V60zHkiII6CSdE+AFt/lL7iMzsSmshV0xx561QB+tpi13OkkRPk/mdBcKjjHXQImsZjmJP9wmDWOCZBEVFaULYJgVRmUIFBXWXwbIAYZBDJ2vw4LsNDh3VkjYq1scJrUqGBjBivlq9iwH1GfkMASWD+PaTZpPmSIyDnQCE+v04uKPAZi5uQTqn0Yy0D/JmyoMGl4EIXxHgHmPh8Ul7ujKiLCVGC6cYpnRlh1HZ16fE3WtNK0VMh/SbSJGv9mVBE+jQQhQSSmcKjTa1EC66ItEd5Dqj5ZEdkjgSYjoTX+EQwYaMqtW1PJIBgru6L9t1IJovTcLViyMMIvvBZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueOF6okVOGCnGXqWhgVfDqvu+3QF9xqbAN2ft6T0CZY=;
 b=np8HhbebidtRNe1UyNQfVcezAxiQy+X69yaiAWRvr/AvZDEm5vcLNXMdMcRymXRn1zVoxkgYCoacjLOMTj9Eqfgz+QXRCcHWLJyp6nML8fTYf7uv6IhplCA9UE798Q9BeN1/BjAC1cs8HGvzJwzvaeUp51oA2+lvO4S8MyN0UEGMIxDQoLpFw8npNjpiOL8xScTk6SxyY8OFjJlM5ihwutjSP0zAkK9CJPl9QgCDrf+4bdoCxHD1ydHZY1R0Ya22JIg6Y7rl2oUfBuEuV6/NuiVyKlT9o78HAGJ/XRtgn7r1i4ks2wPy3Nh8+GGSoJ/PJmxyeXFc71LGJ6St24v34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueOF6okVOGCnGXqWhgVfDqvu+3QF9xqbAN2ft6T0CZY=;
 b=UWTCH+fkheQBpWyk2BxEUWYV+b1uhGYDnL6S96jhpae/uVzd1HuQ5GYy2oxvJHQgOI0rVr2X7PNIRPOkJ2mNUqOYTJ+J2vXVRvAY+BTMB0yygo0gZsexwXlG1obLWHfkgLxRZluMman6iQ8ji3BOU0wEAaGBsQWZvx1XvWIYlqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS8PR04MB8562.eurprd04.prod.outlook.com (2603:10a6:20b:421::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:40:00 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:40:00 +0000
Message-ID: <92a2c1b9-16bf-475f-aec4-4fffbce0012a@cherry.de>
Date: Mon, 14 Sep 2026 18:39:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] docs: document the conventions used in the manuals
To: twoerner@gmail.com, Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
References: <20260831031458.4070250-1-twoerner@gmail.com>
 <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
 <apWCaeB2azEgKMlK@localhost.localdomain>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <apWCaeB2azEgKMlK@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0017.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::12) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 093184bc-87c2-4e20-c100-08df127ed186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	3tRYKKLRBAjDD4WDNEqNGJQI/dI8YHfRT5PC65sxGOFjwcT/vMnuaXkXeaXSvAmF6i/NF6bcth99V9rxC9ZRXA1e1eOjIL+2A5T0cxkXm83v7l3LpAtNd6jp9lxApTVIXZLIl/KH2iJbbqGSvqyV8TA5YAj6rwYhGTLcNvieZPv2Q5MbVGU31ty3wFlFH98gfGEFoEvOg7hAMYg2ZoGoeaAlhgzB9XjlkpZcG/66yxzh6vD3kUdB/lWOscKnbz2jIBXBDsdtMZlWED21kunjbZ3tBP+p4vRP4ade8fmO2JxfipO962IK4JsAztXx/x9mEzXLrnP8tQ0OVQwLxbC+fpz7mr4EO4z/JswLUrQamupXmpoFJCp48BTiD/3kWXjiAe7JMcyAmZNKq+dgP6w40U3ET5let3GaKi5PVV4kPEt/qeeTftbT6BCOjQNOSzb2Sp5FFisj+hC0oxWum99fi41xCVNMTh9jUigUKZnyBuIKBA2tbOMbbpP0nq+Fd983TEYhS8fyvrIsgiVgbKywwSm0obj2Uja7Pka5Y7Q0Ee7KS7m7H6l/v0stqQIozxa8iCqSVIhGfbxHzwlDIdBwHWq7321lTRNlKEcVv1MumShFVeOb2q/N1lx/Qnb2r5R5UZvg5wpYn1XemTnksj3Q5UHbjlLiJRjo3K/bOfgPwB0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VDFRTDQ1V2FwYWRHTkFoWFJGRmNlMzZleDgxQlQ2N3AxLzRTOXZmTWJ0Q05Y?=
 =?utf-8?B?K1l0TDhqbVk5RGlFTnB3UHF1OUZCVmVhN0J5US84T2NzZzB6T3JvYUM3bFBU?=
 =?utf-8?B?TnBGMEh1R0gvbXdCWTM1WU11UGlGYUxJbWlScFhWVTI2MDUwcEl2RS9qYjAx?=
 =?utf-8?B?eVByMGJvMHoySUdWTlJ2MTJSMCt4d0RwRnFpSnlDSmNicmx0T09aZ0FxdWFH?=
 =?utf-8?B?Y3ZJSTVtempyc21pLzBPRk9NWXJGODBCK2U5dHd2NDhZWldLTXhJZnlFRGF1?=
 =?utf-8?B?QTF0bUs1ZWlNYks2RDBTdy9SU2dFNExrQzcvcEJZRzdvMFRmSWtKbEZ5aHpK?=
 =?utf-8?B?L2dpcXhaZFdvczRYVEZNY2dCSm01NnhMS3BoeTRkY3p0NjBLUVBwSzBLUHlJ?=
 =?utf-8?B?MklTNENrUDg2V1dIektzcnR5MkFnREVxY1B3V2lDVk1WRlQwN0JsMkRwTlk3?=
 =?utf-8?B?aGEza283VGd3L0NGUFpkNHJ2cmdZUHByaDI1M1JuR1grcEpYUGorUnZ2K0Mx?=
 =?utf-8?B?RGIvc25JZStUdVh0THdzK0Faek9neHVFaVo4K2ZmcXFScVZ0bjRFNWtjTVRY?=
 =?utf-8?B?bjNManlIZUhNVTBQR05uTU0zRDJ1SUtUM0N1bVlhby83MTBZZC9PdnlOK1pH?=
 =?utf-8?B?djJZREZoZ21CZnVKYUxiUWtFK0szbjU1UWFrMGpKNmprZllWTG5HTkt0LzNN?=
 =?utf-8?B?S1cvVW4xZklmZkdMTnNnZVdhR2o2ckZOWGhIT1hLMzhFb2hvaVlseEFaZWN5?=
 =?utf-8?B?OWRYUlhKY0JqWWdQMXczb0tBejJCdW1KRTVLUHNsTEVJZGZwWnZtdXNXSXpF?=
 =?utf-8?B?UjdCekpHQUZTZHRodEwwRXNoK0V6MjJ2MFBqUGM4V1RQa2V4cEE0dEc1RlNM?=
 =?utf-8?B?Zkdtb3RidDBKRHlQaXR6b29NUVJwMjV2SEEzS3YyTTNPaEJ3UXZVVE1Ecy9i?=
 =?utf-8?B?MVdta0JFMFlwVENtenBJUjZrclFaMFF2cnBsWWRsU2F4azJUOXlDd2JteEFn?=
 =?utf-8?B?YWlTM2xWV292NW5LODB3bndvUGhrSmtXcGw2eHpDMlE3eTNIT2ZEK01SODYy?=
 =?utf-8?B?eDNoa3JIS1hiamwzYkYrQkFjWFpZdWRxbDl3WkpOM0xvTmVrUE9Mb0ZjSDBr?=
 =?utf-8?B?NHVveksvQXlQang2NDZnN1FNdzZrYjZ3VXlLSVJIZVNONE9rMFF4UUJicjY5?=
 =?utf-8?B?NDE1aTU2Z2ZKZk5lM1FWYnJzZG0xZTIyV3FXWldMN3RUTy84RlpTSGJLTEVt?=
 =?utf-8?B?V1E1VVpBZXVXTnNadm53bW5KbzI5QWNXTlEwc1B3emFmWmFsMjA4aTRCaHh0?=
 =?utf-8?B?aDdLdkFadUIweXdYMzRPakNjV2pXTXBVbXNWWno5Qmg2bGhCZ1JCYW41d3Ay?=
 =?utf-8?B?c2owVjJ6R3B0TW9wWnNsUWJnaXVET1hja3RYdzloN1VDK0VwbTB2ZUdzLy8z?=
 =?utf-8?B?S3ltSnNockZUczJWUzFoZlpmWmY2VDVDeEorRTNqZysrVy9YaElJcE1oUmxk?=
 =?utf-8?B?dkRoZkxPTCtWZGVRNFl3NU1STm1MRHNwM0tJNnl5K285bzBwdGp4M2FKNmpF?=
 =?utf-8?B?QStQd1liaC9CbHpzWExuQjQ0dTRjTndGVFdNWUNTY3BhMUY3eVhYRW9FWTcy?=
 =?utf-8?B?SHB5V0E4S2pKZjdUOG9Xb0ZrRE9jMk9wMFRFTGJ4TjZJZXhQbGZCcU02ZCtt?=
 =?utf-8?B?NktDby9xcUVHUG1EUk5lVm1iMjVmaVgrbHZxbjcwYXBTY1hEU3l3ZUZsWkpL?=
 =?utf-8?B?cTUxc21aSkl4cFhnM1I4VkJBb0xDQ1dVQnlpTmdtQXRUL2ppS1RPMFF0RFBO?=
 =?utf-8?B?aVgzaFdyV3k1ZjdQTG9LT0N0bTNHTlNOei9LbDNiU25yMlVFeVd4YW5rTXVE?=
 =?utf-8?B?UTVpbmNVb2loRVFEdXpET2xZdmhoYkRaZEhjWGdZYzhaai9veTBEQXB1YXQ4?=
 =?utf-8?B?aWpWQVgvWmNtWXVmU3ZpSVh4SGV0eHo0UTN1Nkdsb1UxcHNxUXorazNRUm5O?=
 =?utf-8?B?anlGTzA0MDQ2Q1dyczU2YU5yMGE0bWJ5QkNqTDdsUWViYUFPOTJIN21mbG9j?=
 =?utf-8?B?UVN1aGxoakJYblF3R0JLUlZLRS9SRnhmR2NrUHNEdm9sbmM0MStJdzBCYUxH?=
 =?utf-8?B?N0lNYkcvOTdPM2lxbUVydlRnWmowUFZLMnhwTU5hVnpjNUtiOHdNNzR0VW9s?=
 =?utf-8?B?S1VZRHh5eXowWEw3Y2dOdWNDOS84dWpOSVFRVlA4UlphWnJoZTlTcGFMTG1s?=
 =?utf-8?B?bWpaTFBUcUlCdDBROVF0bFVPSE93VGdMWFVyWkM5TGZObmlkQThlQi83UmNH?=
 =?utf-8?B?UXB2SGVFMTc4elloRTZHQTJENS9OWGNIMmcwdzhVSUJYZStNSjhhUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 093184bc-87c2-4e20-c100-08df127ed186
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:40:00.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCKGmWlYNFlQ7SfejmIHU2leUgH9yqaLyOZkx79MqD6M6QB7bsudkP0RABJOtV5jeB1jXshQo2XV5TgSZhL3RkOmO6p8zdmM60aA805OupU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 16:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10499

Hi Trevor,

On 8/31/26 3:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> On Mon 2026-08-31 @ 10:18:42 AM, Antonin Godard wrote:
>> Hi,
>>
>> On Mon Aug 31, 2026 at 5:14 AM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
>>> The manuals use angle brackets for placeholders and a prompt to mark a
>>> command, and say so nowhere. A reader can only infer both, and one
>>> example reads as advice to paste a line that will not parse.
>>>
>>> Include the new section from every manual, the way the boilerplate is
>>> included, so each is self-contained.
>>
>> We already have a standard.md document that explains these kind of things. I
>> think it would be more appropriate to add these conventions there.
> 
> Oh, that's interesting, and I hadn't thought of that.
> 
> You know how, whenever you pick up any programming book, there's a
> section (usually in the Preface) that shows you what typeface is used
> for code (versus prose), how a "Warning" admonition is drawn? That's
> what I'm trying to recreate here. A "conventions used in this document"
> section that is *reader* facing.
> 

Fair enough.

> What you're pointing at is a *contributor* facing document. And it's a
> good point, something should probably be mentioned there so that
> contributors follow the same conventions throughout; it helps make the
> document look like it was written by one person.
> 
> But I feel that a reader-facing conventions section is still warranted.
> 

I really think we should aim at removing the prompt for all instructions 
that do not actually require one, that is (in my opinion) anything that 
doesn't include the output of the command. Then there should be less 
confusion around what needs to be pasted or not.

I'm also not entirely sure we follow those conventions currently across 
the docs, so maybe there's some additional work to be done to ensure the 
conventions are actually followed.

Cheers,
Quentin

