Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE23C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 15:45:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.58])
 by mx.groups.io with SMTP id smtpd.web11.28800.1658159095772795981
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 08:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=AdCqfcUQ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.58,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXCxv7Q9j/PyrpC16MTfeHZHSDUlAojVuv/y8Zyg2LWXE6/syCGFWVSgS83/J0hKn7iYZwUgTabyM6pnH96f1YsLFHJcTd/QJq9jr+Ncu0TKgk5Rbauqq9S9oqgyOSLeTiI58uOlAOgMvWBZkMsnbm2Zlom66xDu8nEce4GLNhVXKBYHqwjhleyVK2lyhroitxdrxTor8YsraxGdTZcjR1a4ju6U8BdGF5tGBO4ItlrBZICMG9PClcLCmC9dscBgJuqn7vneS5ZPRvisEQnMNiR72uuWJnwj9OhHttFYeKy/qkz/KEAqCKF0kpl9wvBhT5fpgbHj/H8jpAasBjd11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5PIT3+R6QgLBKrx8eSGXpqdDNDwlUz3ZhM6x8m7F6Q=;
 b=Goc2cUNdai05j0W0pPvvnAA+8/UOg4aMGeuISQBOZNBFBgr7JkXG1iJctIgnJJWKkKp2lN3n9YNtCQdtS08XlVR2Fx0fSC+CmLcvSZcl9GOS5NHuojCBh8CJQIeZub6XyaRnJK8XphHjTQY0Iwy3AQB002JkAFOeb5r1I2efza3v201/hGBngYtx6HmvNYuaF558XezUoJePBejZoLBr+BcVceF6FcQjLHGbCni+KLbA/YSl71ET+6FPu2LwFlVq9P0G46rJY1NBzdaWITD072tcCJe1QNoBzSfdyhpa/GhQ6Lxcb9uSk8o+3UEy69rIS+EIBB6fnj6JlrXNiXantg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5PIT3+R6QgLBKrx8eSGXpqdDNDwlUz3ZhM6x8m7F6Q=;
 b=AdCqfcUQwTHZHL3JIm0i8r6/FRlL6Z6L2m3WZLpNVi+zc5MjC75Wx0SKMi+RudwYmaUNcoaLZUGbU9oNb86K2xs3ZNAhECwXqRhgkohYRRoeZMMzvlo6/SrWklMesGPXbHDmoWNLL/LADM5cMoffqcjsFE2aJ6ObpLbo89SuWXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB4253.eurprd04.prod.outlook.com (2603:10a6:803:3e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 15:44:51 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::5c3:766e:66e9:8c4%9]) with mapi id 15.20.5438.022; Mon, 18 Jul 2022
 15:44:51 +0000
Message-ID: <48c97e31-fcfc-3487-d1c7-799cdeec195f@theobroma-systems.com>
Date: Mon, 18 Jul 2022 17:44:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] migration-guides: stop including documents with
 ".. include"
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <16E9C0CE66240BBD.28362@lists.yoctoproject.org>
 <20220427123341.228526-1-michael.opdenacker@bootlin.com>
 <b3764592-5af0-6ae0-baf9-31c7df5427aa@theobroma-systems.com>
In-Reply-To: <b3764592-5af0-6ae0-baf9-31c7df5427aa@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0018.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:be::28) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1025e619-cf34-4115-3910-08da68d47408
X-MS-TrafficTypeDiagnostic: VI1PR04MB4253:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QJwHG180VMQRuMtW7su3WHCkQGynRAqMXMpUV0NgN8jIrFZV681UyzJvgV2gjqZu6XncTiOHqx/fY93w7Eowy8sj9xmjKe+8C5+Etlwm7Z0m0PBITZAAK+9Q7sV6TnC13Rb3WiIQV5vhX3Su8VGLQS7zdtQW25lCUAPW7VijTtgaC5vuDzbtDcSW6EzG/Rscq8HM3jML/Wl2F6TAnl2eaalyOEZ1EImMAf+4G/b9p7lvoNxlleNDNWR5Y18B0MvPe1q1n/gRYPMEyxgYDIHuRnb/4xliReXkUVUh3yaAxzwL2h+44arXlSqT67Jwp3g3o0kBMf053uKBuJyFJ52AN5fIgGlBTviqPi36r+mvuNJe4otbkbBscgZuQEhWUjcCnEoiq4eH1j1RRJ5rmzSTQ/74n7yyj6s4Hbbq7q3FQifP2w7+Ik68dleNUej9IItmg9eQ6C0gAUov08E3exrXzB8HtXJnvamGEbIDrXEgHbxFaHT2R/7Gg7nOYh4IS1hD4JMcnIyz071RVCcAhcYCtD1meIomw39frR09zwER7wFd9w8xZPWyHZOcA70116j/yN3smeVTo7kqGW6HQzPtrcOjGd2dTMVlljfKRMEkKAiJ7m412ldx2ysHB4OAUGhNVolZtcCN6gw8VHhfpjeUReAKJ8C/6wsX8YCrR9RRKs+fVQtH00heglLp/oBCmyASXsnhKDo/+EqEEg5l8J3U1ee0I3byUdkG7G9NI/z8FXS2/71m3jrNG5kwx1wGxYVWgNnNTDqfnupae5B53vMAcsbvhpGOGFDbWwsC00L/80+VjLS3aU2m8C1niHMdeqeCxTd6q+X/hlK/Iujp1bhSAnrwDSfiIquYdwhhpyyipjw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39840400004)(376002)(366004)(31696002)(6486002)(966005)(6512007)(2616005)(41300700001)(186003)(38100700002)(53546011)(66946007)(36756003)(6506007)(478600001)(66476007)(44832011)(2906002)(5660300002)(31686004)(8936002)(4326008)(316002)(8676002)(86362001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWxVa2ZWOTIycU5nR1k5RUdZNWNybnVIR1htcmxyR2NNLytsNmNpT1lWYVhl?=
 =?utf-8?B?ZVRjSmtxZnpER2ZjYi85c0o3UUwzLzlrbWVubEg3ejVhNG5WWmtwRE1TYXhn?=
 =?utf-8?B?VU9ad0dkYWJYZHRKZHRXLzRIdGZrV3I4QkttazRQTER1dS9Fc3ZsbmxzdkNH?=
 =?utf-8?B?OEhUNVZqOFkxdi90MklKUUd2VlJTckJlT1Y0UkZZV3JQbVhRVFlWZmw0cDZC?=
 =?utf-8?B?QTV2OXF6VTFzL2xwRG0zTnlqWkEwWkRnKzJ0QXFBdDZNL053TVNLN0NzaGQr?=
 =?utf-8?B?bCt2YzFtajg5UmpNdkxxNElOVzRVN0ZwL1RHMmZqdnVSWTh1U044Vld0MVJQ?=
 =?utf-8?B?c2FjSDJnM1RueFFYSnhWYmYwZXp1UkNKWTdBWVZObVFudXlqeFBsaWphM3lm?=
 =?utf-8?B?Y01QNDlBRnlzMDAydC90UjVjbUJpaXYyZTFmY3F1Y2pQbXRzdDRVM2ZtN0k2?=
 =?utf-8?B?ZG1zWUFvVTRZb29SZzFaS0JhU0NmamtxV0hDRWtaTHdyM1RzZm8rNG5CbU5i?=
 =?utf-8?B?L0JYeWo3WDgzcDJHVXE1WXZYL1JjY290bUQxMm9rOEI4UVdXWUJBN3IrcjBp?=
 =?utf-8?B?UUdLNTkwdGRWZWgrUXpYK2R5MDJlVjdtTjBXTHo4c2F3bW1wbkJkbUdBNHdq?=
 =?utf-8?B?SG9CSytrTmIvdGlCczVDYlRaMWw5TW5MMjlYb1MzOGZ0RU5OS09pYXZPck1I?=
 =?utf-8?B?aEovUDNpdHBzTXVKd2huS3BkS2xXdDBaWWtVdDB3dEtkWFczS1hNVjVDclpp?=
 =?utf-8?B?Z0h2NlNiODVISmhVTFRUNUFuZk56TE1uVmQ4V0Rqa29RbHZkazR0dnptUmlt?=
 =?utf-8?B?emRBelpET1Z2NUt6bjUyY3kvTmVYYWZYZHpZeTVjeld4RDV3a0xtdXZaQ2NL?=
 =?utf-8?B?aDUvL0pmNjc0NzVLMXBjc0xCZW5BREsreDllUUVPaTBhWUg4aVg0VldRNDZq?=
 =?utf-8?B?Qkd4dTBLMTBGVFMzVUlpVkFvUUF5MzQ0b0JPdzhwZ1BGNCtvNHNHRWV2V0VB?=
 =?utf-8?B?eThyMEFkR09VYk0yNmF3OHB0R3o1SmhrdVFwNFFXWEVVVngxSHlhb043USt0?=
 =?utf-8?B?eUJIZzlpbkNHVkk0c3p0Yk1NWjlMWTNzNXc4VlhsRTNWWlViL0I1MVFqWjhp?=
 =?utf-8?B?VzFTVlEvdzc3Y2N4b3JJNjl3bXF3TUJ3WWdwaFRNOExLUktKNytCSnJoYUt6?=
 =?utf-8?B?WTZDTWxJckNWRUcvc1hVcUNYcWtmYnA1Y00wT2VTQ0Z0Rm85RHM2Q25CWU1V?=
 =?utf-8?B?TFNybDh5OS80SVhkMVFxSnNxZ3lCRDlXTVNaMnBUalk4K3lIS0kydmt6VW51?=
 =?utf-8?B?dXduUnlEUDRWQVRmUUthQmZycUd2V3Z3T2tGQjRHSmZabFNzRU5ZbzJieEpm?=
 =?utf-8?B?Q3cwdXcvMFZiNlNOR2dMVk9zdEt3SlFaUkRuc0xJQUNUZ3BJRkZVK0toTG9Z?=
 =?utf-8?B?MTN1a3FqZmQzSnYrQk9HTTFhN2dGN3ZQYWRHMTNIeDd1WmNGb2M5VmZnQzUw?=
 =?utf-8?B?SWY3WlJ6dlZTNHhxdlNFaFo0d0dnZzBKT2lRdVFJZkh0azA3S1QxQWNSdm1h?=
 =?utf-8?B?UnJuMTllbHZBTjg3SktCbXlJVHBqR3Q0RllGcmgwNWdnL2ZHRDMrRUdiTDRC?=
 =?utf-8?B?ZDA0TVBld2wyTU1rVC9Qd1h6Y3NYY3o3NGlPSGZ0NitHaVYzaUcwV3pubFpu?=
 =?utf-8?B?UGwxZ1V1ZEYzdDZFeVhOUmRoaGZSVHJRVjZDYVUrYjZLdTJhbU1Ob01MZ3dO?=
 =?utf-8?B?L2VoYk5CM2xSOWRpOVYwTTArVE9lYkMrMHl1UURkZ3ZINDh1NEFkK3YzNWZk?=
 =?utf-8?B?T25YVlQrS3RKb1hIdUhrQ0xyTHJseEIrWHhQblF0ejVyU0I2S2VYUnpqZUxG?=
 =?utf-8?B?QnhWU1RIS3NCZUtQcE0yUC9GLzdmMjdIMnU5UThSckUwNGYzR2xBMFZ0ZU1a?=
 =?utf-8?B?UmxmZEd3VGN1ZG9yNjlOMGhQWjNBTWhkcnRJa3EwK3hvaUMzWm9DY1BOWm5R?=
 =?utf-8?B?bEtMWXNKZTh1SlZldW4vVkhZNVJGRlhvTW9xT1hyVWJpYWVneW9oanpiVWtJ?=
 =?utf-8?B?cGUxRWxySWp5WEN6OGFRZDZRQ1pWTHhYQVVPenFYQzdGdDJPaUQwOTU1NnBC?=
 =?utf-8?B?ZkoydVg4NVYySmYwUGZDdjgyNEs5MEoxWUM5bDNvSm1YeU5CZWtLdkhLemRa?=
 =?utf-8?Q?7Mex0OeMono2cv2RCvDKT0rJds+SglY7Eqc/OFHhDZ4O?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1025e619-cf34-4115-3910-08da68d47408
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 15:44:51.6818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 l+N3oSo7ets8mF661bStBpBPzA/5C6wlnB1fKqFqu+3LVXsgaukY6uQGpRF0Pemv2+Bm7sADTpgGHn5zNglAQYkMxSX5p8Jz8lep8eRYB2Va4lmDq6d4WrwGE1dTDxau
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4253
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Jul 2022 15:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3061

On 4/27/22 14:50, Quentin Schulz wrote:
> Hi Michael,
> 
> On 4/27/22 14:33, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
> 
> Technically incorrect, it's Nicolas who's the author :)
> 
> git commit --author="Nicolas Dechesne <nicolas.dechesne@linaro.org>"
> 
> is the line to specify an author.
> 
>> This prevented variables from being substituted through the
>> code in yocto-vars.py, at least in the files included this way.
>>
> 
> I checked and the file actually gets passed to subst_vars_replace 
> function and the output of that is correct. However, it does not make it 
> to the output of the file where it is included. I cannot explain why 
> without digging deep into Sphinx code. I think we might be able to use 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.sphinx-2Ddoc.org_en_master_extdev_appapi.html-23event-2Dhtml-2Dpage-2Dcontext&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=e6PKnMnOMqKi4BV3-hST9a-fE11stVJHZpZN9uR5tqNa5vi1rMiE0ejzbI6SanFy&s=_JSWno2Y5lWBPelMgJ6iAVroNBXBmbcZViWJNAGJxRQ&e= 
> instead, but haven't looked into it yet and does not seem like a clean 
> way to do it (patching the html after rendering).
> 
> I think a proper bug report should be filed to Sphinx though.
> 

FYI, just filed a bug report: 
https://github.com/sphinx-doc/sphinx/issues/10678 (better late than 
never :) )

Cheers,
Quentin

