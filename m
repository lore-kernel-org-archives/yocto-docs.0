Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C38C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 10:52:50 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.54])
 by mx.groups.io with SMTP id smtpd.web09.10048.1635331968262406334
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 03:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=LXR65BaI;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.54,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJukEs4ev/cWYTrjE08k0pV48dRCPlZzuKDVAVx0/qYVWhTRUX5YqHMdTWjBBR8Jiqi5r8Z2AnV7J2UyDMMUSaEFhvaTrJMfWH/3Nf4ebFYNCiUeGJDkiVn+Tpo2fzu0KOnq6ByXqzjnuUwZnpBbnMqbEUE7UdoAB/PZ90spAg99J4NgAveKcFTP9maB82amPI9VPkuoDN0P8k6Rt9ThAZ+y3m4zvdw6NW7NJD7b07OWoJr4OUwoxn4nVCN5JI6PvVf/zudVyPGfMv6zZvm8iQyE4JVwskCNWvVLXI/YQMZ0HE+eWa7CPVO+p8rhz3iN47itRN4KpDOW8Rdvo7h5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfcEXxhDeiM+5tYZoaB3p7x0Ba2Kcc94fJ9gsljOTT0=;
 b=O7aM4n0FCLfIImXb2KyuQq0uTHXSRpdYTgRasE//7Nsdx6cRMHwU1mO6zNX+5B4RrLXqrtM44KlhQaorhYlWNsLWeikXo6Kftz4RrfvOPhdbgIbeXcoARn0T6DtAIINgVfPgXISFaYaMKnIlmkKhXdp1om0Rh+2QSn5H0uX0Nu5HnjllZh5FgDYjzTTPCuZKffnvqVAhoD54MHcM8l2TkivJA04ZeQrdVuC+j4Y7axvVfmUs73sK2g165T5MT6ryD+DIJZNsaPBdNMXkrKLu+G1Kg4ksQD46H2Z10su6RqCK39Eui857WoSXt4bjaEVOQ3D1cNu6zVaU70s5ziwI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfcEXxhDeiM+5tYZoaB3p7x0Ba2Kcc94fJ9gsljOTT0=;
 b=LXR65BaILa8qZWNuie0PO6nweJaffD0kZTWRg0IMimmWMD37NFYS0xXeBfLLboWFTyAsJUyF3dUeWWv4svp/X74d3kowy+eLsnfBwfqn49YutUpA1vMZzD1E1zBbZ7pn/ysBmKW5y1MaQu9hYgGC6sFfp98FBlNCpod6/q84g0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5332.eurprd04.prod.outlook.com
 (2603:10a6:208:61::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 10:52:45 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 10:52:45 +0000
Date: Wed, 27 Oct 2021 12:52:43 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] [honister] conf: update for release 3.4
Message-ID: <20211027105243.7ncoejzfms6rcxyh@fedora>
References: <20211021084332.334075-1-quentin.schulz@theobroma-systems.com>
 <20211027104016.uqi7y5d2aluyvf4x@fedora>
 <b1ceabab92cf6b2b6894c85162d84af74aa4abe5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <b1ceabab92cf6b2b6894c85162d84af74aa4abe5.camel@linuxfoundation.org>
X-ClientProxiedBy: AS8PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::20) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AS8PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:20b:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Wed, 27 Oct 2021 10:52:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5dae82b-1077-480f-cca3-08d99937e8a6
X-MS-TrafficTypeDiagnostic: AM0PR04MB5332:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB5332F21DF6CB35B10A15CC26C2859@AM0PR04MB5332.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kGbnC9j0FUKVpMjf0r+OhtvZhC6WxzoiJG+MAL5VPtBg4RK79gHTNGYOs06bEV479QXC1fkGWgJkvITWdePrFR3jqK53mzcCCe4DNJvk4qBXZD3n0KbuvwYL+cChYxdoCAiSrZN5T3nS75WrIZ6sl+OgbU+jVcBonJyue6FlVarMqpzlXVCHFxq8zo1wmCP/7E6w8ejiXyjp+I1HBR14yPS4bPrynD1TtkvuRho4mha728zQ2lCNfVNcvoyTLjTcTpbb2ZQx2NO8eHbZ62ECL+sr5xUmsC+JVlD+w31msqA0PGAIDzuYAnqufiDdL50eNMxGXFyi7hEbc2dN1AvzcXvAbGiTy3dSDuNoqB6ghU3poAms8NNGtk3Imlg+nAiu3pJEfwqple5MN971hmPz5mpzS8SApNFYO0ddT8GwYuUWCn58yLMTNUA0rP3MZpgKW8pbMrR1eSN9Z0UJ/GpBGd1JFkudPJIv7u3npec8oJlo7jb5FhvP2nZ3jZ6mRTQu9PRFBpdXi4u02gr8ftHLZ3KRwca1uBOE2+gVD54fEn6PgYjn+jDYJagm6QsY//YD/7CVQ/rN2IY6aVxbOlEGTpvWmzH9Pn3XYnAHbgWIeaqzJR9O1kTPJ6juK/upp/d74yXmH71NtGrg2agaRPMLjdGqkruXO0Zp7qXzkqzuU86RVEBoeh4Zly2xglGTMThL1K1nAB0rTbh0/H3kO3dOSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(4001150100001)(26005)(86362001)(8936002)(38350700002)(38100700002)(6496006)(4326008)(33716001)(66556008)(83380400001)(316002)(9686003)(66946007)(55016002)(44832011)(956004)(66476007)(1076003)(2906002)(8676002)(9576002)(5660300002)(508600001)(52116002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yo/0wlHS0bfBAz0meXeDVl8zOfYuyXrlfRdHmK93srNDLbAcUwuziYZT9cvo?=
 =?us-ascii?Q?zxbA0iJ9oXbrhI4a9FD0DhqRLljTCcz0sNsPzQ/izIrs7Yg3Kupcnsq8mq8K?=
 =?us-ascii?Q?34dDDlqE4gXckABlLDSig2inYOkTPQlSRRIAUiQrlg6x++WUQRP8Qg+2T+Ab?=
 =?us-ascii?Q?llHQkLpaWLIw4RMVCw+RCO5r9urFfeNQ2R7WONmHIqc1BPkYBTxoDgvByB74?=
 =?us-ascii?Q?9VzsALqs/ctsRnruAtcH6fWSH8Jhe0tEgb79YJKm0EhOL0dbfaAi5lwTES/H?=
 =?us-ascii?Q?IxZZnvDJzYzVegnsJQpQ5F4k2J+PaVTsXEGHA78LzeLi9O0JDym3IoCIC+4G?=
 =?us-ascii?Q?lt4u1cGW1N0hnK6nc9GtAr3LIUqFLqWIcY84d7/zROHzAYK/8V7EaX9F6nbf?=
 =?us-ascii?Q?2WuUT6cdtthcdmUEtZR43xjkuQN2JLGDm9IYvP1pyasMUqUQ2EFaQsdxM4jz?=
 =?us-ascii?Q?wFt6xsmCY+vA03OMrSekTPK43Q3cvb0NxHM9mnl0I2foZqjkhomzgOvsU/Sb?=
 =?us-ascii?Q?Nalpd3uuCdEp/TQWcQGJPFeSFVar3FB7VSRnAvmqD4mMufwH+hejNQzSldqH?=
 =?us-ascii?Q?+7K8krJ/v7O39I3NIkB8sAnGKXgbtFrhh265yK5wgBj9nU1OuSp59i0mvPFZ?=
 =?us-ascii?Q?fpKaOMvlMWovsbE09vwlFvGzS1wwu0xF5XkGJyox38izD2TxToWW9shiEPsy?=
 =?us-ascii?Q?9epUFo3SOyAsfYl2t8zaNonsSIm2OSvnFU2E1ZG9v3OX0xH50i/4+r5F7Fa4?=
 =?us-ascii?Q?o+1TAFiZI5zZpn9UkVmUKwBggcKxLVjXNOv6sbKj2IaWY8KWnQf01eIwiDrn?=
 =?us-ascii?Q?N74Dyo/Ycc+HloOen6NpfwXS1m7eSmkvaAEPCwD+jUCgqpBLB3yyKOHOxnS8?=
 =?us-ascii?Q?4xh0lsWvswMu+Dcpsd0QW8Bs9yVpVQ26Kq0StQc6P1zVmLLX0Iwl0STSsk1G?=
 =?us-ascii?Q?MaZjiMLeyTJ4/xD7FXknrN31ALoOM085SrFHjWo1ef5hfOrFw2Y1vZ6bJp+V?=
 =?us-ascii?Q?tfPvjxuE1lM7NPlD3GGZE+/Lb00tw48R8S+bHDwQCVGsCK3c01QJxXlgTSjS?=
 =?us-ascii?Q?wXJVTmXF1OTnDWD15LdlYV2s6Ij6mocKwGDuRXRhe472G52g6BarxxcN8LXC?=
 =?us-ascii?Q?tefb1dPFbVIUxooL3NEmlQbTx1tg0o7eV2X4Uq1oEl60QlFfNzfdcjTVfWK3?=
 =?us-ascii?Q?Hso9uJubq+eeMUYcYkRdOMqeBBAUs9j2EjBcbOnjzL2OL2g4rHpmthpb89HK?=
 =?us-ascii?Q?yTPA1q7mr3bF8bpSBbkfXlUf0X5+l5gRzrEgT6zWzf1p5cX4I6R2AtDVN/2A?=
 =?us-ascii?Q?yPqd30ubId5EDGYIMdQNmxXnaBWDpNruNYepRg4ScKJJJvAhlZPN0zGNNz2k?=
 =?us-ascii?Q?+hYzqB1NGmrVpgMEDpeCM6n1gVj83MtDh9sujio0uqbM75G3DLpraZaE6uGX?=
 =?us-ascii?Q?Q73+HH09MVFLMA9dY8Hpab3IIqoqBxWkC719xdZ8NernElNVQe6p0BrJhFv7?=
 =?us-ascii?Q?A4rMefkZu2b1Yu/YBsQ8V+XzYJVTh/aWoYv7iWhyEJGBrdVg6WspTUXxUwmF?=
 =?us-ascii?Q?JwvHJktrSCT3mtkiBT29pkJcTSFE+rA1WRa3IS009APgvTaDE/clrAHpcVGy?=
 =?us-ascii?Q?7FWotIp0JLOwj0jEjAcjEOlaA8/iPZJFVcxIoIwKwlkQ0/yI0ldszjbofAzl?=
 =?us-ascii?Q?KWabI/Wsff9sPXNDC+LHXPOyyL7fzlLKkmoseugW3H7QdISa/fHqcGWr306s?=
 =?us-ascii?Q?RY4mWRDh0w=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5dae82b-1077-480f-cca3-08d99937e8a6
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 10:52:45.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Kh8xISVfnTUu0Hi/ppASbcL8TjTSi7iJXD5tCT3HjAfZPw6TtGpSNRzM6p52+EnE6VeJ50t2fMaLeHbxlinvDq6RvgmDhA4s6qNgqCY8vajiNr4gHLfqXlRM9sw2Ye4K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5332
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Oct 2021 10:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2050

Hi Richard,

On Wed, Oct 27, 2021 at 11:45:35AM +0100, Richard Purdie wrote:
> On Wed, 2021-10-27 at 12:40 +0200, Quentin Schulz wrote:
> > I specifically sent this patch before we tagged the release to be sure
> > we don't have the same issue as on 3.3. But we do have the same issue
> > now that yocto-3.4 is tagged and this patch is not in...
> 
> Sorry, too many different moving pieces to track with release :(
> 
> Whilst it was sent before tagging, the release was already in QA and the
> revisions used in QA are used in the final release tags as if we don't that
> causes a different set of problems/concerns.
> 

It's alright, just a bit sad that we could have done things better for
this release and missed the opportunity.

This however highlights an issue in the release process for the documentation.
Let's make sure we lower the probability of this issue to happen again
in next releases.
I guess it'd make sense to work on some helper script for releases/branch
maintainers so we don't forget some bits? I'll try to come up with
something :)

> > Can we settle on a solution? I assume moving git tags is deemed to risky
> > which I can agree with but the issue(s) need to be resolved. Can we
> > patch the tagged release from within yocto-autobuilder-helper doc-building
> > process?
> 
> To clear this up for now I will take patching in the doc building process with a
> patch or sed command.
> 

I'll prepare a patch for patchng the release in the
yocto-autobuilder-helper doc-building process and send that ASAP. If not
sent by the end of the week, please scream at me.

Cheers,
Quentin

