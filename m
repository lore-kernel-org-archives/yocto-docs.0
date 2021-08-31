Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.41])
 by mx.groups.io with SMTP id smtpd.web08.3019.1630401063430288247
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 02:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=tnPxgKYM;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.41, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpXpOgjxvqinaSb68oglDU0gD27xXYfW9KUsYirjFqfRyLnPh31KoFz1N/2zhoCZvlOTaAf7qb7VApY62sg0/1D/rH7wA59Fx5LU1wdC3VUvfQkHQPxG2868FTiV1qE8HSgoFEbdBhGcD78+IYEzcwxcZA4/JbNFLD0rbGuXaDPnziINmvjRGOB+flASDMlgiIOhKDJfmE0MDIqCXM5n562uSqTnADQ4rjVca1Mkw6QXNMvK8F5n8BiGv/RSVdMcCzHL5rbFHwr5+xFAz6aIarY2yk6m/rDR28YFDYEXe5GUbCDrXRrXfp1zTblsV43NXrxAPQLpmhf0s/2qxjCROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eb+oT6Tym60oD9g8CPx493th6y1Lar59igI0Ngn1Y4=;
 b=bTsRflW8e6RFDWUAtiIY2csS+ggXLg8IGzJSUhUXh2x/C4w8br9QJx5wWjM3OlRJDYGxw4hZc1Oy1Z75Y5Blivx61EL2HpVhlMAVmw5XElslSkjhYa88mlsLLr1vk5lP9HTwy51o5SspZevHIBGSZTO5q8KKx9vuSxYdz9pcwDDpk6OHZl4KyTAsrKVc4c8sw6rKzbPi18wfhPeETf9nxlSWPxo4nd25pjTlzleTxJN4B5qsSDlAy8mBROF4xOgsPvTMenoyAKndewLAiZQ20safX+uaS+Hs1vgvFWH8I46+DNf7zaWa3YfhlSAVlIYybymd79MqvHb26XmDSbzY3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eb+oT6Tym60oD9g8CPx493th6y1Lar59igI0Ngn1Y4=;
 b=tnPxgKYMxDneaCwOXeAgwUl/hzGwiSAcsdMigD0lUSuDO0KtrqOuvI9KJoYCtRVkRVQdXiOKpungyORb6vLeXNv24xWP9GTq1JaRMZAGAefzrCAB3dOpdkI3VpqsqbO8Qw6/OgAOH5Fq5OrCZy9ZmCs64Hbxv51xDVP0pHygl60=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0401MB2684.eurprd04.prod.outlook.com (2603:10a6:3:81::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 09:10:58 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::218e:be8:ba2d:6af6]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::218e:be8:ba2d:6af6%4]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 09:10:58 +0000
Date: Tue, 31 Aug 2021 11:10:56 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] how does one search the docs for, say "site.conf"?
Message-ID: <20210831091056.hvcoe47cv3xxhvgd@fedora>
References: <b793b5cb-48cf-5dbe-dc89-f5ca7d714169@crashcourse.ca>
In-Reply-To: <b793b5cb-48cf-5dbe-dc89-f5ca7d714169@crashcourse.ca>
X-ClientProxiedBy: AM0PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:208:154::15) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR02CA0074.eurprd02.prod.outlook.com (2603:10a6:208:154::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23 via Frontend Transport; Tue, 31 Aug 2021 09:10:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f184c7f-7ccc-4635-e674-08d96c5f3edc
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2684:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB2684598AC433E3F936E8004EC2CC9@HE1PR0401MB2684.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gXWacifhFGaWxvhLcNL+TeVxjsyV1KIKqVpaI28nr5jys/hGZOzRFXSGTYIUYn8ysztie4HQtSag4D1sbOfzgAClCYlzapcN8LJLp9/AwT2nZBwlf/bb3eUwTABeR275YwjILTAOZbkiHYTsshEosShJug6nZDPLbN+JTs0POk9Jrj8HLo+0jcqL4cZ/Rl3h8iqttP/ANchJtT5Uvtb46CGC9muNEMo9qyPBUJusO/T4TNWOAXNSs2/WDH6LVvpZLcx7Ga7aKi4AxxWiH4ZqS46Yh4B4KLsfzWl/fvCNZKjSAJaobAYbm30x6aNqAbeupp6o8SXMTeQY1Z1r+p7D9H53MrL4a7lEkEe5lZC+4TDfNU+8w3HEq2l80QGK2CarWP/K5V0v7Ft83tOrS9Wl7RbwhuBPwSuqhtPNHUYaVCZtIiMDJe4Zd1+TMb/AX1nFFsPzM3/Aq8mHFQi2D0OIVGoZtIphaLMZDSYqgLf1ZijAzbyuNyYUmyyhkJxfUUpjywbb2v7k4RqBjD65ixegVu5KQbAVzN2C1+Y1pqv+C7Hucc2Vvl8HOFUiMi8zrs8Ng0Nyet/xvf8dgTQ3TlbYG6iiY1Z0syNmNQGLY5bh6wxYtNOlHY1qibI0aEdgTfckmH+o3sdpFCCuKN4X5wjRFZMo3ecagbtnkO/bQWJsQ0pSANvTCb76DHAQ7qeHN6Ya+S7Yw0J9kS98reQcc3uSB85c4MdSwkVk1Iv33LpzRiyMwGDxCANxA5oTFX37ORd0UHOOXHh7f/s+hIWq/AY6Fw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(316002)(86362001)(5660300002)(956004)(66946007)(66556008)(966005)(44832011)(1076003)(4326008)(38350700002)(6916009)(8936002)(38100700002)(55016002)(6496006)(52116002)(8676002)(9576002)(26005)(508600001)(186003)(9686003)(83380400001)(33716001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mtFedlQgIhqM+JdpoUFgu/j00DU5FprEqMt+9+iMRSL20So76N+l8mGl3ffv?=
 =?us-ascii?Q?OXO3avJ8rJNBDYDeDGencdBk8kEnHBe4qsYGW7LMtfOLYEUmKAtPDsez/iYK?=
 =?us-ascii?Q?Jmb5P6rdUFSxaExkcWW+XFdvydthL3XyP2lgO1Jb1yQqQzR3YEPSBmGsjsUA?=
 =?us-ascii?Q?5g2Y60j2pOd7mLSqrJxAMcfasgcl7a8XJMHW29VJMHhnmOJxtz3y5E4sgbL/?=
 =?us-ascii?Q?GT8GFsqcx4R/Rz5pg3f3mFlFSvGD6CCE0k9H9+ewxy69x6NvsPs5VfjjGDOZ?=
 =?us-ascii?Q?mWI1jiEWEd1p89ZjAPBUnBI5YiN8nzbmlpMlcSE0/axBGbzg91cLBoxqzyAm?=
 =?us-ascii?Q?5c6VsNoLEC9diQhKFsudwPmKEg2+UzoH5eGq7AKIYadlUn4omdyGikhvjn5u?=
 =?us-ascii?Q?4Ge8EsqyE3+w/qAUBmKMEXfVdJTzylrW6HdzTeb5sr//X4ajvNX1WmQbQNJ+?=
 =?us-ascii?Q?pGk9ptuSPTIlFlxrU5BSogubMUsAYRw16wygqgp7lwvUHVax3tLXoQFvWJIq?=
 =?us-ascii?Q?ZIeBBkWBlq2CRl73uhliSaocfS493D2chuPl1pg5e6IlQhKeVnd4HX+kk4no?=
 =?us-ascii?Q?0iNrC4rct6aw8BHsQ80WQdhjYOxem1ghTHmV0/Zi4ugWXKuZjsOew5b1IlmB?=
 =?us-ascii?Q?kN97wWUfO2l3lVwrRiciSXOunaIRtJ6jN/+ECFn1VbhDXsekuQSZlbjfK1bp?=
 =?us-ascii?Q?7a2C+PcfHONB5S5cJGtHDX2lxdQLgIf3LB+hZ/agsmIdoGWAlDZ/3ngyc1lp?=
 =?us-ascii?Q?yUuL+SxTTDHF537Ech+NQYAhlmr8t5bT4USEQlk3LcbddYtxyBW1OzsY1pM3?=
 =?us-ascii?Q?o0UbHDeS1s9hrTlVCs8tOcJgDCXEEQV7poK86RKUhPWpHcMhoO8QaCHxUxns?=
 =?us-ascii?Q?d+SGcLWvQWrB3OtdfHdhNItWrtQ9nN6sQGiZuRuNaY7+N2n/Ofuosh151uCS?=
 =?us-ascii?Q?VSWHdIU9dy5Xckd8FH0SYcvv6sbRgqEnFOIHPICEVhfiU1/NNiHCulrTu1NP?=
 =?us-ascii?Q?5kHs66JD2XETOH9d2uDeCZxVmpnuGOJCy4JPIEFQKjf+qhvwbtBPpXJ+/xSR?=
 =?us-ascii?Q?mZFcR7eECuf60u6RtaeRonJFKtUHstc4SKu503dJ7WRqRc1yTteQZAunnUcE?=
 =?us-ascii?Q?dAR2DKZRRF/Tn17U9mc3e/hCGqo9EvF/GLIOAZJUgLZhN1tsyj52Vw77vKdI?=
 =?us-ascii?Q?slwjzVpOMUWl2pk0SiwnAaCbaq0MUuXKVo5negGC6/lNIiS/Z5eBaR3pkRcG?=
 =?us-ascii?Q?5ukXSvfJwAMDed404Mi8MO8RakcqGdOJAftNWxyO5NHFX9s6kXcSEhpL9soz?=
 =?us-ascii?Q?LZeRk0DTTpkEBnV2/zwmidHX?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f184c7f-7ccc-4635-e674-08d96c5f3edc
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 09:10:58.5041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbmPkEZBBa7lODlAMzkiPxZU+do1OtU+T/kkh/W/QYApnytT9lftQiqKVjioU4zoxuwpcRMR5+sXBPQ9MPHTIjb0dNmYvmSyX/O6vQsyMr2xGGEJA36L7AdlpoGNwrKa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2684
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Tue, Aug 31, 2021 at 04:36:57AM -0400, Robert P. J. Day wrote:
> 
>   on a whim, i typed "site.conf" into the search box here:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_index.html&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=1vxuZK0eEqkxMrEamqtZYAZECL495cs1IbPZJSorGVA&s=DnYrRN_mwQLyI8U40I2xvuvbFdozv2d9J6M-3S7FKtM&e= 
> 
> and i got a ton of hits matching either "site" OR "conf", and nothing
> i did could initiate a search for the literal string "site.conf". am i
> doing something wrong, or is this a limitation of the search process?
> 

The search process is extremely bad currently. I actually don't use it
at all. We should report it on bugzilla if not already done soo we don't forget
about finding better implementations for sphinx searches.

I remember discussing this last year with Nicolas, and I mentioned
Algolia then because it's used on caddyserver website and it was quite
ok to me.

https://www.yoctoproject.org/irc/%23yocto.2020-10-05.log.html#t2020-10-05T09:08:38

Cheers,
Quentin
