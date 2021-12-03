Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820A9C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 10:20:52 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.66])
 by mx.groups.io with SMTP id smtpd.web08.10003.1638526849466098428
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 02:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=qD8/7l1S;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.66,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ai7GYYxOYtZn/ioSNfBKteOgFrLZSFFQQLHRnv2RNUEA1ivLwEr9uPIUS68kXe2ICCK1GpTJPuE7oq2Tj6dEbCMLYxnjeDK/mesUHH8HfI9t6dSbLe7Ol9n8JCL4mCwKxfVohotRFf6P9VRkNtaMgVYiarjND91KdfEPCV0S0L4LmxO5xm5mpSkcb6MV6iBLE2wT70EWP6OeMQ85dF3H5rj3nHzvOW4kfq+EuOp4sS8mxbt/gM/fUyFLpHESKu4kdwEJo+szhsFZE65CCG0QI0lNmaQHO0tT78IZiZE+wnoN4T0cYK+0Sdvbk477Wo+C7BDw2ZCzShm8AW6QTiVrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAQoyC1WInrK+vXvvwCETbMjns67esF7QZcbsumCUXQ=;
 b=O2iYGHtXxzse7uQYSTyZYlXSwQR3tqtiQRaOSQuyQ1BjskFjHNmvIp8gObvaRi6Rihr7rORPCERHoLBrsOPPM2NYqaLTBCdVKUY6MF6p1NGC2hn1gRPMvtOX3cRwVxT58UuKsgeh1/Frbdh/UoE35oO3S5j77A5f34p+W8OATqnCpfMMXlfJv+tgfxQwdorQdtJq9LZfkisQcHxnVXpE63fufnWLRBW+66t8jMQn2V584JSAshUP3ahegryfYMVKqu+eVM62b53lFsZ+hIDjaSZFykjzCn1Sn0X/f4EVgWtbj370AV4N1RMk4cr3N7E2JyWh44t5eCCiS1mzHFwTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAQoyC1WInrK+vXvvwCETbMjns67esF7QZcbsumCUXQ=;
 b=qD8/7l1SSdVgvh+7mQxmjMNGFSa7YayzVBBvLEVX7Kn5KTGqGUIPlZnFtUw2b0SCZMa6w85SE9Sg3Hu9EMG81HBlBfVvT2haNscXgLq/Ttpjnu7i3re0xUi5sMI3qOxKaL/y3SVWhcxsefB6pWHa0R59HL2Lfj3/zSkl1CWwGv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6516.eurprd04.prod.outlook.com
 (2603:10a6:208:174::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 10:20:47 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.016; Fri, 3 Dec 2021
 10:20:46 +0000
Date: Fri, 3 Dec 2021 11:20:44 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Giovanni Simoni <gsimoni@infinera.com>
CC: docs@lists.yoctoproject.org
Subject: Re: [docs] bitbake-layers create-layer could be mentioned in
 common-tasks.html
Message-ID: <20211203102044.cq3fv4qmqq74cwrd@fedora>
References: <20211201141140.469D941C286D@se-gsimoni-lx.infinera.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211201141140.469D941C286D@se-gsimoni-lx.infinera.com>
X-ClientProxiedBy: AS9PR06CA0403.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::33) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AS9PR06CA0403.eurprd06.prod.outlook.com (2603:10a6:20b:461::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 10:20:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e42c081d-d9ab-453b-fd61-08d9b646924a
X-MS-TrafficTypeDiagnostic: AM0PR04MB6516:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB6516DC058C7262D29FCDCF76C26A9@AM0PR04MB6516.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aC4GszlkRIO/nRG7JEQUUR4weOKlFhPKlwp4cumadFm4jkYNMfabkHA3oHE54XDhbV3cEqSnvtDEKXqir+22k+pklcvNH5MUrYxZRmI/FnOE+o+EQzuiq4TxE5IFqSRS4M3ALNSjhcRgwJ0hq1pcTH7hn/vTgf/jBESSiVtgt8R9QrWjQPKhPjSZU3qKJkLRmP5VpssKMEeUSYDx6t1gd2hgAhw26f2b6LBqZNI4X6x3Egec4KFhAa4j8KO71bbeIIIc4N46kNhFEsfu7hwYM53RJrPgUddCXRx0wuwITKxwJWTcq2mCAPm1JtMwuqIm3K6q4u75DWIMZApW1G3NqPo7jNOrM06YV/ZAg1a7u8JwsY9qnvsH8IdwMuF3nT1gAKrHE+8VRk27//EKCDEURvo/9QrWj9e5+EVK8dQwQn/SHemCXT+QZy0sUbs1xCEUoy7WwVmCaOhOQXofE4LWL5rnInui6NQX+gkAEzDYZ7IEVqW+oR8RQx4DlWTS1na762hDt68I3SSJv/drFjKxd6yjBN2RNIAmFdNuRRk72KGKOqNCFb7ixZ5WDMFn2fiuZ0F/crIGMz9WYssIAK49nvpd7+LVx6vASftVjxHgcpi6YCRyYNSWBsQrPtFc/lgxDQk0wCc/mWjpqEqHBFj5MDyU7nupmdyK6pJib3l0urFfyC37QoTTlYSzKfk26ZmkhQ0WutvWxsCZToWqbrO/FpnYndDiKE5ImcX7kMjVYh/h43/YRXHPpwulSfKPRV2CZYjhFlMDFQAQSCRNirL5dAwkDNP4Q1KauFgIveQW4ig=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(52116002)(5660300002)(6496006)(316002)(86362001)(186003)(9686003)(508600001)(2906002)(966005)(26005)(66476007)(38100700002)(9576002)(33716001)(44832011)(55016003)(1076003)(66556008)(6916009)(66946007)(8676002)(8936002)(38350700002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JaQgARPjtGENF0TW8O9G5k1rQP68C0akZXAFxLTCtMTLDSFj/zFeGNo04ows?=
 =?us-ascii?Q?I86+EHjzEeI6tmCRtRCUxnm0iUgMYQHh/1Yr1PCfKCp1G/N81iiXW+Gcsl6a?=
 =?us-ascii?Q?UFSmh44+JU+bZCIcA2vhkgcNHRNpCopfIlnricGpq6wcaHrx4JpUwmAyHJ1+?=
 =?us-ascii?Q?V0iyR4dhg3jtLdWWEdX0p0CExUHrw10ssqb4/YUfx1IWgyDfjRWcm9CBXhe0?=
 =?us-ascii?Q?0QEWPs0hO7HcUIHPTkIFIPdtRuYEoKzzyL5a2lt2tYb8WZnije6GyMoRstc4?=
 =?us-ascii?Q?ie2rJY3nPwdIQbcd5fxitVyOu/dc5Hfv3+z9nJ9XG8+7MKCHDFXKjRUTz256?=
 =?us-ascii?Q?XqotLZM5DY9jPYn+p5pzxkm7G7rHsJwigRuqfWKeTmQOgY8VxDXRzRRgTEt6?=
 =?us-ascii?Q?RsDbNZE84OxVwuKJFBj1RPuzvxLpsPREe0uzrSQLTn/tlM7ux++PpykF8dcR?=
 =?us-ascii?Q?g87ZRhhtxovpQtQFBr779l5ofPCuJFTpwtYjPf7pl0NmD/l26TTja1Ir2e+m?=
 =?us-ascii?Q?w7a1X8eNK/qD7dJpJ2EacMeI3TdVeJvOGsV8ld+Qt6rzGBietVzLT3GJ1aSl?=
 =?us-ascii?Q?j9T9xXfZsmoM4JEKxrDlRSJZB2GBNamGPwjqsJhcRs6cGjAsoyuIIQZWorim?=
 =?us-ascii?Q?AkyyXfx46R/sGj8B5dJf87lJTNbGixjZYS5yhHimZhDo102EQX+qONm+nriI?=
 =?us-ascii?Q?4f6eYu38jUaYjgJMKhlg/O+lxMsjkEYliD+U8xV87PxNzA1MGx650X4a7AX1?=
 =?us-ascii?Q?Xw9m94hd5W5tAC5jpIX4eb7ncabt2WA0uDR7m+Lph2Hgq1ndadm8WGk8pyrX?=
 =?us-ascii?Q?neZR1Bgz2uWRDqNUgezerimwm26o7vApnAa4G1navvahnJPgKTIH3SZIKKXG?=
 =?us-ascii?Q?f7rpB3uoT5uMFCSMRxFz1fbLm8dbpOjrnQHXwjaUE9RyWId8lZt+nlpTRd6a?=
 =?us-ascii?Q?cjCXAbF2kybp8gjvZ4x+DOlvPlXCl8zgM3YzBWBop3eyP+OVhyn1bBHzdLqo?=
 =?us-ascii?Q?3n4KzdNGs0L7tAAdfPWkc3Cb+7spvZSWX4rWo+MJJjBfT4ulYjW1MXDjWJFC?=
 =?us-ascii?Q?vNY+ELpFkRUY0GNPpwVPaioPYn/t4qwY4Lvg6En8SJ1sWFRsOd+0xER/P611?=
 =?us-ascii?Q?1nTApqFe2qUxWJc7f5KAkHysyb9egc8KMMlKobzZbmDf5Ki4HvwPRsSltri1?=
 =?us-ascii?Q?/vkHD9bgnSV13xcb4TgOEDitM9cDc9PfHbXmH1/6zwWxCYtw6ZT2rV/kGojG?=
 =?us-ascii?Q?Z/5V3goTvn8CcKIhLmsuvBl29Yl3Pcs3mybCAKTf6WdBqk02RCJYLY6CU8Bl?=
 =?us-ascii?Q?Mtd6dnKlW7NvNO0mVvHw4l7BXmM47Lm5D2eFkVfxSLaKqHspb7ycRM5B39w2?=
 =?us-ascii?Q?F6xEB7Z5S03dRbHkT0rxIdFXWCU44wMWG7m0FvjJTOrgDSaToMAkbt5wzXXP?=
 =?us-ascii?Q?8dCke01l2bJWNyAZ8YHqrC9SzTnCMTEDuwd8fk8VTcI72E0UZU56kqnhzGj6?=
 =?us-ascii?Q?AgFsqYz6UfOdVx1hU63lw0n2u3QektN73VPSCvhpt7Bq3pbboQS0Bt/KjO7m?=
 =?us-ascii?Q?YrDrkTFL5ZvT5hzZ+e+gIryZaVfiSpK2WzI5ssHYmcd3DDbiHAKzCreE0lYS?=
 =?us-ascii?Q?UX7hMpkGD8JeqQt9QOmho7/p8g1C6quB/ZOXTA6yG6Ru0r0PrWq2AvitK/qo?=
 =?us-ascii?Q?b2f3INwvHVVD4cVa+oCmoyiutGyb7sqDC4rhYkzv3kdCZdLqtoPsa6EeTzpe?=
 =?us-ascii?Q?oQzcFkqPfw=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e42c081d-d9ab-453b-fd61-08d9b646924a
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:20:46.8939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 N+yj5hYkqjP0nA8oLs8kA+ya0b9qeJm59C3esHQgV8RR4AC3vyx2Gt9v0JlYh6mOXDxgHS9R94FXmyfwbuNvDww58C/DKXW6H5a59mrIyg390h0/WY7l8E8uvWICHBB7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6516
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 10:20:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2219

Hi Giovanni,

Thanks for the feedback!  =20
  =20
On Wed, Dec 01, 2021 at 03:11:40PM +0100, Giovanni Simoni wrote:
> Hello,
>=20
>=20
> I'm experimenting with yocto, and I found that a layer can be created
> with `bitbake-layers create-layer`.
>=20
> I would suggest that this information is be mentioned in the
> common-tasks.html page, paragraph 3.1.1 ("Creating Your Own Layer")
> [3], point 3 ("Create a Layer Configuration File").
>=20
> The current documentation suggests to grab and modify the
> conf/layer.conf from an existing layer.  As a newbie, I would prefer
> to know the existence of the bitbake-layers tool, and to use the
> layer.conf generated by it, rather than copying from an arbitray one.
>=20

As far as I could tell, all latest doc versions mention that this
section is explaining how to do the setup manually but that there are
tools to make that automatically for you, c.f.
https://docs.yoctoproject.org/3.1.12/dev-manual/dev-manual-common-tasks.htm=
l#creating-your-own-layer
"""
It is very easy to create your own layers to use with the OpenEmbedded
build system. The Yocto Project ships with tools that speed up creating
layers. This section describes the steps you perform by hand to create
layers so that you can better understand them. For information about the
layer-creation tools, see the =E2=80=9CCreating a new BSP Layer Using the
bitbake-layers Script=E2=80=9D section in the Yocto Project Board Support
Package (BSP) Developer=E2=80=99s Guide and the =E2=80=9CCreating a General=
 Layer Using
the bitbake-layers Script=E2=80=9D section further down in this manual.
"""

What I can offer is to make the above sentences into a note so that it
stands out a bit more, would have this helped? See
https://docs.yoctoproject.org/3.1.12/dev-manual/dev-manual-common-tasks.htm=
l#making-sure-your-layer-is-compatible-with-yocto-project
for how a note would look like.

Cheers,
Quentin

