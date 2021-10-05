Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B3AC433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 14:11:48 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web11.1012.1633443106024775286
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 07:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=tM2WHyJq;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.64,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhZrUqv7bCePI9q7ycKuvV5JkcjmlO6nSDHon6suDF81YsW5InRroxvsY+0bSl558QN6xM9u6ONj2KVolXa/kUdY/0FibEClxzcg/GrxGtFvZvSAFi1xx/WehMGqNuRod2MUYNim2ix5KR4JtTAzzClBLETgkCpo7Cg+UNOFdhuLfCIxigb55VI9CIt29lhmEnxg4L8g9Whcv2aHxdJQ9ISzFH944opgqAh0AxjSE2+1434FTdsUd5mpPRC+CdoqBjiK434TQb45p/1a+9j3dBp7Vuw8SNm062tHxph+9XoAc8cWW7Rz63vSbBb7rfT+/6xG8c8ichrLM1SZFrh8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7cH8EgYwz98SVX/m5WdodBV27DQfTZDVMvZbDv2tgw=;
 b=KKJkvqj7Lu6y6tnWa1RwMP1E/yHEevIi+FDjwFrpdnS0Z0XKEVXPOvk1pIoC35LB9xKQuBH+UIhVYLxB+Z/f16QXNpAd/U22588guhfOoZAZ5sAFi5saFxNPYBOQaKpgUamgxIqR8kAna4ibNHirjgiMyyT5FkMt84saujoUt1xn3dChXTQ20f6L9kF2UcJuX6+fTYzf5da90hMITOLA1uQwupbBDVrdo/tiQWAQWgo2Jue9RdCi1arICJ6BXMqTawcNH2HXXuE97bsGiQeZKp0KrLoMQxybwhBCnPpmAYCdIbYpYZPum1lqqdRjgWPLVkczynVo4F5GhhVBn8kG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7cH8EgYwz98SVX/m5WdodBV27DQfTZDVMvZbDv2tgw=;
 b=tM2WHyJqTQXL+h3CpQccYkGNGIXP4164nXDNPAzI9YWuXT6MXpVO6ZY0J5FGVfl/fPgZCIfoJ4dlmb+n5K4g9Z+Ol6jRPduX0celqDxoHl0zwFif0X+pomVVFjBgg4O73Fado05QNPqyA+bLdXM8f1x0Krq4RiehTHLwtRwnh4I=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3524.eurprd04.prod.outlook.com
 (2603:10a6:208:1f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Tue, 5 Oct
 2021 14:11:43 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 14:11:43 +0000
Date: Tue, 5 Oct 2021 16:11:41 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
	Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH 2/4] docs: sphinx-static: switchers.js: correctly
 highlight obsolete releases
Message-ID: <20211005141141.xmaltlqoju27rd4h@fedora>
References: <20210928162202.749990-1-quentin.schulz@theobroma-systems.com>
 <20210928162202.749990-2-quentin.schulz@theobroma-systems.com>
 <CAP71WjzPeZJQsesFc=uweY9=C_QyDOR3UmX5YE4qnWLEVkdWLA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAP71WjzPeZJQsesFc=uweY9=C_QyDOR3UmX5YE4qnWLEVkdWLA@mail.gmail.com>
X-ClientProxiedBy: AM6PR0202CA0067.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::44) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM6PR0202CA0067.eurprd02.prod.outlook.com (2603:10a6:20b:3a::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 14:11:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b1a5da0-2c10-4d74-23c6-08d9880a0ed7
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3524:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB3524595E54B034FA0585DCDDC2AF9@AM0PR0402MB3524.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g07ZxDCmG6tkb+4TiDfyfOoLlxEtWMs7URyvt0TPhJ18tnXgI3f3VmmwT4VTWElkvRUiwSzbIJKLbv/5EtDp6KSbXhHRoEBlQOkYf0NsIUTRK3H3rga7/OWMLGN+k4soIh+aUY7tigWTPvnsJHY5UBk7FPx7rMKlz/nCmjldXFavJoSYIaeND6EfwYj+VWGFJhySApV0khbB1xiqNSlSC0WyJ5mW72P8dU5QQAtDa5bgIFbVmac5ppqaJtJW1OPj3hZpDAMshT7acVfOQc7sCSpOkgQvr88BOCqXIlqpNE1ig6ZmuA1e+aDPTS2EFlUqfuG+dCHAwy/dzkAvQagA3hm9zRcLBXmGXcH37p8jFzam6aCITNYsCqGY8oWi6x52E99q2JiWu6nn6xZtWwnFRv8wKlY+8sCZv9VS/owdzLte2LPRFNLgtunOLG4sMbqeZBYCYNcF9rOXxXVLB/40U0Lbkc782ylg2xhgqrfu4hSp4aAMkz/vC0LDdfKkZ9zdGezxWtqIufvGwOacKs9+lLlHAfPh8fQzEpkD8rNkBfzydHXTJe3BvDkYSl03WdBc57K6uzCVo3/x3yassEb77sfwzt5k7dm+N+gvfqV1nryZtFOnp+zswruUBJCSHzLgvPtCTrU4xKRn0OsW6BM4Q/Gv+VUFt0TNbxMdiLjdCbDMS3jgJk0mJhobwWOJSElHJCwdARgvacG1T92+e8W8l/tpE0HGuJy5zv5opTtGcI3pkIUz4vUGnNgd4MypHk9WrjN/PalVibQwag04rdI8vJGpn4YBbeKNuN5mKXW9Woo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(66556008)(5660300002)(316002)(956004)(44832011)(38100700002)(38350700002)(66476007)(66574015)(66946007)(33716001)(4326008)(8936002)(8676002)(55016002)(54906003)(966005)(9576002)(53546011)(2906002)(6916009)(83380400001)(186003)(52116002)(6496006)(26005)(86362001)(508600001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oGlkl93cwKV0MpIc43whCQv5LcoNPxw4Lsn+5cKl+K4zwCmX5yK/Ts5gU9Hf?=
 =?us-ascii?Q?TBvaZUrlVRLpSO7zbb+XG/F3OMjngm/oQHwiApdDynJLfj3aTSLVplIeiM6i?=
 =?us-ascii?Q?oZqbzalKfXv5TRdWB4NZG16NHz5TjbD81j45JFuAL9yODT2dOJiZgHFb5aiy?=
 =?us-ascii?Q?hnU2TJJcujkavKG4REn8yzB4nlIWKsIuWbClBAm4drikKAZx8fNpRIIoaTXz?=
 =?us-ascii?Q?hLAopfWjOhbJtV1Y4y+YIpcVZKdl7EztZ1WYzevhYOCVV1gJ/Bl5GzC53StJ?=
 =?us-ascii?Q?Is3dOC1X7LA5FfQ76S4zTdUi/WWBqLiFag6pAgyiSQaJSPT0GZMlkgaw1Llt?=
 =?us-ascii?Q?7+wrcGLNwzBgW6chkv2b6fu9lR6FsK6PC8ht6NqSQ6zFrNJ2c45w4RGKZfAr?=
 =?us-ascii?Q?B7Cd0prxjTGpkIrzFQ1kK8550F1mKjVl7Dr2ku//3g5Sxu8GY73aslvcFiqf?=
 =?us-ascii?Q?/NYiCPPoHdXcirvzIttc6J6W52ibbKz1GVOdMoWIkyEB2l+OH+Ogp5Ps78z4?=
 =?us-ascii?Q?/HXTeNBxewen7nre1074Q5RIacMv+wlwhxec0O3OUyBuPxS3gPPyxe+QTSQp?=
 =?us-ascii?Q?uyTzQoXhhy7bY57gMkBN+m2eflBXo+usLChrFaPmmSjS2nLz+NKqNBbbw7mI?=
 =?us-ascii?Q?Dok9V5Pdliuk99w5WEEs78AsGcEN2dNFWnU5a3SfeIzvrSweeTYscPPcriup?=
 =?us-ascii?Q?6LFCF7rDriCHnkMvrplFkNMMW4HIxilU09eZIBnsA/WWfKjD6c5YQYjcr0ii?=
 =?us-ascii?Q?fccUenCccXo7RYJSTeNb2hcdupvG7I3SfMEyMCv7eAK3yaKxbMY7FEAcKGId?=
 =?us-ascii?Q?4TnBEp5pMcTydHyfcw/DEtSWklQ5i/jfv9kOFxqKmUFio7FBHShFOmgWv86F?=
 =?us-ascii?Q?PcMfZT9KPFf2x6siLrrp8tILDBhPas2R7iMvrQ8NG6UWg06lRlCCSJ5tCFdj?=
 =?us-ascii?Q?iMEB1Z9XCqyGzaldk1cKwg7n9O/pDv/2h3vEs16v6qNAVNVNCetOuD26NRoW?=
 =?us-ascii?Q?x8PeLoX8s13s/xlwOKPHACm8MCAsmmoznjaQi/oNdv38pYb57Zp9QKgntEMb?=
 =?us-ascii?Q?X9f3HGGfhC5etYoKP7BG4yOXq7/LHJ/4o5m359kUdfSVBs/T4rwudqznT32r?=
 =?us-ascii?Q?66RaaFBuud1bWI4XU7SDVRsUCHy+J6wmnG8z4i4ghLtdpDEPWXl6ZDzG53OU?=
 =?us-ascii?Q?OQvqw/Z30vWQxi4Pr9xwGsa0HVlM+PCpy2Tg/hYe9QtZ9HP2bYosb7M0py7A?=
 =?us-ascii?Q?5d3UMy3WlYV9kYHK1mfLVKneYdQeSh/fo5PYIQXLC/k+6F8IgWyTs0Nr8Msy?=
 =?us-ascii?Q?Vt5+3IDwDX5hLEA00BrgRkVK?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2b1a5da0-2c10-4d74-23c6-08d9880a0ed7
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 14:11:43.1005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xf6XVY7d3J//5sd1Qw/vIcRo8h30Apv42GXLKL/6jWnkquJt2HdKUIJ2NE+3fIQ08f4NtVbJzyg8RrOSR3cNex2pY9mgDoAwkYiewEx3gRkUqKGp8U58zmaP5qDwMzfT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3524
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Oct 2021 14:11:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1913

Hi Nicolas,

On Tue, Sep 28, 2021 at 07:21:08PM +0200, Nicolas Dechesne wrote:
> hey Quentin!
> 
> thanks for getting back to this... we've known this is an issue since
> we've migrated.. but never been brave enough to try to fix ;)
> 
> On Tue, Sep 28, 2021 at 6:22 PM Quentin Schulz
> <quentin.schulz@theobroma-systems.com> wrote:
> >
> > Currently, only releases before 3.1 are marked as obsolete even though
> > 3.2 is already obsolete too.
> >
> > Since 3.1 is an LTS and is still maintained, it needs to not be marked
> > as obsolete, unlike 3.2. Therefore, LTS series are now also tested
> > against before marking a release as obsolete.
> >
> > This makes non-LTS, non-latest releases obsolete.
> >
> > Cc: Quentin Schulz <foss@0leil.net>
> > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > ---
> >  documentation/sphinx-static/switchers.js | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> > index cb55e35c8..6038ae065 100644
> > --- a/documentation/sphinx-static/switchers.js
> > +++ b/documentation/sphinx-static/switchers.js
> > @@ -10,11 +10,22 @@
> >      '2.7.4': 'warrior (2.7.4)',
> >    };
> >
> > +  var latest_release_series = '3.3'
> > +  var lts_series = [
> > +       '3.1',
> > +  ]
> > +
> 
> 
> in the past I did a few experiments.. What I think would be ideal is
> if the 'release' information was actually managed outside of yp-docs,
> like it was the case with the previous documentation. It was a task
> for the 'release engineer' to maintain that:
> https://urldefense.proofpoint.com/v2/url?u=http-3A__api-2Dv1.yoctoproject.org_documentation-2Dapi&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=IkqJJb6C5WoayEw2QGUj-ZxPis-lTJKhRZGrreYumxY&s=gAwVxTehvj2VPr8tpwyGprny9CMsqa1_i48u0nlVQTE&e= 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__api-2Dv1.yoctoproject.org_documentation-2Dapi_archived&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=IkqJJb6C5WoayEw2QGUj-ZxPis-lTJKhRZGrreYumxY&s=wz3yuYLM3LWMhGMobBRlz4F0xU9vhjRSQelKpuULkbY&e= 
> 
> And the website was loading these files to display the documentation
> dynamically.
> 
> Since the information is now in git, it's very cumbersome, since
> switchers.js exists in each branch.. so fix that we have a big hack in
> the deployment script [1], which does:
> 
> # Update switchers.js with the copy from master ypdocs
> cd $outputdir
> find . -name switchers.js -not -path ./_static/switchers.js -exec cp
> ./_static/switchers.js {} \;
> 

This is a different topic but yes we should settle on some solution that
is better than this. We could have a separate git repo somewhere for
that file. Then I can think of two solutions:

1) git clone this repo as part of the documentation
 publishing/development, which is "nicer" because it's explicit the
 switchers.js is the same for all releases but it's still just a cleaner
 way to implement the find command above,

2) have the web server serve this js in a
 docs.yoctoproject.org/somepath/switchers.js and add this path to the
 sphinx template, though we would need to think of a way to not need
 internet access on local development but I'm sure we can think of some
 hackish way :)

Also, I would very much like we have a similar mechanism for the
theme_override.css for Sphinx because I've fixed a few things in the
last few months and those aren't shown on old releases.

> I've faced issues when trying to load an 'external' XML file into the
> docs website (something to deal with proxy or permissions..).. so I
> tried to have the 'release information' in one structure (in
> switchers.js as an intermediate step), which looks like that:
> 
> +  var all_versions = [
> +    {'version' : 'dev', 'name' : 'dev (3.3)', 'show' : 'yes'},
> +
> +    {'version' : '3.2',   'show' : 'yes'},
> +
> +    {'version' : '3.1.3', 'show' : 'yes', 'docbook' : 'yes'},
> +    {'version' : '3.1.2', 'show' : 'yes', 'docbook' : 'yes', 'state'
> : 'outdated'},
> +    {'version' : '3.1.1', 'show' : 'yes', 'docbook' : 'yes', 'state'
> : 'outdated'},
> +    {'version' : '3.1',   'show' : 'yes', 'docbook' : 'yes', 'state'
> : 'outdated'},
> +
> +    {'version' : '3.0.4', 'show' : 'yes', 'docbook' : 'yes', 'state'
> : 'obsolete'},
> +    {'version' : '3.0.3', 'show' : 'no', 'docbook' : 'yes', 'state' :
> 'obsolete'},
> +    {'version' : '3.0.2', 'show' : 'no', 'docbook' : 'yes', 'state' :
> 'obsolete'},
> +    {'version' : '3.0.1', 'show' : 'no', 'docbook' : 'yes', 'state' :
> 'obsolete'},
> +    {'version' : '3.0',   'show' : 'no', 'docbook' : 'yes', 'state' :
> 'obsolete'},
> +
> +    {'version' : '2.7.4', 'show' : 'yes', 'docbook' : 'yes', 'state'
> : 'obsolete'},
> +    {'version' : '2.7.3', 'show' : 'no', 'docbook' : 'yes', 'state' :
> 'obsolete'},
> +    {'version' : '2.7.2', 'show' : 'no', 'docbook' : 'yes', 'state' :
> 'obsolete'},
> +    {'version' : '2.7.1', 'show' : 'no', 'docbook' : 'yes', 'state' :
> 'obsolete'},
> +    {'version' : '2.7',   'show' : 'no', 'docbook' : 'yes', 'state' :
> 'obsolete'},
> +  ];
> 
> At least, it becomes straightforward to insert a new release in the
> table.. I am not sure I ever showed that.. so adding more to the
> discussion.. I am sure the project would benefit from an overall
> releases information database in a few other places, so that could be
> extended.
> 
>  [1] https://urldefense.proofpoint.com/v2/url?u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_yocto-2Dautobuilder-2Dhelper_tree_scripts_run-2Ddocs-2Dbuild&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=IkqJJb6C5WoayEw2QGUj-ZxPis-lTJKhRZGrreYumxY&s=xoOeS1RNOATX4K5WSvEy7WE1VZbB9hXH_f_BWQ_Ea1g&e= 
> 

I don't know how far we are from implementing *a* new (hopefully) better
solution for this, so shall I just go on with the dictionary suggested
above?

You probably did and I probably forgot since then :)

Lastly, you talked about on IRC or in another mail I don't remember that
you would very much see this array in a separate file so that it can be
reused in other parts (and why not in some automation
tests/scripts/builds/whatever) so that we only have to maintain one file
and everything depending on releases and in which state they are, etc..
would be gathered at the same place. I guess we could put this info into
a json file that is then loaded and parsed by the javascript though we
have to make sure the parsing of the JSON is safe, which is another
topic in itself :)

Cheers,
Quentin

