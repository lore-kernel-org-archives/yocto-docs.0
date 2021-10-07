Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E677C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 13:32:30 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.82])
 by mx.groups.io with SMTP id smtpd.web08.11708.1633613547922332730
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 06:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=mThu5IX6;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.82,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6XJygrNNwfV0dbLqsw0O54DbioVpqTzAwsZqDLzIx/VqAbDfI8SspLx65ofTBGr1Bi0PKRNxiMHyGDdHPrankByhPs2aV5N1hvTRkvHCgrb4Dtd5FRGnP0t51pKTmH8nPBv1YDt2S5ZBGQR2FOgcR97p2FsEhrjvWi6eKZgsVFDT9aPKjiUy5rmDat/Ou6yF8zZ/0QnRxc5IsBZ5yLeurp7E5lx6V7Y4fdbwa7jky0opTjv8Rjc2bESJ0cz8PVP1vPnqn/FtUDYhzXqSU0XksZfq7kQU8jBXnTora8j1aenndalREX+pb9SYaUJOK3jl5QTmVo4OSglrYqkeBKzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmOvUd+Leflyaum3/tjmyAadXn40cXNC9OcrwUHqk7M=;
 b=Xzfxu19HUXrfzH1x4/Ubajh3aPdmxTCdsjoPIWG+f7B4rE76t+70hSsr6CWisgHk5u6MvL8bqz2eCwdkIlQw55AKh8EjSImEjq0nSsoLgpgIcE79fIbbRrZmDVF30yHekXkp/Mp1movy4V9wV4R9fq+I7kImn6eT4mFk6lgS2v6v7l0Ee90C+ZkfnF0qzo2I4lh9yG3g0frfu3tEbf2qsA5V7g8ImC+fxVMUxCGrLTMujNkQZucl3BBjg1rS+Uhpnr1yZx+HUmvuKpZ9O9VOXQWiLb1Cx1879bsZ0t1lVMm9Y6pjfgcqDgccTs+GMsq/m1mgYwqeKPNKJwku1ANkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmOvUd+Leflyaum3/tjmyAadXn40cXNC9OcrwUHqk7M=;
 b=mThu5IX6wVOECyqoqWmR7HKEg6B2KgZei0okKh+GJOJLL0H0vl6ceHpB7RILQgvKAYcBGQnOzhu+tDxRgOh4cOiv7kVmS+xQ9P+4a/u5L5cLggm6spkN4LDZErjxJfuqehFv+5zpzkV7LdSzoyv1m8OfAZypDhAC7Ng8TWkTw3s=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8274.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 13:32:24 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 13:32:24 +0000
Date: Thu, 7 Oct 2021 15:32:22 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/4] overview-manual: SVG diagram for the git
 workflow
Message-ID: <20211007133222.5i2oxea6hfgiyji4@fedora>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
 <20211006122238.959343-1-michael.opdenacker@bootlin.com>
 <20211006122238.959343-3-michael.opdenacker@bootlin.com>
 <20211007124253.jx6pgewhaiwako7q@fedora>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007124253.jx6pgewhaiwako7q@fedora>
X-ClientProxiedBy: AM6PR05CA0007.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::20) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM6PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:20b:2e::20) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 13:32:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ff3a7b9-f1e1-468a-24ca-08d98996e5cc
X-MS-TrafficTypeDiagnostic: AM9PR04MB8274:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB827497435B610E24002DC6EDC2B19@AM9PR04MB8274.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MH6zW0TMSjTUokpC6hObWqc/MaznLyLyiMvlL45fgg6OsWmSmRGLXUZNVv3yFJZpG8swShXo0bAGA6gCRqmNqMJzaHlWeoOxdYHecvWXl40ObR8IdqLOjUi3CKEFLEsTrU+YoC2BNG49l5jmVUPAgVDcsdqrxctaMx45pSuyOBG9eX5dzzM5N7Fk509uifVBtTlfyI5ZxfX7OV5wY/YgmURqCzHb8qcYIhTgRBYzV5sLOW8gcEToJNrA7xDpN53rexUTgpnUozDk3aOyGnlztXHPp/eRXh6jOnx8D4hFKeiFJK9SqKbyOEfsgL/IicmfI3nG2hiO9JVKCpecUd+7h843O3HpU+nXZ+WEibR/A6s/RzrQgXWU8SKk6yzxm09qt5iwqhc4SLn/5qOIYNXcLh1u9uJ2EBYugoHCd4wl3PQ/EORj5ueX5LzdPhCzDhTABJMOd3JoTW/YB2JV7qv5d45o0fbIE5345aU3csEpiMsJTpB6R4+lIW9HR5e3OcleDraHKPVvVwqu0Oq+WM0vYxDXD1ScH71qjlYZJ+Ccj/CYvOVELJtrhdUAr5x3Vag6NCbp6tnku1/YAjdzY7MIBUVXtmyyWsWuFggIRrdLY4suXuHVl3Azuf0vHpiC1prDtslAi6lyiIv3z+LMT9IWFTwRmPGyLz4sf4qa1S2TO5nQznSV82AyKv7cKLRJhykALouAK5p1aGZFmy+5C4uzYWtOZrElGVM6dEzKRO6YVJT0E/+tO+H7OHIelKjH/gx8KUaAe2oALTJzuF2cXwfVmmnV/28eDnGVIdxH4j0lsuk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(186003)(6496006)(316002)(9576002)(5660300002)(956004)(508600001)(66556008)(52116002)(966005)(8676002)(83380400001)(26005)(66476007)(8936002)(9686003)(55016002)(66946007)(38100700002)(33716001)(86362001)(38350700002)(44832011)(2906002)(6916009)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0TYjPdRMUTAf6DIIW1G5inDQTgVeJ5drv1rZUohhwC8/U3e3cpgrIeEmM+IN?=
 =?us-ascii?Q?7j7rCXwX+I3KzdF4ioBaL5p0PQaX7YKZkYxD0uAcFv2n1lFKnuetLFM/bQxm?=
 =?us-ascii?Q?3jB8fdILMZ0b2zWbyqLc4nDRDlRtbVc0Uec5FdcXszggxKcfyIM2I5KcUpWP?=
 =?us-ascii?Q?QlIUARLqmnMpE69Fa6EneZ9FOZUr80A/6h56hUjjKRuD9aPIKe7hDDq4+sHG?=
 =?us-ascii?Q?D+OA7/l7bCr39FdT4JtvGfqSNKvSh0lc/d8RQ3VjZQqMhFmwJlw7H771ILfZ?=
 =?us-ascii?Q?96WmKNL9WdwObLbHdRENcyrb1Z+KwUQALoSIhOvrMUmG8VUPM6f44VXHzUoI?=
 =?us-ascii?Q?9kpTgm2Uo7WEwDe768zphVGnE7/Q/9sMaMJVa7/0j3y9NlJ912CdL14PwmuR?=
 =?us-ascii?Q?vQeFqTU8Ru32D+p5UeEt8LdJberLQdKlrjVsDkqTCyos3ZpuCg9a1cKQf7H0?=
 =?us-ascii?Q?gczfUb6/hjWP0k51eGywS0hsT7+mNFzi/H+ZUtDZZkT6u2b4DZaFvMB+6Z0Q?=
 =?us-ascii?Q?DkNViAxXd6CXPIApwZIvwyaJ0q4uQBibZgi8MCm1wnmWH7df1rnY+fAUMD7t?=
 =?us-ascii?Q?Ar1PrKA5IZx6VM0PvfXIaHlWzKHgHLnVno+14UKsxf29Jplfjcs55kCnlp1C?=
 =?us-ascii?Q?GrwqZgji1JwTnzOva07I4ueyRU+8tovh6n/mmMwaqmbvED7yLqnHbb17jy/W?=
 =?us-ascii?Q?zRppDaKrk/pCh4APmhiRuTJwgKSaTx2c97VP9I+syipIO87cCBQO9TqegQqS?=
 =?us-ascii?Q?PLsadZjSwxtE9AQPKHv9/1psXdniU2CEA+V1frHGBdD5nRbe1WwJCw6xvtQm?=
 =?us-ascii?Q?vhqMbhLTNUuFhPGLdaKhN2L13pRwkg70iwgUnNoRzq+Oosx5dE17uXb3Ue55?=
 =?us-ascii?Q?oeaQSqMm3zQVVVuVAla3K1eYTxjzTnNiCmUDwhLulvv2WiTBxKqoq4hDd7rJ?=
 =?us-ascii?Q?xmG/8ozqPPEnc4ep4trQ/I2OD5so3MdzXsEjMklBgTKcjssir0s0hJmGTpHx?=
 =?us-ascii?Q?MpynlCBxDqGEwjgNXsJ9x/XODka2KIEwfatJpc5YldtmQRYMKqkIeBacP09V?=
 =?us-ascii?Q?rmdv5aUgtt/Ut0+ThPhxbNNYymHNzptW4Ibs6/LWbPwownqDcQGI/CMf0I+Y?=
 =?us-ascii?Q?5oRb4ufd/QePippZDjSk9QkvsKd9uSLWwcePTL0PdQfroNc88tyqy+FZdCGI?=
 =?us-ascii?Q?Aj/FeNmwBnnVZ5PSdGWJW/EuORd7qpxrn//I1ds4BscBUEflXGCwzQ35SvdW?=
 =?us-ascii?Q?AsDAiHnpFar4DMsfr5t+tpfX69Mj3GzQgzgDnjuOqlLIDZFYjJp43/6nG7jn?=
 =?us-ascii?Q?i6VA7kRzjGxbvQ+ew9FJMlts?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5ff3a7b9-f1e1-468a-24ca-08d98996e5cc
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 13:32:24.4665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PXabaLhqz6VJujma2MJ+z+xildnUxR++tftuSnBSJkvPaK+G0LH8nvKsYIb1P+itgKIbxti4GYTwEp4ovUCxdACm+q+uLB6i7/VF23fhGfUrTQNOHGtddZlSdFygUh3a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8274
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 13:32:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1949

Hi all,

On Thu, Oct 07, 2021 at 02:42:53PM +0200, Quentin Schulz wrote:
> Hi Michael,
> 
> Found your patch in my Spam folder :)
> 
> On Wed, Oct 06, 2021 at 02:22:37PM +0200, Michael Opdenacker wrote:
> > Set in full-width mode to make it ready in PDF
> > and EPUB outputs.
> > 
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >  .../development-environment.rst               |    4 +-
> >  .../overview-manual/figures/git-workflow.png  |  Bin 26586 -> 0 bytes
> >  .../overview-manual/svg/git-workflow.svg      | 1205 +++++++++++++++++
> >  3 files changed, 1207 insertions(+), 2 deletions(-)
> >  delete mode 100644 documentation/overview-manual/figures/git-workflow.png
> >  create mode 100644 documentation/overview-manual/svg/git-workflow.svg
> > 
> > diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
> > index ab155dc3b0..d719ba69eb 100644
> > --- a/documentation/overview-manual/development-environment.rst
> > +++ b/documentation/overview-manual/development-environment.rst
> > @@ -286,8 +286,8 @@ develop, test, and submit changes to "contrib" areas for the maintainer
> >  to examine. The maintainer then chooses which changes are going to
> >  become a permanent part of the project.
> >  
> > -.. image:: figures/git-workflow.png
> > -   :align: center
> > +.. image:: svg/git-workflow.*
> 
> I guess this is due to HTML rendering including SVG but epub using a png
> created by inkscape?
> 
> We could add a comment for this maybe?
> 

Answering myself:

https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html?highlight=image#images

Depends on the Builder and its supported_image_types setting (first
match, from left to right).

For HTML, it is
https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.html.StandaloneHTMLBuilder,
svg first then png, etc..

For pdflatex it is:
https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.latex.LaTeXBuilder,
pdf then png, etc..

And it is overridden for Epub builder in a patch of this series.

Therefore,
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin

