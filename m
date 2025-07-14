Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9530C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:40:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.2])
 by mx.groups.io with SMTP id smtpd.web11.79677.1752504023861389759
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 07:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=nISvkykV;
 spf=pass (domain: cherry.de, ip: 52.101.65.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Od/k2VNab/HijnjVNh/S424paKiNerRjIPf/L6+9k5Q2pRu5rWJvJzMgYn23ct+lkT42VgHcJmcqjDyV9NXyDaAcVa2L9d5i99fXO5N2QsTZLfgKFfXZ3dRjQ2HiBFj8yFgBu+JDutHaCh9EXIBTQRLAby6sKpRA35YGmtHv0EtgUMNoosAs/RGmvJKHI9VyAR1AVFqCC3IOzFSEWaBpUOnPDarrDQZ72852KNKaMxiOmGI45v3X4LqV9HYe0F4yyUyzmkpdBryT/8Ip+A5L5IT2tR/jdmbWNvipDkEewDVjZf0IbDV26BeegP4b7xotWqQL/8yfmLpT0aSY1fK8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ss+PbAney4o8caLu8q439RICKXM6l+gk9N2+Yuksx0=;
 b=Eh1xminIFn+HrYU3TZZMaJHVb9UMJum1CBAWtPINIGneiKBEfXyo3zTXL311IoYM++RTAwrj4O+lNcVjqmxV4xsdbSxMaENaom8sMdZmsfJBfBG1HVDM9ppU996XCArnKYtM6sZpinF3WqvUcCCUVl0fy7orv8PEtfZXegfPg23nNec7c7fO4kzwTMS/6Dh4VxY0Cz3vil2ycmMP6oaOpFLTAv9Q9cXx9YS3Ssj5SNK2sf/H5tdFxA67vNvuvLnz+mOIIsS3vr8AY1p7LDTLw+jdhdVvkN4e3jZIpWPWqgFOh4qhr9KqDqdm0OaFOaQ4pYx/zowlXwhoCOH6bScr1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ss+PbAney4o8caLu8q439RICKXM6l+gk9N2+Yuksx0=;
 b=nISvkykV5AN8c7rQ8oX6tOzYiJ4CoPdFNUbsGocdehjMqbQZurmwFqVYjDC/GZqG3kYbwvO+CFkFoc7bLFBv/7CVVZCX+mbPOXabdQ71mZUIif7G/vShEy8/Fa4rpCKbQ+1Vwnliya7xC1Mz4M7+dT4sGLSqdz6nKLzuEKcENe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10734.eurprd04.prod.outlook.com (2603:10a6:800:25e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 14:40:19 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 14:40:19 +0000
Message-ID: <c8108e12-201e-47fa-854c-2e997b0fd99a@cherry.de>
Date: Mon, 14 Jul 2025 16:40:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] more docs curiosity: "inherit_defer" in the BB manual
To: rpjday@crashcourse.ca, Richard Purdie <richard.purdie@linuxfoundation.org>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
References: <764e27fc-0e53-777a-3427-4989e8d79403@crashcourse.ca>
 <63ac037ab19af1c1fa58290261318bebcc2db6be.camel@linuxfoundation.org>
 <53128fdc-ad85-ec69-b5f8-ff70664e883e@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <53128fdc-ad85-ec69-b5f8-ff70664e883e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR0102CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::26) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10734:EE_
X-MS-Office365-Filtering-Correlation-Id: c895d4eb-5bbf-41d1-b483-08ddc2e45afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V1TEvLDw7PYXV4JdWZprptq5ASC4WvonVHY+9S4LzYXCc1q5nRTPLpFuee+K?=
 =?us-ascii?Q?2jn+AJMT9iZsIe7cZ1NU9C5pzr5eTWjzkE5EFU4ARmLMTX6a1Xpb5A5nfGRt?=
 =?us-ascii?Q?yi4mdIQDs1sC74v18+8BCumKdpdCOqz6OUMhMfBk6TVZaUGB7QcDlHnAPtud?=
 =?us-ascii?Q?72LoQkpFX6rJZIZlGcWQjAB/7JEhFPKEkW6phSnKNPMKMo/wkI59NkkOgIDz?=
 =?us-ascii?Q?2AijoOZQ5w+vDEAKjWrKKq6F7qWFiUsQ48jvlmZGjYZwy7dXhHwH9qdcCY8O?=
 =?us-ascii?Q?g1uGqF/HssFp+/ivSb/qm+uix4yXI1ib6qF7gh2IFoEzWDcXPfh6v0/z7pEI?=
 =?us-ascii?Q?+sYc/lY92gXUw8R13Smzlp8Za9wscZCCU+N/+hCxBdiwytBGfI98LWjQ5OVr?=
 =?us-ascii?Q?3wR52HhaqgqDGQBi7H4Wuo9MyazBsgtJPAjyh06KIcgxuO/04Bvjc0JHcLJD?=
 =?us-ascii?Q?fO8MkXFChx8h8PUHEuQ+pVVOeNQnvEszIJh7+HllMlgKMUZKtuB6sGgaDRsc?=
 =?us-ascii?Q?RGhw2E0ssPtojucUZf4MUBTq1IAXOy/kuVhvBjf1wpd0XvUxDFXSI0qpFpcn?=
 =?us-ascii?Q?wZafLAUDcyBqfkXcKLAbqf7itGwvlAPkxlmS6vfcjYgWO9kxPhvt5sAv8Wq+?=
 =?us-ascii?Q?V1+SqdzDs9pm6jEFRj31Il00C9UNVGuy5j1gz+FK7D9EPx+6X2lo7EbdKl5Y?=
 =?us-ascii?Q?KYWL9MBxdRG0MALgGttEgzj0/jQ5cdW/y9RW9CG5EQsdx9bgClgJQAe4jooQ?=
 =?us-ascii?Q?0ICDix+Ay+Nv7m6v/M9DwrGzNa7wIk84S3QD9MFNQY58zB+LDMwFcP9zR4nR?=
 =?us-ascii?Q?GcReFZfI0/HNre3uUWGYMlK/lTMtOSabzDono6NkcDAsXG9sHVNTgYmqjJVr?=
 =?us-ascii?Q?Awj16WjsOwe9Fz+LLOvuNqHdl72x2fyXqpCK8PQtCC+JYcCRj1h8wYa1IkUh?=
 =?us-ascii?Q?KP8+P7IZxCPOAbLR/Db1gKKdzj7n0Scb67leSeGP2INoG9FnH2MtSLUTBu82?=
 =?us-ascii?Q?msRdH4AJ8VONTUZOv31W+idUXPvoObKaROJoKWH2CcZ+Xpyy9dIBb25o2Qyz?=
 =?us-ascii?Q?9beVAwnN4M+l5zM6j4KXvG/Goq98JZtVY/5TltKFTlVZTpKykqo47jSPL7j0?=
 =?us-ascii?Q?uY773R/Rgav83UDvM/qPhiKb1GSyd+EqVZrsfR3VfSmIhnmXcrtwVo/SMToc?=
 =?us-ascii?Q?Nbzano7HLoG7nc3djUyWzKf30qnOeN4ENJW4wDkXGGiX3q/CA9XGUp1vjLIo?=
 =?us-ascii?Q?8DKwthcjbmcVYziNaJ3NUmx/OuP+ZXZG+wzSg8LreoM98PXojn0IJme2015s?=
 =?us-ascii?Q?ToSW2SnRofTfv3IcZHEYCPhnZE7oslbzVKrjJWEl5VJ/XQv1xDX3wSO+1i+g?=
 =?us-ascii?Q?a1kiGtg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TmtY02iHCW5oaaXWnCriBU+4529xs8zdSKQkDVsmXXuvPEuoznJzlgeqLSU1?=
 =?us-ascii?Q?RInnCXSNvYprVi1+4BpIK1cDMHmZhA3CE+J3NCEt/Afp8jp72iArMBTGp+LZ?=
 =?us-ascii?Q?f3TPcmNb+S6j9Y3BBNnIt7ungPqx14aqKu4YwIe2jLzqE3DEkT4AxCSBLTRp?=
 =?us-ascii?Q?MBwTm01H2DH1+zHnAPSj5ndpvTud1F/bzznm71vyJcOCfiIsUbbp+nCdlIxh?=
 =?us-ascii?Q?MAjHzwbPL5L0LDI9f3NKSPLS06tNterZgZit1HGqA05UopenZ4Loa9y6j+Lt?=
 =?us-ascii?Q?os/3amByMosOzQ8mpnnc5JiHOxzLrm0ovV9eeuorufxplfq3c8z3yv+x/8hQ?=
 =?us-ascii?Q?GtdwVICWSs9kmTxJyqcBRpYnwvIMHhmq6tq6wf3qecXjhxTWYJ80We7akTB0?=
 =?us-ascii?Q?cwN0KHixk9SF1P0rRheYB60Iw4IjlZmveGz0oPPpviBr9/oXiRigijzU7WDh?=
 =?us-ascii?Q?vjESNs1V0FjHcv118sRJdfZTuUt3HZ5AGJBy2yZOCDpgk+YH6J7UWBiq+2Qg?=
 =?us-ascii?Q?cIvRF1VaR+O9abpJuqpDm5qp88ztzVuc/owsMlMk8c5/xPGoNCpHkOatDN4M?=
 =?us-ascii?Q?IrHs6VoXIxkkaD0B6nHnOaPHpBytafmjd6j7qNP5iHq5g5ceuwkiERLKmwmh?=
 =?us-ascii?Q?23FskIyzAyrKT+lnv+2cFGbasY8BLgynOhNepuFIXPikccOXWhOdi+rPXe0O?=
 =?us-ascii?Q?35IIBoweVo3GGFIXMVFDkxIFGsDToHKrmlTqMfl3zla1708c8ZpCjCZl4k1s?=
 =?us-ascii?Q?IEEBHFOO7dU5lG7rVjHvFocbiihj5fp5TV4mVqdphEYlh0gLkVqB8Y6ughCj?=
 =?us-ascii?Q?zSFViJcTHZFeEAYPTV3UBuzNoszqCndjG/LxOvJJ3cRMBq1Ky4KNOwcU3Wno?=
 =?us-ascii?Q?eIo+NPK70mkCXhs+jLv7hBsoEg/TkATmFciXDQm5+j3JMzP3rQj6PivfLaRj?=
 =?us-ascii?Q?Go/Tbg4uG6dcsBFWZ44izim0S6yE6xSdOWxMyrvgwSaqNPVlRr52HjT9EMOs?=
 =?us-ascii?Q?x3sbC1Me21W57dJWVhO90BEDGub9r3Lt80iEz8QDjc0jjonTHk53dmOxBkc/?=
 =?us-ascii?Q?rUGt40RXT91UIAwvbLgCucXgbAX3s6j2M8AqZgmJbmRqCiv3ySf5Tuh34IpD?=
 =?us-ascii?Q?n8I9kuk+cdtdaWh0ha1zI4ATDQfF9YwxOH1q4+XxPUsxF74y0nlzHyEU92L2?=
 =?us-ascii?Q?BOmsARx0bDPfiFWou3nvIxen5YrY0mEreTUqySqExVeJxzH6WUOH5gw9rRuc?=
 =?us-ascii?Q?O93cAOYBx9wLiO/OCF97eBQVun1J3NlCvGeXpWs6cyO3aouzXsik6EJ2J8Ki?=
 =?us-ascii?Q?d4rSUGkN5wiVGAvdPqbKTyPBYYfwNO4nLOVQ8PIgFE2Kvk5wQKAgCFa6c6Uc?=
 =?us-ascii?Q?DOtDxKUl7mzI3JBDWh/zUGuJ3/AeDQ458wbebFgAi5+SnY+yPt0dXyfhmjwl?=
 =?us-ascii?Q?3YIKwBgFGPRaNifq9AkUDRRCXXLeHxUWDAnnbQxOD805PMxoHX3K5/eAJ0CD?=
 =?us-ascii?Q?AICX63eSeQTtpjTq+8pw6CxPNDV3hZnHZSM0FqbP2cJ8WdOqTIhad5ct9StN?=
 =?us-ascii?Q?zLlXPaXSpDZ4DOUOaBt3USmOX2YLbPDPCk82H0A3I6XTbSLd3up+3QTXDj5t?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c895d4eb-5bbf-41d1-b483-08ddc2e45afe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 14:40:19.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMtfKJVU90xUmWd2gDmwZEzoBBkZfZ0YdbxrCPboaMTVGprBUxGYBverNfnB4b8G1sZcUtvxJ+vX0oNkqOgGy6csG9qxyCAZ5+l1qp6odvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10734
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Jul 2025 14:40:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7323

Hi Robert,

On 7/9/25 4:20 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Wed, 9 Jul 2025, Richard Purdie wrote:
>=20
>> On Wed, 2025-07-09 at 09:31 -0400, Robert P. J. Day via
>> lists.yoctoproject.org wrote:
>>>
>>> here:
>>>
>>> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-=
user-manual-metadata.html#inherit-defer-directive
>>>
>>> that section strongly suggests that the sole reason to use
>>> "inherit_defer" is that you want to inherit some class, but you're
>>> not
>>> sure which class *yet*, so you use a variable that will, at some
>>> point, be set before parsing is complete. or possibly it will involve
>>> a programmatic condition.
>>>
>>>  =C2=A0 so what is the purpose of using "inherit_defer" on a fixed bbcl=
ass
>>> name such as this?
>>>
>>> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtoo=
ls/qemu/qemu-native.inc#n3
>>>
>>> what is the rationale of inherit_defer'ing a fixed class name? or is
>>> there more to this that i'm missing?
>>
>> native has to be last. That means it has to be deferred.
>>
>> I think bitbake now happens to handle this magically after more recent
>> changes, just to complicate the story.
>=20
>    i had assumed the first bit, i am unfamiliar with the second bit, so
> here's my thinking.
>=20
>    the section on plain "inherit":
>=20
> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-us=
er-manual-metadata.html#inherit-directive
>=20
> already explains (in the Note) that the placement of "inherit"
> directives is important as that might affect what you will and will
> not be allowed to override, so that part seems fine.
>=20
>    the last line in that section, though:
>=20
> "For inheriting classes conditionally, using the inherit_defer
> directive is advised ..."
>=20
> is now clearly(?) misleading since it suggests it is to be used solely
> for conditional inheriting, which is not entirely true.

Not a native speaker but it just states that if you want to inherit=20
classes conditionally, you need to use inherit_defer, not that=20
inherit_defer is to be used only for inheriting classes conditionally.=20
It's just one use case of it.

>=20
>    i think a clearer way to explain this is to just drop that last
> sentence from that section and then, in the following "inherit_defer"

Hard no. We absolutely need to state that you should NOT be using the=20
inherit directive for conditional inherits.

Which made me reread the section and I believe we should be=20
rewording/removing the before-last paragraph which says that an=20
advantage of the inherit directive over include/require directive is=20
that you can inherit conditionally. Considering you really shouldn't be=20
using inherit but inherit_defer for that, we shouldn't hint at it (and=20
rather hint at inherit_defer directly).

> section, explain that it is *mostly* used for conditional inheritance
> (involving variables), but *might* be seen in cases like that "inherit
> native" example (unless that last part is such a corner case that it
> can remain unexplained, and not over-complicate the explanaton).
>=20

All I remember is that inherit_defer has interesting side effects with=20
how variables are resolved but I haven't played enough with it to know=20
or remember which ones. We can start with fixing the inherit directive=20
section to stop mentioning to use inherit for conditional inheritance as=20
that is factually wrong. For inherit_defer itself, a bit of tinkering=20
and experimenting (or studying the parsing code) would help figuring out=20
what to put in the docs, but nothing I can suggest myself having=20
virtually no experience with it.

Cheers,
Quentin

