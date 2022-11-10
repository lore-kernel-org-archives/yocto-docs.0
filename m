Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56931C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 10:18:00 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.40])
 by mx.groups.io with SMTP id smtpd.web11.5814.1668075473469549926
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 02:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=eMJpfJmK;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.40, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlT3ler8hBPUiud/zVn6MiOdXAkUDuTusFKs8Nts0fZO2l7e6XLRFKjysvTqrfe7Nz2TPbQhOZUTGYd0LgploNJEVYHDJQGq2mYD7gI2mZBXIW2W5RuK+lezkCSWXZsucFZF4G5oU64/ppsppipSoVGaEC6/0ehd2oHPCb1rKEuRmTm9N4ggPU/MEuIkYlpbQSAuG5Dwf8FINyQZa+JLCrwKXz80nuDIwm/4NFVfgiNE3soUupPWRMUUB2LUBgPmvuWXgdnx8BgqmgCZGQMVbqGqSSa0HnPbCV0DpPuepcw2xEFGbRcvz8txzWDHUwBo3BtlBrUiSjdKiZMRcjfqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjy057AHpn3RS2LvMx0T/mOmb9h4Qg5w+BkLIGLM5Po=;
 b=NpBmAFmpqLKoac0R6FMkx0pd2v9owXRku3tc8MLsSI3TmBPAz17z0F4Uhy01PdgksKQa688iL/jMrGYIW2/BRtEuB6lI2AIvNuYE/azUgrCmkyjykoJrbxrKKCQ/1vZruJOhJBOULp+MnmKMu/eHHcMW8fdwh4OIsars/pSGjJDOeFTkomOT9IgWw74Z4LCrgPYSD4QXyEzJNr9UOVt1SqOTrIpi6mWlkeRRyAUGMPvUS/ncEZ6NsyGYtRhbYk6dcGC1A1SLo3RuyFpIscrobWIJX7tzjLhooB+dAYSTiWTaOue070Yo8OcuB2smZqsVzMQXBsVukcNcoPjDKLtGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjy057AHpn3RS2LvMx0T/mOmb9h4Qg5w+BkLIGLM5Po=;
 b=eMJpfJmKut81uc5myXdxEEDMWYVJ+Qud1cmOy7ytTA+HkB7uqhoTvEVCRYhu4Rfxg0UQQElZ6eDTl7EXaK+pVwqHz1r+4cdIMBV4JVWPMA7AmNM5jUCGANiBJ8C+c8M2d+mgCuFpW09iF7AomKRo+1hBocKUy9rHjcjQvVZt2cJojVHt8b61XVfM1by+v5mIoWGAJfreh4zD36G/p8t1bz370PnjLIh4I+oOJX8nQbJshocZ0MYdYED6fN6fLvw9KrU0g7QrZBqP6l6iZrWGoe7xQJog5OEcxXTlmk3ALH+EXNROdNPgBIVLQmjTNywIfopeITlbyGuzC4Et3MOkCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8945.eurprd04.prod.outlook.com (2603:10a6:20b:42c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 10 Nov
 2022 10:17:50 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 10:17:50 +0000
Message-ID: <ecba039d-3429-1cd7-f4c1-a2bb493ec757@theobroma-systems.com>
Date: Thu, 10 Nov 2022 11:17:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [docs] [PATCH v2] qemu.rst: audio: reference to Command-Line
 options
Content-Language: en-US
To: Atanas Bunchev <atanas.bunchev@konsulko.com>, docs@lists.yoctoproject.org
References: <20221110055306.6450-1-atanas.bunchev@konsulko.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221110055306.6450-1-atanas.bunchev@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: c2228195-3cec-451c-1b2b-08dac304d212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ya5dBvxNDSTG//5MH3FGLCgUk/+/i79QohO6sHfyD7y28rlwWAM/e8iH/XPD8PL4Dqlu5mIOxreFVylD+gfREl5P98d2N+5OinI6GaJ4wtarkY7xjAwUc7Hv7GX9EzCbrNPH22NdybOnRLZSwnFRMNgq2e8fhhsUSRSfZ/+Usk8kIkGRLiEtI8bw4ch1HYYyyXMhkyUQ4DB7SKU3Ip/kaCHxyAWCrDsQeFh3NhrPEnvjaxOasdFH4IUZsB2E/Z3FHBP/Qw+EE3MuKGqgpaAZZAlCmjHplIhS+ym9Fk+ZTs6O4jVrbDZrJ2PPtQqmqHCJgn+QljURtl8P0y1aMp9uCuOquRmQwPVXN2YgO5shG+dqGA1JNbuOldhbglOQamInkWdsrRVY619cWOO4Uy8QLvgSFs43Cm/TmPDGIluG7gwpIhoVmoi9l+94xqpET4o94WfBEzVT0cVq8mIekML9QtSevXnML9+L/Ppm+pFM+ED953xydpWSF13N1/9MlYXy4Z9YYzt/4dyPVDLekCJnKTCrcEzYMgazJ27BqG8UVEWar4SJXJ7NsUka0WTX7rZEeKQo34anvZcrD7ZenuX86tZVwGItlMaZXpGvM6rD7RdPUAF2t458V+VLLpuR/IaW6/j6eGS0YAVMZUOHf8ONsirHQQ2/B/gDRQeutFhgQhsQNK139Ko9qEZIRm1v8rTgyLNC6s20sOqicRin58aXZAxQp5VXRf5AzzfY8r7JlZbgWPFf823+SLSDb5ydPawqoONycxvTFuFTH8ViGtgGCY5Q67+wvjAQeSPp/6J2vZc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(136003)(346002)(366004)(376002)(396003)(451199015)(36756003)(86362001)(31696002)(558084003)(44832011)(26005)(2906002)(53546011)(2616005)(6512007)(186003)(6506007)(5660300002)(38100700002)(66946007)(66476007)(316002)(66556008)(31686004)(8936002)(478600001)(6486002)(8676002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1NHSU5aM0E1UnRsQjk2TzZXZmFNeUFZMG1teE4xOEVvWTFTMmVrekhEa2t4?=
 =?utf-8?B?Tk0vSUR2YmVJSTRoQ3gzRWplODNWditWT1ZBRHBUTGwyVjB2d1Njem1LaWRB?=
 =?utf-8?B?aEJtenNreXAwN0tJOFdoZERPdllUV0F3WEs1VHYvUWRlUW8xQTUvOC9PQ25V?=
 =?utf-8?B?M2ZyWWdXeVVkamVNeXgvQVlLVG52dVhISHZzak1lV2JpMWUvU0NYTzFuLzFO?=
 =?utf-8?B?VUNIN3R3UVJSaS9LZFgrQWtWU0p6cWRaMWQ2eHJiWjRZZzcwSHFsd2FvT2kx?=
 =?utf-8?B?YllFN1pKL2x4WG5uR2wxVEtUQVFKdVNaWHUyMWNjUDlTRWVjSkpBQi8vTXh6?=
 =?utf-8?B?TnFHVDVKRUZnQTd6Q2ZiN3IvNWpEemc0UUNCREJRK3I5Mm50QVRSQVB6bms1?=
 =?utf-8?B?Uk1kYkhTYXdrTStOaXZVQUFmUUxPK2lCMVArYi85cjNVRDRCOS9ORExhUDNm?=
 =?utf-8?B?RlZuTkZWazErQjhEdFo2TGhLRldrV2RWQW4zZ3R6UHdEQ1hHeDBtbmxMK083?=
 =?utf-8?B?aS83bHo5R1F2QUJTbUVNTFVlbHlTUXZESC9DUW42ZG9CZzNVNzBZNlo3SE1k?=
 =?utf-8?B?K2draFNucHlrc0lGRVE4YzVtczBWL1JEMXpYN3hnTHZwcUlSSE5HSytSV1Rt?=
 =?utf-8?B?ME9vYk1zMGhjMFh2VU1aMjhpVzYvbk5Qa3pWaVVzSlU1QW8zeDN1ZDF5am1K?=
 =?utf-8?B?LzVaRzBSMUM3WWJqWFM4dzJTV0JBUGVjMWxGVGdlVklPeTdCamlKOFR2WldF?=
 =?utf-8?B?V1VDbVN3bk51Vm5kOG1jdWltQlYzSUxHbjh2R1ZTRFJKUzBHakVFempPd0ta?=
 =?utf-8?B?WkVaK2czNVFwOTI2dHJRRUN5N1h4S2lFUFh6a0dBTE0wdVV2RkV5Vk1QR1N3?=
 =?utf-8?B?WmJpNVQ5M0pZSFl6SkJiUnlWVTlGK3RockJJNjdUVFJtdG5EN0ZlbmtUMUt2?=
 =?utf-8?B?M21HbnI5VXRIQTVya2xkdWtlU3I5UDZDdnBtellGNzRFOWtUSy9LWjJsWmFp?=
 =?utf-8?B?RXVhNGhmTTdiQlk0QTJWSktLYjVBSURYWmNaQjBnK3Q0VW1BVjB2dVpYSm5y?=
 =?utf-8?B?MFNwWkZDaHFPU3NiUm5jWUF5a2c4ZFV4bzVsQWY4cWpUdmQ1VmVncnBPbmlq?=
 =?utf-8?B?eXFlRmpIVDRJdm5nMkhSc0ZJekx6RGRxWHl0Y0xIWmdTSGxMREQ0Q2tEbkNW?=
 =?utf-8?B?UkliclYzcXVrZk1iMTIrTmNZQnFtUm1ueGwrSTZORCtLVDZLTWNIaTh1U1ZE?=
 =?utf-8?B?RFZWZmNoNjFaTlRFL2Z5RkNXMlZHYnp2U0ZkeUFMd3JXNkV1YVRRVVlkQWFm?=
 =?utf-8?B?UnMvZjBsL0lickRSRVI5WTVTZ2haSHZ3OWpPMTlTNyt2djRSbkVUYXdLL013?=
 =?utf-8?B?TUZJT0hseUdLbXY1c2c1YU9qczJsTDNRa240WXBZSEVZVUswZVA2cTh5N1hy?=
 =?utf-8?B?UlYrRjBCek9rd01pMEI5eUpSWXJLbUFYamlGVFhwV2FaYjZKRnBSOURIVzJl?=
 =?utf-8?B?THhVbFZvaXIzbVNEWURmbTFQZGYzU0tydUFhbEFGZ0lPVHRqeFlHMEUzL21q?=
 =?utf-8?B?MDlwZDB3Z0VDdUwvb3E0Rjh0VkFhZ1dVVStkTnhzYnd4RGEwdzA4Mm9IRFgw?=
 =?utf-8?B?RHp6aExCRjhVTDd1d1JGSlRua3JESm5vV2JlcGdaaElHdk00a1RFUTZrNGZz?=
 =?utf-8?B?TTEwUjFLOE52TGFlUDJvTXVlWEFBMVJONHpLa1AvbHVvcjFQbGw3S3FibExT?=
 =?utf-8?B?WWNMSDI3VnVzVXN2K0szQ0EvN2hxMDJqTkFXMmQ4b1BNSWJxUzFKY001NW0y?=
 =?utf-8?B?YlBqdDRSRVJhNEdlZ2JaV2UzYy9ZYVJHcS9RZVdDMGpNUXVWTm9BY3lTWU5L?=
 =?utf-8?B?eHVoTk12djdDb25EaTlFVTFJMnFoZU42MmlIRE5KOURreDBtSERTZ3NoMHhB?=
 =?utf-8?B?emxKNXNKcDkramRRVHliZXFVeGwyOWd6bDlKdW1hSnhBMEg2OXZLT2hobVJt?=
 =?utf-8?B?MHpXQ1ptRzAxNzZ6ckVZSUlSWEFKbWJCWnJ3LzdYNGxsMkdEZVRaY3FlSlR5?=
 =?utf-8?B?NElUbVlnZWU2NzNDQWRmYjNkdTNnTlhpSVNmL1V4dkVoaHVva0I4K0s2WXpr?=
 =?utf-8?B?WkFsWGlxSWVCTEEyd1dtZGNNQmtmdjQ4M09BL2x0eTc1Y1NYR1ZKbWdPSTdQ?=
 =?utf-8?Q?SuDPRIjIchgDQBmSrjhG3TU=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2228195-3cec-451c-1b2b-08dac304d212
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 10:17:50.0064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx6rGb1SiHKDWn4w/l4iVJ+3vjqjIN+Mp2MI8C/Wf+Nd8cvbGZmYzMsLRgV6rqGNu5+Lqq8FXH2mSF2Uh4xjtnKrwXq5qn3VeOjYSdNaTbI51LURNVoXfrTGQ9ki8KGj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8945
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Nov 2022 10:18:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3487

Hi Atanas,

On 11/10/22 06:53, Atanas Bunchev wrote:
> The previous statement can cause confusion, because this is the
> first time when the `audio` argument is mentioned.
> 
> Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

