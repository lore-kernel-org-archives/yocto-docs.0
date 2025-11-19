Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C1FCF396F
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:02:19 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12167.1763571733380583355
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 09:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Daj6cgsF;
 spf=pass (domain: cherry.de, ip: 52.101.65.11, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSZbHgcRB8HxSv7uKlnGdmmxBvcxmHez56bcYt2lZS87b3+dZxAL8LoyXueSsS/USTOlJcZObPBiEbdbMSSWhEsNW9HxWnWNImFoHr+YWlpwwdHNi5YZ3PqhHij+glEGdZ2YW9Z07MhX4/axFZ9x1lVQcPpb1Z1oJTaY21Nunq1bhmbbYD74AzHrLEAilg/qxhHyItp+gv6d73fCyqpg4sxNbC3HC7b0FpPLASC0l4dxfNitPuWk7o1aSAkvBMcA9VJAzEXLq1I7ScSZSGnWaHZalmFYqFXO1Rs9VkK16wOpWhno4T3Xf/cRb5SpJ3SdM4KUnBAncKXIoOrai1XK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTAC+rBTdI6fqeVsu5NwIdTljz+Rvlsxc4paiPCzpKg=;
 b=SLen9a3CBnwNPT6+YWT0RsGriG/piG9kOPE25RqzOgKpBqPZEkp0kNiThNnfeeOYiaBZDUXFpz7AiaJ2Imow6TGlaTmwXg484GRKahREmqr4CiyKIud5d+vyplSlFq8PRxk27uHRI+WsSCj1go/lZoFs0amw2PZ91lAKNUJ8wPb7rFm2GAUGxT6JcAmym/VoJ+GgSrVx04CYVrIx6udDsRzIUbI+HGGGXsf/aTx0MqlsbeO71B+7CI6RCU2qexxlPbn+17o0+6sm1I9lNeNHVSIAHnnJVhYm4fOcuV1qMLVbpoC3zdJ4NZ8vexNKefePRE19x6aRES2+60/TDeY0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTAC+rBTdI6fqeVsu5NwIdTljz+Rvlsxc4paiPCzpKg=;
 b=Daj6cgsF5kPg9V7vWQXT1tCDG8CSdBw8+r8rsl8qlf8nRrK4caa8D9IYc001BauL51lZ1Z0BFuBZYdSjedwEtW7NdUiSoAv6ZSZShKHf8nuk2oYF5BVeq0PguMyunYgh5TG6r3ETupSYOyYU9IWYu8gs32TvKtx9u+arkVnp6zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB11218.eurprd04.prod.outlook.com (2603:10a6:800:29a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 17:02:05 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 17:02:05 +0000
Message-ID: <c7b22873-8870-4498-8736-9802ef123362@cherry.de>
Date: Wed, 19 Nov 2025 18:02:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] brief-yoctoprojectqs: shorten and clarify
 required host packages
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <77d4de56-c700-9ae8-f03f-ede89df13e62@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <77d4de56-c700-9ae8-f03f-ede89df13e62@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0258.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::25) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB11218:EE_
X-MS-Office365-Filtering-Correlation-Id: 726f6143-85fd-410f-fad0-08de278d5dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?anlNZUxYVnZONXIwUm5CNk9oZmdzK3dQNG5XZ1gzQVd1S2xqb3R0ZHMrQURL?=
 =?utf-8?B?L2pYdHF3RXkvSW1PRU9TMWcyK3FsVVhtMUxiQVZ2NG84Uyt1Ui9ITDlJMmFT?=
 =?utf-8?B?YXpBQ3pUTGJhcWhraGFHTy9ZamtPUGQ5aDY4VWJCM3JGK3R1dGV1VlVHemlE?=
 =?utf-8?B?RDNYMGVwcVZxcnA0bU1PanJvUUF0dFowZVp5WEJzbVp5TkVjMXZhekF1TVpF?=
 =?utf-8?B?aVpLTWVycHJqWERleHl0NEk4ODM0ZEpqbVZWSWY2WTAzUzc2QnRVVnNTNUpG?=
 =?utf-8?B?aENaQnY0OFJWdmNxUEIvSG5CNElpUVFCbi8yajBrcjFWTERxSHJralovYUJi?=
 =?utf-8?B?R2NYUUQvTVlRdW0vOFYwd3krVndFVEVldTB0d2NCdXdFTmo2VitOR3VpN2pn?=
 =?utf-8?B?L21YYTVLSENzWkliY2xpaW05Y3JUa2tFODNLdjl2R0ZONDJnWkZaQTMzY2Vh?=
 =?utf-8?B?aCt4WEUvNm1iN0xCMVViZCs1REpYYlZhYXZVdHVnWmFPU2ljdmx2WmZpUzVK?=
 =?utf-8?B?ZkVURGxPSitEWUh4cUQyUFJFMDc3K1VNOEFoV0dzZTNzV3d6UDk3T2VVTVU2?=
 =?utf-8?B?akxIZ0xsMVpYdnlnMnZxdWpITjJWQ3ZVZVlIYXpROG5BMmFxTlplMGQ0em00?=
 =?utf-8?B?K0lleHlYZFZCZUJ5a2ptN2hGNVM2b3ZocXZkSEtod0JUQWIySXl2cVNtSjkv?=
 =?utf-8?B?MHZ6YmZ5c3hubnBRNFdJMkNpTkw2REljUjNTMTU0K0Z0QXlsM0lYZ3RYenF4?=
 =?utf-8?B?OWN5S0hsTlUyVlhPbElYOE16dHhPRGhyZzRKMFBPVlh6cUJIR1NvMkhxTElu?=
 =?utf-8?B?d0RTTWo0WnhKZUEyT3AyWEEyTmZ1cjN2aXB6RTlVTWVWaytoK2c1VTZkdXVT?=
 =?utf-8?B?MjBsV0FSK3dEVHc0ajFab0RMcCtlTC9MTVFhTUo1L2RUT2EwcnZtbmdrMDZx?=
 =?utf-8?B?N3lkODgvdHh4bm5IRDhXTDR0QUozQnkwdGRCWFBVWmNKb0JtNnM2RDA0MXZG?=
 =?utf-8?B?dG5UNFgrNllGb1k1UlhqS0piRzV3aVI4akR3M3JBNHdTbkZBYVBaMDBEWFl2?=
 =?utf-8?B?TUVVWTBUSW9CdSs1bVBNdFpPNStkYmREZXNyYzlNamxYVmNMYjZDa0JVSHdK?=
 =?utf-8?B?QTFydHZsU2I3MkNYV0xyREVTVE0rNElVTFpCSEIzbUkzbEJOOUt0c2lhTlI0?=
 =?utf-8?B?WjJIclVaUlgrRjZmYTNSQ05rbmxCZmZuelJZYkFUMFBQWkZ3VlRKZ0RZUTEv?=
 =?utf-8?B?dWtPS1JLWEdrZWdLQ2loMXFrNzBhWnJoejN2V1NDRldiVEc5QmRvdjg2bWJZ?=
 =?utf-8?B?YUhia0lZeWJPQ043Yi91SCtoTHdiNU11UVlkRi9QYW9QLzdpWkVOcUZpcGRy?=
 =?utf-8?B?MjFodW40UG14YlR4aE1mQUErMkhla2ZOMzMvaytONmtOYzhzVjRjUTI4dm0w?=
 =?utf-8?B?WEpvbWxlZVNCV0tsWnhyT1pLUWt5N292TmdoTGZKUjA5Vzlja2dWSzNLUklC?=
 =?utf-8?B?M2J1Q21WRVdkVWxIeTVNaEp4Z2J1UTBUSDhHa2pRcUFNbXBYb25XL2sxWWZL?=
 =?utf-8?B?RVRxUC9FdkExYndnSHdCWlRNckFCV0RNOHhLNWtTTFQ4c20wTkxsTnFEMFN4?=
 =?utf-8?B?cy9IVithUjN0RFgxMFlEMkpDTWhxTmplMXZZRlpyNTdENFBITXA2eWtkL0tx?=
 =?utf-8?B?blJTellYeXhKY3lxTXFZVFdUMEJ1bGtxaUQ5TDJMQm9EblBDdDR0M3R2bjA0?=
 =?utf-8?B?OUhtWndaV01ybisxSlBhUTdzcEEwbkdQdStkOTJybW53cU5oV1JVSC9VanEz?=
 =?utf-8?B?Z1BQWG5RRkZITnpHMHZWdHRzOHZPQjJ4R3d6bFc2eFFsM2EvNEx3QUFadVRG?=
 =?utf-8?B?M0Z1SXJjN3RtMldJR2g2bjd6eXQ4cVdzZVVKSnd6NzNCZkpWVE5kdjFvb0N6?=
 =?utf-8?Q?4J8AFtexdL7x6XX5oLLY1lG34Vm7n1eu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SjcvWVdaV1RKZ3Ztcy9IcG0zU1F5N3dYbVI4Umw0a2xTcjJWaWZSVkR2Z3BH?=
 =?utf-8?B?c3ZOeE9PbDQxRFZpZjdubE91TnRKdjFSd29iY2sxMHIyNTdPL2hRSGlpZ1BJ?=
 =?utf-8?B?dWlKTUcybXZtOFZVUklRaGZpZDBMejVHMWgzNm9xd1ZtWG94MGtuYmJ1MHho?=
 =?utf-8?B?NnJzN3YyOXp3YzA1ZVl6dmd4ZDhOVkFhWHlTdDhiTGQ1ckVRYzRGemQvSGJW?=
 =?utf-8?B?dGdyNFJ4R2FoYWRuUzRRVHhhRWhyNE1xQjhOK0ZzSGI1WEdhNkc5STVoMVVt?=
 =?utf-8?B?QTZWd3MvMHBqaXRXR3dMYnFDSUJqT2ZiMUFNd2dDOVhwNFJqSmZFbG9LNzlF?=
 =?utf-8?B?Rk5YMWt3bmdhRGlpTHVSQnd2THUxbzZ2SFdQWm10WGY1a0QwU3JGS0JsSWNw?=
 =?utf-8?B?dzdsTDJmYS90WVpGVFVXRnMyYTNhTzdHMEc1UDYva1RXVzFFaHBQT002ZHpJ?=
 =?utf-8?B?endxd0FxOTFJTXNuYXhMNGJyQ01VbGQ0NzQ4SkhZeTl3MkMzNEg0RHcvUVRU?=
 =?utf-8?B?dnFTdGRoM2x2cksycjBOR3IzWWFkbm5Db1BHSmN3M1RLNlhSR084RDhxakp0?=
 =?utf-8?B?Q2lTTHJMSk9Fd0JBZENYOUJiZzFPTjZ2dVpDKzFQUDNDNi9XcWRkWHo2VGVK?=
 =?utf-8?B?QzBTNjA5eDJGR01PS3JneUtpOS9yZDJGODFBTWhtYXNNT1BVekt3NU5BSE9z?=
 =?utf-8?B?RFlOaU5NaktwUlhwOEg5a0ZTMDNSR0l1U3BGZExKam9TbmhpeWJwcGVLYmJq?=
 =?utf-8?B?NGNjNHkzdUlhOUlpVzVZR0VJYTFTME5NRTlPYWRwdDlsdVd0NnBDS2VEaW9x?=
 =?utf-8?B?L2tWbEpYeTRIcXVnSDBpS0w0VmFZZ0lzSGNMY1ljeEFmTExCOFlvTk5sRDJk?=
 =?utf-8?B?Q3M5b212WlZrRXRnUnc1cHVJTFVVbHpxYTd5RkJKV2VOYnlDcnMrU3I1WkUv?=
 =?utf-8?B?dVkwNEt2bmlROFlUREJtUXY0YXRmeklWQ2RiS2VHM0JVZGRCYm5ReE5sRnZX?=
 =?utf-8?B?bDUzUlY1WE1tNzBHYkEwbFhMVmZscE9EL2ZsM1NaeEFCZVcyTk1KQnQ4eWFm?=
 =?utf-8?B?VTRsN0dZV0xqNUFVTXk5YSsrUTRRWGtRTHp2MmpReGIwL0d4UU5YeHZGUHB6?=
 =?utf-8?B?c1lDMkw0NTk4eURmZWRyK3MzaklxL2ZtNGc2cTltaC9MTTlwZG9PWWpkMkc4?=
 =?utf-8?B?d2dHcFJXQW5oNlJtVTlkdG1IL0tOWkR2SEMrMW80ZjFzYlZ0U0NEZEtHdlBU?=
 =?utf-8?B?VmY0amNHWWM4VWRPa0psV2pjZ1VtUXE5NzRBQmpwSmdtdldqbytSazdLMm5G?=
 =?utf-8?B?K3pIMUN0TVUreTFBR3JwYTR3SjBYM1FMVlhuTGloRlhLWVJTNnhSYjEwemw3?=
 =?utf-8?B?cEx5RFVZeVU1Z2pvYU9rNlZFQnpxVTJyQkJpS2QydnBNRlJvUUlIc0hCQUdt?=
 =?utf-8?B?RDBlTVFUN0hsMnQweFhXZGFzcXRRbHY1RG4vQjdXeGpoMnRrNDZqbDh5NFF5?=
 =?utf-8?B?NkRwV0ppQ21Zd0hqbjltQ0lyczd4WUxWd2E2TURiL1lRZE9sSFRvRThSaFYw?=
 =?utf-8?B?WVAvaThwb2YxeWJGcVVYeTd5ckg0R3Z6T2FadXNSZzRpbVZKMjFycHFxY25o?=
 =?utf-8?B?RkxDNi9ZVGtSSFA4R05ReUdvNmRNcDdPOXJmaERlU3N2SmpQWThGbUVJMVpE?=
 =?utf-8?B?RnhoL2tiaXJrL3ZnRVF5a2VrWnZiSTVKQ0FTa2xKa05BMEg2UllqeWJPZCt4?=
 =?utf-8?B?S2dnYXp1UzVpVjYzMG1YYUtMVDBjU0tWbHNITXF3Z3lwLytMc25tTW1GNUdE?=
 =?utf-8?B?bnJLc1Z3VGpJeUJXdzF4OVQxR0tWclpYeW4rNWptY1U3MEJHUFNIWnlUd3pL?=
 =?utf-8?B?b05Za2VXRTJybndMYlNHSlFRK0xnblJRcFBRclpLWUhYNUlrZXowZmhlcGs2?=
 =?utf-8?B?aFVGVFJFMXlVY1JlanF0ZEFVZ2hzT2U5cDgzc0t4eVBEcGlEYzB4d0ExM0Yw?=
 =?utf-8?B?VGpaYU1scnVoVmlGUEJKMG54cWthK1B3cm5JUVU1TFFUM0FaT1ZTeTQ4L1Qv?=
 =?utf-8?B?a1JhNE1FZmJURHFGNSsrUDdBMFJBaFNRVFdHVjU4R1lTbTlBOGI4ZW1vSHpO?=
 =?utf-8?B?TmRvb0sxT1JOaTFib2dCV0FPcWFaUlNSazNtdy9KZ0VtdXdmditNbVF5bDNH?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 726f6143-85fd-410f-fad0-08de278d5dbe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 17:02:05.2073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv68bv89tZZCS1c1lDfzcktmq3QJHyW5UKAsReZWMDnRnAbsyNNaPv1Ln1yjNETk0PYwiBMfmct1kKTp8SEBjpAv8ZI05NExb64se7gJnro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11218
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 17:02:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8098

Hi Robert,

On 11/19/25 5:55 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Rather than refer specifically to Ubuntu and show an example of
> installing essential packages, just refer the reader to the page on
> supported Linux distributions and leave it at that.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

