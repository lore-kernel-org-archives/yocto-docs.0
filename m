Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702ACCCF9F1
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 11:00:26 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.64])
 by mx.groups.io with SMTP id smtpd.web01.20100.1761822018772494010
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 04:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PQaJ6CHz;
 spf=pass (domain: cherry.de, ip: 52.101.70.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y45Y5I6DtviniWheWR5YVE4VzJB075YYUjJlFhnDKIXMm215lEGSQZPOf2voCqpUV74zEBAsyEZOcK3oEASrspsA89o/Lxgo5F7o+ENYhRZN+dZGXlhHC5XjgIG6TVMYHBoL8eGTj37OT/oqxd7d03JxCP04aLnG40V+7tI0vDPxiCEMvSx1t3MgMSEyJBJEGoWZk2hCX282S8mgCWsGXgarHDd96Y7fyiGwagRAxcVxqFMwE9XcWIq7JnIo+lX1VxrDck8L38zJQrK9unpFHwAFGjr37co+ccq2IeAzHeQUBQVP/48XBCipFBw354xeItdbfCAGnLKb3B+Cq7ZJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rab5XOqhAg5kjKkXT6r0xPm69vZmpURpajyppuwgtPA=;
 b=XdiOhD+pi01RlFribGxRgX7ufOQiYqaS+TLLiH9egd+c1J5XjRDeBEEPwAwTUA6kPLZXfT3QJBVTCMhMl1Fg5vcMTM86JVQFBpWgFf1lgLRnas69XLXolwkDD7gRbnNHzVWIumcQu8ND1XzmNWv0B9V70JnYTJHw2MMf1LuMPbjdblw3k0naN3gWHhcu4VOaUO8LPgMiS7KtlAdj7yA9W2i9oONutSQEMURaP6hjgXCOJTJ9Eojvg1ZLQ/QhL7paV9HA20iIUDGqFMw52EectqW6Vb3hjfTJ1XAmsKkfChcXJcV7Bi7R1lGpd0Mb/cd2AuPt44Hb5NBkbkJc+9PAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rab5XOqhAg5kjKkXT6r0xPm69vZmpURpajyppuwgtPA=;
 b=PQaJ6CHzQ2/fOFjyO5AiNmbzCVe8fINDH229cCQwUQHjsWerKCouPGqYfu04A3YLHyWrGpEtmuvFzbS9id/dVWFg+tp4jn8Hc22N7cqRzM+Dq1cCQqhqlYKOjyBt9YRo7GNboYoCI8vGyREVdSbQRN/HmdjEgXvchT9bqawX60k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 11:00:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Thu, 30 Oct 2025
 11:00:13 +0000
Message-ID: <2c92a61a-25ac-4b38-97fd-03af06f38bb0@cherry.de>
Date: Thu, 30 Oct 2025 12:00:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] i may take a crack at writing a section on FILESOVERRIDES
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <e91d023a-dc34-656c-cbf6-05bc0fd15a71@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e91d023a-dc34-656c-cbf6-05bc0fd15a71@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5f15ac-a39e-4cb1-f3c2-08de17a38034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWZSQ2YzbHNyRjlqWFp6Z0p5SGlnQ3hYRFlNcWdtRmoyZjh0NGlqOEJBWkxY?=
 =?utf-8?B?VXR3MG5BbzhMSWo5V2NLMEcwMzQ1c0JTeTBFeXN6YWkvek1JZTFEZThOT3pz?=
 =?utf-8?B?U0VncTB0Q0JxUmFRcEVjS0YwZUJKa1dzeFRRd3pHRHcyTkZHanB5SmdzNE1p?=
 =?utf-8?B?K3dCR1ZBUkdiMS9lR21kTktCYXNYbFAzcUF0dmF4NFJQTzI3c1ZFb1A1aDFn?=
 =?utf-8?B?QUNpbU9hZTIyaGRzZjJZUldxN092eXA0QnFQTXA2aklrc3pROU1qSU5uQnR6?=
 =?utf-8?B?RDZFQWVlNy9Pc3BZVlJaNzFqNFd6TzU0VWV4K3BGM2FHeStiWGNZb3krL2xq?=
 =?utf-8?B?VXJLSHR2S1dqamNPaDlYR1QvN1FPTG52ajZxcVBKZnJxRDJLV2EzZlZvWEl5?=
 =?utf-8?B?c1BlWUp4N1BtWjJLTWkyZENIL0ZnV1NqODFvUFoyQWJBeXEyenBRVkVscVN2?=
 =?utf-8?B?My9SdG5MbjFSU0xhdTNxZjZ0czduL2JURUN5bkJLTFdneWUrRHhBMUhUSU54?=
 =?utf-8?B?Ukd5bFM3NHJuNlFlR3RUNUlJaUlhVGc2bjFOUTYydnZtaGdEUTFjZml1bjAv?=
 =?utf-8?B?aFN0TWo5TUVUWkFIdzgyUCtLdXlTUFdrMVN2VWNWTUNkMUxJYUVzaFFMMFlq?=
 =?utf-8?B?UHBKbU1GK2plL2J0RDJacVIvWC80OGU3aHlyUndQOExnbmNMeklscXdqeUVt?=
 =?utf-8?B?Y1lENkVnUHFxdEtldEZEOGl6cnpmYmhKcTduVnpES1VEYWUvZ0cvbk1SM3NN?=
 =?utf-8?B?RnJBdm1GVHk5ZGh0TjJnQ3daZ3ZQQkRabWdrTGd5SVAyeitlZXFXVW5CeUc5?=
 =?utf-8?B?ZTNQUkZvUms4MGJNUTAyTlJYdkZhZjdOTmlBQWVYV0xha0pPWFZQVngyYnV4?=
 =?utf-8?B?b3ZjeUludjR6eUhqRFR0K0ZoNjJuWjVpMU9xcHhnRmpPaTVZVlBYUnF2OU94?=
 =?utf-8?B?V09jRUwxdFNxWDh4RmltS21hZ2VkTkMyMEZUb2pQeFA1MWp1YVlibkZnck9Y?=
 =?utf-8?B?SmZoOERuSUFqeUdPaDNSeWdhMkJROTNSN1BmdUVPVDVwTGxqSnpIMFVnZjN4?=
 =?utf-8?B?bnRVTTFadGhoK2Q4VG1UZ1ZYZjI1cFpCbG1hVHkyVFZFQVJ2NEZzbEs1MkpO?=
 =?utf-8?B?TUs2Uld3R2Z2Z3pjd0s0QTZLaVQ3TCtVbEVZRkt5cnJXQzlLZ21OQTFYYjg3?=
 =?utf-8?B?M2t0TmlKZHl5Wm5oelJudmlxWFlMYy9YTEs5eWt0Y252cVlvYUQ4cmFHS2Ju?=
 =?utf-8?B?OEV0T1RObzJWN3JoSk5hUkhDQmtPOEhrczhOSlQwSElNdjFWTWtadTZ5MFlX?=
 =?utf-8?B?UG0vNG5VeGcyR2NPdk04UDk0elBOdmhUWmJaYmdrd0Jva2lOZW1aazFSbHNa?=
 =?utf-8?B?Rzk0WjUyV0pRUmxHcjQzK0NIRk93TVNYUmg5VjdOQ041K0h2VXpBRmh0Zi9i?=
 =?utf-8?B?aCtxRkdBb1NoZWdBY2V1UEZQZGduMGlCNGlJYnVsWjJISVNJT25VZ2luQkdW?=
 =?utf-8?B?a1ljNDV3TnZVbDdiL2RGZ1V3elNubzJ0SW16UDR6U29sUUJJTjEyN0hWVnlQ?=
 =?utf-8?B?amNvMmVuYXhRRE1TOGliZXRiTEpwaVB1UDE4dEtrdjJCTjE0UDlnQWJJemFL?=
 =?utf-8?B?Uk5FUGgxOSttc0tGNGVBY2R2VWVVbE5kWGI1NmNpSEZCb2paejNyd3UyREJK?=
 =?utf-8?B?bjZXSlF0RzcrSDZPUGtHWGNXNFJmVnpnUWZjZUtLcGkzeUU1WnA1S20yRlc2?=
 =?utf-8?B?NGRidElyVk40bTM4dUlXSTRiaGIvTTRBT1ZmNWdUakszZis2WE9BV3FLcnFn?=
 =?utf-8?B?UXBYRVBBRG9OWjNnaTBVRmtTT0M2U0FhU3l4ZUV6SWRGQTZsL3RNdzg5dU1j?=
 =?utf-8?B?K3VsZHprNVBjUGNSK080cXBGU0pqSlhJWTExdVVWVW1ad2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZTNFVlFodWNSaldmemlCWHZDaGdpZVN6L09PSlF4ZVRiWmFGNlRST0EzS0Rm?=
 =?utf-8?B?c0lOenhWMDZ2RjFtY2Via0xoRTBodDljQkdYdC9PYng3UnNyNmw2SHpJQ3VB?=
 =?utf-8?B?WUpuVHI2WVd1c0ZYbVlBMnVoTGVMNkwyeGppTnVVK2xPZ3d5REtsbVkrUkxP?=
 =?utf-8?B?SlZIYkgxajlCWkVRZUR2Nkc0Mm8xN2thZm5Kc0NrcWNBTmI2U3plTVg0dUdk?=
 =?utf-8?B?ZSs0SDJLdW1qbXF0cmwxVXFWZVlXMUwzWlUzMlJpSWRLL1hHUzl3UDF2enh1?=
 =?utf-8?B?SGliWjVseUdYUmU0ejlURTh0SzFEUkV6TDJOTmtMYjRRTng1ODI1KzBSUEhB?=
 =?utf-8?B?NTFPTDZZNXFmTzFVQWJKNWdNSmZMMnVCd25VMXEyZk9sNVpOTmJTbGp1QkNY?=
 =?utf-8?B?U1d6RnZwUjRGaGdleTZsTGZkcjFQeEt0RU1aQmdLVXRFaEFvME9YaEx5Qkw3?=
 =?utf-8?B?SllVSW9IMkNWR1U0eEFRNG42MzZseG9uUDY3aURYOGxienJnNWI3VkQ3MHh2?=
 =?utf-8?B?d2FiUWJ4WVZrY1RPQlBQNmFoczhsN1FZVW1CUDdDYnl4aGxEd2pOU0ltY1hn?=
 =?utf-8?B?TWtobkJTTjZ0WXErNmNMZ0JncFdrTktKeHp0dWt6UXhFYmRmdXZVVEJ3aDE0?=
 =?utf-8?B?a3RpV0Rkc0l5ZUh4SEhVVWNNK2FTRVBxTGw4Q0tqeUJxU0hjMERLWjBCbmlq?=
 =?utf-8?B?Nm9HenEreUI2cXdNK2swT0IvbVMxVlUzZHdoVlNYYzJoM1l5S0p3cE1YWkxx?=
 =?utf-8?B?VnU4RDJSc2VOWnJjU25oYnV4UjBndElYaFdwOEcwOFBsNFFPUGNYbm9pUmVu?=
 =?utf-8?B?eE9za0I0MWxEVmUxL0l2S2U0VGlCWHlhMGV1QmVkSzJzcmsrVzdrcTExSVIy?=
 =?utf-8?B?UHhGRGROWDJGYXhraWp5andRbllCWTJ1dVYraVJLemhydGNRQmtDWkZtaUFO?=
 =?utf-8?B?Ly90L1RpNE9KdlVRUnc0T0ZIOGZpU3k2c3ZkenlUaVdvNEhieWpsVElxWTFU?=
 =?utf-8?B?dEFmc2svU0laTUhURUFNQ0Zyb1Y0ZjBKOTFtTGhwY0dpVlR0UlV0a0RqWmJu?=
 =?utf-8?B?ekFWaEF4MjNLRmg5Z2dGdmw1L1ozdFh3S2R3blUvdFE4dlF3Q1QzR282aXlJ?=
 =?utf-8?B?N2p6QWViU2d1aGQwcFlqVUFFUks2RXhOUmpkWGhsT2RMYTNGY2N3bWFhak9o?=
 =?utf-8?B?SWlGKzN3WFEzazNyRE9qb3dVVm5ESU8wVnhralIwQ1IyKzNzM3Rhb0pWRGVl?=
 =?utf-8?B?K0ZlaG5qL0pEZUp6UHlnOU9WRkVLS0xSWCtTekJrb0FMUlVaOUxxQjQ3T3Y0?=
 =?utf-8?B?bWNWUmt4bnJMMlVuRjFENTlyL0FIUlRzZ1kyUXhWWE85Z2FPZmxJd2ZWQzBH?=
 =?utf-8?B?cFRGa0kvNmlKQzlCNWpCckwvQlFJRkI4YVRNZkNNSmtJTWdOa2FkTWRZSDFi?=
 =?utf-8?B?ZDdjNkhQcFh2NytvZEU0TmVFU3FiL1ZJdmNWcThwWittay9Kd012eVB5RUxN?=
 =?utf-8?B?M1hrUHdxQldJMDU3UkxCaDZvT3lBQmtKbHhZU2RjdHd5emxQQXljMnZZNWRO?=
 =?utf-8?B?Z2Z3ckNKMkE4QSswM2N4ek85RGtFbTgySkdYcHZwT0g5VENwZWRFRmwxQlcw?=
 =?utf-8?B?VitFUWJmdTF6NVRoZWdneFA1clVCdVZTOXgyVC9xSDhoZmJTaWVJNnBVUW83?=
 =?utf-8?B?Wk5RVE1FbjErWlFLalBxSVA3Rk1RU0hkYjF4WHVJK0phRStiT25ZRGRhUXhF?=
 =?utf-8?B?cWxQQWovcG9vUUxtRkNwbjZQTm9FTmozaUpOYjBBL2xZaUNzakRrZTZKVjNS?=
 =?utf-8?B?bUNRWGJOMFMzVmNTc0l0SmxSR3NlQ0huQk9mRHlXcWJsdXlEV25hazcwOVp1?=
 =?utf-8?B?dFhpYmNIaDVZWGtlNFJFdjhlTXpRUTBuY2NkUDVycyswaG1UdFh4THpsMVlB?=
 =?utf-8?B?RE1hWW9ZUWxvUnRZRFdWT1RheUJDVHJQMlB5UzM4aCtDVE5RWERReDBOU3Js?=
 =?utf-8?B?ZFpTc2s3cUttcU1QS0lzME0rRWtMM2RDS3dITGFnN3VXb3Y0aG16b0hkTldD?=
 =?utf-8?B?L2U5M1hsWWFMV0x6aXBLVkM5R1JJS2NTZ1d5N0ZDd1hPT1pscTI2RkRQWWp2?=
 =?utf-8?B?TnZMZlNScmxLMzhmRjNtcDRJQXN5MGYzNFpNUzJoRUxuUjhKOHIwU1JYRmNE?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5f15ac-a39e-4cb1-f3c2-08de17a38034
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 11:00:13.2655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+TdOCcM7RRORbYgdw9PCGiw3O2RDAgwNubGQ/0E4n7ZFrGxia6EHgdqngOx+L+wnpJQKLbbTsZFfwWsoHOdJx6YGCC8YrNuaI/DOtY/Heg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 11:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7914



On 10/30/25 11:50 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    related to my earlier whining about how much documentation was being
> (IMHO, inappropriately) dumped into the reference manual, i'm looking
> at the section on fetching:
> 
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#fetching-code
> 
> and how there is that lonely sentence referencing FILESOVERRIDES:
> 
> "The OpenEmbedded build system uses FILESOVERRIDES for scanning
> directory locations for local files in SRC_URI."
> 
>    i think that feature merits a comprehensive sub-section under
> fetching (pulling out most of what is in the reference manual).
> 
>    also, as much as possible, i think the docs should refer to actual
> examples ripped from oe-core -- for this feature, i would bolster the
> explanation with the perfect example of using FILESOVERRIDES:
> 
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-bsp/formfactor
> 
>    not going to do all that right this instant, but i'm convinced it's
> worth doing.
> 

Note that there is some surprising behavior when using the layout 
allowed by FILESOVERRIDES and bbappends and I think it really is 
important to document that.

https://pretalx.com/media/yocto-project-summit-2022-05/submissions/SCYYWD/resources/Demystifying_the_OVERRIDES_mec_2lZOP3n.pdf 
slides 102 and 103

Cheers,
Quentin

