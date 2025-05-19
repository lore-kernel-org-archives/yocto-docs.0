Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A497C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:07:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web11.48556.1747652822631004660
 for <docs@lists.yoctoproject.org>;
 Mon, 19 May 2025 04:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PvpjHpaq;
 spf=pass (domain: cherry.de, ip: 40.107.20.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8HfUPmNMvNxtBkZm7k9HQ4oKWxr5AIQ1SwZ8eWTTWBScqjFXTyyueKYvrx9qrTbDtOK8rYmlK9KaOpD7War53sxt235dGvLh7zcE7W0m13wPrfMRhD6d6WTm7QEjbs3xhACtmZUYfTxqm7vgkk0KaerivTTi9nvKanM/TkiqS/Z+NYbcJrtk0ZMY4h+DSJS7IQmYqXiFuvM3owQhEiRy8RUhA7OMO/SKFKF7TyqRqEzP/S28gy6Zvsu/vvVLfwjTWd8pICJ9/xalkMkVk9XamFnzMyDJt3rElp5kuNwk1PX1M1VQs5xjEFzdcDWa3IuNhWmrR9jpQTmp3TLWpYSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+m4T+7WabQaV7/NVm6ApjpXWmsCQdLwH1gYWyalAvs=;
 b=fCn/Mz6T6QlguAiDfsbgDCGX5Xl7xZKvRG1Bixxp4ZVeRTPj1Bj8OADDqn8t+S9nxBj7cKPwh8m+1VZUx/6FOPNYyCOoyAe+F2B/fNhDynipl2IRHqQXE1rLdLwhiFeP46Dq3GvEr5tksiWvseWMm0fk7Q/sapqyNXpuNes/P2UmPtSvxEaCaHA8yUju8RSE21rBdwT1rXs8azNeNOUrZqJDJ5enSws6spIY6m+srarYZmcNqz7WpR2BdUeEA/ytWgLqq4b96wpX1rlZ0mochhhCYE1V0ynxGbqAMvP6uaxHyq3B9XNUZtwsczQSFPJY8mjiLikz7BPYZtkg68yl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+m4T+7WabQaV7/NVm6ApjpXWmsCQdLwH1gYWyalAvs=;
 b=PvpjHpaqmSzIMoFuaS6GGdZiHsXAtsCNpgjQcDnN+o/b1GwAi9vyMGWPzybomikzMAMlpuvctHhhbyfQI+AtFHQsSKMjGP1mZv6qKQRy2LhR7A7qfW5JnuGO7Akji37gcbN4Qfgy4hMGUNAps7qdDZzMvERmhT5AbkFhpkLrHc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 11:06:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 11:06:59 +0000
Message-ID: <d0c38440-d023-44b8-b672-b959a9ae359b@cherry.de>
Date: Mon, 19 May 2025 13:06:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document
 INHIBIT_AUTOTOOLS_DEPS
To: alperyasinak1@gmail.com, docs@lists.yoctoproject.org
References: <20250519100534.44168-1-alperyasinak1@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250519100534.44168-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0298.eurprd07.prod.outlook.com
 (2603:10a6:800:130::26) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 4124d485-d09a-4e94-4620-08dd96c54691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?czI0bndKU3h5eE12Y3Y1OHd2Y0d2WGpjby9uVFhEZEFvM3BqZEVIZEZrcm5C?=
 =?utf-8?B?d0V3YWlBU0NlV0o1SkxXeEtRai90TVllUTF6Q05wV3hRSE1WYWdHZk1XcW9S?=
 =?utf-8?B?R2ttQUpnNGhsaXdFbGsyK1FqNTUrWndkVEU4MmhoRDZoM0tMZ3c2VHFZTWtq?=
 =?utf-8?B?RDcvcS9NR0VYM0Qwd1RGSzVadWxGdFV5cWpwREtnMnhrUWNIVzU5YWNCdUJv?=
 =?utf-8?B?aVhVRzVVcGw3cGNhV0NtbXJWTzhEV2ZXN012NXdzMmdQMVptSXg3VlFiRmZi?=
 =?utf-8?B?RXVYeEpWUkFRZDJ5cGYwbW9CdUhFbGoxRFYra05SenhQejdKa01jekFsbldr?=
 =?utf-8?B?cC9zSHlPUUlUNy9aLzU1aG1WRFFiS2k2ZDhKbkVVcXRrYWhUYUZ3RkcvaG5M?=
 =?utf-8?B?b0ZFbllydHA4dG1tS0l6a3poRWZFcHczS09GTDV3MXpNWElBUENSU0thQ2FE?=
 =?utf-8?B?cGYxKy9zK3Z3SFF3b010eWtoQUtjV25Ib2Z2ZmNydEJuVlZuKzAzV053Y0dv?=
 =?utf-8?B?NjlTT0FYcy9NL1BMd2hIZnd1R3k5YzRtbU9iVmE3ZjVHU1lodjlqNnZvOGtQ?=
 =?utf-8?B?V01RemtPamIzVldEMW5FTjk2SktZMUtSc1NkUFpGSmRrOTZIQ2loWXhqbzB1?=
 =?utf-8?B?N0h5VUZsUWg3V0J3L01KTk1hN3JQNTZkYU01NjlLNWFHNzc5VUEvQlR2eXNz?=
 =?utf-8?B?THR4ZmlXckh2WWhjVHpwMFAzTXlVekNJUUJUNTQzK3pwTjd6R0pEa3lXbXp6?=
 =?utf-8?B?OGpzVG5nMk5GREIzWGQvbVZjTHVaZEMrUDZxeU9rRUpOTUM5MWhsQXkyejNv?=
 =?utf-8?B?WDRlZThIRjl6SFMzOUhKdU1zWnM0aDNFM2hXTGxqbFA2QUZGSFU4cGRvN3FI?=
 =?utf-8?B?ZVFRd0RhZ1U2MkxualJubE82RFEvSlpqamxVaERxYW9sWURYU2FzRitiK1JW?=
 =?utf-8?B?MCtNMFJHeUdIckRDeUMvbitPcHp0a2ZreGVCMEttdC9iUUlJa3FkN0VUR0tV?=
 =?utf-8?B?REhhZkF6Y3ovNENta1JxQ1Izai91T29qZitPTzZBZkFmRmZKVEE0czR0alV1?=
 =?utf-8?B?T2lNOUd6RlZ1T1hxZmdKRVhvSlU1WnBEWTJZN25Rd205Z1oyZ3M2aXdiUkVi?=
 =?utf-8?B?U3J2MnpOUE82d2FOdW5oY0F2clJhNHhYb0IzZENJekZlR2RlUE42YWx4cmYr?=
 =?utf-8?B?Z3grUE42aHMxcGJTbWN5azJDZFBYVm9uQkZ5TlR5Wit4R0xtcWZPMWZzYzhC?=
 =?utf-8?B?ZWV4YzB2dSsrdzdabDhNalJqMzNVdTNVSHRrT3N4K3lnL2pndmRlNVRQL1JO?=
 =?utf-8?B?ZGs2M005eTU4SWJ0VmQwOEtKY3lpZEdHVkZXL0VWZ3hheGxqL2FaWUFzTTFv?=
 =?utf-8?B?bVQ1WUJnMjY2L1F6L3BoKzZvdzRLMmQvQldrZlNpa2d3VGNSS0pTL1hCUGln?=
 =?utf-8?B?R0dsOFhYTkg2U3kxaUpaRnl2aHEvc0xOZ1J6TkNXVEJ6K3BPQSt0dDZ0NXhB?=
 =?utf-8?B?YWZZZ1VvZDhDc2UzcUN1cUpBdzBsZlE0UFNxMTBpUDJZb3NqdStkRkVvQVNB?=
 =?utf-8?B?QXR5cUNGVnZTM0NQWWlEOGlNQzlXMGhTR3dTZEZKczhWTXZpQ3VqSm1adXdv?=
 =?utf-8?B?bHc4UXZGQ3N1ek4zSkJsaTMzTkwwbnI0NThhK3AxaXhuaW9BeU04YWg5Vi9n?=
 =?utf-8?B?MXRZVHA1WlZaZ01kalNLeUdST2JxOU9ONDRZejAvNFpBNldKQ0hBdk5CL1lK?=
 =?utf-8?B?MXN1RzZlUjZCZzVVeXMvV1BPSXcva0p5RFk5a0dKNE53Y0UxSTk5NDc1MmlU?=
 =?utf-8?B?Wjl5NTN2YXBEaTl0d3p5VVdZUGFsZ1FvZXFqRHN4dWp6b2g4ek5NUndkYVQz?=
 =?utf-8?B?Q3NsTS9mUm1NUkZJekZVY1IxN3ZPU29DS0NGVkViTVNyTW9CTUJ4ZnUyb2Rz?=
 =?utf-8?Q?l2XOLvA1/ps=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1lCUzloc2p5a1JFTGNlemRScWNZbk85OWE0SVlZNFltZTZTY2E0OGRweWtL?=
 =?utf-8?B?RzlKdGozNDZOK0xTTFU5MDk1NGNpS1U2ay94SWtGUGpKeWZ4dCtYclk5Vk9F?=
 =?utf-8?B?WkpCVGx3MVhIYzljTXVyeEN3RW9kWGhQUFdwQkdSNjh1RDJkVnNjTmoyM1Mr?=
 =?utf-8?B?cDBBS3FmRXRSSXY5aVM0MW5zbnNyNU9SaEV0N2NMZ1BTTWZSS0VMOGI0b2Jy?=
 =?utf-8?B?NUdtSk5MRmREODR3Qk9ZVENpR043RlJRcmhtbGowUUJmemg5cFBkZk5EZlF4?=
 =?utf-8?B?ejE0NWZYdWRYMktQVnF0RmtPUHU4Z0hyNGRhQkUrSmxkKzM1bE1UVnFEMDR6?=
 =?utf-8?B?MFdudk03QjJoV3RycVVhbHdZRXVUNmJsanFnNEExZkxoejJUSHo5S0FDYStY?=
 =?utf-8?B?dlFqY3RmUVBnUzRHaThiRGswbk5XcnhOZkVUVml5TTNMdDZIcUNFNzB4SmpR?=
 =?utf-8?B?Q0tqMDRteVFqcnlyMWdSeS9SOWluMGZZaVAwN3FWRHE3Nm1zUTk0b1l1czlL?=
 =?utf-8?B?UXg1M29HUzg5M2t0ZWVEWmZJdklpQ0krMWpHTHdDTVErSXM4S3gzYk15TmRE?=
 =?utf-8?B?bjFza3B0TGlTMitBZXNoQnRVWGNXbXZOYnphTEprbjlvQUJwT1ZkMHlsTmc5?=
 =?utf-8?B?cGpFVzZvRTZaSkJOak1rTnRReFlZWjdkNDlvbnFSejk4cGtDMzE2OGo3ajk4?=
 =?utf-8?B?WXplZE1PamxONnMvanJCYkZ3eDYwS2ZyUEtvR3BxRGJGSVFXMk16VGhnQkxi?=
 =?utf-8?B?ZkZzSmZvZ2IrdG4xUjZzSnQzajRsZGwraEN4M24rRHFIdkFORDRWanZZaVRr?=
 =?utf-8?B?MGhLWGpGOVFjQWExQ00vUS9Dc1JkRzBmTHBRWEJITDhCNnd4T0J6TGRXOVdT?=
 =?utf-8?B?VHllZ2hLcUpEeHdDRUJRbjdlOFVITTZOTDJyZU9QR2ljZ2ZSYVprZ1JTWWw3?=
 =?utf-8?B?NUcxL2dmeCtrV3BxK3FKZ3hFZWNQS1BrK3QxY2tMb3ZIajd1V3pERVFkS0RG?=
 =?utf-8?B?WTRaTm03b0FvUGVSRElTOVRIYzR5bmNDY2ZhR21wTUgwRjVjM3FxWm5iM0o0?=
 =?utf-8?B?bTdjNE5nSmNaNTZCNk9jZzNacnFnSEwzM3B5bTBIOWZqTHpFODRVdXkwQnh0?=
 =?utf-8?B?aDFIeFJ2clJDZHVxYnBwZGp1RmkwNGMrVGl6VDl0eW9yU2NjNVV2L0kyWk52?=
 =?utf-8?B?TnFnUUh3VWxzbWNxaUcybTI3YWxRdENXNm1DcU9yaExIK0FKL29QZjVoSWVS?=
 =?utf-8?B?YVU0N2JzcWppbDhPbnhuQ3NYSHlPVHArR2J0clpIUjdFcFNSVXZKVE5mUWdz?=
 =?utf-8?B?Y0tSd0tLU1FkeWQ3dEdMSUMvdWU3cEtPUE9POTU4RXh3a3VUQjhqUC8rZEFL?=
 =?utf-8?B?QlN0WFVEYXlWMGVxdlpXNHJhNlhtbGw0WVJGcXdjalQ4cUtZZWI3N0JraWtX?=
 =?utf-8?B?bTNQLzcyWTNtUDZ0QmY3SVBwN0hNVS8vYW0ybXJOcjJoazY1NFlSNU5nVXNG?=
 =?utf-8?B?RC9Bdjl3aGFhMWdIckRrMmkzTGd2OVh2Qy8yamhuYmNkTHZyK1pCTXdJR1dh?=
 =?utf-8?B?QjQwRk41WGwrc1pPTVlZWXNZL3ozdDE1S0Q3dTJJTFdaN3RpQktmRlgvVHpr?=
 =?utf-8?B?ZnovK1VubFUrN285Z1QzQVlJSk1qTXZTQ0ZLTTJrQ3JGa2JNUkFPVjFQbVpO?=
 =?utf-8?B?VDZqS1NES1NmL0M4K3BITVZDNzZIc2NUNHRPY0haZUZJMXNsTFRjakFkR2R3?=
 =?utf-8?B?elFGeVJQUlBoM1dZbmNnYm1GYVZhcEdKZWw0R01meDZwZWNoS1ZtYmt4My9T?=
 =?utf-8?B?V1cyWDVhVlNpZHJITnB2RXRQNHR0dzJ6N0dOcVdxQXEyWlFNZzIzWlpJVllB?=
 =?utf-8?B?RG9UcXBaUk1URTZQajI5dDBkaWhXeDB5UExQcENJVWJDM2xoS0ZlYU1ua0Qw?=
 =?utf-8?B?Wm5TczNiazN6bEpBMndlYlZrYUFINkZZT3dQVWc2VWV3UlhPM1o4N25janNV?=
 =?utf-8?B?MWkyV1lkMjZCNUsvMDNqMGc2VWdNNS9raTJBWTZ6a21Db2w5U0UrQ2tuNTNj?=
 =?utf-8?B?dk9FNzFFdXBZcDJlOHdxK29pbHFkb09ENDRWUC80UWhIK2xESXhUTGhpSHZD?=
 =?utf-8?B?Z0dXZllmSGJZYW0valRMQTBYQ1NiRHArUVp6OFRzdXZ0Q1Z6Rno0QmJSYXBB?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4124d485-d09a-4e94-4620-08dd96c54691
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 11:06:59.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsadMYGYEtDEzScfVa4Ir2sqAWs0TRmWOAJilHfhV/HIsWRu92Gn1HKrnFAkKWekrXeIrcSyNk1LYqbEppkkLXEiY4CKRu7aouqFLwVvWwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 May 2025 11:07:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6840

Hi Alper,

On 5/19/25 12:05 PM, Alper Ak via lists.yoctoproject.org wrote:
> [You don't often get email from alperyasinak1=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Fix [YOCTO #15756]
> 
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 643a3e7ae..1a3c52045 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4487,6 +4487,20 @@ system and gives an overview of their function and contents.
> 
>            INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
> 
> +   :term:`INHIBIT_AUTOTOOLS_DEPS`
> +      Prevents the :ref:`ref-classes-autotools` class from automatically adding its default build-time dependencies.
> +
> +      When a recipe inherits the :ref:`ref-classes-autotools` class, several native cross tools such as
> +      ``autoconf-native``, ``automake-native``, ``libtool-native``, ``libtool-cross``
> +      are added to :term:`DEPENDS` to support the autotools build process.

``autotools``
here maybe?

> +
> +      To prevent the build system from adding these dependencies automatically, set the
> +      :term:`INHIBIT_AUTOTOOLS_DEPS` variable as follows::
> +
> +         INHIBIT_AUTOTOOLS_DEPS = "1"
> +
> +      By default, the value of :term:`INHIBIT_AUTOTOOLS_DEPS` is empty.
> +

Please specify that to NOT inhibit, you need to set it to the empty 
string (I believe, considering the first line in get_autotools_dep() in 
meta/classes-recipe/autotools.bbclass). Setting it to 0 is not going to 
disable the inhibition.

Looks good to me otherwise!

Cheers,
Quentin

