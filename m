Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.68])
 by mx.groups.io with SMTP id smtpd.web12.36634.1629189467661906323
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 01:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=BE6Jn3l1;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.68, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZzn/C1Cnf7xAzdBe54PE5SJ10dV5oM1geHJKUEQ27ul6tUGizB2+VWYgqKkNP9HakDCC/CV6dhu6exP3/FNBORuDtnh/Wd8tqVUqrTJEZhQ/fxCc3ajrcBh/0Bvt47cJCRbXAK2LnSezktWj5BhftoYfOatOh9CsToZwdhuJ74QamLTzGunGQ79RZjcx11NefLyBl1AgjKKP1ShlNih0lqOsArne8edfHHU5JUtw8FR+sBHiGxR2JGV5n5VQxy6kAwynBvNtpr/KHBXD7Yf3bw842wcXI50LH5R4mF32ahsJEWmHglup/hhwdhjrmQklPFdIjZ0JdU86Jyf6hb9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkhNKPmb9Y7tASwjJuLQis3JpL8bZe2VDM+0FAqTTZo=;
 b=Lz51/8Rq9XVI3WDwEZAkX/graDp2YX4Fs5NDTPuG5uRAnidAHJJszv/EOSgqkUHnvQxPy5rVf8SVXHuAAzdf/eRtGqm/Xl2qqVYRupQt6qyPRPhatcz4M8oMDfeFWffAKlBqfwzJokYP3r98zXWE8CW55nigefBXIr2SQi1YV/Oe1c1PBecQwUaA2gCZaq4vQqGduseDq41asxVphjsf2cND00dyufIofe+cbQwkpDvo6IZEobUMPEB+25YGDLIdK68l4glf9e0fb0gkAXjQC3tT7hZNuO/GcsObqQpvJmlpBkkqMegOH14sfTJrnms+ofk621Yz4VnOOZgshLzxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkhNKPmb9Y7tASwjJuLQis3JpL8bZe2VDM+0FAqTTZo=;
 b=BE6Jn3l1bcTPaQtyywU3lJcNL2nMNsVpjNX2SoXJ+eB15sVRCT7K4HhWf1egAopqKfwT6E+aLyiANf9HLhcYl27oemyhQPlOug5FrMvXbBM3EQo3EN5LcqbYZFICyFuIpqGZS8pJo7JKR1jHtT7ZPufSTk9i8nzSOvfEuPQqEEU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3524.eurprd04.prod.outlook.com
 (2603:10a6:208:1f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 08:37:45 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 08:37:45 +0000
Date: Tue, 17 Aug 2021 10:37:42 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: add overlayfs class
Message-ID: <20210817083742.iddx2fmqmlwy7b2t@fedora>
References: <20210814042825.124630-1-uvv.mail@gmail.com>
 <20210816091427.25cqk6kx3mnoyua5@fedora>
 <CAKHfEaj4P2L7g993rqnQsuX5z42tKP6zZm7pznSESY9JtDbXMA@mail.gmail.com>
In-Reply-To: <CAKHfEaj4P2L7g993rqnQsuX5z42tKP6zZm7pznSESY9JtDbXMA@mail.gmail.com>
X-ClientProxiedBy: PR2P264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::15)
 To AM0PR0402MB3348.eurprd04.prod.outlook.com (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR2P264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 08:37:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8a04f12-a617-4b4a-21a3-08d9615a48f4
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3524:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB35240B1E23B60EA79A4203E4C2FE9@AM0PR0402MB3524.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iTdqnVl21fMjLkqN4Kyovk2xQBFnLRNt5uJIbM0kCYAzdp8H+pqFPA8xSYecpd7Xih5jHvmx8oI3b/yvdejl5KqmIjBKXkyhFAwTk0VXbmHZuyP3UFbd6EGUB3MyVb6Z8jyDuB1rq8yphedTMdTkZcVb1CKt4hCQ1dwvhvIg0nDWdKKPtW47z8z8ktN29LK3JXw2b3dM7f4MH4uh4ViQCfpVGzDV25NgM7STbnOFaBzfmbrv+kDpbVenP+Nz2Tdw1SJ5iTgmCJATL9rZar3jEcEe1Z4o2ccjLuT5ox2YEZvqgz2GDK+OSmRZ+t5002sOX2Ubq5utgwEwaMaJN3l/Ce8fLDrdx354WRdCpNpua/KPpErkeBMs8KYMDf8A+vOAoPr2M61iGW8nOIV7GAQ22IoAKFhCD4ifAy3MWuBiNuyHyKYtAMQ10TRAg591axPB5TrqZ/zjnnYxBCFqSNANljXNfX1aQiEguxqpyyrHdgvIihsqlmtAbx7bhPIqUjzYhfUTo0bmsdZGUvQCZG+ttuO1DQcelSsqyVtoS3nvOD/W8e5Ysb37Mp2D33jrRA1ntA8UG0j9Dvvu9HOofH2sP0f600SUq1gU+Sk6AI1XH3dZUziyPRfTGe/LZDz4YA2R2nc+TJw/DNFaA5RhHNDS8lV7sJ1AqyU0i1qCYbCQVVWijgHnPPF7V+k1aHmSpCFLabzMY41Bw4D51LqvAQbghQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(39840400004)(376002)(366004)(38350700002)(38100700002)(55016002)(83380400001)(33716001)(9686003)(86362001)(66476007)(66946007)(9576002)(66556008)(186003)(2906002)(4326008)(44832011)(8936002)(6496006)(52116002)(478600001)(6916009)(8676002)(5660300002)(1076003)(956004)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+aWRwuC2515pVqf9SGh358wMGl7TzVrY6oTL3XaUZM3cSprzw4P6eYXDtQag?=
 =?us-ascii?Q?4P2HTOzU3WfIsNqq0Jf5D96q/7U8OFbvIbw1QtDffbcAdV8oOJosGeOHtc78?=
 =?us-ascii?Q?gW5uYwOwh01D70gA8sxAAmzm4gnlxf1p+NGGuroQG4UuBsFnAFYCxRlY6mqA?=
 =?us-ascii?Q?LnMMGcui8G3piMCHgcRdEuRDFP/t1vtV4thQXEQJUZVZd01FWaaU6RmDQA6w?=
 =?us-ascii?Q?BIL/Bpq9oD4Q1OMF/EbXsdOiMmqA4FTviV4LFw5zjPPiWEsyYnRaMsnOcqT5?=
 =?us-ascii?Q?+5LDh3Kx88VdoV+nQniltpZcQ9fA0TtzGnKqqySrch+K9ted3Y25JIakVwPM?=
 =?us-ascii?Q?EQ3ijzKaH7TznN1h4Fct3KTyLEmNVSeOtxWQxD3rCLEsVvM24OMylhgeBZCt?=
 =?us-ascii?Q?3nG1wnjJqrzrSOxBm7eFWtgNJNkJNG9LWaoT7BBsUrYjHuOmkw+UmwP5Pp6l?=
 =?us-ascii?Q?QVRISb+Zz8R80di/zgSiitPtYvmUFYLdriWTS8xI5n+nf3kWDZmZfzOrRmA+?=
 =?us-ascii?Q?043W1b61THEUA8szPfq3Z1kcxeDFHs96LuWPpZuXzm37jDw2f7acqfNDH64l?=
 =?us-ascii?Q?ksnrT5MHRWx8Eth/v0OLJ2pbaeaphg+ZQPZ78iZZ72bcHFGe1/GXMF96+0PT?=
 =?us-ascii?Q?xGCaXINe37kX/7E8FTZDAuX7oMjupjySFEdyxu+aRwkQsJRSfmu611+TQfNv?=
 =?us-ascii?Q?vmyuV9EC9xy2otk2CUrpvWh+selrPoVV/yEhCJlKs2Yau2S0RzlCPRtWmABo?=
 =?us-ascii?Q?lr7oLR+7rPPnFJ12txJX5xG6IbH/gitSwNbAXtnJ9j6mzgBgMOgP8rms7o1i?=
 =?us-ascii?Q?dB4KD9Hf/PVfZtvjfGIRBjHKSEtCZLEca9wAZ6+Mh20ESLFXxLSQ7Hfg/oL+?=
 =?us-ascii?Q?AIEuWIblh6f0fsQEd4EKqiKebiu9jxNWcom21rK2xk8+juK9SzImp1dGBGXl?=
 =?us-ascii?Q?uWIAA6Yd8sEOfw/Z+mn/IKKq7wy2anQxLNcIRHK/gEVXp8D2Frp21xkSXN07?=
 =?us-ascii?Q?2dflByRSVD7auaj7QznI4J0yIQK7p3qfS2qWemvtxAU18mcfEmKA3/uXdlzF?=
 =?us-ascii?Q?MmKUv2j8EozbhR+h9lQCR5KXUuf3uSEX0uGdrNdir28COtTtTS+KhsP7lU2h?=
 =?us-ascii?Q?LHOd2B9zrOXvWg+Bx8Sq+WvjXbRIwRGBxFSXbYHVPMkQeTzFWlcNkIcyd5QD?=
 =?us-ascii?Q?C5UPlRHd/MpIV2pkeYmE5OjydfqY/9RedI2xZr3qcy5c5MWXU+X19vspqA+R?=
 =?us-ascii?Q?wUgkFqslbzK0WtOcQLQERbRqA4vQoULdolTHqnmhBmScfdityUsAFGJd82e+?=
 =?us-ascii?Q?5gFR5xOYT1wEVxlwVtcBm/Oe?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a04f12-a617-4b4a-21a3-08d9615a48f4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 08:37:45.0324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQe2gZN8fg/TZpRbxsdQ2Esd/zUJxLKAJOaa0LVO/NvXiXcxiPbhIX6O5egdZCxoo5tN/rQTGOX0KCbzQ93y8OKNSj9eVgh1IT2Ew3F5ghA6sqX3oiN9ebLebZIk17N5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3524
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vyacheslav,

On Tue, Aug 17, 2021 at 07:29:35AM +0400, Vyacheslav Yurkov wrote:
> Hi Quentin,
> Thanks for the review! I'll address the notes in v2. A few answers to your
> questions are inlined below.
> 
> On Mon, Aug 16, 2021, 13:14 Quentin Schulz <
> quentin.schulz@theobroma-systems.com> wrote:
> 
> > Hi Vyacheslav,
> >
> > Thanks for the patch!
> >
> > On Sat, Aug 14, 2021 at 06:28:25AM +0200, Vyacheslav Yurkov wrote:
> > > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > > ---
> > >  documentation/ref-manual/classes.rst | 46 ++++++++++++++++++++++++++++
> > >  1 file changed, 46 insertions(+)
> > >
> > > diff --git a/documentation/ref-manual/classes.rst
> > b/documentation/ref-manual/classes.rst
> > > index a98a64c43..5d33e81a1 100644
> > > --- a/documentation/ref-manual/classes.rst
> > > +++ b/documentation/ref-manual/classes.rst
> > > @@ -1710,6 +1710,52 @@ one such example. However, being aware of this
> > class can reduce the
> > >  proliferation of different versions of similar classes across multiple
> > >  layers.
> > >
> > > +.. _ref-classes-overlayfs:
> > > +
> > > +``overlayfs.bbclass``
> > > +=======================
> > > +
> > > +
> >
> > One newline is enough :)
> >
> > > +It's often desired in Embedded System design to have a read-only rootfs.
> > > +But a lot of different applications might want to have a read-write
> > access to
> > > +some parts of a filesystem. It can be especially useful when your
> > update mechanism
> > > +overwrites the whole rootfs, but you want your application data to be
> > preserved
> > > +between updates. The ``overlayfs`` class provides a way to achieve that
> > by means
> >
> > s/``overlayfs``/:ref:`overlayfs <ref-classes-overlayfs>`/
> >
> > > +of overlayfs and at the same time keeping the base rootfs read-only.
> > > +
> >
> > I would highlight overlayfs with tick quotes (``overlayfs``).
> >
> > > +To use this class, set a mount point for a partition overlayfs is going
> > to use as upper
> > > +layer in your machine configuration. Underlying file system can be
> > anything that
> > > +is supported by overlayfs. This has to be done in your machine
> > configuration::
> > > +
> >
> > How do I know what's supported by overlayfs? Where can I find this
> > important piece of information?
> >
> > > +  OVERLAYFS_MOUNT_POINT[data] = "/data"
> > > +
> > > +.. note::
> > > +
> > > +  QA check fails to catch file existence if you redefine this variable
> > in your recipe!
> > > +
> >
> > What about:
> > This variable must only be set from a configuration file as QA check will
> > fail
> > to catch file existence if this variable is also set in a recipe.
> >
> > Also, I'm not sure to understand what "catch file existence" means?
> > Could you explain to me please :)
> >
> 
> That means I check only that file exists in QA check, I do not check
> whether it's a valid systemd mount unit (to avoid additional dependency on
> systemd-native recipe).
> 

I think what I was missing is that the QA check is actually part of the
ROOTFS_POSTPROCESS_COMMAND variable. Therefore,  only the image recipe
will do the QA check.

I think we should highlight that this variable should only be set in
configuration files OR image recipes. (or basically, say that it
shouldn't be set in package recipes).

So I'd actually add two notes:

1) Variables to be defined in conf files or image recipes (or say the
opposite: not in package recipes)
2) Only existence of the systemd mount unit file is checked, not its
content.

> 
> > > +The class assumes you have a data.mount systemd unit defined elsewhere
> > in your BSP
> >
> > s/data.mount/``data.mount``/
> >
> > > +(e.g. in systemd-machine-units recipe) and it's installed to the image.
> > > +
> >
> > s/systemd-machine-units/``systemd-machine-units``/
> >
> > > +Then you can specify writable directories on a recipe basis::
> > > +
> >
> > If package recipes are supported, does it actually make sense to have
> > such variable in there instead of in image recipes?
> >
> > Just trying to know if we should highlight whether it's a bad idea for
> > users to do so.
> >
> 
> There are actually two pitfalls here.
> 
> Semantically directory belongs to a recipe it's used in. If you redefine
> OVERLAYFS_WRITABLE_PATHS in another recipe, do_rootfs would fail when two
> recipes install the same file.
> 
> Another trade-off I had to deal with is if you redefine
> OVERLAYFS_MOUNT_POINT in a recipe, then I can't catch it in my QA check.
> This is due to a bitbake limitation, in particular I can't forbid further
> variable overrides. That's why I mentioned above that this variable has to
> be set in machine configuration.
> 

I feel like OVERLAYFS configuration makes sense only when defined
globally (conf files) or in image recipes.

Just thinking out loud right now but couldn't we add the following in
overlayfs.bbclass anonymous python code?

if not bb.data.inherits_class('image', d):
	bb.fatal('Only image recipes can inherit overlayfs.bbclass. %s
		 is a package recipe.' % d.getVar('${PN}'))

or something like that?

What are your thoughts on my remarks?

Lemme know!

Regards,
Quentin
