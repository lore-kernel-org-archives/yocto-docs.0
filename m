Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42480C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 16:39:21 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.80])
 by mx.groups.io with SMTP id smtpd.web10.56270.1739205551190769112
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 08:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=FMNlenvi;
 spf=pass (domain: cherry.de, ip: 40.107.241.80, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8XRE3BLEZzQXI+yMKNIqA5pjm5NApJY0SVnK9iH7WPD3JBz6PUeP06xg0qF2U44qP7msJHqX2PLQyCCw7/XLLXTqy1hiiFZERIIVKlqL/NBm2WwHj9PJy49N9Xx4W5GG8n/kboR261bNyMb560DK6JdqveN1va0LvtJoWcgiTsMo13Hh+rxtjmlgfWwHjQEOQHPjj/m2Vjug5FrUDsyGwiP8m6pScElfwwZC6ISKhMCapzbhhydgreiy0CoUoXNudzlhLEWRPFCv9j5l9MQEtz+bjAL/Qe7/mtlq4ezSeQ6h2tRa8s8x9X85wPmmJLwTMN3FXCjDrnWtCfWoAbpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7k03yVdngDY7r0EVq+d4PltMX8h7IY7FR6ju995HMw=;
 b=MhIeoaKZkq5zR0OxM40+hAsUgSfHOQ8GR1QX93TC3n0U57iQomz/xH0ZvZv5F2cSfpmwQVBM2j2IiVy9lVzV8XIwDq1UYDj/GNY9o9DFme72Y/c6e0xkl6WY/m0HR7YQ8kUkawvyNtaEmD0vKL9965mPXXDF3GoP5C6x1aHAiV+KfSWOTpOghvASjytUyPmA1RPEDnjdz3sehTiUwfzVx+5XhFrQ4rHT3PF0zk+0ubuHM84D2ZLvnwfIiYC/CBHkJJ6hEoMNjWONw2VmGB4iab3rG4gUqGodB8Lu+4o/Oc2XR+t2JcpTh7eEQV9ANu/igBcVfJa144SWwpJAbeqLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7k03yVdngDY7r0EVq+d4PltMX8h7IY7FR6ju995HMw=;
 b=FMNlenvi03vAblkFlqWZ42fvR1bcAuuQXuPP5SSbmkQ13cEDhXxDZhyvjiKDOljGkakBm6aITxR4HjUfTFbC9CHw71GiKzzUUZP+rXWBpz7U3bqghboSKfus1w9s8hG/ZTcgKegt7Mg/xElFvXoAClvv9iBIbfvf0PFavoQ1+S4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10824.eurprd04.prod.outlook.com (2603:10a6:150:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Mon, 10 Feb
 2025 16:39:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 16:39:07 +0000
Message-ID: <b6b28fff-bcdf-4694-91e0-117f9b9ff957@cherry.de>
Date: Mon, 10 Feb 2025 17:39:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
CC: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206215711.154194-1-yoann.congal@smile.fr>
 <20250206215711.154194-3-yoann.congal@smile.fr>
 <52281efc-eeae-4b9a-a0a8-6b42f83a9d7a@cherry.de>
 <4508019a-f5b8-4a55-abc9-b757045ecdea@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <4508019a-f5b8-4a55-abc9-b757045ecdea@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR07CA0295.eurprd07.prod.outlook.com
 (2603:10a6:800:130::23) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10824:EE_
X-MS-Office365-Filtering-Correlation-Id: 299fc247-3941-4c9a-7f6e-08dd49f17000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AcSzl7hbKnPfqKxmvMA4q+inP5MWruN+8O96finNq2xns+v4EMAkYRsUe5Fa?=
 =?us-ascii?Q?tmYIG1Pt7ElqHvvmEz+YPq0QxWThQa5iUbcymwnS63+8cIHZF1oYlIazXBWt?=
 =?us-ascii?Q?1/P0Q4KW7GBDVoj6hCSQieYBTXe2Tl/hRz6baRoumnA3GWiIouw5Pv82on2C?=
 =?us-ascii?Q?kMHYGkWiQezMrK+SXF5Wuo2cD9rDyMN+60nLMREOXnOc07ozboj/mEnF46qk?=
 =?us-ascii?Q?/b8YK/5xGa/qK9unlqg0sJojxSkBGr9jz5OckeGd3ZnpNgfjJZ5EdgbpvitW?=
 =?us-ascii?Q?89+YIikSHx2JKedCOOj/q/bvsmNSlcDzdOTildpwhNGomltD73KIFmW2Owcf?=
 =?us-ascii?Q?AiOIrpFbqFoRuptg9Qismhd9vEDbenrR7E8ep2uD7mvlK9fViYNpXvax1kNx?=
 =?us-ascii?Q?SiMTsZQ2KhO1GJsX6XZ02SNuJqNTKK3LraNL4BI33VWQED0urrB4uF5Y7LTB?=
 =?us-ascii?Q?lKP+K4gXrOeaROrayJb0piJtjiBM/7S58FkpihJBiQVJ0J1EAv4b71hA5Oz/?=
 =?us-ascii?Q?YoXr6Jjh3QVCmgiOujAkaeh5NfAXzw/zURfW86x4Z2Ox9K/L3bG34g1Doo+S?=
 =?us-ascii?Q?gUK7OZzx9b0LzjaF2vqyFPiHxmCja28py3c3TjUKdll/VGv2pvY1naG766Db?=
 =?us-ascii?Q?U0WdexE2zDs3wJJytE470U2XZCwsdNayaW9dIhRTvrnSUxcGanRL8UWABvpC?=
 =?us-ascii?Q?WFo3K6HCE6Z/eL9bIW7rmNqMxqMF6aUFWtof/YPAYMTCwPEi4qei1XnrUY9+?=
 =?us-ascii?Q?Pq8jxwx/gHwjt5/s8Y0HKdr1dsY1baWzsERxBYpXj1jbUWCKPir2lBl16pGj?=
 =?us-ascii?Q?ZwSy0LNK1mkooxTqZKepeNtmRo4LS7SATT7TxjndU5Ouuct02jdO6XPNBYfs?=
 =?us-ascii?Q?LaRHdkhyCcZdKAB4l53qHb9y2in6pa4row2ZhD/tU8NbWBHCAKnJskQ/vR7D?=
 =?us-ascii?Q?GK1b8ix++BC1Rm2Be2Syt726xYngqcge83N+zr5wapXTl9YqIiRTZdapwU/n?=
 =?us-ascii?Q?LJdAECRKb8OKGvkFTvf1Gbpnqg3QgwuMIie4PAiOr1HPmM1f4onsUYsd1Un4?=
 =?us-ascii?Q?JNxXLYFe5tFZdbPN8VTtjJSd6mTLkcB14xDhR/Gyu06w0uKqOX3w7FTCj8LU?=
 =?us-ascii?Q?18uXKF4xFT38gqfy3SjjEf8+XVQV+ZdGa5x8YgRbyIKHMdOxNS6uBpugM9s1?=
 =?us-ascii?Q?TUDJnU739Mdcz2Wz0D+lu4tvZaqSCrS1zVLTy/VxmhrIrKeL4Z0bGK1OpnIR?=
 =?us-ascii?Q?Ue09UJ+YjtD2XHv67JIK7NYXHrkRJ/uOomKck5ysVsjeraBn5aYd6dIHdJ9u?=
 =?us-ascii?Q?7cfNhEo0jhRpe8TapSaKqMnYRmqfTOjmJf+cWpvqbZD83A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jp4DeK9+XSqshzRF2Pb88Hzz+SXL0p/rQ4j8JolCyyJy5kyPeu+xnlwC5Vmw?=
 =?us-ascii?Q?ZM2+KzeU4GifRj14/PVqzj8fU/xXL4ddvimX6hsWtQsB3CITsCvJlpTR7ya3?=
 =?us-ascii?Q?W6wTlk4OaInlNCAdYUOiVE++MUL1hQubeAwrk35ANMQY2l4OU1IE8zVMTfvk?=
 =?us-ascii?Q?co0hAdaLKHjXEZiGnpdozM9XW7BflxIwXEv3cir3WzReIzsg9cLyfZCSmWu2?=
 =?us-ascii?Q?M/bxVqPhcMiKU4sXwYPxncDSXua0mrj1drrfvq86w3V15KIwbcDfhsSNUnX1?=
 =?us-ascii?Q?avBnvgtgTgNFTtum2LV34XRuSrBN2C0r7fQuv/K8L/D7+McXSCyjMjT1KaHA?=
 =?us-ascii?Q?Ivjz8mfsvmlvr1MgizysNORuUsH+aNi/lCW7KChDRaMSEEeP6eN8tej1EWq1?=
 =?us-ascii?Q?F/+lvJZOJzSzgH1KNOkVyzmauGAh0zfObQBd5v8FYoGTy8Fauf/s0k3X/YXu?=
 =?us-ascii?Q?pEwqeVLWkFuPoAtqrYOFJunOo2MCDOy6Ts7IP8/wsRUW8k3zwZCA/qCq87om?=
 =?us-ascii?Q?B4RJtpVvkSSSEtd4k/rCBurA5tumXzLx+ARxbeKaRUdLQ5P2tb6zAtNaf933?=
 =?us-ascii?Q?FyTYMd68/fbS0qXaEYD/+fXDEzFhvVjvaJH1H45nSL0YCRlYQUDP4rC2Pks5?=
 =?us-ascii?Q?oQf63Gu4jAam/JqNW4aoQuznjsqw6l0olet6+00k4tU/w87zSvWsrKnJcFRt?=
 =?us-ascii?Q?yNWY2RRG6KRVtTSAIdscKYmCZaXCGNZe4tOVs+hR/EmCDdUws/ofO+QDJMgk?=
 =?us-ascii?Q?kEo9fhy2e6YxvgDEIerEjSQ1vzreBsZ1xcFXbtUSK4JIw+e5OaWUKt+2Tf/x?=
 =?us-ascii?Q?QyIYEeeANgqktwBoEaooXSqoWOSYQjYEumN1Xnui3EtzXw18qgr1w0nGbFFf?=
 =?us-ascii?Q?k1f4PgX9zRccUMCXQVvWUi30QNn0tTwd7v35zx+BiwWjI/O2zrafsvRHv5cq?=
 =?us-ascii?Q?ZW43OdaOywYSxNy8zH2U8Sptpcnx6rCT8IW7oMubk2NdNH+eY7tYzdC+I/Xl?=
 =?us-ascii?Q?QryWf7YzYh2LkcySRXoPkDelH9CttoIoUMbecu3MXudOD8uvnBZ3FvwKYlve?=
 =?us-ascii?Q?0hcBfav2M36fkXZ8X3WgbP3HaxQ9OUxa5XB7CxW2lVfCqoeALHrXiVF8Hrpa?=
 =?us-ascii?Q?HU9T9FbPQFmsG3bw8G8j4wduFzCmEVrempX70ZekSHjwmN/GRtepUyfYJpSl?=
 =?us-ascii?Q?jtJWsJRvUp8mQPl8CWm1SBYZ22y7u4pGzbC8ImO9DxyLi9ki6O8cjDaddvUJ?=
 =?us-ascii?Q?vyeyKMkE8peVPqPePfbgOh3Ye4wqwd3uXOrSy0k0CFIdc4nnUrBmJp6/6Tpr?=
 =?us-ascii?Q?o9BQf7teE4cwSu50KjaOpPNSttW5WTj7JUOo+/b35MJJ1ZvmxIObn1l39/Pz?=
 =?us-ascii?Q?pksJmTTsXr1qPK7mzEFTvy1FTL8zFZlU+8Av4oH247XyjsfR65fHt4ANLgRh?=
 =?us-ascii?Q?1f3hu03SSUYXbY1VPSK3Ex0RE5A/x85qz5zeO/Y2t90flmNQY+sg7BFcNLNJ?=
 =?us-ascii?Q?3v0pEjBDZHVt+FNA1K/tJ84ZwlnM53jkRTgs2jK1vC8q6vUBdVXdDpsBOLVx?=
 =?us-ascii?Q?QfkbSmc9PfGhECV0S+W42y3s4+Gwf14/afdpgdwAd+iWnfyPRJdz1pF7fpSN?=
 =?us-ascii?Q?nj/AzfezZ/9f854WSw2wSuo=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 299fc247-3941-4c9a-7f6e-08dd49f17000
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 16:39:07.2816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0b6x4bim2xd7UncbXU/FHzR3gNAPYe4Tya2HgEGdt7djh1EbG2ZqWGy7NP1sN5d3LD6k/Wt3unU8x6/4qrn4sbbCfEYmf20yT0U6hr2+Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10824
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Feb 2025 16:39:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6322

Hi Yoann,

On 2/9/25 11:59 PM, Yoann Congal wrote:
>=20
>=20
> Le 07/02/2025 =C3=A0 10:13, Quentin Schulz a =C3=A9crit=C2=A0:
>> Hi Yoann,
>>
>> On 2/6/25 10:57 PM, Yoann Congal via lists.yoctoproject.org wrote:
>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>
>>> Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGET=
S
>>> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that wer=
e
>>> shown earlier.
>>>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>>> ---
>>> v1->v2: Quentin's review
>>> * tick-quote variable in title
>>> * a set of recipeS
>>> * 3 spaces to align a code block (not 4)
>>> ---
>>>  =C2=A0 .../test-manual/reproducible-builds.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 18 ++++++++++++++++++
>>>  =C2=A0 1 file changed, 18 insertions(+)
>>>
>>> diff --git a/documentation/test-manual/reproducible-builds.rst b/
>>> documentation/test-manual/reproducible-builds.rst
>>> index b9f671d68..77c15d6e2 100644
>>> --- a/documentation/test-manual/reproducible-builds.rst
>>> +++ b/documentation/test-manual/reproducible-builds.rst
>>> @@ -145,3 +145,21 @@ set of recipes before the test, meaning they are
>>> excluded from reproducibility
>>>  =C2=A0 testing. As a practical example, you could set ``sstate_targets=
`` to
>>>  =C2=A0 ``core-image-sato``, then setting ``targets`` to ``core-image-s=
ato-
>>> sdk`` would
>>>  =C2=A0 run reproducibility tests only on the targets belonging only to
>>> ``core-image-sato-sdk``.
>>> +
>>> +Using `OEQA_REPRODUCIBLE_TEST_*` variables
>>
>> Sorry, I meant double-tick quoting, the same way we do for the classes
>> in documentation/ref-manual/classes.rst, c.f.
>=20
> I'll fix in v3.
>=20
>> ``allarch``
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> My grep-fu didn't return anything with :term: in titles, so I guess
>> that's why we're going with double-quotes typically?
>=20
> That does ring a bell:
> https://git.yoctoproject.org/yocto-docs/commit/?id=3Db9e19a00a3aac05a2cdd=
35b61dfae6d5a1a9c648
> ...but in this case the linkage works (but the link is rendered as black

Ahah! Thanks for the pointer :)

> wheras the rest of the title is blue, looks a bit weird IMHO).
> Also, since I don't point a single variable but the whole
> OEQA_REPRODUCIBLE_TEST_* group, I'd rather leave it with double quotes.
>=20

We actually do have a bunch of those already:

:term:`SYSROOT_DIRS* <SYSROOT_DIRS>` variables.
See the :term:`SYSROOT_* <SYSROOT_DESTDIR>` variables
:term:`module_conf_* <module_conf>` variable.

etc.

Cheers,
Quentin

