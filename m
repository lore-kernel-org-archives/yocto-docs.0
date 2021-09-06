Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.68])
 by mx.groups.io with SMTP id smtpd.web11.22253.1630935004954172188
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 06:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=X9K1Si4M;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.68, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeHhBQzzlddTj3mR7PQHfxDGvp5B0IMwNltrZWzuOlk3ZxckLSoKgQplQmPcztZEFSAZ4z7Vg38T9zWkSfcypvmP1jt9ZjzUhSppZAQ2wcUeqFkqWxtxCdRFQeJp5C9PLkjJ2omh93UNm7OeafaIpvMxMpnU/uxY2nF4PqY8mYDYRGwSWsBMb+TmW0edDmmJQ9lBe3tNQo0m20RXtoDXeSTVBlkmxdAGPlSaRCkxoXrM+AdZ5yK6QYM+qz600Eg++mcrgFewbZqVZrNGwYeS72hFz9/PwH/FftYAav02Oqb/TlbWqHz4yO9W9xLam/YDt4AAMQ+tEKJvh0m8DH7vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=smgnu5OmLVtlep+ZH/vS65d/Z7UZSDGjhd+7N5klIws=;
 b=UZQOP9O9kQ51HHTXzx/GLaeRvZ7YC08f/OUcofPx3EVHnc+jPPSs3uIKyd4324jTqZvmAr9YFlyz9FPQ9GJ1HkBt5uoj/wb37pE9oJQfYLUlJZPq9VGRFnGtXYwL2ZffI1L+HODhDOZ5l5AHeBXzSjc1GoCGK2rQlHzYv9r0mxIG4wu8/LWNBwbxmgDRFilQxqph3lhzQKXdxTC6D4oksfbJIYrEZTSn6QcJeH1aQ2+HV1I9Yg4fnuZzhrT4gOW/Otp6E+zXyGdjdG38m4la2N8AVqjj39GeuHFRSYShuIYZL5CDJEHaPdugxn9aNG3A0I4/JFak0/+S7pViHJSPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smgnu5OmLVtlep+ZH/vS65d/Z7UZSDGjhd+7N5klIws=;
 b=X9K1Si4M4IenQW0YMJB9PbZ4+h4CBS7reUzwHa8SRBloNTPMzhe4z3hAqHAQexBsMT4YEuZKd22+aZS4HXPC+PnU2Mk1ZYa03ySzxqaf0aATH7fVsFpjsUamUiXuRoKiGUCCEk73fiHtHbhM3LnoFQGXEVoJpsSVmhynOUv1z6Q=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 6 Sep
 2021 13:30:01 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:30:01 +0000
Date: Mon, 6 Sep 2021 15:29:59 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add potential of parallelism to defn of "Task"
Message-ID: <20210906132959.h5d45apq2es6dojw@fedora>
References: <2cf272e-4b96-e1ae-c692-4a1ee6b8736e@crashcourse.ca>
In-Reply-To: <2cf272e-4b96-e1ae-c692-4a1ee6b8736e@crashcourse.ca>
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.7 via Frontend Transport; Mon, 6 Sep 2021 13:30:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c043d4b-aeb3-403c-0c63-08d9713a6da3
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3348:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB33483BE64CFD4A5948367CBCC2D29@AM0PR0402MB3348.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5DlAr77hiJSYLo3LbF2FYeUL9gGhQzxC4DJ3sFTgnYdv/AwWJVHpIX7a40KtUszRkQe4WfE2mPs38ouK8tK8eSwnO9Vye+x+R8hpMPgNEsXadQn7JVS63q8CqYCWLgwvXyJYRQi9WqFEgvJQEn4PUUWsYL4uYzKWD+dObkzIRMcN+vPqDVOVpoL9S/z5ZjjIor1kz/KT1NBhDKDoy8VTy9dYiNOu0eKqGp9zrM0ix1YcYMto15pvjEnpFd+kPA9+oZrDMXUMhHeL7kR7+m6wI8LwWLgJj2buPHaGTcoEzeu0V/UoNmAZ/UhVlnrg92F+HqbolrrOmC35S2X/53NA4hS2IISW1oW3HBMU/WKEir9M8/JQxNDqyFXClKCM4H7nheeSX3W+VV+Yku0a14K1CmP8nqMppW9b8XoQLgdwK0bg3GFZUOZGGP5ff8B54sEqNQVPnqhFI5xWH6CU3etGTKy8ls8vkTzK92N3WIPe2J2+UIm2+uWgumhVVQufoXFENhUGOjBKknT3DSToJrKEJl4M9p4Sv+MUfs5C6k0YR8nAKEUTnHYUgke+3QBKuZBXMqzfmR+DCRsgU99ACgX+wxWkWVJmzRhi77d1FCGCcAtBYiFGYVfP/2aRBcM7gF+tHiNQRV7fzJ1JAsHG/r0hZmaOLjjCsH16scbgCWNt2pL/Ga9TZyDUi+4OW2BPdJKCy4WdxWqBr3Tqfdq8dIjx7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(376002)(39850400004)(396003)(956004)(83380400001)(66946007)(86362001)(186003)(1076003)(8676002)(5660300002)(44832011)(26005)(52116002)(2906002)(8936002)(6496006)(316002)(4326008)(66556008)(66476007)(6916009)(38350700002)(38100700002)(9686003)(55016002)(33716001)(478600001)(9576002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yBKt938f3tsweB1bLybL3A03lCi6djFUOb5WE/fWw6zBh+iKE3Q/zi8PBP7U?=
 =?us-ascii?Q?nc1rEXbt5PMcNNNrRSPbjmJB0xr0VChgG0mYmeaCKzi+lmM7OmNqmd96pDQ7?=
 =?us-ascii?Q?CDbL8twwgRlmGiFIFAJpEe+7+nypqt36+IILNM7uJFR/Kfu35aRd06jMWwvB?=
 =?us-ascii?Q?abDWDJhLnFvvelChdAAjUNRy6QWNNcNJVsD+HdRz8zYob8OHB3TW/8UFy42H?=
 =?us-ascii?Q?4qfPQKQz7/754tpZm67eg5g50J74ouZoFqmggPkAunyBGgqTJ6toF0+cCkOB?=
 =?us-ascii?Q?2H7mc4PlPLa5iwrcS1O/Z8kU+oQvFsXp9m/NlUnFmdPgDs/1V1eQzSJzO3qa?=
 =?us-ascii?Q?9X69NIQZy/SQwcfz/kiB6osXjPaMnv1/D2MyY0MA4XEUXoQls3O7QH8hqgJu?=
 =?us-ascii?Q?DsB2BrAvIjS9kqx8wyPX3JWU0todWV7oWLxZqr7aVUUfgjl7FhSHsDc0goJu?=
 =?us-ascii?Q?BzkEXY7JJlmNfo5lzzPnXdBb5NQciueobaXOcc5MP1RWnZXRNzuHgk5bhNs/?=
 =?us-ascii?Q?8cIi+35/q6uR9sXydipc16uqk8joV3Bg9SEgSxK3xh6I4fqwol76PNRAJdkp?=
 =?us-ascii?Q?yhOvn2WmQiqPiCSBNYuHb9MXgbNvNiz4ZLWOUBI3u2L8Mhub7s1Az/tLP6at?=
 =?us-ascii?Q?eSAfqi4cvgs8IYVrQkmGPKYMZ49KvyltXLjUNZVLMqrEfq96ab1OpvTohYHm?=
 =?us-ascii?Q?+KvO1pZQMMJwM4ZeI4zdHTHrM0/YEOo3B6hmwlztsXwP/zGVaFY/MABYpauW?=
 =?us-ascii?Q?IrUtGK8oyJgQT70tWSH11XkQLldbsAQwYJV7Ah1N+Nic4YYX1nUqCx2AA91T?=
 =?us-ascii?Q?d/OrUOeVuL8AvFq11vRQdDVKnVom8Mq/siitX95zrQ9DLyQXmObDuEBrCObB?=
 =?us-ascii?Q?WPgYDitVrIgZ8HiICuwn8H3+JZyMN9EecHPInDpY00BpjR7CC8ABd3ZYydKQ?=
 =?us-ascii?Q?ZkUoO08auz8GwRCZti/w4YjEIYNYOLR25LC40lIAAollDwLIMUqQ+oH8yYXP?=
 =?us-ascii?Q?wUXrXuF3+B+QtiGLk/HshRQLXayqptTS5U6hs/eNhSONnVcfYq/8Q/QPMlF4?=
 =?us-ascii?Q?FSDNQqhZXus029naygcZcahSLdV3WfXiCAwxD2Jqr14Ouxpt6K6Knfc2Qo7g?=
 =?us-ascii?Q?+NwNvA71bXg3U++LiqroaBb+rbkyhZQkCexpl1//2e64cMgnu5e/eOYzo4Bi?=
 =?us-ascii?Q?ZPor8Fe6Y6ifimNFwtAfO8V123MfYwDnvkzR1nmtjpRTlUqsEadOxVE0GpyM?=
 =?us-ascii?Q?iPv75UsBiTVppZ5jeqHIa7yNxqSXkb2A0v1FsQmSgEtBkYexvCMWwQeD2nh3?=
 =?us-ascii?Q?JzbOUDS6EU3qiqehki1ziOTC?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c043d4b-aeb3-403c-0c63-08d9713a6da3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:30:01.2878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4DBGjstFhhl5Xl/W3gXh4GVj/cuSdIbuZ/cMszKKREQIaVs//+sdlG3PZuU294RdEvmXKYXJuT2AAvKaHmpe7VnaoPcaIYYZcHLoDJJrpPT+JDb26VQY2g0O0keekU0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3348
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Robert,

On Mon, Sep 06, 2021 at 08:44:30AM -0400, Robert P. J. Day wrote:
>=20
> Emphasize that tasks can be done in parallel.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
> index 32658051a..1a1f8dbee 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -367,10 +367,16 @@ universal, the list includes them just in case:
>       section in the Yocto Project Overview and Concepts Manual.
>=20
>     :term:`Task`
> -      A unit of execution for BitBake (e.g.
> +      A per-recipe unit of execution for BitBake (e.g.
>        :ref:`ref-tasks-compile`,
>        :ref:`ref-tasks-fetch`,
>        :ref:`ref-tasks-patch`, and so forth).
> +      One of the major benefits of the build system is that, since each
> +      recipe will typically spawn the execution of numerous tasks, it is
> +      entirely possible that many tasks can execute in parallel, with
> +      the fetch task of one recipe being done simultaneously with the

:ref:`ref-tasks-fetch`

> +      build task of another, and so forth, potentially up to the
> +      parallelism limit of your build system.
>=20

I'm not entirely sure now, but I'm wondering if this does not apply to
tasks within a recipe too?

Let's say you have the following task dependency tree:

	 do_install
	  /	 \
do_something	do_another_thing
	  \	 /
	  do_build

I would assume that do_something and do_another_thing can happen at the
same time (or in any variable order).

I think it'd be worth mentioning if that happens to be correct.

In any case,

Reviewed-by: Quentin Schulz <foss@0leil.=E1=B9=85et>

Thanks!
Quentin
