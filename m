Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.40])
 by mx.groups.io with SMTP id smtpd.web11.36622.1628861043723421562
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 06:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=QJDzsUUq;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.40, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXnIJ/4dVY1/e9ydo9CFke4OMbbyjqzvyDM3V5t2rLK8g5VGT4tTu0izEKdZXn0v0oTBq7FCIDXhQswZWTODHGp7+Z9K8GwUDlP09k/AAzojGnGbNHPey+D58mURhJilktn7fmJLsNYy5ecfjXowTAyoFw4RgtKBsp6/fZwd6E3klZTO+q5CwPpqRcQPSil3DngXjYQIjZY+LkdZPU4PHoOhXxGK2tIw7HLo0+6dswikEuuud4pCtzGZCUBT6gtiemE7k3gmNA9oCvh/LXwfBoXj9Jqy7mhGUeg5W+DboPxNgvN5sq+3x90Sv7hiwU/i8fRK4lSNZUqCDcOdPs1rmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7p1aMfqOsAJdJrMe/TCeVXd7zIOLySfYqz9dwSqjcw=;
 b=M64/+kJJw6PH13ISsAwI619DcXSvJWY7Mwk2G3Dm9z1cboiJ4PsnZIyoiZ+Dn8wYebP/NSL7mLbq3jzTvXT6Cee2KgnRZHY2hN+m1lfPXCKfbC5Lun7E3ZnNSqIkaHOgNU1urOo2c+iAQTEMY+9VEJF3yq4G99KYrPdvoSELZKtU+Bduz5DH0aXUuEt6wGF9TBR8DTGOOPwiZ8G0za7txyrtKdL8snbc+Is0Ha+2vwRJYe5T6N/uL0EsSfzJ0eFBjbeJzCL8bOm9dpQILvY9rTn+L4TZe9SWwSrhyXMSbvHCfjlN3rQhALQ+v8d5NXJFtYPMELgyQ+8J4UhEauP6IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7p1aMfqOsAJdJrMe/TCeVXd7zIOLySfYqz9dwSqjcw=;
 b=QJDzsUUqUcOdln0vgE/m0ftN1XBEBNVstoRf5mVyCva1zHvZgfqfSKlkT9KyMYH1kw0jaaMB+t8n5vkUrelfGIt9rb+VwXcQI/c/xcd7PgaG8W1Hk3pUYxOlxWO7gz489R17vV13RDZJDjUPe4bN63aBJk6V+IC52wdWquj2YVo=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB7489.eurprd04.prod.outlook.com
 (2603:10a6:20b:281::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 13 Aug
 2021 13:23:59 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 13:23:59 +0000
Date: Fri, 13 Aug 2021 15:23:57 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Daniel Gomez <daniel@qtec.com>, docs@lists.yoctoproject.org,
	Daniel Gomez <dagmcr@gmail.com>
Subject: Re: [docs] [PATCH] releases: fix typo
Message-ID: <20210813132357.z4ju4djdoy3imlpv@fedora>
References: <20210812190309.347619-1-daniel@qtec.com>
 <CAH1Ww+SS0iaAMChNzEGKrGJf9h=fmv-HAnSPAgk8oPG-FyOj4A@mail.gmail.com>
 <5180c3f8-d798-cc1f-13b0-61c3f0ed9046@bootlin.com>
In-Reply-To: <5180c3f8-d798-cc1f-13b0-61c3f0ed9046@bootlin.com>
X-ClientProxiedBy: AM0PR10CA0107.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::24) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR10CA0107.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend Transport; Fri, 13 Aug 2021 13:23:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8881cef-f5c3-445e-f83e-08d95e5d9c03
X-MS-TrafficTypeDiagnostic: AM9PR04MB7489:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB74897A70410E5BC5B1225643C2FA9@AM9PR04MB7489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NVDtNzdfzD2hyGAtImd7laddG7aSyvgV5CaSuNziaoO/emzGLO53pKmWfPFmda51l+XWzDeiO8sh6DdUP8JhHisX2pFXpUhMwboDA3Q3cFTKzuqZmzCPjCAGnVjkX7Jcudl6q69Xby0RWNJ97+P24c1mdnOKdGJC0CGXLXdS8brwVnzy0P53AwPYLNtOawSJ9lBr2nZzUMds18vhWvCTFzojHfH182Cn/ddKa7rV4y8v4BhuCoI7HOM1qALx0NP8cxaoHoTrqmbskZUiC5WIGOjKnoNVgZm/dYimtITMtBPdCbyQt1SdcSb1cpuRgP3yLX9MrpozNMMXxLrGBaQmMl8xwUx0+G79T03nssIyRoxL6WDQaYAANviPXygfO7X/IWw7CQd/0nJkqWh/BM6dOZ4Gfr9g/GZMRZv2MwXUDBrjoC1h8fql8zuaLf0e2GEmpWh/wKxb2+Zn/vwAGETo0bCwZtuXS2/JT56bdstudHCkymiDxrtjHlN6mwJAXhd3rGnEDI9I41s2ohB1Iyc8qXDd47KWEZ9RuP7sBWG73GBzwd/TXqPFGerVxNQgxj5YrZwTnKSSl3PZlhe27BpyKFdfA2KC4lm3hnGk6FXPkPEJ1vUWFwZAbbiwrbloM72oWSuN9c1VZi5S7stMBGnxM0QF1wYesmh49o7YRwyXWfDzuFX7rgqT5ELVJ8zqEoVvms2e4tWdXGMDyi2pYNpaTQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(136003)(39840400004)(376002)(8676002)(6496006)(52116002)(956004)(316002)(83380400001)(4326008)(4744005)(86362001)(1076003)(186003)(8936002)(53546011)(54906003)(26005)(478600001)(5660300002)(38350700002)(55016002)(38100700002)(2906002)(66946007)(33716001)(6916009)(66556008)(9686003)(9576002)(44832011)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3wKyENTyj1rWe7deDXOulinO+BIROE7x6ZKLnjmXPhoqGJV3/gk9AF/LDQ0t?=
 =?us-ascii?Q?Hyi1uTObSs0FYDyf7UbU7lphImFu6x3CS9/R9ZYbpktPEy20p54jl51VIYmr?=
 =?us-ascii?Q?Gq1Y+EA0rUDY1rhOV2gc2SnObU8jyfInUwMN1NvKQXh4RgAPe6mxhsssKslz?=
 =?us-ascii?Q?icY3/NaqmxaKjzgqFT+/9VveQZJfTXEzAlRB/1nJNB6CMqd1KJfC/sIbKd9g?=
 =?us-ascii?Q?fBzDHgTDD+jtxv+vgBWa9JeBVI4mVq5tyDVLugYNAPQqe80ULwer49MS3XIf?=
 =?us-ascii?Q?Ai1kiDxfbd7QzOV4l5qFSxtyJCcE0NLYKhG1jE8QELz8MuxZfuD6SwUOUDD0?=
 =?us-ascii?Q?OMXD87b9ZOGjn5FcqAfBDPxtv1THCBZ/50EGqx+G+ja8aR0LQDpWpMdqb9Tz?=
 =?us-ascii?Q?R6FWtiGpOVAPTOxbHAfh0oa+SZQyNnL+1b9o8csFe3LNAcsEing0GiL3Of0y?=
 =?us-ascii?Q?SKBH8hzcKga5ITbJlviahq6YN+D/n63mCnjDAMlOI3DgBl+nWUgMjr4Mj/GW?=
 =?us-ascii?Q?BJEd/1YBQbCiFGO1I9uNbAEVkXgs1z6Esx8oiH/ymHS8basy8+gU7taL7Smx?=
 =?us-ascii?Q?VE5M9FvdCzfT7Rv5IgLCcchy3jz0q91VewE39JYxJbBfx2i9Se+Qcu+g2Rve?=
 =?us-ascii?Q?BVbw+qtHCcCu3AcoxJ1TuyHUQb7IXisNTsK59/nIrXT0E7IR1UY6+cRw0j2Q?=
 =?us-ascii?Q?TjZG7dqVvSiDwETUSILyRybFsHl4XUr1hsFO5V7XAE7PvAgDSwcDKlIxsjl3?=
 =?us-ascii?Q?TScB4MOCqrJQUC4cws8usiF9EDyaC+7Jnb220l0f/RUbsE1HCLBK5Ihd1BXq?=
 =?us-ascii?Q?66aiSsNm3XWXCVF/0+RNkOvSsD7uQ4OwNBEAJUNa0oF8qtITcJ9dTHkKsdC0?=
 =?us-ascii?Q?G64Lcj3mRyTucfTcFMqkdcAdVXeEvIYLSpr0vOORxEtHQmj52PR/Twq7FiXE?=
 =?us-ascii?Q?/giOUSgJPhSFbs1DSx95MCCOw+gdjC+RIMAiy1h+3PKo3KuVfQYwXxV2haJ1?=
 =?us-ascii?Q?HoEEbQ00zl2IIoiorqgc3xo57WmmZcf6o9XpUooYPiL+MBs1Fayd3TbT3Joa?=
 =?us-ascii?Q?gB0MkAeoR6jZmrgJ9nbyje4NGo+5EM9VXOJChURLbIRCOAz0KJpbswCm3pzu?=
 =?us-ascii?Q?njCr4i/ItCgwbU8SSnSKZEyI+HtcTN1NuOTWlXobptVuZ4v3yEL2Gd6aUl23?=
 =?us-ascii?Q?GXCpOu4i9xmu90d3NINySoq1EIuGMEbi1q35Nk1GQ6+HwTVa284IU7dUg9zH?=
 =?us-ascii?Q?/9HFvu79RpME4a02ay5ehANwEjTj0R/RIrOutMpFYIbPG+w2p2x6arNy7C3Y?=
 =?us-ascii?Q?1XKuX0z6mchr1eAnLg/3IDoB?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8881cef-f5c3-445e-f83e-08d95e5d9c03
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 13:23:59.2830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueMuOcQiJ9S9mQv8j2nZV8RftgCawLoZjxqRel34+luEys3EiH/0UIwcfvslQwmWQIHkd2k6Or/XTshuhHj7IQT0cRCvRQlorhtpOowNhdzXQZeuwIB0+IlEFKw7KqQE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7489
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2021 at 07:42:51AM +0200, Michael Opdenacker wrote:
> Hi Daniel,
> 
> On 8/13/21 7:18 AM, Daniel Gomez wrote:
> > Adding Signed-off-by.
> >
> > On Thu, 12 Aug 2021 at 21:04, Daniel Gomez <daniel@qtec.com> wrote:
> >> Fix dunfell typo for releases 3.1.9 and 3.1.10.
> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> 
> Good catch, thanks!
> 
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> I merged your fix into "master-next", and I will send a pull-request
> today for this branch, so that this is fixed quickly, together with
> other updates.
> 

Similar fixes are needed in gatesgarth and dunfell branches.

Cheers,
Quentin
