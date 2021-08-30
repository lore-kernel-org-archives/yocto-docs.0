Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web08.14573.1630313718927016672
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 01:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=O4MiGpit;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.68, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiP0O9lft9YbXK/MttvzwY8WLMpSeHRtodZY8WQaqxCvFFGffHyc9rSIXhdhzHoMjFSyvndU6Uiv1vD3gV1NmTF5H7ng56kWaNMYEXwJ+faE9u6wWn0+l0/3c0IkRMXyW6K+bpKncW+PQR4GJY9X6B/tfz0nWj8/wt4pl1EizeriCg1/YLINu+Nk1FPhVSD2KzURoxCG+OV0YXxA1sqO1nW3HOdoautBde0oJVDVopuSvyqQ2+8yn0kXNz4StVtPpYAXgUYEr+1eFi/qaoF6S6ZvVO1uGLxG8lqsBEJZTpl2VsjT0DDwGhPNXOMNNcV1QwtJpTXQ69QKxgwSIxvbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUQ92WJvnXFczMYNl/NS6WSzGJNkErwFqaurEj6q6uw=;
 b=bWnZYfJSdyyLY9mEm+SFQNrdPoCa3qgxt30m7f4dPu9u6/e98ia76X+Xe10MnsYd9+a8QqlUZxllXXTx5OuR6m9XXrbbfCdIm5YtbbOnUqTVspjwR7vbgyZjMZoHLKa4uv7jkNlAbI92L1f7dDOEpZqNN5axjsP2EkWQnfmE+ZSFbSag1YSLPYvYKiuRTn/Ov6A84P2bLJa5wOD8JqM7yMESnVDxutnSyf5oIBW17trU/Ns5lfIVFotcr7KA0u/y3u0d57Yw2N2cZl+4qtyRoV7UE6XetJzhht26Jl67vzEkjL579u2Cig0NMZAbJ3wq9a5SjjIRp17zZTMX6xgCJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUQ92WJvnXFczMYNl/NS6WSzGJNkErwFqaurEj6q6uw=;
 b=O4MiGpitlPj/LUvOJTnuzzq4EayyuYIj/QzNhMyVVi3GRKMyxZR4cjMn63ZBQA8IDhnqZaEg5RbJJJAxWTKmRPL9Rk6ud6EKIPEuunL8bTcPr/qoo3fOxTVqYK3QOMUbOXihFABhKqWayEvsUr6DySaptEdqowkKB2Mq5Du0ltg=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 08:55:15 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 08:55:15 +0000
Date: Mon, 30 Aug 2021 10:55:13 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] virtual providers don't apply to runtime dependencies?
Message-ID: <20210830085513.gbcfnseeqvcvz6cl@fedora>
References: <09ae7be-46c4-ab72-542-a450f6132b5b@crashcourse.ca>
In-Reply-To: <09ae7be-46c4-ab72-542-a450f6132b5b@crashcourse.ca>
X-ClientProxiedBy: PR2PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:101:16::31) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR2PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:101:16::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 08:55:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad066040-8e60-4361-2106-08d96b93e24e
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3348:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB3348403F7A320C70FE15CE83C2CB9@AM0PR0402MB3348.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z0FrqGM9Jpo0wXCt75r8YEI2KcTs6l1f0JzysDr01n5nxAMEkZRs1JAWl5FR8ON5d4wTwbiYgNLAO+0UU7SgVcY3t/6CCq5D19ryhLbWEPjN8DGF9zxe8sauqRyS1nzmcJKphHmQ9ewCNwqtoU2VfbGv0dt4gQ6EVNiGB30EbLuer7XSDew8TKGQYvh39eLt31HC6VdIBkNyCMRKnm4mLIZm+n291wqzC9ZuioaDFbCKDXwILhPfXUpZ4NIuQUxj3Yo4Nq0P+tFwtCixP2pRIEaAtUPUxAHyLUJ2He/mdxrVZLIFC6dq5F4eRX+PxpuRAyA0UcfN5rt3aMacZw8q0YwkM2/OOhE6jwQIOsPCCZNZoFQXAqqRiXQ1MQ42enMUatoncFAMW0RHsdTNJZbop1k2iazxb80TdgamdwNXIMrzN4CSE059HD1GYlZzG5n1ehCqIQTS68CzqojOIatBSSptZKIq0xrn50RsGRrTN+JheKzUftsgS0AO+yNP4SJ8cPdsWj8eGBpsn41useZKYg9DiFgxpnmyaC4yvcOnQ6uXsuXzIMGBQnjFvZJH+vzRUufRf55M2MSTlBNVlrskteBQHcYK2CARyU3jlxovN07FgEFDGNmpUf4PrWe4ZM0347JFYGNdypBJt+2yTJRTBBntsnT416YkLeZ3SwEJsoZSw9nRUqnpDY5Ga5Ey/AqkqSkhIjMOcN9JAZrglknd9/vGv51tcwJNXO5deRrjAwlasIs5d3eCrSDwRKtcm8xeZpKBXzhjB6RXNs/F7xPyV4qHID1xjsXG/+5L7Zxz3Pk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39840400004)(376002)(396003)(136003)(8936002)(478600001)(52116002)(1076003)(956004)(44832011)(55016002)(316002)(4326008)(26005)(966005)(5660300002)(33716001)(66946007)(66476007)(66556008)(8676002)(9576002)(2906002)(38100700002)(9686003)(6496006)(38350700002)(186003)(86362001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p66Pi7V/+FCnPH8Ubtb1NyepUFp42CztvbUOLdm6Sr6eX/NArEV16AEWwosj?=
 =?us-ascii?Q?A1YWCcf3aiGAvboel9YPX4/BrFN1A9tvQHX/1daS0YEpT/VntMvxz6glH4gz?=
 =?us-ascii?Q?KSIFTDrK5+0bBA95DkUoO2568kFobrFw0bm4sPbZdhgAfMTNvBXRwVCpBx9C?=
 =?us-ascii?Q?mr9B0UaYEw3CHz2vd+nAqcrx1Q7jpWzwlAHk23OQB9I1eo+iGl9AKF/VTqAX?=
 =?us-ascii?Q?zz/bs/956noyL5zHxWi/Dfv81iZNU+ZbKscf69ROpEGe2aQ+SVj4Afhzk1R7?=
 =?us-ascii?Q?+qM2jEh7cRqEVYTFhQauVN+GqQUzdA2tEo9w1IvyO/uDkQwVMB+78ZpCC+Op?=
 =?us-ascii?Q?8rRxM9qMH1jlcCC3qB4itGdO8Fi4etcHPZU6IuoxZQuku/tkEg+PQT1OGfHV?=
 =?us-ascii?Q?2j3DHfW7ijd3YEDBmAijoK/G5n6JirErZGmX7HSOj1kxhayT0D8iCtnPvZo0?=
 =?us-ascii?Q?03MkjvZEhppVcTfSX6Y25VN0z3AYltufqYqHk5aolFZBk19kg7ugm6ON5Ybf?=
 =?us-ascii?Q?e+2+jecfTNf6Stlt25sACXOTzoQBxpd6EEt2i0ZtronxSmModzqCBgamvZAC?=
 =?us-ascii?Q?7i1esEjXPmSFzffY8rH1xZEj8Eg5gsZhrmsiEqac0eHdcGVfSN/7LFE83Byz?=
 =?us-ascii?Q?FiVc+irL/aFfjjr562KDQv1dy/CLymm7MVDNIXk54vA4sshci02MOs2VHelY?=
 =?us-ascii?Q?piNzbquvu8R+t0Y57X7ixuis+CvoioUNCQDEwlYxr8rILpkz/EaInYw73Gf9?=
 =?us-ascii?Q?qocBv7Wy9z/fexjLuW3r9T+Padk0pe99e4Q9d+lVKKVsnoHH+QIeNdxkqDdZ?=
 =?us-ascii?Q?2MTzmQUzao/2bruygqYDXrGc28mWjtyORqKbJ+nZTTg5jfVdzynMmFxoo/GN?=
 =?us-ascii?Q?e2vVZjTD7mFDpAQI01kt/efsVlSjE5cueR4J2MQluESO78v08cMja2I6McSW?=
 =?us-ascii?Q?DUjl6kRqxd4vahFa4Sd4kRkWVKFmdXJ7bb57tpU5sV9n071lL/bcidxzxiOv?=
 =?us-ascii?Q?0cWaAUWgm4qWlfpn9+B8rnALgbH/eHbcfWkcncb7Vjm73HIMT3xwbVbXHEZX?=
 =?us-ascii?Q?2WHU/bkNU1KMbEgYGVUefiRwGEx1ME9wq+D0Xfs7r3YsINVByN8D9Dw0NCmo?=
 =?us-ascii?Q?0QyT0Ew9toIY2vESlWGRuigr2CUrvFZ/gAh6HlnvVxQD/minQZkbNuYV2v6s?=
 =?us-ascii?Q?KkC91Wg0TnBwn2nqElpSxR9lk0Yn3BYGnHTHIEzVdwVvZJvlRxxU0a+1/VRY?=
 =?us-ascii?Q?ZhjEIjJKuqW8M6dCJ/ETzlTeasT2UkDovF8TvXnkHd8xWj3gXXVQ7wp7ocMx?=
 =?us-ascii?Q?uELD/LYGC32YhjMfMXpI4+90?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad066040-8e60-4361-2106-08d96b93e24e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 08:55:15.2630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bHOuymnYj11Qq09RxhRHz81ey8cKJ4SDVjbYa70ryAtbbaV3Xt+Pi+D3NnZGQcrzft0/mYydgHPJK/6G7cEOEtUY+I+KWhnOyKhGcZ3NeKepiLI53tUp+7HeMttL+bH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3348
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Mon, Aug 30, 2021 at 04:44:04AM -0400, Robert P. J. Day wrote:
> 
>   in this section:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_dev-2Dmanual_common-2Dtasks.html-23using-2Dvirtual-2Dproviders&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=KmpzsKHNSuOM9Ab5FNlaySwlxkBMhRzyFvDOggYf_W4&s=XNc1PJ57jK1TMWGsHAEk5MVPDPvGxue_ysp7BNRL1do&e= 
> 
> one reads the note:
> 
> "Virtual providers only apply to build time dependencies specified
> with PROVIDES and DEPENDS. They do not apply to runtime dependencies
> specified with RPROVIDES and RDEPENDS."
> 
>   except in current oe-core, there seem to be a couple examples of
> that:
> 
> meta/recipes-core/systemd/systemd-bootconf_1.00.bb:RPROVIDES:${PN} +=
> "virtual/systemd-bootconf"
> 
> meta/recipes-bsp/grub/grub-bootconf_1.00.bb:RPROVIDES:${PN} +=
> "virtual/grub-bootconf"
> 

I think the point was that PREFFERED_PROVIDER and virtual providers only apply
for the selection of recipes to build.

You still can have packages named the same (virtual rprovider or not),
and I think bitbake will take the one from the PREFFERED_PROVIDER and if
it cannot find it in that recipe, then it's going to build another one
that might have that package.

I had that issue with openssl-conf (or openssl10-conf, don't remember)
package for example.

I don't see right now how to rephrase the paragraph (provided what I'm
saying is correct :) ).

Quentin
