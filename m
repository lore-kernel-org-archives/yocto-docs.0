Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC5CC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 11:28:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.68])
 by mx.groups.io with SMTP id smtpd.web09.10353.1635334123283361518
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 04:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ATjj/0E6;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.68,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktXVm2iA3ISynhL+8gbTLTFSx0+E+U/jB5fSVunJc9xmDBd4hSoz6lOkl8wMyG8B53OwxCITLCt1KFvDsO7BEpSEdwefLa4AOQpTGQ2dA9VyKzpc8vOP4dVmDaUJhuX6hnt3jRzWRdNrdECQ9ohK5ic29F7lfjFkXPADzXDlTzzbT4C2bm9hX8Vt1LGDoiIbjkFJbZAb0c/jDCGqJTAsJty7U2rXFyMufs2wzGjW0EnWW6Fhnz+QPyVamTnRXfBs6nIo3N0SBwW6+fHPsbE/ciGllhBvx8nN0360cM0FutsPoZD5Um0cfNn4Q3kUALkNIYoxnZ3v1GqDVopW8i4/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnTzrIjeyETVWa/7EK/gf0MKJ3JB9u+1+hhfkba5nwE=;
 b=LkimWJMl4pFHB7eN1Zd0Q37HQH1aD1UCwVJHvFixoqYzqn35soZrpDX9XV4wZFbP9qgEdRHTsrTA6+5yN4T4EHUJKweUDYaVfkCL5IbXW7efcSGFAdbJhETrOAJCUh7WWGb+khlvRElGwxZSlzzpvSE55y5AcVDsauLiwM+XonBGtsbXwEKM81OHgVDD6T1yYEn5BtbFsg4q3ZkV4pQan9XQXuHwt0I8eWT8RFr3wjf51fHlUSiNkHiSzIiDSTAqAYbVHW3zannGKtUfvTttzQNVidfR+x7ux01ZOVviWtTlbi2sLbr1nEoC6dgPPtWaak+lia6rnqbzzyd54QgEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnTzrIjeyETVWa/7EK/gf0MKJ3JB9u+1+hhfkba5nwE=;
 b=ATjj/0E6bHrGdlcJieSS+eK9wZq+8YGYkrkkmgr1F8fu9qcTKs88bFIpdTWEM+2IVWPrRGf727eRqPQ/hH5Izdzg0hlyuLwTC0ihJwfmz5pXRMBAxq+lnOhKme1jV01g6ZUdr0q/8tH7t1G9V8VzPctds+vhq4HSpEZuS+VHD9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7938.eurprd04.prod.outlook.com
 (2603:10a6:20b:24e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 11:28:40 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 11:28:39 +0000
Date: Wed, 27 Oct 2021 13:28:37 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] [honister] conf: update for release 3.4
Message-ID: <20211027112837.7oaibv2saa4ak2gn@fedora>
References: <20211021084332.334075-1-quentin.schulz@theobroma-systems.com>
 <20211027104016.uqi7y5d2aluyvf4x@fedora>
 <b1ceabab92cf6b2b6894c85162d84af74aa4abe5.camel@linuxfoundation.org>
 <20211027105243.7ncoejzfms6rcxyh@fedora>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027105243.7ncoejzfms6rcxyh@fedora>
X-ClientProxiedBy: AM5PR0601CA0037.eurprd06.prod.outlook.com
 (2603:10a6:203:68::23) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM5PR0601CA0037.eurprd06.prod.outlook.com (2603:10a6:203:68::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Wed, 27 Oct 2021 11:28:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d706f76-91f2-41ea-001e-08d9993cec93
X-MS-TrafficTypeDiagnostic: AM8PR04MB7938:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB79382827C54ECC64C10CFBA7C2859@AM8PR04MB7938.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BKAu1IUORg007NCFkdPGfjzD8GAvcDYGJABNurMeo1b/Sc7+Vl3wpZz0iGP0DwwrVhsdWfZnNhmXfAbGFfpMkx0o5SycPaKWvehE9/1AI5XQP7pzUU+NT520y3gmseokjKrwdlH3wSDcAjhJczvJqp7qQtKpd3pbwCvNI0Zn0eqsKsnY2lqw773E9C9DHrRSG9g+xqOp5eiHNOGZp1T2yxOkg7/GpkHS0E6VhHJ4rCHmFp7UqRzgESNAAjOKPrDt+EX8KWozoT01vR2cgJGL7BY0EhdhgsMNfhFYqsL4egOk7s/0LbqbltMgn/mNAPgdBhdY/ghDnU09z6eQdcpCX14FbNdO9K5gx4tIKJ5nEnAGZiCHl1O7qkKoHgqsT0Y3JpZkYJnKWNAnMACZkdhPg4ZiT6FQ1JMGWxGz0Y/MJtFoA809s+Wbshc23+FE/hoJrMGcNMCarrX7SLT72k0z9y0kRB5H4ufeODrcVs72cMhXxBR7pnLgf580bImmRRzAB5ssBoFeeFFMQWNScnjCkNw+S4l9XDXL4uuTnnltEicz+WA2v1F6fHu/Uk4d9IRRtBKTMM+YIsK7QRNBKePJGG42J1OR4fSUBMsHgWo0Q3pmEjylYC6QPbFezKFWz4JueQ7v9qEZCpI96TR6hYOhPp5Uun/36yf1odW4iZAs0LTYAIhKON224EGFtW+tQU3kQJ8257Af0nhJJuwTfTg2Bp4wbKB8H56MjFg2e6rRvZTrtj+GaXkuON/2bpU5F5lYgnkVIv11453+ZYQmVu4hNv1Lbr1OT4uC8vcMnPSVVymyww7cuxFiqZfqaNN+uAii
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(15650500001)(956004)(66556008)(83380400001)(508600001)(9686003)(6496006)(4001150100001)(26005)(38350700002)(966005)(44832011)(186003)(8676002)(66946007)(55016002)(66476007)(4326008)(52116002)(5660300002)(86362001)(2906002)(316002)(8936002)(9576002)(38100700002)(33716001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i9t2fCGV2+RkuyTgFpPk3zd85ttS6w8ncLhQbkj/Mke1QFP1Zz/nlTdJA1RL?=
 =?us-ascii?Q?/cTmE8taa6wrm9RxSw/H+05qwRur2cpvRhFa+1T9oz6LmeUTG3Kgtzjk2abE?=
 =?us-ascii?Q?F3HndF8Ow8dP25ZvoYlU5bJTshhb/buo6KHsh1S0RXdJReZG5QU9U8juytkh?=
 =?us-ascii?Q?ksAqFB630pAU0jJd9ES7b6cFKpDjKnpkua+yh2z75bdnpWi9Is7na4YDYsTw?=
 =?us-ascii?Q?clF/Hb4lU6pHkmF9z3WY4z+GSweRXYNPwnsPU2dBA0H+CT55SCgAIwr4u14I?=
 =?us-ascii?Q?OjnogzLPSxxvMRKz3vZfkphFzyPEdmW6Bz1bn/cYVa/Nk9eecJZdfP+S86bg?=
 =?us-ascii?Q?Jc9IHHwLf0yjAdm8DdsuOVHynYu4k00biMFLqc2ChSvpgkgbDFRHLnC1z0wv?=
 =?us-ascii?Q?/u83ctJgDEiQVHL4BOc49kR5bJczZAKIPmBzmJWna/uFQXO+lqbkX4LsA42i?=
 =?us-ascii?Q?pBE6Y+JcVHuzH65CSmH8YEaXbw6L3nQgjEmw51gF81mfLenyMBpY39UESqBW?=
 =?us-ascii?Q?pE7Obo/WpmMtqtLTtvQEZIO1+OXaIF9k260ADJhKI8vs30I0QZqC0tVW/zuI?=
 =?us-ascii?Q?zMFhslwupHwBoSxOpI/T37xrKZUNSDpiQD7Tpg8KLby7RzEA60UIWRgMvXiA?=
 =?us-ascii?Q?fwwCSe0g+nc3z4cfq1JKHMlJw2cC6wThfBbpOXk690pYTg1eNBObxsMrMUy7?=
 =?us-ascii?Q?0kK+WlvMPRGFPFzVTeXI5jRYTAK0b8tQUgXmy9IVi2t265R1YgPzTR3flZEr?=
 =?us-ascii?Q?S907JW9WcA0yTm8QP15URikknM9WOURZBOaUF4MvHTZbHtjH/issrMRBtIiS?=
 =?us-ascii?Q?DEr6dJWfpUZwzz9lFs5XDur4LUQhrqiNuqjKvIQbKzhd8TdKs2xho0PiLVqV?=
 =?us-ascii?Q?d8gKkNrB56I9GlrFcm9St+eNBPv18ZysbznA2poNEuS+NNwQxA1QKr/k7R89?=
 =?us-ascii?Q?8C3JzQT2RGjvIqc8WOlkmX1QzAOHnVbLoIqlMAaYQZr5ZLDTKYHTjZzwcUtX?=
 =?us-ascii?Q?/uLuVMaain7oH3De8R6tzYrZ311ZR4W4SxJVzVvPIzZ4Orz52+AJLFe6x/xq?=
 =?us-ascii?Q?L0e+2N97P6+2GBBvSWGilly1sA0xMbkYBwHbfuZF4N/vcvElgbxfqrYeYHkh?=
 =?us-ascii?Q?Di+iKBMj3nHQ+TwAk2oOlnhnvmSitTTM9XX6mWoeuo5FvgUTj1jKk9o51CMs?=
 =?us-ascii?Q?sYqjsxcjdOCgWp0lwQJENGnqbba4vZ4wzdDduc0x7Zb03lBLlDCq5uYqvyAW?=
 =?us-ascii?Q?dSHFZnrl3rSujODwwXb/Fp0l9QyfrnohWcNHKVI2KvjzF7tW2kkOLO6bJaV6?=
 =?us-ascii?Q?47Fs+HXYy2rkbWiLJMTP4SwvK1BdGhsauXw6VItgCxqAJsytjhDGgEp0wj2P?=
 =?us-ascii?Q?0miAGx81+XHnJN1kge9hwfnp7ytidpD9pI6c36sYYQ6Mb5BJWHWHHZkECO2D?=
 =?us-ascii?Q?C57ha1S8Pz3VmDj2WjVBdBdWCb5jlDu3qlYZZL4hFJgbrhuL09gYnZl5qNnr?=
 =?us-ascii?Q?y8+TQTKzH3HZwzr17KLvGwSNpQLo3+Yao3CNnbo0lBpQW8ib2f1tfu8YQf5H?=
 =?us-ascii?Q?k7GZ+ynHLBarFCXl6vA7jTs5i4lJKaPe+sjmvIMyV7z+2SViTo6rlYFnYtiM?=
 =?us-ascii?Q?mVEGSws3io8HCXNSX7uI9ffj/o50UrD0aZHkK95FpSYs1r0BqC+c2T9QdH21?=
 =?us-ascii?Q?II/NDoyA8O0wie894VY4OTsunm5ipZCeAjbvWSbW3/pWfAoFQkzMtKTCOJtI?=
 =?us-ascii?Q?oZog/yKKgw=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6d706f76-91f2-41ea-001e-08d9993cec93
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 11:28:39.7958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EvaIsRh1nuaiIiI4CrwpUBHgAD45t/Hg7LyfWDG2+a241w9DS1dcjoAsG9GzS0VQVvmaly2e/1Uvy1+cm14Hucgu4NMhU1AZgaHG3aFW3v70Da7md0cO4SmlzqkRmPG8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Oct 2021 11:28:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2051

Hi all,

Just to make sure the discussion does not get mistaken as an agreement
on this patch being dropped, can we still merge this one patch in honister
branch please :) ? It still applies even though we missed the release tag.

Cheers,
Quentin

On Wed, Oct 27, 2021 at 12:52:43PM +0200, Quentin Schulz wrote:
> Hi Richard,
> 
> On Wed, Oct 27, 2021 at 11:45:35AM +0100, Richard Purdie wrote:
> > On Wed, 2021-10-27 at 12:40 +0200, Quentin Schulz wrote:
> > > I specifically sent this patch before we tagged the release to be sure
> > > we don't have the same issue as on 3.3. But we do have the same issue
> > > now that yocto-3.4 is tagged and this patch is not in...
> > 
> > Sorry, too many different moving pieces to track with release :(
> > 
> > Whilst it was sent before tagging, the release was already in QA and the
> > revisions used in QA are used in the final release tags as if we don't that
> > causes a different set of problems/concerns.
> > 
> 
> It's alright, just a bit sad that we could have done things better for
> this release and missed the opportunity.
> 
> This however highlights an issue in the release process for the documentation.
> Let's make sure we lower the probability of this issue to happen again
> in next releases.
> I guess it'd make sense to work on some helper script for releases/branch
> maintainers so we don't forget some bits? I'll try to come up with
> something :)
> 
> > > Can we settle on a solution? I assume moving git tags is deemed to risky
> > > which I can agree with but the issue(s) need to be resolved. Can we
> > > patch the tagged release from within yocto-autobuilder-helper doc-building
> > > process?
> > 
> > To clear this up for now I will take patching in the doc building process with a
> > patch or sed command.
> > 
> 
> I'll prepare a patch for patchng the release in the
> yocto-autobuilder-helper doc-building process and send that ASAP. If not
> sent by the end of the week, please scream at me.
> 
> Cheers,
> Quentin

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2050): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2050&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=U9q4K1YP08t9YtMVLPvDSS7TzYccgrrgJEMZs1MryCBQci7jrUIj7ztk7n19OOzo&s=Adx6-VwSObnDF3Q2C6RCQ_ww8XahPVCDYPZSS4mzBI4&e= 
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_86485182_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=U9q4K1YP08t9YtMVLPvDSS7TzYccgrrgJEMZs1MryCBQci7jrUIj7ztk7n19OOzo&s=BNdewZgB9JAQpu7SroEKuJbb4l1M8DVthR6VrgxRE0M&e= 
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=U9q4K1YP08t9YtMVLPvDSS7TzYccgrrgJEMZs1MryCBQci7jrUIj7ztk7n19OOzo&s=memvkvhhp_x3w4x-O1Aa5JLafiJEl57xGj2aPD_obnU&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


