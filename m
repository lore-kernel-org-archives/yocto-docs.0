Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6132AC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:45:36 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.41])
 by mx.groups.io with SMTP id smtpd.web08.50.1637768735303676408
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 07:45:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=EVWUOzrI;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.41,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH7m9x84tt8/q34vSrGYogSSNvbiyp6KuI/fYFssEmujAm3b+rh7djpfI1bgW07Wu2hmsMvZiYly51XWT8ry+37qqdMuMjf8i0GhJnzo2M2gUL/8A8ZuT0Tr2beUwQ1mfKUdfTH3NuvQoUi35MjtdNrCXLHmfwGaFrkWJ6WKJSP9HL9hg0EW9grNVyXbHUc8BMqzKxPJyB+HLyoUZLd1fMsefHHRKk/lCiaTPooDMQkwTO2v435JNhAlBW+L/ONfyoamiWGHo3OEzGR5Zi+3ICHVHjMmZfhkJKsgk5k4qyCLXRbIGLB12whffmLNFN4xK5jM0C456P6DSccdPpdxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txa0UGD/W+pyuqlV/5IV8DUCjOY1rawRuh49KzVJE7U=;
 b=aVYTBmu+V6+Y/TQ5uYaTjdEgtLRt6lPeOclVs5teoPAvFbBQ7+N8/grLww7yc0I0IOVy5/FYJdlkBOk7Kskl0MXlt2sYKghZDoI8poJcKkSAai90iMsDVtpSf5K3co1yDL+7WYxxhMYcUnOk0e1ka28pniu8s5EXDep53jswEZMLh8ivh0JG+4/igHa7v7JjuI7+/Glq7jjHxvmfn9Seo32iJbizK7zZ3E46F2losvyXMmgcUMAFOa9FE+nbnMedIWQXHCjBwhUiO7s3WayHdmBfXQ+GQPJH+32XdhfvfszVEypAcz+5uH1GzbqzpIstS5YgjMS+uYTfj6CBq+ANuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txa0UGD/W+pyuqlV/5IV8DUCjOY1rawRuh49KzVJE7U=;
 b=EVWUOzrIoZocz9BLij8z/M1KF4clNyFtX96yOVo9O4ApoYR4/NDs98MLblXKksAolMLn6XM4u+yiYBrQekVQBYQ9FXcoHJoeBH0dhx7D51zHavZJglDlRqDKtaL9EEQ521VUHfy3gnMMBmVjVZR1MU3NtqyphZNgy3LppV3vB74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4817.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21; Wed, 24 Nov
 2021 15:45:31 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 15:45:31 +0000
Date: Wed, 24 Nov 2021 16:45:29 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] releases.rst: move gatesgarth to outdated
 releases section
Message-ID: <20211124154529.fwxjw6qgjuaypjrp@fedora>
References: <20211124144934.8908-1-anuj.mittal@intel.com>
 <f64d94ae-7171-7e8d-2e10-e81a04cc160e@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f64d94ae-7171-7e8d-2e10-e81a04cc160e@bootlin.com>
X-ClientProxiedBy: AS9PR06CA0050.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::13) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AS9PR06CA0050.eurprd06.prod.outlook.com (2603:10a6:20b:463::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Wed, 24 Nov 2021 15:45:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e28b07db-4cd0-4223-ad49-08d9af617267
X-MS-TrafficTypeDiagnostic: AM0PR04MB4817:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB481747C96C1EEB864BFD94D7C2619@AM0PR04MB4817.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SjDv3KOjuUDsg1pMbbzqAXiWcBshAR9NYH341hnn/h+KxzQXvlwzjd2rudhiOlnuPu7t9Do8akc6OiVY1N02czJDZTxX65WLXDhPU/S3tF+6ty7c/QFcccYO5wRLCZHEZgICAUOTFWIlPxOXr4MRVt3800SecYJkUMNWaQ5GoeUh7mcQItJ/VZxmJcKDqcJZv2WAahW3VotpJs71h45yZquD29AdyNKPiGYaPftJfCO1LZvScsnnSiy1znpfN6ckik2smikGBltoFVmgTHjvNb7jCAwh1ufnEf3k6ASuaoFmRpSpmaW07b78M+lVfaz1Y0J0HdYQAuEE6unxYTLuzHfZh9F9XOKGgM6LdgfqKDnCO6dGHVwisX4BMXkRuqUOpFtxWZysGmfuI3UBO0tj8i5K0tmkf+V4Ic5cEib7CW2L6aAQoCW/+bGgVsw/VRB38sCspc2In/ACFMi4f1dLVbGIgvgITDN7M4z5pNxi1+e4Gc42tbxjgHfhIZui911Nxy6YWdKQ70z3XqAEqtnGD2nLVcJGt7l0CzrhZHSNq+2gq1VYsyhiOIhYFYw03aGt0NPbqXREKPxQ3BXCVcQSrYIIAONfzeQZ6Ijze0tHlYWBmPCmgtQ1706n664e6G3V8tuSlnR87eSovcO6h9/tr4K+xfNNN3EF1ugwOHh4R9vnru2D3RsTHkOWk458Rdig7xra5NKD/kznCN0dji9g+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016003)(66476007)(66556008)(9686003)(5660300002)(38350700002)(38100700002)(186003)(6496006)(53546011)(8936002)(52116002)(83380400001)(66946007)(316002)(86362001)(1076003)(4326008)(44832011)(6916009)(508600001)(26005)(9576002)(2906002)(8676002)(33716001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xPoY8b2TTtcFiFcPwmPr/9czAqpjeVapeis+lnvIYjkeUIUseCVeOw0D6mXO?=
 =?us-ascii?Q?7J6w3pVDk9FBWLVAYgwg2MwjuJfxdVpEIzxrmTcKETvCzwlDZ4d/zGy+2rsr?=
 =?us-ascii?Q?iLIr1faNuVMlGWL2pqEpVAEVYOvwd9ebpYQgKDztvqaTe264ZQSXJhBIQU9l?=
 =?us-ascii?Q?xGhmHNTcQDBo6MLJFOjJrsyI4FTpANaUALROy17/r1d16nIrnwMsS0P8hO8U?=
 =?us-ascii?Q?VVkXM3Fg0bkW2jNd045k/kolhz4RnFxQ1pNPkJFO045mPN2aBsr5TD+xMEd/?=
 =?us-ascii?Q?LsxMi82EaHQ22n+vUV5vpaeVNKbJBjc1Mnj2S7W/p95jzG3mQTpReUl6iOOo?=
 =?us-ascii?Q?mmA9FNa+BqEF8JTie5ikSleJfvRRi1nvUATse4/woc2xf1WQHtqJl3zxnBUE?=
 =?us-ascii?Q?umkFgvJSYd3RKua68L58JCRg5JY2iv6ars/uH5avN1URwlduMUwjnTuM/feh?=
 =?us-ascii?Q?hF8bKSNjKMRyEqqI044a/1TjPGN1yXQs4BNtegndmw9Ft0cKfXER8WFxfR0r?=
 =?us-ascii?Q?jWKFfgSEUeiNnpCbelUvtp3DxkbUBR+SYkirUMRs7s7Tfj8Plj1TYY6M46Zv?=
 =?us-ascii?Q?x4clVMqlXn0sygoasaBjYEae4J0TnCcprq/B1ZfUW/+Mw03GabcsMxLTDfcY?=
 =?us-ascii?Q?WWt+9vHUqwCOaygOgt9gV+6Xz7vhhf0KfpgWAms/myyJ1ZhFDum7aeNQYeXQ?=
 =?us-ascii?Q?haXiCsC1vVwQSyHHvL6i0ieX1EAwp4v2m0JRrS5KJeo/GNMrOjriCTYIOO82?=
 =?us-ascii?Q?P4j05Z7/j20lglMMe3EUVYi+ddj1/ukprlcJ6YhgxFepZUmfJdOCE+IOPdYr?=
 =?us-ascii?Q?vm2SAmSCw0ZFGhxU6XXz49D7RuB/erm+pF3jtMbleXuUBBmwVd3680YQ3FBG?=
 =?us-ascii?Q?c93UN7P9GiQMd6vQXf/d7fe2HvDV2aws3TkKqhCYl02S+K8fpD+8wk1IeUJm?=
 =?us-ascii?Q?l9Axr1iQINiEVLb6Zr9JzCSkj56s7zH7s5O2vQrB8rhJTBcCObqOKFS1Qfty?=
 =?us-ascii?Q?nbbW6EktjKwDJcJeP85BemZiufV/8OPpk//M9iirNTTxzCcikoQsVHc2zX/9?=
 =?us-ascii?Q?HT68dyYMH215ToZYc18pN4Epowa4Ry82cL0oVv53To3LoLDx/0z+Nv6I+Qhz?=
 =?us-ascii?Q?5cCNT6ys+EGPVDp/klnUtce712Eu1TntEiC2syWscso9qddkhM1hGfa8QGGD?=
 =?us-ascii?Q?vACX0bcHfKNQf8oXO6278rxSn9WN4IgiEqfS6ysflOXEarjRxAwF5HIsgCmD?=
 =?us-ascii?Q?wlZyX6R5qVjAg0QmVdttsQ/ghj08gEKMdMS2kDrsN/8o9ErVDbCd/07zmvmN?=
 =?us-ascii?Q?is1vLG6yasPlSbiTmfSK04Ngr20LX7eThilksC1BdnjUeeDAzhJrvwffvhI7?=
 =?us-ascii?Q?Ejx7p0z+oEOYZxBYSerL0LhyIV1gqMo2zF5SBazflZYEuIwQUwuyqJl4aHZb?=
 =?us-ascii?Q?rLZkxrmBnj8iRg/WPuyGWXlQKk2KX5e3kAan+xrjtvVrNI6MO3AKF/WgZkIx?=
 =?us-ascii?Q?nAZGbP9chz40LsJle+LSMT9kijaAmMlcsmV9jeZIERxMk/91YFFVzYThOwOL?=
 =?us-ascii?Q?qcs6BegaPWCmdbtrrZvKkpUV+Zox31n+HF6M/P2QYfLrw4fJ7+ebnWCZqjP3?=
 =?us-ascii?Q?mKZdXTkmnJ8XpnWFsPeLWEx6yL0ckdhlCa7SGphGiqvUNn+pye8OYI/HIbFk?=
 =?us-ascii?Q?hpzqc2jTzo5YdgSprWjsUlACvX+Lld3fkaca0BtJLSMsO1bdCojHwo7FIt3b?=
 =?us-ascii?Q?BTD9IGytww=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e28b07db-4cd0-4223-ad49-08d9af617267
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 15:45:31.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WfW1BGl7SvYQVcZJatFrI7qad+4mvKXPgyk2Z5fpxvK+/EsAGoxkSz5YHlk4F3QodYOHAYH5dcL9ct3qJj4vRCEqFQDeoX01+PTq8iGVMCxZeK6CMnHz8iOhTp2tdBeJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4817
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 15:45:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2190

Hi all,

On Wed, Nov 24, 2021 at 04:41:04PM +0100, Michael Opdenacker wrote:
> Hi Anuj,
> 
> On 11/24/21 3:49 PM, Anuj Mittal wrote:
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ---
> >  documentation/releases.rst | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/documentation/releases.rst b/documentation/releases.rst
> > index 95f1bd41d..4223d56d2 100644
> > --- a/documentation/releases.rst
> > +++ b/documentation/releases.rst
> > @@ -20,16 +20,6 @@ Release Series 3.3 (hardknott)
> >  - :yocto_docs:`3.3.3 Documentation </3.3.3>`
> >  - :yocto_docs:`3.3.4 Documentation </3.3.4>`
> >  
> > -*******************************
> > -Release Series 3.2 (gatesgarth)
> > -*******************************
> > -
> > -- :yocto_docs:`3.2 Documentation </3.2>`
> > -- :yocto_docs:`3.2.1 Documentation </3.2.1>`
> > -- :yocto_docs:`3.2.2 Documentation </3.2.2>`
> > -- :yocto_docs:`3.2.3 Documentation </3.2.3>`
> > -- :yocto_docs:`3.2.4 Documentation </3.2.4>`
> > -
> >  ****************************
> >  Release Series 3.1 (dunfell)
> >  ****************************
> > @@ -52,6 +42,16 @@ Release Series 3.1 (dunfell)
> >   Outdated Release Manuals
> >  ==========================
> >  
> > +*******************************
> > +Release Series 3.2 (gatesgarth)
> > +*******************************
> > +
> > +- :yocto_docs:`3.2 Documentation </3.2>`
> > +- :yocto_docs:`3.2.1 Documentation </3.2.1>`
> > +- :yocto_docs:`3.2.2 Documentation </3.2.2>`
> > +- :yocto_docs:`3.2.3 Documentation </3.2.3>`
> > +- :yocto_docs:`3.2.4 Documentation </3.2.4>`
> > +
> >  *************************
> >  Release Series 3.0 (zeus)
> >  *************************
> 
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Applied to "master-next", "honister" and "hardknott" (I hope these last
> two were not unnecessary).
> 

Slightly off topic but we should actually have the same release.rst for
all versions of the docs. No idea how to pull this off but we'll
eventually need to.

Cheers,
Quentin

