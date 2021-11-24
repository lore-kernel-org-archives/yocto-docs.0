Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE520C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 18:47:12 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.79])
 by mx.groups.io with SMTP id smtpd.web10.2279.1637779631100166816
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 10:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=f7Aqkja2;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.79,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1OsFsvKhUVVYlfzoPqZoBKDaw4meFqkoTBXbnqWMnISrVkJYrsVyc4/buSLyDg7MmUK+/Pc8fD9P3dquoBq5+UlV008oP+s/RzlB+/roZoFBkeBubNBIOwU5Or6qzBgbp/YOdOMxB1zNOmlE3dAQYVX+x1j+sSMN2DXd70PjJABKRrcA5AoGuxxoOKrNDjK4ZVsJvF91coX2sdIdVG1FBeXbyrsq0flMmmnhTzp7m2THJtcb+/ETLI8deX2CXJzDoRCUCaKg8nGDlW/HD5oIIcYX7WEWpWF1op3cyE+a7T942sc5bAraIBxMr3H47+ZFxZ6gxmUxAhFWS9zs5wOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpkLbd8YNmNUBYLtwvJxKQsq+uQLwRRSVqyDPqy29d8=;
 b=XJcydlIalH0rIgdYSQAl6InBkL0zOy4Ox9RlwfuX5p8V6b090OXRoQN+8B4nXKf0MSjbCut02SawE7sifAKOMWwM2Fy3yh5sgUoJxJMHHW99PldF+WR9TYibBZx5IvwNf+ilaYuh7158mD2FJmCEi+8I6q/x1iovPNw0p60FSSvaklKLRtk6iD+8mL8zrmXq6Z6dQXryUsqDkl6RPAsaSTowGUbGIk4BudVJEgN/xDdaH/9mf23NA3IaLSQzhZvbpEiUkJo8ltBe82Vouv++jqB/jpFbRvrWrbg46P8Q3Ywgm7qZ3q7s/7bqePJzvqFeLacx2psubooVB4YS++TBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpkLbd8YNmNUBYLtwvJxKQsq+uQLwRRSVqyDPqy29d8=;
 b=f7Aqkja2pjqnAXeuX2Ud8HhJO4agnZo+qp9bPAhd4VVhdM831xzwJafzJg9NGeMwCHjnVoic8w0jAOBD34VV0Zk9BW1IGRr0TPTk2pEd+RQ8OnXb3Lmu6r53l7/x6cVfrAHetACCvKOevY3ndDJNHN2COaqM5whx6xQ2K4hOa8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6689.eurprd04.prod.outlook.com
 (2603:10a6:208:172::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 24 Nov
 2021 18:47:08 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 18:47:08 +0000
Date: Wed, 24 Nov 2021 19:47:06 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 remove gatesgarth
Message-ID: <20211124184706.xtqteak2yy6cv7sf@fedora>
References: <20211124171617.2088604-1-michael.opdenacker@bootlin.com>
 <98664c40610ee3163638a373f105f29c9c70a912.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <98664c40610ee3163638a373f105f29c9c70a912.camel@linuxfoundation.org>
X-ClientProxiedBy: AM5PR0701CA0050.eurprd07.prod.outlook.com
 (2603:10a6:203:2::12) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM5PR0701CA0050.eurprd07.prod.outlook.com (2603:10a6:203:2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.13 via Frontend
 Transport; Wed, 24 Nov 2021 18:47:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a348b367-96c9-4ea7-439f-08d9af7ad12e
X-MS-TrafficTypeDiagnostic: AM0PR04MB6689:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB66890D5AA722DF13EB3B9354C2619@AM0PR04MB6689.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zDKuORKtMeuT4XDQc/ewgrSeOG91ZdFHBtlAUFLS9zVGGvvBdMmYt4gN2Mz00+uc/fiKOMwu+2IkhvuNJG+HrQ9oi9f98nRr60CxiCR7aHsHSbGZYBHTiR1tBWiOocpcP/+Ots9Yeu1BLsBPnhMSkplE5pmEIjmQHPXOszwcGVwwSbVxGvpzCXZu0viWWd1d2UuMfIJUOp15wjqcB12OXlwW7tW7Rj5ZixLRIsBNiOij3mbRPfORD4MmHDAX85ryiLvFwWljagRNxkc+SMdiwuE9mqgMFnF3qboV0aP04vc0q9sawsvFVb93Y3q7PbDKLFkd1EZWeN2c3LSWrkXjMpE6Yg2t/X423Lel+NdBACFc819oNtdgpTtuccqmoSfzmoKN01rM71CQ57hClHlsoCZId/2t4GY8D5PjRq2wiOabQvRa613hnCMWbr/m3OPlHPDRcny4CvzwGShNa7eYi16ncV6T+e6T3BDrZyuht7BOF1plNsLUEFCh0ChddF4Yvf9jL0hSVgTMhmfvpVj6fykfNBvhEskqWmj1ZDGpKZy/RSGhbpF4SnVGlHRm0ock3IomYJOIKrJs5kOhG8Zpw91OEjPD2LkFEUKn7p55l1vat810cnhFqlP0Op541RN7lXo51CcriFi1OP8MghtyicBXq5+nD18wlIswke6/4AHfRHvT/ow88vTrAZ6nSbhUU/CfrKzjAn2umpkMbZbCIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8936002)(9686003)(83380400001)(186003)(33716001)(55016003)(6916009)(38100700002)(26005)(44832011)(4001150100001)(52116002)(6496006)(8676002)(956004)(9576002)(4326008)(316002)(86362001)(66946007)(66476007)(5660300002)(2906002)(1076003)(66556008)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vr8iWlITT30010UWvvdrh/BW/Bo1mo9y3Z6IXWd6qLJS/tYp9Rk2L2GjWgTL?=
 =?us-ascii?Q?jD/gdWETW1kIEVzmB/ZS++SILV4bSSzN8VNTQGG9Mc+jlK/EcNstO8XekVtR?=
 =?us-ascii?Q?HNSTiS8rstV0OPnBMFWjiEArPLZE74n/7Wn60Snt/VYJNPAdT8fA1boLlU8h?=
 =?us-ascii?Q?yFobT2U7bwXhB4k+3IPAGQRGYNbEE6Fjo2dlAAoXjL4W1FF54o7sCu3qLrWZ?=
 =?us-ascii?Q?c/gNhDo/5fRHcvIzVPJckzRGDXKf9axWrSNMSYy+1PoRgfhDMfBjPneiu7gP?=
 =?us-ascii?Q?3LL1kguEQKH3nEXyeVfSKktfq/17+TnU9oCuEp+DbSJbeIPUiTtAva31J9En?=
 =?us-ascii?Q?VMCX+jOpjyygc6/dnJEjC4XWZgZpbmjLFkMTKs3iPd/IkBeAPVUR2BVlAEWI?=
 =?us-ascii?Q?J6qPZnCmU+nDmR5cvsJbdOxFNGuLspRrp783mPfkbvAsuQvzN6n68vjzAave?=
 =?us-ascii?Q?ADoZpUPtnPYoY9FYZApGcyEsxaNxapMuSsNCKhsasBgWRtpm+Or1SGGf/d+j?=
 =?us-ascii?Q?LcKCCugaQvoOlz9v1fcoh/aE/EIXtvv5pGYqWB8qpXW5DudNIhWV+zBeRng2?=
 =?us-ascii?Q?JVwt7bHgazxd2TeigScgSDKYdlL3SyiQYS1NRXcWV83GQIszK7ixyZ+d5Ht9?=
 =?us-ascii?Q?TO3Jx7sQWVbYvnvd4/Tu5M+bywN64TKEkkqXee1mJUeIBwd0QTAqNPqjcOEq?=
 =?us-ascii?Q?1IUkhcpqh+v3Wa4rGXNZqLAaUkFVY7rRqFXjdVqkq4rv5gop8CEwqhBY1E75?=
 =?us-ascii?Q?GgJryygjv5/Z9XdJP4qqBIpUljXS6XkNTjhjDEBZ2LzYp/17FqsXEyhXyrpi?=
 =?us-ascii?Q?4cJj2+jQ/+rrpd5QBu608m9pghxDF0X1ITawxdNeJiZ1BFqRnfXXNMBalg2n?=
 =?us-ascii?Q?6sW42L4c6t9x4tusypMaE0jWuYGkUkNJJ2pb3WJAYLo9CtrwRGNU8VOjzdZN?=
 =?us-ascii?Q?D8cu1l+d4OOAa4d3C06oJujRPZda70/jBiwWrOcyhfS+XATPdxnCjQPnIL5L?=
 =?us-ascii?Q?Q5dLaVBuzAv99JHRLhu3bVRJIxhjMFebK0feircbfqO8etKuBD5qVcCFw8WC?=
 =?us-ascii?Q?VrKb3MPVbKQ9EwSbe+4M9rif0/PoKpR45X0jEpBfvNZpwJbDzs07w+D7mLAp?=
 =?us-ascii?Q?sJiDJzZyUFfwjR4Hp7eR5ROuBZUp/IoyzXbtNFNhAxmjRVT3Vv42PbeYR/7j?=
 =?us-ascii?Q?bEyb+iG3v+qp0VqerVaRR3KgkU6c2/Oapm2g01DOAl7bdv42z09BaXmtPvn6?=
 =?us-ascii?Q?inMwryhuGlrcaRvoX0DIyiWmRFB7zi5a4zlHxiebAb8/dcbZQ9c5ZO6DjShq?=
 =?us-ascii?Q?FZijv3QE0mDQiqktWbW089fArf6a0Gb/G0KyDkHQEHmdncRJ08TOPOChJI/b?=
 =?us-ascii?Q?Hm/WEZwu7JWd82SWeuMD6ioemblbroYMwrMbaByCyczle3wnNxmTac/38wVC?=
 =?us-ascii?Q?BoGnw651YeHSP1eyFFlunCk7ja1LufXUWkEvVtwRf5qq5w0s/qLLY3akobHT?=
 =?us-ascii?Q?vhhQeMgOjIFp7/lfXRDYBFA4O8C0t0c7zPEaSs/u4qzN5pG1jIrBwfxXvfx6?=
 =?us-ascii?Q?aeTpeDvw4ZcfHElbLVka6fekWOETambsmu1CvxbiMna7CCDuyw0qC3ejLZvK?=
 =?us-ascii?Q?ey2nIqFl37BfosCpTdW0qaAODbz7uFeI3tYi+6nvQ+BoGSqmB7k0dUuSbx1c?=
 =?us-ascii?Q?G/SoAUxEzCI6Ec+pnS/rvHBrcGxj9DsO+l8E7lvZNoc2ZeXkcsEyn4ZTN3LF?=
 =?us-ascii?Q?HavGDzrdqA=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a348b367-96c9-4ea7-439f-08d9af7ad12e
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 18:47:08.1316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7qNZ766Mn1sXbhQk2HsnU3SUjY/qxqBO2bcBGYitxFpud0XjHrjzW76TQSvuXRaNuezDXtcMXvFj2t6wne7kjDIi9CJqG8xvMxPj9ssApvIwY8Jeh9LTRZtPAFWo1RGK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6689
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 18:47:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2195

Hi Michael, Richard,

On Wed, Nov 24, 2021 at 06:10:56PM +0000, Richard Purdie wrote:
> On Wed, 2021-11-24 at 18:16 +0100, Michael Opdenacker wrote:
> > Together with the corresponding Bitbake version, which are no
> > longer supported.
> > 
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >  scripts/run-docs-build | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/run-docs-build b/scripts/run-docs-build
> > index 3db4a97..5e1d649 100755
> > --- a/scripts/run-docs-build
> > +++ b/scripts/run-docs-build
> > @@ -35,7 +35,7 @@ mkdir $outputdir/bitbake/next
> >  cp -r ./_build/final/* $outputdir/bitbake/next
> >  
> >  # stable branches
> > -for branch in 1.46 1.48 1.50 1.52; do
> > +for branch in 1.46 1.50 1.52; do
> >      git checkout $branch
> >      make clean
> >      make publish
> > @@ -68,7 +68,7 @@ mkdir $outputdir/next
> >  cp -r ./_build/final/* $outputdir/next
> >  
> >  # stable branches
> > -for branch in dunfell gatesgarth hardknott honister; do
> > +for branch in dunfell hardknott honister; do
> >      cd $ypdocs
> >      git checkout $branch
> >      make clean
> 
> I'm a bit torn on this. They are no longer officially supported releases now but
> it may make sense to rebuild all the sphinx docs in this script rather than some
> subset?
> 

I think we want to make sure we have all docs up-to-date, even for the
branches that aren't maintained anymore. Especially since it's not
taking a lot of CPU time to build them, it's fine IMO. We could always
make minor changes to old docs. E.g. the releases.rst might get updates
until we figure something out.

Cheers,
Quentin

