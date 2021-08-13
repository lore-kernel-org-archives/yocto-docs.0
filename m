Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.71])
 by mx.groups.io with SMTP id smtpd.web12.34003.1628843495943946772
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=QJnO+GHj;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.71, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYRw/hq0Ig0pEPiwYuInRafSPGkPV5TUjcr6vAglMxNiHEQmKvgUlVCoSx1Szwa1RESCATl48Pd8UhGRYF0T5M03WP3nMSlFHM5VVW/Oa2FBjECPkO+pO+8ks6ghkd7ahhphpaR4+N0ScK+WdLofvMUkjbbP0DFeZ9LrjfNkDRr0k+3SFlHWLtmhIqM9dvZ01PCmNi1sGhESDiagcJPldmmm3hIlkpDwkgYQ/mR9sm3O1Jw4VUBlOw4yz8fsIZnrPpb667zLVBSALKHczwpwaH/0sHG+qHuY1FMsjqMugAWEENboEk49RpJIavq8auf71DkrFVlSiLBBbsvigKJGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMLiTjHv61a4Gnp7Z77OUra6eMLfFt3O/gQ/nK30wGg=;
 b=V/YYb3TAOvrU2qHQsXBLF/llNel8PQoPiqY/VnLxisUawbXSCEwQcIa5hr+rjUM3C0Vdt94t4AOxRx5aLMv4h+uxgJ3mOTFXEeSNc4FM2JVSIUY8hCyIcjIUMbGBVgzVxH83KSFVLfsu2QA05lkiaqToVQAV9bu1Y0sTYE0Rnybs82J/YQ0LmNqQu+GtPOUq4G7yULJnCsfOBd7GVq+nSZBrU2kj9Xi1gKxlWtBKPk1VgmqpMvAsm4RmKqm6xxCZnjIwE97ygr1Z5C8qxf1nCCgjdMRJIzmGJBq8qUJORRpD0OLReJHze9sVHU5t4NPeP+wKVtaLJTjy9zG+x88/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMLiTjHv61a4Gnp7Z77OUra6eMLfFt3O/gQ/nK30wGg=;
 b=QJnO+GHjdt/57M24Pubz6vD+i21AjXh5yXfrmgLHB9ms6BhEOF6PadrWyaWLdAcf3f+ArYxNvhTWHMRQ2AmRpxgTiy6ha1pIDr58xxNc4QzHUckYi+8npHLhYnb3S5SgisCcr+/P3dR+ERiatFiW+A9IbFkh537lQ7GBRQ8wwHM=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6451.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 08:31:33 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 08:31:33 +0000
Date: Fri, 13 Aug 2021 10:31:31 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Tom Rini <tom.rini@gmail.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] common-tasks: Add a summary to the end of the bbappend example
Message-ID: <20210813083131.w6upkqiqki4e5owo@fedora>
References: <20210812161027.580-1-trini@konsulko.com>
 <20210813082135.ht62s672l4ap6agm@fedora>
 <2a1197ce-7dd8-012b-7c5a-1338afe33b43@bootlin.com>
In-Reply-To: <2a1197ce-7dd8-012b-7c5a-1338afe33b43@bootlin.com>
X-ClientProxiedBy: PR0P264CA0189.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::33) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0189.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 08:31:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbefa2a0-4576-41ef-395c-08d95e34c1b2
X-MS-TrafficTypeDiagnostic: AM0PR04MB6451:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB64513210E0983EBAB6AB4447C2FA9@AM0PR04MB6451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RK0BtqIwb2c7urAKQdUUr447YyGP9H6hhkz6lJnhxLxijbsufYEwrnYj/PgUWhPK2szb0uQVZjRlpYM23bOSxfFducv1Z31WeDPW8TvnnjXONiiyH7n/RgCliSVoA5dkRzIxgJmb0bxLyB4TgHYJygvU5Rz04+pb//YETYv+Xjup2OZ82CElU5JL2Uxt1q26KLHDBQcAofhAiVFY/xunS+IY75FMTpW5KXawxlpImWmSmlk+ZuLYsHLl90co/ouxvIui62/5BlIbuvtyCqCyYqSbvNXpc01MnrLEY0l486S0er5+EbCyjV/U6v3r8LlMb6qm4BY2EQpC09LwbOO5002T6VKRN2oIlUVoaYcz0Yn/kZ+acO6xoCNwUBcLECBthjd6yWt1UBIScCCZ1n/xeSPRzrPrlWU5LfKPHJFd7z3RCNUMf/+lUg57WtVtTFDsos7Sw4udMzjC3wg0plik3mqlUJTQxY68xh16WCMWBViF/X5dTYBVmUard+tvBMwCK7R3ud+bqxncTDT1bbHRVbm8cz+CPDj7qWIK66Ylh8i4QEtiAnKUwT3y/2nr7eKzyy/J+1m/+MkP4eml84JAHAXnR/9PlnF465HRkRER30z6MW/VbxtX+/DFGAm7tDypkVY7vHHTpig+D/6hJksaVwBuRCJ7Hiuz5vlGgW0M9cbWKTy9CQ+3X5qx00JHoQCZmu8WtvsN0OoOYUmeoxovGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(346002)(39840400004)(366004)(9576002)(4744005)(956004)(6496006)(44832011)(66556008)(66476007)(52116002)(38100700002)(38350700002)(1076003)(66946007)(5660300002)(86362001)(83380400001)(26005)(2906002)(478600001)(6916009)(8936002)(186003)(9686003)(4326008)(55016002)(316002)(53546011)(33716001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U15b5/Ku/MXYR9oySOhc0aAx76KZ1C5jJpIeXP4qtEQJegm7PlirzljnqC1t?=
 =?us-ascii?Q?itTIrURRIZNYCODet9BaWByKNokvr8vTWA9ZCCnSlz7npx5qPM6x6ymmqvQc?=
 =?us-ascii?Q?7jcJt1vudiYyTz/J1OzhLdmniTrS1fEH7gxzs3zU0I0dyCtg0bzdwp+Ks0Ic?=
 =?us-ascii?Q?0aj0ysOoU/U3u5/w/S9Z9FOLoC9tbG154T+7MblZvdLELacvEslQNE0ncW29?=
 =?us-ascii?Q?LLzl7GvRVgt20+r9ooFxJn2/34VprrcC/Ph52eVvoTh+Ft7pZOXFpFxloUej?=
 =?us-ascii?Q?OU+GDj04b6PlYwT8btUb6DhUnnJ9dUn34+Tk05twnB9Pb1uevzAenbQkaXeB?=
 =?us-ascii?Q?aQqy3IncX1bGo3qsFowRd7aV3xExDwETuzfXbBRgpkvD8CtsomHiEv1GXKpE?=
 =?us-ascii?Q?saOEu5f2u7lDRjkNNMUmPyDv5jGBWhC2/azKdW2bc0mmm7cHmHBZZ6toEY/J?=
 =?us-ascii?Q?hlEtYm8Vpe1sOIIN58wpxSZnqV/zcrJ5cDjk5Jm+0PNj24sxV+yWxpBGGaQF?=
 =?us-ascii?Q?mjtUX/0Nv0B0eaTXwKo58gCbLdwp5gMeDUskz6hngnykWp6KbzlkkpyRdG2O?=
 =?us-ascii?Q?bFnK7Sz1rSxzksjvVFdAVtLrq35PpYAtkHJaIX3Tohh07y9Jne4RRzdPyhW0?=
 =?us-ascii?Q?uUFP86ot28Wh0yPLt5uZ0plUshz6tBThK3lZSD7pQabiSuR0y5oQfoXtxjw0?=
 =?us-ascii?Q?EGlSEyMfxVtF/izdYYFZorp0Qebx0Dh8gQGbliTCv0ccMUZtSuvqowGfXktS?=
 =?us-ascii?Q?BJ6C05WpxdNKb6KIhACLJNZq0/HRgLQzI2k0zaurvUdudYfvRPLGDHEi+fxy?=
 =?us-ascii?Q?R5ryXu85i+S16YDDd20eXscvEVnyBLQjwTGw1BSiqk/n7ZH092bI8b84/UFx?=
 =?us-ascii?Q?wkGajcy00Ip9Pb01FqRdjlJfq73GxKse24f+LsZGPnqnKZlkmpJEwg+afgxT?=
 =?us-ascii?Q?Tqj6qppUd2J+m59nupZUbJ3IHBfmCOPoXkpFXQkiVewY0AfC1/PfYwHyOI2/?=
 =?us-ascii?Q?9buRhQ+vQ/dlB4izW+lONWayt8rzBry9RcdRZ6emvNB8vuDYq7Iw3Hv/dytv?=
 =?us-ascii?Q?UVKIT+Le98l+ipLpdNa98tkFsA16j+mcf6pQAzNPN+3p72UBMasbGJMlFToD?=
 =?us-ascii?Q?S6VfO3oG5hXaRvBLxyPeubRtsTeLnpniGJLm5MW/TRG60MN6p1NFB7mj7GU8?=
 =?us-ascii?Q?d0v/IIyakQ4Ry43NS/AIGucsd3lYwun0ld49IkZUJZrPNLvkQ2LiEiRfJp3W?=
 =?us-ascii?Q?hXVFkTbKb2WSyAI/hu8oIlSIvrI2EB3JY274bOmKA0amx397zAz/MIdrQ3hE?=
 =?us-ascii?Q?VYNQiHMRRBqWoYoYy1Qp0UIB?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbefa2a0-4576-41ef-395c-08d95e34c1b2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 08:31:33.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0dl8rGm5XnSDiDYy/HtvMmjdy5/Ga00Es4HJsBXubZXMdv1kyBTb8CV4alJuz2QxyWW1Xv6f85IXm2BTTqr4zVsO2ZxFM/3nxgB6906osNZXQiOONIcSuHlYAUDknqN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6451
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2021 at 10:28:39AM +0200, Michael Opdenacker wrote:
> Hi Quentin,
> 
> Thanks for the review!
> 
> On 8/13/21 10:21 AM, Quentin Schulz wrote:
> 
> > s/``do_fetch``/:ref:`ref-tasks-fetch`/
> >
> >> +``do_install`` will return true, and the file will be installed.
> >> +
> > s/``do_install``/:ref:`ref-tasks-install`/
> 
> 
> Good catch! I see other places in the documentation where this could be
> done. I'll add it to my TODO list, but be my guest if you have time.
> 

You can open a Bugzilla entry for this so we don't forget :)

We probably need to do the same for classes, tasks and variables. I saw
I missed a few variables that aren't highlighted with tick quotes in the
docs, which explains why they were missed by the script :)

Cheers,
Quentin
