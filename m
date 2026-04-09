Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1E0EA3C25
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:29:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128767.1775730573562381510
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 03:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=U9qDhBlE;
 spf=pass (domain: cherry.de, ip: 40.107.162.22, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNvVgqn/aGOy3/NxX3UnkJeEv2mDpBO+SfN+ED69MlOpvnBpzSrSSfNPWIquHYRj9xPnaAfDPzukY1zpcDQKMcQOs4EVzO7hQIA1JTts8sIDnLwy/rfQ7G/KnfnPPvkiXUonwHep0McCCPjiuWUZaZU+JtTi61r7Nl5mVTJ+su6jO5Y5L7DVlN2gDggCjcJ5xZgcrw4baFvOXNKGXGmftkrIpea/MHchI6lFg7N+6SLUeaeIkRvFGyloIoklDy9yZmcbCmueavzHufVKsrtr+KtwTNYF4INrdrz0FRyvS2iNYxB0YqEtHaFW+YbmwRdGVVJqQX4TgpuYqKplVjVfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVHWqkSPqALrGjrywkKv1Q/n/TzvbYSLkGx3K+zg6tM=;
 b=LrI+98CBxRQ+yIn2mkiItxxdvfUrLpX6GVFiwZCJNtRjMdNS+v3wyhxjGFZzumkShM7Cc2e9cNZWPnLEnBgkxzdZ7FvzsEjdUREY/jkDeufYeVBmhbG9jr9wHwaGpLXXUbzx8AMWNmiczbpfqE85SAZfYizh1pICr1UbR7IjoyVtTmAK4DdQgU3h25KqOAnnTH5kYAoqNJ679NRzclsFsPFc+k+jQXmXbpfzzDt4cVbHFwMpdVXnyvbdUD6mAgBPkLK2Qa163NOsfTfypAgEUik+XaqsYoy6ghJGEsYAnS7o/3DqzmBwzJfixuqAJad2qI3ucHRZEf4QH864NObolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVHWqkSPqALrGjrywkKv1Q/n/TzvbYSLkGx3K+zg6tM=;
 b=U9qDhBlEuUfjkkHn8t9EfDP2+ytSxp1ajEYvInJJ2AzIJA9IFSPOzWOrsTT0iTMWKFF9CbaFfW7w9YaKuAnHiuRpVuBCZ6NX5u/UUzwDpzQAZvTxQRuriRvHPsg6GgbEJAkYS9qKNDsIY2CEK/T4AIP041xfZnpvV2WgM7rh4os=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PAXPR04MB8441.eurprd04.prod.outlook.com (2603:10a6:102:1d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 10:29:29 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 10:29:29 +0000
Message-ID: <5ff51b37-613a-448d-949f-406a56f1a012@cherry.de>
Date: Thu, 9 Apr 2026 12:29:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: fix wording in
 COMPATIBLE_MACHINE note
To: joaomarcos.costa@bootlin.com, docs@lists.yoctoproject.org
References: <20260409094035.346379-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260409094035.346379-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI6PEPF000001F5.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::918) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PAXPR04MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e9c2e5-7e8d-456a-9d1d-08de9622e15e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5Y2+ssAULjytEicsUhMdlNdgMpONjfhMiauyYt5qCMy8OvO2Tc4TQm3IR1X21sJyqJAnIQ7W+tL+cnyQu9XXKKPofNQ+OVvhcys7KOcP8MOhBenEiCvTYcM/1V+5hIstrWC8Tdth1MI5zSnurhCbYcR1cSgSOExe292ld4cZ0akt8LB3L/f8cLG4JIoNZ+qrCK0HUFqVGc/VM6kA9Dqgovmd/yZ6YoWHP2RzDgKfYJgpu1E4/70/guabGEeXg6PgYpGFLOZmTu1+1kLe9Wyiw1hiGgC6jP8+HA46pCTrJbzj33OZeOEYkgGpalL4JJ/3QFohVscahbGMprAIYPuNbMiYC6uoWUytjxklsKaMZcHKcLOho6u5gSq7Z8MdvbIxHNSdKeHoxNqKC8HNHrtEMcmYG727Kw0p/v0sdTUgk4cIqDGqTa+FGp0unl8Z43C+uR53b/f6c4ZH+xrx5coy5zJ7V4+wPjvwmuxFnha+rfXmKB2RXaH3ETiEk19XwXTzc7O2vI+zKdnc6TzTP0mmVtfAp6B7j03KcDav+V46ftF5QdhgR4IYud2y38Uunu4B3lRZtBzJfpfe8KbVFpyJcVi0WJjGf4IBp7CCIgK/g+SHKHl5nGTJ9KwLQlMdHDa/OMDKkTwe7azZgSNbMv5ZIyPn6RZfue8CF0g8qLMInO7t0H3CZhi3eOCfw6vGooSwuOooc7b/8MVte2e7XRcKETuCAz+My6GZ/fs/IBeOJGc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6TfFX7lVCNzWQsNs0XFq/ulYrvK26AUEFHAUTQQ2pcVRB9wnCsR2INlB12DV?=
 =?us-ascii?Q?3JfoGc21T/fnswZxVUh1xE8dSjAjRxP0KOvP7C4RKQwvuUDHJxFCcakNs727?=
 =?us-ascii?Q?SY/uV7RUg4ck+uQ1SLC3Hqv4odb6B2pg2htn3aQMJadbQC9fBBu9QOHPeTBD?=
 =?us-ascii?Q?YVk247Vrb7WJXm3nk8j0pSphVmGTWIjCn1g3+WArG8fZ65EiXhnrkkwXfW4S?=
 =?us-ascii?Q?Lpd2M5BTJKf0uoRJtFqX/NEKBFzPcC75CTlpMv2gzmjS+n16PGfq962a965O?=
 =?us-ascii?Q?SEw1nesdXr4pvj67ghc/6rYpbJVZpKZ5G4S4cqrbEEkHAfjPqCM4vE9JGPH1?=
 =?us-ascii?Q?3gDlcGOdgvS7uhNgk4NUdWTkAFNYpaztmVB+4I3k8wEZffCuO19XZBxUKCTi?=
 =?us-ascii?Q?Bj6qHGMiJjCfXOBHKXkS7bfY31Xx9qpqm8dETjVhK+JOgkg7vaMU9cem8d8M?=
 =?us-ascii?Q?7Ys6rvUvgA0JFNjMgqozj8SqkPWeC6ZxJOlDxDfHDyt+b0tAeos3Aa/Mc6y7?=
 =?us-ascii?Q?FdmeWc1ylMKRXG++x34jeyIS/IPVm2xBgmXHMV/Ks/IW/Byz4gRPZPyt+XO1?=
 =?us-ascii?Q?zHcHapIUYFsuAxAl2ktxhNIauSQv1f+9wEkS0CtG6vHapr7/ycpJtzc1piXg?=
 =?us-ascii?Q?Fcdjp5L1k8Z9TkPh9bqeJyKeDYBarYVEpvdnkrN7l07BxbTyfnf90rMbV9Nr?=
 =?us-ascii?Q?AIDE9ASW8IV8unyfbhgP+bHSxbngWxwUwcrbwSCoE7Rz9h3d8ggMku2YM3+c?=
 =?us-ascii?Q?1C9BzcV3xXTJsXYKG/HQFA6u3+IgNpsscgb06NIWIm7PoCHWQp9hgdeJIr9w?=
 =?us-ascii?Q?coMSZ8Jel1shzbHIBHM+hS8SH4iGnnl9lm1YDoKlckZSopZjZNM/UY8nVISS?=
 =?us-ascii?Q?nU3DJJgTj7pG9kHMxd+czbbVIhf1A00EzrUAyfmyhJ+YKJ6QKVTKAmNB+Ua0?=
 =?us-ascii?Q?gSfE6ZDXsJ0HSetWv6Y7urRKKdM3+EcpYaMUqUVN/5OIP7iloIWWZsJtkjpr?=
 =?us-ascii?Q?pA8UxReFJGndHoJ9ShSMuWl+ZgcGkvfK0MmQT0MIAx8AtpO8jlKjKlbI+7TF?=
 =?us-ascii?Q?EazhcKVmWMFx7Oy0h+yHBbvFD4FhrXWwz8/c3R+Em95bW75G2gJ/H4rlvSz1?=
 =?us-ascii?Q?6JNfir8Yi6bsuCTxOsr9hUPQ/c2cxWYot5GG3yldoR1nGXWUZ76IAYtApvZr?=
 =?us-ascii?Q?1/lajg9e9vQfsOQmpxemjKrXh96dGcvvyd5tyhKeDC7EjxBIkGQUzoogpWQT?=
 =?us-ascii?Q?i/np/fUi+eyReAmPadxbkDXQNZOmH/F/u3H2v23NcsWvyD9+nqWleUts4EoA?=
 =?us-ascii?Q?51CvEOFGXp174dLQndRVc8WH5L3URU38q8otpLDpad/cDEC9mW5Mhc6cqoe2?=
 =?us-ascii?Q?V+hToAGkGu2Ezy/3/3BxCqxwLY/2dfcVK6vzCECXO5EPpt7QA9S8JGFvhHuM?=
 =?us-ascii?Q?sSrzSITdp946bg5kBBy3GtbzB6Z36+J2kHb4hj/BcrRZ/8kfERw+65F3GfNc?=
 =?us-ascii?Q?se4UN5bFKUcjmbKPbmbqrSrg+AGT+RQQqeSLDTd5lLQBQZX6n7Ag+VTV9DRq?=
 =?us-ascii?Q?6Z10UCXai1QoK1q80BE5xWjFsl+eMlZGJ5ll/phfpf6OBoM+dCouQZDM/v7z?=
 =?us-ascii?Q?JZsrZIJWntO4RLVb4xvQSGKsAOthrTiPXfBQj5QFpeaAALqcvzMGVBxwlLKy?=
 =?us-ascii?Q?Rzr58Hs3Esxq0ezhJvjUeYnQkXL6o42iQWo1trWcxPtETzrlSH12UodaMwCY?=
 =?us-ascii?Q?dg9c11ttYyvl5jwdK/vtYweeOjn7wRslX2eqAZcNFNchq6OIfVlf?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e9c2e5-7e8d-456a-9d1d-08de9622e15e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:29:28.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrV3WEFNUNcvpFkoOnFH8EM7ISOIrYMsHwhFU2+Tg9oYLCU7ifJdbZE1PGLr6eKJkSNcvQjZUVcrtTWsdY9QC7fVUhgRN8N9ZcOOD28W3F0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8441
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Apr 2026 10:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9207

Hi Jo=C3=A3o,

On 4/9/26 11:40 AM, Joao Marcos Costa via lists.yoctoproject.org wrote:
> Add missing "that" between "recipe" and "inherits".
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 60e608c0c..8466124e0 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1679,7 +1679,7 @@ system and gives an overview of their function and =
contents.
>  =20
>         .. note::
>  =20
> -         When :term:`COMPATIBLE_MACHINE` is set in a recipe inherits fro=
m
> +         When :term:`COMPATIBLE_MACHINE` is set in a recipe that inherit=
s from
>            native, the recipe is always skipped. All native recipes must =
be

Doesn't read well to me still. I would say maybe go for

"in a native recipe"

What do you think?

Cheers,
Quentin

