Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web12.6298.1631706011292207313
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 04:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=owFnT4cd;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.82, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXZa4KbTxI6Ue9EnIahY9mdMCszUWVGDYUQ3Fr1onRWYJksdpXqVu8iFiTGpSoUaRZLu6pu6RaUSFOcxe9nJ+zXVLc/1MmhJF31BhnEXrxXAC6Z3qUyy48MZbB4JCDMGaTfnI1biFud59aKf9x/jt6C4qMb8jIYGQqc/+H+ogW8Mua2YFQ2T5e0j4mDMvHbIiRJxS5PGP8KcnsokwpcABvfS8l6aIfCiNUKH8k6HEIWcrwG0V/xBmOrMocdi/fmdw9W5uUwWEgV85S18Tb4rMofaq/hQlbT5FrhbtJ+YRlEHDVTUXv1GTvCOJtvg8dj9wAgLJpZ1gIs/7vTfoQLVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4ds8H9DjjeJyucPcQB6mU+NSNixg4XMSORt3fmd8cKU=;
 b=Ry/Of8rqJH+Qe00Sy3nmE9uAp+EoXGrDo8pH4+R+i5AQtAzJxGjHJq2tvLFnCn1WxBTX3RtDTrWLlEogWM4Gs+sDu1lM0CzPJH6D6CKfb78wwU5qNy0uAEv+saK8aBqtmofrus539XkgmPJLBYJLEePnr1vf7GhkpWE/FO8YHxcAIYAywzatJH9l6YqWFw0VNCx5eIFXBek8cIGBQz4kP2WT0DGPRd87tyZlffnilV+E0F4NQrZ3RD9hGkCuAA7XJrr4mgNOIIqvH9UiREEceBdCyWmzUHR3P6eWA+QKXQa51kYksvV3ThXLDD9DzPmHikEdz65+fDfhsGtNB4xZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ds8H9DjjeJyucPcQB6mU+NSNixg4XMSORt3fmd8cKU=;
 b=owFnT4cdXmp/h0grpBZhUMNRhJZhzsoHiD6LaJXGA+dhGT0KSn8qW1dlkkmb1aJsLjS4+YKzG0SJUj8U07eONtcdCotaQByITZwYozvjgu/L0UXGcwarCh6qSjj/6jqQfrSPTCaBkPOuLq/7DKDLpczYSDFLAyHwsuANlRmDup4=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 11:40:08 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 11:40:08 +0000
Date: Wed, 15 Sep 2021 13:40:06 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/4] ref-manual: remove checkpkg task
Message-ID: <20210915114006.exqidxs3zykdphp2@fedora>
References: <20210915101219.2198566-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210915101219.2198566-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: PR0P264CA0250.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::22)
 To AM0PR0402MB3348.eurprd04.prod.outlook.com (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0250.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 11:40:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aec0538-44bb-41e4-36e6-08d9783d91c0
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB7044603AA67522F96D7E475DC2DB9@AM0PR04MB7044.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Gx808uezsIIRIAw7C+BT8sfX/sEE8cKMQBRnZ65PWb3fGit9tjLOhjWtY6gzZMVFv3Wu12q7HSkg16F3QxpQzXeomtE4vQOEk0fVxd8EVtA3iDU2ULepVSBTwz7mo6L3dj2dssUjNgu9srNovdMqmn9uyLFNUYxfFdBt5MVGsvs/mrLxQnaF5+bvUfKV592RTwrTlIch73uByQzOxedp0HdDKESfanc+PDVfiyqy95pNwvC27y6hY1MxQDnrILm5cuKJUGmntZ9Q7Qc0b51ptEoL4KzSa3WJH+saABWqae9jutKy4KZFde0x+MVis/rP7Oeqzh6EJx1HyUGochKydsQ9FGWWCpOhi3eUS69v+CwaAmrFdQA0d//Q5I9J6T8zpkmv/SlNtSPCH6aiPrApj9TTTXd5cFmkscIyJv0WX43tuICPXq4gdgfkzenTqIzmGbkoPwxf9NUvgIkjVSiIs1joanbYWiz4R9UU24wZKTuqV3w3tjPgpVG3EDQPWXK8iTVKzRl0JvC393T8oB+yOxTn6vnxY86s2pItPmGd9JnOIFQAM7QFbPxNxoTwm5Tr0zZvJl3NzI+nyihu3YTea9My3Mryaw/ZM68VIMmmZFhtSRsNdqA4bwkCCDVfo1q7aOvcXAoqaXt0q7ZSXej88ftsJrE81w2UTqtVseyaM1+Gm5nNIZNzHug/aB/QVE8dE3/ck6ACscHBNSkCks+bQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(346002)(376002)(396003)(366004)(6496006)(8676002)(9686003)(38350700002)(38100700002)(478600001)(52116002)(55016002)(44832011)(6916009)(316002)(1076003)(86362001)(8936002)(9576002)(956004)(83380400001)(33716001)(4326008)(66946007)(66476007)(66556008)(26005)(186003)(5660300002)(2906002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Keq+cCDwP2+f6Ei1fB/h/GoxNgQkkUWdaCVSYJaFaO/++HjqdxGGH8QtxjR4?=
 =?us-ascii?Q?gVmG/ad/YKIEyrhcnEeFBiYCmbf8zb5iLm5hHc9CtoHc7XBtNdsGn+Qy7xLX?=
 =?us-ascii?Q?0LuVZdwkAp4VFYFCnCfBBHjZGDPh3DCD3HIWL4XgZ4Uk1bK++/pFGtomEGn+?=
 =?us-ascii?Q?Fr0KD+US1KwV4tYwMlxpCTJeumgmokwFByL1PmSvKWq3HxsF1bmcR++fcNbM?=
 =?us-ascii?Q?SvCO0HLI/dmJ0iX62la973oUVkD0+pMQOJzwvAKj5E8qYP77sM67o/c5HYjO?=
 =?us-ascii?Q?zztFJEMp0xTGR8Eck+cMY0wDRaQPxmo/wuGLKPCJcPY8V7gVyPlFAYkDoT53?=
 =?us-ascii?Q?m5GidMUjInMJ/pC8CIKOr1b2yvT0gzEz/WFweIRkNpYbPChzl/M0vc6VCq2M?=
 =?us-ascii?Q?ehlOCK3rbKPAthwVLWbb7o8Ea9iGpkGYKxxrSaHOlPijdkq8zoeFsIz+O671?=
 =?us-ascii?Q?PRtDmQ1BFMeP1jF+DbdSZojttnURtn15nTCJYqkScs4cPmHKAzKDBcJYN6/D?=
 =?us-ascii?Q?LjT57xbW0bA6GZpQJUx+sbMnp9haraudZkixwCf+OKtzokWKn92+ZLiRseQR?=
 =?us-ascii?Q?X8AlCjgXXwmpYaosNMF1RVtXRPsZzKZ4Qudd9PjMq9ZBsTkSnlkwCTO/Hnyf?=
 =?us-ascii?Q?X0pLRHQUZ0QdCPh77AU/DFkK6hsB0MUv0+2PXheSp9dOnZII3l63ajahpRkH?=
 =?us-ascii?Q?E4c5l4UnD6EwLKGS+89lwrtIhp1NIjySYWEHssTrWOQM4YvYrCQ/AID1jq6D?=
 =?us-ascii?Q?fPH96MjvIs7zGrTPk4Ebt6SdNVw+XBCfIVWfiN+PvijrS8OQ2N3rYy24mkGh?=
 =?us-ascii?Q?wt89HgxiCBIPhlNdCrtCA0p7spIHJ5cJpy0hn3N1KxOEYPfFkbmXJ46H+bEV?=
 =?us-ascii?Q?E2rEwZ2Wz+4P6p4ieiPi1/c8RJ7oBj0NcE2FUj0e37UZBaeNWkw8Yi5LOXw7?=
 =?us-ascii?Q?sso8/Qo0aSqcCCoJcUagPsXleMpGfvSBEAaUNqTWb3FogY5e4PcrgLp9F2Z5?=
 =?us-ascii?Q?FuTi7liJP/JbMJjujZYmhH3GGbjUKkqlVPqGb1EqnEUcXDa9tFXjv1GfjYJF?=
 =?us-ascii?Q?In3zXJ/+QD3zz5roTIWpQuG7196tw7oxpfOPJ5b5JXNfh6Frk1irZyyceUhC?=
 =?us-ascii?Q?7pb4BU378VbxVcIWe8kxe5DpSE8XIgXh5BHGbuQIWZerSu/6fUONySgrCv09?=
 =?us-ascii?Q?keiZ5DPdT18wTkrZBRvFWjQmGbknbK9m0qJmVvttXhhq6hDu81TDjjbnvHB5?=
 =?us-ascii?Q?1xoLpTFYEZOxJRqT1PX5Edbb3xWCleGQtb5D3cRCepcHVnp3wDrac/QAmLKN?=
 =?us-ascii?Q?FnwKw4DH9xB9t5JjrDRqYzT0?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aec0538-44bb-41e4-36e6-08d9783d91c0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 11:40:08.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xI5UoZDxqqIyZoM9VSm8aUnR+s/BFSgEbX+f9S1lzUJptD543Gjs0UyM2WtxVBd2/3nFXtKktWAZa9qltIpe7oOOSbrvJUS2NY/6/unTFhwqWFRGWj5AUw4l0XtOW448
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7044
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Wed, Sep 15, 2021 at 12:12:16PM +0200, Michael Opdenacker wrote:
> It doesn't exist any more and its functionality is now taken care
> of by "devtool check-upgrade-status"
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
