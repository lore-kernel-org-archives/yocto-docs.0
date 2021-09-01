Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web11.6101.1630493628343543443
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 03:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=SBFnQFKQ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.88, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcGfTRpZ2QIHbHu7pk0ximI3UTRW9YVtw4LcM1tE9EPXyXqIcPpiTnIua6b1jZaXQq/hLRvgCnZYtMKato2uE/BZXHBhmWuY91RSnk7D1KfmMC/J3PfAdV0Y5aoA1NUZi6M3NwJjNE8yur7rhDCl3jerQXXb1GLPcJ0iLAOla9BCiSEI/loQYercgblM3HlwH2oFdHix+qiKvvvw68d9ncegHDzfwrM6eSfEr5YLPzDfPI4g91iwfxJzl1KK6cJkc2i9LZRK6g8UNP9wFgmCM04p3VvAFG6MDRk1lrztibLgMgsxq6WKt/botat+8+NkCxup2spB0s/3Cr6trw7Isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7eMDUOE1EB5dp08nwQAiy+MTJ06x3Jbg/JYP9fLMbA=;
 b=deggNPlDhnox4uY3lfdP+HgNtt1Gw9yRIjfeJXSdG0BoLWpycPs0PkJbf4XDXC/++7vbXMTinKtxLSvlJFZ1IYltWWt0TKExAwK35gtZ6EOfsi84sKMbwKhWZClVgOmHbZs1E+swxaOwjgccUMfCThiKOGpPgALQE6u9kODHPtC4XdJ2kXrBkpOqyxo1dP0esEx99zFY//kBpmW24btmcouNMm5HzVCSyLTvdIj5JeAPfMKpaaoUZ30UEOHC0dqSn3xo2OfwaIRkyvRKhGYnYC82KtvWD6OdGfByWBi5qk7e9Kz4aPZlhKLrnxOQKlIMcCQDTc+syXm6ptkC+zlBCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7eMDUOE1EB5dp08nwQAiy+MTJ06x3Jbg/JYP9fLMbA=;
 b=SBFnQFKQNulzZwVQH1Vrp6oPCbhLB5zzOTn3JzxWanQIhWJNsrDgQz88Up8U1n27BE7hyiyrA6Jkox1G6+JxpEwxwvCBp/KEvq0DUsLoeRdrBVyCbdD5fe/+sBmTC8eemYUIGZlV1BNe5Pr2pVwgkWR49/RYQQu6gKHtWCBmx1g=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3684.eurprd04.prod.outlook.com
 (2603:10a6:208:8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 10:53:44 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 10:53:44 +0000
Date: Wed, 1 Sep 2021 12:53:42 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add missing "${PN}-src" to default PACKAGES list
Message-ID: <20210901105342.tvbra6zimodobpst@fedora>
References: <1baa1152-eef0-83ab-75a0-bd243c4dadd3@crashcourse.ca>
In-Reply-To: <1baa1152-eef0-83ab-75a0-bd243c4dadd3@crashcourse.ca>
X-ClientProxiedBy: PR3P191CA0049.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::24) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR3P191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.23 via Frontend Transport; Wed, 1 Sep 2021 10:53:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd1bfaa3-8676-4195-a478-08d96d36c485
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3684:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB3684FF3A56B1174B0DFBE346C2CD9@AM0PR0402MB3684.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PPJUVLiD6eWEqe7qSvgZO21QdJQ/9CuPc9qDKshFQEp+uCy7nHt2LpGlJGPuSNXMKDq+iEi3jIwo0LjdgMom3k/Oqrmv+ybHgqiE+nvQdQsItjiRCNueCiaElnUTr3OeCOKevXASyDBP2z3haTDk/xxDqOCfSjuz+U8woypcFlB0K5eO1vnEnDYVoPZgmwGjlpIX6a2Jndzl1nzugLYePktDkY/xpnA12VhoDo2vRELK5e91UvFCfsJxxPtp4S+1IeHaf5z4SJenllTRLsAGjTA/MoquiIR6NVCu1Y2hpPHXs6TKPGDlQbjnLjdf5ZcmrA2bXH41b2vJ/65qQrjWu6lpcPY6p/S6b/0wEQLi8dhOkgguf2dAnP8sT5spQSvE5tTQOJq2hAaJzoqsgykxdYZxa5M9OiI9QnSu/93mKsfscPWjkVz6z9VX/SYUPCWaKiox7+afK9cQzlJrQ3I/HDknCzCP2GyEqpVHkVIBmjQ5EPoIDaoh+PaZoyncS3MlzOzSoOOb42pYmVEjtI0h3M+z+odz5b7czO+pXblzkznM64YTDpByIQkM0aLzz5TIYVH12/pXfUOaZrBoHuhnH3RZRyZBvqS6B6UcXatUEk5qmAGE/rA1bxdgFC0LnPMXSE94byPDctAdtTUj5so82xZW18LoSmDbzC93STCyl847eAdPGOiIBgi6YJnsfZ7lHw+cwKltB4w+X/sjBqeTFMQb8tbHT1FvU1TN7yn+Jvo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39850400004)(376002)(366004)(346002)(2906002)(8936002)(316002)(5660300002)(52116002)(38350700002)(1076003)(558084003)(8676002)(956004)(6916009)(478600001)(44832011)(9576002)(186003)(66946007)(66476007)(66556008)(6496006)(33716001)(86362001)(9686003)(55016002)(38100700002)(4326008)(26005)(228453006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kiXzXEKUbbYk3r4nzfEsxrPqAl9jvPBbkyN6072pwaIqk9h0iMTPHfKciPUQ?=
 =?us-ascii?Q?uzqvs+njBe/MiVRqZKO50nfXC1S2njm7/oM9EX0eTOvkTUKWuxgCp/A1xzhT?=
 =?us-ascii?Q?zxJdgcqP3Ibrrm7ZCucod0WP853I+fICRGbMQwx8TKn8CiPckohNiG4imgqh?=
 =?us-ascii?Q?y370ZI+4vlYj5QcCUWcRoe4mBGayfkVGVvFIO2S1KL8FlBzAY6rMC97kzVVq?=
 =?us-ascii?Q?XQND1TWhAfQspjXldpqDAn31b4TSRF1GjqZpKMoLtjyRZu/VAKEKQCdH5Gub?=
 =?us-ascii?Q?XTGErZZ5ERGjqASedMuTcsAJ3T20ySgtoOq/90NVfIfYVkfavmiXyCJng+se?=
 =?us-ascii?Q?ZXsoRDpLeL+0k89zt0YflfTJ7fQjISs5erzniOL/nHpoY0JBITAwixy+p/Kg?=
 =?us-ascii?Q?8T858iOyzieI3cMWMcFmBZXiRuEeJ+pgom7kwT3Ft9BcX12kZtahmncJNH8c?=
 =?us-ascii?Q?jobsDrqT45JQaKgk58+s6IOPr48xGlYAE/KQSuM7gNbRuQS9FwRLZfBqiXVP?=
 =?us-ascii?Q?Jq9BVMwL686fT5DkXluBJxn5oP82GeA4MQiaVcoVfiwsR7yl0hmHBlhg93Uq?=
 =?us-ascii?Q?USi2yh05pj+/QfZrK03YnEExIIY6w7acU5S5YwM/B8qJTgrAn3bTj82zScCf?=
 =?us-ascii?Q?EQfMP+/+YBg3fAZL4vj1NKFugHEZZ5iUd+rPhnljoyrN3h/9hPzwx12R8LCQ?=
 =?us-ascii?Q?xi10pRlMZezNRTcaDhKYyjLjJ9Uih3vvDkumfGh9iW0Z/d6YNAfveDjddfiO?=
 =?us-ascii?Q?AR7zOtsI72jX067yihZM1QaGMTB98rVVkCjUP7EYIwbMNAIouX/XlvBo27Tk?=
 =?us-ascii?Q?L/0IFJVtW0sOW4stFCUm2alNxkE9Kki6UA53Qp1Z/vyVGdN4E89wb/OLZil5?=
 =?us-ascii?Q?l8bVJZYOag8mrgEQTB2STcMkQl/AHRJ+baIyu0PuWKNW8jdP+79qggci3EJJ?=
 =?us-ascii?Q?+iZ+TCxpAPTFikToIB01C4P5vyTZuHiFhtqotHbqRrBu2jw0Wvyj6lv+eXVW?=
 =?us-ascii?Q?Tgq1lZgkhZZNX8JwR35sXEEVHRo/7uK2O/0mVLMljV+lLCh0d6RoaKSmn2yU?=
 =?us-ascii?Q?RRYJGRqdJmh3FCJn1IbiqhEHdPDpLoEVgvLh67X+8odeTTXyB3jfnzWjWLla?=
 =?us-ascii?Q?4phQAT/qOBUD27oGkz4Ju8GKzAOlcIPN9P2kcspkvBzHG87X7ySR5LO/VuWU?=
 =?us-ascii?Q?BRJ5lXKPBbfk1dGdU5Z/xtK5tdE5ZD/siqrgOpHwj8R0TzXTGiE2t/QRptzU?=
 =?us-ascii?Q?plwzhoic61IRpJVZ0DDyE673auXB5wNa3iPD+qzjzxzEFe+bIMZ/XHFxWn0Q?=
 =?us-ascii?Q?8zfd6zGJa5uM/YD4e0X0WqQD?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1bfaa3-8676-4195-a478-08d96d36c485
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:53:44.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ooa2syLkkJ6JU6ejE5F0yVLKmBcL1P4M0Tlxd+kO+kVZHyQLPWY15sitTk1knNLHELcWIocOlecV7U3cnyOdXF3Netdzfr65m42JAWg6qe4xbM8eXVcd6xGLi7m9DUS1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3684
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Tue, Aug 31, 2021 at 06:28:00AM -0400, Robert P. J. Day wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
