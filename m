Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20F8D3B7FC
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 10:20:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web10.15833.1732529992012927669
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 02:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Ht3s2Q9O;
 spf=pass (domain: cherry.de, ip: 40.107.20.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUKlvHTj93hIOtSHZUwTErbHQJb427YExS9vwHCEU0ba7YT/6iaoYVVXbAH51d/6dZ1tdR1/7/vXygcIj64MYnMJiAYgcIHhEHLdA1LxMndorINB3Kl1WohoD7N7I9lNOsLNNNIShPymJmokjqIRzHAovrOX67c5zYTThXdylu+SIzJ4hD7g8b0n1k/F7Cx37NC6dHZZ54gVl0Z0cG+vp2KumxyObjhY68dpbVavEFNdbinYhEUbO1oGr48UO6IozkVGho7Q6TO1vehUr3iS28LgBJHay5seJJPSkBJ8JuVeJ28JKcYb5fVpMZ4buMZUwHi0mxa2Whd4U30AzStwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZd0/AafwmFKJe2oejy342V5aUJJFwSMWW1g1HnN21A=;
 b=OiT3KwQDUgcGndwj8aWVCW1hIrF8aUbwi1Vj5dN9sxaPZkwiUX7CgfsrtZMBDq6n+XkbrIEoXDXPR8iBdgvKlNmo6B/FvzJo2D3RIaEtQgAJ0Bt7eVQENfATrG8JSPyxl6A8BzL0DCZeW6BG55L7oMfOQ/HgxTmOsbMEE+IkuYwNOa7SELyyIMuicr1p89Y5oOh1B4uRfgqhNkQ9yoaplk9k4LcGY9JiWA9gFKTNdTLp0i+X3M3ofwzyP9E5UyrMeqm1ffAR4b473wSvMpb4EqJQkb7gwxGDwPMrCdw4JMuhb3/JHsJn+YEhtZx3VwQbOlWMtn6Ft7eiHMkePo/Rrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZd0/AafwmFKJe2oejy342V5aUJJFwSMWW1g1HnN21A=;
 b=Ht3s2Q9O4Th4M7xMbPQwyFQDgN0tI7V6U+eRSeh2pVJO7BEiwkivLwIvM9yMwoRN/b4ZYy17Z/9NSKBmjBTCCnNfLWeTpqcwjdH2yXm7X9OgGosd5OXvBSNl8x5U3t8VZGTC9/GrYL7J40XvrsshdmczC9Phk5zwKGwd2OljSl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7946.eurprd04.prod.outlook.com (2603:10a6:10:1ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 10:19:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 10:19:46 +0000
Message-ID: <853f05e1-68a7-410c-97dc-1380e64c7721@cherry.de>
Date: Mon, 25 Nov 2024 11:19:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual: use standardized method accross
 both ubuntu and debian for locale install
To: =?UTF-8?Q?Gu=C3=A9na=C3=ABl_MULLER?= <guenael.muller@smile.fr>,
 Antonin Godard <antonin.godard@bootlin.com>
CC: docs@lists.yoctoproject.org, Yoann Congal <yoann.congal@smile.fr>
References: <20241118104524.25392-1-guenael.muller@smile.fr>
 <D5P93P1O12UG.NQJAUDP1T6Z8@bootlin.com>
 <299a188d-c7a9-4604-a491-9efb3888e7ba@cherry.de>
 <D5R5N6X7BUEX.2BBRC9BZR37GE@bootlin.com>
 <CAEbF956c=1Bk_GnSc7hxg6btAjXUVxHDbyL=pZykaRQsANV1kA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAEbF956c=1Bk_GnSc7hxg6btAjXUVxHDbyL=pZykaRQsANV1kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR5P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d72134e-59bf-42f0-b3dd-08dd0d3aafb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hEG9k5KYPh/wGf+KTUVTmeMG/N5wWs5Oe6KrbZOPWFZ0Y4glFOQ8dWk3svlU?=
 =?us-ascii?Q?goXbgOheYZnMK1gTYrnezwG7yBCuHS7KK+smI2eI1R627HYvmhTtHILoMCJD?=
 =?us-ascii?Q?9uQHD/cS8tnfnFbz03773Guo8IEjCdjuwVEZKkdmfIs+SSwDleHCGKS+flpN?=
 =?us-ascii?Q?IwTHWhawKXcLodiM2YIxDbdhkFUEiPDO+EA46qxoBU+XeSTW1LVLERretBGC?=
 =?us-ascii?Q?kYnpGf/04LIakxwCHJXn0Cs2ept+av7WV9gLovGBTcoDpJBjE+GpSV81ESeq?=
 =?us-ascii?Q?tCeec664JjR9CRf5gyzejjd2ThxHYWnU2lDpaE3yD6mDR+4kiwERfE45sowJ?=
 =?us-ascii?Q?zi6KiIGsnuaNOMq7AUNvUEVps7+QB645hCTFQOjcGdGy6es2OV9kQM4fYU1h?=
 =?us-ascii?Q?AXHhl80Z0EPenwQfzZ3Pfm48KjJ2dwalYZM9qL87wtbUH8c1mT6dARYoyuVV?=
 =?us-ascii?Q?EDgS02mHTdMjen8zYCIXwuWwgkJBg2SfxTIBHYOVtyDz9k+MgFDsk0Xa7FlA?=
 =?us-ascii?Q?M0wkQ25XYoJiCnGNbgNcFsuInakutEbL/eycTiON0XkNf5yMyS9huc/Sk4bi?=
 =?us-ascii?Q?EsGfattqn/iVcfztt1MnawjBdzEBll7qp/FqAm3q8aA2YN9iQKh8zKTKfIrC?=
 =?us-ascii?Q?LCyDhGVW9vZL48GQDz9Yb6Cu4qvWz1Q0Ei+lwVjrv2ebqCFk5S0JjHIkqzAT?=
 =?us-ascii?Q?NPGh9WFanU3cTWvWzWzGIHVGIri+Qs8YlQUG08PJUoq//Xt6CQp41JFd9Mlp?=
 =?us-ascii?Q?7i8VA+nJIiBByxvhGHgOpgod9fbuVRrzibTcYb3l7iNnVss94/m4aXfqH64u?=
 =?us-ascii?Q?tPD1xqlU/9ApnXQeaeXqxlB/k9TYelymypJWc+0BaUMMLu/F+Q365javbWWS?=
 =?us-ascii?Q?Vk474J8CAHrAZiA04vZ1SXAtXSL5nYslX4YihM1gyGjPYWRBu9o0FHKv1QXF?=
 =?us-ascii?Q?kkM5s4vhLlKLRwaiCe2JD1h5hl1kuw5SHvtPLxE0tn2oqpfThaieN4+4C9GX?=
 =?us-ascii?Q?/N8w2CwHuAit1P7QQIDNfKg2kFBm6V7dn6ZuO6eFLgR81JVkwJ8gfa+dJEF2?=
 =?us-ascii?Q?w8ffdoEmNWLvOtLd9CHEaW1fK2huvEiu0sKoxT/dz1ZWQiJI9rXX9tTW1IVr?=
 =?us-ascii?Q?UenZB8dCHQaRz9bajDUxdd18bIBq1ZxcA1F0ndjQ+bprpAkZcbL8bNEX3+Gn?=
 =?us-ascii?Q?rsZC10zH9zPXKkN1qE5GFsGFMMiTiKj5CACIRScmYBMM1fVsOsxcC/Wn58Ax?=
 =?us-ascii?Q?R/uz5ASEwhsznUdii6iZRpqEoNFbKqOOd67CNl71Qh2U9QHc25TA+AFs4TKH?=
 =?us-ascii?Q?1PPeLRIzrAVVtr9Q21iOXefZcAOO9GmYCnf455NRwmPpTw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y7/OtBu/spgwfhJ1Efcbehe2Eq88dUANa3N2Qm+TQfkwyNM57JlM8Qee16CT?=
 =?us-ascii?Q?4S6pTEFuhmr7odgAOJ/wppVVPMz0KWT+4PRt5g81oqphs9xTzS3FCxZUvNPi?=
 =?us-ascii?Q?k7iTrRmmjV1kQ4D/VYK2LpXvoXdEWTZf0BOp8v5HwTrIVePEJC+NVwhOqXHc?=
 =?us-ascii?Q?uYZ7bEjD3GHT2J2RW3iQAGIs1xjRdVA90LREHMC3wOLoLLdbd0BSQ7tldoaE?=
 =?us-ascii?Q?H/p2B/iek4Q2L7uMKT0C8pE85F6YYBXMdgz0lG/HL32JjdmyXO0jpLJiahUl?=
 =?us-ascii?Q?q8/uaaAC7Uj6qEsmxHabLiD2Gg1mrkwk2J1ELRoB0OC2+nkpOsyS7oCqDkVr?=
 =?us-ascii?Q?4LsI0QVeBD2U/97QCM58DjDGPLyBReoEv5Zw9FYmSg/dhPzD+x0KcjPTIYMc?=
 =?us-ascii?Q?4Lj1IPO0gqW1mSL0JXaQnCTcYtFygap9fWyFvr7TqJGum4iTBW6KSyYqUknx?=
 =?us-ascii?Q?cNTe/lzzDZRtxxkApX3PPYeJQ9+ZXsLw8YG4vMjmmXrnT3EAGkDClS0m7gOS?=
 =?us-ascii?Q?AI5Vl0EpeQqi+p0139tOWRUY2DWJLgaL9Iw20bVBlMAGLto4WHoD4DOtzqib?=
 =?us-ascii?Q?P9K8VClM7Qj7BTJffjvyVTbRt8Pt55mAl3O7gNKFUWVz3wVrZ2Ml3o6h6k1T?=
 =?us-ascii?Q?SlKdH/3HEU4X2h2chSYYndhOJcgYMP9qNAxwXjdl+x5DoFRFVg8lKDyI0HZR?=
 =?us-ascii?Q?9KAQrpJ1Y8SBV88ZcoDAyPJ+x2Bs7EJ0wSJibPXpfQ9qlIGKBTEhSH1Ud/N1?=
 =?us-ascii?Q?kVubBioLR1/yPDnX5JmdUlMnxq76C8ScrJRYzzkkZyftIs0F/I/qFXvg1ZPe?=
 =?us-ascii?Q?f6ZGjWdcCiJMqmjgHVCV/K96eHrmpZ6nof+Y6mLQbETlVp7FIH+h/KhgNCdq?=
 =?us-ascii?Q?Cxmj08Ed7hRUVMhlVxf9spM4zcvejGS6jHR28I4QXvar1mpc4PZDjfRDEvi5?=
 =?us-ascii?Q?/wBi8QSKb6lnzSClqM+WQtBrX7gH6W4akxU1/AKZGYVM6RaZXrPxY7H4W4kR?=
 =?us-ascii?Q?ciKA4wy/w5obFZI8yHgD3Sj/xaz4W6OK5cgqzcjB4lxcbFqIzYfV+CnfUpYP?=
 =?us-ascii?Q?rrR7HpwbzmG4uUyAUx9B3LAq6y4mjrZMo88vXij23qoH/eZ4eAtob7Vdg2Dj?=
 =?us-ascii?Q?AghWz+SA+kNOvlPIEVqc9Uukd1Q6blD7yUfzzQ9eV3zhw6NxgaE0nFyz+Rsr?=
 =?us-ascii?Q?nxXE6xOceq4srM8LuVU7K6H4JYMnepZyx8AjBSiG3PVzDV69hbA9R3tERgAp?=
 =?us-ascii?Q?WMjrbsOUirL/aTD8XRDRDrAV/GrpDXBMsOJ17Koj6N5k9TVI9wKrwHLE51Jq?=
 =?us-ascii?Q?VYHTG6dpEcqFpvbbWTWIcVnRv0XKhBH9Gx1LLVHE83SbkVAo+9vA0DaCCjF3?=
 =?us-ascii?Q?alBDd5sMuK9FWA1xbXMGhk9XnQBqM2jbPKsR+ynVqJfggDb0O+iHcIhbFjjM?=
 =?us-ascii?Q?GHIGjQFHFm730e7gGlkiwjycItvb2G0bnffJO93VYlUaagerLmyVlea/0Jfv?=
 =?us-ascii?Q?wmX+SuDSoTLdQkH/01pi38WqO29zkkZpm37awGiDRI8a5vJ29sr/XWJXLRNL?=
 =?us-ascii?Q?SrcDj6Ta/QvP/OG7oAOXsld04iGhWFdLMW7Pxqvw7q3bStQtv9VskOZCui3z?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d72134e-59bf-42f0-b3dd-08dd0d3aafb8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 10:19:46.6336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhCxkrb3o+Nh1N8fOGEsFyTH1gGfOtsAEIjrJOozSwOY/4dB6FuHYKrUzqv/Y8S7JMmB+XVbuFMUiDKt1ve6bxrEFEbcw7hLe37jqhtIoGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7946
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 10:20:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5798

Hi Gu=C3=A9na=C3=ABl,

On 11/22/24 10:25 AM, Gu=C3=A9na=C3=ABl MULLER wrote:
> Hi Quentin, Antonin,
>=20
> On Tue, Nov 19, 2024 at 10:28=E2=80=AFAM Quentin Schulz <quentin.schulz@c=
herry.de>
> wrote:
>=20
>> Hi Anotnin, Gu=C3=A9na=C3=ABl,
>>
>> On 11/18/24 12:00 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Hi Gu=C3=A9na=C3=ABl,
>>>
>>> On Mon Nov 18, 2024 at 11:45 AM CET, Gu=C3=A9na=C3=ABl Muller wrote:
>>>> Modify locale installation method to be standard accross all
>> debian-based distributions.
>>>> Pre-existing method is available only on Ubuntu, locale-gen tool has n=
o
>> parameter in Debian.
>>>>
>>>> Signed-off-by: Gu=C3=A9na=C3=ABl Muller <guenael.muller@smile.fr>
>>>> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
>>>> Tested-by: Antonin Godard <antonin.godard@bootlin.com>
>>>> ---
>>>>    documentation/poky.yaml.in                       | 3 +--
>>>>    documentation/ref-manual/system-requirements.rst | 8 ++++++++
>>>>    2 files changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>>>> index c770318f2..66f758fe8 100644
>>>> --- a/documentation/poky.yaml.in
>>>> +++ b/documentation/poky.yaml.in
>>>> @@ -13,8 +13,7 @@ YOCTO_RELEASE_DL_URL :
>> "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
>>>>    UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip
>> texinfo gcc \
>>>>         build-essential chrpath socat cpio python3 python3-pip
>> python3-pexpect \
>>>>         xz-utils debianutils iputils-ping python3-git python3-jinja2 \
>>>> -     python3-subunit zstd liblz4-tool file locales libacl1
>>>> -     \n\   $ sudo locale-gen en_US.UTF-8"
>>>> +     python3-subunit zstd liblz4-tool file locales libacl1"
>>>>    FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip
>> python3 unzip perl patch \
>>>>         diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo
>> chrpath \
>>>>         ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue
>> perl-bignum socat \
>>>> diff --git a/documentation/ref-manual/system-requirements.rst
>> b/documentation/ref-manual/system-requirements.rst
>>>> index 0fc92550a..b33518c7f 100644
>>>> --- a/documentation/ref-manual/system-requirements.rst
>>>> +++ b/documentation/ref-manual/system-requirements.rst
>>>> @@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Linux
>> distribution::
>>>>
>>>>       $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
>>>>
>>>> +You also need to ensure you have the locale ``en_US.UTF-8`` enabled::
>>>> +
>>
>> I believe "the ``en_US.UTF-8`` locale" is more proper here.
>>
>=20
> You're Right.
>=20
>=20
>>
>> On a side note, what's the actual cost of reconfiguring the locales
>> regardless of the presence of en_US.UTF-8?
>>
>=20
> It may take some time depending on how many locales are enabled. The
> command is build to generate all enabled locales, it should be technicall=
y
> possible to generate only one (it's a bash script) but as far I know ther=
e
> is no such thing in the Debian package from Debian 12.
>=20
>=20
>> My point being we could probably have this command in poky.yaml.in like
>> it used to be?
>>
>=20
>>>> +   $ locale --all-locales | grep en_US.utf8
>>>> +
>>>> +If this is not the case, you can reconfigure the ``locales`` package
>> to add it::
>>>> +
>>>> +   $ sudo dpkg-reconfigure locales
>>>> +
>>
>> How does this actually generate en_US.utf8 locale if we don't explicitly
>> add it somewhere? Are you sure it's not because your system has LANG or
>> LC_ALL set to that locale and then calling reconfigure it regenerate it?
>>
>> This runs an interactive program where you have to select explicitly tha=
t
> you want to add this locale, there is no magic.
> The other solution to do similar thing is modifying `/etc/locale.gen` whi=
ch
> seems not more straightforward for me.
> I tried it on both podman (container) and classic environnement and it
> works correctly.
>=20

I assume this works correctly if one uses an interactive container. E.g.=20
I'm expecting this won't work with these instructions in a=20
Containerfile/Dockerfile for example.

podman run --userns=3Dkeep-id --user root debian:bookworm sh -c 'apt-get=20
update && apt-get install -y locales; locale --all-locales | grep=20
en_US.utf8; dpkg-reconfigure locales; locale --all-locales | grep=20
en_US.utf8;'

it'll fail when running dpkg-reconfigure. If you add --frontend=20
noninteractive, then it just does nothing.

I'm not sure if we really need noninteractive instructions, but I would=20
at least mention that we know it doesn't work for noninteractive=20
terminals in a note below the instructions? I understand we may not want=20
to instruct users to modify their locales with a simple sed command=20
which is apparently the appropriate way?

Cheers,
Quentin

