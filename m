Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.43])
 by mx.groups.io with SMTP id smtpd.web10.19578.1628758519107694463
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 01:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=aBuWMJrf;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.43, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8Wd++hmDzJ33OfNdRS5f5BLp6/RnmVxrpAuZp3oyjnmt8uc/UUGlB9H+W5JQBoooMakF8bWKWrM2qLaNdLRYb0iUs9dSP36gy7wjPEyMl+pN6uLJhhsVppPLnZxot5b4S4fRxZMk5g97q+oFj7mbMq5qkuTO6nGdOiYksue4fe96Ql/dF+2LPtt5KQhUDTUehS4+vFMmrdu5TXC4THEKt3uffK/AvbBSkP54n+6AfBoS2TVBidLoQnPzXvy6W+rrhq4iWrpNFIGiPMu7QjKER7W/R1c8H7+mV7czpt0VDHpOjgdd7XgBc0GFBq9lKJY6a7ZtIFSBR9dRyC8jH1ttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf7CMg73ZZZAWL3fBwCwe2OgwC/zH6dv7zjvg7JfrFY=;
 b=QwP9FBt5DvYBCPLo/QnTaJG6QPtB+4DMY2gY5RrkY3KlgDtMsnodf277eRdZTL+dc1ErCRSnSTqC5CtCLqflp1nom10E4MheTtc3gPWiug1jwxA81HEntC07cZFrKQ/8BFk+komYb9BOuwfk2FeLOv2rQB7WZ6Va/YwSIYKxxSeDjCUu4K+mibLQXs5o54Lt4VXeZQLNLz0vzLxfD6sRf81qGr5nP+vJZAaf8RPLWkF6vtEzj34ES+X4Hwl+/lVVUD767VBVD+cLBAU+NYWs8lP/LjTG7LkitYhqFWND5JdIew9PtgJiGBKsAJeuWQgdw7E2GViBb8m3Q2sDTSd0Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf7CMg73ZZZAWL3fBwCwe2OgwC/zH6dv7zjvg7JfrFY=;
 b=aBuWMJrfuNaGquHxF4cFvREH8D/AntrBfka3mfAKcsRAFxYlRxKhvXiNkfIPfnNfmjsFuSaYakJ2QybjVQl2kypNlrN19wlVv2qb7gUbBlslzZu9obz8jiavWBht6yLXodJcnUq9M3wKZx4cBcHQzRSzH7GRvk1OAmY8Dz37efA=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0402MB3417.eurprd04.prod.outlook.com (2603:10a6:7:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 12 Aug
 2021 08:55:14 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::8004:6d77:4496:12b4]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::8004:6d77:4496:12b4%7]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 08:55:14 +0000
Date: Thu, 12 Aug 2021 10:55:10 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: fix new override syntax migration
Message-ID: <20210812085510.ac36dd2qf7xte56f@fedora>
References: <20210811200601.12265-1-foss@0leil.net>
 <5804b362-3801-28f8-8c95-d9a057ed2d63@bootlin.com>
In-Reply-To: <5804b362-3801-28f8-8c95-d9a057ed2d63@bootlin.com>
X-ClientProxiedBy: PR2P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::25) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR2P264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Thu, 12 Aug 2021 08:55:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 451b71f2-1e5c-41e5-d474-08d95d6ee5e9
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3417:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0402MB3417AC07BA8778298634443BC2F99@HE1PR0402MB3417.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ljB11pc53/CWhV+MSYktIn5NG8Fkvu8teJXqkR5coMG+HUBG5LTS9XiEcfaWWAujDQXIbuNbRC+utBnw5YFgW2ly0lNQC/oo2M6MHCcY6osYUbsHCuCiYAtqQdi7phpTo7k4/KRuc9OwI2p+dcPpP3SXbomDhhdO0JPLcGHCHcPXlUa3qLwrN2X6zezsoYVABBm8aohgWhiKyIDlauV0WHDHLfIpsfdxhRp8s3DuhjEjiMgTX0+b5Hn6pFkZMseDLkCAK21wdwc+BzEG5ZVpnF2oXiL7I0oXryidbgTTmL+S9rsDKpDcBevEiHW7kxNUfwHjQmpO/NGWp2D66kHIKrTPX/B07g8UaYP7Rb3G/7yDBTYnX+LQXqS9Axs9uk1kNORfmqh08UkONDuaDUvgHMMW9j/VN7IVqx8UXS4qwDdoYuW7HaKt1Bf9u2bAsuPTxv79cDpbBLH3oTE77GkfQZgS3pbkbyT5xFVHgveC8hn1+QqCaa2JU0djyEJQs4E9KbHPRAELrgVX/9aB6buZlxTBxfJMeNqkZ1KsQdB9W/lNNnOoHmaCw3aki04ReRVk32EhaOxwYfgsZdj9QmWAItYn2ZeNbrU7PhRDeAy8g4On9Wni3Z6VbZ/tvhM4a058QI/EKkxG9w7eiwsG4qv/T02VI8X+QN1jzg6MTe/AOCozv0/Q/QIvXgOcQjlUHVFoRZt18azlH0ynlP/XvySh3bZjAzRoBaJlmfUvfcyrNx1YVfU1Gw1OymnL/tiVnXLpUeM7/LH6ggqc1Xg8xv6z+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(136003)(366004)(346002)(376002)(396003)(9576002)(8936002)(2906002)(8676002)(316002)(1076003)(38350700002)(38100700002)(966005)(4326008)(478600001)(33716001)(86362001)(83380400001)(956004)(53546011)(44832011)(26005)(5660300002)(186003)(6916009)(66476007)(66946007)(66556008)(55016002)(52116002)(9686003)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iR6NtNEAzsud2iZ6P1eDDHujH1CFXx5UIrpwZay3hk4JmbL1Ii63pTUmWblC?=
 =?us-ascii?Q?vvlruOdiucEF5Xd/5wENxZO5ifN97Ky25DpdBEmkxOQ9O7mKsdGEo0ycgrI7?=
 =?us-ascii?Q?bVQSFL2HDyt6lDusbMb/y7qbKpEzJwssXn8atXA6r8pi0XcmNspPECyVlkst?=
 =?us-ascii?Q?VosPMFch5h0RM/wOsj5O2yv3mn+2mJRj+A1Fz1c8yiDz5wwANVk1wpJ7FFzG?=
 =?us-ascii?Q?8a6V9WcK9N1WP4QhWLW5q8n4ivf4NsU57Zgon5qwz6sDAC91b49pbc94H9jA?=
 =?us-ascii?Q?MBCZIZEHO9L6vUdcR71wwh/beSiPw9ETpX3bpbLcwkVKtt3tdMwWBk7EgI/m?=
 =?us-ascii?Q?1Y8vYITQGwiNwuj/miURKX/2MJRR4J+WZQZa5ugfQfLFU3bXrWbkiXAqsGRD?=
 =?us-ascii?Q?itrr/CWg/TG9rOdRrpDzU8G5dLaPeU2f5OSmDzMKt1RnF2LqCglFutmQ+HFK?=
 =?us-ascii?Q?E0y5onvCF7NLt8Fz6htTA+/CsXqoC06YOmRFqzGhV1mxpF8/RRAaCBK6dE9t?=
 =?us-ascii?Q?e2CSMPy2jiPlOjdAuMMhJcfOJDQgRkdUE7wlhGlIh9CGBP2lsp46SHy+Pu0I?=
 =?us-ascii?Q?MR6VcXM9t+teWBnLQ0wueV48dcuh+8noMn4hI6cTRneL+tW+AQqLytXnUWDB?=
 =?us-ascii?Q?7etZ7V6rkvTtXdknBxzv8Wriw0o5uhCCOI99NJ3tq0ez+AQytVw8PoboTA6I?=
 =?us-ascii?Q?Kp0uvhri85Vw6E7FElVXvqlPfonO7UJqgSulmoNsWaEO0pkqYH7yzfqcBX0I?=
 =?us-ascii?Q?b1JDB03DCpO3Cvdi7lW3IUiH2gQVBgT7YksZJvM2sYH9bE4F6pjTJBTm478r?=
 =?us-ascii?Q?iQy6+Z4dV/nmORz0zO4ugtXKj2VDwT7seBXTpHe5hkj7iWoRrMxix2wjOOsj?=
 =?us-ascii?Q?GXKIAdrMiVhWmKanZh0fE0fG86iF4ke9uGHLVUVVYwir4JN/pnr6g4hcK3Ow?=
 =?us-ascii?Q?xYHlVILJy7wIESIQgH2/mcPGkkThIEYvdb5H0KI/d1yv5fuNVRkotsZNbO94?=
 =?us-ascii?Q?ypv2O87BMjmkHvMv6yowM+r8UT4RJIjF1rBetogkmpWdh03P6NwMH/Pej0cg?=
 =?us-ascii?Q?FLwveaMS8qOs9czmfuENI22V2fCr89dPzEGxLWZE7LDWUyWPmGRRd/kycjKe?=
 =?us-ascii?Q?G5NSdO3t5OKrJPEDDTK/dDS8Qgbp6C3ZSk+2wwmBjGVSOkDBIcex+nrRRGw0?=
 =?us-ascii?Q?X1dkCt01hrIDB4HlDrPge+q5YW6V7ipBoTe9Hu6T4DR7JFHuXZiwao7YhQQM?=
 =?us-ascii?Q?pyLmv9jAADPYnp8ccFWoz3HhFhH1G1XJTyaoaoW8C41IUT4GR6NZPzYtclWn?=
 =?us-ascii?Q?OKNkb1kQshq0/IR0+/EBWHFZ?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451b71f2-1e5c-41e5-d474-08d95d6ee5e9
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 08:55:13.9415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yts0DmLUWfSu1oTqP8QdZ5NPKYqdoG2gUN3lLgZdCigHH2hxTRJEDuJ+qC5qIPySm/I1kKs4dJvtflSkIZFeF0+I05+/ersvNaxG4E0iSqn3tiMaHYmSKNXXrzVW1eki
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3417
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Thu, Aug 12, 2021 at 10:48:38AM +0200, Michael Opdenacker wrote:
> Hi Quentin,
> 
> Many thanks for these updates.
> 
> On 8/11/21 10:06 PM, Quentin Schulz wrote:
> > Fix bits missed by the migration script.
> >
> > Signed-off-by: Quentin Schulz <foss@0leil.net>
> > ---
> >
> > Depends on:
> >  - https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_154733&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=ZmngHaCDZBOUHuxdzuyoxYJU-WJfYptVNJ8178lesWY&s=Z39mIUtyBzU_KP5kWSoxJw3zrJStqsCkzsSoWF_QEBA&e= 
> >  - https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_1640&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=ZmngHaCDZBOUHuxdzuyoxYJU-WJfYptVNJ8178lesWY&s=Dsoi-A3tHXrOYldncqvtGxFgWOHCY2eMjmdnK9jvmlY&e= 
> >
> >  documentation/dev-manual/common-tasks.rst     | 80 +++++++++----------
> >  documentation/kernel-dev/advanced.rst         |  2 +-
> >  documentation/kernel-dev/common.rst           | 10 +--
> >  documentation/kernel-dev/faq.rst              |  2 +-
> >  .../migration-guides/migration-3.1.rst        |  2 +-
> >  .../migration-guides/migration-3.2.rst        |  6 +-
> >  .../migration-guides/migration-3.3.rst        |  2 +-
> >  documentation/overview-manual/concepts.rst    |  4 +-
> >  documentation/overview-manual/yp-intro.rst    |  2 +-
> >  documentation/ref-manual/classes.rst          |  8 +-
> >  documentation/ref-manual/qa-checks.rst        | 16 ++--
> >  documentation/ref-manual/variables.rst        | 52 ++++++------
> >  .../sdk-manual/appendix-customizing.rst       |  6 +-
> >  documentation/sdk-manual/extensible.rst       |  2 +-
> >  .../test-manual/reproducible-builds.rst       |  2 +-
> >  15 files changed, 98 insertions(+), 98 deletions(-)
> 
> 
> The changes look good to me. However, I have a doubt about the migration
> guides, which I intentionally didn't touch.
> 
> You didn't touch the old ones, but what about the newest ones, for 3.1,
> 3.2, 3.3? While the change makes sense for 3.1 and 3.3 which will be
> updated in the next weeks with support for the new syntax, I'm not sure
> we will get an update to 3.2, so the migration guide will be
> incompatible with that version.
> 
> But then, if we skip the changes to 3.2, it may be confusing in
> comparison with 3.3.
> 
> On the other hand, if people take a migration path, I guess they won't
> stop at 3.2, so I guess keeping the changes that you propose are fine.
> 
> Any thoughts?
> 

Woke up to the same thoughts.

Since 3.1, 3.2 and 3.3 will support the new syntax alongside the "old"
one, I think the migration manuals would be correct without any change.
So I'm all for dropping those changes.

> There is one more comment below...
> 
> >
> >  
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index 847df8ee4..51723d8e0 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> ...
> >
> > @@ -5785,7 +5785,7 @@ system and gives an overview of their function and contents.
> >  
> >        .. note::
> >  
> > -         The ``\_forcevariable`` override is not handled specially. This override
> > +         The ``\:forcevariable`` override is not handled specially. This override
> >           only works because the default value of :term:`OVERRIDES` includes "forcevariable".
> 
> 
> This one looks wrong, and you get ``\:forcevariable`` in the output.
> I'll put ``:forcevariable`` instead. I can make the change by myself.
> 

Hopefully there isn't any other like that :)

Will send a v2 tonight if I don't forget :) Or if you prefer to drop the
changes in migration manuals yourself, let me know so I don't send a v2
:)

Cheers,
Quentin
