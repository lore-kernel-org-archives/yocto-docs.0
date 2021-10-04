Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D74C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 08:24:29 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.79])
 by mx.groups.io with SMTP id smtpd.web12.6571.1633335866920204392
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 01:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=qY7ThKvj;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.79,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVsGNI9sV4hItjYtuOEE1QzRwO9uE3124MovJW7Swe43l89siQFtVK7m2IgXHIXKH4B6VSr0rp4Vl36B28kGlgQfeYBppPxRdpDGeUkwk+MIBK05LSc1Rtnq3Ix4SU4+13QQCChXICcYstbdWfQZ30zfSfYug0Ht2Izy5TGJLpQcuxudTJpdZGKbEx2bJWkZapEWxFyaFfx9FL+k+JOKcI3w7FoUo+GxduUn0jXd8ytXP04VW9bQweMYLOoFCGt5eHxBYYopGy0BTzXdxN5KXatI5drXlUxaucHKqvAAO0biLD7fLJZQKFltDkulN24sunJsQvYUobTX8rvbL8JVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w28tQUqgEJ4ZIpzO4r/Ws+WpkUFPqWxzGS/WOgsFSQg=;
 b=Hp6tgFkv2iHog08pcfNgN48mcXqBn0+mfSBDBdIzNIhJOXD4fmxOmeqpOAjtoWqFXAKB5L05/N6cZb6zcYFot482XYIa323cDMxAxeef4K6SrRsvv5miSORjU+XOByzp7ToFKAM/O9AXnNrQzzLVwk91sJZm6Sgx8MwhWyPsovW6TTyjhykaSmAUyr2OD9PjS80Kt+s/esGNtrTiPt2lUwatrFkTakWeq7qfcNW8gw+ORo18skxUcwcdRDqNFqJ3Z4/lRx9L3DspPn1GZDPj3BNUJ3K31n9aM8fLcw2vIfB67r+J67h/tFqY96OrJmDsQvCXo6oZKs7On+2pFWmmTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w28tQUqgEJ4ZIpzO4r/Ws+WpkUFPqWxzGS/WOgsFSQg=;
 b=qY7ThKvjU54tIa+sEI3DQ0suk9OkwTB8efQJ7/AyJdkJKzOmy0/5CSrecNEf6sG2hCBr9ybZDu9rCZXkKHpGigZT7+qAix3oxW0m9a5IvVVmv0evKR1ihigBI9tNJjn/zxCpd4bvBmWoMkZiy3E0FuZboFKVSeutLHTjcBWozLc=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Mon, 4 Oct
 2021 08:24:23 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 08:24:23 +0000
Date: Mon, 4 Oct 2021 10:24:21 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] best practices regarding using WKS_FILES to reference
 multiple .wks files?
Message-ID: <20211004082421.2rgtcfjxodmkrq5e@fedora>
References: <409faf0-ab12-33b5-20d0-aa60d678ef6@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <409faf0-ab12-33b5-20d0-aa60d678ef6@crashcourse.ca>
X-ClientProxiedBy: AS9PR06CA0129.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::7) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AS9PR06CA0129.eurprd06.prod.outlook.com (2603:10a6:20b:467::7) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Mon, 4 Oct 2021 08:24:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac5ad936-2279-4b42-b80f-08d987105ef5
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB70440A530DF5AA6147570FE2C2AE9@AM0PR04MB7044.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0XwU5OrmzjGHIBF8ApPvQnoDhj07vpJaYJsGhXlcaeuu7OCsXDWrkDrbAjVbmCH4wNGS1GAm5YncIXUBIkkdBn/4xu5FoBOPUnD9Yp4IbK20gZO1GheU6tOR8/vrzUlA4Qyevpg16WpfGtndYHlQkZs5vsn2iwvkZv+qlz+NvzIR6l6/kvaY23H7FbtrnPwpnZHFGkI0nChlnKfR+KO9XtvSPq9oSi54ExWHrBvW0qGH33hp+aJAcqlTnoOY3pqX/nbjgDAUYY+5XRv3Zk/SQpENpbCmi68SSFI55R+iv8dXjMXrskgUcpxIpfEo2sXAKP81FDw6vBi/7hA5v0XJS/3P69QmBxAjrcaWR4s3QBbtkqMbgyZe5dc9t9LiXMe8/9090q+OypueySVgnkfxCSjeOUZqu5olnviNBx8bVOxrxrsaa5IV1awX33RFqUIOc2F2IyqTXE9fC/QS6wr+Ub7+RIRy35XTum9BSfTU2tjwSfnrEDN4lINi5HiumsQVgEzRIJlFAR7jn6bM0UOqIHRH2Q2y1DYY1pJUvM3TsYM2MibfuzynN6KyJNOzQg/T0064bjfKHDkfepyCcxttW3ojuLDl1vAHpgYuXCZi5vEmzXzDxBj1L/jLmmpPvCPjVchSkoXcy2TjST8NUsbpvb/K1sqxsrc57+g/E6K7KP2KsMC6w40MPmLvPluv+22aEbA9XircnK9aMhdRvJ6OmokO1nDzNktoPExzSj3VieS2Gxoc8nEsjWoH7n2NNWJcFZM5MQzwKal6k1v81uJQSMddkKXIST52RCdBtNd38o0tI0sKK2GqA9IkyEXxLVSg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(956004)(26005)(83380400001)(2906002)(86362001)(186003)(6496006)(66476007)(9686003)(8936002)(1076003)(33716001)(8676002)(66556008)(38350700002)(52116002)(66946007)(44832011)(4326008)(6916009)(508600001)(38100700002)(316002)(55016002)(9576002)(966005)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BPEVu7b+3L/V444F2r4W+7Ay6xFBnLPSX/Opd/HHbLY4Kvl+loxD+R+peIdc?=
 =?us-ascii?Q?aQAvm4bQrET9ANuD9mm53HoGLka1Bc7HS3XXWF+IoO5DmvGSITFlm+QprOeJ?=
 =?us-ascii?Q?ZKBPgp72TQWwWczPXXOKafDI4BnLAJDTDEG8YmxJZDcSnd8GHTdeP+9Nl89B?=
 =?us-ascii?Q?qML5Npg3DZcBY3y+jTRChgcTi1n9onORRLYbp8FpNCtIejfB/x/0nyzoVglV?=
 =?us-ascii?Q?PUxkDhPj/DOaa6QNfv78FBJrsqGGUbBgzvw2ZN2iE23jOG7ihg2lIdYfxRky?=
 =?us-ascii?Q?JYCcMEWG5tSkXFFPwciWsWiIBvi8YKMqz7FS4AOqQgk5XCuHsyTdXnaDc/cf?=
 =?us-ascii?Q?7yE9oC9F4VyvhlLX0nAR6pcar+YeqfcSOgprQe13Y6VrrfI3mYSXd+Z5zgjD?=
 =?us-ascii?Q?ccCTCqTrTCPC2fJQ/aExP6vhYaMaTbsmtYzC6c9xlJVrzjoJNcf6ZHKv6a9f?=
 =?us-ascii?Q?f/PIWEIm4uo1NUAMIqRDxkfM18uZc3pNuVoH7h2FFt6dnlrCmyWWOuZMvVqu?=
 =?us-ascii?Q?YrCSIyQIAE7uSFxidOWbL8jZth78GmcT9uKcB2OdYQzWs2300SLvQyljGoA6?=
 =?us-ascii?Q?ygsWgxndFNMnA8D6Bmp/WS9GgtmhE6SZ19FpNciIqGTOFNqs0KMXpiTHfPpE?=
 =?us-ascii?Q?i7guSeeENLc6nu/ai0vcZlzd/TKEkGTfsZIB79Ww9fEBFR5wRVTyRf2DI34l?=
 =?us-ascii?Q?eRvEke1hsFo/voUbV+xhRO7wIiLwEjAn1cb1/X9oYsfbly/z/6zU/HvuLisC?=
 =?us-ascii?Q?pcMhbOxlz+Bth+CuuX9I+3LDgxg6R2cIOkJRr79BDuj2OXt1amF0qG7rEqaq?=
 =?us-ascii?Q?IFUV+VNVanSJyOs9LTYeUqvtGfsYinBZs3m/VYliWLxu2YRRUtKrve2D9B9v?=
 =?us-ascii?Q?ytmpwWtjtmn9+JPDlXbV5CM/bczdgz9yxyGIc8RPSGEfcqyAPHJzSAml2Wuf?=
 =?us-ascii?Q?kig2wmbs37Zxmj0X8dDQznQEwtQXvEYySu65DA6kqoXThgEwumLhy/qG0VCS?=
 =?us-ascii?Q?MTTGWdkGwG3vdKS/byZ1G4HK5bnkj7NhH5TyGFMPY51SGc+J9V3BffEj0vR7?=
 =?us-ascii?Q?Weq6Cx0gXpRbN7QFg6lBvIGmOS27YLGXx+mZBvGKzAmzl+1nMCzi5Y4VAcM9?=
 =?us-ascii?Q?TyCwxGVuoQVjqQ75QyndahK34il2ZBXOtuV9KPMGUwS4qO2ZvXimXCkbOQxp?=
 =?us-ascii?Q?ZmvRwQLhf+rWJ/TRiqv/CRWmr1hn6QtUoMp0ca9T7kHPGDXwSyLQkrLnzBH3?=
 =?us-ascii?Q?5t1fiGKpKUekXU0dL/XHbwiSYUGfuJ9VTNmgEu5VGlzDM0CKCDf2gLAogUrm?=
 =?us-ascii?Q?0OvOF7Ofc7NflEXyXzsNI75d?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac5ad936-2279-4b42-b80f-08d987105ef5
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 08:24:23.3523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Oaxwek1HR2bC2MjYrCIEDiYcsRebc0CgdYDoU6l2CyoxBYzwHugjenP6R8swId674UxbRXUveQcGgE9+rbMXKxFPBzQXJOaenu6r+PnchQSpfDAs4le3wmNiaMaovVZ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7044
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Oct 2021 08:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1911

Hi Robert,

On Sun, Oct 03, 2021 at 10:53:54AM -0400, Robert P. J. Day wrote:
> 
>   quick observation -- variable glossary makes no reference to
> WKS_FILES variable (or a few other wic-related variables as i think i
> mentioned once, but that's not why we're here).
> 
>   simple practice for wic is to define a single .wks file which
> defines all partitioning for the target. however, what i'm running
> into in my current project is that that single .wks file defines a
> couple dozen partitions, many of which are maintained by a number of
> different developers.
> 
>   unsurprisingly, since all this content is in a single file, and
> those developers are regularly tweaking their partition attributes,
> it's a regular occurrence to have commits step on each other when
> merging to master.
> 
>   is it reasonable (or even doable) to define a collection of
> reasonably independent .wks files that, collectively, define the final
> partitioning, and use WKS_FILES to pull them all in, thus avoiding all
> those merge conflicts?
> 

No. WKS_FILES is not doing what you think it is.

WKS_FILES is a list of candidates for the .wks file that will be used by
wic. First to be found (left to right) will be used.
c.f. https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/image_types_wic.bbclass#n57,
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/image_types_wic.bbclass#n39

What I found reading the code is that an include statement should work
in the wks file, c.f. https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/scripts/lib/wic/ksparser.py#n282

I don't know if they are supposed to be in the same directory, if the
path after the include directive is absolute, relative and if relative,
to which directory.

If that works, I think this is something that should be documented :)

I think there was a request on IRC some weeks/months ago to support
creating multiple kind of images with different wks files. That is also
something that makes sense to me :)

Cheers,
Quentin

