Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.88])
 by mx.groups.io with SMTP id smtpd.web11.23135.1629115987480339146
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Aug 2021 05:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=XG5YKwp2;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.88, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOtD0PnHNnQ0+kVi8WnZJNBCtCLQhssMI4rRajIILRgHthoP1j4yAeuQkP4CfBTNbuOpAT6YdyMKRKJ3r832gxN8Lhn7iUpVDOgVcnE931YHWr10ZZ7rAjhUPk2qKMmIGTKvtfkgKjX0tkdzuTUzZFQN6zvTFouhiwPiqhoQ8syjQlT7HoYtQkr5AhVPFPu1UKavBE8k5R7vlTit1OIdentjSsTY108tLHjy/NsCb+J6haWw60A2UDkB8P99ZioUkvfvHWsQk0vTKKjpA14pFP602QWmfUvYNwgzXW3BvJFXBYOUYrs6zAkHbXZtHOb+yegGfKnHFLboTL47q+6P8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyjDpeet7T3tRLNyNdq6x7LkTElyD8MWl+SyKGfLDe8=;
 b=HKg4qWv1v2Yt3sVl2uqR/SQZN5A9pGcYKn5NK34n5dC+zEUvm42DMeUUC97Yp/RukfF00wIiW36J6MJQfQSVus0jR+vbyY7EmDYG95OGIrCjAzqE7ZkH7tVshLQzMTkrvXRFrBAzslXYPP9NRq5uW/cS5JC51RU9kdTnxJeJzuNmIWn+cmJXp6py6pwGL7+4MQzRdYynrpatX4n/FIEW4tLxIDNhuZmzgb/0vRO8sJNKg8oaWIoWhc8tcKeZI/+NIb8ozp1oF/X3772o/rLobuuRq5+m5L9rEVG0svZXzUMOndXqf4/DpzC04wzgvKzpmfFoCTjP5DYFmVd+2XRLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyjDpeet7T3tRLNyNdq6x7LkTElyD8MWl+SyKGfLDe8=;
 b=XG5YKwp2/xuVNI8HaCbumNErnZPEH1wfF/wQ1liLbPDhHOWJCaXN0ae+0tUiYy+zUYDX0w2cD/18Q9DsOusbA1ZGxr1ib41ykC6OQK/yBfCmmjUpU3Mea3v3+FVRZj4cE6IqSGXaegedkVmQuodAyl6gO8K8BMBZQnAqC+hFEC4=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Mon, 16 Aug
 2021 12:13:04 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 12:13:04 +0000
Date: Mon, 16 Aug 2021 14:13:02 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Daniel Gomez <daniel@qtec.com>, docs@lists.yoctoproject.org,
	Daniel Gomez <dagmcr@gmail.com>
Subject: Re: [docs] [PATCH] releases: fix typo
Message-ID: <20210816121302.czbslip3pfsl6qmg@fedora>
References: <20210812190309.347619-1-daniel@qtec.com>
 <CAH1Ww+SS0iaAMChNzEGKrGJf9h=fmv-HAnSPAgk8oPG-FyOj4A@mail.gmail.com>
 <5180c3f8-d798-cc1f-13b0-61c3f0ed9046@bootlin.com>
 <20210813132357.z4ju4djdoy3imlpv@fedora>
In-Reply-To: <20210813132357.z4ju4djdoy3imlpv@fedora>
X-ClientProxiedBy: PR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::14) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR1P264CA0027.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 12:13:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63575e47-0fcd-4637-7347-08d960af3300
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB6452EDE189C58D5914904682C2FD9@AM0PR04MB6452.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q+OB0CfKJMrlM7FlBYwnHyw5VINqEn1c5UPpOsMnkcTXyfD2b62s8XQmXvlKJeZmAtsRbkUxBN7dXOd4Lh2r4vEa6EojL5JAlZeFCZMEfzQqKUla4dlj1GIr9wCmtWzKD0Ry/8vZ7TE8Tzgg2sw96wX6+/F5CSgHs6VDh35iYIDr5Hdk4VGoQizQYj+hpQtXlb5vtcjzqaBN9lBdVG7KiQ3OJu62DFToZkQ/gBCc6cOJJFPrNak/RaB6Ris1A7b79lAgU6scffSBEXnz6GBIM2E1b8b4W2ZuhcHZzONxg5U/yZEq0erSxAmPaQrTVj1YcJgsKkcoTWYyjEU5XRA8bgnNB35kW7zShEdJVLjRL2ZAKvywpLKyMFhZF3pxRkqgUrgm7q4239w5ES16lD5VzLrcBMy7j0v+9BLIrCJwJzDR52hs6dR8YNExAUoFSe6Y3WoP9zU5ria+W+Gw05S1nYWEASSlmyP0sUT4JUV2/TrI9FXuuX8NEo872VX+EjwooroYcp0XBoPgXM1ZwoMIVA0MlckP7RI7wKFsuPsYIuJU5vibCPh6FgWrl5Evs0hijj3+KoZtWRmwLFmbRsU04brYwBkskcha33HauAWtEVTN/1tT5qsBFSWcv6cq0wycniwXLL01wmosqbOhqbD+rHBDssNSeEW3F6fEWDw42xzXtxh+mRFqCatWSkSzg1h9jlcjtneZZhOAE1r8cw6D6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(366004)(346002)(136003)(396003)(376002)(956004)(54906003)(52116002)(55016002)(316002)(26005)(186003)(5660300002)(53546011)(6916009)(44832011)(6496006)(33716001)(9686003)(38100700002)(38350700002)(86362001)(4744005)(66556008)(66476007)(66946007)(4326008)(9576002)(83380400001)(1076003)(2906002)(8936002)(478600001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qv23+0HGpVaqDIoFdv6gsPbvIFyBwhbLDQsFbagbTR5rfllTidBFRw9bX25H?=
 =?us-ascii?Q?6JMsG/rIB0m4z0BrHckXz24tf0e7PBe/kWEeMykU6jS026UPN6tQA8sTsoM5?=
 =?us-ascii?Q?2s+vOrN0PAyRqy9bvR8N8aSxawyfzehgmzORqTgdvaNISwhGtzZatE8lvJBn?=
 =?us-ascii?Q?LiURwv6SQzbeBQ2Z98HCXRGeiESipV0cYtRYGQ4QYZpQ/jL+aT9IQktWIHvA?=
 =?us-ascii?Q?Sswzx/TmJmwYeD+aGJte+r7VxaPR6DBHqJAgxANDGaYOqyupMNn0M396qVhW?=
 =?us-ascii?Q?JB894RnmE+5P4XcCF80VZKHt3e77p16aYeJmzfqhtqTcruZt/UkP9OnUkj6+?=
 =?us-ascii?Q?goskgrUMB6gHVL1I2Mt2wgH3pn+n/Lqx7o7hQD/KLA2ZluoC4jrvuBtEqtCe?=
 =?us-ascii?Q?4M8sDRNkNUcnmLlg7+erMbTC65p1SGn8Pzs+lZoufo4/k00x+wDr2RdkwZDG?=
 =?us-ascii?Q?/5ph8sIHteMQaShz8p3+FiibIcwFmImgvhV0rp6Fymnyt0t3D+2YqqG/ALGR?=
 =?us-ascii?Q?aiJvmSN/xL5iI5br1dCSZKXWprejcFYpenj1LgkkGCmr919FRX3Doc8QRz2G?=
 =?us-ascii?Q?d9AO9cpqkcOq1WXaMXvb3bhUgkjtm8lkHCPkTU9jXcLxKQNF7ihRygTimCLa?=
 =?us-ascii?Q?49Eb0NoZLYvZSLQMA6y6FHJUejDOOlgFppHdeiOweoXBbvS2Yik9WI6Mhxdg?=
 =?us-ascii?Q?YmEsMczE1COS2eFUohbvjnkQOdL86b7WJxwBtQe/9pswov8eShZayUr9jGn5?=
 =?us-ascii?Q?lZP0biFRNewuswG9ovji3W7muspEingtACRBYrbO0/0u+71fVQu9XaJhHN/z?=
 =?us-ascii?Q?ISxHyl2kaZfLySNkeLGP9ZtyYw9DNt37F8qxsxiNb1rBD02+MhD5NXhmbf9F?=
 =?us-ascii?Q?btlAN1YUXW6RDuH6di58NcDJ+TWmzMqLoGFbC3HjNIimWFEMo3t60nI/5ncC?=
 =?us-ascii?Q?RjHB0uFxGXSl+Z309MbQSruJX56Dnhta94uyw1I/hhY5W6X0+ecfELpctrve?=
 =?us-ascii?Q?T+bymYeWH5IQsZ2K/03PMfUzG+MPkUf3sb0SNmmJ3k8pEMh4GXxgMKf6pNBA?=
 =?us-ascii?Q?vVWQu5wJVCeOrRQ0Qs6OofHcBcBPTa6BnFjOCA0VXnsfX/IIMbqYi5xzvIN7?=
 =?us-ascii?Q?ExgsIXhTa9dHzp/DZ6v903ISsVvpItFuXpDAhYvjTOoUNui9Zv2xsTLj/Cx0?=
 =?us-ascii?Q?PXtscd+56xQVTQ1FiN2WcP+OSmtx9gXkssty+jZvMIhOOJz2dMkmZv2CAi9t?=
 =?us-ascii?Q?Q68RWxZhBtYT0KQer8JlHccquqppHN7X7Gi2S4zx2POlP9mSTFyr6Q/H8mSV?=
 =?us-ascii?Q?xeGQcKlHNNmAtxI1vdv+fSaB?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63575e47-0fcd-4637-7347-08d960af3300
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 12:13:04.1976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps8mwfqsOJRVROrcoijzFVhXV1buf0no3Rmb2Jvg9hChkkf6sA+jCnBA4Rfn2xjGk09bI5oma/bbd8X9Z0gMQVSg25DjFhf8SHNAruSQcWOwl4Oy47wySCZL3k/Q3Wl0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6452
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Fri, Aug 13, 2021 at 03:23:57PM +0200, Quentin Schulz wrote:
> On Fri, Aug 13, 2021 at 07:42:51AM +0200, Michael Opdenacker wrote:
> > Hi Daniel,
> > 
> > On 8/13/21 7:18 AM, Daniel Gomez wrote:
> > > Adding Signed-off-by.
> > >
> > > On Thu, 12 Aug 2021 at 21:04, Daniel Gomez <daniel@qtec.com> wrote:
> > >> Fix dunfell typo for releases 3.1.9 and 3.1.10.
> > > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > 
> > Good catch, thanks!
> > 
> > Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > I merged your fix into "master-next", and I will send a pull-request
> > today for this branch, so that this is fixed quickly, together with
> > other updates.
> > 
> 
> Similar fixes are needed in gatesgarth and dunfell branches.
> 

Don't know where I saw things to fix. Nothing to be done, sorry for the noise.

Cheers,
Quentin
