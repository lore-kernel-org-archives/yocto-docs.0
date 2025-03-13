Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E694C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 08:54:59 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.46])
 by mx.groups.io with SMTP id smtpd.web10.10259.1741856095113251625
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 01:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=HdrCpmti;
 spf=pass (domain: cherry.de, ip: 40.107.104.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOlB0xksdGp0OIOR2z9tAl4wejeMQ8dL0ZxZclj+L2WVenZPFl/VbGr0NVzR5daAbB9f8uXHzQYNYhzDl/2Secj6G0R78/E25I1JQ8IEp2DjhJ5aLasMgQtSBqPiv+NFXsvQMq0fHrpl+tfCuCnmh5L7euRlM4ipAchIau+INwwDzGLYa0HYdALNiiNOPYIceJKQw1q7BVKWUbd1oNWfcTcyIAvMlhaGyaqmi+OlXZTLfUYcPmzbPC9BzBwxhQfRRj5/ZQLSytJwGgNwhpMrXbyOKv0poiAG73u+pkhF45kchd7c6FfL0B9GURwgBw9CfCiW433saVF0XqZ9+aJgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39+TUmjiBFJBkPKTUczIQ1ovR8cFRso3yc68cig1ccQ=;
 b=S9HenYJk3qBf7KRzki24kGZ19MuszShkT/m3xUIJjQ+lSxtjlFZ4Qe1XnbrpGZUdaQQPzBNcr8l0k6jqGqTn8xx0K04LEDYribjxjcxaH1EHtxx6945YemN4f373I5/lRGntRvlVdisyQH2+xKMd0ExmXst91IYv38WB4ipkB05f3gcVnsC2GHOE+wTskJxGzjOjlImzwm8SqrY+o01TgFy5EogdCtxIoijImfPU/YxqR65FqCHVk+GDJK3zOFZ2rw/QHOPMqTYFpWLnanWdTW6NNb8ERluRb5zA5w7w4M8hqz+yWihLlATm4AQ1XcvYsGYaKrlSE4JBIutGiBikFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39+TUmjiBFJBkPKTUczIQ1ovR8cFRso3yc68cig1ccQ=;
 b=HdrCpmtiT/CqGegR1Yd8o85MV6vS0SWAzSQ0++BC8B5cnkQrphotl107VE/EaQ/M5j6zHoZojfidWpz+bybTA4GlxuI+Z1/uTA2IpnVqTQXzhSQ0QMOhIPDK7VqNzjD7/n5yyLa7OiQo4Py1CStFaoDV0KeQPSseflZDfZEOuqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM8PR04MB7921.eurprd04.prod.outlook.com (2603:10a6:20b:247::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Thu, 13 Mar
 2025 08:54:51 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 08:54:51 +0000
Message-ID: <18f5fccd-e69f-42a9-82cb-7b58c8c300a1@cherry.de>
Date: Thu, 13 Mar 2025 09:54:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual: variable FIT_SIGN_INDIVIDUAL
 mix-and-match attacks
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
CC: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250310090606.1981269-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250310090606.1981269-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0357.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::18) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM8PR04MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ec2c45-b794-4cc1-3d40-08dd620cb73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?thVJdbHJU1+FX+Iyeih7VXRA+O02aP9ReAPJWx1Ge1GKzr/SXc2685Y5t8HV?=
 =?us-ascii?Q?cbXhh7zYrOviA9bi7EMa2/95iMS8713nuGeeIpwtMv9CW8b3i/ej6EwHa/j9?=
 =?us-ascii?Q?jxd1QSwLeVe6kSOkuLaD/zZTEGB0Fq0GbH88ndgK+i65z5CzmYB11tQ4y/AS?=
 =?us-ascii?Q?jXrJg4ZIVHEryzi5qcj8gdNWYNOoUr9053EMizJPYlyxyHT2vFa0FvYBNluw?=
 =?us-ascii?Q?YwJq1Ravztd8n8j9jDQYRBpwOAeAPoVOegtNRRXr2A7AYyhAQjkuBypGOjM5?=
 =?us-ascii?Q?w79OzfsZcwBjeSBG/JYq8V7eL5VoFvpuiPFfTk/ZaS0Ej248mDZVvt7i0/Vl?=
 =?us-ascii?Q?P1SE7LL9JRbehxILY0QJl8Ssgbb0yAut51xqbhmkF+NO1QM9di1YKoGSvRKA?=
 =?us-ascii?Q?Q86kfdpGJDmYJYggBidFRC7IURPTaNQspF41URI9baMiB7OdNGGLwtv7v3B3?=
 =?us-ascii?Q?QlqCXm/OfNj24euyB4GZQk0XOpJ7TTwxI4wrHfCZfp7j6GsehnXQNR2JMi8n?=
 =?us-ascii?Q?x7e4x3hJPYO979xDB4uez464+0Q/IlbRP0W6ug3hgY9E1L01+gHjGs869fxj?=
 =?us-ascii?Q?NbIU2C5nRXOoua22F3TyF2cII9C6lxpYlZ1z2wdVY2fl7ci/6er7X6xwYxOo?=
 =?us-ascii?Q?zAWTZXk8WZ5O0f0DLwR1wKA/F1Fce0Dr7QHe0totm4n1//9mTucp2UBld51U?=
 =?us-ascii?Q?cekn32TDyUZdpEJeop8Yg2FlMpG6+uVf4SX2hT/TtpWBbvlcCtL3JmhomKR7?=
 =?us-ascii?Q?sKeA4m659Wuo7CLjTUa3K/uKsmccoM5xuHDodgw6ElrMdqKS6wqpZcpi5Y9k?=
 =?us-ascii?Q?0+cOMtgKoC92Bmct8fqnrM/Me9+Ix/dSaR+Va38c4wRdMm6dBowJHAXivPCz?=
 =?us-ascii?Q?jcTjdtb3WLqFZKkeLenSIQiemeS7nxObt338UZUFuermNajLCXKJxR6sKxxw?=
 =?us-ascii?Q?B020lxeZeMXXK7Ma7Ft83WkInNFoj9HB3a5PsfTXK4QnFt03pm5+dLVxo5Ud?=
 =?us-ascii?Q?9ReMjlRRZP3aIKTgTXqqNtmzqB6YMsbIDgg94ChEAdvodCO0vaFnJh3Y0CQ2?=
 =?us-ascii?Q?ao5LGLE/FRkAhDa+azHfpKVyl7WXeekmGYeNiOqmvEiEkls9zVbebVqqUYVW?=
 =?us-ascii?Q?oL+nvxwdf91qDTAVW8nRXadEgNvuMG4mTGnZyJ2l5eObB5a1ahScZZhXu1FY?=
 =?us-ascii?Q?06DI2ig0OJthR0i8MqmDq97sDWjQ0YbDuZLCwdL9oUvzSh+gc3f2iSsAQSI8?=
 =?us-ascii?Q?/f/dY01UFyw+04MjraGJK7WoXFU+NmaMDgu8JBLELRR32+h9Y5AMccmsDqoF?=
 =?us-ascii?Q?c/+dkEveLbVsZH5Jy1nTZrSG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gxhlRLDm6xNhfA3DM7zNpaJIc+FZ7hlQTcbe//j2ErjzaBkgmafyXkv2rZot?=
 =?us-ascii?Q?EJXB8UsAE4zUDG+m7ubtAPokCpVtOG10uZmHtPb6g2a/PPwgAfjcYihLTByq?=
 =?us-ascii?Q?q4KrbOEw+MeA+9Asy1HZIguwq5Lf4lvqmkJgw8+TRvIBVUeC0Yg1Bv/z7443?=
 =?us-ascii?Q?g8IZuMNA5HHm7C0qmGEF7I21NtcvtvmvwwSMSBIaKxrh4SZjEl4XDTDBJ5DE?=
 =?us-ascii?Q?CTu7LGlV47J748cfA3LckBV2qRqHSBuxB1Kk78NN83OXUpXkQDXmICpD5p1R?=
 =?us-ascii?Q?BeQRouWKsF90Hq1yvkSxU1SRfOqIi7Lmma1YQ+pIKNsFpBPtkGCBflVLqw/p?=
 =?us-ascii?Q?rjMpikzCvq75T2nlggDfGTrvu+J5DbjQKEwxbCDJ8m9wcXVgVYXUMPodkVPp?=
 =?us-ascii?Q?5i/eas9ecLnjxZcjTSjPBDtHUqkW63WA80rV/EDac3+a/wCMOYqwOW6tbNlG?=
 =?us-ascii?Q?ibCChAZ4po5RZrnrgAGzmfIKlpZEL1UfbDa6giDMgdPi5GQKRiBQSehjNNXI?=
 =?us-ascii?Q?d71T2YkueKRUQU6AjgTNOOKggNbyuu+8KuP7KOlQ4TpVQznXFHl7RuMh3v4r?=
 =?us-ascii?Q?0I2d2GfBCtgMA74RBhVb5XU6QVuS5EXSoeMWEpI+akcGJIREDNyDdTwH9Imi?=
 =?us-ascii?Q?m6ZdQe3oPYuDXGXHL6TJLOk35qPArfpu/nZXRt+Ukc2aXo5rtnahnkMS3Vsj?=
 =?us-ascii?Q?avMAmpBcPfw/Gygc6jalDdISkCWDFIDdTmNn+0zXlX5lIx6i8IYjyUUgcr9M?=
 =?us-ascii?Q?gYyMbp21B70S4GGsMJ75YBBQtAg8ZtjpR6Oaduc4J9Q/1k6j5cchv89HeYnu?=
 =?us-ascii?Q?Kuc2X5GdHgQu2dkL/+bPipJxctk208rxN3GAr2zFSnnTVf6h4m4jLCbfIwyy?=
 =?us-ascii?Q?K1eaWc8/m0yWUEMZAjQkRmtH++903jgbt7ZuNhAXZJr+vV145D8dKPzS0n+W?=
 =?us-ascii?Q?zzKY8vxzEgapJARJlrtOLFZbl2IQHxAQvTCKhm1acRoOtvczuAnYInt+MdQH?=
 =?us-ascii?Q?nantC4s304cQ6BJXmTD4g8ofNF1IY4Sw3Zf6eYFaD10KZPQMY5bsnv7sDxsp?=
 =?us-ascii?Q?78T4oaY9zP7tGINPXDhld83x+IM/jEEEsvlQRlZssYFlnbauh9wNzrS5Wj0V?=
 =?us-ascii?Q?pVDuTrvdw4MOC15QTJ58ZNBjRCoA+PWGLXy8oY16YQNjnzeIB523Uvu/Eev1?=
 =?us-ascii?Q?ZVWKNO2wQvwXEIC+LTkZ3Utpe+GV4rpq168mzXIHUyxB8tfAcUUPqz1/7mPu?=
 =?us-ascii?Q?3Mh6Yk+RnV3CynK6xYw3JD4gAyMcmStxTTRySjvClHhx9+rbrfQR6Sf9zOZX?=
 =?us-ascii?Q?QahFwO6rLtV4tDc/q04AnTweKFqt981EUITTalR115oiWd/ehMAWwc4S4w12?=
 =?us-ascii?Q?0JAEFw2XfP8QKkouaqJ0PlUFG6iP52Y9fIIRNZNILuKNMc5A+hBz96cJSwAt?=
 =?us-ascii?Q?HjxkbflP6PKszBqb5PMYG2F3E7vRbhH1oQUIqiKygqig6NmGvfZ26hkGH3fx?=
 =?us-ascii?Q?dN/cRhGQSBgOnrEV7OCWyWc5c0W7JbLLqz6DfChalzcddcl6r26UnQOjgpNP?=
 =?us-ascii?Q?oiaC1fPCaFQjHhogIp1u8pNhvqEOqs1domDVJxqjlWy+SffeQzwijXS5PBVT?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ec2c45-b794-4cc1-3d40-08dd620cb73d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 08:54:51.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v40uppfdpVazT70vQfDB7qinIkSzkg4hs1+Hl8WlnLUdY+8qd4jWl8bVnvD07hYfoaJ7IHeml0TkAeEznsxk5yr0cf2bojN8n5+i2dU5TQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7921
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Mar 2025 08:54:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6550

Hi Adrian,

On 3/10/25 10:05 AM, Adrian Freihofer via lists.yoctoproject.org wrote:
> Incorporate the lessons learned from a regression introduced with commit
>    OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e
>                 u-boot: kernel-fitimage: Fix dependency loop if
>                 UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
> and fixed with commit
>    OE-Core rev: 0106e5efab99c8016836a2ab71e2327ce58a9a9d
>                 u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL=3D"1=
"
>                 behavior
> into the documentation.
>=20
> The use of the variable FIT_SIGN_INDIVIDUAL is explicitly discouraged.
> It is also noted that this variable may be removed. It is important that
> we try to simplify the implementation of the FIT image as much as
> possible. Adding appropriate notes to the documentation is a first step
> towards this direction.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/ref-manual/variables.rst | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 861b04eaab1..08cf15664b3 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3174,9 +3174,24 @@ system and gives an overview of their function and=
 contents.
>         class will sign the kernel, dtb and ramdisk images individually i=
n addition
>         to signing the FIT image itself. This could be useful if you are
>         intending to verify signatures in another context than booting vi=
a
> -      U-Boot.
> +      U-Boot. This variable is set to "0" by default.
>  =20
> -      This variable is set to "0" by default.
> +      If :term:`UBOOT_SIGN_ENABLE` is set to =E2=80=9C1=E2=80=9D and :te=
rm:`FIT_SIGN_INDIVIDUAL`
> +      is left at its default value of =E2=80=9C0=E2=80=9D, only the conf=
igurations are signed.

s/configurations/configuration nodes/

> +      However, the configuration signatures include the hashes of the re=
ferenced

s/configuration/configuration nodes/

> +      image nodes. This means that the entire FIT image is appropriately=
 signed.

Not if you have image nodes not listed in any configuration node.

> +      Further information can be found in the U-Boot documentation:
> +      `U-Boot fit signature <https://docs.u-boot.org/en/latest/usage/fit=
/signature.html>`__
> +      and more specifically at:
> +      `U-Boot signed configurations <https://docs.u-boot.org/en/latest/u=
sage/fit/signature.html#signed-configurations>`__.
> +
> +      If :term:`UBOOT_SIGN_ENABLE` is set to =E2=80=9C1=E2=80=9D and :te=
rm:`FIT_SIGN_INDIVIDUAL`
> +      is set to =E2=80=9C1=E2=80=9D, then the FIT image is signed twice,=
 which is redundant.

By "signed twice" I assume you mean "image nodes are signed, and=20
configuration nodes are signed" not necessarily that this is done in two=20
steps?

> +      As this leads to additional complexity without providing any obvio=
us
> +      advantage, this feature will likely be removed in a future version=
.
> +

I'm not sure this is true? You could very well have a U-Boot script that=20
loads a specific image outside of any configuration node?

> +      Signing only the image nodes is intentionally not implemented by O=
E-core,
> +      as it is vulnerable to mix-and-match attacks.
>  =20

Can you use " instead of =E2=80=9C everywhere in the patch?

Cheers,
Quentin

