Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76012C0219E
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 11:20:39 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.85])
 by mx.groups.io with SMTP id smtpd.web11.48855.1739791237372588953
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 03:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kyKtryZl;
 spf=pass (domain: cherry.de, ip: 40.107.249.85, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbArlV+7jBUJ+ZMg8N4ZaCCkZU3f/g3jISf2eVz1LDh7x6wlRhU0mGnrLTL//EgZbdo05tDXP3obEV6Y9IzX3gQEZCgg9nk4mcwmefldvla8udvOtrqqgbpzvbP3B/q/WpTr9CUVrUjjEfTbkqN4S+D3m/3Q4KFFa7iDtmJXqe9ixs1NVBpaBJIY/TLX+HaE6m53x0QB9M3g29LCQFks+G493GQJvf6jEkx3fyeNvFeVvv9doVTtw6nQ2kCenqrpoQ9V7tLqPhs9heKkbN4/HhvpkDnPRdXXry3zxLfs9uxBrt/l2rRGxOAFHilizhiI2EcatyJrPlH6wtz2NZQE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQQ3iyledvJrNzE+ztiEM5Wug3NyB0BzNxKewB39GNk=;
 b=I84ICLOA2sAAMPmGI4wDt+1v7IVvyLMJytM7T4atBly0DQB0jyErpGz2i7BxwtopIhQvYScWdyntnTQOVKGKGT1xNgdPkzQmEuNZT2zg495QJWPobQ0jweEjO6kNGb0uwZnIsJCbzWcSMIbKtfgoMXUx7+8l3kjtIMLQbx3hugPhqPp0Q/gPVuDFCgkW2PbIiEW2/ghZqPiLoCnJxzKJuocTcHq14r56Am1rls0uxvkcybUCWjF744bGaY2ZGu7yQ8erMUyvJvYDahw1pp0v4wA4/f424k7BNaG3I0YF26imdSCpA4IiLXzI2uJkIQSYX3mk/3enls/iRVC1KVHqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQQ3iyledvJrNzE+ztiEM5Wug3NyB0BzNxKewB39GNk=;
 b=kyKtryZlYMw2MU6QzNMf5Mhk3IH4BZJyYxNj1ATlKvBTeMXxOPyoiUbjKG4fMgGPDyAa3ye73NyND5KN49Gwii2fJb68Fw6gbkEypllT5pY7A4WA3EBiwmaTG0AgnVDbTdzZvCXbFXIcgjXywAeY+uPFSYR8vv2v6hB2y+sh4ZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7884.eurprd04.prod.outlook.com (2603:10a6:10:1f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 11:20:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 11:20:33 +0000
Message-ID: <178a6b27-d616-4fd0-b675-ba4f2767656b@cherry.de>
Date: Mon, 17 Feb 2025 12:20:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: add policy on AI
 generated code
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: tsc <tsc@lists.openembedded.org>, Yocto TSC <tsc@lists.yoctoproject.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3abd59-b13a-45c0-7fa6-08dd4f4517f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TlhLclU3WkpSTTdrMXZNZjZ5TDZuMHhlME80cTh5T2tEaGpleDNPdC9xQ0xW?=
 =?utf-8?B?d01FVzIzVHlZdW4zUHVvSzZRdFhRUlFjNUg5NUhoNmdMczFUZmtxT2QwRVh4?=
 =?utf-8?B?UXdoZ1BuZ3MwalBYOTZxNUJybjlDR0FJTHM1SXhVU2V6Sk1hOUZCOTVCTE1z?=
 =?utf-8?B?QmFoUzlKbjlFZTFLUjFIdGlPeTdiWjNZTzUveUEwQ0xTWCtVNDM4UVJFOUh4?=
 =?utf-8?B?SkhWZkEyK0N5SnVPb3pDbC84aWY3eFJZSXBZcXJOMnJHbWttVC9UMXNVdnNO?=
 =?utf-8?B?RHU0V21TQ3hlRndPdzVRdG1UenpBTWJ4UWlCM3F5QTlRTVhyVFAycktGdnRQ?=
 =?utf-8?B?Tit0VFREeGlvM28rYmYvb2hzdnlVWVFpOVl4T2tIRms2amhldklCWEtZc1VI?=
 =?utf-8?B?eEh2V1lFWVp0QncwdURNNW1Cb1U5aEJ5V3Z3VHlaeXh5WjZsWVFIcG1aTVhB?=
 =?utf-8?B?K0N2bndldkViSm1aYU1nT2N0V3dueDRlK0V6eGgzczg2VnB1dForb1k2eUMx?=
 =?utf-8?B?K3lHUXNXcjRFb2VWNUZZQnl2N3FhQnJ0V3pIUnB2SkRUSGVBU3FkV3d2NmJ0?=
 =?utf-8?B?aW1xeGNLY3dQbkE5QTJwL1lVMldnY2VqOXFuZG5TZlFHTFBNZ3JVVjRjdlJN?=
 =?utf-8?B?YkdHc09WOEgxU2ttb0I5U0ZDR0Vxd1M3WGk1ektFc3B2MmJQRlF3c1BGU0xX?=
 =?utf-8?B?aHlkZG9XNklOWkZvUUNLbWIwa1IvemtSbmxDQm9tSDl4V3Q5eEZaNTkxV2VG?=
 =?utf-8?B?cHhxOGJEUEJwaDlINjE5clpiemlzK1ZqN2hqVGsxeHU5VW5jdmJaMkJzdXJm?=
 =?utf-8?B?VmZuTHNWSEdlalpqSjdCcjl3Nlo5cHZWU05MZkJIL3FVZnVWb0V5RWMxRlpr?=
 =?utf-8?B?NS85bjhaNE9DTWdKQ2t1Q1crRDJsUUMvcHdZaGh6SVh4ckxTWFBpTzJWN1N2?=
 =?utf-8?B?MG5GY1RCM0FhREp6VU5UMkJPOW1PWm1EQ2o3RUQrSU5JcGtmMXB6b3FFM0lj?=
 =?utf-8?B?dFFqMyt2U3lidzlzemMrMHhwbWRZRVUrb3g3d0pGOVlzNmZhVU5mWDVCSk42?=
 =?utf-8?B?aWNGeUFZamU3RHFNVDVxanVWSEdjU1Q0UWwzclBRT2lUenlaOEdCV0UxM0tG?=
 =?utf-8?B?TkhCMmNzc1pZWk1aSTBMM3JwR2NLb0VLaEhsdkdYUlA4SXB6Yk40MHhlVldE?=
 =?utf-8?B?WkpaNUN3K1pCYjNUeTJhelJYZ1dZRmtjMlBmSjVvMUh5U3EzclN1ODVlaHNy?=
 =?utf-8?B?U0tzVDI4VUU0Vm1sQ29tKzFiMFM2WEw5cUdPQW8wM0pmUW54Y0tHa3VJVzd3?=
 =?utf-8?B?S0lHbW1YcERYZ1pCV2VKbUU2T1pNQkhOc3N4U2xkZE0rZ0d3Z1U2aEwzUmVu?=
 =?utf-8?B?eDM3dk5jaFlUQWNVamhoMDg4RUNHbjllS0dLZXdxNy9BUENpdEJYQ040Q0M0?=
 =?utf-8?B?UkdrbmE2TUJUNStWUVh6S2FnV3RBeW93bFpQTHBhR2xaL3QrcTJuaC9OTWdV?=
 =?utf-8?B?a0RrNXA3NHBSUUcvV1VUZnQzbTZ0c3dKVyt4c1luelJXbms3WFRKMnhvRldW?=
 =?utf-8?B?MnJidWpjY2R2Z3VVS1NHU1VaRHJYNU9kR3lQSzNOS3N0TVRZV2JhdTJnZ1U1?=
 =?utf-8?B?QjRyMGFlL2thNXVrYitITTBvTDVQK3hZbDdLbGZJL0NLM0ptc3pXdlJBdTdt?=
 =?utf-8?B?K0d2VXQySDRYU1p5THg2Wi9KOWtVTWxIajJjNHlzUDkyMDBHMXptWnVncFEw?=
 =?utf-8?Q?GltmXuMpM4XaQ0KewuEi5f9R/v/kyjmV3Z6bbiw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3pUR0dFVGl1bzFVOGJkZUdMZHVJZDFIRWVSby9HaFJ6VnZvckNTeS9Ubksv?=
 =?utf-8?B?NVp5TTQ3ZHZXTU5rem9VNC91a0ZBYXRnb00rcWJBMjI4K2k0OEJubG9vSDNL?=
 =?utf-8?B?U1BiYjNaYXE2REU1TmMyS04xQ2xmSmkrMEtVcTFYd0Q2RnZEbTJ4SmtRZDRw?=
 =?utf-8?B?WERYZUYwSXhWOCtZREkrQXU4ODRtTGVwN0dIQWZyK25KeHFNS29oOEU0QU1M?=
 =?utf-8?B?ZDJ3MmNEMU01WFJJdjNaMzNES1dTekpxRUZaQ3pUeEg0bnRCYU56RC9NVm1j?=
 =?utf-8?B?TVRpNHhPYkFzd0pwWGtpcDBmZWZsVFI1aERFcmw3UlFHOXJncTZLanhlcndG?=
 =?utf-8?B?ZTJhUnhhaThYN0Y4UnI1Q1g4MmhzTlBRQzlYeW11ZjBPRjMxUlhPVGJEbUhz?=
 =?utf-8?B?cGVNZjFFUGQxdDA1RThnMHUweE5scEY2RkF3OXR5YlM3eFdNUnRMY1QraWNJ?=
 =?utf-8?B?ZlprT1I4c29KVW1VUDV1MURvOE0wQ2NobFdONTFzNHpHTlVWVURhVWltVURJ?=
 =?utf-8?B?cEp6UzNvWnA5MFcyZGRMdzFhdWEwM2ZYdUFudGVRY2VsWGFkRDJDZXU2Ykc3?=
 =?utf-8?B?NzQ2Q3hlekJwOTlzR1AvQW5HZzN4dXFXSzhPTmNBOTJOeFRHQTRWTTUwWll6?=
 =?utf-8?B?ZmRxY29VM0ZiazR5bXFhZHZYc2N4aHBiOHVMbk1jWEVLSSthd2MrT0h3VDgw?=
 =?utf-8?B?RTN2aHVPWmY5SDF5K2pBOC94cWc0L04rRUFOMTV1Vi9Ebm5PQjdSdCtRVzJF?=
 =?utf-8?B?MGpwNDdtaVoxdEU3aVZOTVpaajg0UkNOWWJUSWUrTll5ZzkrNGg3bVBPYWY5?=
 =?utf-8?B?WUVIZ2ZKek1WOVgyRzgxcW1YRzhWdEp1R2VsWEhuUCtaZ2QzTHczZGhQYkRW?=
 =?utf-8?B?WVdNUHhLMlBiZDNyWXF3VGpBaDludk5RaitaZGJ6WjcyZ1phWFBHb0MrWFdm?=
 =?utf-8?B?U2Fqa1NZcFBrTWdCY1JuYlJlZjA1SU5MTytzZnczRU1QdEtraStENllBWXdV?=
 =?utf-8?B?RTlneXZpcHhmVDlEL0ZtaG9BMUNwRTZtOEdvSkdXNjJlNlhBOXFGcTZtMVJY?=
 =?utf-8?B?dWFjSlh4VER6TEowR0VBWjlLOFNIYWtrQm9oMVd5cHEveExFQWxrRkNHWk5p?=
 =?utf-8?B?QjNIQTZQVmhzWXdKOUZWVnNuL3J4OG9oS1JjZ1dSaWEzb0pWeHNEc1E0dXdX?=
 =?utf-8?B?aWtNNGo5cU9OWFNHclpady82emx4bEd3ZHVRSnlJd0F5Sm5wNmE3ZjhLbW9X?=
 =?utf-8?B?SW9yVTdONm8vdzhzZWZLVWlFM3YrdXhHZjhpN3pydGhPazB3WVpzVlJsak04?=
 =?utf-8?B?K2hHbnlpVXJMTXdtSGZHUysyajloQ2x6WjNIdmNoMGM4NnVsSjJVd1RWTU83?=
 =?utf-8?B?NGJHaGtqWGtBWDJNaXpxQy9NN3lFOG1qWDREL2VHKzlQMHlGNWFWdWRCVmdz?=
 =?utf-8?B?cDRNczRMU0d6LzAvUnkrY3ZmYmkxMGhTT0o1bmlKdVc4NXNiNzBYVkhhTnNN?=
 =?utf-8?B?RWFVekU5UEtQb3JWMElFdFN0L1Q3Y1FIdmdRakVGVDlSODBQZGQzaEhKenpr?=
 =?utf-8?B?c0xXSm00WVBudWl4QnRiUk1CMXR3a2x4WmRaR3FPTnBWQWN1dklxL3lpSE4r?=
 =?utf-8?B?bERBQ3ZGYWZZbDBuN3g2aVBla09qdWNjamJWZ3VaaWhiRmJuajhUZWl2Y1Qv?=
 =?utf-8?B?U0pudzhLaXREOThBQTNQTEV3QlNUQjhsNVBuUTQ5QlJQYmg0NFNlcU5ZVGZj?=
 =?utf-8?B?ZVRDS0E3N3BDRThjU1pPc3hRbjlBVzgwZXZ6UHBFWjVzMkp2WThPM0RHVEpR?=
 =?utf-8?B?djl6blE4MkZBQ21BSExEZTQzMzJ5bVlxckRCa2JCa2IxRlArRFIrUVMvQ0FQ?=
 =?utf-8?B?UnNJWnROYjd6OXZGakl3dE9sYTlCTzM1Z1hKSFRzcUROMjc4UDJROG80UDFt?=
 =?utf-8?B?WmUxVnRaU0I0VXFKYTZIWEFSUGNKTWcvZFFVSUMyS2thSktRK05adHl0L0da?=
 =?utf-8?B?UnFzUHBxaGxwZ0UxcS9nT09nZG96YWI3eDZzWVlwRUxHQ25zSTBmbFhuRDNC?=
 =?utf-8?B?OWNycExHaUcwYlk1Q2M2bEZZOGJ0ZEF6dzVGZ21tUWdPSnVKQktlYUJtcTdz?=
 =?utf-8?B?UEdEY0ZKWGFvNytSakJ1U2ZjcSs0OHFuMklROTIvbFR2L1dlbm5EdlliUVk3?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3abd59-b13a-45c0-7fa6-08dd4f4517f7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 11:20:33.1941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UTqket35oMgCC9zWqoImdhAWJ+iW5vSOCiFAUljgT9/LnBwBTmXya4xKY30Rjmzny9aVkUjnDm4mq61xKy7iygtTY5gk/Tvr4leBUTJ9Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7884
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 11:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6380

HI Antonin,

On 2/12/25 9:50 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Based on message by Richard Purdie on the yocto-docs list:
> https://lists.yoctoproject.org/g/docs/message/6300
> 
> Re-formatted for the Yocto Project documentation syntax.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/contributor-guide/submit-changes.rst | 49 ++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 85ca987df..0675aac98 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -832,3 +832,52 @@ Other layers may have similar testing branches but there is no formal
>   requirement or standard for these so please check the documentation for the
>   layers you are contributing to.
>   
> +Acceptance of AI Generated Code
> +===============================
> +
> +The Yocto Project and OpenEmbedded follow the guidance of the Linux Foundation
> +in regards to the use of generative AI tools. See:
> +https://www.linuxfoundation.org/legal/generative-ai.
> +
> +All of the existing guidelines in this document are expected to be followed,

s/in this document/in the document linked above/ ?

Since "this document" could be interpreted as the Yocto Docs, especially 
if shared in PDF/ePUB forms.

> +including in the :doc:`recipe-style-guide`, and contributing the changes with
> +additional requirements to the items in section
> +:ref:`contributor-guide/submit-changes:Implement and commit changes`.
> +
> +All AI Generated Code must be labeled as such in the commit message,
> +prior to your ``Signed-off-by`` line. It is also strongly recommended,

s/,//

> +that any patches or code within the commit also have a comment or other

s/patches/patch/

s/also// (redundant with "also strongly recommended" at the beginning of 
the sentence; or maybe start the sentence with "Additionally" or 
"Moreover" or "In addition")

> +indication that this code was AI generated.
> +
> +For example, here is a properly formatted commit message::
> +
> +   component: Add the ability to ...
> +
> +   AI-Generated: Uses GitHub Copilot
> +
> +   Signed-off-by: Your Name <your.name@domain>
> +
> +The ``Signed-off-by`` line must be written by you, and not the AI helper.
> +As a reminder, when contributing a change, your ``Signed-off-by`` line is
> +required and the stipulations in the `Developer's Statement of Origin
> +1.1 <https://developercertificate.org/>`__ still apply.
> +
> +Additionally, you must stipulate AI contributions conform to the Linux
> +Foundation policy, specifically:
> +

This is exactly the content of the link provided above. I'm not sure we 
should duplicate it? E.g. it could be updated and we could then have 
conflicting instructions there. Should we say which one takes precedence 
when there can be a conflict?

> +#. Contributors should ensure that the terms and conditions of the generative AI
> +   tool do not place any contractual restrictions on how the tool's output can
> +   be used that are inconsistent with the project's open source software
> +   license, the project's intellectual property policies, or the Open Source
> +   Definition.
> +

There's a link in the original link, provide it here too

`Open Source Definition<https://opensource.org/osd/>`__

Cheers,
Quentin

