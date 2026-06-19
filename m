Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E2DCD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:36:55 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43832.1781879806010676750
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 07:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lwdGYvRu;
 spf=pass (domain: cherry.de, ip: 52.101.65.38, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7vI5qTSCXQWVpccuxVZ4WFM01j51UVwyKI8Mns7v7F5auYMIoa/E1YJhEHy5V5FbWv00CmW7875XD1JWV1MojSWpBpNxv5mtdv7j2h1AFrKlQglMWJncCuMZMz8K14sBzHSm6uWdDZp1UpHKeryyNHlUU/Q2TxBRho2vYuESk9kQs66d0I2uiEsIu6BDfRE9Pg+MXSf/FlL17oO+oBglWuKZAABO26kd7ALYAf4N2/MX4rp0xJBQSuzWhiv9KYvUQgHFbI+HN/z9tExDxcmqS/KVbqdPydEf3Zqza2lc1w16OKafkbotO1o0nVk3LlPxXyoYW8xHiQKcjJ7w/VQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn512f6KqdjMxfQzApqql8U//Q5OECuCojsLTljOk9w=;
 b=nbO1cvrulP2SSWUtVJs4CM9ZzcnnneaGwuKj7UaAYwwBlzFtCdss1rCspSz17/elaql4PBZL2cDAw8E+dXmzXOCHph32CrOF3EXMg/g3+eXuhccgseHdKX41da2twVreWsNRzW6sA9j/sCUfr08JYZ1hU39WneOZIail6fZlDHUraifM4XfZYzr4c4h686L0FctjoFthRLG7H3oAGik6NO7AFb5AdUJ8K0YRzDkbQY84FI1TPDDQWw2sUG9UgHb1R3ZFD/d/zux6DFXZquQ2zVum06aMomcjQJPb7TRxVeJjBC2XOlgbX/OlwJed6HB8I/zS4qsdeQvylyZSZ/pPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn512f6KqdjMxfQzApqql8U//Q5OECuCojsLTljOk9w=;
 b=lwdGYvRujqrFiWU4NMflXm4i/cJ97+uGkPkrmHqzNHDfVbwlv0oAckkZLs4N1jtNcbRRwE3l+7nP9IKAjiToVcl+AVWXad2p3xr5wRkUEGBBnmexfMCwQgujjefbcUweRGbMlv7CGvR1L2fHoMBDMHMAosNZKCtAt9UnnZ4joco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DB9PR04MB10067.eurprd04.prod.outlook.com (2603:10a6:10:4c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:36:40 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 14:36:40 +0000
Message-ID: <e59e8774-28a0-4d63-8518-99b0fb46e196@cherry.de>
Date: Fri, 19 Jun 2026 16:36:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] dev-manual: explain how to properly call
 "bitbake-layers"
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <375b7fa3-83b2-72b6-899e-45de4b79c023@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <375b7fa3-83b2-72b6-899e-45de4b79c023@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0069.eurprd03.prod.outlook.com
 (2603:10a6:803:50::40) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DB9PR04MB10067:EE_
X-MS-Office365-Filtering-Correlation-Id: 3969b46d-4133-46a6-ae6c-08dece102d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TA81As0XFgOynu7UubI1c7xxPIeH7Nih7NZk/bhPgn6aKESIPuaJizePyJ4l7ziBWcCQ5k1pZPYFkL9qhGCy1b2J1ZoTquqq5Elag+ltRvY+v3SoR6+QCgV5MwtharFl4cJja7wGrLM0wz1mUznvFDfz3EMrAf5MBtyh8JX0leLBMaxf0bCplCSw9usjJvXeeK64l44P5uKXdfblEB7bqoqjhSQPCrAXvQY4/4tg07zXn0SNlX0uEAo5P9bN6XNmiSITjBJ9l0g46DeJBFcAcpgJHf7RmYDCUI6hx3N7194kt6vjEGGqDfn4NFi6FA72wwEICDk8Xqj6yRctEx5kJCohOIcx+doR2nY16qg3vfmGnm2X6a10o8BuNCpQ4FSJtpFiT2lidJyPrPIgFT5evq1q7mukmkGUfQqjUuqADunVdr0Ak0/HXIvDTcy6wk96uRN5W5czbgiZQXMOcSiyCz33mYCSu2AH5XiMgEZYw99rqYNzvMsIofabWD4jmXw47EZ8iUiu01YC94IBv1TlProlBEOgl5bCUor+YhGiTij9QS8tiJQefKAWtEOvBa8YgfKcGZhZ4Ib7qyt5YZ1wNtIwv6PMxNCa37Vpjn/j01s3k02xQzfMWKDPgzORKlaFW6avB/lsL/cyL0H9JnmKzOGMFpv3mMDGgwYiZBD9+/Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2pvaDd1ODhHRzlwbXltckRzSVBRaGdlRXBTSTlyaWdNNnE0c3ZXd0h4d0dp?=
 =?utf-8?B?K2VrdTA4VzBaRmNJMzNLMFV4a25qSnowc1lmSFVsNkxsZ1FMR2tTWTJ2c0JH?=
 =?utf-8?B?LzE1VGhZVGZXZFFYQnA5d3BtbHlZQWJ0TU5QcENyYWVZSVJ6RHZVMTE2alhj?=
 =?utf-8?B?cW1uM0FDdVRHb3pSZjVzVllRV1E1TGUvTnBuZ3dWWHJiN1ppRWVheFpjV1Vs?=
 =?utf-8?B?Wk9MWVRxQ2NlbzFyRWVGSmQzWVU2T3FDQnJTWWFUbm9Wdk5rS3M5MXYyZDJa?=
 =?utf-8?B?MHQ2U0kwMzlnTzJYb3dyMWxwK3NCV2k5OTEvRmNHKzNXbSs1dzU3eEh0ZFRx?=
 =?utf-8?B?WTI0ZmNqZG9mSWtNUE1Qb2dPV1Nac0N3cGF2WkJaNUp5T0NLODU0REx0YktU?=
 =?utf-8?B?cVFjTXoyOHdGSC9xdGxtT2pxN1RFQStGcEcvd0phM1hlOTVTWGJjaHpNZTgv?=
 =?utf-8?B?U2FFWUwzaFBhUTBZdVYvbUpIbTc3OURsQzVVNitqbGloSDVZcWNvMzJYRjkx?=
 =?utf-8?B?TFBZM1dlamF4SXFWTko2N3dNZ3NwS1dySll6YkdvSVQxaDBNVWt3T3RLRWg0?=
 =?utf-8?B?bFR3MGVKckViRzdZMUxCNDAyaFNwV0dRUmJ3MGZFQzU3QlNob1ZsSnEvQ3NQ?=
 =?utf-8?B?RDl6Nk1HWUJPVS9QcS9IRElLWWpJSjVkZ1dwaGZTbG9jb0hHQ1h0SnludUFn?=
 =?utf-8?B?d2Z2THBLcTF2UmR5TFlWRmUyWWdQaFdNSmZERms2RE9KVXRRVXZhSFp0ZjRa?=
 =?utf-8?B?a3JtcEh6STJ4VnlTRkhrcDVwRHppR3BYSXhobG5IUVR4MzRRbVVvem9TZnFF?=
 =?utf-8?B?aS9NSlkvNFZHU0RpNzFwcld2WDI2TlpxM0hvV2xDN0hiVDA4cXY2cXdqZTVG?=
 =?utf-8?B?OWhRTENkSTd5RytGUFYxUVl3Q1ZsdnpzdmR0Wk1rRENnK1NMS1Q3dUFDZS80?=
 =?utf-8?B?ZlQxNWh4QXgzd0dHTjBPd0kxWDBmcUxZT0toWGtucnRsWXhrb2xuanA5bjNx?=
 =?utf-8?B?NW4zQ1pPSVZkcVZ4NlpjckRDQlZkYmgySnFMRml2M2doSEJqZk5xTGtEWEpT?=
 =?utf-8?B?ditybmQ4RkcvTUhXamxJcWJ3L3JjS3d6K3BWSnlmR2xDd0NjSjRSSFlBWkl6?=
 =?utf-8?B?aUkzcTN6Y3hNYklPRGxZM2tVNFBzRlJQUGJ6TGZzZmpYRW1VVFYrUmhLWlVE?=
 =?utf-8?B?WXNZNjlnYzdHZmtNd0g2aDJkVWZwU3ZYb0p4OUFQSUlRakVMZWk2Uzg4ei9m?=
 =?utf-8?B?TVFVMUc0d0VFSENFV2NQR2tMWmFlamVqUVh5RXpxSGQrWWRxY1plT1Jhc2Iy?=
 =?utf-8?B?VHFLYlNITk9CaThzZG9aVHh4ZHR0SnVpN2plakhnV3RkKzFDZ0VreUNIQXFj?=
 =?utf-8?B?b1IraHY1Ni9NU1R1bW1iSXM5NUduUTZickV0WlBsNHRIekJpZ0ZqWXB1R0NW?=
 =?utf-8?B?VW5VT2xCZkJkd3k0QWRvYm81UzJXdTRtVjcwSGFzYnJYZ1N0c3E3T09qdFQ5?=
 =?utf-8?B?TGUxNk1uaXgydVpFSm82T28rQy9jSXorRkQyL2dQQTVPQWE3eGNJYWluY29F?=
 =?utf-8?B?Tnl0Znpkc2hqSzZCbklJTHQ1MHc3WTZMblVGSjVPbUdyTndOaFRxYnQ3bGp3?=
 =?utf-8?B?LzVaMEFpdjQ4REt5S0V6YlZ3MDNaOUVCMjdjQi9zcDZ6ZE5EUkdUZEhpRkpN?=
 =?utf-8?B?Wk1qU2d6K2RMRXZFYVNydWJxb254RitRdlNqK0puZTZRVitqMnJCMnkyeG5v?=
 =?utf-8?B?S2N5NGVQQkMvb3FHanhvNDR3alJOREJRenFYTW5WZHZxaTVPYUlMQlNOM1ZN?=
 =?utf-8?B?dmxCMnlLZFpsRlIwR1dPNG0ySlBWQWZHL1A3aVRHSHBNQlpTNEtLdUlBZlNZ?=
 =?utf-8?B?dmFra1NqOEdEL0d2OXRCeUp4cnhGSWE5T1lMbGJ3NDQ3L0g1V2RrTlQxY3U1?=
 =?utf-8?B?aGlmREN4c1U1WkZlTzk5YlRENzBzcUEzVEFNS0hoQ1ZqdU9ONHlpUitRTFhv?=
 =?utf-8?B?blVGRjNmOGZUbC81NTNsOS83WkxPUGowN08vTzlaWStwSFYraDU5RlUrbXJp?=
 =?utf-8?B?S2NHbklQOSsrcUhyY2ViK2pvREdUUUtURVplb290cFhlbVZicEEvL1FJR01q?=
 =?utf-8?B?QXlmZXVUOTlSV3R1UzI5WTE2SHh6d3dNN1p4eTFtUHpwMkQ5Rk1SWU9WeG9B?=
 =?utf-8?B?QVRPeEJoMzJ3azArUlpLL3NIcEx4Z1JDdFo2OVpscEVQeTg3a1UwbTJEMEVq?=
 =?utf-8?B?WTM1R0psNkQ1cHdkK0ZZUUJkY25aV2o1NXJJNERycDhwL1RYR0VqWnBqcmwv?=
 =?utf-8?B?NmRUY2c1ZjZGK2tGVXZWcjhNa083OUlHR2hxVmQ4SlpGZnYyTEg5UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3969b46d-4133-46a6-ae6c-08dece102d0e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:36:40.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7p2KuUM/eN93MNCwFzJUd/7vImQRJxmjyx+2r18kCzNugOYXmOpX2bnccQ+/CIdFF/KuVbYTmKsDodkgn/9fyJRJe6yv/fxQM3NVsZBhko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10067
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 14:36:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9787

Hi Robert,

On 6/9/26 10:35 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Emphasize right away that calling "bitbake-layers" needs an
> initialized build environment to work properly -- that does not seem
> to be explained in that section.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

