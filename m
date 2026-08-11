Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CA3C5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:32:08 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54449.1786455121706828892
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 06:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BlcLuArd;
 spf=pass (domain: cherry.de, ip: 52.101.84.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKbAKdD2apDaqu3lgpYd++216Z6dUI3u9b6FLxUo8AwOWQ6yBj84FOwEr1+lcRPM8fQEHA1gh2bjEG7cs69eZRDD9cchZLz8JHaZfXwQ4cT3ldAVs+5QBcJjZRM8ZCxcECGDH9YqDWCmLHOFYgPyZUbgCsLcNqOTfOi+Yzgwoq55pHJfumuxOhWiRo28Cpd8DneaUS2NJ0dJHzvG2+05VcIY4NCPVkFB0p7kxWUNEP4xr+sYva00H8o7x0Vyb6CpV1e/XZf9kICLrREf1dQoM18DX3VjUXyP51Gxj3WdTwYXMPfPmk89q48sUKC5CWpGutRYAPm1jlAYFSH5BH8mtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRAqJpCyc8mzalA9Gu3hTfbdBdBgNDzjY8bPVkKwUfA=;
 b=JW8/iy37lqIxDtxYqi5+uRmDaDj8+DC59zcrY+Q/EzyIbx7Tc6SZuig/qpI6Cdfz6ZZnUUMKcxO1eF/DdCyhQZVDBFyMORHQL8K3QwAQGXlG3Fy6jPZIERyqad/JvydUftJ8+uyS9bR7YnJsB6a+lwOn+c4rhE7fTv/xUfitBzY3d9NerIJ5jrnZ9H/o7Q72SOCoMG1CUtXKQ2RgB07oV0c1BRYzZUcMCgd7h8XhV4brZA5n4pdi5WFyDbeh5XCeRMrkUDkkWMVCMbiBBmSVBt3+F3RQIzBAUke4wYZH4ZLeU2/kzjbHCTerDKYVhJylRDxigNNQRMgcMyA3HfNsvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRAqJpCyc8mzalA9Gu3hTfbdBdBgNDzjY8bPVkKwUfA=;
 b=BlcLuArdfH3q9Z1z5WTWBfqxH0Z28Eqy6HkOvvqalFkPy2apOlGXCsyKJLG7NXy9Vv0q+C3jBbSSIDRRrRm8h3fHmf4M4hIjJVVEX6Yvv4Pz9mWHYQGo3w1GoawBaqhseQ8YwdIxxdwfPCBN2aNlLvm77XFK26SSqIF4ny9i4NU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS8PR04MB7974.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:31:55 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:31:55 +0000
Message-ID: <dcab219f-68a4-4323-8876-f27b1ca7c3ca@cherry.de>
Date: Tue, 11 Aug 2026 15:31:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document the
 QB_DEFAULT_BIOS variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260811-qb-default-bios-v2-1-02a6284ca3cf@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260811-qb-default-bios-v2-1-02a6284ca3cf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AS4P195CA0033.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::20) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS8PR04MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: d378dabf-cfd7-4263-8a04-08def7ace94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|18002099003|56012099006|10067099003|4133799003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	vDeoA45EVGNNCfmkm8RAaPt3S/dyVmY8YFr8+gJ+uGo3oSLC9LLfB9fzQqg447rYzIOSiSohTuPCRK3ZNzsTJku5KIiPnze31ILzYuF7wM3jCNcRqn0bUOJGOsAjDn4I96VE8BKaUVRypF7u6xIYvpy+f20TYNPguJr1MI3zHzOFDIKQbSCSjo9PkFLkX1KeD1O1DY2beZ2Fq0NZpxQ2xah0cNnyzck346w9l4RboylhTj56jYL9M0qLFq4wvV/qTx/AQ6Cp7sEnUU728K29x3ZM6bCue5/wj/eZcz2mfXgEQPEr3iWWQs1bHaJ9oLk6xRGkn6Rb807ucnVG9XbgYkY8bH7AGe8/ZTEpvOSJxY/wh4+xFYjuOg0gwRk+keyMZC0d2OBP6KzLL5byahhxCOtBgwamD8Tsm2HOXEokmteV4kkGFIxJQUqgkofT35FxPzibEc5v1OnlZ0pY7lsIwg8FIBiiF8hq6WhL9Z+28r+eEBYmSGgqmGBT/PnicGGTE7kGhUDE4vReVtEE/e7miX6SZY1vPGbhB9JWqd166cQceoMpZwdAOl5QTkvaZ/94MEScn0IQ66f244vTgtV+Fjhg+k6n7o8bZ7KXluNMRwm+/I8fZp046KpDXyHaXuC0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(18002099003)(56012099006)(10067099003)(4133799003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjJGM21OZE9WRDdRZVJPRnZZT1RiVzVFUVp1azZlZ0orS1p2bzZBNkRmcFVr?=
 =?utf-8?B?R2NiSVAvakw3OFpmVGc2T3E2WDhPWDhxVTZXeGgvZHBGdjQ2NGtSN05VeExs?=
 =?utf-8?B?QUlCRzVveHZweEN4QlM3cjNnZU5RWEswekZXdHFWR1QrV1E0czBOeUlZYVBX?=
 =?utf-8?B?cDh2eVlTeUd4T0tRK3FpdlpPQmdYRmh6bHFtNFlPeG1WOEtEN1B1ZjZyYXBI?=
 =?utf-8?B?dGx2d1ZKVHJYWkJUZGFmaTlDRENHbGlXckh2Q2tmNkl2M1J5R2FFUExYTmg0?=
 =?utf-8?B?ZWprTElFWFV2QTVwQ3c0cUlDNjY5VmVzVDFVTE90cW9tMU5YcmlrU01QUU8r?=
 =?utf-8?B?Z0txaHJ2dEoyQkYyeTJJWWlJOTVoZkUyQ1U5dU1VQzFRemtJeDJHbmoxWHlC?=
 =?utf-8?B?L0tYYzJtNCtpZ0ZwMDVIdFN3ck9kMTlvVVdERnVSNE9uOVcvM25qZ3lVdjli?=
 =?utf-8?B?QWlKWHBCV3p2a04wRkdjd3pCUjROT25xYjl5VnQ3N0lPQ2xsNTQ0S1R1TnBY?=
 =?utf-8?B?NG5QTmRaY3R3OU4vVHFuOUo5MlJUTXpkOFZVanlhOEVrWVVUcWZOZ1FxZU1n?=
 =?utf-8?B?dTBHTVVXaExLeVZRSUplbThkblNNSXp3TVpkWjNjb251ZjNraFp3YlVTdDZr?=
 =?utf-8?B?cjdXT3EwNDZJQUJiSENlTjVHMitTNHZNdkN4WksxTVV2b2wvdWZiSlQ3cSts?=
 =?utf-8?B?UTRmbUdUakdlSXpuQUEySCsraWUxMFdvWTRuNmxndVBBc29tZTkxd1NRMHVN?=
 =?utf-8?B?aVhMbGhLeTEyTVpOa3VYUDA3WWUwdDJ2RUJHd2hpUFlDZlE5b2hBMHhkU1V0?=
 =?utf-8?B?MDRWYmNEajZZbURPVFMwU2lzVkp3dUpodm1RYkgrVkdtSG1QK1U5blYxa1ZW?=
 =?utf-8?B?bXd4eEdZMDVYSTduY1JIdzdoVWxNSEYrVzRRVHkrVlhhQm9FaUtjNGI0dktu?=
 =?utf-8?B?MHo4S2Z4NHpzSlFCdzVoVjdDbitQQzBQU2pUbzNoNVRaTU8rREZPMG9QeUhM?=
 =?utf-8?B?R2VPazBLMGxEZ05IRnNDd21rZHFzSjRNU1ZicGtobUd4R25kZVJBQXpqOUhD?=
 =?utf-8?B?NkhIaDN6OE5IanREUG5ocjBWN0sxczkxdTNuQVBpRlVLRFRNVVBJR3JaOXZQ?=
 =?utf-8?B?b1VpdnNXUjNGa1BzOFZnWWtSdXE5WmpHZ282QjI0SXhTMk1LZFZpRHBYb012?=
 =?utf-8?B?REFqUUtaQm1jd3lLSVYrUGR6WThtYVNrOVAyWEhVZldkTEF2VWV0Mk1SNkJt?=
 =?utf-8?B?UmV4L2hDb0lPTHNaOWxMeXdadEMyUElocUJURDhGVGxoMlh0UHI5R2xQaXJB?=
 =?utf-8?B?RWxpMHN3SWdNNmE1QzZFbEdOUVhsNURKQkVlOHluTmY1cUt2YW9Ib1pVdVJO?=
 =?utf-8?B?ZXFaZVF0RFZadDFFUk94WU0wTzJodUhuZFZaZ24wVERUTEJWTnBGT1dVenZK?=
 =?utf-8?B?TGtlVWRqNHk3bGtUN3pQN0NaWjRDeUlJa1lhTzBaSlZsNUtKNEYyYUdXMkZx?=
 =?utf-8?B?Vzl5WUdLNWNJT3kxbVpzOXduV2FyVENjT1B2bzJsclljd2dRYkhtRWpYZ3Vm?=
 =?utf-8?B?MXhmV09yMHFJNDU3YURTLzg1dkZ1YnpzUGxMMDhLOHVBZzZPUzNXd3JXOEph?=
 =?utf-8?B?eSs5YllsbzdoVUQ1a0VVK09ZaWk0Kzh6OU5RaUVlTll2bG9MSUIrcSs4NlQ4?=
 =?utf-8?B?eUtUVThwdHFzZTlXOWtmUHVqclhpL3Zqa2x1U1g1Z25tQjdqTHJJcUhDM3Vv?=
 =?utf-8?B?VDQrZXZKQmVvRW9CWU0rMGZZcGVlK2YxdDFmSnZLL25mNmQ1NzdSTDQvdG9i?=
 =?utf-8?B?c0Vmd2ZKUXF2WElEdWlIRHFSQ2dVVjk3SFRhK1ZDQXhEa1BTU2ZyT3A3SWtI?=
 =?utf-8?B?RGhnMXM1Zm5wM0Y3R3hNNDNSZXB0RHY0a21LUFRQNHB4Y2kwSDZuWlJiL1Y3?=
 =?utf-8?B?b0NxcjltZmhSNi95VC9ZTWYwMzB0V2dsUmlKQ1V4VDlwTmhwd1hUcERid1Nw?=
 =?utf-8?B?dlVEM0FvQ2RFVnRqazk5U0tWdDZyOUxWQ2JYTjFrYS9kTFhFVGtSOWNzS2p2?=
 =?utf-8?B?REZ5emEramtvUVpwT21BVmY0MjlGVnhxclpFREkrbGhKcHRZa2pwOXNLbGR3?=
 =?utf-8?B?MEpkNzBPR3c5K0thRUJQZE8rNHU0TzlYSzlxd2NPMTdPWHpiTWFGTjhCbTI4?=
 =?utf-8?B?R0g2M0ZOWkVqRm1TTTJvN0JnUTh5MHpJV3YzWG1Jd2ZRNm5SSkN1YnNKY0VH?=
 =?utf-8?B?eHNJVnhaa0dnOHlVcWt6MlcyRm1yejh4QVdiNHQzcC91REtOM3lhQ0NyQzFu?=
 =?utf-8?B?dnRpaFA5bm1oczhrNmVUZU4yeEZMWm56OVZWdjU4ZmlwbmYwcTRrQWZDcWZ3?=
 =?utf-8?Q?n1tb+iETmqXFpCdTXLeNhaemGyE8Eero0/AfYyX4mF98P?=
X-MS-Exchange-AntiSpam-MessageData-1: XJqUsvGZeygOEA==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d378dabf-cfd7-4263-8a04-08def7ace94e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:31:55.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwGKRQgUHUmU2OL89X3Db0hJRdBe4xodCGPjEfhOGuEy5oh0Atv4YahV4mtDAiKhikFp5ATvETO3hX+f9KH0X3nNHs5y4PJC7SW8EHppSH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7974
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:32:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10264

Hi Antonin,

On 8/11/26 3:17 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The QB_DEFAULT_BIOS allows setting the -bios parameter of QEMU, which
> can be used to emulate U-Boot, for example.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Address comments from Quentin (thanks!)
> - Link to v1: https://patch.msgid.link/20260804-qb-default-bios-v1-1-bc851931973d@bootlin.com
> ---
>   documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index e75f42afe..f4ed9a883 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8084,6 +8084,25 @@ system and gives an overview of their function and contents.
>         replaces the ``@CLIENT@`` and ``@GATEWAY@`` place holders by the IP and
>         the gateway address of the QEMU guest.
>   
> +   :term:`QB_DEFAULT_BIOS`
> +      The :term:`QB_DEFAULT_BIOS` variable can be used to provide a default

"can be used to provide a default value" can be read as "it's not 
mandatory" while it is when using runqemu (well, that or the BIOS 
environment variable).

> +      value for the path the of a file located in :term:`DEPLOY_DIR_IMAGE` and

"to provide the path to a file located in"?

if you don't want that, there is some syntax issue here (likely a 
spurious "the").

> +      used by ``runqemu`` to specify the `-bios <https://www.qemu.org/docs/master/system/invocation.html#hxtool-8>`__
> +      option of QEMU. For example, this parameter can be set as follows to

s/parameter/variable/

Cheers,
Quentin

