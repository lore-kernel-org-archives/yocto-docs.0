Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11027C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 11:19:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.95])
 by mx.groups.io with SMTP id smtpd.web10.95945.1709551196213160848
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 03:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=ilVuEixC;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.95, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ38pnfvTYCEHxWPGgspOQMvVhsLHvFNE5x/Ea/wEvRCdK31xWpisD5iTEdQEs5zrPRDLy7VzuptXsmWS+qeqahxjZ9XbaoJkD/x+Q5OaFfkckfeeHPvippcx/NADR3DYrJZ4vYI32MtxBRJRcKkg6O5LIs6HSU5zUkZ0/AvSRaBScJPzk/mfJEsRF+IP0L5Srhtthe5modZWFxyHzCezkcMIlRifUco7Qg53LkMbadVV/OIi3/Qlf+dwweHUvGZdWB39Gt1y/xqGDoUkSjiuWoCK2zK4qooa/sjZcFPz0Wgk9NnNBWVHOPfUF2NyjIogxZJpWf3zeu6q2XLtV2EpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp5z5H1fQ/MW40fGWSUJPpr2QmnofODCXQFqmtqlauo=;
 b=hh2IV8ndSfNpSbcUVajDD1Vb43yjShvPZGAxkirTRN5Xj/DGk5eVxrFwpg99p5Jik1Qv+cRcdBEk8sg/VDxuMFYlC0/F6fywjGsp4ZLGzS9SS7Aweei2jc8M7hz6y84QMs3yyYQ1u5OQ1S2Du4/FJ1NVoQhazFD66bAV2l2Il7SOCr4BYkvttJZnam/kM+VR/s2GLTPpWe/xI8Z0hFf0H33GjzhCTKFmCi4JEdYEEIP/f/LsuqRi6NEBqof+uuAY5RAxkxkPfvJdmyeGmbXDQneJQx3Y8VDBLTabhKoE2dkRMPZRuC4S4qCgC073J09uhCH8nRpdm5ahuYmvTQ4CWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp5z5H1fQ/MW40fGWSUJPpr2QmnofODCXQFqmtqlauo=;
 b=ilVuEixCKtbc3gK4Bi1GWDbpPym9muHMlfo5xtrVXJjJMpRr37z+EJ2zOtLNXnwnMTRD0m0ocFcYGKSKWBSgiW4H1LivO79L8815hytTkq7con4FtvUvmIapY0sOxFw7sd+c85dYI1yiP32BukzaXTju0Nq8QooHgMEktbMq1+R8JNpG/U4Sza6qyvAktLfIucFAs2dzhGxhInF+BIzqI6OZMgqLXJ5DafmRn/0IwRdZY7T/zlT/ICoA6+UkMCJC0d8hSudoTw6dI2i7+cYIyn7YLgcIwSHTJBXJHXgFDSVnenZ/UD2LY9MUrque+JvcUrYW/6WRdDrzWCYSN0SQsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DUZPR04MB10037.eurprd04.prod.outlook.com (2603:10a6:10:4d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 11:19:52 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda%5]) with mapi id 15.20.7339.033; Mon, 4 Mar 2024
 11:19:52 +0000
Message-ID: <960a8905-4c6d-47e2-b1c6-ad337b628e71@theobroma-systems.com>
Date: Mon, 4 Mar 2024 12:19:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: packages: clarify shared PR service
 constraint
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20240221211648.104003-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240221211648.104003-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZRAP278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DUZPR04MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c668e79-7f57-4d1b-ac7f-08dc3c3d02de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lm+Hm03XiJmUht+e5qs/gnysqPGOGd99s9qs/aLAbzI2B8OAyelacqCMlV5O29h78v9FEWLUtTfHrUE3EDBzqGyQN8/qtPrf8CJ6IG/+N5NVfXqeQdyDm+BySOb7R+vWxbxsOlz45Yi1hvGMyUKLLgyWSGg8qTqCHTTcxZHH1oHxjBCOiBMd4b5wStG5MCPavaNNFcE9+EshAUtHFukQfVTzDbMSCz1u+ytvXY2icvrqJXbQMSSoxCeIotF8uaViCzBugtn0aFWF7XkxYLuoQmLUGdThodHBQu5AuwWLZvX7gfhgaFOaGUW3shpjQ56DMkMCRYLtYT+LbgvTnRuOf/GV3EDHnn/IPF39jLk1but7WyDL9hBafMrQTtz6SiGF8Stmf8tNcL7DKpj/JlkwAfW+JGDYYGxq2G+oO6TJrPaKUwQYPcDj8hw4TzRwy3U0ia4MtN32vUO+G7cznFSpa7ncU3Fu6pQM2rQbo1eaAwb5XxkpYuAHgYm5mA6Gout3aYQtIfFNI/8ZoN9TPVZ9WUAL07tB0xeOsce0cdaK57wqwQENZqppfxlkrtd7ROVfArznRa8/wc5PWa7oeePntfQFi+NYIFj91Gh6l4ADuyiwiwENBDtGulmu0TNv5MXyU86O5AUtg4+ryZFDAzMRuUWKciORNotJPWGyd5raLlw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TG5neXVud1NkNVlFOGVuTjFZSWxhWXcxZTVXNTN6U1A1dC9rTitSaEZSK0ZH?=
 =?utf-8?B?MHVOQk51RXkyRVZPSVhSd1MzU0RHSFZFRlJyQzJSeEU3ZU5VV0hZaVVHWDU5?=
 =?utf-8?B?c1k1R1RzVTJGYktsS3VIeE9xRlY3andGMEZHOVZxNDVHenRWRzBEYitlOVFY?=
 =?utf-8?B?TlhmRldrY3c2OVErN2RtcmZteDk2ZzZHUnJTbFgwUU5HVkluZk5HWE1pd0Q3?=
 =?utf-8?B?WDhyVDRLMDdDN2JtNnR6SHluc3FSR1EzR20zdWpPbVc1Q0l1YTdNbGNQdHo4?=
 =?utf-8?B?UVlQNXdNTm9hSDdnUjh3ZGFBOWs1ejJUUzdVVnZBak1ZQ3FvOW5xcVI1YjJx?=
 =?utf-8?B?MDlwcHB0aHpEeFcvbnFqL1Jxdlplbng2VFYrYnFRbU9VZTlLdEdkOVZtMjBi?=
 =?utf-8?B?azZqYTZ2L1ZMVnZGK3Z5MnNGYUE4TmlUdmJWRVRTWElKTkhleGwxVGpGZWNQ?=
 =?utf-8?B?dXZ6dTBoZUc0aU5nSlY2QklzWndPZTBDc2JscEY3Ty9JM2pwUnY0YWRZVnRi?=
 =?utf-8?B?RHNSb1VBeVZWSUdyZUVHNU5jaG1EczY4TFRzWEJHcFNLajc4Z3g3QmErN3ZR?=
 =?utf-8?B?R0E1Z1d6NE5DK3kzSUdPbEw2WXNvUEN4Y2RiVkVZcXlYeWV0cFB4djJYUVdD?=
 =?utf-8?B?dXVSNUpnL04rU0lFSHBMaE9rUE1Bcmdyam9wWjk5RDlsV2hQenJTQWFvZ1N0?=
 =?utf-8?B?ZGJEMG9odWNSYi9QRlB6NzN3bGM4VFc0N242SzBvc1FKaWZjWkl6VUpOVmZB?=
 =?utf-8?B?aHkrR3M4LytseEtWWXZnYm5sTVZ3VUN6VllCZW95MjR6c0dXNjdqdmZtS2J2?=
 =?utf-8?B?U1ZsTFpsazMvL08wRVZRbjRGU3pPbldkWjRRT2pWN0R4ZGR5UllRRmJkMVBQ?=
 =?utf-8?B?OTVZT1ZIQ3BzUW82cmd4bFhSWFJvUGdQRXFTMlY4WXhjMVZrZC84SEpmdllk?=
 =?utf-8?B?cVJlSWJJeWZVM3dacGRSVVNENnNXVmtmeWpIWmlBTVduWnpKMVpUUytPSUZs?=
 =?utf-8?B?Q3kxVkk2TnVKWG1MN1BlaEkzQ1BjOUJ5V2J6Z1BBdTR6OUVwQVBNcmN0VVJX?=
 =?utf-8?B?MlloU2h1bWJnL1RFd1BzRm5JMnpWOEwxWmVkclkvZi9zRlF1K09pbXRnNDlS?=
 =?utf-8?B?S21MNldDNHF0U3BFejB6ek51di91OVFSMzhkcTN0TFBITlhFVFdwRFpCUnhp?=
 =?utf-8?B?ZWlTWHhqNU9GVUZtdldZK1h2YnBjZU4yWU83T1lPRWdjSXhQRUtROENVS2x2?=
 =?utf-8?B?VkFHdi9qa0wrcEFUT0lWajVVelU4YnV5S3IzSXJzMFNTK1V3amRnTHZHeFND?=
 =?utf-8?B?OUs3OE1XLzcvRjlzVlNuSHdKOXFJd2R1Qy80cCt3UENYdlhiZ3dHclNNK3pQ?=
 =?utf-8?B?RThhSzBoQXlWMHZhcHFxL0VmZnFOU3ZzVExDNDBtYzBzbHdlNHlFTmVWVFNH?=
 =?utf-8?B?dkFnalFIaHU1bnRUTWZhOXVORlBSZlJHNE1iRHNBclBUM1dtVDhobFFIVGFH?=
 =?utf-8?B?U0Q1Q1k1K01ndjRlZXNCUXQrZ2RrVjZVamtyeDE4Y21NcHp4UjZDc213ckZ6?=
 =?utf-8?B?T0V4dDZQWGNrdU11MkR0dVRtKzhCSFIwbXAvV2tIRDJySGdpblpSaUdOZE5j?=
 =?utf-8?B?dXA1MC9pYUk5eWhzWVdjZW1IUFp3UmpjOUVGR2V4RDRFSi9pNTlsWk1QMHRs?=
 =?utf-8?B?N2ZzU3hwUVRkdENvVmdTWm5WcXZ6TS9DVUw3LzdJcThvUVpLVVpWZ2tqSXlU?=
 =?utf-8?B?VENkb3hDR0M2aHVUUlJVRzJtK0NxOEZvQ01BaHU3UzMvYnlLSTZCNURYNURU?=
 =?utf-8?B?Y0hCQVBxS1RLYnA2a3Z0Y1BHWG1FL1pwcjdkTkVhS0NIcmRQdDFTQlliWXJo?=
 =?utf-8?B?UGUxZDRlTXNUejBrbE9hTmhoMkxhakVpWXNCMGNJUkNKOTlNUWlQTzZXUTVi?=
 =?utf-8?B?eEhTWENaT1BWdFdBcE9hKzB0a3pIdXVlMW5TWGZxNW82cFFmQlExUDVBTk1Y?=
 =?utf-8?B?dGJWeXpJWFFDcHVoT3ZlWmk1c0hPMFNTdUZUNzl2UjRuU3MvbjR2WmYrNWNE?=
 =?utf-8?B?eUVyUUtZN3BPcWRMOTFONGM0ZGFJVG9xeURNNmhsbTJDOE1uTlEzM0tHc0g4?=
 =?utf-8?B?VlBDVFpFUVFCZFlCdThEZ0UvRytxcVhoTGl3dGtqMTVNMEtKR2dwd005TXdz?=
 =?utf-8?Q?xBFRyGVdYSumdXInWeH5q2g=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c668e79-7f57-4d1b-ac7f-08dc3c3d02de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 11:19:51.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El/8l+aYcp7TVwwbza/EB+/hplhOWMbsGofrkMvDtQjn8hRMtTIwJGpn0VLoAdfjYGRH3lk3raH9l/ygsgbTU208thBMLjMTm0ttxnFve0QsJcWKP4ScvXpXOA5paSaf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10037
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Mar 2024 11:19:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4924

Hi Michael,

On 2/21/24 22:16, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Explicit the problems previous described as "obvious".
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/dev-manual/packages.rst | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
> index 0e991e409a..d90ff7110e 100644
> --- a/documentation/dev-manual/packages.rst
> +++ b/documentation/dev-manual/packages.rst
> @@ -205,9 +205,14 @@ history, see the
>      The OpenEmbedded build system does not maintain :term:`PR` information as
>      part of the shared state (sstate) packages. If you maintain an sstate
>      feed, it's expected that either all your building systems that
> -   contribute to the sstate feed use a shared PR Service, or you do not
> -   run a PR Service on any of your building systems. Having some systems
> -   use a PR Service while others do not leads to obvious problems.
> +   contribute to the sstate feed use a shared PR service, or you do not
> +   run a PR Service on any of your building systems.
> +

The first line makes service lowercase, while the second line is 
capitalized.

> +   That's because if you had multiple machines sharing a PR service but > +   not their sstate feed, you could end up with "diverging" hashes for
> +   the same output artefacts. When presented to the share PR service,

Here lowercase as well, so I guess we wanted lowercase in the second (+) 
line above?

Cheers,
Quentin

