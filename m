Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.45])
 by mx.groups.io with SMTP id smtpd.web11.13966.1630310128652213519
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 00:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=ARP6gNWD;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.45, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQX68yaBqWgys1KrNkbNAcjvcPiqdD01lLiIUqPNqPzRMNjhRVWDGd3T/eIQjWb2aeasvkj69pK+H/mKjVXR+PkOPOkxL7NJmvsmAqvmdNzu5NBQ9q3gSXZNFfJB4MRN5KJuTjyV5x5loBYdaMw3aFzYoqR73CWC/WKCjBrwF7wOM01meePfnGCId8irCAFwbQC88+DOZPg8SwvKAEzEfUHgM/hcruk+W0X9+hX4v1aUbdR+eyILuouRssE5dmMtDtF+aDDoipjT1vWcDnxoUeKM3tjTmFeT481RlxbX6yIPD1PYyAz2ZBq6X/bIIktY168934za0On1EURm/Dxe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmDz3QtE2OAzA6YIOGmiHWF/l0insEIL5lODzRH1W8g=;
 b=F1bNyWJYldCrGqJ77wCkOtk/UDfZ3/Gh863yJ6MpgF9hzC4m2s6AVcPIEMK4qzkdgozbrsj6MYoQEa5BCSwjt7OF3Px4QRmN6z0eu10bPPYOaXNoxAaAGlY0ZgfqxFiXA62OYU7wLBi8IxlZY2u0alGDJabJWeUHKLjHZQ4OFbWIWw7pnyG8PMikO9pQ03COtAhNoLsqnjaL8uBOgLCaouwFmKjGsUbh/a1ffjATdpoN9pIKlFQWtXgiXtrAuNzPhSF5eFyMV5+66GH5nudVgu6Cji/c5MjBKGuDRKkSTHRnw5qsmXQc2G36MlZvFt9t+6nqPdE3Yl9zmDx3Q3GsUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmDz3QtE2OAzA6YIOGmiHWF/l0insEIL5lODzRH1W8g=;
 b=ARP6gNWDYCDCz612wcDUfANKHK4f0wAcPHT1EBZ2eeoZfc/nnJxAoyrD46AkYe1hdfAw+PAv82IFGG9lTVaw01M4L0d3skMMM41Guj2IfVtDEXbuaIV4y6JugNRMeK/KJqtHvYhRKgNNizQYRT7dFTFH8T9wgIxpcuZrRpE3GkY=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7908.eurprd04.prod.outlook.com
 (2603:10a6:20b:24c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 07:55:25 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 07:55:25 +0000
Date: Mon, 30 Aug 2021 09:55:23 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Khem Raj <raj.khem@gmail.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] are autobuilder links in dev manual correct?
Message-ID: <20210830075523.cmkrmdykafh6vzxu@fedora>
References: <169F8C1A79CD3C8C.14757@lists.yoctoproject.org>
 <2fd1d1b-e04c-cfc7-53cd-63352de2c21e@crashcourse.ca>
 <82b20807-d987-e29e-4a9d-c8c5cf1ff524@gmail.com>
 <143d69bc-fc7-71e6-f073-2757606859de@crashcourse.ca>
In-Reply-To: <143d69bc-fc7-71e6-f073-2757606859de@crashcourse.ca>
X-ClientProxiedBy: PR2PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:101:16::25) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR2PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:101:16::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 07:55:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d803b2a-3fc0-4360-e824-08d96b8b86bf
X-MS-TrafficTypeDiagnostic: AM8PR04MB7908:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7908C93342E192701F41AFCBC2CB9@AM8PR04MB7908.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bJ4NCJFm59CJfuOF2c6wq8nGaF49qWOSMd/QwGXITw7ToDmhyLiDidMXjw9c/ZgVnWrmkwX1BsvJwlbggZ5peVCF+hTA8gexJkBQ82yUdrwdvDqfcI02YRmOcopLgNyRKvzEnPab6wbgrYEte4GAERwFfxPInA01fb/rvGfWIR9i3nIdQlbCCbrmmC14hqcRYofdQfOAoFKZIhUDvgHsZN8LqiBz/Y8VAV+mJ59een2PXuxblA/ntVGJQipX475hxLYtKX/calqnVb/NyJTUv1usAa16/zelTWtKMo2MSjeh711pYCVDfGiw2M8GFO8ezwLSmS/CsYl4ZWRGxf5eJCYU6RqtltZWAokv892JpmUDejijhcDy1vwJ7ow0B2Kr27/6HCCae6ocYiAyODIqZg0+9uqlDu0mFYzw0haTupWxw5gkplzeE2UocoKV3wxJvaOCH9GYPNlkKRioe8CjbadqveLPlZY9GhqZYChavCfQluXry2MHA1/KcA/BCoQ+PnnLURMAFwwCsLtCYhLz4Heic7o2k2g+39K3QoBWgL+ky77vhSuVFhN/sL2BEnPHLny5wGXMKuvonH4NQaUBjXoJiM88X3tXebsaU6VFb+c2rSUcKQwnj1xBOzufsmO07Yf/a1LPDyHeFog94Smp5mhoXjKa+NmrOD3Hf17m26wIW1AY1tcXj6r1MtbiAhFxLCReU6NcRHk8J/1ZkM+90oFkgtbJqxri3SNz6fMjy689sIQRtzfHxYExMHHl38Mz0WuQdqZwj+0wHJJhRTDRwHDGxX2AUNHjrKsd6H4hiC8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(9576002)(4326008)(52116002)(6496006)(33716001)(966005)(44832011)(8936002)(6916009)(2906002)(9686003)(83380400001)(54906003)(316002)(38350700002)(26005)(1076003)(53546011)(38100700002)(55016002)(956004)(186003)(8676002)(86362001)(508600001)(66556008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AzVz20kEAuf8DU7bNLtVCGx48uUXjkim14O9FdYttoZC0OzJIW6KzcZhSIWt?=
 =?us-ascii?Q?MH9XZkIJhasZVCoxsfx3Rr8YVkGM0Z92kC+3cN3f1p+Q1NwaQ/rGy4jcbFl4?=
 =?us-ascii?Q?bsIxu+U2T2laMcRtpHbb37e6l2CDU3V5KY6vmFFw/ikJwyI+Vc8K070IGv/G?=
 =?us-ascii?Q?IlMlO0tFs1qUH3aJWWji1ZGxl3YXVRQ4zihOzTWCud2QuX6Uziu4ATar7BdA?=
 =?us-ascii?Q?tw9x9ETQpei+sns15rtVOaA+NGYf1DLCaftChwt0Z1Q6sFYE4H1wQzYRkOh/?=
 =?us-ascii?Q?BFvUyWT9RuSEP0IeksEEz/7CAQtOYlXC7REHwGEcjiHyM6cFWY0oSJqCEgss?=
 =?us-ascii?Q?LSkm8MlGS5kfbzibuRhxOPEESHYMg8rPzveuNz3BU3jW/J1mfIbLdi2ixuyT?=
 =?us-ascii?Q?9mJPW7j15ApHbuFzu1XFwPGsosxbjrd9Z9qGIVU4y78NZEQjR1SCCPG3UImq?=
 =?us-ascii?Q?anE2hlZ/ZTvgXeC6dupRBQPPArX4uweHRMoWPmWFhGnjd+Lgl4Mero3FbKMS?=
 =?us-ascii?Q?zpY7ILOWKXHYPjjYy7bmEFG8+1EWtxwJCYndneN/e1uJJwp0pQv6/xEmoZpU?=
 =?us-ascii?Q?dgeIXfmT82tXk5f3PeRTEu5UFOzqjvGA4t9tSW7tJQid8GrYQB2mMh7RqV3p?=
 =?us-ascii?Q?rhz4hKomtHx4lASF55zXc1RkAZ9ReXOPDenmi3iKEKFvJdFc7A1LEAN/rj5v?=
 =?us-ascii?Q?8WMFQvfPKSWgsIFcLkjmGH/9qLml0BPisGuUvqMU1rkz8gbZJTsCvExKwxgR?=
 =?us-ascii?Q?gyVhOihVleyYX3z6dEgcuEGAyoe6HGHuDn47CpGtpang7Qj4VJQz6gCwa7bb?=
 =?us-ascii?Q?cDo5m0Ld/xW+ujNY0XiVMyTUk9EbLYx5BvhpbCfuieIFeMmleR+ObkOHfzjY?=
 =?us-ascii?Q?cGwPoI6nDmhNuqr7ZFah8H7Xe89I8q2lFbMhY9emyF+n47EtFf4nbD/vngmH?=
 =?us-ascii?Q?PZutk7ZKA1mYgla/oniseaYulO9uzhwGFVY11ePZRRmdWSEJVfmY7aG7XwYN?=
 =?us-ascii?Q?7vvGTjvo5+zBUu21N0kE1omq7KRHojI6q6+ZrtslOnO+156kql6wdb+Pkbar?=
 =?us-ascii?Q?na62YhKb8t3k2qOzUS4LEFsUuVbadsin6OAEw45s3qhunjRIBgSLJXPxsZ6o?=
 =?us-ascii?Q?+mwPdy/fCXNY8uCyLsREuV1ijNGK90nHyH3LJ4LpvN1qvbdexy/o1GfzOtE9?=
 =?us-ascii?Q?wwajFzx/vOJwEPgNPGi36ZfcYCFX1QdAnB+s+c/F8IxG7SGetSL/AF4MKOfu?=
 =?us-ascii?Q?KOtSh5tfINmZ7uYRoQm59JBvE/qvfwVs+KIn8cjUk8/aEz/DdnFzf1G+CkU4?=
 =?us-ascii?Q?kyjIHXIrXjPmv9d6g4PeNxal?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d803b2a-3fc0-4360-e824-08d96b8b86bf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 07:55:25.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjKxXTrzBu7Kg/Lf57xU+4wmyxYECJkXcDZcuP3CBsHm51kSkLuINM5TYWM8HPb3lY5S3U3HXlcXwzYKttsI5QZxun023MKNB+IRpeBLbXUa08G89fZmlrR90O5SC444
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7908
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Sat, Aug 28, 2021 at 03:07:53PM -0400, Robert P. J. Day wrote:
> On Sat, 28 Aug 2021, Khem Raj wrote:
> 
> >
> >
> > On 8/28/21 11:36 AM, Robert P. J. Day wrote:
> > > On Sat, 28 Aug 2021, Robert P. J. Day wrote:
> > >
> > >>    here:
> > >>
> > >> file:///home/rpjday/oe/dist/layers/yocto-docs/documentation/_build/html/dev-manual/start.html#accessing-nightly-builds
> > >>
> > >> the autobuilder links in that section don't work for me, what should
> > >> they be?
> > >
> > >    sorry, erroneously added link for local build, here it is again:
> > >
> > > https://urldefense.proofpoint.com/v2/url?u=http-3A__docs.yoctoproject.org_dev-2Dmanual_start.html-23accessing-2Dnightly-2Dbuilds&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=35K0dvYmo33Pem_k9kqzS3_iUNQ1b4hssM7KTzNXPJk&s=iEjvNL79Jfxqyfbtp3VxCM9Og3Ul_8zYYq3j1oVlWlE&e= 
> > >
> >
> > I am not sure if there is any nightly links like they are documented see
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__autobuilder.yocto.io_pub_&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=35K0dvYmo33Pem_k9kqzS3_iUNQ1b4hssM7KTzNXPJk&s=ReiGaAp5QczI9vvI99lLhhtojzuc8QIvihoiNeTCh6M&e= 
> >
> > perhaps it should talk about
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__autobuilder.yoctoproject.org_typhoon_-23_builders&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=35K0dvYmo33Pem_k9kqzS3_iUNQ1b4hssM7KTzNXPJk&s=A9unDo0cwDOYAIs-MMJiTzpwjaGSx9evwz21JQOSlIg&e=  perhaps.
> 
>   that's what i thought after a couple minutes poking around ... can
> anyone confirm one way or the other?
> 

All I can say is that the link is incorrect. I noticed it when fixing
broken URLs a few months back but forgot to note it somewhere or send a
mail.

I couldn't find the actual link that was targeted since it's not
pointing to anything valid anymore and Wayback machine wouldn't help me
with that one :/

Cheers,
Quentin
