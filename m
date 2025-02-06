Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B52C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 09:39:54 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web10.36694.1738834790194644544
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 01:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=JYWpOYXy;
 spf=pass (domain: cherry.de, ip: 40.107.20.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2uZmEWK85XYzV3weBIc12+Nz5sqcjTk+BDrX7wulaGDCLn+zjnVClXeBJEmMCve1TMao4S5esY0Nzp7/vtsbwna8VwEqLcj1DCtzt/3M/V36wC4dtwrkhtVevE46NRNiWxzE0pK4jDSSEFvIOj4b9RR/T2cOupiMVdADUe9/kV5UIRHeq1yHSaHVmnQeKpu5Wv4ZLQzwCyhCp44lAHiHKCGw1Py9K0baood38k9cGQTJHpwhu1SEG4laIe+srgWZsrOGNIaHeumRtf+G8sqvmzT+dPz8jpawwzl0eUhPH788gW/pQwa/Cq7Gdc5VGhDKXbYRwmMZWwzO/iiqTZikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUnTfAL0AmjxMzvdKbxUgzOIY2eYCS+SiZLM2v/WK74=;
 b=NTqh3f9XbwC/I0BQEpye/u4AmE17xqbCwEUUiA+A4LWIHx7dYlEDt0h8JCq28IyjrMo7fpPPD+eeTht+C4PT8BMaR54rIV2pCSofFT9Uow4lWDZxvqFATjkA/uo2TeOphs7KX8sTH6T2XdYBTBFksOezNc+upHwE7/N+V24tLUDWfwlznd+Niw/t01R6jxn6iT55IzRkPd+6JQZ8ube3fM9UavOMPOnhPlUR+YkkI0xjou1P/NZ5zruQcdDH/PHYTA7cwP5l6wUM1jc65q55frH6nkkTGuYoluu80BP1PmluG3fBAqFF5JegjskgHNHCaW2INEDDWJIbtt/ejAeSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUnTfAL0AmjxMzvdKbxUgzOIY2eYCS+SiZLM2v/WK74=;
 b=JYWpOYXy4YlJXlU0YMABp0BVrF47KlzcUnO1SCf8GigxQ4KB4VHIIsqAbITLZA2DgGdXCjXFqL7PljRCFfD/RCnALDXnU2p0GKuTRb6dlWCqYPrqn+cPiMF3xxdCHgmZemBYt3v9zNf8BH6rdwrSE2iJsD9Vepp3QZ0hSQzacB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9290.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 09:39:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 09:39:47 +0000
Message-ID: <a0579f21-26b0-479a-b2f0-fb3a38b87158@cherry.de>
Date: Thu, 6 Feb 2025 10:39:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
To: Simon Eugster <simon.eu@gmail.com>
CC: docs@lists.yoctoproject.org
References: <20250128102308.42435-1-simon.eu@gmail.com>
 <fd45d304-a3bd-498f-816f-cc80313a9091@cherry.de>
 <CAO8d5BY-jFbyOjcfHuS1KxDVzyn2FgQNtM9G0x5sB646OtHYqA@mail.gmail.com>
 <548d78ed-f820-46f1-80aa-10815c53a6f1@cherry.de>
 <CAO8d5BbLuK5uvfrk1p_Fj6sYyK9wxtXV_ad+kCdAtTq=GWsy1Q@mail.gmail.com>
 <f6c77a80-b4c0-423c-abf7-d29c5a6cdf4d@cherry.de>
 <CAO8d5BZnm_NEofGVUp9NOFsFcFf321SLbe8nHSaKSxqctvmdAg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAO8d5BZnm_NEofGVUp9NOFsFcFf321SLbe8nHSaKSxqctvmdAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR07CA0292.eurprd07.prod.outlook.com
 (2603:10a6:800:130::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9290:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ae95ce-34ec-43d5-4238-08dd46923197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?c45hPG8y1aZryngGHzi9sp/d11gq2E8bPSCPKuEbKYr6mBqAFzbt3aPzhIje?=
 =?us-ascii?Q?9/yLu1mGK2IOG7cTPz2CHjGvVAKjm1XNjiWmpqAB13Gx4qpVSSwyaCTUlnAB?=
 =?us-ascii?Q?KgiihJvrcyqJnTPJ0iXvZUHixBE3SjfNt1vqXf3PEzAtXacjk8AnL3fOBNy1?=
 =?us-ascii?Q?RXYqtrLj11nkIZ1/NpvcunbdfY+1UAqlKPsOyia04fIqPjI/+qFO1UGFWEZl?=
 =?us-ascii?Q?Y6QPmsfoYZrgbJYE4r9rOhHRh6pZ1yV35krM0XlHobUE96D+gpPEJWq7Q1q5?=
 =?us-ascii?Q?KJdNH5GDhtAQqaSw8piEi1NFczXljzUfMNgh5YTCJmxbaJ/WB7SJmAM38kcb?=
 =?us-ascii?Q?DNtKCiE/R3dt2WmhxYzgF+qnDxhrhfRLgNx7+pogmvznQJorEaMsvwrU3jJ5?=
 =?us-ascii?Q?bj93YF5ec77Rn/2RHuM+4ICHOETNNx7ak7rmhb065vJ0+LHtGgb9GIyVSIVv?=
 =?us-ascii?Q?8MiYgGHxTVe9rsIu5+dXG8M0Vsk6Jx4ajFICx2sqRJkYbS5SnAlEpdgJ1GsF?=
 =?us-ascii?Q?4V9jk+hm+Z5WEjUsIk7oWRlCKQrHV6GL3CmqFRR/SjuETw+NqF2wfuc+cL+H?=
 =?us-ascii?Q?pASfdwAGsddtsgEsrvubOGVT0PKbabHCtJrV0zynCBx6Fhtbb7K7YXOlXETK?=
 =?us-ascii?Q?34aAqSYKKngeT0f2WApNLcY4FC5f3JoR12WEmJPFeAqDSulz4pPR98VoHNzy?=
 =?us-ascii?Q?SxkwSNG4jAJBWuowr47xraruEFvez78RVe7Y3KRKoajbxTOb4WLvVuISgUiy?=
 =?us-ascii?Q?jFP4CYs+TARlpwG91CSzYli37c7pcmKAGNuObvsrYORZfoNMgNtGug3jsKFq?=
 =?us-ascii?Q?4YU5KMIekkAd8fy86UWhmmRx21kCclefVhW7ngPQ7OA55DtCgNe0Pn9scI35?=
 =?us-ascii?Q?hYxNiQWos/Eocrh6ql557cYpRB2A799VFUrJoUVRpO9TGPn0VWTz85vWHsh6?=
 =?us-ascii?Q?jSfSc8QflOKo2nOwdG5ShDzUxtva8XIVUOh0C5OX6+RCR0QLk56UGIGGwvY7?=
 =?us-ascii?Q?oaXAWqvT2sv+sz+ntmA17W9EaOvlqhS+CgRHsC9TjvgQD0x7/ZJpRillwW9K?=
 =?us-ascii?Q?KSD5yjn4nxKgVuBUufYIkNkh5Zn/nGb7373XscMagt4mKpJm5f6xnqksEpMB?=
 =?us-ascii?Q?e6SN0DVzuDkX1zGUJNCIajQDKkqlQv2gVJg4KVEuek9UQFhIUgEdqJj+VOJS?=
 =?us-ascii?Q?eW2K5RTVg6AI4uce1XrY/LBtLQa/O/7eeKfPQ3rRtAqBVK9VvroZ4zyLIyR8?=
 =?us-ascii?Q?nXqi/KziSHCpfvuiABPptWncJEDHMILikv/LGIE3nu6OpMGlbkuad+AW4Qyd?=
 =?us-ascii?Q?nuIDL3pSpacUCO5AiKo9uu1kF3JrnHR6KgUxLvpXdpowYZFHqI1GApRZ/fV7?=
 =?us-ascii?Q?l1S64ejHdvc+aenMyIoBqYBK1c88?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lqK4aw6uGUa+8tYy8wxV9x5hIsv5PFwnm4f6cVgMItRhK6XQTqgctk36b28Q?=
 =?us-ascii?Q?H7jmw3v+mjNLMlT9ChWoO4IM6BkEY6VggbhidNJwgHuIg5ym0OxtonUnlsSf?=
 =?us-ascii?Q?ecv01NdXH2AyaZsqXWhwDDfzEcpOLhQc9Ocx+ywhg6n4IujoadwH4KoxPf/B?=
 =?us-ascii?Q?/YtgxcxIfqpga6ju/58zEyKHmFY13Ts/qzJr1zeWtJgIMMAmaVWn55UX3CkO?=
 =?us-ascii?Q?R8CfVVj2WU03cFzR8qq744zx5c3UmUu1urMnSY0CDclcwPC0SVx/3NUVUziI?=
 =?us-ascii?Q?inVwC1GzfhvSGtUGrmRzUARHGv4HxgJaGR2LFrgFoZv3a6y8UjHChMILUZT1?=
 =?us-ascii?Q?vcW1Q/OQxFlc4LY/8CAm7S8jkxZFRWDSPQcwYaB/WSr+mxJuKg7VOPQbexo3?=
 =?us-ascii?Q?ep65DeDONKaNIM0SZ5LMPldBQqbREV4N7svcw4QP5oF97MMKD92FpJkfywpR?=
 =?us-ascii?Q?8mjYc5L7/1gqlxJnEjd9fsxV5o2RIa8P0mTIloMBZYG2vzkUCfCxqIlC3k7Z?=
 =?us-ascii?Q?45hk94YrSOxHtTAYoxNnX3GTZf9CrWY/fmNjKl+9fhcfy5zDqVmexv7aPUDc?=
 =?us-ascii?Q?1Ce9zayh2RNK4HTHj9tlHOCSQzly7P0Z7QxLvaBMNIg6L2G2H3FalkiuaX9g?=
 =?us-ascii?Q?8+Sv47f5RhiCk12xdmbhrL906Yju6V7VFVu53pmwqUXKUYZsgqwPew6g6GDy?=
 =?us-ascii?Q?EPM97KaVxFPQpZODzY80CuBNp8aBiZqYkXb7Z3qMNb1yE2nu8QtRWMRP4uRo?=
 =?us-ascii?Q?25C0WKwVzyXp8D7ILKq0prFUvR6/C5fCQ77MJPY+qfh+VViRaFsqX6EAgibI?=
 =?us-ascii?Q?Wb9awLW+hkV/4OkdcVj+PQTac2hKXYC23eaHeNt2miVyOIZb7e6NDrQ9QxD1?=
 =?us-ascii?Q?G7C4xWMgAFOEylx0SAvQ5tHBqc3ootq48d8oR32BeZoc0neJ9H2NfYTqv6zX?=
 =?us-ascii?Q?SANY+tSuWQNTY3C2RS4qAhPqjSFByFt3suOvQIMt1bZOI9u9homAqrXIhMn+?=
 =?us-ascii?Q?5OMESeH6bYK1za4JBG+dMS/Hvg6l6r3tDHeJMFDBlZeTh+LnK61eJ3Hze3K3?=
 =?us-ascii?Q?CPjHtg3D5j8alE9JLKExuf+YvOGne4EgDCll/Dj5G6Muv/PF93bWYVg2cjLO?=
 =?us-ascii?Q?juu+JWEFTpZreYsYQFr8R82fTqiO6ezo2r9nmtppEfc+jx9nVYdYMD1Gmdx8?=
 =?us-ascii?Q?Fq12kk3O4ZdwRGWACT9ZjOFWjZQW8ovwCL3OyKaSmCs8U5eSjXUmCvORMI4g?=
 =?us-ascii?Q?CUNKvevcyWQKCk56RFuLgsZwkS61QS2Z73XMt3n6/76595wu8GqrsR5xSiJA?=
 =?us-ascii?Q?Vas/YHUfv3W8PF4Zn548ZmHt9JvaEMopLXUxuLbnWqr94ZOBp870esSgOI4p?=
 =?us-ascii?Q?9UWoBnjnABxZA9WjUHNjwhE/FFlmrXkYrovt2he8KpS+bMEw6SSigp46CWBS?=
 =?us-ascii?Q?KyCYhQH6xNfpSxkxe4+Fy2FQKjLKN/IuzesU1c/StQ0w+III3D+PeaCWuLlS?=
 =?us-ascii?Q?ROMJtYd+V7RSPKM6wT7PGhvyGZDSqgOAHKwj/+nxhmjtlrU6KpbV22ceNew5?=
 =?us-ascii?Q?C2RRrRn41meBOLvmQMlbRWUXVGS/ZDHIxw8yiOP6U30SAe9jP2JS04Kx/B7I?=
 =?us-ascii?Q?nBX0RjlpbGX4khc/fc023cs=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ae95ce-34ec-43d5-4238-08dd46923197
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:39:46.9217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEG9sTv3SbiazgcKIQ1jDaJgZsyeZhtzBRRoS39ro9GauVAJ+1QRUAAo0SthElLm5v3LshxBQpWdsFufc9rPeK7Yo68tYCDnBISn4+pAe2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9290
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 09:39:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6256

Hi Simon,

On 1/31/25 4:16 PM, Simon Eugster wrote:
> Hi Quentin,
>=20
> On Fri, Jan 31, 2025 at 4:09=E2=80=AFPM Quentin Schulz <quentin.schulz@ch=
erry.de>
> wrote:
>=20
>> Hi Simon,
>>
>> On 1/31/25 4:05 PM, Simon Eugster wrote:
>>> Hi Quentin,
>>>
>>> Ok, I see! That makes sense. So find found the grub.cfg file in the bui=
ld
>>> directory at
>>> work/intel_corei7_64-poky-linux/IMAGENAME/1.0/IMAGENAME-1.0/grub_live.c=
fg
>>> and now it is on modified. So I ran the build again after changing the
>>> variable, and it was updated.
>>>
>>> Was this a valid test now? :)
>>>
>>
>> It should indeed, and I now have more questions than I started with :)
>>
>> Will try to find time to figure out what's going on on my own.
>>
>=20
> Let me know if I can test something else on my side too.

If I could have instructions on how to prepare such an image, then it=20
would save me the time to look on how to do this (I never build for x86=20
and I've never done anything with grub/EFI).

Vanilla poky I guess, with which image, MACHINE and DISTRO? Anything to=20
add to the image or local.conf?

That way I can start a build while working on something else :)

> Also, I have added GRUB_TITLE to grub-bootconf.bb if that is relevant for
> your case:
>=20
> do_configure[vardeps] +=3D "APPEND ROOT GRUB_TITLE"
>=20
> (Thinking about it, INITRD should probably also be in this list, right?
>=20

Wondering if we shouldn't have a variable that stores all variables to=20
add in a recipe's task[vardeps] when they are running build_efi_cfg.

Cheers,
Quentin

