Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B19D462AB
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:21:01 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.62])
 by mx.groups.io with SMTP id smtpd.web10.12794.1731507656409820232
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=T2zGGYUd;
 spf=pass (domain: cherry.de, ip: 52.101.69.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMc9i7cjrkkRfie8QtMjr9TWk2ck/3cQzy7dO8Mg0jY66qLttBhd1c71ftIbXBAKcAZBbda5Om4PcQJjaoL7kFpbVCzAXXpRBSAfAGZgcF2GVuMhtr3FEeRJAJwr3eJqrVRAeWD2rzfaC58TWFu/0RoFwQyktZEWNIXUFOtInw18EXQ9gto3rYmLCwxI1qrlmJLCGkY6zX8AvxevEv00lX4lJPJ76afqTAckfrMKsxqzTyLjo1USQZ9Knzhr7j7jvHu2QrG632TC006RpJK2gDNviZRNyJRgE0AEySyDzKJZvJRpza4CCw7lFGoZ65UD4PS4075DNcNxcPibJXTKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AR60SGTrfbE4EbGbeEabCNYAKrmFLZmGtOWVrRNq7n4=;
 b=oDJAEAwdt4h1cCaXY8egYSTFTF0Q0UFbqJ44w7jWBEcoKMZrWpARifBziS2D+T1wNF+q+LFw+K87Nu2kFV8g1FJbhpHxOiSs1R5XVV4uENHDWDW+qrae03RkuWHPRNyVNeqp3+KYMnQAWCFy0ConqSgiyIF4QVCy2cWNQ4TgYRsCOg0VlbGJVUXw37NeqCvoC+o5JdsEwIL6OQtb4uI6ysOxWnqiGi3VQSOc3IURLAVg4fst8KTt3G8e4I4S1wsdSg3TmneTIW33SgZ/Ci1A9h3W953KeNRNLHRXN7ZHz3dzKyVzbatdi2FgdNjzxRCNtX7tBhs7j1Ca5d4CEcXqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR60SGTrfbE4EbGbeEabCNYAKrmFLZmGtOWVrRNq7n4=;
 b=T2zGGYUdJUmf5qdvxHqhqG8SiIL9hD+/jeGaaRzpl2PSHjfQrAc6AsTTaZD1tarOGx3QWrmzvSwKv8XvvuDn35jiuuFmdj5thQ+dlx8kCLEDQuYT76iFzTD8+/nuKaSayacCu5FoFxv8nYkgFRA2omIjmOVLBLIQlDopw25qQRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9656.eurprd04.prod.outlook.com (2603:10a6:20b:478::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 14:20:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 14:20:53 +0000
Message-ID: <b9d477cc-d0f3-4e20-9b32-53be03b62c44@cherry.de>
Date: Wed, 13 Nov 2024 15:20:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dev-manual: document how to provide confs from
 layer.conf
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com>
 <20241112-layer-confs-v2-2-22a09f1a0a8e@bootlin.com>
 <e5dde215-3310-4a3f-bd10-c02137d5c1b7@cherry.de>
 <D5L4597JFNEO.3GX30FCK1IUNZ@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5L4597JFNEO.3GX30FCK1IUNZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1P194CA0048.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::37) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: c6416515-f428-4fd4-5ea0-08dd03ee614c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uIljc3/Cd+NoQn3r4P1C7y4610FBdo4DuuElP3ehliFRBdo1+K2eigPKg7Lb?=
 =?us-ascii?Q?dm0wcq+ZtHMtNQHiicnDuZCaN8jPNX/svkadKbISrJQ+DxpcYH25ECk86Unc?=
 =?us-ascii?Q?IAiyL7RzvoJjjLnZ+bPWDRjNBVjCHTLC+uuN5w7mjrU8U18d0WySvJ673mds?=
 =?us-ascii?Q?wclwucl2V78m32IG+G8itI7Li3WYjg0uQ9PRmb1riHFCFztZ+D6bBva8DsjH?=
 =?us-ascii?Q?lhAyLp3eb7HP+Oz6UyYhcnvzbOzio6tVSgeNfGKPH8Pg2hx9XbcVQicadWTU?=
 =?us-ascii?Q?AN0MJEIdQ5PVb/Ia1ivgBHA+nHvxA14BOqelOcTccMUyyFGv727cJmv5TnRU?=
 =?us-ascii?Q?bmcZcxoqTBvBKCIOiI6ZUV/GzV2XYhEvAWeWIjqZjgxA/gx0mAfYSrt5L/3n?=
 =?us-ascii?Q?g/MXm2In/RQIdbbEnB55Owbby9ttypXBGqXJ7+O3j7TWIVfUtx5dPA5GhR3X?=
 =?us-ascii?Q?2ZqRGXtQjtr9mxhqAfrdSnviPmTnWBTa62DHcblBU6RBq9LBIhnMyBBsZI4A?=
 =?us-ascii?Q?7ntPxJGzcKQ43AJdJ6EPPd+0II0htMraf5aQRS04/QCPyOSUiME9UnPOQrtR?=
 =?us-ascii?Q?Ye7ViJPCsUy556hp43GDVCVxNxGmlt/VI+/08uInzVax7PlMufxGUCmJKq6g?=
 =?us-ascii?Q?N/jN/9suZvQK4ownKeVxbw9wEiiraxvjfP5L8FKQRNnTxbwjMb5NG4AVxNN3?=
 =?us-ascii?Q?Doft+TYu6IJP94OX1Qu1WPjiCgFncSL2C47j23THbzzWSBYsmvUil1BFSune?=
 =?us-ascii?Q?cCCQguT3Qd4t/+XAP0gBr8+NbAftv5psAz2radOPBNmeCIm6HQHnadat3TLK?=
 =?us-ascii?Q?Yp+n2U7NGoAIpPh2kesbx7oY/hYrckwJ9CWcoufQA0RLnyLi+Ey/0Hhh1Jyw?=
 =?us-ascii?Q?kL4mZsKUhS24BOP1ahpEsV+zXjq2gh18dZt5hOLZwDuK4TCUTAU7FnK2IGxK?=
 =?us-ascii?Q?hRWtt/9YCryVTQ3lpnZ6e2vE6PW9gaasOnO08gn6oG+ueml6slSgd291d7s7?=
 =?us-ascii?Q?e1p8Cuu/PFpDitq3SzrRRCg0xsQeSIeXy/4HJxMo9/6nN3NFjYB+G/3GBusQ?=
 =?us-ascii?Q?pxFn828xip5FhX6ZeiUyo/lXn+8OBB9eu8Ns93apr6ncQ/m6smUOEganPrR0?=
 =?us-ascii?Q?KiLLLoibpF8kVc8+jmRdRd2GtN4rUVn2wIFifkxtAS0xYosOWtdLTPZKqFDw?=
 =?us-ascii?Q?XJEggEEhwhg2VwzGBTguQWN5uPz9vwZW4uiWvAWlHzYCGZr17vHuuiiW1o4B?=
 =?us-ascii?Q?FZQTRQy3kjqlbAgMiyEf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fpg0fk62+KAQD/ouzB4ftAkcAVtu8nh8tIX6DaFej29HQ7fZxuu1q6E+Oenl?=
 =?us-ascii?Q?EtaL8QRBkxuEnq0DilrhVs9rxa7hXsNMtB2GVuVEqDhhtizqQOJMFOoUeFqt?=
 =?us-ascii?Q?qVCo9c+TYHHWmAPzOgs9wrOSf3MTaY2i3hwv8leNOWsoHxsY8NP1LYzMscnW?=
 =?us-ascii?Q?qwrGbmG8LUQZnLapof4HFcpVSRIo+6NF2SozwIKYSjEqEo3SE/uzbTTtBC9H?=
 =?us-ascii?Q?hu0xuulV7mj7963chtyktrsyIv29n16f0sC6RNX4J+CIr09xJ1Hkx9q5OT6e?=
 =?us-ascii?Q?vojbx9YOYuz2yqfn/hpEtV4PHfQjcnVke5cWbIi36CD0BT7O1cqNllfKnGP0?=
 =?us-ascii?Q?jgzRitdnWdE7lMIRYxKNS/XihWibp1SWkoL6urnJ6cjSI9wNB0BYpGiv9wbE?=
 =?us-ascii?Q?Qgf/i/5lVEoP40T2P6XWCLJ6rr3Olu/Yalq9Ac3MJD3Hhnb4y/fmv0a+3L/h?=
 =?us-ascii?Q?T7Mb0WEBDuI/n9RX8hHEUTWp9uTeO1bkwCcAsWRWMvaGtWqdQEyoiwN1jW+L?=
 =?us-ascii?Q?i/JjcqdGBgba10a/3BSK2X076NWO/JMNmrJQDlWQ8pewyjDJkqVTOOlSGvCy?=
 =?us-ascii?Q?jm4XjUewGWtqk1zTD3vi+RBwqmtdT0FqcTSBsEpXO+fYSTyaqn22rPJi7zNB?=
 =?us-ascii?Q?c3kRUcclwQlNrysP1ddmwWpjNqx85UXUtWUWVkfXe9fjJc3of4OjHQdkTSBA?=
 =?us-ascii?Q?KdyJePUBmVFwknE4UxerAw+7Sy1jZWoAl0ZF7zAX2iL1vPWF+gU0iBqKWtPn?=
 =?us-ascii?Q?Nn0Zm4Rf+Tx0yI4GuiVRSaeQmIPVGRwDzPXukjYzPJW7Lq2QXshLD6h2os3l?=
 =?us-ascii?Q?HwF1iLnVf33YMb5vgojWkqO5h5mkCSuP1tgR3ETQOj9gaQsrR4FZnYF1vqbR?=
 =?us-ascii?Q?DTWJib/UoCAHukVqyBePc7BlGG8CzTQ8UVyRVyuhn4ZvaiYKzujhC/EkpRBG?=
 =?us-ascii?Q?i6Vu76Sk7Mzd9+6oJBdsBS8dvCGtSYsp8xr/ZrYblpsqWEOnOxwb2z5xzDBZ?=
 =?us-ascii?Q?G+/33Kkptg6RkDm401e4js1IGEBZkFcXjjI6rtK04E8Vb0btZJUVufJVn8f8?=
 =?us-ascii?Q?MaJ5S0ggF8HRn9gh0kwsLTxj6AM/Wc6+SxLxBp/HTJvohBEmMCiR/1QtdHqb?=
 =?us-ascii?Q?4NpD4EjmC8YAR+vZ4IakELopVFGuwvMvwDUwh7Bx/IIwe1e/WG2DK3j2XQ4s?=
 =?us-ascii?Q?1NKeupmYgZQ7d5ld6EukgYyptURa46yiDh+uPMNlqPOKXJj/MfJSpKt3QFyj?=
 =?us-ascii?Q?T/Yaton0yq0T3KLjxDBiZvZi/QhowqwogDJoj8B3IkTLwQmytG6LEHHM8nED?=
 =?us-ascii?Q?s+ja94U5mMbUhARAJ635/tcyFknCDcH1aDF3TYCGLrGcCCLqQRidI9IYtZ3b?=
 =?us-ascii?Q?z61Jtexxt5ZNrDXWvPF+m5qjusLDBSodQKh4wqrFXHJoOKVDWzgQgZvY5RR6?=
 =?us-ascii?Q?63L47jL4goNfBq4IUQPBz9WKZcWQuB4HXw9dRoe/GdOgMQHP7viby1D2I8CD?=
 =?us-ascii?Q?gXDxDLWmgdEmE2phahbJHBESAqfp9qNoYfado0t+Gq6FltVBa0Rwm4ntnoj3?=
 =?us-ascii?Q?pP8l4AI9oS/qruvrabrebCvwPPOdzi8+sGcjmGO6VnpTJ/efbItv+jCDhD2a?=
 =?us-ascii?Q?WvwWdP2eqUoT7vISVPLGCdA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c6416515-f428-4fd4-5ea0-08dd03ee614c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:20:52.9720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrAJRT3OMejQPQYiG7o51tJm2NpZT4Enem3cjmempXlokaWDbJmqtTj5y2BMAWBSrRSm17B6pRdelL+4mCaA0nAGWRrFR5VYISq9JpVJIE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9656
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:21:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5729

Hi Antonin,

On 11/13/24 3:16 PM, Antonin Godard wrote:
> Hi Quentin,
>=20
> On Wed Nov 13, 2024 at 10:58 AM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 11/12/24 12:32 PM, Antonin Godard wrote:
>>> Add a section on providing global level configuration from the
>>> layer.conf file. Since this file is parsed at an earlier stage in the
>>> parsing process, it's not possible to combine bb.utils.contains and
>>> {DISTRO,MACHINE}_FEATURES to conditionally set some configurations.
>>>
>>> This patch documents:
>>>
>>> - First that this file can be used for providing such configuration.
>>> - Then demonstrate how to conditionally provide them, using a technique
>>>     that is currently used in meta-virtualization
>>>     (https://git.yoctoproject.org/meta-virtualization/tree/conf/layer.c=
onf#n50).
>>>
>>> Fixes [YOCTO #12688].
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/dev-manual/layers.rst | 86 +++++++++++++++++++++++++++=
++++++++++
>>>    1 file changed, 86 insertions(+)
>>>
>>> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-ma=
nual/layers.rst
>>> index 91889bd0ae391c7b6e62068778ae5c180c840762..e449fd43ad86c9a027e317e=
49b6e2f2f340a08d4 100644
>>> --- a/documentation/dev-manual/layers.rst
>>> +++ b/documentation/dev-manual/layers.rst
>>> @@ -644,6 +644,92 @@ variable and append the layer's root name::
>>>       order of ``.conf`` or ``.bbclass`` files. Future versions of BitB=
ake
>>>       might address this.
>>>   =20
>>> +Providing Global-level Configurations With Your Layer
>>> +-----------------------------------------------------
>>> +
>>> +When creating a layer, you may need to define configurations that shou=
ld take
>>> +effect globally in your build environment when the layer is part of th=
e build.
>>> +The ``layer.conf`` file is a :term:`configuration file` that affects t=
he build
>>> +system globally, so it is a candidate for this use-case.
>>> +
>>> +.. attention::
>>
>> I would recommend using .. note or .. warning admonitions over other one=
s.
>>
>> Right now it seems we have mainly .. note, but also a handful of ..
>> admonition and a couple of .. tip so maybe that's not the best advice.
>>
>> Anyway, why this suggestion?
>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#=
directives
>> """
>> Admonitions: attention, caution, danger, error, hint, important, note,
>> tip, warning and the generic admonition. (Most themes style only =E2=80=
=9Cnote=E2=80=9D
>> and =E2=80=9Cwarning=E2=80=9D specially.)
>> """
>=20
> Thanks for the tip to the doc. I'll replace that with a warning instead.
> Also there was a usage of `.. attention` for the bblock patches, I'll sen=
d a
> patch to replace that.
>=20

Ah yes, haven't pulled yocto-docs in a while :)

>>> +
>>> +   Providing unconditional global level configuration from the ``layer=
.conf``
>>> +   file is *not* a good practice, and should be avoided. For this reas=
on, the
>>> +   section :ref:`Conditionally Provide Global-level Configurations Wit=
h Your
>>> +   Layer` below shows how the ``layer.conf`` file can be used to provi=
de
>>> +   configurations only if a certain condition is met.
>>> +
>>> +For example, if your layer provides a Linux kernel recipe named
>>> +``linux-custom``, you may want to define the :term:`PREFERRED_PROVIDER=
` for the
>>> +``linux-custom`` recipe::
>>
>> """
>> you may want to make :term:`PREFERRED_PROVIDER` for the Linux kernel
>> virtual provider point to the ``linux-custom`` recipe.
>> """
>>
>> Because we are not setting PREFERRED_PROVIDER **for** the linux-custom
>> recipe, we want to have virtual/kernel point at linux-custom (and it's
>> set outside of that recipe). Moreover, the content of PREFERRED_PROVIDER
>> for the linux-custom recipe isn't really of importance, it's more for
>> other recipes depending on *a* kernel (e.g. kernel-modules, image
>> recipes, etc...).
>=20
> That's correct, I get exactly what you mean and re-reading my sentence wi=
th that
> in mind does bother me too. :)
>=20
>> Not happy about the way I phrased it so maybe you can suggest something
>> better here?
>=20
> How about simply:
>=20
> """
> you may want to make :term:`PREFERRED_PROVIDER_virtual/kernel
> <PREFERRED_PROVIDER>` point to ``linux-custom``:
> """
>=20

Works for me!

>>> +
>>> +  PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
>>> +
>>> +This can be defined in the ``layer.conf`` file. If your layer is at th=
e last
>>> +position in the :term:`BBLAYERS` list, it will take precedence over pr=
evious
>>> +``PREFERRED_PROVIDER_virtual/kernel`` assignments.
>>> +
>>
>> Mmmmm, except if the machine configuration file sets it too with "=3D"?
>=20
> Also from local.conf, etc. I guess so what about:
>=20
> """
> it will take precedence over previous ``PREFERRED_PROVIDER_virtual/kernel=
``
> assignments (unless it is set from another :term:`configuration file` suc=
h as
> machine configuration files).
> """
>=20

another configuration file that is parsed later, such as machine or=20
distro configuration files.

?

Cheers,
Quentin

