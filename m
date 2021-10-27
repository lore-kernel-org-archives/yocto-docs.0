Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFBBC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 10:40:24 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web11.9857.1635331221901035113
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 03:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=RmubeayW;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.49,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fi8eYZ/1J5h1MOw2Vr4FZx+MA27Rwcz/qAmxc3fVsH3OuczHEVonhiTNeLrTUZbgtgv2RYaoXKrxXOcvaEwoZmjWkT4ZC7yRE9lou6xns7HzyDwF+b3udZJDF7X94c7agcPMIjMHdxztnlyS9+9IeeDMWK53rK6igvy7OQ3zX86j3CkR9gr1p0NU0OMEN3OG4BCewO7vTiKmVTiHxrJ3oEIdkjoDZA6YilVbrqVvf+5zeSaVP25tL/qsyvZy76u13UT/ydUMtt7sTDP1dknkoQjf1KrvMcyr4fhBr2YdYsMseuADmCTLWchumpYTxKb95vMCsBzEm56UYUI0RIF4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPrn5TWG9ixj4lpoQ2nIOnVAUDF/boc5ap8ksiSg4F8=;
 b=jH5GbF588eQ8pk0QTggKr+S9C68qQ07YFvuhxNstUz37jR2MvphvruVQhcW29J1EQ4VoS7pTcn4bngLLIm93x0IJENN8iFfcb3fdPEyLS0x/cRHnp/SAyRJe/c92e/7nJTy8bX7ZVKXsBQL+B9f0NCjoeiOwRncIO0/15dvM4iNwvPfTvmDV7g8m9M7DelOE+G5KwekHiueaIll+Rsjq1TU6OTEr8A+2me8esJrTmTkMbVon5xhzQ7RecSLp/xZQNbl9aJoFB/VM8VkKIv2MFuv3d12yzdK8dW5lFsSIzF+s5uJy7vpkY2G8raHUcJZEd1Dqs0yJqv/c6k8abHW+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPrn5TWG9ixj4lpoQ2nIOnVAUDF/boc5ap8ksiSg4F8=;
 b=RmubeayWZp9sQAn/puzYCDiXop3WRV9LrmywG6WH78XGcuhr6NShPEMW1tkR5QHdGNdU7GEYAgk1L4QX8+fwIMU07xDQHCz6Zk8VmPtOsaUntm6DsYUl1Cxmz9A8aDbtHdoamQg3U0TeR+p5utmUn1EOEZxAQs4NBtMcT15Qnuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7076.eurprd04.prod.outlook.com
 (2603:10a6:208:19a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 10:40:18 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 10:40:18 +0000
Date: Wed, 27 Oct 2021 12:40:16 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [PATCH] [honister] conf: update for release 3.4
Message-ID: <20211027104016.uqi7y5d2aluyvf4x@fedora>
References: <20211021084332.334075-1-quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021084332.334075-1-quentin.schulz@theobroma-systems.com>
X-ClientProxiedBy: AM5PR1001CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::22) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM5PR1001CA0009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 27 Oct 2021 10:40:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c36fefc2-1c71-4338-e41b-08d999362b76
X-MS-TrafficTypeDiagnostic: AM0PR04MB7076:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB7076ECAEEE16823CDF3B5F0FC2859@AM0PR04MB7076.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rzAOJl34YpmBTO7GND4nAI2A4+KNMAfM7ihQLPybrBQx1/o2uqx2Yow4pqhXrNSc7lhuDPk/CUktmmamf4M3lcmim/3r99714vrzXr6MHy2fRkwOhuDJLPTBhzZN6gMIPECn21/LZpj/RqOehl6swBG70KSKVt3jxNKTDCxC9V7gwYiU52KuqGv17eWqKF5Frzg+dFVvCG1wOejReXnwB8SIaQ0BjBItIIO3nVcLs/XMvAU0MxHB5svkLQ7KGZhEp3rcX/eq4xFEDVe5ECrVy+90SVGoiSY2xbUYRW5bitA/AiwN7eWTR5OMar29qELQEfiAVLOMslcPImb4r6oMr01vOF+u3JSHqymFG9+Pb7ccByn1llmzpu5kS53SK/JUi3CJGJpEPUj0EbkBDztktf4OZ/0W5ILtt5PWmmv70r60BU5OGvIHuvaX3zIGvFxxy1PCGTE0RECwZLBzj2mx1mGhTruPk9/ChojmqnXoj11/Ih1txRH84jyKTMN6rOJ30LuUW4tGCTmY6YHSjYVP71W47meaH/Nl5aOtCdiUISyjsh2n6ZRVUyEYIDk5ewwt/VCMlVanjtJGDgbNfsBRLDESmTou6uMFFbQR/l48zB1JYcHmaNMxtuBC7ptOBjR5EdZiemB3YRSBdkOG+dBWm4+BtOSJXbLqV3dep8Fa9kzjl0cziaIYYPqk3D0izSg4idV7365Q72bEcTSaNsku0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(66556008)(186003)(55016002)(1076003)(9686003)(33716001)(508600001)(2906002)(6496006)(38350700002)(956004)(6862004)(8676002)(15650500001)(316002)(9576002)(8936002)(38100700002)(86362001)(83380400001)(26005)(6200100001)(44832011)(5660300002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q1kZZryZBT3xQ1PpiUe2rmMQIRTZhwIfp76IwjuQSD/A31dmhgKoQYrUNciF?=
 =?us-ascii?Q?ry0gxg5EdOlx613stitVMvwCCZ0PAxFh7vN+M8gUu9ZAU7ZukG8vUXhsaBlz?=
 =?us-ascii?Q?wA6fuF74Ov3M726HrXziPbjhDRCVwm1y5+Pu8OvNNp8/Cy1qaiVltwMe52As?=
 =?us-ascii?Q?3XwAHRp0mubWSND3tHNCztj5cjSAFl+sKx+kPRktZBG+hHwBi+X0R6ZLQQQ4?=
 =?us-ascii?Q?8LQJjSGbCh9VLaSzNhpQ9l/+6U6y55smD5rEyC/UIR5ITOv49YKNvftUTgXd?=
 =?us-ascii?Q?9ocrXJVkYHMKdOrGqk0sNMJ7hH5jAMt9IJfQQRfJBggY8NVjQ7/p6JpNijhC?=
 =?us-ascii?Q?QpjmWI4mRi3ka330hjGEBYIyd9aUIO94A7qmUjoMyCiUlSRrbB1iKNfYeCog?=
 =?us-ascii?Q?zeOgqmReZJQnCeqgEuEoOFyKP3TiqVa8sRkl+Xt3AJv/NFgBHtS6nWvvTb6N?=
 =?us-ascii?Q?nMDQGzybW8rr1ivdYsfTD98o5XQj73vuF2noyye9I7/D52Qzd77jOp5OCCQv?=
 =?us-ascii?Q?jTOKrD7sewvgPIqy23vMme0mm2gALjTUmt3mXyrf0B7jl0LxRcbTlRG2OgyS?=
 =?us-ascii?Q?mjaL6+yOYT8np7EOH7tca10I7Cm2GcJeYVxDf2JFvhBh1hcEODDVvtCd82yJ?=
 =?us-ascii?Q?UtGB0T2VVXghHOY+nKzTwRrYBKWxPGAykknSno0OaIzGM800YLZieE1FXE5G?=
 =?us-ascii?Q?69HgdpnGVW87ugArGPrQ5/N4E0UhhZzWAtyD6iCKOuk/r6Qu8/iPPvPK4jX2?=
 =?us-ascii?Q?WWJLHLshw61NktHvUwDMwGUOXgO5W5NOhBRiU7wvhVsz4/owCxM995PYzdXP?=
 =?us-ascii?Q?eMksQtEsoUXvjuDp6xvTUWjCAx0JG71HThwfzjGFJDZW6Pq5EbKty6QUXVkQ?=
 =?us-ascii?Q?S+3VzaVcixdFjKXnpN/3BPLGBlxjsN6oWZrvk57vdFLYhLAxJDtsao1RNPx4?=
 =?us-ascii?Q?4tSviyehVhzg1NQRNHceosyzTl8J5LzSqR11mP/7lwkmp54mbRyvyL1SKe4s?=
 =?us-ascii?Q?L69PxBHCThoXD5aFee0GCDdhSAFSZBqujqAw8vp2JwXMchipv5JvR6RbX4xf?=
 =?us-ascii?Q?xmHtJ/gNsWgY8KHS6vEbHXnlGPiZkFFrmRYz60bbJ/c+ktVnwdoPO6U7u09L?=
 =?us-ascii?Q?Pk8Jq+BVNmhaWbMIv6JK9AhNap4THAkEVeZiBGcPeBXIVnxUUA926JsQvbfk?=
 =?us-ascii?Q?p48nKVNRHP7XKwmjPTShXm2GdUP3LXQk1p5lqop5gk+Kj/OYQDb+2UMXZ3yf?=
 =?us-ascii?Q?FJN3jAzadpvqqEONUl5MrSsCrHJIG/aQLKMddJCVjLaJWcZPHSURDMsjY0ZZ?=
 =?us-ascii?Q?y41PfZJVJBJZHphbYq3Xflf9gUW41aH+4vtLPvw6dTQYegoxdXDhVIgERiOm?=
 =?us-ascii?Q?7NnF5eFT3QSRsrkLP3wuad9sG/yI03Tugi/VEp7z1ytut+l0uncWKI2xJ0Oj?=
 =?us-ascii?Q?UFk//6Vk8jEmKskPeHICzCn3JQvU0DW4+mL+tuDbuz/+HQAi1E+/ZXP169u2?=
 =?us-ascii?Q?hFNUbb0uhzr24m76dEUpV7uYGNkx4Z4KlguTdY6CE+x/bDt/BZpyv/wDPX0x?=
 =?us-ascii?Q?q5kbQEYffBSayAyIAAVQ0nhqs6E9+E5W5yc3GyC+T3M4vyvs7iQrpNusYNS2?=
 =?us-ascii?Q?Ykczv8w1FVFLDvEyB8WBLSif4x0DyUxi0CROnP+c9O3nMbmj/mdIwAZK8br4?=
 =?us-ascii?Q?yKL4UYyV0B1fAg9xjwev2PLrTyl1tHrErTpUbsiYhuSem6CZXLOgn9FBzdkZ?=
 =?us-ascii?Q?pY9DqrovzA=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c36fefc2-1c71-4338-e41b-08d999362b76
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 10:40:18.7120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HlNWgiGTnsEGAGhXqSBKNMxbPzs54ocqFygnbwRfjtYbu3xXUWT64fkUFSc/QtP4QqBzMgfdqLCdjQnbMbQPh/Lw4saGFzXjZvHj/YnBwwSN5IlQUjgNCRklPAQG0Bp8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7076
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Oct 2021 10:40:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2048

Hi all,

I specifically sent this patch before we tagged the release to be sure
we don't have the same issue as on 3.3. But we do have the same issue
now that yocto-3.4 is tagged and this patch is not in...

Can we settle on a solution? I assume moving git tags is deemed to risky
which I can agree with but the issue(s) need to be resolved. Can we
patch the tagged release from within yocto-autobuilder-helper doc-building
process?

Cheers,
Quentin

On Thu, Oct 21, 2021 at 10:43:32AM +0200, Quentin Schulz wrote:
> conf.py:
> * set version to 3.4
> 
> switchers.js:
> * add 3.4 release
> * update 'dev' to 3.5
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> 
> Not tested + Assumed to be enough
> No need to wait for the new release as the honister branch will be
> integrated in the docs only when tagged but let's make sure we don't
> forget to do this change before tagging a release.
> 
>  documentation/conf.py                    | 2 +-
>  documentation/sphinx-static/switchers.js | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 8e0847938..104b49ea0 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -16,7 +16,7 @@ import os
>  import sys
>  import datetime
>  
> -current_version = "dev"
> +current_version = "3.4"
>  
>  # String used in sidebar
>  version = 'Version: ' + current_version
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> index 1e37b625a..6038dbb5a 100644
> --- a/documentation/sphinx-static/switchers.js
> +++ b/documentation/sphinx-static/switchers.js
> @@ -2,7 +2,8 @@
>    'use strict';
>  
>    var all_versions = {
> -    'dev': 'dev (3.4)',
> +    'dev': 'dev (3.5)',
> +    '3.4': '3.4',
>      '3.3.3': '3.3.3',
>      '3.2.4': '3.2.4',
>      '3.1.11': '3.1.11',
> -- 
> 2.31.1
> 

