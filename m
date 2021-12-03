Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05C5C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 10:03:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.40])
 by mx.groups.io with SMTP id smtpd.web12.10007.1638525784714466691
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 02:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=lcwlaip+;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.40,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmB5HfEO52An0aaJb2qWlp8Nq0wlfrdWhOEQHSDi3wgYwSW7JIR7KQmREdIrqtxZqnS2XqtXLPwx6oIaIewKm1M6BbQ0IPl706bmGRsEgkgoSojeCwvUJPFCJzLZAqDRFbfcoB8AB31eHfBa14fyi5rRDmgggt+vxCpFSnNVCtQ5KGEyD7WISfut3NWkeIOnXnq8CXtzJWJPm9EI78YE1y1vxF01+lTP86DfSVAogIF4dN341wg4odKU2v1VgmKk4XK26r6bXiRKa6m5QMyDcXLo7DN+MKJW44RRo6Oo5Ar4L0rpBXWF59U1bmobTtRT092l6Jrht9YSaPu9CBbhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Elwol57teuuNozu1hsZE4Jll/nehXLqCSmdMl+VqWw=;
 b=CTjXCDdJTTvPcVyw8q155u7WPs6D8+PzOl5OUo/QlP+XEoTptNM/r1T4jRYnJ+wcRRec/paJHjmFifihvIDYKLUON8VsmLWSUfVj+yVfIPqxuA+OuNPdPKnBofX89KT0ylB1b0GB/zNSwS+1WlOwOA7LPETDU8fFWr5OcDOye9IkHOsf9Lf5bN46nSWohhAtEEay1xsh9bXuHTO8g39DSIixzNQm+ykuCg5cU/Es+g4B9r+WMdsFD9YBUhoPM/j547t7f1/Pt6yOzayeNo/AUcxZe+ViHkTN+tsajR3srVeLlj7YkvF0gYOgiZVoxGeR+UBL8iN9BiZRGH9LmbjlWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Elwol57teuuNozu1hsZE4Jll/nehXLqCSmdMl+VqWw=;
 b=lcwlaip+/lhSAVOgpiBgXiAptOURDxSsOik1rVrFulRkxapm+5oGYftbpV6y2IBVh6/z3Tm0GNx4bdDW2hE5cybHNBoVksuoRQ82kzT3e+PjXHrnO/qizO3WJdllFuPlJgsk5Bj3KSk5Ykm9U8yknPvkLSxyQqNxGdVP9tt+SwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5460.eurprd04.prod.outlook.com
 (2603:10a6:208:11c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 10:03:01 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.016; Fri, 3 Dec 2021
 10:03:01 +0000
Date: Fri, 3 Dec 2021 11:02:59 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 stop using the "transition" branch
Message-ID: <20211203100259.54n7h7ghlqfr5tia@fedora>
References: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
 <20211203093452.sk3e6ksnwmsbnjn2@fedora>
 <CAP71WjwoVHYOvLSKkW+fSSO2T5MupA-vEt1_cDfwdMjy8ZhP0g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAP71WjwoVHYOvLSKkW+fSSO2T5MupA-vEt1_cDfwdMjy8ZhP0g@mail.gmail.com>
X-ClientProxiedBy: AM7PR03CA0002.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::12) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM7PR03CA0002.eurprd03.prod.outlook.com (2603:10a6:20b:130::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 3 Dec 2021 10:03:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a02d79d7-690c-401e-e05c-08d9b6441741
X-MS-TrafficTypeDiagnostic: AM0PR04MB5460:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB54602691796163F48C13B9F7C26A9@AM0PR04MB5460.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UqFFNKiKHx62a5R5f8ABwOnfKp0WLPsYGx6WFmcRoS15+GL27XbNgsn2DM5TivH3Ts3syytjbsyVPYGDKJsdSwj+hW0KwRTeopIu8nTciYJAu8u6phu6xT31mpvZKMxv06zw/E+28d5BTVp6cPFOnMA9yurXZaPg0vfEJI2++a/AcDpj2xFvWr8YuDU0FqtBZqIaaFwKHWZ73jMVU2tn6glxcpRcwBuop54vW9sqA5y66UEEDlfZPzT3LgvMCkJNvJK0+w6vgiz6PfaO2nHgftWHwjdsvqFEJFMEYCgiWLay9rtl645wwAjck9Kg9vlLS60dARYUrAkjcWiyTmaKP5NP/CW/rtgF9bhDXhNIMC7ZfFhlZyOF3ZjFMGUPE+1Aby2mi8pwbgNGVUEENNhffs2Fojgo80DRUeWPeCMCKAJ28YOE1i9Djekh6a7CvAh4DQv9afMhyEimlzlPg902K67eGsoOYQD9AVATEu7hS2DlJ8SJGIrOZTVQZVXz5aajg2p6aP4eu7iNK0393HniHExrFT9yWciEzhG5vQU3IKEnTTYKtQ9MGD2qr1PO5k/V1lhGyQn3xRNSO4fq2InjMRicGr7hDX7tZTPjbSaczoFAEV8+UjskEFfHoXRMH45sEQP8uzP9c9Cfmn8S0wM3oy+5m5tk/6GXJ3oAeFLyIn/09aBqpZzyCYRj2mKHZju1/CL0AyJza0LqtplutJku+absdsOWc/PjelIxXrk9qvLSM5XASblzfJpAbLEAEUtLeKjgPYp60NCUGYXAk53xxFzVNAaHsNr4f/T1exLKfEU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(956004)(66556008)(186003)(66476007)(966005)(55016003)(33716001)(316002)(66946007)(9576002)(44832011)(86362001)(9686003)(38350700002)(38100700002)(4326008)(5660300002)(26005)(2906002)(52116002)(8936002)(53546011)(6916009)(6496006)(508600001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W+X7D6PxXddOIis0toCF3XBmt7SfvAi2nVjXjWN3S6it7RUlN6KB4rNQv3wG?=
 =?us-ascii?Q?MHe/JiUcEWEez4TW42l4SUc6f3/eSRrcBM9JsRXGpb9y0Hp579ez3BDChbu8?=
 =?us-ascii?Q?vfVaCfZSYiDudJ81UBAHLn7d+8HYA5AtirgeuT9uRmVE5J5bsr82hfJG4TwG?=
 =?us-ascii?Q?2/WcIxCTSI/4bNWD7mcVtFhsLNSSNcRozDSCHjP0q8IQ916JPIBZjSJGwZmW?=
 =?us-ascii?Q?s5XJDr0nriC003d3kpTB5UZd3eNuJR1CKzHa1y3uFuHE1Yeq58jCsKUer5kj?=
 =?us-ascii?Q?T1Om5Wr2pHkHRyxU4PyJEHXY6vu8pSGXrkTwCBfHXKFukaBOEDQoh8ygIwv3?=
 =?us-ascii?Q?S53AlmB5zyfmE67I7eUAoji2vgRweAytwz0Hhlf1AYzImeFLEjHThDYgfAMe?=
 =?us-ascii?Q?ZkSJjcZY3MsWQhm5u+9ooyWOlNcBwZfoM3HzKnR9FHXJSNuLB03ZP0q6Oaum?=
 =?us-ascii?Q?dgT+ZrDWRAsdeLLmYfDtAimx2ZXxevjEdA7B3U/A0a/SUHD7UIshyB6Sqdej?=
 =?us-ascii?Q?3wqRziwUF08UG3eG7aTvnM3RSNS3lh6Uf0br6dvIDJU8IOlMZ0MIroa9sLTU?=
 =?us-ascii?Q?uPZbYG+SKIZ1dTxnNwlsS2VwxQaUGjPwKDT05Je3podpconrAJvcIiYpCsLN?=
 =?us-ascii?Q?+qq83TyxXnL6JHigE0blx7bQUmj0/xAbz/EMZcXA4QaN9ykjF2fNjtmxZI5J?=
 =?us-ascii?Q?X9QmtZ4Ac8LXHprk2CnCB7Luj25hGGH8zHDQp115QQaDjL8CiBJeKF4s1TRi?=
 =?us-ascii?Q?3HvhM24Iw3+pFV9SPXQCJeXQVIotm3mHYab9mUJ+nVfVAL7Trm0i0XZF5yUW?=
 =?us-ascii?Q?PMN65Eko6v/3ZFTtF5AxQVz8dwbXUI67a6ae61CFM/lsYTSiDdcwX5PAh/1K?=
 =?us-ascii?Q?sVGdAUAy42uz8TRBl3GZqMPXtZX90MDkZMBW6j+ESWv2AF3UcZ49vBBLH22c?=
 =?us-ascii?Q?CcYfuxw/5ecDJhoHNip33mtF04KlUcV3Y+5rmJX6NhoI9NkFIhZZfLv5JfUI?=
 =?us-ascii?Q?P4oX7WsoQW6bjSKGb9BSU71nno/Zuirbm1nehLuUReimIC1rG71qcGbl13+H?=
 =?us-ascii?Q?XvHdhKCLHw+iO1ZGLgEwSKy2RXGyjPHU9/JJK7EjEtscr3F468gB31nOdAMF?=
 =?us-ascii?Q?GMHja5Oj1St6ifhvXcS/X3a9fXBmiMzubtH+LgMDT3hS/DIfxIUSNAnYz7oV?=
 =?us-ascii?Q?W6KKYeHk3jY+mjWAvCXJg3/EdAEcLWEFbdaxVZILp7Qxk/V0ua+ruBgar6YO?=
 =?us-ascii?Q?qvkLGiRLRasq3r+/juK7ZwlyJxi6QMDoBV7IGXMaX4I0xC8jaiO2HgYZJ0HS?=
 =?us-ascii?Q?R4rbE76dhSt1oB/bx6270S7qazKAJe3YASGITzqiUrGjuJApZ2Yez9yrTiY4?=
 =?us-ascii?Q?BaYl/WDbxQlKCt4ulLkYxE8FQCiIkMaMDvWvY0HkKlJqEaoGjpiUQx3ELMfD?=
 =?us-ascii?Q?EGRhwqZ8tkXjKKBMDllPcLSQeAlxsuKlavPdYeyHZMvBJmzC7kNtjdis3Cw9?=
 =?us-ascii?Q?/kwmBs6+yAscjxm3FkJG42oqfY4S36ih5h9Yyu9tDp7/CrMqHQUhAt2hWGye?=
 =?us-ascii?Q?v4spGob4aMmmElddhLucf6qyzyNlGF/XJWHpuEyQ/byz+iO2n+qMgESUIMCA?=
 =?us-ascii?Q?8EorLvQSPJw3qmiTrMNCItUoNt4PHW+hgHuJNE/WzmeVVwKKMohIDygNDOVw?=
 =?us-ascii?Q?EjkwkTLPlELN48Xq14kE2MM9MNucfaTpNQu7mIvlGEtfFutI+hGmIJijUFNK?=
 =?us-ascii?Q?n/Wk462ZRQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a02d79d7-690c-401e-e05c-08d9b6441741
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:03:01.5259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wq6vm8GWc36dEmehIH8r5VmOR+ylwQH+L9gbJEET7M43RIFhM6Y91zVFpaYZzE8pksHp6waqPg7Oam1q9IZ4LBw4iRc1hzGgZ17NSC1Ft00VR05ACXjnTBTCvx0iH0Qt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5460
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 10:03:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2218

Hi Nicolas,

On Fri, Dec 03, 2021 at 10:49:40AM +0100, Nicolas Dechesne wrote:
> On Fri, Dec 3, 2021 at 10:34 AM Quentin Schulz <
> quentin.schulz@theobroma-systems.com> wrote:
> 
> > On Wed, Dec 01, 2021 at 02:59:49PM +0100, Michael Opdenacker wrote:
> > > No longer necessary now that the transition from DocBook to Sphinx is
> > over
> > >
> > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >
> > Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
> >
> 
> I don't understand. With this change, we no longer build the pages we
> reference here:
> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_releases.html-23outdated-2Drelease-2Dmanuals&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=nyCl21erajBNcx6SkCKI_BEntNgbh6114vcdWp_vB5yDzorVFjmzdqp0WXIIpQyK&s=rw5wG0nk_9KQ8RLvE1-sbSicy4NslWaeMwoyTSUuIyY&e= 
> 
> Or am I missing here?
> 

Indeed. But this should be fixed, because we should handle this the same
way documentation/releases.html is, with a common one across all
releases. With the current implementation, only master has a list of all
outdated releases. e.g.
https://docs.yoctoproject.org/3.3/releases.html#outdated-release-manuals
does not exist, but
https://docs.yoctoproject.org/releases.html#outdated-release-manuals
does (and weirdly enough 3.4 too).

I assume we want this in all branches. Therefore I think we should move
documentation/transition from that branch to master and copy the whole
directory for each non-master branch (with the git checkout master trick
from an earlier patch from Michael). I think this makes more sense than
keeping a transition branch? Especially since I assume we want to move
every 6 months one release from "Supported release manuals" to "Outdated
releae manuals" ?

Cheers,
Quentin
> >

