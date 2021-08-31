Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.75])
 by mx.groups.io with SMTP id smtpd.web10.2741.1630397950236117207
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 01:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=Ajjl4hEo;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.75, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqnPZAJFa23yDQaptxmAT+KtsUxDtOkPPIq7IQn27tUajf6DXZCO8ClR4eT3u3fQjoxeVkriXchW8bvWc7WrAYLwgvjapAwnfvO8UHOfpEHh5BJiniDtGcUPPH8IXyts3u5TZyib0ky+4E2+3iew6VerTT+1FmJstYj6D6yyyI3ulInB+vSGKJbEDxVaUaCDN04bohrjnKd1aiYzeuybOaIgeb6dGbEIY/Ylx3CxZn2/fQIZRFXOfoQ0MtCifKKfqa/D37Ey2ZPbmnNEYYgNLWNAMZXLubTV6ew3OHHSGTgc30K7mWKvOn0wA+oT9+p+SDu5gmVPLonmToWJRMxbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vovXvOIuNK187pkK3UQ5mXaB2uJ4XFvnJ2B/uE9oFIs=;
 b=ju5M5iOstRxkk2K4+wHXseCn1gwgwM+h9ERMKSFpFVJRV/+n3sXOqi5SKu6zXGhe6poALv+YVVGs9SCsZ09dskXxyNw9+0zCXMtXrPyulf0nVZRtX5liQj7B9pTBXuls1XhXLGlgMKi+5y0a/Mkkj5oV/gQETAzUxEVUK0+T+PNMqtRjN7j5PSCVKXzZwLswzh+MgbuTWeBn4+oTKMUJmjqcRRoD0rhuEYXqB1+IVni+FEHeyzwobgnAMk+MeUrZGxvKkTJ5T26Ky6X1dGLrpbUFiFhliZ8H6IaZ/Mg1kbHpZ2I15t3a+ZE3xN6Ick4/bdJAD8JrLyG8cicn97hmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vovXvOIuNK187pkK3UQ5mXaB2uJ4XFvnJ2B/uE9oFIs=;
 b=Ajjl4hEogp/x+FkMKizIPkPasKCWt4sL9EonQvwS4mWa4BJjY1rDFtfy9s2MG2RQKMj6OKobk4eKS+izPCIbFXVvo9Ggxbvs9bz2aUyRgrFjXNeFakuFfW3DGWzVKWR3kVpS6W3LwPW6RrF4hIESP8awHbCiLteyvbi+oac9pYA=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0402MB3354.eurprd04.prod.outlook.com (2603:10a6:7:85::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 08:19:06 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::218e:be8:ba2d:6af6]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::218e:be8:ba2d:6af6%4]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 08:19:06 +0000
Date: Tue, 31 Aug 2021 10:19:02 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] dev-manual: correct note about virtual providers
Message-ID: <20210831081902.nal2qie3lscex4rx@fedora>
References: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: PR3PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::21) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR3PR09CA0016.eurprd09.prod.outlook.com (2603:10a6:102:b7::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21 via Frontend Transport; Tue, 31 Aug 2021 08:19:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c797b4c-165d-4fe8-5774-08d96c57ff83
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3354:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0402MB33549B061BA187FB5B63764EC2CC9@HE1PR0402MB3354.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1nv+e/I4VzUtbzydISySvaK2mFZ2sVepYA3kRkkDzMAD1jljFxwOw2OtI19vX/8PYR9RHK5GaUxddodKT76ltioOvKkw/SADHsT2BUovF5LRazgTXNKqIpESm5bZF+0v0KWMR+x+nxqVA4IkvEpz9gzOYbLRp0YCVSeLvVwG93v8OBplSgA2zqiCFEaRg2Rk3elMfHPX4ogzkzEnELNYTFK20GoNvyGu4ikEBc8DmVazRKck3AJP3fPHd4gxc1epxFCypXhsmuDBFf4Z8dV+nmhwhB32s+IuTF4QWyk2cSJ0zZOHIp86OkcxBEvgUEVHk5FTpjJ/zSj644P4fqdso7RJY5elt0XJlTn5xDB8nwlUaHskgV647d85J1lqYUETsDkMYi5h6XFP6+Wx+PG0XLFXszhcBKKHPS23vcl4rjS7v+iikOUZ4cf84imM/r564hpPfPraVI0GwglLLB3c2nuveh6jF/5EXR47wwMAmeryC0Ej+KvA/EiLgibcgcAZxfEcg4Hp2Cx94tAziLkT+uYbuq5TefHVXSqOpBj5c3Q9bw4MaG8QUnaEawoqlnHVjb6x2KksS+YaGVz+nw1QlFIJHFeqyKbOE7CXM0WFunQdk/xQ5ql/cDWWEkXGazuXz51DikGgMBqHdCOjcqsfmVEEMjcsq3HjIjqfDc6ngcHe7d2eee8qpa7IJftjyQvWtwhIYyoO0zI8UVn3SFXO9nfWZzzSO4NnT58wMSa0d49FQLN/jYQSSernsGrxSUlRzcCdYfNjT1XGBzACNT63HU2E9QYxyiDSxhlj/bXO4EU2VrzWmZzq5HGz0RQMwTwJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(346002)(376002)(366004)(44832011)(52116002)(66946007)(5660300002)(55016002)(26005)(66476007)(66556008)(6496006)(6666004)(38350700002)(4326008)(9686003)(966005)(6916009)(2906002)(8676002)(38100700002)(956004)(316002)(1076003)(83380400001)(8936002)(186003)(478600001)(9576002)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CsEOqyGrakZMefkGXPlw4VIHWho1E0E53y16r8acpsCzUZGskKBxe+Zue0Qd?=
 =?us-ascii?Q?+SmdRxrKW42KCwX7WIrrVXKMQaUtjk5AUtL6Q27KWYE5j/UyYrZ/pQHr9R1U?=
 =?us-ascii?Q?wu34Xo3OTubkcMB17qqqcZzYH6CK96U/qNTWQRcvVnP3WN21DqHqVfYmNdw9?=
 =?us-ascii?Q?83vioO8ibVkuKTcrfqSGIqzJ8U12+5TstemWsXuMtcfpEHy66/vbrb/sMb+6?=
 =?us-ascii?Q?gVtNwGHI1Pvv4GiQu98/rVAqpyv347lfBQguCDQAVhwBQ0scWaHHtGMYqMli?=
 =?us-ascii?Q?OE2lX8LsKC0NqCfz45DtEOPop5JdWdak5Q8rG7LZifV92ZaNq2J/k0q5V7rT?=
 =?us-ascii?Q?/D4k3c+zPCqVWaTcKXa0ZXNhPs344KcqgSUYFFcDaiFHW3fz0hWEur20cjG9?=
 =?us-ascii?Q?1Y6mbsZexr92ZwYXW2X7rTOsFHlyhL6jWie6ax86R186e81FDod/w7VQum34?=
 =?us-ascii?Q?Sim2k4fkfakCCqBRj+F46M3GLSQK6f4uaEBfNds0n+PkEeI+FdtxbjMQg9EX?=
 =?us-ascii?Q?Mmyb0fivFemUDF7LOQvo5hhYE6Yc6WMzADiOHHq+fKhiAZxnUyYMI2p6B+1a?=
 =?us-ascii?Q?UAj7kPTeJzlb2sNu0iu/aBjK2Mba9R3w1GFutCKXGb4gyiKwc9IBo4T82528?=
 =?us-ascii?Q?dubqUWURJpcY0W/GtAdh8e53DtX/ZM+fwCpQRyQij/uz7bwOQ+nTdkicr/ge?=
 =?us-ascii?Q?nKlOIbkZfi1JpYXAspLYVqu4PCrL59d7gRkh/TNiUt4rE9QthlbKtxtimzp1?=
 =?us-ascii?Q?uot0dBg8eWIZSXqhw0YaSiz6Ru1+mR7vuJSH+G0mgQ1z1UKTLQaG8zdJwigp?=
 =?us-ascii?Q?9X8bSqz93heYy6aXIXQb/WvMyhuehidiGiP7IaIoFnvJGs92GWwzK6LNzj2Z?=
 =?us-ascii?Q?6C3Hec8XtM5ZxHeSmA6rnDjc5x23D6cM6tdveJinAXZB/drBjKNt1XMgWo1y?=
 =?us-ascii?Q?YFl2qcZj1s33uCnw/dE8amcK3gigCuY3CHZXu9vUzZNNyRvrrFPAvKHcyGTY?=
 =?us-ascii?Q?9Oq7NlM8Ce+K8YViKDkS+0igMAfpL/+MgxRU6AAFcJPZRFBz7rGjUocl4p9k?=
 =?us-ascii?Q?gksfU8+6w3k6BOlkz0Q6Goa5PrCI8JcqZ2u+gMPaRo6Pq/vbZ+L4mfMwbh9m?=
 =?us-ascii?Q?nCXVjlsEvoeMPcIQ0aaMgXqIcmdkpmU/qQEPZQfhdHjFhX7zyl4lU2oSvAaQ?=
 =?us-ascii?Q?q3IfpvQtMyHfEXwAqhDtD/UVYRpSW9ep603Q2Brwv6FX5aErYGUqC85xGIfC?=
 =?us-ascii?Q?rKnwCI70yGkY4ukTwsnJshQ+7gXG6CuRs3dbMtqR3wylJyxBhsMY/L/sS2w8?=
 =?us-ascii?Q?J8O0iSc3mzYJSeHzlAKdJP+o?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c797b4c-165d-4fe8-5774-08d96c57ff83
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 08:19:05.9545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOcFP2O+ckRIutK44l9u2bVexqqAy+7Ih4uLqgpyQHeGC3NIlueRe7Mik2gIBMAbVYLJm2egDHYZw+bRRoSUFC45wyeZJbxMWCXMpTa2xT8kel8VyCVctFZmlAkk/Ibi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3354
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Mon, Aug 30, 2021 at 05:37:20PM +0200, Michael Opdenacker wrote:
> Fixes [YOCTO #14530]
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> ---
>  documentation/dev-manual/common-tasks.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index f3b5084436..dd015a761e 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -2114,9 +2114,10 @@ The following lists specific examples of virtual providers:
>  
>  .. note::
>  
> -   Virtual providers only apply to build time dependencies specified with
> -   :term:`PROVIDES` and :term:`DEPENDS`. They do not apply to runtime
> -   dependencies specified with :term:`RPROVIDES` and :term:`RDEPENDS`.
> +   Virtual providers can be applied not only to build time dependencies
> +   specified with :term:`PROVIDES` and :term:`DEPENDS`, as show in the
> +   example above, but also to runtime dependencies specified with
> +   :term:`RPROVIDES` and :term:`RDEPENDS`.
>  

I'm not entirely sure what we wanted to tell initially but I feel like the
following could be a bit clearer?

"
Virtual providers can be used not only for build time dependencies
(:term:`DEPENDS`) when specified in :term:`PROVIDES`, as shown in the
example above, but also for runtime dependencies (:term:`RDEPENDS`) when
specified in :term:`RPROVIDES`.
"

Also wondering if we shouldn't use em dashes instead of commas here.

Cheers,
Quentin

>  Properly Versioning Pre-Release Recipes
>  ---------------------------------------
> -- 
> 2.25.1
> 

> 
> 
> 

