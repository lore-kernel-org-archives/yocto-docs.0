Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.83])
 by mx.groups.io with SMTP id smtpd.web08.34017.1628843867986926501
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=dNw+1n3g;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.83, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iqs96m6QyTj9glitwVqLmDZZ0b3S3g0gqBFw6X3WRlD4nLlq7imww1E6mdxd8665kNQHBrZVQ6XMz0o+TIsaXljyYeBARGX+E9EwTwFcyzbzYEs3iuEAbCgBT+Ls9yHUishC2xxQ5TgSMn6QyZJzth62ahVNa/vUaMzp1efCUq6JZo/7rQbgSdIIXj/GCSMCA46IHScSOLzpeP7L2dvy6meHtKmyMkwYxifqnR5sRIgxtuCJzCQ9VWxkihVgQG9n0g61lna93LJWIXe72Gww/87QpSR5cy98d8SwR/pQb6+DJ0goJBQoZb5K2fPPSKhHHsYYkQQca+62JAIi16pBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmMVfIWIOPWkwwu+/rkszWMzo2NOL0bKnxlfgG7ahYg=;
 b=SuPcVGc+2rS1PU9pgJWU0+hTqJt20J+UZo7lGS/JSZ1NScOYPw+N6fdJ56L9NyE4uP2pn3yc/PVDbkr0XUxEHgcgCpwbMlLnTzGIe0TUx+B6yEsBgPqwG24cB4t7iP/Og+NaWrJpUUJlSdrNOGiCXggZrcBWJcCiV0+yfSK/iwXbT0My8UkVqixHFfadNPRiWCz3XLrl5E5xS/zlsNeAa5EByfcfo4+9xtigYsG1TA3IX7eN91CuyvAPEQM5jMhII7HK6yzNdl7XRQOXYt84meltDc2hdr3GTR8b0TgY9Nwx0Kh3/drxq7b+BaxwDLA0C2iMYqmI8z9rhT+MuOEojA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmMVfIWIOPWkwwu+/rkszWMzo2NOL0bKnxlfgG7ahYg=;
 b=dNw+1n3gIOAhXZctXDsJ7EpL1gbjyH8TIqAYw0L3Q/t/aJFvVWyHKayX9rP21S9F5KOJwyAL+x92VBA0VeViA4ObN9FC2ursgaDm7dsKCcLqrzii4xPSh+gln2qkeSdIRSS9y2kUtqhCoqaaYMAkgZQYfMijv5wrqsaQkSReua4=
Authentication-Results: menlosystems.com; dkim=none (message not signed)
 header.d=none;menlosystems.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6514.eurprd04.prod.outlook.com
 (2603:10a6:208:171::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 13 Aug
 2021 08:37:45 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 08:37:45 +0000
Date: Fri, 13 Aug 2021 10:37:43 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Olaf Mandel <o.mandel@menlosystems.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH v2] kickstart: document which options accept units
Message-ID: <20210813083743.g4a2iax2ybxusamc@fedora>
References: <20210813080552.r4keiqjnf6sk7zky@fedora>
 <20210813083509.9228-1-o.mandel@menlosystems.com>
In-Reply-To: <20210813083509.9228-1-o.mandel@menlosystems.com>
X-ClientProxiedBy: PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::22) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend Transport; Fri, 13 Aug 2021 08:37:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9576dde-29f3-4de3-eea8-08d95e359f89
X-MS-TrafficTypeDiagnostic: AM0PR04MB6514:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB651453D02849673D1875E7C3C2FA9@AM0PR04MB6514.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zrl07ETRlPKimzksY/kqtwu3w5+QaR56KEef+ome77ML95ll20bAfG9PQe9Zf5rNlh2p81dVdXw0riKIIYHSXzXrm1bmnDz97D7LhGy2L3gXVyaeJjix5DEZbseGtyzVm9qsjW1WA9DeeBcl6+nnPfOlGi/t21eWddHOfsXAakCjLlCWClL+y1EvZ5ba31KZ1MXq9iQpKC5blV11cJl0P98K/xSVaY/GbjFXDFFs1KQ3DrOjvx+4gYIheMo9KIj5c7zHa74DqXh2Ftr1JVZUOZ/EAM46dbfoymtIEna33+asrXNfoLwVB1pdl/3QTwi5wPEJkdxrXmaYR5ah8RGWVzTsRyZnvBoOLrFalnE0eJ4PNDHRidDPGaglnoyysAEe8ebOFhGJrbx5b8FV8YQX8vSczxsr7aV0bYAfsuXkOcsjELwcaBThWka+/EVXdNEwXGciG9iIxckGPxBAd3NxtCZMrLrUDTfyN2hBpWmP28ezwTB7/zsDkMq7Zxi93Ly04hWdJuN3BWkCQk5nG3E+qVcSORSHpSOYyCVzAvwhaXSDujBXdKWQRGHi2oH+ndpmn9g7qf4VWFBII/nedTeRP0fm+bqixQFWtSOh1HkTvqMsITEceJ9ia+HYc/LgTRstvxHfdOq6MWq145XqNQASCIYIu5JSuWTD0HhEHMSXRoYXMLs79lWxUQ3chE94NtFPUPrLRH7LAg0FLB9R7o3dCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(66556008)(66476007)(55016002)(9576002)(9686003)(38350700002)(44832011)(26005)(8676002)(186003)(5660300002)(66946007)(4744005)(508600001)(38100700002)(8936002)(316002)(956004)(6496006)(52116002)(33716001)(2906002)(4326008)(1076003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NsuRpmcNRwy2xrXkix5V6dO/k05DXsYMsENO+84gLse0udhRnLQiAdsztE5F?=
 =?us-ascii?Q?8wYEY04bYEBhkinvxVNmfcXVyytTvEc0n9NFuvGqYfPsF61zcD4GAMWsZWLu?=
 =?us-ascii?Q?kc8qa6t4vF6Mp3uqZlvcfCoYr07jUAFPsY2iaMFoNWfo03l8sxsn3PTWM1ll?=
 =?us-ascii?Q?3hDPZPBpGxZyTlNNS+iF5YsAaBi7gSLeDExJ1rVkV9mEQpDCV7QjdRR4ab+W?=
 =?us-ascii?Q?TVsBDYL1ma43wCLGXWTYzdvMsyiVl4kiDGILwXCVsZLNpgXLxFrvJDxKIEFr?=
 =?us-ascii?Q?w83umgRrMMEIfCn58Veb3VWGc21lNQP5H1qo4rsxcXaIiD+WgvN/Z0g7cC+k?=
 =?us-ascii?Q?Zii4bnuYrKUTY9uTqQh5x4zHq3f0UoV/JviFcFeeHVfROESS4VWAk3k+ViO0?=
 =?us-ascii?Q?OG4EIfq8oHmFqvb99Q9ADqPEKeRnJj2plU65cUx799jI6m2KK6S4PZNkj9pv?=
 =?us-ascii?Q?FkrUEavu4UG77VjxLB8r2gnrbLr7dn/jLSoeNuFr9KFP7TZKhjwObypHDmNz?=
 =?us-ascii?Q?f7BHYbMzXQajYX5/B4zxRoGtssJpBD+alNxPk22N2EXZzSnTLYeD7dFJgzkb?=
 =?us-ascii?Q?O7nCa15YKtDWECHSOZoq0PkVP8FzJtzMSL6xjf5saDD37wFfHwhB9aIc/mjo?=
 =?us-ascii?Q?TxACMPFhzQhDJcDRxlJtFBNA1R0w9yx5CDUjFrPPbb0wNPfD2pjnUZpl9eHY?=
 =?us-ascii?Q?KwUGskA4tn8n72U6VbofO9I80LQlkpfBxljnTSed1tpb6BBG8C21DFF63pRD?=
 =?us-ascii?Q?cHW3QvG/VNb8kKch5XRxaqZn/wgeTgMfyQnEKNjDgTD9tB9P8b0v4Y2LdF0Q?=
 =?us-ascii?Q?2Yw2x/rodiM1ZOVW8Q0/VuUoKCEzWg2pk92lt2QPxRsbixVuBgFjPLZstRgH?=
 =?us-ascii?Q?fS+hjpnC8ooh2CG1UcLiB7Qk2T7INaJl+MHn54j+41DInFmZEAqwSPbbu5lz?=
 =?us-ascii?Q?AR9VoTeXQoQJhrZJaDNgRopnoYyWizDZFkxZHzvhbmKCpHmsQFuTCGZgTovP?=
 =?us-ascii?Q?5xsxjmW4wCSNShp1Jqy3APIwXOL6V3Zughl1ozHSQaw03q4GrxjVPJOWsaDz?=
 =?us-ascii?Q?TikZ2Sp0XzUVoDMqqVgbl5qHUj4+ElOCuZPRPgxObWZEmkRkqBEY2JxzUg7d?=
 =?us-ascii?Q?PHqTisgWbnz94LJMgXGYSIChxIKJ6zg8Q7NGOXRlygCLvfcyHHknYzL+6zL2?=
 =?us-ascii?Q?dUnxUd3OFak4O4P5dYBL5+b07OKWU+PPQXalS3cx46NJ70aud43I/r5ulUrT?=
 =?us-ascii?Q?1oM6LjsEkQuX51GPfl0c8Za049s0dgawi+yboRY7aDgvPsv0KrzmdpoBvgxZ?=
 =?us-ascii?Q?hV/yCb5QSCZtvWIuqJqJEYX3?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9576dde-29f3-4de3-eea8-08d95e359f89
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 08:37:45.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHUoJfkzjeaC8nnyr7DUsQGWRGrOVuDeYvummPNisR6NxuEs093qpR4ypatM1v+Ba5vqc2kOKqMaBoVq0dyIOCezvhf6gr7v/lhBPxcZG+SRYa2acj6neQLzgHq5ErE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6514
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Olaf,

On Fri, Aug 13, 2021 at 08:35:09AM +0000, Olaf Mandel wrote:
> Document which units are accepted as parameters for the four options
> that accept units. Also be pedantic about using binary instead of
> decimal prefixes so readers don't have to wonder.
> 
> Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
> CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
