Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.40])
 by mx.groups.io with SMTP id smtpd.web11.7117.1628072961780402521
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 03:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=r8Tac6MA;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.40, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnxa6TTgyvjevYsAFXBlZmvyM/WinbKwoN9tju0IxpIUfGRhfGPJAMp2c5PMwRh0wJ/U/MT8LRH1h3jAwwDxGWmMRaVMQ+jmX4pYyAawfHURDjmFPGsoXhPplYZ9b3OYKYJ+XM7s57feRp1IYLziE2DNziLZYyAEZykVLNJpbfdDT75kqxWtdTDZAe8ZIFo4SVPSkwXLwc22kAc3oWdbKr9QgqR1lIQdvvKrSKO22vqeDu7j5WTJ0s1qHLSSuSNsi9LmBaUXdfIeNqYzpfQD4mRgeQNHH1gYdmtk1ogt/OvYwwJfLfy/meEd/2oUpjLo4onU8jSemFmCG3iYgq9KWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fCymBuPImKf2S23kG36L9jnvnPiE4iG4+fD/C3xwpU=;
 b=nUsmWawIeNcJ/OTcthMO3ouB2lEW2Bkwb+V6HVtSx4e5Antx5jrkWWjZbxpIUyHrsAyRINnu/59+N5RyLtTuKKWrWnXJHYz4pg2rP3ZENuVTdCPuYieeaf8QnEBU/bhPTx/kIIkOX8HEjTTxEku3Y0t9GVFSGlFtg1gTOtsjzvPzU64+baxv2N/2sXzWcZVpdz5srvGO/UnuGgZhsLJlpQR2lpLcfGtFIdWeyLT30R0lEBqb0bQYfqd/iwa2AzLpQsJa48NjGfhlXwv69HrpPNimTjdQFHMnvzUAFnNKeLI0TUU+p/FYIOt5xC7E2I2pXdlu2conNEiX1gfL7uWnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fCymBuPImKf2S23kG36L9jnvnPiE4iG4+fD/C3xwpU=;
 b=r8Tac6MAyyTUZy+n2Z76dha2An6tRXt6d6viPxOpGo938duDblnSWzdV6Otrw11fb5um908YdtACLn4lBahKNNCZSyon3Kn/Z13DjKT6HpDbadPz3vclcDof2s7JlMAzDHM32mkvBhxPW1bNQZfN5Cpwul9+3Oa5uvwgZqZARTw=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 10:29:18 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4394.016; Wed, 4 Aug 2021
 10:29:18 +0000
Date: Wed, 4 Aug 2021 12:29:16 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] migration-3.4: Add extra notes to override sytnax changes
Message-ID: <20210804102916.2k4qgvnyxz326fme@fedora>
References: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
 <20210804094714.3500323-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210804094714.3500323-2-richard.purdie@linuxfoundation.org>
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.12 via Frontend Transport; Wed, 4 Aug 2021 10:29:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5dddf61-4568-4321-c077-08d95732b76f
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB70440333DEE17460929F4661C2F19@AM0PR04MB7044.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eu5MV5BGimmBX7Jj9OaFUJHBBgMgEar2ajhPnCGzG5bzZefkzs8+cRbMAcx2Ghzq/Hiu6cJ7sIj+aYwSJPvINHwhDDa0IgaJabIiRTNGmTYV0xh4k6O1XleO1xv3q/1Rlpl3lyZFla+46KU/BH03GMx2RfFDl+vXXumaEPBb4xgwGD+Z6rD8jl1qrXVvU1ZPU3HeViBC3MkGM8mPjlsCQo4jRzGExJ7LELfpoXA/Z9Ig7mS6y2VkLtrr39md15tcQG9zs0zn+o3VrEo0g7cff3bmPzERLIwXaTlJtf57cOwl+AA1bj8lWqKiA966oDj/ZjtiBZw6lvyu6oyZQQKqE6k2mwLjXQOeEmO4aPEnUAIT3sS7EELXg/Vru4jSNLkriao9tf6He/aVSxsgWtpCsVOJFt1vx1hsr7dVKW5yVFpDmlQW/oLQvM10Fe17ODDIJH0/8SIl4avGF3BlxYLeauWrDW3fZe6p1opz8TSUENQM+DbmnfSDharArYJtse85cqHmibMXm3zgzJbJoO5AS3eJ1hpSfrRgi5QwAycWprbUjPCVxggqh6KnpI3OyJYDiLhS1P8FB5BG3Tpwx8SjC1ac8brsodwE7fKvHjo4eMypHNWRU8cdIuwddqBK0Tdr6PLYMnq3k2pg+A/AmzEsotSU8dHvQFIY5by5UXvq+EHAQ9UoDvCjUMhfhBwcPApjmAkyN8sHWeBQh7pnOZWE+lRhdhwsu7gHyIYJ6cTYlEs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(39840400004)(346002)(376002)(5660300002)(44832011)(1076003)(38350700002)(55016002)(9686003)(38100700002)(8936002)(956004)(4326008)(6496006)(33716001)(66476007)(83380400001)(6916009)(9576002)(2906002)(66946007)(52116002)(8676002)(86362001)(66556008)(26005)(316002)(186003)(478600001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4mrMNid3GmJUnn4rkAu5iRWsSN7EWapc1LsRvmcBvOw3uFS4AYi4YInA9KVN?=
 =?us-ascii?Q?DztKW+UCv31I+ucTerqFtIcQj+El7zasHYqyCxPKsuriqNiWsod169idwgwZ?=
 =?us-ascii?Q?lPYjt6+vRHtNsiTc7+IT4ERuc2eQ6mHg+qL8HH5cWT9Ld/ovdbt7nPNDLnjs?=
 =?us-ascii?Q?1vaOb4oHvMGkmOkRQN++KpPrBsN+6s+e9122gNNmo7wyse/8D2CMJAojCYnE?=
 =?us-ascii?Q?c89nw3qng0nwJ4iNaUWWNacpIS2RJFiuGpQnl/EAg0UUc0I0ooUAAAzxIuxl?=
 =?us-ascii?Q?eMHbVnR6NXWPqCK60nc2SNL46csKuldarKVttM8WX2Swt7FGwuwdaCljEZkT?=
 =?us-ascii?Q?lmyPWuRgcFcmVYP06VjNQ7X4+tMuGpGGT0y+H6JpqYlDdjot7+dQ6tETo5KP?=
 =?us-ascii?Q?9QlcvxqlyxmkLnUgS6sEQaAwii/VMUZf4oGpfMYvT2GX4Zuz5WZgdrfcq58V?=
 =?us-ascii?Q?sjQbbwXqMj4rAOk1eDcDbq3QAR/JQ7Cxvz6p3QzlsZ5DMZF0k7XEG2KWMbiJ?=
 =?us-ascii?Q?8dzTkv0N3McIV+arPpdFarOB8D0Zj2YEeelMq5mmqgQe6XpRV2TERHisbcZO?=
 =?us-ascii?Q?IciPSrvgaf+k0kTcs0jeKbUyFD8/q8b2LPIjRgricr/tTlxTyZBXsvmXzGJQ?=
 =?us-ascii?Q?jAI66noNbvSsniCaK4QnNyf7NrbBw2vZH93e9pa8MygXJi4R1ETwLHH/xQ2J?=
 =?us-ascii?Q?YEyB5UNpdnoQe9FD5l1rNIRtG54Y2l3Se7aH6piFNQdEMqO8Qzfvm4yiWru1?=
 =?us-ascii?Q?Vd4pESXwMlYIezZFFqP8ZEdOxzxSbeJGlGWtbkq5tLQsxc1UMZaCWxL74YaO?=
 =?us-ascii?Q?u7UNSNiLliQ99/UUBZel1DDODDRLFvDpj8UeW76wM711OwdWOIB6fNdTtQW5?=
 =?us-ascii?Q?8KPNeUdxMSfGBCKWtsevhHYjP+2zyzSsYAewBo01BUeL4YAVkxS+o/PxGjVc?=
 =?us-ascii?Q?LssChUE5pYoHHXFd5AKjvqTN2Tsi6h3MnTHtTdvscOhWVQodeIIxagARW/8Z?=
 =?us-ascii?Q?Y3A0MXuzbHMPn7oGNd87SMC9XMv5fDnMR5Aw+/aYbCOuD5Rpm4vGQBJCQWni?=
 =?us-ascii?Q?ouTYeUbRgY8fyZrxkn3p8M2X0uUlT5Rsn1/g848m3wGT22acEPSmsL724Rji?=
 =?us-ascii?Q?Goqkvm4CrU9BnrCWcO96IJ5Cat+yJ0iiHhNjlOcuiGWYWQ+OoVfC6VSoYfg9?=
 =?us-ascii?Q?PM4Vz20/7hvwQ48s15uWmRkxRZXgeW7bf+vlhmBe1X86c3muNC8bLFxQp4JH?=
 =?us-ascii?Q?njS1joVBsHsxCcDkzeWS5AHowWKGdshj9dY9v8yuIMwUy87S7srf4JdgDnsF?=
 =?us-ascii?Q?hydX/VTES9FeRa2cM1nsdvxz?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5dddf61-4568-4321-c077-08d95732b76f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 10:29:18.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gq1yxz09hxHljY5ass1y0qZu0FNTQkG4+zyGj3G9a6fn/mUC7ISrHeLdeuat3RhcmnGL+x/wzmhL1Si8RVDBPYZtJ8QQ+N5XMeKEPBzPVGzUb0aHc9KVNvRj2nGIftg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7044
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Wed, Aug 04, 2021 at 10:47:14AM +0100, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/migration-guides/migration-3.4.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
> index 6fa1ab20c..d42ee8851 100644
> --- a/documentation/migration-guides/migration-3.4.rst
> +++ b/documentation/migration-guides/migration-3.4.rst
> @@ -56,6 +56,12 @@ context being specific tasks in that case. Tune overrides are another special
>  case where some code does use them as overrides but some does not. We plan to try
>  and make the tune code use overrides more consistently in the future.
>  
> +There are some variables which do not use override syntax which include the
> +suffix to variables in layer.conf files such as BBFILE_PATTERN, :term:`SRCREV`_xxx

s/BBFILE_PATTERN/:term:`BBFILE_PATTERN`/

Styling might be better with :term:`SRCREV```_xxx`` (if that works,
might need a "\ " before or something to separate the tick quotes?)?
Maybe worth a try.

It's the first time I see this SRCREV_xxx variable. It does not seem to
be documented except in bitbake/lib/bb/fetch2/git.py. I think we should
document this.

I'm failing to see exactly what the usecase depicted in the
"documentation" in git.py is for, but I imagine a plausible scenario
could be the following?

SRC_URI = " \
	   git://some-git-repo;name=foo \
	   git://some-other-git-repo;name=bar \
	   "

SRCREV_foo = "abcdef1234567890"
SRCREV_bar = "1234567890abcdef"

> +where xxx is a name from :term:`SRC_URI` and PREFERRED_VERSION_xxx. In particular,

s/xxx/``xxx``/ ?

s/PREFERRED_VERSION_xxx/:term:`PREFERRED_VERSION`_xxx/ (if style
suggestion above is chosen, to be applied to this too).

> +layer.conf suffixes may be the same as a :term:`DISTRO` override causing some

s/layer.conf/``layer.conf``/

> +confusion. We do plan to try and improve consistency as these issues are identified.
> +

Is there going to be backwards compatibility issues when supporting e.g.
PREFERRED_VERSION_xxx to PREFERRED_VERSION:xxx?

We can't really afford to break compatibility every time we "fix" those,
is there any plan for this already?

I also think we should keep in mind to update this section every time we
encounter one of those "inconsistencies"?

Thanks,
Quentin
