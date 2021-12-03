Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9400C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 09:34:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.87])
 by mx.groups.io with SMTP id smtpd.web10.9673.1638524096376648767
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 01:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Q+Gzo1YU;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.87,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsKLzVVoY2LQLZCGCR3sNUXyFIKQhhQ+PHav8C6q46VGfPkKoFzwzs0ZPMTU4LPIJmQ532+C6CdZR+V75fwxW8T9LXBmxGPbLcNbctHiJAtoA85fOkO3rGNbVh4XrRdZAvrbFyZMtin1NgwgU9MO2wlKef2u1Q9fgRAvGCML+2FhpdogifMvR8VGt2pZDRr6ZLJQCuEDIE4wZXCebHALZy9e+aUndbhYjDP9fhI5XL6MlYwNzJbqyTf64bKBtUNqH5sQIUQTYnDL+n5zne5GnrI86Y4GwIaKUc3nU7muFz10ufFLwT25gmeg/LFYlTNSH7hATRFnsQPYGUzfpTNmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uztlCZbu0tH5Vw3Cjt5P0DSFrpAGd5DYURw74iFI+1c=;
 b=e0xxHMN+lGtF+dT1ZA1qpdGAW9J3Ti1+rda5O4+SSfjMmZNHbOjotYVPA77zi26jzeg4peRxKG1cxUdsPe9TPfazeBfL4cRH70inus3UkP2GarmBYwLCOmyyAUy3GFnooyo6fieilJx9WQBCYic0gDmUDhJM2kiMvsbsLTLRKLZbAkejhKTPcyEWnkChozF2sdPRpcEd/FjSNdpH6NM7SpfV0llkSENXCymrkrtNd6zFitPUsLpE8gk/l9CXsVQXeP7S54UwBLRV+BH8sPE3aoKul2XARVgmcT9s3PsXOZY0ziJiDFKDXqR7J17QQAi4Qq7w7/aGG4Ev4ekHZ/URBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uztlCZbu0tH5Vw3Cjt5P0DSFrpAGd5DYURw74iFI+1c=;
 b=Q+Gzo1YUbE3n8hxy0Wz1ybxswiHuxozLndh33Cd2EW1TujpKjcfeHf2HT3dsBKoekv5GtLdj0Vo/Ou7OZVuE3JuLHuEgAUkYEW1K7Ul9zk1bVRMEfW1USzNs4JKc9DS3jOKVD/JBYGBAcDSQstGmUt84Ue+5ML0crX6d8H8oSlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7106.eurprd04.prod.outlook.com
 (2603:10a6:208:191::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 09:34:54 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.016; Fri, 3 Dec 2021
 09:34:54 +0000
Date: Fri, 3 Dec 2021 10:34:52 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 stop using the "transition" branch
Message-ID: <20211203093452.sk3e6ksnwmsbnjn2@fedora>
References: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM6P194CA0077.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::18) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AM6P194CA0077.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 09:34:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11afcd92-b4c9-4a21-0711-08d9b6402994
X-MS-TrafficTypeDiagnostic: AM0PR04MB7106:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB7106ADB311BB795A00583B18C26A9@AM0PR04MB7106.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LnWXfVQ27N/8q+ej4kFvm1NpprGiv2rV+eZbbYVilJEyQnTpGkSbrGhGuGMWjutog6XQvrYTeZ2XrzbUEeB03tLtHeIjQ1D86or/9l7kcgFFh0DGPi4LDtZ0M7qEVn91u9E42KXnXuhWbT0+7ELT5aUf1KZ4Iq1H/MwYIbpm1oqtm0vquLMFh4xmyg97YLCXRMiPnOVPB9NkYLBBrKUGBhBO4zG1GvS0p0g1ZwNnNoiOrCDGpHHlMFkcgYCRrByeVNA6uJ8uatq0tFRw20u5nWD6fYV8KKDdPaHdskSq/mijksgAxIIkrbVLB0otUrrw6BcBRFcqnKWRqSrt2BIz9++ApNgFX+JQaAQhvQCwnvBmDaqHuOUuQFn9zC53K6lDHwrktdE4fEG3gFCLHluVhrUOyxIbu6z63YfUUvSNhL/BFYctAMuctuUWOjaoqsw8/hF7pDGHH15ooC1KVPWrH6DlBsE6EUxvMZIxE9e29XGeQM66KmrcszV5i2MhRmvf6lqPiqUWOM+W3gRR48NP0PnPgjXibSx6r0huC+KiKYCZxiv37tP3E/cKmLQqWei1t7IqLo9FWeIzZMQMmDV/jLYvW0dpOK/BnZ4IFG7eA/8rj4NxWBixtzu0CtpiIGkekex++eT3tK9Qigyi/wEUFWe2vGKIbsKNpnWYQ1eF6+IKkXBfOsdtshuhuRrMfgRSJKOCvOMThRZf8MyXWuDMzA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(9576002)(38100700002)(66476007)(8676002)(956004)(558084003)(66556008)(186003)(8936002)(66946007)(5660300002)(6916009)(86362001)(9686003)(1076003)(33716001)(55016003)(52116002)(2906002)(44832011)(26005)(508600001)(38350700002)(4326008)(6496006)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AkH6sZGUeiHo4TZi0P6uJkWjFoEJLmBC4y1BUlkA0QYQINzUCZH22f9sKkdH?=
 =?us-ascii?Q?ydCYsyxnnCrCjpy8CmyB07XguO8MWo7Fpx8VB4V7e+u5ym+yxnbMF/lavbnE?=
 =?us-ascii?Q?dXdkJ1pxotJGsnLWS6GrqrFpoal7Dk5QuvyjmwJduOmL/xerQkfiJGRfBah4?=
 =?us-ascii?Q?SmsmQtXTAH0N713pIC9si0OqOHxgIao6S8knpeOKD4tW056cN0gtm3nr98FT?=
 =?us-ascii?Q?5NrrfXxcHKBGDSj4NRqUd7B0AGi6G8tVxdjFwjg3TKP4L5aay3NS34LDUy9r?=
 =?us-ascii?Q?9PZI73znYOv1fs+5BG85ztJc/dbfydY6EaUaB6C/ole/n2v8zC95ZFM0EMG9?=
 =?us-ascii?Q?YRSozskoXZx53S2g0jzz2KRFLiibByK0qP2VEabczxtF6J32X3OUPIFZq/Fn?=
 =?us-ascii?Q?m1XAJoYBBOM1N15YorxwcOOxLMaU5vacqTm6EX1R2NOp4c2coaRdY0H2BQoL?=
 =?us-ascii?Q?5boKLAWFgWt03OqfQlwchYGcBPlTHNqVWDReogz0ft/2FPiK5iyrsT1bQGJs?=
 =?us-ascii?Q?jACHSHJnN0yctWpME62dqmhGfU1E/8RAvmQytxJcmRjOn9xIcprr6DYyicLm?=
 =?us-ascii?Q?LKioDGmpxEwS2Y/K9xJZ6aEZ4UqJDjJn1qbyZrzUNgjokDjPp7YlUvk3trSS?=
 =?us-ascii?Q?SWMkOiqMW/LXR0lbJmtvZOiJnuEtFq24OjYDkB7kP6Nz2oJvzJObvh/m2f3/?=
 =?us-ascii?Q?E/8T5OZLMay0s7isaJHlsI/ta4QfE8d8sGZJUAwu6NTIx8S1hYYLV4657rt8?=
 =?us-ascii?Q?bDKBmwZvoeqVVIDYajXGjmd9saiO7u4626EmkmcSJrfY+MGpulnwt6rC25B+?=
 =?us-ascii?Q?ciiNR0Wnx0N9dnGbMsW8LNnZkRgEVwqTL5D8UglkUMXhx5ibM2MrtW/ZsgEQ?=
 =?us-ascii?Q?GNek1LE6vQluevJMSFepqlyWjZx9HiiIKgm5rcyZ/nK4/aIqjWQ5sERvveFQ?=
 =?us-ascii?Q?jEtjnd8OLwoYdjA9qrIni+3tKYSX0uz6bGdY6UcJ/QASZspzuo4m9C4dUBed?=
 =?us-ascii?Q?yW/YnO+Z4Aayxb4AYTQmjOTzzFvs1EtYOgaeT2nBxsg8UeRfVWntLR6mZ2lL?=
 =?us-ascii?Q?WmHvomU3573EVxORQB42SFpm3x6XZwqwxMiYWClFsM2um/Q3t5/liwok1s2o?=
 =?us-ascii?Q?GLcj8vONMMiOZXhK7v0/1z3l3zJz6iBUYP50h152FA/yGW19CEisqY+AV/D9?=
 =?us-ascii?Q?MVY1IRrtlv+0KNcQFLCQEIhn7AWI2t48I4CyPGY6kpkGYXNTbsZF6q+HkUF3?=
 =?us-ascii?Q?3YS0DzofwRZZnTJsl/sl9TItOI48+bqEClch51oHDAn4bYmI2md3Zr0qSK9M?=
 =?us-ascii?Q?l3enPCSOrh0y4gVj4aesUNxdV2kHY6IoHQQXxYMAf+dNrqUFqr8SDHzTibLA?=
 =?us-ascii?Q?zdx5WYEm+Ys67CSQ4WZ7diIg96BGbnyKKpEDJRnJuOnLbtXn6OuidAflypfR?=
 =?us-ascii?Q?PpOr3Tk9W2uwSh9C/hmR9P/yz6qnVp5qNqIdJmGfCax+IHtil3PeT8JFw5dB?=
 =?us-ascii?Q?VC0D+wOdbkJRKuJEtBZdMQ4ffgRa0YWjALe6JlCECDnH+MoWFVDNGFWx84p7?=
 =?us-ascii?Q?XXyN9U8hloR2xQfyKXPghhdB+37xxOepXDR/mBbtVJFsRl7G/A2xKuqMvJU1?=
 =?us-ascii?Q?aR5ho1DNXCZd1vasyEi+dXML4US6Z7M7PUi+ggRbQgI3WvdDtZxzN21VLCSk?=
 =?us-ascii?Q?wMZODe030thNS0WrbQRzZgft2iAKm/6/eJyqkWuQdV+x9I1qrDA+h8BdCqlY?=
 =?us-ascii?Q?SjURw0vmWg=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 11afcd92-b4c9-4a21-0711-08d9b6402994
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:34:54.2094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GTNEB2GhlmBVI0w2MY+N6ZKHO5s9d6bww77ZKRbtrCOUPSCsC4H1jYzcavHRXCjp/Wr2Cs0E/996LszzvsYfFTNVaOhzPq5McyOmid0mlC+YzMMkKEeWZP10OgrdaUod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7106
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 09:34:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2215

On Wed, Dec 01, 2021 at 02:59:49PM +0100, Michael Opdenacker wrote:
> No longer necessary now that the transition from DocBook to Sphinx is over
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

