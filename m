Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787BEC02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:09:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web10.20778.1736784551201367952
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 08:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=AjzKTVqC;
 spf=pass (domain: cherry.de, ip: 40.107.22.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmVE3H1ot3cwzVNKcAmMNM8VFD4x0wONLUXG+imCFeSXUIvY+Jh9Fsw0xR6z676IgcRNMZ/oM1rJCgBW1p/RpwPCgC8DIVtoErys7XL2i2q3juWJNpDOl19eKPXhYikOlSJvxEuMH1Vu8mz+HSFxWeStuguVaEoAIFyRoK12uru2n1nbdAieTo/vfIdPgYR3G0VTKgFXTGBjMNoA4ooeRFMW39RdBZexIl72+ntvrwOJqHdAitQgFWrna/ESapkzDFFT/C5PbmL7m8hNAbC0I8Yu5efSs/aarcxOd2ur6GtWsoq7rGJ+TTOFP6nl57VdjmUXfmkc25Vq47hrvCPWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+xqpHGl11YmHfIsRyhnuxutImujDul05JFYQujxZdY=;
 b=nyriqTKLv9h5A058S13ijOr5yCsMWWQUUey7o23FGQk/8EAXWj3vjops+fzfPYBHUjPGCTLOiRR6Wn3/mhKRcDMo+CO/UHzOXF8919dj/Ko21j8hAlh6FJB1jL0w4lH6knheIO6/Dxk8YJ83+fWQf++xn73g0N6El/fTe5N3wDdP4DRlxF9+JngOgfccoUu9nkjWrxI0oaxjWgMaxxuIK+Kq9z91v2Qn0x8sXabL0Vbdc6P3TGAdYBIIQ/4QLRX4z38g9BttF9YOqoUCdV80U4VkdVDFPR9vfAA9Al1IZ55BBwZCK8Gt7zI5KbjzRja1/dqadO9sym8Zvn59HHR26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+xqpHGl11YmHfIsRyhnuxutImujDul05JFYQujxZdY=;
 b=AjzKTVqCn3vcw7uket5pNPGbdk6sIa0A4j9w8xIHt1IbMu2ZD3FePdhh/tuE8Nbf9vRpX+AlMEoejSjv8syabAxBJWAJYbqB6EKfbFwY/X3etWle5/62+gnufKhnxRB6NWXRwtolHbsnPNxVfMLdEpA9twF4y2qPlwNy9L2Qv1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:09:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 16:09:07 +0000
Message-ID: <57fd4f72-5feb-4b37-85be-b105b4f55a3e@cherry.de>
Date: Mon, 13 Jan 2025 17:09:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/3] migration-guides: systemd.bbclass do not add
 Also services for 5.2
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
CC: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20241224140251.24389-1-adrian.freihofer@siemens.com>
 <20241224140251.24389-2-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241224140251.24389-2-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 79608e45-2852-469b-bbcc-08dd33ec9bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pkZ2U/44YH/5eJKGCKJsxkPoATyrPa1yykPvT4yMEq8PDBhSmq+jK7kFeNI0?=
 =?us-ascii?Q?b3VTZV7THrJ1h6qdlGs2h3DdPaC1RQR27BzXcy4H/nICy6tKXtG7RKE4CjA8?=
 =?us-ascii?Q?2zVgFI9XRg8tAonL7FFeFLyUM+oIZEXIx44dJ4w5xiAoB26baujhVJOziHtp?=
 =?us-ascii?Q?4Z+LMZQ4PCeXbU5fs+tXp5KNg4Xfs1HIpuz5A6Md7nqxZ7LAe3AWEycVjo6I?=
 =?us-ascii?Q?LKlS7PEDlLTImg7TSXiAqwkGsscaqWTt3sitMn/HKip2hpy1gbSJm1PmWGDD?=
 =?us-ascii?Q?mxCPV/tRgCuS/wmDkmudZ3T9bGYwAJ1Gx25nxYxds7r8jigYTl+Ak7mcWYZp?=
 =?us-ascii?Q?DCyJIgJjl1HAZKT01WVXrp2ziEAeoeusXdZlsFFTCFMHawpW2sm3sixsiIhL?=
 =?us-ascii?Q?6waZbMqLMxCPFk5IqbM4Peo/uTMsCF7E6CVaDt9DCK99gOdruCGa8kL5kqqO?=
 =?us-ascii?Q?Piy38Ere5TqUh1Xd9UWDF0FVaF/CMlDmJPe5ecOc66kzJ3eU+6IhahiLmcXz?=
 =?us-ascii?Q?RLyxmfjbCdR/ffS3ofSfqNmhRCxBoLhJ8lpG44rsZ3eIKVQ4S516kYvWM77A?=
 =?us-ascii?Q?jMrKW75Qu1NSHod32I6qFoWE+8WVBGGa8D/gGxMbM/Hd8eidJvnlG0KV7zIm?=
 =?us-ascii?Q?NyPDPi7zr2mPR97/P9KL9DEIR1V2vs3+Nm3zufk1ngDKWFphFpINpmxvDqrq?=
 =?us-ascii?Q?0JfQcsm7LCiRyIySur6e2NC4jsHEHZmskt2tmJM0IXULgGBSEobxz9hicXbF?=
 =?us-ascii?Q?KJvdtfaDeHcRpThEwzUxJFyzotGNzLQE6D6CJyC8lRSPvt7fod1luJY2ZQ+Y?=
 =?us-ascii?Q?Z5iTAiua2KbicbmiFFxur8snXAAsrJsO2m/Bs4nDLdWtucSHy9HzQUy+A4jA?=
 =?us-ascii?Q?mWGn0/fyMqpLwyiLhvlcTqzvH+u7TsPv4oh70y8czCPB4ywzmxNHhqwX0yZu?=
 =?us-ascii?Q?kniorVQecGBPrTw9+Yu6zrP+0wdZKw2FvAdGTvJAkA6FYpp/5k5afqPvVkzm?=
 =?us-ascii?Q?jAtLPAmIGrJhAlY16LrRVcV73FqcPBKHqFq4C3sjqwslD83jWboBtcS+gyUu?=
 =?us-ascii?Q?1r7Ay803v8iz7hotU1u/e3Dkp8HgCvRpLfYw5xCGEmjDwS5Oegq6OHTBLnBh?=
 =?us-ascii?Q?XZHMSpbKThy7GUfuIq9PbNv3jnH0Vz2emxgTfzu52gN9r/SUZmvn+YnASYaz?=
 =?us-ascii?Q?NfunjtuwBJQaogmznx3gupXBQ7bOIwRLdFoXGf+Yz1pA8RvOR9G+S7Jejs7Q?=
 =?us-ascii?Q?thHhR7/kIPOCDDMH0j8zSSh3R/Mu/6p6ak9/3OF5OvWpJNTCXdw4UZSMEW5L?=
 =?us-ascii?Q?nZAX2HONH6a2TslGDx9OcXCaVsY4a/qDO9e92+Kl0FomHw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H7fjBAJgEc1P5jNk4GhxinxDGC9nbDZ++QTzjj1g+9PrjaDj15EsXG996TV4?=
 =?us-ascii?Q?TTuBpQ5xNXcxU08YV3C5zBX0Acko4lP77uub4S1sdmrSfgJyhxsLXRS4+DrO?=
 =?us-ascii?Q?pjHkM4IAvP1R5cuYHPpJrgTgdjcovXqNz541MqOihEeATT2kAd0l6O2CAdd1?=
 =?us-ascii?Q?4oRx+KPcl+E/ibTcXzRxVlzXTsxuoOhrNmsLPJcYNI4R/L8eN/BBQlGX4fFI?=
 =?us-ascii?Q?pFaLchTTb+qqdC5GdZMg9GQlf3C/VxjcLQhPF72+ILTBEgvTieDrZM4u2+Zh?=
 =?us-ascii?Q?e8lxNKD6yNQhTEyzM6VhrzGojc/u8rEeL+LZN82o+FjUeeLECGNsf+qMG3jR?=
 =?us-ascii?Q?AdYk/MwzgPCfPPbmpcedKpgkyqoKiy6hhlyyyZOCqFhDRs7FexaX6If+lOSM?=
 =?us-ascii?Q?1deAyceCWcH9g4PvxUpKF8/aZcEb0XmZGickvSfqiL9Bl+T7BQ2QoHnZpmE0?=
 =?us-ascii?Q?Dupkh5/yt8ZrknbQ5fTt1aP5JUv5IGNjbqGF52LvAO+RkxmGKkvVsaPYY16O?=
 =?us-ascii?Q?SMG7wOdioXPY0GTOPu6ckA/QiQnw0OG+Sb/JzpX3TzUDbi0Ywx2wv1s9jcUW?=
 =?us-ascii?Q?UTdI0jh0DXxJfts3yfMUHcV8MaYLnNXP01yJDIOVK7zVVfLuYv56A1GwbjA8?=
 =?us-ascii?Q?MwjK/sWW93MP28GpMacvPZSeNC0FTf+clfe70xOGpqq9ekkj7PxlCrDGbl3s?=
 =?us-ascii?Q?cBxWMSX9OEe8UonA4vrzxKEz1kD9EhJNTZvywgCgk0RKwtFuCepNPbSP+FD0?=
 =?us-ascii?Q?rLWTCxZ9qGtfWhTLP51yMqhaIzb3Ec3V578luLNK2AYWai/oNgTjblpfjyBV?=
 =?us-ascii?Q?9YlVu1IfSv5whpydIWzlRk/x6g4NwgZeJDe35oTNlxseekCQYpb49/JJOnAb?=
 =?us-ascii?Q?qJqfYJxLH2u1hgzP/X3VRKHKawVgONTNzAK2WMziftkTtyFJpaJcSKj2X2w6?=
 =?us-ascii?Q?ZLJsZF3Fk6bXhhGuXZguvOSm/0MhJK+U7K3UTaBCmlyfPJBXqFupoonJ0Clq?=
 =?us-ascii?Q?Q6ZuEQn//uOaLKo76CAZqmz0CqOnQJ40swK7DVYU6YifnVnhxv+tnH3B7Jaz?=
 =?us-ascii?Q?IXne1z0sdI5MYmiezUS5IFFlvyWstowFtNblflGnCUh5sdEnaDKaTWUKxCxP?=
 =?us-ascii?Q?VBnRp9mzjtMQwICUxy23yOeE9eQINz1sHo8BErQCvPV8I2G/Dtn541t5xTML?=
 =?us-ascii?Q?T77mGB4gjEV6I8w3ddsRjZ+bhMZnrTLnC1yI793LdOKDi1GZEkoUsoDjm8s7?=
 =?us-ascii?Q?yobmT06tIdANHTNWt8q+uhuy+rGhWEd0cn4N2pltDTw0ltluA8GTCiG2pIPV?=
 =?us-ascii?Q?Hdv1QdMPSZ6QBw7zO1/j3FS31BxNm78hd/rW336qT7Wdep9uRIK4rocVHN3b?=
 =?us-ascii?Q?GZ8Gcsqb1Caz881bWtS+FTuZ6EcAMST/KAh4LGaWTim93GQbiqf7WMQeCBWC?=
 =?us-ascii?Q?2ua629SC7SK2bNOP+beOKZ8gZzWRHmupGcasZk7q+Zh4p2HqjNq8ifbyV1ky?=
 =?us-ascii?Q?/FajqSeWDMjYiv6OP5dow7EZKd38IGUIzOK9iImN8MdqPqkWGrUdqNte/Gbj?=
 =?us-ascii?Q?RXD/AgM1Fs2XIiN7mQLQJJ1V+LeoCt6MgE8PIGYk9XqbH/CeUfIdjkYIn8ZG?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 79608e45-2852-469b-bbcc-08dd33ec9bdc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:09:07.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVvMS4zscEvhsg/GVe03ycvXRT1jIJRG4BJOnLhp6RjjEy/CeQ4Ak7jnkobOKw1SWhDbxE4IusFbvYNmxa+HBI9DGz8RGoEZw2Y3t9QPv8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 16:09:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6086

Hi Adrian,

On 12/24/24 3:02 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> Covers the chagnes introduced by commit
> https://git.yoctoproject.org/poky/commit/?id=3Defa5f65c2214239ed7aaf7bd89=
98683e755c5660
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   .../migration-guides/migration-5.2.rst        | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>=20
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documenta=
tion/migration-guides/migration-5.2.rst
> index cb70e19da..2ae8e73a7 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -74,6 +74,25 @@ systemd changes
>      As a consequence, the ``systemd`` recipe no longer contains the ``us=
rmerge``
>      :term:`PACKAGECONFIG` option as it is now implied by default.
>  =20
> +-  ``systemd.bbclass``: If a systemd service file had referred to other =
service
> +   files by starting them as =E2=80=9CAlso=E2=80=9D, the other service f=
iles were automatically added

Seems like those are not the doubles quotes we typically use (though=20
there are a handful in the docs!). Maybe switch to " instead in the next=20
version?

Cheers,
Quentin

