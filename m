Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.68])
 by mx.groups.io with SMTP id smtpd.web09.14676.1630315048666307879
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=K8Pr50ET;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.68, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXR9Zs9gL2ERk7YWf2+HT74gkOj+RJMsE3WPdSbA88CdngZ6IooshYxLKXCXb5m7YFlrq62+hybTtJBI59lu6rDDXCju5cph7KTsa8hp2VVpkjFzzPc3i726+qCHX2mIUK4wsWDCWtVHXGBl59iW3Y3bO5i9A6b/h3u0wMifHoSjIS/t7VRT8Shrqw1JhfEGK9QPCMNGcxiaz4D3fEH1N0QuQuVXG6apf7zLT6zXlcwpHGpRXjeSxc6RcxzFPPdH0cvD8U4xYQ8HqslK5JWk9o2xULeA97EEvaMai3DZjDMZBw23zecvZ/Jaa/sKExZLcHVtbcBhlShb/9s0KVIAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbEHs24Rjlzt7GYpkVH7u1AWr3zoRWIPFG5utrvkFb8=;
 b=WJxOzhVF75JsxuNiwmGGcunKolGwmqE1KsrHbP9f+feFx8QxH+T5MmJTC/PyaAgnZRYZekk0jXGI69M+Aamlod1ThgWR4SWP7Y26x/f+jq+5PRlZwKgesk/LwkzjD6gwq56hmAxMCpwJ2miCsUH/43P6UWSkKir3UP7b56izyMjnz7f+iISoipiv3fClX0jevsYUK2ca1NxouTUPOSCbd87df80+1n0VcQhN/iJzIoD8mt5vpOsjuZNeiYC6AW+lyb8Ye5CSv3w1XoUUWIEikz7KDUOpOpdhY3yjcZt2bCGljHiLVizYUyrC1f+2CTdR4Dj3Q+RIRu9PXzM+mnTlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbEHs24Rjlzt7GYpkVH7u1AWr3zoRWIPFG5utrvkFb8=;
 b=K8Pr50ETv6X4SV9mrbeZ0opuXhPDOhbS7dCc3vzShxHZIntkiHHxdETXQCOUko5cFqhrYHkPHIP1n7YeE3w3K7+ng3mYJhanYR0JihQeaBI6Z/FnsnQW7L4STiXpIoGE43+FNwVxlGMuwni/XD14wS6j/awSpBYADvJG/6M5l2c=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7249.eurprd04.prod.outlook.com
 (2603:10a6:20b:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Mon, 30 Aug
 2021 09:17:26 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 09:17:26 +0000
Date: Mon, 30 Aug 2021 11:17:23 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: add line continuations for aesthetics
Message-ID: <20210830091723.ercjocjlom2yond6@fedora>
References: <9490f67c-af80-2517-737f-f05591c9a0bb@crashcourse.ca>
In-Reply-To: <9490f67c-af80-2517-737f-f05591c9a0bb@crashcourse.ca>
X-ClientProxiedBy: PR0P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::22) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0202.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 09:17:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71b79229-fdc0-4af8-64bb-08d96b96fb7d
X-MS-TrafficTypeDiagnostic: AM8PR04MB7249:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB72492CB1CB7D5F6973A3D766C2CB9@AM8PR04MB7249.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vAt14uXKii+7+EueTHKTq5CiCI11f+/9I8vKGoj75K3DsWzYQ64Fmz3TjapO5T2NTp/LAi9AnA0BIFJVQ3sv6Mtrb3QwGvet8ELRh7ZyzGmya0saXyQaONoKPk2jEfEC5JzU+DGkAG10MyTYMTbQP0dt1FRNSx1RjrShn266vandMUA/674r6kErhMPQOOqS875u9ydehLZ+ItnzpwhC6qDCtOz14N971h7wYYPAcVthu4nuUB019yc1cC5AVI2fNZ7RPFQVYf2lJHnmS34U/uUdFOlluKKsjT1nY9DsvGcmniHqQrCKi3Ze/2dAtVbLfpTuH9StTkWzs9Vt97ppySQFCl5Wb8tuWzE9V0bSJX3UcKvgePUEu/N0a8GcVCNERfk7NqMfMZicEezPNuVpYdMlCJxKu0IL/xSIIJyYOYSEW4tsnmFkttQjN/iLjpQNZgd7IXbFbUOOcaXy/kKceLSPe9PvmhLqLBrpClCa0WJskWFugUr2J3VfrGYxezOt35UJE3/eZ4kuEhzjUBlkv3KUBFXGDNepJP8GVQA3jmVGnzY+q9hY7bkgyrsvK8F2ni4Y1DpU/doRmggwXZ4QS5dKBmW/HyP+aRifQbhS8vIz0PFPIhQJCGgLXOoHdx4fu+oYKKKbKYjnmK8K3yiIXzuLCjBrhBsmXLIZ94/SAc2BGBuqElhTOEZFYjet7aBB2vkcAS7aVUVw4J2bfNDF0HA/I72ZBv+I7m6J+miTfZ2shMpY5znPV/AACSf23JsuRAKvBPloQzVLJEC76R2uKf++MmfOgpsxHKohhsiHMSd5TZ/wc5oaV3AIVGuY7hBD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(4326008)(38350700002)(508600001)(9576002)(38100700002)(45080400002)(86362001)(956004)(2906002)(6916009)(66946007)(9686003)(5660300002)(1076003)(966005)(33716001)(8676002)(6496006)(66556008)(83380400001)(316002)(8936002)(52116002)(66476007)(26005)(55016002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WSinXlJUq+rOI5rbH0N0eWic3RvA+3+F9F094vjWaDFJ6Y8GZeHjgbTnJrmv?=
 =?us-ascii?Q?NrobxjgSxRyUOIpSq/GyzbDLmzD4AXvZaCo8LrlZ8Xkx4yFpMKhsm0N7v7wV?=
 =?us-ascii?Q?/dhid75WloXShzfZEuDKw9rMGx0oNfTM6KYEytgFzpA0v4xN/MnFdf7qRqP2?=
 =?us-ascii?Q?VlT2wRKGRfMqHfziUUgIgIhg4yrD7XSf+DuIO1W3htR2SOrObJqbEw6qH+yO?=
 =?us-ascii?Q?RaN4eHp40AW8vcsXFTiyEERAjjwpPyTQ8n4RqBmpXVWe15CkgQE1eZ1VheCE?=
 =?us-ascii?Q?TXaGBO4/WeNoEW9QUm8Cjrk3VgBfqzB91KdQ1S1x8jkr/sCOK/IB4x5mfEi/?=
 =?us-ascii?Q?/+BcjgkiyT2nkCnV4IB51MSvXBEmf9Vr4PvC5AlZ0QAUqPKTmJQcYG0VDn8T?=
 =?us-ascii?Q?DAqWS0SNVOTFp8JjhJCgogWUN92zbdglRdR+mxwxQoNo8nqXE8yEj06TSOLV?=
 =?us-ascii?Q?PC5yL8Q19W/O1D9nMT/JacQQchoIKwb0uTSwg4hOclnjR0DqpO08wXAl/qJC?=
 =?us-ascii?Q?yXA4cEGMpMbZC+JEH7vaq0VN3s5C6FuLxG9QGzj27Rm882HZtv0+G2CydPF1?=
 =?us-ascii?Q?GQ7J5HmmYOPeo2QoJR07hN0KfrhQeRXio0bX3pMTRMo2hfxqt3Y+9X5u1EIx?=
 =?us-ascii?Q?8bAuJCGZQljt6bkJ4OcFl4WHWFCj8WOQ4HRLT5Nqnu/+MSLIgDAAv5rVnUO6?=
 =?us-ascii?Q?Nua+BSR4d9Wkx5rvEwt+XPFMTO95nUeU6MaPwnC8dos9kfdY0iAz91StThlV?=
 =?us-ascii?Q?5k30g8WSKdSCCPhKCl7aCfgK1ScfaoWr96mkaRx1o5CuCvBv9RqcQE9TVt/5?=
 =?us-ascii?Q?b3z/ZfFCtGP1PHX9TDl9uK8VWf42NgmK21Ek7dciZ48xM4tUX4xDOXzQT2BY?=
 =?us-ascii?Q?o4XR8kxtH9Bagm6T7CKrTpFvlwHJ7c1/pgx6+vlbjI1LnzF+O/+7mECPjtaK?=
 =?us-ascii?Q?1eEDGEgEBzIDUTwl+Piz13Exs0iNWRr2zfUIm0GVYmeMOareCx/bbrABCymj?=
 =?us-ascii?Q?EETmEBw1SUVMv176uVd4plo0wZMERXykiRfksdfSQS9jXEZ4/1JRwUc9afKY?=
 =?us-ascii?Q?pUyRf4lOHm58TwIOm7SgP4BqcdtRzjpFrUACXnskLqQy+AtHs9qPDffITK5d?=
 =?us-ascii?Q?N0q32egw6Lq0xL13Pg1xeUMq1xp6Ri+QzZJiRanzCRZ7HIiXe2C/IVDvISW/?=
 =?us-ascii?Q?9rIfotqTjhQHfL9942o+5Yd+SjxXIiAsOk25eqJ4ZhfW9Pjh/+dJfV3rLYiy?=
 =?us-ascii?Q?QoGs/SjoDNgNRFy2wxP1QicGElTM83qqRrzNNHlDIt1vv1sFLK0X25ZFVoTE?=
 =?us-ascii?Q?HlKdrAxEFrOyoUPr/+C+1IJz?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b79229-fdc0-4af8-64bb-08d96b96fb7d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 09:17:26.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acGm2AFR5yd2kVTgZkXLvKoYOtkcBHfOzxSOGtFI1OKgQSqac1aJAsGLvnvvTptQJjZXgtbed4F1ePjqQGHcvNe/Ihh74XReVWG9FxJYaDSPILh8n3r1DBC8O7a0z30g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7249
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Mon, Aug 30, 2021 at 05:00:39AM -0400, Robert P. J. Day wrote:
> 
> Not a fan of lengthy lines that require horizontal scrolling,
> so add line continuations.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

It is the content of the recipe afterall, so not sure it's desired? Will
let Michael/Nicolas decide.

In any case, this code is out of sync, e.g. WITHOUT_XATTR is now
embedded in a bb.utils.contains check. Since you're sending patch for
this already, do you mind sending a patch for this too please?

Cheers,
Quentin

> ---
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 4a5011ea7..6f0ee27c7 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -2331,17 +2331,39 @@ In the following example, ``mtd-utils`` is a makefile-based package::
> 
>     S = "${WORKDIR}/git"
> 
> -   EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
> +   EXTRA_OEMAKE = " \
> +       'CC=${CC}' \
> +       'RANLIB=${RANLIB}' \
> +       'AR=${AR}' \
> +       'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' \
> +       'BUILDDIR=${S}' \
> +       "
> 
>     do_install () {
> -       oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> +       oe_runmake install \
> +           DESTDIR=${D} \
> +           SBINDIR=${sbindir} \
> +           MANDIR=${mandir} \
> +           INCLUDEDIR=${includedir}
>     }
> 
>     PACKAGES =+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc"
> 
> -   FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
> +   FILES:mtd-utils-jffs2 = " \
> +       ${sbindir}/mkfs.jffs2 \
> +       ${sbindir}/jffs2dump \
> +       ${sbindir}/jffs2reader \
> +       ${sbindir}/sumtool \
> +       "
>     FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
> -   FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
> +   FILES:mtd-utils-misc = " \
> +       ${sbindir}/nftl* \
> +       ${sbindir}/ftl* \
> +       ${sbindir}/rfd* \
> +       ${sbindir}/doc* \
> +       ${sbindir}/serve_image \
> +       ${sbindir}/recv_image \
> +       "
> 
>     PARALLEL_MAKE = ""
> 
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          https://urldefense.proofpoint.com/v2/url?u=http-3A__crashcourse.ca&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=sH8iuVXeDgFiq6-2yFuaJA1ahW9robcDxSFcJtunA6g&s=ez81p3lImZGQIgOs21G8Sys-IEhCl0eRKgi70lFiDSU&e= 
> 
> LinkedIn:                               https://urldefense.proofpoint.com/v2/url?u=http-3A__ca.linkedin.com_in_rpjday&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=sH8iuVXeDgFiq6-2yFuaJA1ahW9robcDxSFcJtunA6g&s=0YgkyEX30AN49Fm5SfWLgeNzQw7rQ_AnyZoUjBGyhtw&e= 
> ========================================================================

> 
> 
> 

