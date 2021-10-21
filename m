Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E92C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 08:38:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web11.6611.1634805519027696336
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 01:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Q3i8vDlY;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.89,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFN64o46GJaECQDXnkXWVasIsqJJNR3/Urh/aUcF/dyXix/I75OGOVMmIx9qMzGfGhjMgTl1sjRy2pCAyRAq8eLSsijpSn3vEbqoGjsutP6ESyytpJPo5cwW3ZCKX6FtFsJA/FodYIpAov5ZshxPfMpNY+KQlGgI4+QDz1OcwGTkXJXPnqxg0iWptvC+MOVWYDI6sso4A4nlqQO+Tsv1Iw4TCie+yaQSy+hvtXlFNgt7MJ2vdJBXjy8Ix8oFuBGVgwSG7SvrJFGMwZ3hq7ITkefLo7rrq/1dzrLB4cfDYkX+U8LaQKu8G4SXD/TNRn2M9fvrpbmvtEfMMDW/ZEbnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxnCwqkM6Cx+fNjnsL6hUujoMNtaLy/GXt92+qDvESQ=;
 b=jS5Tw5yrH/Xi5s6hOalnea1fXvBTNjD9f9PnEpHzFOVl/Rwpxi4DDLN9jLp7wqk8kgJ+xihJ/a48CGpiQsYoQexfk2afx7TAg/YB0r7P5cokktP/sMcXlH7MNpOcddYAU9wu8qKG1AvD93nVNWvmYSL8nxe6XZa8rJgaOnQ0qhBc7UzL9QvwTEW8Pkp6nQZBBTsxTc1z1FiOBzGEurgUf+D5NUsgI9DwxLyJFGUlxPYiOk38oq+sZPiArfq8X/xyrecH2B9kstQBD2lyWPTPMist2mc6Tmn5R351ugokImm344Oyg/c8VQyHBvqvoKOF9Mje/cH6fZWNC+Ma1o854w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxnCwqkM6Cx+fNjnsL6hUujoMNtaLy/GXt92+qDvESQ=;
 b=Q3i8vDlYK7fBoB300VMQeXtMSuTjrnS/uxPbsaDO4Y7ABKGaJden6/BqToQNlEuAqRwS2MrGxttcWZffVDSRq52/6ovDdGgxYSOEVrZSmSVH7XBkO9S3FvDeKkLxZgS9sogG6FHwX1JXOF8L3Az9Rr1/xV/Gk3jiEC+ZgafLqSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6515.eurprd04.prod.outlook.com
 (2603:10a6:208:16f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 08:38:36 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 08:38:36 +0000
Date: Thu, 21 Oct 2021 10:38:34 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: docs@lists.yoctoproject.org, richard.purdie@linuxfoundation.org,
	michael.opdenacker@bootlin.com, nicolas.dechesne@linaro.org,
	mhalstead@linuxfoundation.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [PATCH] [yocto-3.3] conf: update for release 3.3
Message-ID: <20211021083834.k2rkz5robufkdkyn@fedora>
References: <20211001153924.93354-1-quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001153924.93354-1-quentin.schulz@theobroma-systems.com>
X-ClientProxiedBy: AM6PR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::46) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM6PR01CA0069.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 08:38:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15b0cc80-8249-47c5-8bb9-08d9946e2c46
X-MS-TrafficTypeDiagnostic: AM0PR04MB6515:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB6515C8C298F5BF6C714D6149C2BF9@AM0PR04MB6515.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/Rk6XpVqHYb1PJyOjuTSEaMA0B7NdcRGQFGtWrI1qsoFlYbJ0h3LfsnIwysoOrd7ngYks3yjCiWkXPGZ7atTEh8pXIzboTiYAkng2j9GHs1UHAUhmIgBSSLBlU++CtNiuFjjf5BZXLLyXLW5mAE2ae/9lzkWO+MYkWl5cH7LOI2O3TjHLCauN9uO1PMB9k9va0YM/iI1jviG/SKldeoJMF/IOH1TJCr5pC74IzUUQ44q5XzTeVt4AylYHL+Cvwn17u/jCoyUHarv70vLfh2zy2m9vp/ZH1kmj9cCp+zs2PdHAyIJ1QWyK4bwnIZBbazHLJh7dn2ruXX+XYmViqDbQcZ1uH+gn65U2fHDsYH/q9zJh863XwMIJfv30C6/jXmmZZkRAtbKz7cfvRTxLnmrhid+ldAgW2RpTiLflfBtr7RKUpCZN37tPOrDqEvoH4HKApt6jtbKUTdgsHktru3Wgxt4EiEr7vvo7Ny/yjDyxkaHiLvI5T7mdQghYELlCBNVW3ztNwEEedja05Xyc5UYq1sw6n4pokKTncNo+pv69Ts1Cm7l+fAWcm40XbMu9gYyXtZgJGw7g8NjQlDrcCzXeQ8Hj6m5HWXSeEf716MA4E9ynJi7uXkZGz+O5qhiIbOaVsLpB408/LhidunVLGA+ZhEyuYg4G1Ft2mkzpnx0JqCKYIiYHEvzzXmga+b96aa2S9wjXwhDmSS+t0+FqDJI1IitSfB4i1EkbRg6vY8eV82pcs7Oqub5ZCdca9h3o729I7QF9fnvc+vY0/LtUaO3l4VrEfdniV3ehEMORY1NzPA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(6200100001)(52116002)(33716001)(26005)(2906002)(316002)(966005)(66476007)(55016002)(66946007)(8676002)(956004)(9576002)(186003)(9686003)(6496006)(38350700002)(38100700002)(44832011)(6862004)(66556008)(86362001)(15650500001)(83380400001)(508600001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lFT8LOxNfOsWwhE441B9WyfieygX8ZKJsEgujTcZhC8VVWoxcCzi8VanfW4t?=
 =?us-ascii?Q?PieRJqSidll8uN2gmdN/0aMSGt5nd9uZ81Q1LzU0eMd0wRREIYzGWbAj8/yo?=
 =?us-ascii?Q?W7aLZHTiU+ZmGaA79y8Ul0DfsRW87/ia4eRtYdwXuwrZv+tiXRVEv+AFVXnn?=
 =?us-ascii?Q?bQtx1WLHtcQwFFgMH9cEmZhzRQEUAG0b5FZX5ATDmKN0lab2k/hnBhLZFLKY?=
 =?us-ascii?Q?UJAr9muOhHrGXabkjCUiJQMTkHH1Yo1mByWEGadcEqQIDPCIc/1xr+eyOkjK?=
 =?us-ascii?Q?DeGJUvL7IyOEtIJtj1vsbO3iy2/wI8Nqk2Xw98THPlrBzgkOS4vQEDHPKE7f?=
 =?us-ascii?Q?2NTrPaZV4h9HM+MUqxiVlbrMlsSoCSbIHA6Qftyaah5mFcktC//egUZpmB0M?=
 =?us-ascii?Q?nLbC3RC1McG+KUQdryolRxbi3uBbbCXeAiVqMTxa0crJ3pnsB7cJdOEM510o?=
 =?us-ascii?Q?7BQkxVuFECCXdxwM38EC8zc/75jRwFrmpcvUb8KyCvdeaV1/t82Nbddr+2Cx?=
 =?us-ascii?Q?OkxuC/Rr3q97LvzTkTUJpTvFfsZnHZWXO9Igj8AazMNQLx8u5CvFUrCvSTfD?=
 =?us-ascii?Q?sdwo0Xi1aMyEZ8xP8mfHbD5weBq6TbYxOArfKlU92uC1iw46D7AJuopdalHR?=
 =?us-ascii?Q?LXYhkYv+JilWbxjPDI8sA1aX7JtfEPlPAeM3JGTTc5SRzMIYCrdInFuIFUTM?=
 =?us-ascii?Q?8U24+V65v83DTJICvT43kZCtyFs6btGwHyZt7P5C7u4t/YYWCTvUseUh90Aq?=
 =?us-ascii?Q?gaId96lQsir02r0cyXRl++AVzOW59NC1ymUzt9p6KRpN0QwOgmv1jchMeDrd?=
 =?us-ascii?Q?Fw7XNv58rRhgMfnjB8uFm3JrbQu4a9k36phVrcQ1clB1HaqGuBr9HchADzUg?=
 =?us-ascii?Q?/5LM5HmMY/6GHiSaIUCxe/GLW2418DjJeRvFKF+0SejidMsjI/TjTSUmZc3R?=
 =?us-ascii?Q?viGxb046dOP8M+haRPzas3mUyl4zn4arDixym0Rq4u9ARynrINbDFsCol5WN?=
 =?us-ascii?Q?8sixRy1+Lt8epILAkViniSAqGVMcUi16KZMkXloEPbeDG0pbvJ3t1U0qTdSF?=
 =?us-ascii?Q?vRyG4miAzREWymKMtU+fhUL7O50ccwHqRVMq+lOh5b0k2kFA5mtgWCzQZiT2?=
 =?us-ascii?Q?j1qGkDlUTMuV5RK14Cih/4Ln+xm927qJZItMb+fvjq84VNkGVamDeqo5u36O?=
 =?us-ascii?Q?p0crclHK4KAU3lbpDfm7+0qSJQTkDjUA9rqdSM/HPaI+7hk3TFNXoQwLIflp?=
 =?us-ascii?Q?rLeJy0IR59bu2IUSZ2Kjg3kx145rVyKd6YIMr16VlHoBlw66rhp7vImwrrqY?=
 =?us-ascii?Q?sMYIEqphTLWY4PgMLD5HbN0eHaZaPQ7QHUPlsnhX7wDd/uliDBbr0KKB+Q4S?=
 =?us-ascii?Q?EfkqBPR4SGHHWSqrFVT8M6zCL1uKIoFsvRJdHWkIqX9WPvDnu3nuQlcN9ZFn?=
 =?us-ascii?Q?rA5lR8R6Yai5mGjvxN8pADizMDvGA/kkMvMdDfkH+KWzsyP03r6ViQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15b0cc80-8249-47c5-8bb9-08d9946e2c46
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 08:38:36.1549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 quentin.schulz@theobroma-systems.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6515
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 08:38:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2018

Hi all,

Gentle ping.

Cheers,
Quentin

On Fri, Oct 01, 2021 at 05:39:24PM +0200, Quentin Schulz wrote:
> conf.py:
> * set version to 3.3
> 
> switchers.js:
> * add 3.3 release
> * update 'dev' to 3.4
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> 
> https://docs.yoctoproject.org/3.3/ is broken because of this missing
> commit. sphinx marks it as a dev branch of the doc. It also means that
> once 3.3 is EOL, the warning banner won't show.
> 
> 3.3.x branches aren't affected.
> 
> This commit needs to be put on top of
> 0823237e6f4b9dbdf48500b3c1e8cc61696fa2d2 "ref-manual: add mention of DISTUTILS_SETUP_PATH"
> and git tags "yocto-3.3" "hardknott-3.3" moved to the new commit.
> 
> The other tags for 3.3.x can stay where they are and don't need a rebase
> IMO.
> 
> This was not tested but shamelessly stolen from
> eac8b251be5cd28ebec32345562c838dd5f43b00 "conf: update for release 3.2"
> 
> Cc'ing more people than usual since it's quite an unusual request and
> process.
> 
>  documentation/conf.py                    | 2 +-
>  documentation/sphinx-static/switchers.js | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 5a2e25f7b..ab1b2b14c 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -16,7 +16,7 @@ import os
>  import sys
>  import datetime
>  
> -current_version = "dev"
> +current_version = "3.3"
>  
>  # String used in sidebar
>  version = 'Version: ' + current_version
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> index 7a4edc9e7..96efab2e8 100644
> --- a/documentation/sphinx-static/switchers.js
> +++ b/documentation/sphinx-static/switchers.js
> @@ -2,7 +2,8 @@
>    'use strict';
>  
>    var all_versions = {
> -    'dev': 'dev (3.3)',
> +    'dev': 'dev (3.4)',
> +    '3.3': '3.3',
>      '3.2.3': '3.2.3',
>      '3.1.6': '3.1.6',
>      '3.0.4': '3.0.4',
> -- 
> 2.31.1
> 

