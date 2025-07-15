Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D333C83F21
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 12:41:57 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.58])
 by mx.groups.io with SMTP id smtpd.web11.7523.1752583309781745813
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 05:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=lm6yCTTU;
 spf=pass (domain: cherry.de, ip: 40.107.130.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CB4vqEDFx7t+yQF9oQOTsNMfkhdC70BPyx3vQwwenF54MBWeIcf41IEg8xZOmwlRC5gbARq9qB4QqKmGpyi1uiCNAxcjE54kxw5BSeVw/wj/ma1Q+pCBSYz4J9/SO+4cDR1blmUot4nydI8L5+yKogtvd7RJdiEU1sk1PlTlHnV1m79CqGS8RlGlfZuLArbx/vWsLOymyDRoPHBep7KlvftlPdVT8lIrWP8hITv+203whKHALwf86BpRRT3uSivdNEq2pwvY+Ecq+IbHM1Mm9mZLd4iWwi32GJ5iAzYDHaiKTcG9zhYJASTN083F4SqC+sJ8mhkc/CxDUJgVIGot/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyWPMF3Am4xTP8XKRqyRd9TJeYk1P76QVaq7ROR9umw=;
 b=t4TCzFA7waG7BYMyJL1LWNFOy6SqRKfR9PPymj8XeG8q5xgdnpioygGwIMx+vl3sMq6Btdr2ZUOAUT8LM9ndh1IqlDB3j35M6PxyMwgrrOvdo/UY5Zili5+HGDtq3vpin4T421ChYTxh4VESos2NMQLkGk0CVG4xMoK4h06mlTw4qD/jg//xsmkhIFFS6bKJDFE7XGA/kijG0OwpMyT777JV8AmoZJzWiPoaQ7dD3f5lG3rGDsxXKPtoeFfp2YMEGzFqJuHvJweifO3oKgBZewPqmv/HjrJNfh3ev72Y27kd5KkIcJSn6Ob8oGICGmGUdQcOni5nhv3zS0O8GXwOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyWPMF3Am4xTP8XKRqyRd9TJeYk1P76QVaq7ROR9umw=;
 b=lm6yCTTUUGAr/bLAfSWpLCedXKEu3UCnWRTvGrZauC9k9+rsfIF0CvS52HSDSKJSjbP1mmApR+9v8vMw+hq19NjnQaHfi+OkxgfI0IJoTjXGGA8/suV2vwnZN8e6dNTTWgr+NaZHIp5mcvlTVUswLIIHMt6RF3AsZKPYjo01dEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9243.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 15 Jul
 2025 12:41:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 12:41:43 +0000
Message-ID: <a58d4dfe-a5c3-4610-8787-3d4d1ae1c859@cherry.de>
Date: Tue, 15 Jul 2025 14:41:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] pedantry: what is the proper descriptor for :append,
 :prepend and :remove
To: rpjday@crashcourse.ca, Khem Raj <raj.khem@gmail.com>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
References: <3115a61f-25c2-5be5-d221-3b28314f07c1@crashcourse.ca>
 <CAMKF1sr=FxYFe93CS33SDGuq2JPreEjA1spXhaPe8ekTc2XUiA@mail.gmail.com>
 <fc752a82-1909-3cc4-0745-812ea30a8b76@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <fc752a82-1909-3cc4-0745-812ea30a8b76@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR08CA0225.eurprd08.prod.outlook.com
 (2603:10a6:802:15::34) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: f56e65f6-0863-47d1-ab43-08ddc39cf427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EHUhL/BGGaekNWpI8ml/tGewLZqfzzdJvZFyzE55dra4mxdjGHPQANXqnvM/?=
 =?us-ascii?Q?Jqrn7PBC7nW/J6Eyn0nBAaulS9ij7jw2Cu4KSFEfNbYoxyHBlTIGnQypI6uQ?=
 =?us-ascii?Q?fzUecuftMkVYaXK6f0XSW1/EQI8Sd801rRuI9Tus1B346uqu83KgHyxEYY7X?=
 =?us-ascii?Q?aFyPetTRbKoX81SWR6d8ORL7ynpcFCAuOFtOElXRyBUgzz+Q8DYfaZ9XqADS?=
 =?us-ascii?Q?o94OtTIlk0iSC74bn9TjzUJVHe76YrewSqRHUpAB60lAeKwyFvVoit+7C0vk?=
 =?us-ascii?Q?OFcDwcRxdlR+Fsxx/LYiX7k4yoQJjTz8V3Nu3dYlYsWPVD09bbPWzmKGiZ02?=
 =?us-ascii?Q?uP6kujs85KtGJhifXyXzRbEs6PIcoa7EA8Mpz94hjXeMX+VwJ+JsdDDKOv/P?=
 =?us-ascii?Q?3dcg7mMvJsPOTNUt4DheDPqSUwSC4QZSER/B/t3E1JqKiVRSbk/GBnFveGz3?=
 =?us-ascii?Q?5+rd6yotT3TBAxe1sCzGOfZKGh0VAFo+zakrJks1s8LeHKFFKI3LkuuoM/gg?=
 =?us-ascii?Q?wD4cO7NkrQmy1+AII0XW0A4wOkN7oPPc07lOTxDKjeWFus5WFKx6uqLk1rr0?=
 =?us-ascii?Q?N9LTPqMH5uvQxPigiles8OK33F4Th/LnG3kd7yG3CLlkSTX/ZGUtdf8rO8Nu?=
 =?us-ascii?Q?WMKqmfdlU4EAG/KgIdq84A4u7Bjta20z9dohytLVng/rgwkNIp6VdF3TaLPx?=
 =?us-ascii?Q?9STLHJZU9KadhInvX6bkFjfnp2hnzujr312RVjxTas/GmRUtAHtEVMoH/vJt?=
 =?us-ascii?Q?8kh6HLvJ8dvg3Ex7HTrBIMVDuSz2JPEgZloSqMUb33XT24QcUMM0OgOFI1xe?=
 =?us-ascii?Q?sJIdOtc0m1WDIickE0IVp7FbG9/i/pI1VtF13kRK9edekeZEV3yYinLLEi1b?=
 =?us-ascii?Q?JMFlUAlouy/rZHgqh5nupHyHaGN1YVSNNHKQKpEQeP/yifaMAWVZc3sBpwZw?=
 =?us-ascii?Q?8fs4vNcdJNXhTa9S0rgG6PdTgQO7O0xLHyDSimwkcD6EH5rfLpndxkiGlDgW?=
 =?us-ascii?Q?wYDSEagYPcFpo53LBTYYwfYUkKjK5PpvhBW6kemVk5av+XXvsQpZanAIRX6I?=
 =?us-ascii?Q?rDOavb0PYkAE84M0NiNo0CdHWb9ZHovaZRRwIUXD2f/TU+ujl2EuBhXndOr/?=
 =?us-ascii?Q?58p/lgcZxl8UaaW2hgr2D0vEIpm3Kh/kD8JZ3KaNi7otQ0bFXJQVf+R6lr7v?=
 =?us-ascii?Q?ajatr+CJ8UbPCR24WqC2TVH36WpHO4HFcJcjMHdu1SByckxGwPA0j7R8c+qQ?=
 =?us-ascii?Q?v4c9pDqGCB7wBrdcQP+5GGWncFNp90maopElK/q+TY6EMEF6x3uh+PuA3jtr?=
 =?us-ascii?Q?5z8g6ukEZtEmEnNiARVzvBBY2IOuSWXnRjw+CpQQ8JEHqaCdoNCa+t7Mitc+?=
 =?us-ascii?Q?+rIVj+o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GsX7qWEFzdZ1VAnr1XNVpQV9Ts9F59qgHd6b0LhYWxp9hfR8kH0T4fJuQ9PU?=
 =?us-ascii?Q?DNW8gd3JUg0sA3t+UvdbaECnBaRLKG3hhmHLbmH2jc4cAuv6Srq6vb3+P7GL?=
 =?us-ascii?Q?AY9duVK1su6DSBOn4rhmQOCoIDtsZqEDJeNsmjcOwfgQbrwJjwz+m5/+nyvu?=
 =?us-ascii?Q?97xIcdRTnNmGCaeEZMkSGFm0Zx3/0qkvyZ9cfFDhTdLn+fi7Z8uWI8k26+Si?=
 =?us-ascii?Q?jzZYqbH/2CwISofLUnddt8uNj9OqXHZEEz4uCSQoq3ldxr9f2BWprzTQ9zxI?=
 =?us-ascii?Q?Epw4/oqVD9zJI4TviO+GmBTuRaVz/czoeWT6d/h8OTfsUjlqeD0NjyI1+bGW?=
 =?us-ascii?Q?SvpHHPvoPPa/g82wTRHkEJARtfentUsdke0BnLoVfof/7v+r1fatGbKwe6Ac?=
 =?us-ascii?Q?UKMtXYrwygnzRslGEBL2ErvLzXoPPCh7HrIo0LixGSLXfo1wqo1PI5/wR3V5?=
 =?us-ascii?Q?BCaU/aQZGO/FNcGUEAWoQoR4M80XMT2fWcCiusdDhR4TZdjWLxY/k8RZTiSI?=
 =?us-ascii?Q?GuQ4lZgLDUswfnw1mHkAM9JeHZKS3rdD8FV908aJkEKxG7fIRQad6tqw1hx5?=
 =?us-ascii?Q?Fk1r1or94GbGxns2yt1sz4HpY7nK282BBPrtDJGpqxeCijA4nkSc4kCDVOl2?=
 =?us-ascii?Q?3QatdY+qoDokJAUjb5TpfPrQ2A8rxPIM8B8kqOkXU2/m179hyItutdWU5gu5?=
 =?us-ascii?Q?gntgrOv1CfVHh/l0lqDDsU6NuBf+A/zhVLkl7c+LfC1yXckR6tGGER+TztAz?=
 =?us-ascii?Q?HYrEiJsPgo31P0TVB5G9fb/R/SHh99OzUxJmPU4NgX/uq3n/LWW9z9oC5Y7Q?=
 =?us-ascii?Q?8b9iHRnIEkiTEax+bTDCMf+5cfxcJ87pxSTxY+VeK+LdrHq9pasruFC9du/1?=
 =?us-ascii?Q?5abj/yuZs6QYDt7PxjNuxMX+w+nFdXNyABVuFhNnVArtbHoIDHL8c2oNknuE?=
 =?us-ascii?Q?NY9huKvAgsvYRwz6sQAL3taABOWc2WDsVcQCbsnDY2DFN7J1B2C3Urdya6GN?=
 =?us-ascii?Q?jvSfKEvpN3D5B20/y06XFUM+JDBP1x6zS1wYQZPQmXrAuIfm98nVH0T0yLOk?=
 =?us-ascii?Q?gPoVo7BGfq5kFHe3NmpEfqWvNlCTDX7OIwltocTKXMF+n1Au+oWI8FruFKdM?=
 =?us-ascii?Q?6GcyCy2yptyeRcUpO69CrnVo7dB4WKSYMjsYmEWygVX1uc6fTjAZLFPmPrld?=
 =?us-ascii?Q?tp2cawLt6CMEUIG0lvfq6g7aezZ57jKLQgL/IW3kjAotcbkaNlfgjx6eljO7?=
 =?us-ascii?Q?BF0LPKOhD/qsyE7W3rmXQmAloG4e+cR1Y7oJFpHt8vx/tbBehUk6jsgWcuNe?=
 =?us-ascii?Q?j3/0yjAs6axwoX44Zw60CDZIVg3QVVLl9MDw+RAZ2GeezWygicQVPe4N5oOt?=
 =?us-ascii?Q?vl6d54dZVqcO/PO1c0go56VBJqGtPZD7MBZ741YJwhn3KURIaO3hF2naOFBY?=
 =?us-ascii?Q?RZtnQpQzFny3253GMamSS71ObRHXwQMXU7tYlXz/IlvJg51DFPOwPwglRX58?=
 =?us-ascii?Q?D39I8u+I0YWmsgBO0fIpot3W7/HozCThxgN8UnEiz5GE5arv5PXCjYe/Cuns?=
 =?us-ascii?Q?HtAOqLpG22NrvoKR9FdyNTr5UAVQzfWq5oD9hUgoxBrkXLdGTRIEBHCX/x7L?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f56e65f6-0863-47d1-ab43-08ddc39cf427
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 12:41:43.7803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCUm+e9g/vyELUxODy8g5+dQl/5nM3zLO/iF13hr+bxFNB8Df7oAez7f8EkdkVtJc5Ntq3czTNTj7qoXLxcLYTyCxTnSCJRMTeCaESA8JmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9243
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 12:41:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7337

Hi Robert,

On 7/15/25 11:27 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Mon, 14 Jul 2025, Khem Raj wrote:
>=20
>> On Mon, Jul 14, 2025 at 9:59=E2=80=AFAM Robert P. J. Day via
>> lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org>
>> wrote:
>>>
>>>
>>>    I ask as I have seen documentation that describes those three things
>>> as "overrides", apparently because they appear in the same place as
>>> variable overrides, but that seems wildly misleading. It seems that
>>> they should more properly be classified as "operators", and if that
>>> was the case, I think some documentation could be made clearer by
>>> distinguishing between "operators" and "overrides" when you see stuff
>>> like:
>>>
>>>    VAR:append:arm
>>>
>>> that sort of thing. So what's the proper descriptor for those three
>>> things?
>>
>> variable:operator:override
>=20
>    actually, i was asking about the proper descriptor for the three
> things "append", "prepend" and "remove", but this is making my point
> -- those three things are properly described as "operators", as
> opposed to "overrides", so one might say that the correct syntax

Both are correct.

> would be:
>=20
>    VAR:operator:override(s) =3D ...
>=20
> in that order since, as quentin suggests:
>=20
>    VAR:override:append
>=20
> is almost always wrong. i remember asking about this distinction a

Almost always wrong but still might be something you want, so we need to=20
explain it. By explaining the difference between both, people would get=20
a better understanding as to why it is most likely wrong for their=20
usecase and maybe even have them go through their codebase to check if=20
what they think works actually does work.

A typical use-case where this makes sense is the following:

do_install() {
}

do_install:class-target() {
}

If you want to add to the class-target version of the task only,

do_install:append:class-target() {
}

will NOT do what you want, but

do_install:class-target:append() {
}

will.

The former will add its content to "vanilla"/"default" do_install=20
whenever building for the target, but the actual do_install will=20
actually be of the content of do_install:class-target, so you need to=20
append to that.

> long time ago, and that distinction is covered in the BB manual:
>=20
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-metadata.html#examples
>=20
> but maybe that needs to be extended with this caveat -- that an
> "operator" should precede any overrides in almost all cases, as i see
> no actual valid use cases for that second, weird form.
>=20

I couldn't really find any actual user in poky, c.f.:

$ git grep -w -E '.*:[-a-zA-Z0-9_]*:(append|prepend|remove)'
bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst:=20
A:foo:append =3D "X"
bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst:=20
A:foo:append =3D "Z"
bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst:=20
A:foo:append =3D "X"
bitbake/lib/bb/tests/data.py:=20
self.d.setVar("TEST:some_val:remove", "testvalue3")
bitbake/lib/bb/tests/data.py:        self.d.setVar("TEST:bar:append",=20
"testvalue2")
documentation/migration-guides/release-notes-4.3.rst:=20
ERROR_QA:layer-core:append =3D " patch-status"
meta/conf/distro/include/no-gplv3.inc:RDEPENDS:packagegroup-core-full-cmdli=
ne-utils:remove=20
=3D "bash bc coreutils cpio ed findutils gawk grep mc mc-shell mc-helpers=20
mc-helpers-perl sed tar time"
meta/conf/distro/include/no-gplv3.inc:RDEPENDS:packagegroup-core-full-cmdli=
ne-dev-utils:remove=20
=3D "diffutils m4 make patch"
meta/conf/distro/include/no-gplv3.inc:RDEPENDS:packagegroup-core-full-cmdli=
ne-multiuser:remove=20
=3D "gzip"
meta/conf/distro/include/no-gplv3.inc:RRECOMMENDS:packagegroup-base-vfat:re=
move=20
=3D "dosfstools"
meta/lib/oeqa/selftest/cases/bbtests.py:=20
self.write_config('PV:pn-gitunpackoffline:append =3D "+${UNDEFVAL}"')
meta/lib/oeqa/selftest/cases/uboot.py:IMAGE_FSTYPES:pn-core-image-minimal:a=
ppend=20
=3D " wic"
meta/lib/oeqa/selftest/cases/uki.py:IMAGE_FSTYPES:pn-core-image-base:append=
=20
=3D " wic"
meta/lib/oeqa/selftest/cases/wic.py:IMAGE_FSTYPES:pn-core-image-base:append=
=20
=3D " wic"
meta/lib/oeqa/selftest/cases/wic.py:IMAGE_FSTYPES:pn-core-image-base:append=
=20
=3D " wic"
meta/lib/oeqa/selftest/cases/wic.py:IMAGE_FSTYPES:pn-core-image-base:append=
=20
=3D " wic"
meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb:do_configure:linux-gnux32:prepend=
()=20
{
meta/recipes-connectivity/avahi/avahi_0.8.bb:RRECOMMENDS:avahi-daemon:appen=
d:libc-glibc=20
=3D " avahi-libnss-mdns"
meta/recipes-core/images/build-appliance-image_15.0.0.bb:IMAGE_CMD:ext4:app=
end=20
() {
meta/recipes-core/packagegroups/packagegroup-base.bb:RDEPENDS:packagegroup-=
base-zeroconf:append:libc-glibc=20
=3D "\
meta/recipes-core/packagegroups/packagegroup-self-hosted.bb:RDEPENDS:packag=
egroup-self-hosted-sdk:append:mingw32=20
=3D "\
meta/recipes-core/packagegroups/packagegroup-self-hosted.bb:RDEPENDS:packag=
egroup-self-hosted-sdk:append:libc-glibc=20
=3D "\
meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot=
-for-compiler-ru.patch:+=20
  llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot=
-for-compiler-ru.patch:=20
     llvm::sys::path::append(Path, "lib", getOSLibName());
meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installat=
ion-dir.patch:=20
   llvm::sys::path::append(DriverIncludeDir, "..", "include");
meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-=
cross-toolchains.patch:=20
     llvm::sys::path::append(P, CLANG_INSTALL_LIBDIR_BASENAME, "clang",
meta/recipes-devtools/gdb/gdb-common.inc:RRECOMMENDS:gdb:append:linux =3D=20
" glibc-thread-db "
meta/recipes-devtools/gdb/gdb-common.inc:RRECOMMENDS:gdb:append:linux-gnuea=
bi=20
=3D " glibc-thread-db "
meta/recipes-devtools/gdb/gdb-common.inc:RRECOMMENDS:gdbserver:append:linux=
=20
=3D " glibc-thread-db "
meta/recipes-devtools/gdb/gdb-common.inc:RRECOMMENDS:gdbserver:append:linux=
-gnueabi=20
=3D " glibc-thread-db "
meta/recipes-devtools/python/python3_3.13.5.bb:RDEPENDS:libpython3:append:l=
ibc-glibc=20
=3D " libgcc"
meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb:DEPENDS=
:qemux86:append=20
=3D " nasm-native"


IMAGE_CMD:ext4 isn't a "real" override per-se, same as for the=20
RRECOMMENDS, RDEPENDS.

The latter may be incorrect though as DEPENDS:qemux86:append would=20
override anything in "vanilla"/"default" DEPENDS by using=20
DEPENDS:qemux86 instead (which may not exist but will be created by=20
DEPENDS:qemux86:append eventually) and then append nasm-native to it.

I assume it's likely we need

DEPENDS:qemux86 =3D "nasm-native"

if that's the only required dependency for qemux86

or

DEPENDS:append:qemux86 =3D " nasm-native"

if we want to add the nasm-native dependency only for qemux86.

IMAGE_FSTYPES:pn-core-image-minimal:append =3D " wic"

might be wrong as well as I would expect=20
IMAGE_FSTYPES:pn-core-image-minimal to never be set, so this essentially=20
just replaces whatever IMAGE_FSTYPES there exists when building=20
core-image-minimal. I believe :append:pn-core-image-minimal may be more=20
appropriate there.

Similarly, I'm assuming do_configure:linux-gnux32:prepend() in=20
meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb should either be

do_configure:linux-gnux32()

to entirely replace do_configure (as it is what it's doing today), or

do_configure:prepend:linux-gnux32()

to add this content before do_configure when building for linux-gnux32

Cheers,
Quentin

