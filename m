Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFACC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 14:34:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.85])
 by mx.groups.io with SMTP id smtpd.web10.20490.1738334087964027173
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 06:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=F7avMH3r;
 spf=pass (domain: cherry.de, ip: 40.107.20.85, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaJd7d3XrksH9au/fdJcXy4XeYrxGvhZdNAl7TJkNUhNIoWvVrUdv6dKQnmLHvl/hRDA/cvEZsVZKZNXFi+ZiDOndUcd6S63MNQ9WYu/TyyFnm5bWAFSOsyo1z8Sy/2v5NOZ1WgntvY0yFjMexMfcwdugmecVGVL8YCKJN5ghdgOl4Ps6FbUzPxGWZh6SmwMjlb+0oFmXb1LAkNX8jA3KdaeYKthT/XWIaaVw2rcFkOoNfMnzU4e/KN81i6CasQZ2Woz+Z3DEGhma84Vutp6/0UKTqEwUS50VKgG6QALjgsHcDjAfiFS40mNj4GRzi0yf/rdgeZI6VPoiUDTx5EpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6oiuP9baeKW4TkHb1YYsvUSWxiEQHul6Zcc6KTH2Ks=;
 b=WCkRIyo/SVVGCl6sSu6oqvyTRdpcSzIbCeWx2NtWJHF79X+AhJzc8W1PuzIFO4KVyVDLWo+M25IZTTJR2H2s7siZFM9wGLKBqY5qhIsrhVhWsZCfMoLL1aP3sGk+vwybveshcrWPGsJx2tEbyG8V32wAfySIYsK68PUAHVlOJDKTOe25B0pdtidX5HfTbAemzHGjjqYlSLBRov9kVl79+CMAgrEvg7TbA+aFCNNZp+61Zso3L3fyvmDYzK1jShIrgJeric9lWRyP0berpbSpD43/M32ZdY2+EH+mXZRttB4N0Ir1pd/ZjCRlTcTnT68Dg/MT0z8FcGsxP+QgdZIOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6oiuP9baeKW4TkHb1YYsvUSWxiEQHul6Zcc6KTH2Ks=;
 b=F7avMH3r13btMCfOXKpGmfJMzZuBnssx55mWD3cXbt3JBor9143FtZJf/5BA2PddkcqN6ORVDJmUI5O53Mt+nByMN+Bie4rN3PVJxcQ+Z97Na30wD3O+uwOT6jsZKK5f/ak9ACzOEWvPyFxanJsXuXBP3bBJfIdy+rXvzBKdHh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7315.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 14:34:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 14:34:45 +0000
Message-ID: <548d78ed-f820-46f1-80aa-10815c53a6f1@cherry.de>
Date: Fri, 31 Jan 2025 15:34:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and
 GRUB_TITLE
To: simon.eu@gmail.com
CC: docs@lists.yoctoproject.org
References: <20250128102308.42435-1-simon.eu@gmail.com>
 <fd45d304-a3bd-498f-816f-cc80313a9091@cherry.de>
 <CAO8d5BY-jFbyOjcfHuS1KxDVzyn2FgQNtM9G0x5sB646OtHYqA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAO8d5BY-jFbyOjcfHuS1KxDVzyn2FgQNtM9G0x5sB646OtHYqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b3f6d6-1c38-4a70-d981-08dd420467f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?91ARs3NBpVYVW4ZMfObSF4rPHp5/RXFZgyr0yqVr88unJ81MQNK0KpMR3hnN?=
 =?us-ascii?Q?cSFAq49hqZC82jykYaB4VJC7+gZIpTqq7O01/XglvGr7CfZb95pQ8qBhO7i8?=
 =?us-ascii?Q?TuBdQKYwHBXYiNyeeaNOz/FBCAZ5rZSvFlfixU4gbFatXMdTsLghoMKhI7my?=
 =?us-ascii?Q?3xd4JK2QTdqIx0TAHsaYaI8OChnkw15BJuoODZay04jljmve3Q/ZvID7xGRc?=
 =?us-ascii?Q?b7QjJKNiVA93S2+G7NlnfD1hZSIXMkZXkqrOj9iJ9hmOxU46Lpzrq2s75nV1?=
 =?us-ascii?Q?K/f8hXPAH8QWmLPBY/cqUp6MTGvPIt5aI4M7KjCuxbBgVJs/78R6HpoQAvEM?=
 =?us-ascii?Q?BcyHKET8HU6ww+EpZl2DX12T9/qc9wouFBZKjKjKp/3nztPLK3tByMUGl5Fk?=
 =?us-ascii?Q?bobNEpOODVCZrYBdoWkFe8wudVSz00fKo0gt4ZRZLDy9C96+MkMZ4M6ge8sn?=
 =?us-ascii?Q?obl7WxuCD0Nvd3drPra1e7sDpD0WwiJGoXqgQ2iu/NYbNwcmFB8JdscYXx4R?=
 =?us-ascii?Q?L4AT4TPvQ2jNeqj8HgnnyyVLvHkGGOhA6a80kY8A6DFgNhVvkV88yw8pbUy1?=
 =?us-ascii?Q?5lcFEUpmL5CA3uU22PA9PfbzRqFA+qRmtCZvjIkJ1eRs9mx0DsK0qQLXFoMj?=
 =?us-ascii?Q?MbzPKh9i3V1xtK2SZMtYQGr2MD0MMF6uSObKfyI/iObXww42iYBzUAssKbih?=
 =?us-ascii?Q?1DDe7d/OYS1cM4h8vy0QgHSpnQAG2IzJhQWT67uiMRy20j17BC/DXMJaF/a/?=
 =?us-ascii?Q?DrmpoYX4v8qDW73ZySRsqQTYqtyG/Qyzxls8SS9cyzLajOiWan1Z/l4Z5rNG?=
 =?us-ascii?Q?L4o2pVCFoWFYPDPF4ivkDq4X2zKCBjPoWTBXs3543XUcU812p8CV/+EAIb5g?=
 =?us-ascii?Q?jUx73Shbc46I7v065eqei7RHEYXzAlqD8pH0u2Vy9mgYcYcKu0rhqnKrAt5F?=
 =?us-ascii?Q?S7Yw/3L84kAF+T/w116zRy0sZ982GMPJYwbMmIoJu6gh0Y630MSZs0xKw+Ft?=
 =?us-ascii?Q?Kp5E3nM7YYeG3sQUP+ZcfmVPII3tOEdojRw/hYeH7O/UxvEmNW0/FRsWnmVy?=
 =?us-ascii?Q?Ecndoc63+SZC/UHntyUQRSXbR/s6Nak2YG0HmuxjIKf2ysmzXBThCHuPEfNt?=
 =?us-ascii?Q?sRhiGRRXtfW5GAYwRNd1h7FDRns5kHjK9vsHw/C7XYyUdw6y0wPl0LMJKIDu?=
 =?us-ascii?Q?Am5uGgXi/7iN8VTD/Yt1ZlfAdlZCgVRXPOBi5RBuB5kRx6Ztv+zteSkS+R/W?=
 =?us-ascii?Q?0t4MEEYyML0pP3Qh3NEwyjusaQl++oBwjUV737flwWjYfmwWDM9QNB3PocFQ?=
 =?us-ascii?Q?Ivaa75KfVpnu2WNkBpUAQRLb2KJD+0kHs+5c5ALPuAD2C1/3W4LxCT8lrlLu?=
 =?us-ascii?Q?xXrozSq4dzGPef1iiorssRnOirWB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jsO5OW5uLktBiC+nt43NmODH350FURg762M9tJqI5Vk0TtLkzlFKSNczB2NK?=
 =?us-ascii?Q?oZ/5mVJbFnkxTx08Nxcm2RYi62kE7aWf5m+6Jlkcs8DJ+07wwH9f6EGOv1rv?=
 =?us-ascii?Q?7+0Vj3UhDWIEa0J1CGVE9GemUddS6Co727uXfAOjrwZ5r0437GSMydUE3C5m?=
 =?us-ascii?Q?phStVT33rC8mF80gFTDbAt1LHFWH+UOExydjwroUhVLW2Th4yQ3vP5ipZ6Gt?=
 =?us-ascii?Q?/6bx+9dlBB4HjdqrjP4Kj8DSP6+eliUWzO28Q5afAWlGsY4kJ12o5nk2dk/J?=
 =?us-ascii?Q?Hfle4oaHSU+F0mUBub2uQyh+0uMEvRf6DwAu62HvKKG27gyYyNAbk80TSijV?=
 =?us-ascii?Q?wXeovWTLIVql4JTPp1HOOcOYJQkIoLMbu23yhFuQ24u/FiGDH+gHayakU5Xf?=
 =?us-ascii?Q?/TVBBh6O8y+5BiJXcl1OynDqE+eymy0NGJqB1VygTCZzWn13CLP0oJNKpDQD?=
 =?us-ascii?Q?EctDkBv991Clx3bJGRuNRCjA1b6qtBD+JEMSmq8SCVOJlgYFsn0Rlepkb5Q9?=
 =?us-ascii?Q?vzgqs4R6L/wSHODzkotk+6AqtU3LzvFJUvklYUwaFrevqLJkxFk2Bq9mlWQ2?=
 =?us-ascii?Q?FqN6pMMmIHH6Rf54kVWo+buqLiQNCQYjiPHdC+EK7IlUEh8LdA9C9DEFyIu1?=
 =?us-ascii?Q?n1nFvV+i/jiwhHphr/lmZT42sF48ThxSQZGcflDLYSTH/Ozi9mS2lFgXJV76?=
 =?us-ascii?Q?ii1u0Pq2GuD8UhFjBMeW4scJ53QYNnckOvE76/d9HRqXQr+LAzJJZmThyrEj?=
 =?us-ascii?Q?qdsh4S6YOICpc+TXM1jqQaRFJoUHWuVQkPK4RrThh2E/ii5NNmkPJRAFlSrK?=
 =?us-ascii?Q?i3KRaFZi5lg766t22Si3qXbgyoLqzGLCe9vlkxn0LAnvA9ca69y6vXfN+J6r?=
 =?us-ascii?Q?dXw+z/rme4I09oKoeUMgqH8vP6CyPT4fcJ1F521vk5stEyeJpgNpr1IdLo0c?=
 =?us-ascii?Q?QEhWb6eKrBgk8APDCs246X3Zsf09diIpWkzof3LJ4E6JXUfl6KJuxF2o9RUA?=
 =?us-ascii?Q?RGGUp1U57SEmM5OONOT8M+sIsaRqWjtqQc81WYCpd5vj3dBDYzCRtAFVuNwN?=
 =?us-ascii?Q?LnfrkzCMEdadgO4fh8GTVG5r+TOrlgqL3jK27u10jzL9Swzzc0hcoEiOKeIt?=
 =?us-ascii?Q?/HGQDr6du+tSVspCZM9j30pjCAohxPfcBcE9hfzvX4CZqizgiCaEbVGa0Ks2?=
 =?us-ascii?Q?jz8N555c7CIM/fo5w2V+5/4XXilbcGDPga8lKwwMqRP2KaFkCu+7gjhFGyne?=
 =?us-ascii?Q?Fp85KgUzq15WdOUURHvhDH7WSKo+s3xgLfZQd3+GFLE2bm99b8n1DaLzCIPL?=
 =?us-ascii?Q?vIv5JuJhPEgygNFCa5MrzGvi79ZuEdmVfNTJKKOztWtN3hTDj95M0tl+T1XI?=
 =?us-ascii?Q?4B7mMpFEzxKpk5BCpY3PErBE3Fnmd1LwiwCLeUeprWE+p06Pf+4ZlClTeJQ+?=
 =?us-ascii?Q?tW2ZzveKKTdTs6wJODvFCYdU7Wl6VvO/kB/5zfsEyUYTlqkI75HBJAYZOgFS?=
 =?us-ascii?Q?ORlLTeYzD7w2KDSV+F29GZ9Q8VxfnTeETjNgPVQ3XDawhYUmG617kjAKZ3qV?=
 =?us-ascii?Q?Mr2EH6f/Qoq5afGpojW+wxz5JYVfNpNiYky+YsSdyuDtODHP7WSDZLTDn9+1?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b3f6d6-1c38-4a70-d981-08dd420467f3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 14:34:44.9243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezzxwJaGTwZ9SJuVLAPXgYYzB7UzLvMidh1SAIfFfvp7uFdaJKvzR5cRvxGD2MM+CJjmSmefyZR8otIfdsqtbvt4s5s6cxL29ZkE+rHtvpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7315
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 14:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6234

Hi Simon,

On 1/31/25 3:26 PM, Simon A. Eugster via lists.yoctoproject.org wrote:
> Hi Quentin,
>=20
> On Thu, Jan 30, 2025 at 4:57=E2=80=AFPM Quentin Schulz <quentin.schulz@ch=
erry.de>
> wrote:
>=20
>> Hi Simon,
>>
>> On 1/28/25 11:23 AM, Simon A. Eugster via lists.yoctoproject.org wrote:
>>> This patch describes how to use overrides for grub-efi-cfg because that
>>> is otherwise only clear after reading the .bbclass file. It also adds
>>> a description for GRUB_TITLE.
>>>
>>> Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
>>> ---
>>>    documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
>>>    documentation/ref-manual/variables.rst |  5 +++++
>>>    2 files changed, 21 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/classes.rst
>> b/documentation/ref-manual/classes.rst
>>> index 761be7b545..1d64ac2f28 100644
>>> --- a/documentation/ref-manual/classes.rst
>>> +++ b/documentation/ref-manual/classes.rst
>>> @@ -991,6 +991,7 @@ This class supports several variables:
>>>
>>>    -  :term:`INITRD`: Indicates list of filesystem images to
>>>       concatenate and use as an initial RAM disk (initrd) (optional).
>>> +   Can be specified for each ``LABEL``.
>>>
>>>    -  :term:`ROOTFS`: Indicates a filesystem image to include
>>>       as the root filesystem (optional).
>>> @@ -1004,6 +1005,9 @@ This class supports several variables:
>>>    -  :term:`APPEND`: An override list of append strings for
>>>       each ``LABEL``.
>>>
>>> +-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
>>> +   Defaults to ``LABEL`` if it is not defined.
>>> +
>>
>> I would rather say that it defaults to label's name (``LABEL``) or
>> something like this. GRUB_TITLE does not defaults to LABEL, which is
>> what this may imply.
>>
>>>    -  :term:`GRUB_OPTS`: Additional options to add to the
>>>       configuration (optional). Options are delimited using semi-colon
>>>       characters (``;``).
>>> @@ -1011,6 +1015,18 @@ This class supports several variables:
>>>    -  :term:`GRUB_TIMEOUT`: Timeout before executing
>>>       the default ``LABEL`` (optional).
>>>
>>> +Each ``LABEL`` defined in the :term:``LABELS`` variable creates a GRUB
>> boot
>>> +entry, and some variables can be defined individually per ``LABEL``.
>> The label
>>> +specific override names are defined as ``grub_LABEL``.
>>> +
>>> +For example, for a label ``factory``, the override name would be
>>> +``grub_factory``. A custom GRUB menu entry titled "Factory Install"
>> with the
>>> +additional parameter ``factory=3Dyes`` can be achieved as follows::
>>> +
>>> +   LABELS:append =3D " factory"
>>> +   APPEND:grub_factory =3D "factory=3Dyes"
>>> +   GRUB_TITLE:grub_factory =3D "Factory Install"
>>> +
>>
>> FYI, I believe this is currently not properly handled by sstate-cache.
>> We use the same OVERRIDES trick on extlinux.conf generation for U-Boot
>> and we needed (it seems like, wasn't there when it was implemented)
>> explicitly list all variables with their OVERRIDES.
>>
>> c.f. do_create_extlinux_config[vardeps] in
>> meta/classes-recipe/uboot-extlinux-config.bbclass.
>>
>> An easy way to check that would be to only modify APPEND:grub_factory
>> and see if it regenerates the grub config file appropriately.
>>
>=20
> I checked briefly and first built the image,  then I modified one single
> variable by adding =E2=80=9Cmodified=E2=80=9D, and ran the build again. A=
fter both runs, I
> did a bitbake -e, and the =E2=80=9Emodified=E2=80=9D was not present afte=
r the first build,
> but after the second build.
>=20
> GRUB_TITLE:grub_install:append =3D "Another NEW title for the
> grub_install label, modified"
>=20
> Did I check correctly?
>=20

No :) bitbake -e is the result of parsing. Parsing isn't an issue here,=20
but rather what is going to invalidate the sstate-cache for a task or=20
not. Tasks are only rebuilt if their content changed (taskhask), the=20
variables they depend on change (this is done by checking the content of=20
variables stored in the task's vardeps varflag and also I believe by=20
some heuristic detecting ${VAR}, $VAR, d.getVar('VAR') and the likes),=20
or if a task they depend on has their output changed (see Hash=20
Equivalence in the docs).

You need to generate the grub config file once, change a value, generate=20
it a second time and then inspect the file before and after that change.=20
GRUB_TITLE for the install LABEL should be modified if everything works=20
correctly.

Cheers,
Quentin

