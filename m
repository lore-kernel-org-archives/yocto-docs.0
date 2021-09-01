Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.69])
 by mx.groups.io with SMTP id smtpd.web10.5962.1630492428513142439
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 03:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=EJyBmD4M;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.69, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iF6XpnaDrVFQjckBNFn5kBEcXz+rHnZlxdSnNGsnUDaS3QWuwyHS7fwBYPN6OCQhwyDU97bsZ9Uwqh9KiEqLA+KCtI5OO3yJHbnCsBhRE8rKnNfT8DmgSPoC98W9u++qYr1eZQkICP+g6WRYwtqX5JMNnoRusstlxxW+npODQpytnpffIRPeGF4jxg5mfEemGHpSGqKiGuT88B0OgHiVxrdBUl9OCixKkPFigZHHEywH67Nj6PQC563yHMuzD8H6YmXIuu6ZkrFWPEDR0K2CetuLF9eP0jMLLVAcEcUjWHW14zlah6AKvNPGt3uMxG1AidezM3tUKzRMduIgLAkiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G32QERJUml0sO4MMV9QEoXLnHeJqyGZkUehltZpYuyw=;
 b=HMoPC5mruE0qhJVrYXzXdbyMRWRrlqq9c9VnKNyvsrxJ9zgzK9OFU9i0XKKvkfN3sSAJ5MH/tdJ0+AR9yCXlbD0NCyYE2tSvRgVa5hUdq3EfMd605OvcFiFzDzOOZRCJtnPDnYfg+WIlF9MnxwJXaeWIVIqiefOwUFWQFGmXL6ghVeFqKKR1q9PiHVzruli5j/U/UUxHAnwnIUuSzzc5AoGTjl5uhIUVqviqF2CGhA4eBHdrKJLBPqFwPi+q6Ef//qGhVJraoqPKgWwUHD4W0S0ca5RcsaYl7x12NyVVr3P526HoK6l1gtxxm6a7zKifxZTn96A/GRIJBpKMWD2SHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G32QERJUml0sO4MMV9QEoXLnHeJqyGZkUehltZpYuyw=;
 b=EJyBmD4M/raGq7Xg69HVOeOq619DetfEyURDXVSjxC9BnowGG4LZFM01Y//sIDb22TAUMIOIGHKoBp8rg5ba4iZ1pndizRIQsDjuniJBEy0MeUCZH9YuI5g1zJ7bD0nIzRvp9Hl0trlCRRZTN0TGJbt8qGzauLC6h2sQezfmPP0=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3682.eurprd04.prod.outlook.com
 (2603:10a6:208:9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Wed, 1 Sep
 2021 10:33:44 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 10:33:44 +0000
Date: Wed, 1 Sep 2021 12:33:42 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "Both of these options are not seen in the majority of recipes."?
Message-ID: <20210901103342.2kjiifb72dhksocu@fedora>
References: <fd8e2f61-5a11-9c59-d40-c37c4e84693f@crashcourse.ca>
In-Reply-To: <fd8e2f61-5a11-9c59-d40-c37c4e84693f@crashcourse.ca>
X-ClientProxiedBy: PR3P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::27) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR3P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 10:33:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b913dda5-3e6d-4dd6-d1f5-08d96d33f94b
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3682:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB3682933C468B3FF943A9F450C2CD9@AM0PR0402MB3682.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gokcqFqBdB+BPn9rNkiw14ABVBAvabdh55+OM7h+OuaQHjs94gsV5elHv+0ur/ZsF1uKK/C5F0+xOeH54WUnVEMosKv5PF3KzU0Pr5fHaN9w+NUNaNFQwpHNS+Ja7gvIkd6p35g9nvPy7FdzVjKutCoisKXJ/AohEvVU5u7LOpjBLJj4/0T549Ft6bGPq4qsWVDzxPdbW5Iky8QCDW4wc96gIh1/2cIq0kcp2PAmZ28sc4MbwarQVJRNhVWt3PoHD/wtNlaIaXp5n1oG8Do7jb4ktFQFjedWaJhO9q0NpZw3fOQlXYPAZAF6eLs9zpLBNvZzJdjdJx9fT4MHG6STHo3+NmGK6LyavdU8NxjyZpWx6tp1pXguWrtpgNwWcHCx7hC2hSP79D8+6gYdUwZc3haUTzZNMnZC7PavpHYXbdRYCg6C0Ny9PCdsNJ8GuBC9RQcDpc7wpaa1HnM0NJ8r16FzPhoqpBZPnvIuOjxjh/LOrCRTYX6VvEcBW+sGqX0aWuUV/gFGzkTjv9LdL8yP7eO0TGzaj75CdkHVTz8+yliXJKFsKyTL1JaAWrmindhkhfJs3/O8Bm/uk88fI58zOsVARoROp+CZlEMbdbUI3nvMNmB+vimZa0kk+9cxPaNwbp7ez7tq+jYQqtXi68e1hbWJjpu966J8P63T8+5bFzhbdwUcgDHr+Jtlo1fd9hb0RQgBMUPgsuqiRpjlgTByeDnigPwNzobgRG7rks9NOfvlDsZl3mUohrhguDnzD4fBwntAyftgqZBeQbbGxTxRPQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(6916009)(26005)(186003)(5660300002)(55016002)(44832011)(956004)(478600001)(4326008)(8936002)(9576002)(316002)(8676002)(66946007)(2906002)(6496006)(38350700002)(9686003)(966005)(52116002)(33716001)(66476007)(66556008)(86362001)(1076003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SB3ek+FP4a1+FtP8s3+WPkWIP2RhGonUUNU57iAxoLpLuH/6yCiu3XowOIc3?=
 =?us-ascii?Q?D/mFG4PIodbpxMBFytdHFrFAFmIzzFemQnjZuCeLq45SQNh0UAB3D57Pu0iE?=
 =?us-ascii?Q?d9Ddn85wclmkkw4lgd6LbK9JfVu5mLqQSbP03hsakyBlHVZ1ftcoAx7f6e2w?=
 =?us-ascii?Q?dg8gmgtLzUGBnJ3WbWCXMZKnJPfZpileSED28h8Dqh7zHLrdqwEprcr4BWAS?=
 =?us-ascii?Q?eDEL9JvrMPYF2vSYeoquXKuMQafNYmVHOOnNl9vqbSWUEHSJs5642BcxHTvc?=
 =?us-ascii?Q?VeZgyTVSkjKk+veAcRAovvK+HIamp1Hf/V3jaRWFnZn7rQASlMzNHxRZ6xQX?=
 =?us-ascii?Q?nj3CjSEKzeTqy4ft81Jvte37EcgvezOMJzQwxZuoZOxnxvojC4XyxCZoQ0R0?=
 =?us-ascii?Q?B7Wnj2j8yPcm1rYH8n0nrlfU+fhy7f1/IoozkMvFNFfwJco3QP3iY5k4WQdf?=
 =?us-ascii?Q?A2MAdX+jSWOwl4pSsuZAXNgD2+oXLRz/moPVMpu19cRzjTWEjdVAPJYkC8Gm?=
 =?us-ascii?Q?X7mOZM3MMHEDePqraDiwyfh+vQuM2x/HmZgsGoNw1S+EI7EkctmZDfXa9CUa?=
 =?us-ascii?Q?oJbde/KPVc22gr+ruFHshIrA8DgCSjNK54jqa9U0I0ThsXbPsO33K9rpXhvC?=
 =?us-ascii?Q?7GDBjv+o40F6YEYBeBQEGjUoJOvmCupIagiow6MyOSlfZsyoar/K9QXDMtHC?=
 =?us-ascii?Q?M76VrbjcG973IrEfpu8aM2GBoiovzLgrcsjhRY4JfnEV5s5pc2ZTlEJ2lvvs?=
 =?us-ascii?Q?Eu40NDIauPQ9MSPZ9GpJLF/7Xdi0goZENEfcung1Pgqc9ypDCqzKVh1/Ajih?=
 =?us-ascii?Q?0BdZ/Nd3ntz/do3gPWzkRyFsfB41RR/OOoiU2upUoy3kMoeQrF7IdwEtjWNg?=
 =?us-ascii?Q?erVz4H7VFp3gAHFc0/xZ69E9OXjIfIAoqiH4+NAev850balMrAyfMC1xDc1z?=
 =?us-ascii?Q?G0VnCcQKqU+2i0PVX9Ied+623dAK8EGYbhmjfwk0O4qVQpJaRMsP0y0ymGPc?=
 =?us-ascii?Q?YXdHd6NR1C3cc3QoOnVLMq1IjDMugV5ZsX8sZyIrV8jNTLhtUjmWFNRWRXZ3?=
 =?us-ascii?Q?0EgISHRb5ruDdK5gXskudSrBU+QpimK6b8WdiNcJHYZ7H31nOi4F9SvX+W1D?=
 =?us-ascii?Q?iz04r/7V6W5CgnL1mzGtLKC9bTDEBs7b3iGuYbUt8cqDFH6eWtvWC+ID9Umh?=
 =?us-ascii?Q?OpncwAeYBX7BWwWICDRXkFYTF5L40m/tVTNpgpJQeyUtSpGTfvd2NbrK7AyO?=
 =?us-ascii?Q?xqbcZ2vtD3G5PpInxuAx6KDew1M26LKduY00L5erA7tGFijy9Qe5LbB930iJ?=
 =?us-ascii?Q?A3jk1MC8iIvzlm7Gg2v4BLc0?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b913dda5-3e6d-4dd6-d1f5-08d96d33f94b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:33:44.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Q3K40gxhZXoHu6TzONozKNT9z0sQ589y6o+DEH1dOyTj7KrGmhXvRQs7nFkl3n2MC2egiT0PfQn2fDJ/OUBh/fh6tlVJPMT6SjJT86mqg987Bb4Sf6vZjVKDBl0+e+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3682
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Mon, Aug 30, 2021 at 06:24:46AM -0400, Robert P. J. Day wrote:
> 
>   in section:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_dev-2Dmanual_common-2Dtasks.html-23recipe-2Dsyntax&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=2-fp92PkZ79RQtAMHJ_6KFfOekya_lBj4WDAt2NBqio&s=3n-EBs-PNMR-IUWCI9oCgH-qB3aTFSSsd8dFh7evjnM&e= 
> 
> in Functions section:
> 
> "It is also possible to implement new functions that are called
> between existing tasks as long as the new functions are not replacing
> or complementing the default functions. You can implement functions in
> Python instead of shell. Both of these options are not seen in the
> majority of recipes."
> 
>   that last sentence seems ... backwards? how should one read it?
> 

My guess:

"""
It is also possible to implement new functions that are called
between existing tasks as long as the new functions are not replacing
or complementing the default functions. This is not used in the majority
of recipes.

You can implement functions in Python instead of shell.
"""

Cheers,
Quentin
