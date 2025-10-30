Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D71CCF9FC
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 14:07:27 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.26])
 by mx.groups.io with SMTP id smtpd.web10.25685.1761833245973610473
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 07:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=bGUIDQYo;
 spf=pass (domain: siemens.com, ip: 52.101.84.26, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKQHs3f695QXy7nJ3gW2Hjky21ZEPOmtPmuzualRpufzxiscWLc92ZnWi4nNcewrXBIpLZEudZmRT0+SAiqTPlaCeAR9QM/hdZaboTdIh9OAkARQV2Vekt2jDjlJBri2SI1v5Px3gXc+HIPXlzRJnBRovJgLOirI28YLmeP0JdIW0PMltaUhU3tq5jaGpt/yaeJ/x11ZQLlNCSAXtRJMph3TwLOsbkiNygtZmPvlHWk9x1T+uzt8hhKdaRfibp+kzOpj7qDaxysP8vlxcoTPmp1XT7fAy8Q9H79CaJIkHx+YLvdz0viaq6L6j0Bq6Aj+sfgEScN4P5GDfyfgut7pZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gabJgqDSnbNmg+96ayOEbEDGFEIWa2Fp3QIIPS/r16k=;
 b=P45gx8fKto/Nkw6Q/Tb7Y3dtocQ251w3+4OMrXK5JCym7S6C1mVRP/GKGmCYI6kKDe5ExHS/cd7q7Odse9G372d5KvArBkDw81RY1LuKK2bLz+vJoiT9CRvCY7VL/EQQgstJ9bu859B7KK1ZaEwl5FR1nD//ND5K+6G2aDamXiVyArAjXtlZup2QS7ZPjqbsVJTBwFOZrAKSpvPgFxzGsVVNACocgZoQaKhYRpRV9eSetTBZmoHOYSFRhWq1wTb2iqeRBjFU/u2SfJZKJokMRaes94ch93ly5d4FPEFfA6vzpk/RL6prIsWYokiVXOt0FuJvXbJyewgCmbNHbRudqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gabJgqDSnbNmg+96ayOEbEDGFEIWa2Fp3QIIPS/r16k=;
 b=bGUIDQYopYgx4iqrSvuqdVdl61Fq97+Pm6S804POUsDxGgWtzzXJIpVmdjSlp8eyt24s+uuxolR+gTkN+UYv/aqVcorV44FJI4JG7hVFLtiotIC7aBgRpV//B2LLoZN/4CTqyJFHYNhdvoI10ZkHWG6STSfUNWjh3F+sym0XZS73kdnVxX5v8og/KMpefJQN8RrKfE3opJ3dKybxusoMrlYcLDKN5X8mmlab+l+97Bq3Aqh3ERu3XFTO+IcGyfdeKNOJ/V3ATZ2/+Ac75V0Xs64yuEKaX5XQKrVAzoZ7tUUQ43uC5Q14btl6gp6V51iO0aT6A/Acgo+ZKK4byrvmhw==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by AM0PR10MB3122.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 14:07:21 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 14:07:21 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: cover new FIT_KERNEL
 variables
Thread-Topic: [docs] [PATCH v2] ref-manual/variables.rst: cover new FIT_KERNEL
 variables
Thread-Index: AQHcSRtEgXqd8xIQTkm0j7DIWUesZrTas10AgAAG0U8=
Date: Thu, 30 Oct 2025 14:07:21 +0000
Message-ID: 
 <DB8PR10MB352901603ABCD87DBB7463808EFBA@DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM>
References: <20251029213029.2480507-1-adrian.freihofer@siemens.com>
 <DDVP6ZXVWUM1.2ROQPCUL4S66V@bootlin.com>
In-Reply-To: <DDVP6ZXVWUM1.2ROQPCUL4S66V@bootlin.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-30T14:07:20.601Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|AM0PR10MB3122:EE_
x-ms-office365-filtering-correlation-id: 1ad680df-1b04-4779-fb05-08de17bda4b9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|31052699007|39142699007|376014|366016|1800799024|38070700021|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?r4SrsZSN8WzYIktvPPEAGvUVuKSefoNS8Da/CQ1PxM3mRDqP2URqFUDN3J?=
 =?iso-8859-1?Q?uixq0c4+QlMZ5F+b+SzW6KbdGJse/4vlb63Svrx1+KDgo3OWRYojzDtos3?=
 =?iso-8859-1?Q?Y1hU2+XEGaOg431VxplsjB8rPzDSAtik0/2GybHRMyhmz6nbxl29xZyGbA?=
 =?iso-8859-1?Q?8Kaok9yqJQsF7xdDFcBz70F04NvJpAgIFFj7luEoUH2p2dNrlZkkeiCqeh?=
 =?iso-8859-1?Q?+N3Q92/idTHL5DApmSS9lcbwzf5NW7AGR40dmkm657cp2VZJtfC9zSgQ5g?=
 =?iso-8859-1?Q?OJ5NvgnjmDeP5qQ9HhosELmFYp12uq3ftVY85ZtDLmkRDuZduJDKi3iwds?=
 =?iso-8859-1?Q?54DuowWsSymKteBoBVKPqwOVtb9L7uUhfPzbpcoin0hvBtYT9Bg9JD+VuY?=
 =?iso-8859-1?Q?mxcz92wmvMucDto2EGau1YoTifSOe0QScfc3ZrivhK6gnfoFoy5heLudA9?=
 =?iso-8859-1?Q?NFyBhjqAXXJhuDDP2iY48eDLmHVV5EANqcFnzuDEgqHv+TsuG+mT4C1T7K?=
 =?iso-8859-1?Q?JMpB6yvQPQzfNnbeaxymIzM8umwpAfzYIQNRcDiO3ZdX6FVUXRBKtKOuN9?=
 =?iso-8859-1?Q?qX2LKHp7R4XdWKBGiyUpOE9dMSpRzZW3uF5/wO145PliOueiQGhuWSle0N?=
 =?iso-8859-1?Q?5H+jx3utLvmBp72s6qZGNnMH9+k8jdJqQwU41FLQ08bfc2J7pKIyPLeF/X?=
 =?iso-8859-1?Q?Zaa4y+QtQje4HnJTtbS83d3ULr8l0FHX0L/5MhfxvbgilmYV/KD4i+cOYl?=
 =?iso-8859-1?Q?MC5ZF7vJlcG5e0WqdxkEjxakGDpTHvy0eawofQdH6IlxqTU1AOes2ekPUF?=
 =?iso-8859-1?Q?/o/HfnqzIh7Or56bAzDAUkFJp9+538MsAIVjxa6aFXe4cWmEK+G71heIqK?=
 =?iso-8859-1?Q?3wCMjDor+FTTG5DrGMx8GO7f7AxF+wtlP0lVx6NhX20rpcZ8K9BOLa+vSC?=
 =?iso-8859-1?Q?yrRUOY6XWqBJ6lvX79gM5BCy6cHm8o+MEool3mm/AJ0TmJ35V0F0HCHHxm?=
 =?iso-8859-1?Q?0WjI3K/pIgOs3pI5/rYBCuoaVrsZjAZ7MMUs+Dl6AJmB+kigWg6Lt1ZLqF?=
 =?iso-8859-1?Q?tKTW0zOlYnxlmjlLzUqvaSGa1Z1xHC7M3T8MjRLTx/uWWz1Yz/rrwpvInP?=
 =?iso-8859-1?Q?FGzQP2G35hB9hZVJ1KEYhIjvLV7bMrcdZCF1NeHW6RkscKmTZwfXCM9Diq?=
 =?iso-8859-1?Q?R2Iwt/LJADtCQqksDLjr6mUFpd77xrR0QsE5HsM0HjYUmtEtyCsYDOH2y8?=
 =?iso-8859-1?Q?2iv8ro0+Gq4gry9d8bWX/CVeKF4AosZ64R0DG6zOnZRflaOXPHSvHmoxbj?=
 =?iso-8859-1?Q?IVmAKkfG8NyI7fKIaQKd1L/StBj3mlI6c1vDEVrGyEI3BdLQLG1Qt0mCO6?=
 =?iso-8859-1?Q?HbzNnb6rKbjQm/YqRCD5S6iHyxT80CXS06alliZ44ZfXznGgAOQZnPZxLb?=
 =?iso-8859-1?Q?PM9SyuowkzG7u/JzGFI/Zcl3d/FvrPdTlDRk7MC0gbOWTbD18YjePLByqC?=
 =?iso-8859-1?Q?JwoKIElw1yWsjbUphQr3WE?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(31052699007)(39142699007)(376014)(366016)(1800799024)(38070700021)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kwv4bIJbH3/pOVYysR2zMPz2p4AoyQoIj2Wntdz6rGOkyTbgQ4wx3y4uNo?=
 =?iso-8859-1?Q?qJ8PqfIzobEfmKGrtir3HAPCjhKxqJPcwfAiLJtuppw1zaCbSe4uMag4Pi?=
 =?iso-8859-1?Q?fO9fnwpJUuyVqeDQDTb0b65pMtPP8gIssmT/cyEcvKOKHpa6cLw21UBIni?=
 =?iso-8859-1?Q?izRyuVxPyKUG5RP4MzH9t8uOgkG0tBcrbXJm7kdWCksNX0mONfo/X4Ij/c?=
 =?iso-8859-1?Q?C9T2UDdFiaC9N0CwRRfrlYCv65NgL9RJmENTL0q3DaTWBO10nAt0DyBbxp?=
 =?iso-8859-1?Q?KluAuU2LgKHlpaROibgodkDUK3RnyLMwKHD58NRddJYv6HNnzn8edXbJiG?=
 =?iso-8859-1?Q?Br4+0hrsX4rg3EoS4PMN94qebGDhc/bfjIkN6T2lp0rXrwo8XnCias0xUt?=
 =?iso-8859-1?Q?rWxi5U9mdQTIgjFxV0a1xY23631sCkyGsahpsD6JWWkrJiaDsELfELeDql?=
 =?iso-8859-1?Q?H1hrjeTkkFsQrUwudq9AaDFvIFM3aM8wJU/e8lUm4aUOtvHjJDfF+HAM4b?=
 =?iso-8859-1?Q?VyyIk77fTCAsV0e1qqLhCSSGrO/00BDeM8y0ND9YryNhlHHPmxKAQCrRXd?=
 =?iso-8859-1?Q?5A50Fr4bnRcIDAh0fqgg+YDrr72yCK4WEz5Hvgo+PqwwVnx/thgHN2pdNl?=
 =?iso-8859-1?Q?Vl6zTnwjwMpIpXhNE/nNcn3+KpFIsZHSiyDixSO0dL/LJS+UCTX/K+dOEn?=
 =?iso-8859-1?Q?LWSdLgqioFRTToL/A+hYRGpxfS9gHTAbz+C6kIwnbMaxzo0k/+xlxO7JlT?=
 =?iso-8859-1?Q?R9LkORCH0DdRqbODc/xNWuvjUpn6lynMon9SdwR+l4CU/G2Qr8iVGhc0hs?=
 =?iso-8859-1?Q?aeIzY/PsPqlUXAfEpjH5Z1IZQ3x1vxAJB6syGcpVBB5xEAdCavUboCdJbQ?=
 =?iso-8859-1?Q?EFl6sTln9FvKUspx3BfkdFmoLve5+nQYJS7egBIJ+u3bmrk2gl7zppG2d+?=
 =?iso-8859-1?Q?FQGBrwKZnqjD7hIQs1PK14gpV8a87gWEaAG5gIUyEoTLcme+ag5xvUIZ7I?=
 =?iso-8859-1?Q?hOEKXgy9xVmhYznFQWAuSuGjFKGMU63LRKBhI3UhrK8tphsH4azzt0Ml3O?=
 =?iso-8859-1?Q?CvFXz1eLmSMuHhV/KpIvqWl0Xx/L+pHTeYYd5vKunGvbti6W7b4oi2UZpz?=
 =?iso-8859-1?Q?LxBdldkTOA7kIQmKtvuIiFX0pibI8ChdU+F/aYsXJagdVl0USY0qWhaQ8p?=
 =?iso-8859-1?Q?f5txxKAM6qq1BZ3zjXOvm9B/RcBYkS6PavMrGxBpsWB1jONCrZN8UEvGvv?=
 =?iso-8859-1?Q?qB1aPp8gR1jfRZyjViH+N73JMH8zCrP20mU3nEU9sdpxYEgAarKXdaIz0U?=
 =?iso-8859-1?Q?OcUseRMx4eK8vUyH/RhDhd9EuqwsDjrUrvZEAq+tkjdgBXoMWdev63Ds2R?=
 =?iso-8859-1?Q?WSeLYNmFCQ2Sr/aRe/s245LK4iHa3uhiaYeyxNp7RzwB07bwqEEIw5+Mxy?=
 =?iso-8859-1?Q?YQIkoZvCSL3P/MqUItI3A3d1BXFPjcK78N8KOXNtfP9NX2tMO+LAsF/oAH?=
 =?iso-8859-1?Q?Ycysh4O30DHv/N6igpbwVOh4RDJQlDD2kSd3V+soyR3gR6cIJypZriprG2?=
 =?iso-8859-1?Q?7pHgv1SOlNfmFwP1cddC1rWpswsffKsKI+RSODgAOe2gQ+TVTAy4zyazoP?=
 =?iso-8859-1?Q?zFXrKdyYfrJCF5NaKGuGu8/PjkIo+3/XkXfQJb8bQN7vnJIqioMFhX8w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB8PR10MB352901603ABCD87DBB7463808EFBADB8PR10MB3529EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad680df-1b04-4779-fb05-08de17bda4b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 14:07:21.3027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tX1Lkr9Z+Nk7VlAtc0AZ04p2UeUh0rFzFJiVM91DPDtG3z33otGo0CXdNNqTRlM9lKs7Ghp1BNG6QMqU9g267FlySZH4HG8nROLApob8v+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3122
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 14:07:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7919

--_000_DB8PR10MB352901603ABCD87DBB7463808EFBADB8PR10MB3529EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Antonin Godard <antonin.godard@bootlin.com>
Sent: Thursday, October 30, 2025 14:40
To: Freihofer, Adrian (SI B PRO TI EAC CCP) <adrian.freihofer@siemens.com>;=
 docs@lists.yoctoproject.org <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: cover new FIT_KERN=
EL variables

Hi,

On Wed Oct 29, 2025 at 10:30 PM CET, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Document the new variables:
> - FIT_KERNEL_SIGN_ENABLE
> - FIT_KERNEL_SIGN_KEYNAME
> - FIT_KERNEL_SIGN_KEYDIR
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 67 ++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 591c03028ce..86117dd3a93 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3414,6 +3414,47 @@ system and gives an overview of their function and=
 contents.
>        set :term:`FIT_KERNEL_COMP_ALG` to "lzo", you may want to set this
>        variable to ".lzo".
>
> +   :term:`FIT_KERNEL_SIGN_ENABLE`
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass
> +      to enable or disable signing of the FIT image.
> +      The default value of :term:`FIT_KERNEL_SIGN_ENABLE` is the value o=
f
> +      :term:`UBOOT_SIGN_ENABLE`, which means that when U-Boot FIT image =
signing
> +      is enabled, the FIT image will also be signed at build-time and U-=
Boot
> +      will verify the FIT image signature at run-time.
> +
> +      If this variable is set to "1", the FIT image will be signed using=
 the
> +      key specified by :term:`FIT_KERNEL_SIGN_KEYNAME` from the director=
y
> +      :term:`FIT_KERNEL_SIGN_KEYDIR`.
> +
> +      If this variable is overridden, the :term:`FIT_KERNEL_SIGN_KEYDIR`=
 and
> +      :term:`FIT_KERNEL_SIGN_KEYNAME` variables should also be set appro=
priately.
> +
> +   :term:`FIT_KERNEL_SIGN_KEYDIR`
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass.
> +      The default value of :term:`FIT_KERNEL_SIGN_KEYDIR` is the value o=
f
> +      :term:`UBOOT_SIGN_KEYDIR`, which means the kernel is signed at bui=
ld-time
> +      with a private key found in :term:`UBOOT_SIGN_KEYDIR` and U-Boot g=
ets the
> +      public key from the same directory injected into its DTB for the
> +      on-target verification of the FIT image.
> +
> +      If this variable is overridden, the :term:`FIT_KERNEL_SIGN_ENABLE`=
 and
> +      :term:`FIT_KERNEL_SIGN_KEYNAME` variables should also be set appro=
priately.
> +
> +   :term:`FIT_KERNEL_SIGN_KEYNAME`
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass.
> +      The default value of :term:`FIT_KERNEL_SIGN_KEYNAME` is the value =
of
> +      :term:`UBOOT_SIGN_KEYNAME`, which means the kernel is signed at
> +      build-time with a private key named according to
> +      :term:`FIT_KERNEL_SIGN_KEYDIR` and U-Boot gets the public key with

"named according to :term:`FIT_KERNEL_SIGN_KEYDIR`"

Not sure I understand. You mean according to UBOOT_SIGN_KEYNAME? It that's =
it I
can make the change locally, let me know.

Yes, that's wrong in my patch. If you would quickly fix that,it would be ap=
preciated.

Just replacing
  FIT_KERNEL_SIGN_KEYDIR
by
  UBOOT_SIGN_KEYNAME

should be the right fix. Agree.

Thank you!
Adrian

Thanks,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C02%7Cadrian.freihofer%40siemens.com%7C48ef680eaf7d4b912=
5fb08de17b9ef19%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C63897428450893=
2241%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIl=
AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DFUoK6im=
RsI8wIQgxMS1fOp9bEeC%2FtNO3v2BAsgbQM%2B4%3D&reserved=3D0<https://bootlin.co=
m/>


--_000_DB8PR10MB352901603ABCD87DBB7463808EFBADB8PR10MB3529EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Antonin Godard &lt;antonin.godard@bootlin.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, October 30, 2025 14:40<br>
<b>To:</b>&nbsp;Freihofer, Adrian (SI B PRO TI EAC CCP) &lt;adrian.freihofe=
r@siemens.com&gt;; docs@lists.yoctoproject.org &lt;docs@lists.yoctoproject.=
org&gt;<br>
<b>Subject:</b>&nbsp;Re: [docs] [PATCH v2] ref-manual/variables.rst: cover =
new FIT_KERNEL variables</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi,<br>
<br>
On Wed Oct 29, 2025 at 10:30 PM CET, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:<br>
&gt; From: Adrian Freihofer &lt;adrian.freihofer@siemens.com&gt;<br>
&gt;<br>
&gt; Document the new variables:<br>
&gt; - FIT_KERNEL_SIGN_ENABLE<br>
&gt; - FIT_KERNEL_SIGN_KEYNAME<br>
&gt; - FIT_KERNEL_SIGN_KEYDIR<br>
&gt;<br>
&gt; Signed-off-by: Adrian Freihofer &lt;adrian.freihofer@siemens.com&gt;<b=
r>
&gt; ---<br>
&gt;&nbsp; documentation/ref-manual/variables.rst | 67 ++++++++++++++++++++=
++++--<br>
&gt;&nbsp; 1 file changed, 62 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst<br>
&gt; index 591c03028ce..86117dd3a93 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -3414,6 +3414,47 @@ system and gives an overview of their function =
and contents.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set :term:`FIT_KERNEL_COMP_A=
LG` to &quot;lzo&quot;, you may want to set this<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; variable to &quot;.lzo&quot;=
.<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp; :term:`FIT_KERNEL_SIGN_ENABLE`<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This variable is used by the :ref:`ref=
-classes-kernel-fit-image` class<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to enable or disable signing of the FI=
T image.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The default value of :term:`FIT_KERNEL=
_SIGN_ENABLE` is the value of<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :term:`UBOOT_SIGN_ENABLE`, which means=
 that when U-Boot FIT image signing<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is enabled, the FIT image will also be=
 signed at build-time and U-Boot<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; will verify the FIT image signature at=
 run-time.<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If this variable is set to &quot;1&quo=
t;, the FIT image will be signed using the<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key specified by :term:`FIT_KERNEL_SIG=
N_KEYNAME` from the directory<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :term:`FIT_KERNEL_SIGN_KEYDIR`.<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If this variable is overridden, the :t=
erm:`FIT_KERNEL_SIGN_KEYDIR` and<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :term:`FIT_KERNEL_SIGN_KEYNAME` variab=
les should also be set appropriately.<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; :term:`FIT_KERNEL_SIGN_KEYDIR`<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This variable is used by the :ref:`ref=
-classes-kernel-fit-image` class.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The default value of :term:`FIT_KERNEL=
_SIGN_KEYDIR` is the value of<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :term:`UBOOT_SIGN_KEYDIR`, which means=
 the kernel is signed at build-time<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with a private key found in :term:`UBO=
OT_SIGN_KEYDIR` and U-Boot gets the<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public key from the same directory inj=
ected into its DTB for the<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; on-target verification of the FIT imag=
e.<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If this variable is overridden, the :t=
erm:`FIT_KERNEL_SIGN_ENABLE` and<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :term:`FIT_KERNEL_SIGN_KEYNAME` variab=
les should also be set appropriately.<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; :term:`FIT_KERNEL_SIGN_KEYNAME`<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This variable is used by the :ref:`ref=
-classes-kernel-fit-image` class.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The default value of :term:`FIT_KERNEL=
_SIGN_KEYNAME` is the value of<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :term:`UBOOT_SIGN_KEYNAME`, which mean=
s the kernel is signed at<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; build-time with a private key named ac=
cording to<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :term:`FIT_KERNEL_SIGN_KEYDIR` and U-B=
oot gets the public key with<br>
<br>
&quot;named according to :term:`FIT_KERNEL_SIGN_KEYDIR`&quot;<br>
<br>
Not sure I understand. You mean according to UBOOT_SIGN_KEYNAME? It that's =
it I<br>
can make the change locally, let me know.<br>
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Yes, that's wrong =
in my patch. If you would quickly fix that,it would be appreciated.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
Just replacing</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">&nbsp; FIT_KERNEL_SIGN_KEYDIR</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">by</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">&nbsp; <span style=
=3D"color: rgb(0, 0, 0);">
UBOOT_SIGN_KEYNAME</span></div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><span style=3D"col=
or: rgb(0, 0, 0);"><br>
</span></div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><span style=3D"col=
or: rgb(0, 0, 0);">should be the right fix. Agree.</span></div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><span style=3D"col=
or: rgb(0, 0, 0);"><br>
</span></div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><span style=3D"col=
or: rgb(0, 0, 0);">Thank you!</span></div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><span style=3D"col=
or: rgb(0, 0, 0);">Adrian</span></div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><span style=3D"col=
or: rgb(0, 0, 0);"><br>
</span></div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Thanks,<br>
Antonin<br>
<br>
--<br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA8a5af287-adc4=
-dc2a-a7da-d2fbea6459c7" href=3D"https://bootlin.com/">https://eur01.safeli=
nks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D0=
5%7C02%7Cadrian.freihofer%40siemens.com%7C48ef680eaf7d4b9125fb08de17b9ef19%=
7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638974284508932241%7CUnknown%7=
CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIk=
FOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DFUoK6imRsI8wIQgxMS1=
fOp9bEeC%2FtNO3v2BAsgbQM%2B4%3D&amp;reserved=3D0</a><br>
<br>
</div>
</body>
</html>

--_000_DB8PR10MB352901603ABCD87DBB7463808EFBADB8PR10MB3529EURP_--

