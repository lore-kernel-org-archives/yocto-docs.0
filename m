Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56D5C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 11:16:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.51])
 by mx.groups.io with SMTP id smtpd.web09.10185.1633605386202456450
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 04:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=A6mpkobx;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.51,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhrkDGHCyJZ0wsMtxjtJ1vxresHbLSJxCOY1o88FBWxixq95Gg8j3cxu5YSAsdLzquwaqJJWRzfhaD2POB4ZusMOBbQjOJskP6+sGZYepJrsADLQ161cawHQCfxwx84LMf8Xnjs4kQGOrlW0ceRxgF9o5xyXRshgeracZsfxKMxiFxVGm/00D4brj8cqJpCR11Z8K5l7HLShdddptKRW73ifEMW58Oex0TIj2OuOobYe7oPVjfPvpzaMmtsTm7d9TNb0IkU/A2ubXq/hl1e5httxRbHtr9i4e+U+4ZR5A3OZjORWjLbJTYKl6NZyA7mVNoizko/WpLf0gEiZS3p1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOKZJtCJD2WgjZuaAKq7ee07XeJXonr5svTd7dlLW4M=;
 b=VdkCLsva0Cb5zia4Gda0mInhfk+o3M9K4Sr4DlacwR2mz7sMXCpsk5M2OP4+e3QCHkyKALu6E+J4zoMZUXXna3+zyywa/YXe40ylNEkl1bb0OoC1jRtL3G1oIyzw0uxsqwL2o0jDmb3pmOCOEUqognR4R2u84Lh7NlO5AhMjl490jAuFJucyYURzImu6IKNyT03ePHRuUA/g9AOFgbXIW7lz5EWpPJGWwe6QZkv6+JJMV6ZYl4J8i92Ch3UxnrsfAfuzmfvjzkbJyBBkBEkGRf3QJFAj782x6rUXwl5Sz0mMSSbni5SLZub4tu/sK7+DufNzRPJrfKB/INTPIuxvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOKZJtCJD2WgjZuaAKq7ee07XeJXonr5svTd7dlLW4M=;
 b=A6mpkobxD12B88XvRg+pjv4bCQlGnkP/sTmWPAbiU8/4WeOgoyLB4c/nYuksCsz+0HJeJEE0ryo6qtCsmV1eovfzOhDRbO49GDERuZJjL57TTO5g/Kkp/b+Jyq/rJQ1lVaabx5rWqckLmI6btC88ihYAkKlDZMoGJH5JBs1ujqM=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4434.eurprd04.prod.outlook.com
 (2603:10a6:208:6c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 11:16:23 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 11:16:23 +0000
Date: Thu, 7 Oct 2021 13:16:20 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: warn about license compliance issues
 when static libraries are used
Message-ID: <20211007111620.lhlixpna3caovrd7@fedora>
References: <20211006084455.953350-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006084455.953350-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM6P193CA0090.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::31) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AM6P193CA0090.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 11:16:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68f2972b-4058-4151-8f0e-08d98983e507
X-MS-TrafficTypeDiagnostic: AM0PR04MB4434:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB44341EF3A4106B03D8AB92BAC2B19@AM0PR04MB4434.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bgpVHCThihRgYKbD1Et4o9486Rf7xrGSsvGhZC4U3RsCWOO4dbZz4HaY7C14lmgN5rM9RqXpdylm+XGUUVVsFjdkOADSxbpRTRcghe5TBWkNnN8kHUxVUDHDazueYTINHu2eT7zdWj8qobDZGMVl8DuS5xYE2V/V/UC5rqxS2ZFP+CXVSaP1G0blLQhNLTW223/J64h/mdegNIIiANM+7HEbfkqFay+7L7TF2eO41X5cCN1bo1y7TenURXrjDeeHNyUKX+h5bPUN8CPXnrYRQS9QRgrx4HAxwvpZRtqwK7KtSxiRRwxQtIsCkPjUMNba34rN44Yy/ypjJyTARf1zSlloqiEao9KXrtIlSP0LRlORmLy0mnBzDHjTjrB/PSL51qwdTOizzXptRnZwQb2vL94K5eA/kcyAslDrmbMwyVvNg+kwJ71W1tRo5iAr5ZxFsE6h41lwEvcVJLHuF4n5DGeeuPH/acE7HATJ+7BrR3K3RTQCZ7yrQLs94k0OG7jWH5eOAoAT0W2R/RIGVhLcL1m0z17gmlFwZzQ31z32BOFE9/ww5VTcvV2xUO0IyYzl3xXKdv3zU6E3F6JottUJ2jnqDH2VWtuyNLtrYpo0uFJXhDMWXlc9UyfhoRv2Yb0cbfXgxcSpR/lc7d9rsUjGUvWXZKXDnQXEbf2W0WFdYfjtQdD63hrZcfI7DCsePFa/kRysjqPdlqcAWcxVfll6ng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(55016002)(52116002)(9686003)(8936002)(8676002)(186003)(26005)(6496006)(508600001)(9576002)(44832011)(83380400001)(38100700002)(66946007)(66556008)(66476007)(4326008)(6916009)(38350700002)(316002)(5660300002)(1076003)(2906002)(33716001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5icMIkmUK1UN+e/YvWad/7qNNUClfyP04GR+jeakidfPsNkfK4Lje2kKua44?=
 =?us-ascii?Q?01+wmqZBNab7pLDuDPcPf3mzC1Hbr7N2y0P2+7w6rSnlbOc/r0teSWf+jcSI?=
 =?us-ascii?Q?Xl4S+CMwjMnj+leOa6y1cGAvFykcjCSAa9j8zIdiUBnG8wrIy2uqVQLNtq9R?=
 =?us-ascii?Q?214gcbOgrLS0rQiecaUDTgNVdfNyfqPJb+37bx07B3bxFC7GsaFFjt7CSTv+?=
 =?us-ascii?Q?jdKZa0Rn+lLXVfBm87IY02F7XxE3Fbxleu32MrMKTBaf0GWiTo7ha7p5h1NW?=
 =?us-ascii?Q?zyM9/i+6mdicxJmd6cvpW71cbOi2j5PlIseFmcXP2xzXgO4PWAcKb9bwdRFK?=
 =?us-ascii?Q?G0feAmB+8tiIWOb+I3qQ3yWXDqBf3BFez4pbK8+gsKiu3h/oL1uMtEIzZCCQ?=
 =?us-ascii?Q?SAOMxgs3+c2NKTQRt37h9816E7HVJV/SoMQJuM8hvlS067oe7HodDu07AKQu?=
 =?us-ascii?Q?hgqqBYyGS/RZJnjaaxe6sgmSugFcPh3K8I9MFWs2zKDNd50EndymhtNKldxo?=
 =?us-ascii?Q?u6Y5bK72VIlB/OipOIh3AYb4LzWKgzNtdErNjyNiLT/VcxsohUmwUKmkUkb2?=
 =?us-ascii?Q?5mAdzPAtGx5wAbWYZvVncI+2NWJ1+gHFZAXY548Cx0PilYul2j1xj6jG1/UN?=
 =?us-ascii?Q?jSMXNYB/dC1xCel2vkaX+y6IU1mbsTmhGWhAzQS4gsQoV1ejfDoTU9s0EYmP?=
 =?us-ascii?Q?cdjrp/PcqnE25tKZLVYDm9JZI59NC79vlgN8rUPEmSW5lP8zsUYzp/ljOnp3?=
 =?us-ascii?Q?EVDaM2Xyl8gwo1SoSxeXL09UhdnSEznaDt2lUi0XLRjxWeRRyoZ94OkseIrO?=
 =?us-ascii?Q?Ub+6RInfpQYvgrD199lXutgOY6aFr7TGW8UZtws7By1PUhgdGAaeGZbwevfn?=
 =?us-ascii?Q?/kIwEtf99jGPzuZE1+2gLF1IlMPiSzFKnCbhi/dPrKyQh0fxAkzLCSqlGVjQ?=
 =?us-ascii?Q?yDPiknnC5PsYQqQPhm/AhOQ0zbifNbETY7lx5dJkIw8wqetqHVATEcNkYpmm?=
 =?us-ascii?Q?8nSqIRPHfUQgqGQ5iyyaJGBj/kXiB2mhuM2qGNK3uUjpm2lp8onxJJZ8cIcR?=
 =?us-ascii?Q?wsG0SBl7KBZgAZCSvIyYB6OHEGOYO7CkLu4it6d93fSd+dUq8zUwSRJIbpPZ?=
 =?us-ascii?Q?xGDUG0pm+cl7DfxW9sFM2KUQYC0RBCKuBiNEyrFmZgLc+jCqiMs7DYK3aaa2?=
 =?us-ascii?Q?qt2qxFzKRQltdJ/loYHNi5qLx7kIN8FS2EW49xPMJi1lIa06qHYcShkGBJih?=
 =?us-ascii?Q?sUnCbPN6edj9TH5dfK1VSeMloOr4kR1Jr/6sbrhr9Tm57SshlOu35f0jd7ZM?=
 =?us-ascii?Q?ZNvcQJ8kHnXjDhclQQ86A463?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68f2972b-4058-4151-8f0e-08d98983e507
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 11:16:22.6694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FNP1VDNUeFGyMUd6PS1OnO0lBQP3VeUe17qJ7U2eixIpxvkOUy/FzU9BmL+IN7tzcHoZmpX8n9DmVyTdNaPEQT+MIUyaouE8KQDqjvcdeXszudxfjfx5IheNr+fg1NT3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4434
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 11:16:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1945

Hi Michael,

On Wed, Oct 06, 2021 at 10:44:55AM +0200, Michael Opdenacker wrote:
> This partly addresses [YOCTO #14407]
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index b81f51bf83..2c862dc1be 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -11158,6 +11158,23 @@ this function, you have to follow the following steps:
>  For more usage information refer to :yocto_git:`the meta-spdxscanner repository
>  </meta-spdxscanner/>`.
>  
> +Compliance Limitations with Executables Built from Static Libraries
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +When package A is added to an image (``RDEPENDS += "A"``), and depends on

RDEPENDS does not exist as is.

If I may suggest:

s/``RDEPENDS += "A"``/via :term:`RDEPENDS` or :term:`RRECOMMENDS`
mechanism as well as explicitly included in the image recipe with
:term:`IMAGE_INSTALL`/

?
> +a static linked library package B (``DEPENDS += "B"``), package B will neither

For the first occurrence:
s/package B/recipe B/

> +appear in the generated license manifest nor in the source tarballs generated
> +by the archiving class. This occurs as the licensing and archiving classes

s/archiving/:ref:`archiver <ref-classes-archiver>`/
s/licensing/:ref:`license <ref-classes-license>`/

> +assume that only packages included via :term:`RDEPENDS` end up in the image.
> +

+ or :term:`RRECOMMENDS` ?

Cheers,
Quentin

