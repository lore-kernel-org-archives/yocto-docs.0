Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.72])
 by mx.groups.io with SMTP id smtpd.web09.13986.1630308985849027227
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 00:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=O0wPHyFf;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.72, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=absABwE8TcB0887PL9bfZD2hQiozll9sj7vwdQJl2C6PiNPO4wmzxPjsYutnluJvxrlE6B9bTdThCi9r0OsEx/Mj+EM0Nt3xOV294giL8BGMzQQu3XNZUTNlSnvPhaCfMmJN6UjmNlxGFrhkPV0eTkMyO9cFNfWlp3VDup7nGeN6YvjEM82dKuKElA6E+dZdUj4C4IfZLII5vPAKjDbXjFOiMlbDGCmhAw+eWlc7qFaz+e9kdXWpgGMhNTVtArsHFdZIckumyx37i517bl8dt0Bp57v0ia2jA6rghLR0TJ8WpYGqgi0+lynO/pexJS2lU1gfyffMtILSl3blG0Xblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rCgbt30opNAIq9Lg9uCt1luCBWXUGV3p7xSyEEX/Ms=;
 b=MOy9v0K7QhmmjPNHZiOJewSkuAggXYzLHP15baenDfcblugHWefKe71xlabcda6rpRooSo/c3mXbFbCGGR3qL/fZFXMgtVxjFbfONI3H0PyMg0/1U69PyD+3F1QwP308OcDUViJP2leTTlDylQWDjxQQFEeY+TVOqb758g02PNkgD2vmaYv7GPRc55PHAYDgPleQogiOcepyHgD5E36J23o6YcAOQwZYORIMtTEQPzC7z2zwPHpDMVDV4SQ5V+KT2KpBUWnctcqSHd5GP4+9dM0DbOMg10D+DgQzC/wMLhkbI1Gjt/ELWR5+P1ZH+WJG5gS46VQzxyirpJ/G2lRfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rCgbt30opNAIq9Lg9uCt1luCBWXUGV3p7xSyEEX/Ms=;
 b=O0wPHyFfgNcsDGK6vnByDQe1vj0GesICupHuvMa9cNOh9YJhBnrRvF8nOk8HZo7WZ1NaxKhtfxPjuYvxZNXbO5QzcRne3irXLy/w1Kj7XmUul+5crho3QfwERNRpUYQ1TUIqftqMRCDqn5TUt/7AZRabFwwWtLviFQSjoyWjpT8=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM4PR0401MB2273.eurprd04.prod.outlook.com
 (2603:10a6:200:4f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 07:36:21 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 07:36:21 +0000
Date: Mon, 30 Aug 2021 09:36:19 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: update SYSROOT_DIRS_* variable entries
Message-ID: <20210830073619.afpffceu4pkf7uf2@fedora>
References: <bf17e3e4-41a2-5558-2375-0faad5eff80@crashcourse.ca>
In-Reply-To: <bf17e3e4-41a2-5558-2375-0faad5eff80@crashcourse.ca>
X-ClientProxiedBy: AM4PR0101CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::32) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM4PR0101CA0064.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Mon, 30 Aug 2021 07:36:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 225d3bfd-8d5f-405e-d653-08d96b88dc98
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2273:
X-Microsoft-Antispam-PRVS: 
	<AM4PR0401MB22732F3A4A5B361B9DE29855C2CB9@AM4PR0401MB2273.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kn7hlz+2YF+ibt8yMZjfUlnlsOeWIREPb2xoaqra3Nt0/luQrvhhZ8mXzO0CZZ+x6u+snJ+q8sfPjoNOqApMwe0aLiF2RQ04V2vyMz9pDVDdfK6gG9+kMU+3ZcEN8+dXg/YugOEFPDp30UWtsbZrjaPIPRUm/LYjWS/iIYlngd8FCKHPn0a4F+v/wVIOHVZhwmXBz+f+uRf6VAAkUzDO5KP8BL1pxJalfArwuhGQOSYRd5OL/9gyj3OpfD2kgY1V0P6MXwqYFSl1SWmeB1CrN5dBpN9VCYh0rFcDwCYQog9LCVb7k33R/i9M9d8vbWgheEiqux2Bkf73BZR/Qc5a4uf16wyEVtoBBKEAsfa2tfHsxePjbq4mUxTaroo3xwmCKC65A8EPHdqjfDKhweZqPXY6jDlHbiDcAAzahM7hX0HEe9T0RYA0dstE4XdzYWlX4Szim7hGoTsZ0fdM7awxb910L4lhcrBJ3eg1PdJyblcvyMyOzGuPiy6i3n+RlBBu0nXLjb5EL2EXtmx6dNjSb0ynH5lHQGFkYVR3HK7etB8dbfx+omaaW2HlDjU/DdHproAeTJl1FqC807qTzvP6/IEjkKrQPifHOlOves3M/F1iC/3D9XUK3zPeh6yB5K0eHJaRot/jPaireZytdLAJGMnPM++ruUCm8Ze1oKqXNaXfSastkQBSa4w+/pI5v6YBg43RnEVa+K99OsrfUrgf0w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39840400004)(136003)(376002)(396003)(5660300002)(186003)(9686003)(86362001)(956004)(558084003)(1076003)(6916009)(55016002)(66556008)(66476007)(38350700002)(6496006)(33716001)(2906002)(66946007)(8676002)(9576002)(4326008)(38100700002)(52116002)(316002)(26005)(44832011)(478600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3D5sARH0SVsE5nSzfVuZqqS9HIp4ljmabEKYxvpWx4o+mkSAv10IGTulQ4Qh?=
 =?us-ascii?Q?DaHC5HZhHRwKi5drxBpKEJQ/dY/D6ymM0JvZna7F4PZfV7IItjcAdXt9v9c3?=
 =?us-ascii?Q?5er99HdBAK9NdhBX+ZSnrYLJgRsZQz3qGNgtVVsZzpBPA2WBceDphoZN/6Mn?=
 =?us-ascii?Q?+dWszcI0e+gS6t/9eV6q7qpQ54RJJaNmCUeyyHcfWI+g/bMnTBugigidNZkg?=
 =?us-ascii?Q?h2nEBmngyF7dR/EgQ2hRJo7RAC8zoacEPcGkHb6lHtwXB801NoD15sPJcaaW?=
 =?us-ascii?Q?KyQ6bTporPntIQlO/mTKwLo7UfHcO8kUXBL/nvKWpUDA8stjZ/zOmlAdaLr4?=
 =?us-ascii?Q?Da0wAmffzWJJnZriqy5EG3PVkahLrIoPk7WRfC8iLQf3U0bJMwNSHq6xtjPn?=
 =?us-ascii?Q?aP30Yuv6B5IFqBhBtxej+8nf1TI6Ap1Aatzus1jAOZ6aRZyL7g+AKabqTsvR?=
 =?us-ascii?Q?pd24Pok18e4R/sP3cYKdVFCuuhOG+qeH7mOVHdub0A8GeXh7PPllgAf2wWki?=
 =?us-ascii?Q?yI1/kOMVHOmqmsyz2IfL41GTN7q4bmlEgciIKYPGMkUGdW8XO88TZAuklQyV?=
 =?us-ascii?Q?oOABLJAbslye6CHL2SOoN7macPETC1DlaZabw45tvIhL6fPT1SC28F36hn6V?=
 =?us-ascii?Q?hIWDoPrRAfXCCXoUNllShLR4Dg+kIJgexqmBbJGKMnJzie32QZoBFcAKSQBV?=
 =?us-ascii?Q?BivALrs1D98T7itASxV0zuc5KVFLkB8xm1JU6lQcoDMPo13Ti6sRLTDeOW15?=
 =?us-ascii?Q?HLIHLwDsy6YCljNAi+YZH7onVTkL9sdLjISDNiSlaGQ50uTW3p+JY9XhiVT9?=
 =?us-ascii?Q?iNd9jOCMQUavx43+Qm0XrahcEGThSALSamUee/jwk4YtBe3V6SOAV9BtBjms?=
 =?us-ascii?Q?1LrarE3s7H+3jVrJdocHgMUtQU7jrgxD8rvMgWVmasZIdQs8hxzTV6iHhhik?=
 =?us-ascii?Q?Rcy2fpxGiGCnd8MIICLp0dUSZLl1HN0D7T2+RVvb4K+8Th9kRuA2VRhFkYpl?=
 =?us-ascii?Q?vbMn+T4UfmoVWe5hctoV3CpP+6z9cAmS/+O2gkFUp+fE5Lp380v3y+YzpOVC?=
 =?us-ascii?Q?4ZbEKzkkkBd0JfcdnBM0+/bU7zFPiXqTJU1BqVxS54b7qfS/ylZ/391QJBRb?=
 =?us-ascii?Q?j9OfDUtPCsxVr5fVPDakwEnxhWjaB9y4RpEy57/hgK9dU2eAPCbDD6rR4CCJ?=
 =?us-ascii?Q?h1UR0l+m+519ji5obPlYxonfmg5e82+Zf92Np/8gpOFAEF34oxankgQGHNxK?=
 =?us-ascii?Q?VRkSJ0P8gjO1MCO1hXaE+kqMj/kgVJSlX+3G6XmRHevIPIWuJcqhG1hIBCAb?=
 =?us-ascii?Q?tEHlsRaKts+Xyxd/WeZfhpc1?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225d3bfd-8d5f-405e-d653-08d96b88dc98
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 07:36:21.2542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPXHIdFUdVB2tBltEtQOqjq6PvmITV2PspazUcV8RToRmCdDK0CfzDSNT+l62pM5Nbyd+YA35qpZc2XQeTwy9OKzd8fni3xZm8JhqpFTR8V+VmI4YHpIzrssMkhuxskk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2273
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Sun, Aug 29, 2021 at 01:08:25PM -0400, Robert P. J. Day wrote:
> Both SYSROOT_DIRS and SYSROOT_DIRS_BLACKLIST have more current
> values.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
