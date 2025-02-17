Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3A6C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 12:04:19 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.35])
 by mx.groups.io with SMTP id smtpd.web11.49625.1739793856418486786
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 04:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=WmEZLCss;
 spf=pass (domain: cherry.de, ip: 52.101.71.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekR+biOa8F3Qtc8MuNt5Ybm9zGChQ0hrHF3lAhGQQfZxMhhwa56HVT333un8UEwkwnmhg56E7fA3vJcZBsJh+3LB0y1FMiOX52OASx5n8gqtTgqqeW4+WjKAMzSGQzFJs3iL90d2UEJxj5tF9YfVTFcFOUqXsFpGcjgaHfl/DTDDIcPVouF7+f8xmSWiKpeDS9C4YAWNjj3GRym/BlhwsViUJig7YfA418fYT/KeIDbCxBHF19i4GPHlxgCCmdkkHZlUo+Vadzf/K3ZDIfxQVX+YwGkF9q+B1+bb7KYybVlGYmaL5DFtSUoKR3oB6wzAAXhkzMPJ3e7FHDisJVr8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxDUJ1n7/PEq87DhE8XshyiZax8hIFGQ6/cUOECEjUc=;
 b=D9/TiVlpj6gqUBQIYglqrfxqMSmSl2CmaOHp9GdV2cS+PYeb2TzXOpXZGtNxjvaJhT2unPtGd6Qb9o5QwzuGY5NmxXwa3dn5VqLgTy6Yc4KvmcUziCIiSqoRbzSgW2V+1Px1qSDH7o2CDV24qzrQ63bvCo6g2AsQTicZkzMIgniAzD3he1hVFoy5o5Mq3M8g0G9omVAOd4X/S7uqbsH06BtwzfmI+taZpZHG5nopF9qgvcvEM8QlIllBr/AhQNWhABL3fVE0YHoiQyOYZEBiX91ApZXgOTia0S5KcM54ysx79hhsh00y1VWI6Q97eVovNQ6/QZMwKOu3Ba0DSnWG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxDUJ1n7/PEq87DhE8XshyiZax8hIFGQ6/cUOECEjUc=;
 b=WmEZLCssYknRFGRaDuyTvPtk1NW97GG3KU4aDr546iJs1KQIWaMSghlNvknqcIFsnMNIELp/MOytV3NPWgBLOVpzZGgjJQyvZUt2SLIhBvAeTat5Kqxh/o4DOKofPYq5z2FL2raRDODDML3NVU8gd2PJJm6+6eRJrKi9IVXiEBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10611.eurprd04.prod.outlook.com (2603:10a6:150:21c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 12:04:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 12:04:10 +0000
Message-ID: <7cc39a0b-9a11-4716-97a4-985bdc885b0e@cherry.de>
Date: Mon, 17 Feb 2025 13:04:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] qemuboot.conf variables
To: mark.hatle@kernel.crashing.org, docs@lists.yoctoproject.org
References: <05e07903-df94-4282-ab62-77ad6e372caa@kernel.crashing.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <05e07903-df94-4282-ab62-77ad6e372caa@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10611:EE_
X-MS-Office365-Filtering-Correlation-Id: cc88ed8c-dd15-4e75-edd4-08dd4f4b2ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J9nC8TVEwpObtvRLCyt8nVBO5VEeyR9wNdvUaP0M6Cub2Udk0kCJpD6cH77v?=
 =?us-ascii?Q?lNcA9jW7RvA51TpUHBp7IrsMg+NYTzRkhlkoKQMb+pTmXu6ZTbc1yMie2YNN?=
 =?us-ascii?Q?79U4I7yPQoRD/XpVK4Pl0UXzucY9HgF8P2tLMXPils3CTlqT+oCl8edd+lOz?=
 =?us-ascii?Q?W+W6dIf5E/AiGheu+1FcqRJ5LILLhPO1AEGMUSAF5FhhKuZGFWAOpiL7f1NC?=
 =?us-ascii?Q?51MUg3Gf+uDH4FevAlg9C3YCj691xBgkrqbIw0n6Gbe1CrkaCdhnMtFMJvS5?=
 =?us-ascii?Q?FwiUV2nveHvgAlVSQtCsUrHtry7pLBWyC1f2nuTs9vFESXs1TiI+jx99qqi3?=
 =?us-ascii?Q?+sFCTeHSmC+njOksOipdcM45hn9xLpwINoSPCRxWpgDT5FLqU/rJIDOJ6Ik9?=
 =?us-ascii?Q?Be5btv8g9rMFlcJyEUqToQu2wY17Yd7RP0V8oHAi1ZJGSlqG9JzPpmwTsx87?=
 =?us-ascii?Q?/yt37JPkIOwjweieZA4q1YAnGTL2CtnWDs+W712MH0iKz4evdWLfL+Kwhy32?=
 =?us-ascii?Q?VddGUnmvBMk7JjF3aO13QDUybSoHKZzYCrbqvKs4WZLvgDy+2bzuVKrvVNnw?=
 =?us-ascii?Q?ArZwJ84vMWGC4r9YrfqLdzsqNtBzDDze5F5mGewfAYuHByWVFoHM8mR/glQD?=
 =?us-ascii?Q?DEJ1NPqaOh+u9GeEq4d+vbrh/tF9vV8a9m7zvhTu7cT+mvMmiqpkFDXLoDDR?=
 =?us-ascii?Q?a1HVMXtoFhDC+C4sf90pC9IBNLp2YNH0tsmvwyXjxZvAMeFI19pIXAZlOp7K?=
 =?us-ascii?Q?Y1tQjBWnT4T8E9nYIwZImTelWWS5EpXkml5OVmeEaP0lcy8FUyhKDmoAkWjf?=
 =?us-ascii?Q?MS2GvSdAlqXATIduR0+DwnN7XOSLuTw+27QzdWbh/2fC3K5izs53cPydBqOh?=
 =?us-ascii?Q?73Cpuab/6TXR4gFiVrK12pcRCQwtfiMV9Y22oPrjDHkIHYyokENdsERUYLVY?=
 =?us-ascii?Q?h9Pqh2Swl5gsPLMJqrSfKjez38FPaXW0lQIN89NpxvoijShpllAgTLOdaOWW?=
 =?us-ascii?Q?pC0avfoygJuAyUghV3/6paVG19nKeAhAzIwXDE/8CjCDlYGAJISwSYxxbhUk?=
 =?us-ascii?Q?T7itZn1ktgEojjyKvrsNGsCpvMppS7jo3Ey+Rjeshk4UFQSAh02iQy6MF3zN?=
 =?us-ascii?Q?6/C+CJZYnWD1VyOBlpqXCkSupha1zgSkVonFETR+3nbPqW108Bh/rAfOI8g8?=
 =?us-ascii?Q?U+jBXTy+p5t2SU52YLsVQO0ekWdkDpm9R+cb46tk8L7dDcwOUiDNxCLkrrDR?=
 =?us-ascii?Q?2rYFxPHxFytvfvaEYRJOfj8uZNvNoaeLNS7keDTsQI2qilQPwCslFHS0B0CA?=
 =?us-ascii?Q?P2BN+ve+IAX3Q11Nbct/lTN4LTAEY9SggtsaphcvIUhLBXqrAdLB995laGKJ?=
 =?us-ascii?Q?+DBMPncV0tflFkWp6fZn8RxJrXuf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I+gGzHa6Jb7eaBjFlKJr2XfZhBXM9vCejrcCJUUhww+EQdxE7QYe+WKUyCWg?=
 =?us-ascii?Q?Iigs9rhNjmSLrYyWoFsDeOG4l2B768c95oArwBptKwSO0qUpmcJXPk3iPJl0?=
 =?us-ascii?Q?atZ33YmjzeMZCpU0lC7z3sqabcX0vI9RUnsfLM9X+XvbrRqyXFhqAdNoGZ9x?=
 =?us-ascii?Q?Nr2KkJhtEYrwcnBjjZbwZ03yYZyZjxuPn/HA4UdL6Nwc3mGDwOrnn8ZriQl1?=
 =?us-ascii?Q?nvoWMEmAgaRN6ls2s06iIoZOxD+5KuncUueFvIV2cJggb6QfRLX5fd6KN2JR?=
 =?us-ascii?Q?lJJJcWCBYwHMqD5TWZGw4SKJbG1E5k/wG4TTRKh+BC8FmDPl6Hmvonzk+0k2?=
 =?us-ascii?Q?FyhQUK7bZ4Boow+Cpk/bTtHhAC2NeSvgTprooctWP2xafsNcrikqnT4cNyO/?=
 =?us-ascii?Q?Uk+JltCsF9pWLBVbQtfh33OeCyrqDT+mRvtECtTt4pqEMRs75xqaDmeFYZjh?=
 =?us-ascii?Q?eN/oMsVzPkV98lKSyfVoFNsDsY/tFth3zPzeaAiPrrjJri10L0cdhQuC6tgF?=
 =?us-ascii?Q?Jo2/X02I0uGQ8zh9xhKhV8+blfUhWW3xUmxtr8xXFNTFzADBtZz7rZK2nomy?=
 =?us-ascii?Q?9X5EUjJat+Xocja2NNjg0F40kLXs3dDK3FiBKj3gK/Oasetvbg3yCfTsBD0L?=
 =?us-ascii?Q?K1xUhhuf+oikwc2J5/y59+Ckcyyk92lxXOOaKsB63cW/9ZR6SmBfMqKBT9VI?=
 =?us-ascii?Q?EnAJTD0iI6rn11ieje02uYAfZJFXvvXjpuNAYT2usPWgu7bLka+wpYmsiM46?=
 =?us-ascii?Q?Bv/JdxoSqxiTeHP/fCWDPcDfgNHkF91E5XL6XophwJcxes7eZGK8tsUCPC17?=
 =?us-ascii?Q?8IgDTl7mj7h0i4uIGboBGZsmf6YJzRAbV6Pgq3ALi0FyXGPdSmGH81VKXTkF?=
 =?us-ascii?Q?h7YFD8HD0yCUV3EyJ611IxJ0uPJcpmF+65aa6cUEPhJir1Ac6BIYKwbVcCGR?=
 =?us-ascii?Q?eT/IWLKC7afGEMLS5HQf2iHZE4myM/lJ89Es8TfhUUvOaQh8N+kW+yKzcScn?=
 =?us-ascii?Q?gmc8EgJFhUmL1SASmsJvoDiBqslFC91owfqRDLtBqpLwuQQnK48cCnO0CLlk?=
 =?us-ascii?Q?6Q0hZIG8k+rCqHSna0sJa6lRlXPtKZvgoHbq8Dh9xHpO0Q/t/UpXKxH0DcpS?=
 =?us-ascii?Q?8CZRdPUnpI7KnANxvqZzAiFhyH2BmxgoA0DhE7ntU6O/Er1afjEdOAokJwh8?=
 =?us-ascii?Q?w9MHCtD7tdMQA7WvgUZ4J/MGxYVTjPNjutTbL24Riysvat8cMdqnACPuoTvW?=
 =?us-ascii?Q?jY5ygD26KEN+0GpHcJjhHGVViqnca6kVmEcupD5IVAZ3caNzkN8z2cbMGHLO?=
 =?us-ascii?Q?PXvRbWsYeCfCi3Bh9t+8uNqOU1qygwsMatLaekFBz/GpfvnjaVPNga6cS75U?=
 =?us-ascii?Q?mXrlSPoLXwJrFHEhUGmBOrk5hDm1YLqvA8RtomI4hqRw3J5gAonxhe6meLhg?=
 =?us-ascii?Q?hUUj0p4x3iENucr7xX6V/NAA3S787j6JFhfdyoWxtrArEdm6+AGPngUW5VCc?=
 =?us-ascii?Q?xt91MCb9dGVoz2sRod+5Alhjh60c4u2MeRbwk+UPHCa0me+A4lKjIdK9L+3q?=
 =?us-ascii?Q?sWGPet87XvboSrSthFYFRyK7Pd17MJTOysfwu3gSYcMmZRMlegIz3whM+BnM?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cc88ed8c-dd15-4e75-edd4-08dd4f4b2ec6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:04:10.9479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwuvLehoEe9dgkQGxUEGxjH1a3XByqMmfPfaOcI+iKksB9IwN2m3kMQ1pY73tY/HN7CKzWk3j8Dmpqdgy103zIpoTr87vAogJEN62Lm10JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10611
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 12:04:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6382

Hi Mark,

On 2/14/25 4:50 PM, Mark Hatle via lists.yoctoproject.org wrote:
> When I was looking through the large docs, I didn't see anything inside=20
> of it to explain the various variables used in the qemuboot.conf file.
>=20
> Looking through the code, I found the stuff mostly in the class that=20
> creates the file, but there were also fragments of explanation in prior=20
> commit messages and other places.=C2=A0 Below is my attempt to collect al=
l of=20
> the qemuboot.conf variables in one place, along with an explanation.=C2=
=A0 I=20
> think this would be useful to add to the regular docs, but I'm not=20
> exactly sure where or what format.
>=20

We do have a QEMU-specific document so that could be a start though we=20
don't have a glossary in there so we wouldn't be able to :term:`QB_DTB`=20
for example elsewhere in the docs.

Another option is to have them all in the variables glossary with other=20
variables. They may be a bit too machine-specific to be there, but maybe=20
that's fine. In short, I don't know either what would be best. We could=20
start with documentation/dev-manual/qemu.rst in any case.

> There are some other things related to runqemu usage that would be nice=20
> to document as well (command line usage, environment variable, command=20

We do have a section on the command line options for runqemu, are you=20
thinking about something different?

> substitution behavior and generated command line rules), but the items=20
> below are the ones that I had to search for when I was trying to explain=
=20
> the qemuboot.conf to someone else.
>=20

Thanks for sharing the info with us, looking forward to having patches=20
on the mailing list :)

Cheers,
Quentin

