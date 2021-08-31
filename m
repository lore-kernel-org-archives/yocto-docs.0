Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web10.3419.1630403398757898701
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 02:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=FM+a2i1u;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.88, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNxZQVJRVoc1fpgVBeRWAR5Qp4KNc5xjPrEbDKt8HDaKNQB4tpGEmSLvj17mEt+5xBiF3k8H2MlspOlmxGHpraUbfDdSK6TQ8jtznvBdaOogbRXRoOztx/hIkajS5iZJjBMPgl/izqngGf9mQi2d/sKAIb0Qg7fdAbCFaMa3vb+AzaYfTRkr0LYHmvoQYQURro2bjyXHeYtYzMSPJlNM5mQ9yg3q6WRkvI0dh3x5wgZpbqPuOTlrfFlhZ29Bfoa+cOEr287Mj16k8w4XlT3P9HhLdYlvGvRtBkEvMmYXhl3nfR9uDZBb/TuYF8UjrUu3bn3b59ymxe3PmHWxW31GgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwTO8UYWDQ5VF7YrATZp+COhyF8P19Vf4LX+9FtADNs=;
 b=hx72QDy9ojOpc7LPDTTbpGfrp2AIQ/yqLZ9Yg9yAbgg2uA9v3EUIsECfN7yDsHpZrg+W1ExkYLt4Sjkz2ZBLvOMZtn/DR7Af6DfieDFOm/21K1raHT1xIPRHWC5Ws8qt58h7KgMsXo8uxVYWfiank0TLa4NWWHP0Gy+SILdpJ94wOIk4Buh34Om3q+UivFLqub9dzmP4ajEeQurMplwQcMnQ9O6s30jJzWyqc7njC6bygTlEjnslfAUx+zjX0lYO3t/z8CtK9yYg4+bY3XGkZ8NKTKlgUKxATRh4OwfRuJhEIiLqr2FtOagjMYl2XhEg5y8QaY4+SinLWW2RP0XYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwTO8UYWDQ5VF7YrATZp+COhyF8P19Vf4LX+9FtADNs=;
 b=FM+a2i1unfvRY92hXZbMnnC4DS8Gxr1ECOzTNUlKIA7m6NHndhlpQ8ma7KUEyYITdL/v9IVnWoSirhWnzEexCDuaUZRnmi0p5uW+7S2aeOOdoM9O0rJ/N9aCNj+efAi+8qGrwto0mbmqYO7JRVsSZcC/1NQXndK5YvgCpnbmcvE=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0401MB2667.eurprd04.prod.outlook.com (2603:10a6:3:7d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 31 Aug
 2021 09:49:54 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::218e:be8:ba2d:6af6]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::218e:be8:ba2d:6af6%4]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 09:49:54 +0000
Date: Tue, 31 Aug 2021 11:49:51 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] dev-manual: correct note about virtual providers
Message-ID: <20210831094951.syxtrwtk65jziwbk@fedora>
References: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
 <795cdbf31208231b7ab001464b7247524aa6b459.camel@linuxfoundation.org>
In-Reply-To: <795cdbf31208231b7ab001464b7247524aa6b459.camel@linuxfoundation.org>
X-ClientProxiedBy: PR0P264CA0156.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::24) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0156.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Tue, 31 Aug 2021 09:49:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0cf53c8-3016-4134-d1f5-08d96c64af3b
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2667:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB2667F2B4C10F1FFF1244EF83C2CC9@HE1PR0401MB2667.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	plcYmL705Wv1JoNsNMtikoe1uGNH9uQG7ObIF3as/9hkKwAZQ3Iyxb1JZHfhwma3I4eWut43GgswTNA1uYDk2aH+XtJh4/pqXfcGwum0231Z186vHoXM2LaDiGZPOoYOCunJz8IY3mKtfqYSuZAhUqzXKpoMKVcyRWwgNnLU1adzyxw+3o8NgvC6elotzIl9msjN2gvr1cEMS2mgAp+VYCtqcC929dUULSzvh40P9/N7ltCv2slXS+Hw1inzqZe5zYkYPYPEm+qxtVAokiW5kdyWOmK6z0Ag5nUnep7Z0X+J53kwhxYeVvIYOsD8lHP2aWM69wPxg24U2XPtMvrJCzcK0d0LPgANEB+INklNQaqc9u7PxKunQsJ7imCCxbHYW+K3CsDxzi2J8A4+XYzLytKhufzx1FhwkoEalncSrkTn4ug8Nm5J2ddCGrX+i1G95QY0fDv/dPOZxwUywNnnAmU+NARQQ+h3EIccyF/yAUj7YUigu0F4Io/lUo5YUaTX89sxNucDPQcUuIPpXVW9rbb8OEey6GpVPRagaOQ8LO/o+v9ASLBUDnovITnORKQIVAUau5U3CRycBQnwTnzhhx7bqm/7Bmk7PF1J8lIInj32aoNYe4994FxcEUddDISFB+eTxoo5sB026nqduScT/bMtDkumeQxROAIOL8muN5vPinSfbgO5bhS8bymYVvKloCyGzNj6aGZWQoSGbpeMbg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(366004)(376002)(346002)(136003)(5660300002)(54906003)(956004)(316002)(52116002)(38350700002)(478600001)(44832011)(6496006)(26005)(55016002)(6916009)(8936002)(186003)(8676002)(66556008)(33716001)(1076003)(86362001)(9576002)(66476007)(9686003)(2906002)(83380400001)(66946007)(38100700002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m4IY202UKhVL5KODIB5DHQOeRANMLmhs9i1I+gbLGTNI03OP2Mf4l1ewTBPJ?=
 =?us-ascii?Q?JhbritgYQf94mfkOq7m+LHH7/K+beiDfXKs9Ki6wz4/iNhdvg/tGTrTwQRJq?=
 =?us-ascii?Q?B5BAE/kNrahsrkmQUFi98RL9FN88qk5w49RRqyNZxQExMvbBsXHuclf9VNvW?=
 =?us-ascii?Q?Acg1iV7rC8LIkI10wUXtz4B8Nm7ESk+oiHZH4WsJUcIeY+pDoZUTMRaPD6w6?=
 =?us-ascii?Q?MKz6Qda6JCpGMpX0l37JWmwa/zLt3V8vqwAV2R+/JzmBBdk9xFGCUgSt766F?=
 =?us-ascii?Q?DTwvJlvSALmbZY/gVwPwHwtqlx0CTDG/hihrHGz+CR5dd88mZOaNcqzB97kI?=
 =?us-ascii?Q?TReQTOSLBc0o42sMpTlmYBBmHwWP+W28JeS4cL2D5/EhRNm9Itrhq/b7LGOf?=
 =?us-ascii?Q?V96dguIjqU0zw7HLI3Czic8iNRlBOJJmeup5iWL5T6yW+k/T8hIlMafxxMTx?=
 =?us-ascii?Q?RkrTi5JDnErvmI356XvNt4rDHrPXbR2sUWI/gP53gP2RGuJX0ri/BLGZZNbo?=
 =?us-ascii?Q?1rksJRqjkBtaVx/sCyUgkLTP44OznK9C5r3HfKCLWjxWndkyYCwBdsk7y1h0?=
 =?us-ascii?Q?fTWJEoGIeKbdNNQtw/ZkxlK+gZswurx0Fu5oHM62dHQONn6NJBDPAtlqaXf4?=
 =?us-ascii?Q?NoiNZj06zfGydrSonaXy9+KWuhO3ouHB/+KbKJcQumwvYmcinEjxahw2I2tD?=
 =?us-ascii?Q?GAu7ZmfYqD6VWDU4YiAdLCUBj+jtAC9G2U/mn1LlNbfFLQ7TB1fDJ09kxe6J?=
 =?us-ascii?Q?WDzk1Iryu6k74C+MH+o2p5efT9VIKVGzNICT+VA5M+0tRvuiFevj6PZ+RlmJ?=
 =?us-ascii?Q?QmIaFBnixeAAmXID4a9oG+gxtU+jb1B0CUpYRYI9d+BmrpQmukIpdCXMuh1Z?=
 =?us-ascii?Q?O8EQASSBHdiIpRbNBUy+J5x97FKN+VkmgujO4+48PaU0T9FFu3oj/KPaFAkQ?=
 =?us-ascii?Q?6LBBNQNqLtyLOeKll+5UpqRb0kGR5MGj8RbkqUWOBN/RzoVotdQslsaLUOIC?=
 =?us-ascii?Q?hprRe9ziTdn4d3BzolqZDdkk6+ekovnG2YKaqPsqdXZrW4WqxPur7NY/vHRR?=
 =?us-ascii?Q?vYUZMw/9ymXhMARwMbDCkvlsNgumi79uFU53GabQEqp1KOxGyFKxJESQxEi4?=
 =?us-ascii?Q?ABWuaBUhryn6gw2SMctpJ3lX6czANiTNvjZvb+2gQMOqpUxuT0qaCPHIfV5j?=
 =?us-ascii?Q?4Ic3ckU5EsQ+M7XVoA/8+a4tLWBgFFvqjF+UX2Tcw95TQzfNxGcFW0ENGPyc?=
 =?us-ascii?Q?OgVlXNQ8j5/tc8ssuY5Jf3bD/DLrmFlSLUG0isD6jAoWmylv3BiCmtRXUzYQ?=
 =?us-ascii?Q?7mzgkvvb8jcxs1GES/qv6RPL?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cf53c8-3016-4134-d1f5-08d96c64af3b
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 09:49:54.3737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mjbc2r/FhIP80llnDmxOfcrulX6wDmdvaDGNMpJ10Zcmte88JepS4ADmwga81lnkV1PA8FrDRoVgMcDzmZA1KJukLuft7P90K6pj+MzkNZDh/J4LIJLGOJAZFjdui9k7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2667
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 31, 2021 at 10:16:49AM +0100, Richard Purdie wrote:
> On Mon, 2021-08-30 at 17:37 +0200, Michael Opdenacker wrote:
> > Fixes [YOCTO #14530]
> > 
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > ---
> >  documentation/dev-manual/common-tasks.rst | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> > index f3b5084436..dd015a761e 100644
> > --- a/documentation/dev-manual/common-tasks.rst
> > +++ b/documentation/dev-manual/common-tasks.rst
> > @@ -2114,9 +2114,10 @@ The following lists specific examples of virtual providers:
> >  
> >  .. note::
> >  
> > -   Virtual providers only apply to build time dependencies specified with
> > -   :term:`PROVIDES` and :term:`DEPENDS`. They do not apply to runtime
> > -   dependencies specified with :term:`RPROVIDES` and :term:`RDEPENDS`.
> > +   Virtual providers can be applied not only to build time dependencies
> > +   specified with :term:`PROVIDES` and :term:`DEPENDS`, as show in the
> > +   example above, but also to runtime dependencies specified with
> > +   :term:`RPROVIDES` and :term:`RDEPENDS`.
> >  
> 
> This isn't correct. virtual providers of the form virtual/ *only* apply to the
> build namespace, not the runtime one.
> 

What is the mechanism behind RPROVIDES:${PN} then? You could technically
set it to "virtual/something" right? How Bitbake chooses between two
recipes creating a package RPROVIDES'ing the same "virtual/something" is
something I have no knowledge in but I feel like it's something that
should be explained here, or at least explicit why it does not apply to
runtime dependencies or point to where the providers for runtime
dependencies are explained in the docs.

Cheers,
Quentin
