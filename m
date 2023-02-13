Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA660C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 15:00:18 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.55])
 by mx.groups.io with SMTP id smtpd.web11.16470.1676300407166350689
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 07:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=D7keUDZX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.55, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIQros/uwp6yudRGX/uDuB9t2TXeMEpk4n3TxB0gx/NL58zpx7yj8gZV5KKPkgw6nTRxDzkYJErquciLMP1Dg0dEUyOsaO1XVTCeNasxnbyi9RszSqtd7NrmmReKd/EHL3iZe67IkgkWSO++GXLSGHIbD1frTQbLwqP00iy/kTMCnQcSFO0AJLjBvyW/LKIq7aS+eHmLNiJzXixQ59pdspSHu+E81hjLy4sen3Pio6qtXan4WLgx1IafF4wXqxyOEqbnQUdf7ke35qCmXDuU5GtQU0d1fFi2UYI+Ha46NInu8L0TBoLXZDKijggvhNkWyCQnCMGBTjxR5mC2BBg6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/NAFIcNXq9zul8z4Mp3bej+qZOAnp5+rILWhFAzxHU=;
 b=g6iYpy8cXV6EFL8CNyrRcesNzh3JUs/dOJWi+Qgdct0yUAacAVBapJr4eRkcA002qxHins8ewg/Wmx16cVAWiNWtldYn752n9oQpUzExE3awj3p9uSjvYKbr2su9OTwJbWeGCDBTXVDagg99tDAs7k1IGlOZ1A06rAoX0bpwMuMSB23xuZawps2S8iUMYBJmJaMS+N3v9YrI+srZL7mED1uMud0L8UOTGDnsgJ6qHjvn+lb48YKHoyJ4n4bk/isAHFCYMn29mWvCJ3penVVz2p1BwV4yl77iZapZFh7nYo0GEOAzZAl6q/THwsGz5sekzmq6GzifeY1ok5voZjACZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/NAFIcNXq9zul8z4Mp3bej+qZOAnp5+rILWhFAzxHU=;
 b=D7keUDZX/a+koMBXPrdOVywj0RvIrR4Svm+IbpXaUZfex3dN/v/YMhd8PopM1JawKJnyZFo6Yup67nsjhaRgM+VyvavrqimgQvClyf84/DUFZ5a0vt+shpn0vGqsZYu2Y+L1H6DTnnZtpYp/dJdJ5e9AaWRRxVZPQqaqjIW20kUlk7UukWi4iw/ZwxBff8/VK18QeJk990bufJQYrZzI5fEqMMJsjfbzQts16EKjk8g0F+aFr+6f6xjohEp9/6XutY5jy6NetN1B0ibBMow2VLyvEaKza4JQ0NRC3z5eBP21GRqf3LkGqz13iXZ7S8s4yF2UqG6Wgf/x75EzirpRuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS4PR04MB9337.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Mon, 13 Feb
 2023 15:00:02 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%7]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 15:00:02 +0000
Message-ID: <82ab49fe-25ec-6a8a-39b3-6c853a88232b@theobroma-systems.com>
Date: Mon, 13 Feb 2023 15:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] kernel-dev,ref-manual: fix old override syntax
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 Yocto Project Documentation <docs@lists.yoctoproject.org>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20230213143557.766119-1-u.oelmann@pengutronix.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230213143557.766119-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR04CA0086.eurprd04.prod.outlook.com
 (2603:10a6:803:64::21) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS4PR04MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ca6046-3dd3-462a-71bc-08db0dd2fb83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nAcQQ3oOCm671T2JyOZJsIzvutNgehkHhU2YyByralxifdjN5qzAZecwXVWhWC5m0GA4zMuL5CIq+ItCHlrqRe2Xq2NQPOVC4iEv8E/EVS1F4l9LKOhWKjiQNWfhuYVqoNxg1/9FBNqy6d3MQXo07kQusLkDcJWsOqICYOBw1RgZ/NtPlLfUS3VYsYLFGAS9pV4h2EP30ENHtHRggzqN6S7PLzrm+mZm6tCmnssvPO+pHqt2uaunFWEwNN9Ads6FA2RR6DIPDVTCAKfrj2tSzwQqSmIVji5lN4igXgbC1Zh+7DiC1j1K7z/RrNhIKrjaHcX4t6e9S41dVvG01aMIGUe4QS4P9hbbJCSVHxzR8EhMha5DCZ/rL+6SUIJ0nezu2wuYyIg5G/vrr+7WoGkkJ2GypV9G73ss4wq52CquSe0O98e26etWeAjSrJ715OtEZh0nYD8R6J8VA8Sl4lj/me3zpmk/vHtcxH6qXYmXKOMRJAZJCQHAFRpoBVXP75hSBPFEAS4RCQs3md4urIvJqIronk5I7DY2sjw7JP1Zs1Yqno7Xv/pV/ZTmOiZfGTT01L/Y4GGTHMaw4Rr+JEhuPkuhNAF4UcrIg5SDVbNy92ACmg7i8T9dUCsjgMvqZzH5PoorFY3nK10YNhtPpLNgXu02roGp+KnydO9NCfAxvrzfpmGx/R6yS9k0fmW8sa7XwPKoTKojlip+DyfYOyWfsXGk6Lh/gK5AWh0AActXJ4k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(376002)(396003)(136003)(39850400004)(451199018)(38100700002)(41300700001)(86362001)(31696002)(6486002)(66946007)(478600001)(8676002)(36756003)(110136005)(66556008)(66476007)(2616005)(6666004)(44832011)(4326008)(53546011)(6512007)(8936002)(186003)(316002)(2906002)(31686004)(83380400001)(5660300002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i3H8KeHyArLM3+hasJ+UB0DHnLPYLII1cM6Tnuncz09LUVzfePQ/EqYKHuvD?=
 =?us-ascii?Q?KApUeu7QSy6ZMtu6NJo9oriVwcFAyeDYm5GFuEVh9IzDRqtPJYtP9rTr0FZH?=
 =?us-ascii?Q?uhX7tZy4el1XSyZatVIaTWvco1rBsmZqxWv0hHnFmNaJPQtWd07HQzPBiKDH?=
 =?us-ascii?Q?jOkYbvjLelmYqqg+zsGeO2BsQMdl14Z+G0fiDQw2yiMP9xb/RphGLOc/f91l?=
 =?us-ascii?Q?7/rjKucGnL9sh7dF8ZU9Q5reIVQSlx7KeyWaxRVXVs0OWS2MqQGhdpox9Z4C?=
 =?us-ascii?Q?dmqF16emgZsRqG5vwQWavzGzlHV0c5AbAhgFsMZHZxOoqcl3sATLbOpuJ1+v?=
 =?us-ascii?Q?r7tClT+OiTMnuQOCJye/4o4cNHgXTxls3rsczhG3ZFEKGRVZfGnRKk4OnP/E?=
 =?us-ascii?Q?u4kLT73pm3rnvBiFmL4SvghZlx6YJNebhl9ivzb6FlZ+0hhXchvfQJgoQSIj?=
 =?us-ascii?Q?LroKLRtMebtjWe7hOUEctPoefUDTQuc71IjQ3b3cJds/MNLVS8yRHXfyHBan?=
 =?us-ascii?Q?wvBDquB81a7uw3Fob5sf53ypi9SDZtopdc/6gW2ib0BvhshG5IF90qBkArHz?=
 =?us-ascii?Q?++JZfJuXUfytWXUxcfzCfjSLSYMKWrTpg35mhM1p+6aSAzgTCJJeP5+6tXzU?=
 =?us-ascii?Q?bYp4Q6p6xk11icAPnRHvEKxe7Wbm8fm8VkGak4TCR9Pu+nC68LikWpwccT+1?=
 =?us-ascii?Q?y0qlFPEFAoVoh2WDK+4BLAgyzDMOQH885l5FXDaAoLv2GMKhcMoiDV8M5m1q?=
 =?us-ascii?Q?/v2XHDyciSIb7ONczUFNwCy6uY950cQ4+kkr0cYr64mFw2gS3R11VD6BsxOg?=
 =?us-ascii?Q?KIL0xpALTkssgbs2Rd1tlQm1OOu+t/UU4W0oXT2lz500O0dpRcXZQvKnEeWi?=
 =?us-ascii?Q?0LnTK9sv4x1oM2XVCV30wprjqtIdFFhmqfoGrU8GAT+F91Aw9Um8Hzha5EBy?=
 =?us-ascii?Q?PcdtPXEm2IavDb2Bz3MTxCBA2QGbUStd0Dk4KsFBZNdPKKUHTFvzQfIkajIz?=
 =?us-ascii?Q?8Ef9MAnJxH9kwzWg9QXIVjp/L9zbN9Nl/stPlPaMNN3gJfn86klXsF7gJrfw?=
 =?us-ascii?Q?QM+Sj+mc0eJ+y36/bWX6CQt9y0XTPoiUnB5YngzeWa0/fT4IPXQF3DoZ2DvR?=
 =?us-ascii?Q?sufh5D2RYH7RRSu21G8bDErvqykmHkjROypRyY5tXVEGxfa0NG01z7UIZERc?=
 =?us-ascii?Q?W1O1/01NohD91KOmqrrN65ytQyfr496bcH96WEKk+HABm4xu+hYwKzJMJZE3?=
 =?us-ascii?Q?gcMqJYEKf8UvE3jeGXiULt41iZ3OsA7eMnicdUV1ICzl5aEJoYptpQ4cMdt7?=
 =?us-ascii?Q?5y6LlzJ63fOow6E7oxkoPEt+ecCXTJRBL4b9NpN4UBcmy2snUVIMrnzdKtss?=
 =?us-ascii?Q?mePdG7p4EHfPmYHGe2lP5yc7rCq2eO0JpUZgDrwttqYnJvxTpurtKGv6euqd?=
 =?us-ascii?Q?/ti7IXOqTjL9x7qrilonZ0Lcw6LrlwQREylNlBA/5B1fJjT6HWjwoyzwIiPl?=
 =?us-ascii?Q?ty63RYBPtgRYsmMH6/gwqDI88o6LdINJN4coyLsKt9rP4LkyXZ057EnJ/kdh?=
 =?us-ascii?Q?jJPDP+BotvoNVBYFoRYh5H8A2PCsQXmT1mP0ZqIr7QGVcM3hLGVSoiqTRoQH?=
 =?us-ascii?Q?R7E905zQuDc4XOFwWlgngf3Rz42ngKM9YDQS2vUkBsGvU5bXjxMmxF3COlMp?=
 =?us-ascii?Q?P2fEwQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ca6046-3dd3-462a-71bc-08db0dd2fb83
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 15:00:02.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VX2E88YhZ3fz0RU22/ZAPkhJw04Dwp6+qTttv0W2oq9rtEv7BV9VI3BVeuY8Tv1SIqIclGGBotYH7jfFOo2A5jMSiOV3WF8Xq0gbLua5gNEtpIJp1iMLsc64eOUC1eI1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9337
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Feb 2023 15:00:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3673

Hi Ulrich,

Thanks for the patches.

For the whole series:
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Cheers,
Quentin

On 2/13/23 15:35, Ulrich =C3=96lmann wrote:
> Additionally use more common syntax to indicate that an actual machine na=
me is
> supposed to be filled in for a concrete use case as has been suggested by=
 Peter
> Kjellerstedt (and particularly no KMACHINE). Furthermore add missing quot=
es in
> the reference manual.
>=20
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>   documentation/kernel-dev/common.rst    | 2 +-
>   documentation/ref-manual/variables.rst | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-d=
ev/common.rst
> index dff8f504fd6f..3c8e0b74e9b5 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -649,7 +649,7 @@ append files, you can direct the OpenEmbedded build s=
ystem to use a
>   To specify an "in-tree" ``defconfig`` file, use the following statement
>   form::
>  =20
> -   KBUILD_DEFCONFIG_KMACHINE ?=3D "defconfig_file"
> +   KBUILD_DEFCONFIG:<machine> ?=3D "defconfig_file"
>  =20
>   Here is an example
>   that assigns the :term:`KBUILD_DEFCONFIG` variable based on "raspberryp=
i2"
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index a36c4c6df962..54da54f71d72 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4275,7 +4275,7 @@ system and gives an overview of their function and =
contents.
>         To use the variable, set it in the append file for your kernel re=
cipe
>         using the following form::
>  =20
> -         KBUILD_DEFCONFIG_KMACHINE ?=3D defconfig_file
> +         KBUILD_DEFCONFIG:<machine> ?=3D "defconfig_file"
>  =20
>         Here is an example from a "raspberrypi2" :term:`KMACHINE` build t=
hat uses
>         a ``defconfig`` file named "bcm2709_defconfig"::

