Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EB8C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 09:22:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web10.45533.1748856151932363950
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 02:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=mUGtq4CM;
 spf=pass (domain: cherry.de, ip: 40.107.21.88, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNs8zgVJq7MPAjx2TAnKLRoeb7uEBFR58B5pk8/OOFV8LgYzgUwXKg2BEXyNgbeHzoDDAMDbh6Iy0/zsAUCJjPE7NoA7zq7KzpZFkO7oa//hBOX7+pv/ybXMbWuUhGfW5aGg9rLz31wm6vkiWkDbw9CPkAIrZwJ1Al1z/omO39jb/2VhyX7SVhgSY4RyubI4OLQV+OFFQ2eJ4Q20RcKhjiBySQgip/yYcFaiLXf971l6QOfkArBv34Bgzhdu/OIJlVmkD2+oZtlrwrI4fFF/Uxh5oHiqFbh2FdUAnnHFW0Tph6YYmCnm90ENxlskErkUfPwZLYbFHj3Vx6DvaCe06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUXtelFxo8K40agJJlcB9gkuyFXG3Zy93Vc36gihEWY=;
 b=wp0pgzglyKyoyVBF3l/PT4BMYU+onM+vhlnmQPKXfWV00myc1GgDJ8GBYfjZMaRxqpy6d7VoMM9+OkgVPmVEio743/eLdIbyuigVySDPPE2as6gOwTJrP5THrbARbEbmL6GkEegS9L6tfquVtWQEXBJDb1agshGA9zgJy0IaSVn4f9Id0I7Tyc0wTYLmKATUmWWCioNWY9MgFrxMOl6MuKuskZhPKzJUcaniLygMLFvCpmc3fuWEl+QtlNjCd5k4GADYkHWEOslSxu90vwTP0sAI4ygJtzNm+oB1pq6m0zDKMWJi4M1TwXNN3lup6R9dq4h2Zg6jQR2Dn9jIARpCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUXtelFxo8K40agJJlcB9gkuyFXG3Zy93Vc36gihEWY=;
 b=mUGtq4CMlk52EBpdV2utLgohKzK2iGV/pjxAyY2MkZBlJhd6eciMQeKAOuLH+eDOInA/MebccIABHvmEghQFc4B5Xy/QuR8JMqf/RHUhyPN9TseY9vclNydzQ8WFOqq6SEluNzQ6Kqs1yZ4L4Af3xryVW8NjFS4dmVrRLK1m200=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DUZPR04MB9900.eurprd04.prod.outlook.com (2603:10a6:10:4da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 09:22:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 09:22:27 +0000
Message-ID: <c644bc35-ac08-4d8c-8dbb-0fac74b9cce1@cherry.de>
Date: Mon, 2 Jun 2025 11:22:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: clarify KCONFIG_MODE default behaviour
To: csanchezdll@gmail.com, docs@lists.yoctoproject.org,
 Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20250528181524.2797025-1-csanchezdll@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250528181524.2797025-1-csanchezdll@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DUZPR04MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4f0dd3-5ef2-46c1-3bda-08dda1b6fdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hiUkBhMabFgFwn3zECgYn1Xi6LK6w8gD79Ln5P2a2scoCeIH9RIjKB+ps1jh?=
 =?us-ascii?Q?VWJFPQHd/7GYPFqywd30NS+H0IDtnaY7YgevfzX9FV25dtlTloEBV42hbki2?=
 =?us-ascii?Q?KRMrUNZ6zAL2QmI9n3RsXf92+NsxAJ7Y8Ty/eJHoZj+V/vs9kH74ihsiTmJ9?=
 =?us-ascii?Q?b/7EpNcsr4OWMuUWCNy+dl2QLQNsvtfOS89ncDKRmiFN/5b/eSwQKBFM7+84?=
 =?us-ascii?Q?ECM0fZmD3CEg+wHRMg9VKOxfxYrAexc90TgLPbSr+ykOKk336/C8hLAkMZe7?=
 =?us-ascii?Q?090Q8uIrDsP2n/fPFVAmV1JiibXSB52EeOMcxmpvkuhK1GVBajKbLdYc+aw/?=
 =?us-ascii?Q?wwJYmSk82o12UArrCgkTrwyPaun2wGmwgM9hilvz/Yk9h1LXktQqJ8yylLUX?=
 =?us-ascii?Q?XEGDz8qF4hyW6pEFtMZv7JdO/BGruxfELVx3Xr25EuYzGKRkNKEqrOWtrkex?=
 =?us-ascii?Q?chxDWaERi4XBAm7ME6MF1k8gt59NznkbYBH0Ry6hKWMTtlBfJppKBXQyTcXM?=
 =?us-ascii?Q?v4820pzuWDA+By4ZnbfdmNdRBmv7XO88N+ClSQnSWGoT0b+go4AflwshGDuk?=
 =?us-ascii?Q?TTadmfTQ6sX/LS/frWQpaIwM4wrG8jLSpjoYcSS7e130HOUDhI8orB+8Ylzf?=
 =?us-ascii?Q?G0DF4RuWoA3EMPndFX0yaXooQ9kTqWnZ37WUEflktrzpSaIvK+w3o8uBfxv/?=
 =?us-ascii?Q?gPFBadUUfY/rSDUNJpO2m5ErN6yPTSeIfaqqD39mbjEzy1IghOdOXqSPSdHv?=
 =?us-ascii?Q?YXDx4siJS1ufbi1A4GptVBir4PbWWMCJ3Z5gz7HV7d1zGFpxF1JtV1pVo29G?=
 =?us-ascii?Q?3E/S1jfOaogMqw+QZw8ZvmHj0CRoUBmAr116N/rCsQSYhuSgPRVE2vFNmepR?=
 =?us-ascii?Q?8VR0iBMhRuFM5mPWguWTlp6XTzq5B9LFxkF7nPwDVBP1w3ePtkrpMb31c3xF?=
 =?us-ascii?Q?13LJPVTjl6VH1qHM0NkuRQ69IhNLno60VlcF4to4szFWeolvA5X2tXWLuOOA?=
 =?us-ascii?Q?1pLGqPZdVGnwl8hKytAEQivX2WS0Tdey3QLY9yoT+K8d87FQwatiiacOP9Lb?=
 =?us-ascii?Q?44Vf/l4dxBWS6Wn3oDJkj6Do59sE/3UtusM6L9HsEo/BB2KWy/hgRN6CQYxq?=
 =?us-ascii?Q?aXQCL4vO9zDQvH+nyWTJ+i9xshYdAz51rHjgn2TVwUCuT19D3Orcy7AF8KLj?=
 =?us-ascii?Q?gN30zi5G8NaxBOW+v06LJRVyLGVOOV4ezBX31+A9LgGsmUUBix8mWtcQj08b?=
 =?us-ascii?Q?GirivVpnDoIprv1E6XBgK+SEyrTAVzry3NK6NPw5ArAkaoVVE/Mg03w3RhWw?=
 =?us-ascii?Q?mtt8FnS4GFjQMyRm0PAZR/aOFu173yuSOnaVwKdGLhCuBtJGyhHoTMHaFMVw?=
 =?us-ascii?Q?W1ky6Zk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VNivSRChPfk1RTABZzqSz6z66jhtI+wQFqoWhEWJsoXkiClAVVmwx/GnfJRE?=
 =?us-ascii?Q?2VMX/pc/GmZLVrGXmu1FZw2jEqD9l3/oAuUAFO/wmTN8y3IqaPC7JGCSpyFN?=
 =?us-ascii?Q?C9FRVxDQqdKbIhEouuMqV1YNhL2LZ52PRNmH8Ikf6xr3FXIv2kMCO0NEju96?=
 =?us-ascii?Q?hfTZ+hWTXuKdYNMwHLkX0S8yi1B1dUsSHx9yL+Y17TvfJJb8Ymcj1Orn4PjG?=
 =?us-ascii?Q?bGY6s0iiFl/VB5WBK2Untf79ITUC+GQrEr6A/dYp/QRCLrjXdZUc4bwwWqrT?=
 =?us-ascii?Q?ZyMbQpHwug5iU6aohFy+IRGxRidxI1tolEx5A/nqufeuJzav/kxjoYSa79XT?=
 =?us-ascii?Q?gIrKHwEkyYLm4H3uvyyhypZGe774AmYQXfKAe0/pUkITWk+GdOir4j/oSqQj?=
 =?us-ascii?Q?2uQ0coS/YJCuawOqrI0hFqdA1TtnRXeU21Jgy/7BpbkfVw6E6+kgNyJXWOrb?=
 =?us-ascii?Q?alyjhTkvM9YQoqllbHD2oZExqUqzts0dI7AZ0L7kBZ6m6WLNok7IuSPurfO6?=
 =?us-ascii?Q?mdT4QCQkMp7wSH7rIwNYETvDLg3AxepJ2ETh4/DyFK1land7QM96VWd6X8Gv?=
 =?us-ascii?Q?UNIbKwc7iaJ1N/76ZHyDQvOdxM+/uDPdmw+pJDySOnebHT5Juf3tnfUpM6c+?=
 =?us-ascii?Q?Xx4ky/X099JLqH5j5+1uOmkBIfme3aBu62D/fOzd2zk5wPgZKjfdN6Ojn1sv?=
 =?us-ascii?Q?rXowJl2OizVt7lwGTQcIGN20jI+WDelrPgKvFsluRNuRO6uHEknyBdGc4dHB?=
 =?us-ascii?Q?YldZkJXo0ebrUcMhiMHKrZHTJT5PXcddKZF/ERGGzHN4Fwg9o5SFLRSv/G47?=
 =?us-ascii?Q?dwkuqy4UwUrEU1wmm5PgGgn1uSBY22Lp9l8EB0GEszhPzC+77X5bVxAl1QRj?=
 =?us-ascii?Q?yq2NgkPWwGJO3pUtBx4OKWf0v3uq9LqoXG36krQ7vdfv+2lRBt0XpmspZuo3?=
 =?us-ascii?Q?GbvYgnxV7GgTzbH2hJ/Uc5UQVVfKyX8AC4Rn5X9dCVvHssJOJYtUN2+G2PBu?=
 =?us-ascii?Q?PNAEyx+0knWKm+UO4CuA7oHNxVfg9O1+R5hUbKPfcL4TlpjkTD7wkzyeV8OB?=
 =?us-ascii?Q?G7X2dHPo41pUObY1tJg7eKmcfM49GEsoyn17vOiVog8/e+kXDzAT9sRFvr61?=
 =?us-ascii?Q?qnlhxAZJi6eBOt3FhD8tUTEfHdhudidIydzZbYqk6V+XFngcd+mcJVZ76d1O?=
 =?us-ascii?Q?w1N+Q5cU2UolwV2BXHZaNbTMX9iQ7+qHXb7Az+v/XXFZzrELaxoyJgJHQQ7j?=
 =?us-ascii?Q?+iLqK2g4Pj+BZtMHAgSK90SgBsafzIdVJOMPycBXL6wIdhkGMLXRTx55oTCT?=
 =?us-ascii?Q?TIPWAWeVEypml6ihK5bUaAqwK2tXEV7i0oH/4I0wrV4xBtIPHqCkWFi7keOC?=
 =?us-ascii?Q?v+iJqr37Yqu3nT4iTHBUUFQ+lFaxuQPxJXNY9b/kH8saRKKZdi3jjucVMN9/?=
 =?us-ascii?Q?YK3WG0kOBA2BS2+dkXGMcmtJFTAPvzbdJLi7dZDIDHii5h718OIy+jC+3eZv?=
 =?us-ascii?Q?m2pwAOkEs4OdMezkkS6yRs2YEg5RtOQbgdOxYl/JLSBQFZsunP+YgTMIcEfc?=
 =?us-ascii?Q?ll4mHd75CmkkdB7NT/vrw4bIP5m0wyMHdXxfK7rPXfoDeLKFpRXoAS1HeUhV?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4f0dd3-5ef2-46c1-3bda-08dda1b6fdd9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 09:22:27.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hij32/iHYPf1itShU05tA5hnqG/D4dg4UMPxicLfRJDZEqj/OJRVXGzsW/YsaVtRi+jl0WZbZ2p9fewkRKlXUDbBMmfgA7px2H0EpUyOo1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9900
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 09:22:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6959

Hi,

@Bruce (now in To) I see this was agreed on on the ML, can you provide=20
feedback on this patch maybe? Thanks!

This patch seems reasonable to me but would rather have a second opinion=20
from the maintainer of the recipe/class :)

Cheers,
Quentin

On 5/28/25 8:15 PM, Carlos S=C3=A1nchez de La Lama via lists.yoctoproject.o=
rg=20
wrote:
> [You don't often get email from csanchezdll=3Dgmail.com@lists.yoctoprojec=
t.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdenti=
fication ]
>=20
> KCONFIG_MODE defaults to 'allnoconfig' when not set, regardless of whethe=
r
> KBUILD_DEFCONFIG points to an in-tree or a meta-layer defconfig.
>=20
> Signed-off-by: Carlos S=C3=A1nchez de La Lama <csanchezdll@gmail.com>
>=20
> ---
>=20
> Previous discussion:
> https://lore.kernel.org/yocto/CA+KcR8ARBUj8PTcvA=3Drx-yob=3DWHYcS2gUnGX2a=
ROOjy6bZGqWw@mail.gmail.com/
>=20
>   documentation/ref-manual/variables.rst | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
>=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index c697bdbbb..da274f3fe 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5036,15 +5036,8 @@ system and gives an overview of their function and=
 contents.
>         options not explicitly specified will be disabled in the kernel
>         config.
>=20
> -      In case :term:`KCONFIG_MODE` is not set the behaviour will depend =
on where
> -      the ``defconfig`` file is coming from. An "in-tree" ``defconfig`` =
file
> -      will be handled in ``alldefconfig`` mode, a ``defconfig`` file pla=
ced
> -      in ``${WORKDIR}`` through a meta-layer will be handled in
> -      ``allnoconfig`` mode.
> -
> -      An "in-tree" ``defconfig`` file can be selected via the
> -      :term:`KBUILD_DEFCONFIG` variable. :term:`KCONFIG_MODE` does not n=
eed to
> -      be explicitly set.
> +      In case :term:`KCONFIG_MODE` is not set the ``defconfig`` file
> +      will be handled in ``allnoconfig`` mode.
>=20
>         A ``defconfig`` file compatible with ``allnoconfig`` mode can be
>         generated by copying the ``.config`` file from a working Linux ke=
rnel
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6946): https://lists.yoctoproject.org/g/docs/message/=
6946
> Mute This Topic: https://lists.yoctoproject.org/mt/113349230/6293953
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [quentin.schulz@=
cherry.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


