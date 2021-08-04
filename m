Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.87])
 by mx.groups.io with SMTP id smtpd.web10.7044.1628072012974187874
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 03:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=rK757My7;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.87, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkV4CTJ0UbE6CFKFfRmh2ecOirjFohMz3y2NTeMBMR/tduUojhD4A+FTgRSGV/wKVf4zrXXO1hEMItjGDmvOBXwZMj/Yfmntx1OpaHvjHN+m4hGnzlc4x4+pDsVsty/CeROxmGARodx9keRz6JDzyvd62gHfZVfONS+vNGFeu2b8qq/qDQ3RElrax69ci0eEboJMX/6xpbap8LY8uhVMuJnIA+xv/1mP/PAWGftSzWC/2HOh1RtnSaG/t3Q23xnKyqkQearKP159Rw0y04UrOoQMnZoWlTlCLTvpZu+NTo6dCQjCSfL3IIOJrXK4qiKzs7Ew04leeFN6H9hNGdnrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEJpU0n4GqRSP4STOEU8DcG2BXRygXziB0BT1QVn+xs=;
 b=H5x4K0Sxq3DIcH6xgI3tXlFwKqrv8q5uoGvchrQVrXfxY0khKrv306fl970BqSEszRzBcWOQ2z9szhwIhv+xc0Cf8bLESbJzurjQEQYfUe5tJEKxHO1dMBxZyDpaMC4XcVx+D+iM7EedmmsaSMborPj7v1dl3T1ETl5Z7xXMIrr52J9mags32MJVNlv1yL8OHHzELYmG9hG5ut0aqp4pdcgh2QSYINYvYWWWtoOYExaY9cu5F7Vr3Bd6mrDT9gs+T3qZKh55lLzafHE/i79yDFdd4U/cUobXnzN1qD87hqUvR8hompj7p9f6vBW4ra/HaHMtraXCLSfBTAmMI+Tx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEJpU0n4GqRSP4STOEU8DcG2BXRygXziB0BT1QVn+xs=;
 b=rK757My74sdyezPxlUsDQBzqwP2YelT0PopHFdxFZyKm9pObMYrEe03g2WpELYQh+mMlx2oRMyR/Ae7jQ27UAMmMi7hquP4hJ1Q8ZtOao0SOvva5xYyRniJc+gNWvTsDPgP1tR9B6LOPggQLxcRpAK/+LGg3m8T4N6wYExjDJyM=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4817.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 10:13:28 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4394.016; Wed, 4 Aug 2021
 10:13:28 +0000
Date: Wed, 4 Aug 2021 12:13:26 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] test-manual: Add extra detail to YP Compatible section
Message-ID: <20210804101326.te67ewqcjk4k6yjp@fedora>
References: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
 <d982b722-9fd8-035f-878e-62ce7da99e9c@bootlin.com>
In-Reply-To: <d982b722-9fd8-035f-878e-62ce7da99e9c@bootlin.com>
X-ClientProxiedBy: AM9P193CA0013.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::18) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM9P193CA0013.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21 via Frontend Transport; Wed, 4 Aug 2021 10:13:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 387d8241-bd2c-4558-ff64-08d9573080f9
X-MS-TrafficTypeDiagnostic: AM0PR04MB4817:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB4817DEF617491A1AEA90A78AC2F19@AM0PR04MB4817.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5lUnjOCAdVsmpDfhctjdsAqlsLPR3MKVJUJaLj0YfMqBs9llsDCMJEJPMc9kXB4c9+g2WHp4N+/akz5cXwB0dr941fwRM0GaVua6gPSC6wCzdoUZXQ+etE9CqLeY9ZdgQGTmucRO8CI+U/xVw+Dy7MFkL2nifXzqXu0gdJpvZjmhhIOeSTMKLeBJYx5ZDYOUE8YkOidNmf4KzLJXds6iEk1OJ03pYzELpzBpH11TwdkRda1i6hUVyNAMaWghDMtIQDu/hqqXd8cUuBpTTiFlhuzZx8OrpfuzZGreSUFctG9T+slXOBbMettWhz+S+7S2M4s3/5UWW7PHqYTCir0krQTx3mNG3vwIF1qhxFVOueuqt3odeQoobfx/V0UGoP9Se9gVrr6KHBwly1sMFYjdDAZtXNUigKbJbCKIlhdGb28uhAzFxpqhqQgYt/sCRFnEuf/iEIxB5OEik5m9xTWGj+MCnljtj0X2OSDfY4swRoWXyrxrDE780D/0ESR2nmF+EXAkStPegmMFBJRu3LmUSTr9TgDwGeymTsEjHRzjywrYYzN2TCDGYOe0fdUIamdaeHAv1zifuw6vN/smAaMdpKSSk1JoAULWaCPdpXiTspLaGLwDpk5EBOI1ErLrLa0DmZ7n1im7ENenJ1IsxWHDgHbUq382fAYTy1HzdwudsdTu3CERDZf1Pz76w93GoREKmufSHkIQQc1cZdMg86GqFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(376002)(396003)(366004)(346002)(136003)(9576002)(26005)(478600001)(6496006)(186003)(55016002)(8936002)(6916009)(52116002)(66476007)(53546011)(66946007)(4326008)(9686003)(66556008)(316002)(86362001)(5660300002)(38350700002)(44832011)(38100700002)(83380400001)(33716001)(1076003)(956004)(2906002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o2yAtjKWiIpVa8Xjvl9IbKsKHZ9HtBAYoducddeUcFe+ThIqE5H8b2OK89pO?=
 =?us-ascii?Q?D/RcrjJQbTLnO9YoD9pqcHk5OJ+pcdBbPwMNOJ1840LFLGCzZL1PHLVFbS4+?=
 =?us-ascii?Q?P+vGNaGSdQMQa7NUmjrS3ZZ9M0nfV5OfIr9qaalVTf+um4RxgWg46rad86w2?=
 =?us-ascii?Q?k2y1UVLDi6CraQMNpBOW1ctx0pZNNFpsE1aZt4LxnP5Gzy2Pz03MP2Qy4jPk?=
 =?us-ascii?Q?V2k16lgtWi9PDigiuF7CEGiyTQRvo66kRnApxKf+HV7NFDsVbSV2r7wP2b/P?=
 =?us-ascii?Q?MMDN1i139AIPIXmQaLMJv5jqhgXOlLjDnEFAQlJu8WzhSFI6ruW+f7phBbh6?=
 =?us-ascii?Q?pdbLAqSiQxfiD8fp53wViOcXz9IFYwBJvzIWHJKVn3+GJqA0gbcBpqtWKG3e?=
 =?us-ascii?Q?+Hvi7nEGMA6C+eZXkHcTKW9ua07ZAU9eUTftb15Qb6xHb8NnkXtuE6f6eTe6?=
 =?us-ascii?Q?7lhhiCwcAsjAqIAM+r9SbYo3rpv3ElxBXDvgFEofvllELjZA3cJk2orq12/t?=
 =?us-ascii?Q?uxOf7sblT7aoEHWgC5R4ypYlEGZArEvKR7AVtibTvJOZndTicp6iyzSD/mE7?=
 =?us-ascii?Q?taWczMyDcI9p8uLZlkLk48vE3SH1rywRaBW+VzPsDn3YbpwuBUcXckq5z6Wj?=
 =?us-ascii?Q?f/O+7b8THyn/s6b3y8PnCVrBF9TfKqtY5QOMjX65NSqywkxFkVVX5bjkAeAw?=
 =?us-ascii?Q?abXzB0i6erQnW22r3clZo9E1WYQ+IPpmIC/D9cy/eDPKSZkclCwOSXw7Mint?=
 =?us-ascii?Q?sMTHbaKOVA9xGB+xFp9Kjv9ogj0eXlM1xkIXlP/pnEqMb1k3qnqMEmiVoYJe?=
 =?us-ascii?Q?tIUL/iWgK9HR2uRCQ05PzHcy/zKGXkYvTZnlRygo2lVGziQxVBDlTunKGxmQ?=
 =?us-ascii?Q?UQpULQzwmhtMKmOXwoPgfrvHz40m9jbGsD7RX5g2vLwgK1ejvU9SlILa7Zpd?=
 =?us-ascii?Q?Ga7vTIisVg0EkuHZXN+gu9iMgVODs/CD1ydcemTygZyAhTBQP0e8jwx+FuUK?=
 =?us-ascii?Q?bPrTDb0tRIidO+PIW6D5zzJEOO4ZduDFjzBIeK3LnMnNxp75JKtr665IyAN3?=
 =?us-ascii?Q?5N1GTTTfUx+mPDWcJN7WI8Zs21nuHRHbHo1HgwScWnhCLj59DAuFxLeR0KWN?=
 =?us-ascii?Q?DZA2/FBvl2hX6QcK/zdzH2FlOetIArrBTzganL6wB1pipY89HDPytRDMYqoB?=
 =?us-ascii?Q?lKX3JiUaEH1T6G2ay7eyws4YzEx6i4+b5CRROh3Pa8Q63U+sUdB5LPfgVc6Q?=
 =?us-ascii?Q?WXe4hmPc1Bn3toez1OYA5i2r6B1Y89/3a8eqfE9hSBGT3wL5HUrv/gpntj1l?=
 =?us-ascii?Q?KGzwODFFa39sFwTo+Noktruf?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387d8241-bd2c-4558-ff64-08d9573080f9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 10:13:28.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf74EyYIutqHk/oR1vvIOwP4DZsGAjgmJX6oUcI0c7/B8b2IGXJvmLNu9c3mMfiePQbl05KYvA4zYE0VDzp5Fxg2PmKAub7nBxfmGKokQ+RCmLUdk4/rMx7rjEdRBMWx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4817
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Wed, Aug 04, 2021 at 12:04:34PM +0200, Michael Opdenacker wrote:
> Hi Richard,
>=20
> Thanks for the documentation patch!
>=20
> On 8/4/21 11:47 AM, Richard Purdie wrote:
> > Add a note about documenting where a layer doesn't support 'core'
> > functionality.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  documentation/test-manual/yocto-project-compatible.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/documentation/test-manual/yocto-project-compatible.rst b/d=
ocumentation/test-manual/yocto-project-compatible.rst
> > index a7897469f..b83a0f12b 100644
> > --- a/documentation/test-manual/yocto-project-compatible.rst
> > +++ b/documentation/test-manual/yocto-project-compatible.rst
> > @@ -115,6 +115,11 @@ Here are key best practices the program tries to e=
ncourage:
> >     user changes a configuration setting to activate the layer, by sele=
cting
> >     a :term:`MACHINE`, a :term:`DISTRO` or a :term:`DISTRO_FEATURES` se=
tting.
> > =20
> > +-  Layers should be documenting where they don=E2=80=99t support norma=
l 'core'
> > +   functionality such as where debug symbols are disabled or missing, =
where
> > +   development headers and on-target library usage may not work or whe=
re
>

Do we currently have an example layer that is following this suggested
best practice? Because I'm struggling to understand exactly what I'm
expected to do if I were a layer maintainer.

Do you want the maintainer to keep a list of recipes/packages provided
in their layer(s), in e.g. the README, that are missing debug symbols or
"invalid" headers/libraries?

Thanks,
Quentin
