Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EB3C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 18:44:34 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web08.334.1636569872191632951
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 10:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ScblZq4W;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.50,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvsRWL85Qot9xmjDQd774+4//U53cFrhhuskLbKs2gDNLTUmu63RCmlcxGBSVOPTyp+Xsdsr9xuOOWbFsW71uZnt6r/r1TBmdoCrqEdPBxgZ5mV6bqCRRUDy+iXj+mcmK3qCZLkWWKa2L95TdJ6EikrUoPcQs6KD5Kb/jbL0VszBL2ezrwYyspFNEzjrOOi27eaqoMdskcZVDipM0xanvwRHeCfRxRlh7y/xvPTWpc+lcqCAW8ofuTg5VuAHLE4+XovzVfbbUm1OmoTPtP3+CPO9WDius60tzhkxm7qNkRR78a2/OzMn4b8HcWBw64IK0T2ONCpt7VyoVN200A2/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBEHSfuH0OhozD7PpLvua0hGfKzSI4G8mRkewLhgYSo=;
 b=PrNTTF9vfzpUfpiJsG2tVdPuXYuCcA91UFrwEfv1X68Ndt8bMbgPkCErx1711jYp33M5HchGKS1quBe8+eQ+ZsUuk6FXu4z0+y/fxUaH69c1wnHfd6/mOM9+Wncvv+QnnPHwOELLiOHUIz/g24BcPV6oL62KQHmhVRXh5tdg8a+hY3ACZnr2AFvHeMUzj7ogKpKjnAIfSxbmJ7TytsW8tiZZYCH4qIdNh8QbCBtfnJrLN4KuFPL4BVt/fJgBd0XbiWbGezBrSWM2YmgKv9x6QL5uGzZHBqr/o19AUofjqbYUJiPX1Mb/5EkqqwK/MKttEmo90xMe0ailoajH7cIAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBEHSfuH0OhozD7PpLvua0hGfKzSI4G8mRkewLhgYSo=;
 b=ScblZq4WkuZhg2wNTv/nPRqIt861KklMJj8lNZ3zp3e0eQEauNZ4gaYqtIfBiaSUePyARFMlaWbAUEczCsl881ddrZG16QHelNr5G0kX42BcfyzvABuZ2AbV9rxkP4nzF0gVyTTNRVgWam/AemBACTsP3xeQCo92C5rrmlzUmSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5937.eurprd04.prod.outlook.com
 (2603:10a6:208:119::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Wed, 10 Nov
 2021 18:44:29 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 18:44:29 +0000
Date: Wed, 10 Nov 2021 19:44:27 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [docs] [PATCH] [honister] conf: update for release 3.4
Message-ID: <20211110184427.hj53tzp2p4pt3r2f@fedora>
References: <20211021084332.334075-1-quentin.schulz@theobroma-systems.com>
 <20211027104016.uqi7y5d2aluyvf4x@fedora>
 <b1ceabab92cf6b2b6894c85162d84af74aa4abe5.camel@linuxfoundation.org>
 <20211027105243.7ncoejzfms6rcxyh@fedora>
 <20211027112837.7oaibv2saa4ak2gn@fedora>
 <052ddb4c-0577-e34e-980b-c7ea828c98bc@bootlin.com>
 <1C22AE6D-7805-42F0-BB50-D08111E1BB82@0leil.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1C22AE6D-7805-42F0-BB50-D08111E1BB82@0leil.net>
X-ClientProxiedBy: AS8PR04CA0127.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::12) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AS8PR04CA0127.eurprd04.prod.outlook.com (2603:10a6:20b:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Wed, 10 Nov 2021 18:44:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eb630bf-1645-48c5-e3e3-08d9a47a20b2
X-MS-TrafficTypeDiagnostic: AM0PR04MB5937:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB593778D0AB83AFCB9179A9E3C2939@AM0PR04MB5937.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OhfBBe/0lx4A7KP3Ype+3UbXGp0byGwJcwoANFVujWOu6cG7axLEW4oU0Zp8HSAGuGiwXLCApHDJa+Dvl9HgeLYi2Wo1WvkpOMZSvDiwcJMOa88yvCxgqtxk6RouHLCN1dNheQntxlYlsSy1GvvJZSMDd6hOac6bUOpFd/sH3KM0jdoVJ2UchKfn2sVjJ9YeF7BY1pSts/b/qcn4SvBbespA2tSoTqisAvvHKXnhB60sQgqcU3Ry47xcaRXDqblwYmpTU7mx3+LekkXDs6b6+PIcHEAzLzuYQ9E75a75k6uRg5CRCj8mdq5RJn+4QPzy+gzSvjaN7LKsQYZzuK8hU4EaQ3PWXDk9SUaGQE2w+O/5edXdQxfTHCxzKFEuLF0T/vjsuNQoUiDj8SWsitGbcDHK373ozVY5fKnaEj75Ry+hKG9O6jPzyx6Ttk+O9CAI8tcYGCpKVs+5CM7qB3r5sfCw+nGtiTcFo/HiEPIGuo+yfi0e6EIGwKbR1Sn7L2L4lLb0cXiHbUTvqO9DAQjd1GPq6qFzBlmAN87CpcgMNDIV5NtuZdZnapVsPJJTQoz87RJU+o/8YP9xFyEdhVx9DRuv8d0O444PWkTQ5/d4/c86/0XyoXZD9LhasbjcyoFW0yPXZTzAfSudqD72jVF4XmjqWmcZBAAOlZ2yRKwmQDkW0Xd/yKlWgle1BiY0eq1F724rtCq1YSuzJhPmq002xg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66946007)(5660300002)(6496006)(86362001)(52116002)(4326008)(316002)(19618925003)(1076003)(508600001)(9576002)(8676002)(38350700002)(8936002)(2906002)(558084003)(38100700002)(956004)(55016002)(9686003)(66556008)(44832011)(66476007)(33716001)(26005)(6916009)(4270600006)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ntnxzSXqSMzC4E5D+cJG7XXPT5eCgPsfjqJMEZ04o5dOGViVPSqBPFOYR6RK?=
 =?us-ascii?Q?jclCDCckRGFDTUmWEBvhUpqwNODoBVn+ouch6rMt5S/IZzDlpuWG/SHFscyz?=
 =?us-ascii?Q?eUj7POK6A52J0Is1rkGNq0QMJuxgi3rhAlLrhe2JhC/j5cyxbkx90udSgfau?=
 =?us-ascii?Q?7i/BZmGK/8FUcGrGAC53xDdrQyngx6GLevLUecOds5e3sxP6Z+0UPMKq3wLg?=
 =?us-ascii?Q?UtfBXM1tPeuQ4XYkVyKLGgUncmU7aSPMKhbA02UDicI0NycifRIslwWTzL9k?=
 =?us-ascii?Q?YvwnuZNVN9Bdymtl86GSMoFZ583sruhrHmE0EY5+OuD/EJzJRLBoVvSI69Ye?=
 =?us-ascii?Q?mMQ7xC8p0bREnYAehMYWjqVnEO8FpNHftcX3Itlp8wskYRdCvlRSnoFaGNZL?=
 =?us-ascii?Q?9w7F2u5OJ510bPXTYdGlt6kduETM3dS5ApQWzpEv+U/MNgXCtmsMv47YWeJQ?=
 =?us-ascii?Q?1bet5zRhqLJAlFDPcjFApSI/fNC2IF/puSVPl7IADNVMoejrCcOeycttJmjx?=
 =?us-ascii?Q?/YrHiZaQferjjE38ozBUn9l2ABQEXEO5kbzXHTCFk3HSUM2bKLnMCMdswSoq?=
 =?us-ascii?Q?weTD4M93v0zrkEID4hJds5E7h8ezzd4ffUzW6nytcilXVLpnhDmawH3p6sec?=
 =?us-ascii?Q?vOkkg0r8KPWIWtAgcg3Iq5y6HdCT0Z4DBYVQue/R9VpS6OXWwJ7j4CfB0ZfN?=
 =?us-ascii?Q?QCCmsCwYr9nBLhth7t0emhHks+N1XQHQWFvz9x3suOuVPG8hmGu88rjSAgXL?=
 =?us-ascii?Q?x0xBlhCP1yjPombIBkp7EIW/bkVLAqg7CKFpB5qS8+ZiPpUT6x5sPv3ggj4W?=
 =?us-ascii?Q?mrAFtaKlENRwMkMgog+A2Hvno6yyXxIs6wOLjkGNqaPgBByQf9i+XsPOcw9R?=
 =?us-ascii?Q?tDLfNOscrf9nWbp56UZFzUY06AN/1epFrxG319u6B0EHw7BJ6NnBqVATGCb8?=
 =?us-ascii?Q?QB/e1jtx3QUohqreOw2382XQimy5c1YEDPsuyGHe5JN5+PgMJsH1Lv0s1gYx?=
 =?us-ascii?Q?LsDOjnqF/h+lffihiljSmKTFNjKzXHYdqBvUpTryObmQS/eAPC8DktI+yTRe?=
 =?us-ascii?Q?3JTZQYfrMnGFeKp7MSnSEkyO4HfrQSEv6yEPBS8oG2QF/f1/sjXLTLzriZwk?=
 =?us-ascii?Q?n4SqO909Ly1ofmd1BSn6SF8h8ZI/o9nHbdSI4THgVSG1lbesqLLJTTyYoIp5?=
 =?us-ascii?Q?4ESlGsAFnK1UG9npVZ3x+VA2na4wbjXnZSfVhZVTumtY1Jgpx5RTSM+WzDXy?=
 =?us-ascii?Q?asKc2s33Pi7ypr1L3Rdeiha27WHVM85it2AS1qRyp/GeILgL3GlWON2t1fGl?=
 =?us-ascii?Q?96q47IiztqVeBxtrPdE+nrRUHT1QERTJQCY9iuu9+3AZkvItRrqkq9d11y0v?=
 =?us-ascii?Q?TEpoMawOySjtWWfs+nsjQVArRwLiLWhqJ0T3Mjpkm7iVw5C/p2Brtzz8jHhj?=
 =?us-ascii?Q?0M3TnXU7hEG76mWxzAfgflp4+ZU7kj2qFyabXzcjW6wmERmxRS2NH1X2idHA?=
 =?us-ascii?Q?Ecv0SFZ8qjLLr5cJ1OPvPusJ10Z1Y9BkgwOy+AbitQ8Fg4jTPfSsUfeOS4py?=
 =?us-ascii?Q?brDjyQolXHQh5fLrCkF74ON3F2UJiXHRAHCPRcrH1rsLaQjP0JCO8LpK03MP?=
 =?us-ascii?Q?tQeE63+wXLRQvKYV6JjaI+pW8BZ3Qh3gClLOiqW4kJj47lulTK12TQicUWiz?=
 =?us-ascii?Q?be+VxHBaK7S0WMrwkaPJPqweNBnHD0JtrDZJuNHgwVO2+O1YA2C+QfLeUqZW?=
 =?us-ascii?Q?IpXtMG2mtQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9eb630bf-1645-48c5-e3e3-08d9a47a20b2
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 18:44:29.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 phEv3dmWolO7mZmmCsTTTIlknJnYVvQ9klFmXTqI9/somhF6agIw2aSgIqoK+kdhC14iPyM5gnXvxXU1AY+NUn7AgWk0WvntrwT/bDGB5Ua2Mx9h9+gof/3rvll33VBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5937
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 18:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2123

Hi all,

Gentle ping.

Cheers,
Quentin

