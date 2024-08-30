Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B13CA0FE7
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 12:21:28 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web11.12669.1725020478013301620
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 05:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ChZKTK39;
 spf=pass (domain: cherry.de, ip: 40.107.20.74, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2bgvoUI/Vs0Ici7MUjOn7a03F5huqi9Ed2OC3S8+FnH80pidtn/dzoVVwyKtjzou3bB+f5uSJRV34phn54aG5TqaD4GC85wKLlW49Tj5kHibPk/l63M6NMFXIaY9WomIBr4mKQRXR8mYXQMseZxNpRgmELc1+6n0aEbHCEjTRNDBJLJ4OPSM6JUpvWbgOG4Ni5lt8WA7n8QV8p0gvDRmff0mUpfZoilYHhmufLNRGXm6BA5GHFNt4SfxwoR4/b97Uku1adZsQWFt/fwsigYecBsRu1mA8LZxxaVWhAhUgPhKEsKAWm2FKpfg21uYBs6Pd1Uhc3aZZ1sCgAFue6RUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/z51kDrVUKS8BtCiRNQThR6yk2oS6lV0YMNB1lF4CQ=;
 b=FzqUbYwp035NKz8V2nu+nfpBzGcYIVe/kiJUUy4D3ib5/klf0BcuHhLoyG5YtyM1bdqCvRnaJL0Nzj1YLwl+o1i7lKVqOBjKQxGh9OykYPAyZJv54m/nMFTi8hDRmsLFGxbUaFcOqAzcVWUeqSuFcNbunFXXsw0vJsFFRN8UOuAExul6D8DOwKN2wpClNHfNQ1ZggKqcgu5HgrBK3/CfGa1IXqyd4lRzUbOfyZZkD+kyc7F4wOnECFp9XtXPADSQdBWaG+8o8GpgKn/GcfWUxyITcR/7i3gdFkWI7YS6lOZFLJ9g+13mSURfszWTmRA9iIlnsiVcaNoIZFamItnp9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/z51kDrVUKS8BtCiRNQThR6yk2oS6lV0YMNB1lF4CQ=;
 b=ChZKTK39bE0nq77tn8VjhY/1/1mc2Reqsd7TGcGYQr7F4OnkZn+juxIPznJpGHX/Azkb+SsHBbpBiEdTUazECU3Xdtt1r/u7MGNZK+F804PWHqt20BJP2UfjP3kTnMF2jNuNV9ocvf/oiI7Gbj2jwaPpTPF42zXa+ArU8JTeN4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7423.eurprd04.prod.outlook.com (2603:10a6:800:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 12:21:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 12:21:06 +0000
Message-ID: <4ab5307b-3af5-4ae1-b6a7-48a1ab62d03f@cherry.de>
Date: Fri, 30 Aug 2024 14:21:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] doc/features: remove duplicate word in
 distribution feature ext2
To: joerg.sommer@navimatix.de, docs@lists.yoctoproject.org
References: <9288e40f901792887ac98417ae8c89fcc2f23a0d.1725018000.git.joerg.sommer@navimatix.de>
 <73cf255dac1cc3c79efb1b00f4f800c1e6d07435.1725018000.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <73cf255dac1cc3c79efb1b00f4f800c1e6d07435.1725018000.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: cc69d047-f646-418a-9266-08dcc8ee3914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UUmfAKbesAr42wLWCptkw62kk5vCl7hB1BMorStgMwc+y5cR7YZ9LyJQH1pj?=
 =?us-ascii?Q?KRfLlahuECttiSZ8P27rnaMEPh8OecocVerfo1Bx/lN7erpGZqO61N63NofO?=
 =?us-ascii?Q?FnRPdpsjvx0PkBclJ0zm9LZPoKgXd4Of278EWvMKXxH37dgYuFRbU7UJp9Ih?=
 =?us-ascii?Q?9RsLLD5Lfpn7uFYXlU3GZtYR/RVjmqHinjInqzQ4KtxVXSttVkKF6/sglsTC?=
 =?us-ascii?Q?LtugcvgWzdCpjMqYfxtsRFWHFeeA1W0iddYeCVLJHr6azgfHKCPL+kSQPBr8?=
 =?us-ascii?Q?v9+WkhsMAlkiatybxi69dVTcDDgJNrVUmTXzNIcF2/OYaMP9A5LNopae8jkm?=
 =?us-ascii?Q?REn6JbSFH3IKTtctpFkB37eGWYDt1xlwYK5oi/REQ3y9jgw1eG4BakFP+K6P?=
 =?us-ascii?Q?jDoRs/VVMQUgHoPsE+ZzaU3x66v6DDOopj3FwdxgDsqB5AAV3JKK/xKAsuO2?=
 =?us-ascii?Q?5VV8pWCYNME2yXk/kWs5sWKxY2uRlQaSK3zjImrJfgyAvgVOD7ExM34c/Msc?=
 =?us-ascii?Q?IKJNOQHAqUrwQs+ytsZYRm3fEBNk7NNxNBYA+9PboKdCjA42s2E3gR5yl7eO?=
 =?us-ascii?Q?n067hqtKS+poAJIokGqVZWw8HKoV6nILLrn5vq1ZtYCYGy27rTNvRPMeoScO?=
 =?us-ascii?Q?Rf+Rmy8S5ljnzCp+3nkxKWc2m0gfl4TVE8IfdKuRqLb997dADYyzXmFEvO1p?=
 =?us-ascii?Q?Oesiiln99HeyLDLx5WFsB/D2PiffbfvA8aeW+AwnDQUDe7w5DlHEWZmJ5JOK?=
 =?us-ascii?Q?PJ16IoBCVlTJ3/n1sOw9v+KE6EtY9p6Gf6thDMZTSQ1x1eVZNQyP9eNz8tpK?=
 =?us-ascii?Q?UQzWnyaQJmCMZ70UTBZOJUZqOJBAryoHAJrGY3LuQeOjVixSVzdEY70qd/Eh?=
 =?us-ascii?Q?hZ6HC9B+lQYr6AikhT+8/1hZkavfs/yMSMF+Gl3gsDjL7+myQujtUxYzbUMe?=
 =?us-ascii?Q?Ydh17ClJ//Ag8XEK7V8dTFJxIw4FblD05U9pCgiEKixO84mLz4fIyJUNfd3o?=
 =?us-ascii?Q?29jIhyN19mVSIc4hd26C94DVIicj+dLYIkqwjobesmtg1x81T+b/N3pYPBzI?=
 =?us-ascii?Q?re31M+3/m7KgmmaS93yJCSo6p27NxLCUZfJ/zcilZ7CZYc6PsvFWKN8NUdXq?=
 =?us-ascii?Q?uDkyLm6xaCic7Msv68TTTm0M5Fieee1muJ8RMZjuB3fBlphCvAIzQoax7NS+?=
 =?us-ascii?Q?WyBhUXk0s7wx80SF9OYIvN8/BXkcoY3iZJmNj7EZdVJYpmP9OM0ae8ZOaNt/?=
 =?us-ascii?Q?FvblRY1w4J43kt8GZ6s9FHyuMwjiN5OYqt3j82iQeySbSlPu5sP16dIHrUd/?=
 =?us-ascii?Q?KRdBdKSU8sm9u3lRCBl6PXKcmPkKQ/7lnq7TVxlXepeApQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bvcF+cquyPpV01wkol1LTaxH/I6sUIriJteWOqBzUpYprQ85eN8FAtsEoHqd?=
 =?us-ascii?Q?bS/mVKBdXKXdPATHWXpfYfIEW5H49dOEDau40lykzT2ZBA5V7mzHsgRzGFTS?=
 =?us-ascii?Q?cIGbO6Fe0bKOskA1sVqvCSQTtV0+r66cOF2Up6TsUky9QHJBrR0lPFUesLht?=
 =?us-ascii?Q?nKmrORg5lX39KP31NIuyzv1ljwyb69u+I97Q2JaUd1S8xd1wsD5F94V3B3rI?=
 =?us-ascii?Q?48as7UCEo4ekkQPhrieMYLlvqFpmSPjjT55bb0jom51JFJpiS8Cg7bnjiW/A?=
 =?us-ascii?Q?620jXPj8Man3TzHKn3HHlEERasuIdfKea+aLbsiluUhcIF9vTCi2wr4wJvDM?=
 =?us-ascii?Q?gFrjhWQo09s/xwyUXEbg5V1Dcx9yCQDzBrU38wXd9b9y7+kwJTkISuiNhUrG?=
 =?us-ascii?Q?s2+bKmOY9FiuIlyY7kbu2ERzmllMT2E6aM4einf47kBYnPC2O2R/rCMrnzzK?=
 =?us-ascii?Q?jt7cHaPR8q/b04t3i0HSLuiyGNs9xQcjcfQFu3+7iY/BfFmwWggvnGBgqX9S?=
 =?us-ascii?Q?10dtEpgagJi4wGjE9RiCHGaHa82scvgN7A9fuSxTRADxUVuqaI8ja8/P6xII?=
 =?us-ascii?Q?VipeYdcrx9PvszLP+mShEVshvLAnt64fCLmFuSZvy5Wjm4NFEKxvYZTU6RRn?=
 =?us-ascii?Q?5MR92vkOsooOC92KTTH49vANx/VXAor1fscLTxYyDHDj9qdhk0iodkOP+C9D?=
 =?us-ascii?Q?zWMbsbIz2C4WuPMyZ9AtE4j9/epZTVFuS1pWzyWpuog7Q7OQN3gr9ZVGTuq9?=
 =?us-ascii?Q?f3OtLbg3Mhz8XdJ104aDJIiNNG/9ST+NktJ86OHFMZKf83/BPDCHxnKshoP+?=
 =?us-ascii?Q?44aZstZSDUYfGLxKLaINBQinUdkLXOew1MaeoM+5oSIhQKftwOb8RxWAH5KG?=
 =?us-ascii?Q?1e8khUY0pbU4CmE7ewHjxbkgXIWC9/5pqoIBRFMyPUYgPGR80svMz21ORXXQ?=
 =?us-ascii?Q?WJD/r32DaV3Q/FW79VC56QoQpOEFsAJ4zPeseOOMDAKjC4yOUcdOO4VVY1XF?=
 =?us-ascii?Q?L09XsnWseMhCbCqBmT1yXUJJTcTeSAo8T7YCyuX6U74I/X/xobjeFlC81mk1?=
 =?us-ascii?Q?1Rje6mAoDVaq8mQWIxQxcDfZnOzoIr9zhlHbmdK8zLXN+WN7YAeyD/2w1oIF?=
 =?us-ascii?Q?Sl2NcioB5px65Nsa4qTaHKSThZmhY0kb3rwg1IGfjdnR+KPLGhxrz2AOHyC+?=
 =?us-ascii?Q?XxON0Hnz+UC9yzp1vIkZr5TF8ttZicmQVWNz81ZETlnlqIHerDspFL+vYmgA?=
 =?us-ascii?Q?qJxsTOujZgPuKGwHbb+WrAcxiueERK7v1oifQvmNc9LUP54i7JojxNXshqA3?=
 =?us-ascii?Q?vCEAri2dgPNDZB4esH01YrwyxRy10R79AL3OMhw0t2vdbKE/1n73b5DFlCnk?=
 =?us-ascii?Q?4NBp6Pw1m/Q2u8Du8WSyeI2cvDwzdyRVaPNbBiyQ8khK0YuIzoCjeDKL3BWY?=
 =?us-ascii?Q?5CdhFKzb1n4RqEXHo86SEepRf+yVbd7ICOwrl41G5A3fV1zMSitjHkPojlP7?=
 =?us-ascii?Q?l5CmcmWHPGAl7x7g0Wy3wP6a2TRmu0HqBNtZG82wmkHd7bUKCSAaD4EGBAKE?=
 =?us-ascii?Q?bGShKsQjQAZZtIo2cjEWXF0aw733goy9oBRVFMe1LRGxJ1QwlBiCwim2GBeg?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cc69d047-f646-418a-9266-08dcc8ee3914
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 12:21:06.6409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhat+6DVst5LnIJiZHTAkhQZ419KfGbazQFX3essz0UP9g2x3JAKxm1uvFqk4koDOZFQkYFwRAxceZt0rH1MARvWY8bArUycKXAp+vdUBIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7423
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 Aug 2024 12:21:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5344

Hi J=C3=B6rg,

On 8/30/24 1:40 PM, J=C3=B6rg Sommer via lists.yoctoproject.org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

