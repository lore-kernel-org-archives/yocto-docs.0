Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6786CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:36:37 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10623.1768926991348247785
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 08:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FJbt7mJc;
 spf=pass (domain: cherry.de, ip: 52.101.69.18, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7E5DawIur9keXXEhjcDj8G353NqkQE1lpDYVxEt6f1CcGbw2r92RvXkXEzCV0PAKeHik+tiwYvaY5t4LrVqc7KUJhprTNOXv6IKWkJ9EzA0bRUy3RElqcPTp9Q54EBi3BBNgtFHBonFlET3sHGZUm+MPDIUGBJUoypsoP6AuY6PSP79aB72abx7TEjbn/hIYFLBwPwk5bRct1i2h93Qyjv4grEuUfYILLOTUHxSdV8z9psoIeJa0KPI/eQJSKx2IOw+U/3z7NWctDn38BVu1aJjREzwvVhiKUoUPhJ/TYjIlXusAMAWStB0R0Uq7zXNPrwyNgw2ZienaXip4ZVzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLgVOQE/O4T6h/Kp4D/zFbjfLx+OwMGwfOdh2iD0QKI=;
 b=VctYI3iQ9eijDxdIDbMNz/PeDPmAT9wojC3JfahmFXFcRR4FuapF0XF+4c+3MlnUoqwqJvI512NReQpeVg2y2ENhC+dwBNngUknP4wwS1bf7ed9v7K+394Zot7g+JxwwxxeUqHIsiADWvdyDoBQEnUYyMemHIKwaTQgwZYgZcN/lcr1k56HQi6AaMPH/0Dhhqvd7EDBUUfkk+EH2Tm/U8MysBaXdUeZW10a+x7YLMKtZT0VDo/JJwlMmbbxLSqhIfxAddSTWN+iJIBGExpsTh/sNgKY4b9Jx8xdgizDn9pWfERt+9OC1C3e8QZMi82F/nCBGhvzmV04e6FCyV0RVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLgVOQE/O4T6h/Kp4D/zFbjfLx+OwMGwfOdh2iD0QKI=;
 b=FJbt7mJcHbKMHwfa0om7cFeMCqnDV5kjG3bJkr6NAVWKDC5D9kdYr5NtyDAUQcgKWtlieIWfX4KOVLT8n4nbX/4579hJ1uqzi6L/DWm62qXfWKTftbEboortZbEzFWdNOn/SNDjOFj40KWXRnQ1BNZV+Ss0WPTLnDSmxoKOYS/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10352.eurprd04.prod.outlook.com (2603:10a6:150:1c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:36:26 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:36:25 +0000
Message-ID: <2d8c8ba5-29ef-47bd-aeac-cba9d75ef0f8@cherry.de>
Date: Tue, 20 Jan 2026 17:36:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/5] ref-manual/terms.rst: refresh the Build
 Directory definition
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
 <20260120-terms-refresh-v2-1-fa49d15b209f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260120-terms-refresh-v2-1-fa49d15b209f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10352:EE_
X-MS-Office365-Filtering-Correlation-Id: 24612e22-b965-4c2f-a786-08de58420ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QzdlV2FNaXhPMnY3anNIalMxNXAzdFNXYnYwNkpXMkZpNjIvcVQrMTV1VnZk?=
 =?utf-8?B?Rm1PdUhXM056OUhLazBoUnFaNE0wTDVCMlNRYWNvb2t5djBYYy9YeDAwTGNR?=
 =?utf-8?B?Mm5YNGREM3ltS1lzbmIxanA0NG5aM0p3aStwTE9xMlJrUmt1dDFRTU9uSzRo?=
 =?utf-8?B?Zk41M2crdmNHb08yUEdZOEY0YUIwSWcwWkJsb3NPdTZoMERWVkFDOEJ1dGs0?=
 =?utf-8?B?U0xyZWVZaVNrNEhhb1VGbE56QU5MMlhjQzBqNGw4NnlSU2w1OFNoandsQ1ly?=
 =?utf-8?B?a1BOTExBbWZmOU9nK243dlIwS2RWcFdtQm95b0V5UTJTNjRydUVESk1oMEg3?=
 =?utf-8?B?TW5DSFkvSWN5cStiZUwrSmswaU5ZODhESWNucVkzNHRjdnZGbDhneXZRSHB1?=
 =?utf-8?B?QmhuQVA1L05CNG1CWlE4SlRUK3NoMjMrZExhZFVNYXg4bDFYQ3dCeGNQTG9p?=
 =?utf-8?B?NmFkdm5pUVBuUVdLblFMWjNCTlFHWTY2MGM1U1N0bS81OHpEczI2YTNTSnlu?=
 =?utf-8?B?OHZJbEQwWEFwRHp0ZUJpSHRsdTRPa3Yzdjg3bmI1VUViOG5pSzVEWDNBcHQ3?=
 =?utf-8?B?WDFZbU92MVdRWTNhT1E0Z1RIdk1FTlQ1dk9BNHgrSk4xTUdMdGpxOXlTNU5J?=
 =?utf-8?B?ZzZSV2ZpMnQ1UXpWdGJsWWJwb3ZjV0FvWDNtNWx0aWRZeFNpdHlhL3ZPeG8r?=
 =?utf-8?B?d2R3R1hKb1hBQXRQSUhiZEpGYTFPdEsrNHkvVkxaa3prYk1RNWRMODY1OTZl?=
 =?utf-8?B?eW1jQk13dHk0anFWb2RHeHBvUU9qUU5rU3dYd0NuTndwWjMzelJHazFqN0Zt?=
 =?utf-8?B?N3k4UHFrVnZ1UHpGeHhEZUErMGFwcFVRZWRneUdhZTFtNUQwVjZHT29qU0lV?=
 =?utf-8?B?L3RBMVZqNVplRVo3VU5KM3ZOVFEvRkdBYjJWNHF5VDF3WFJBOGRRMnhycStO?=
 =?utf-8?B?cVRQbWtKNnNuSXB2T0dMN3VxSmtudEZvUEI3VEVzV0h1b1R0SlpqRExjendT?=
 =?utf-8?B?WmtiSHBkMTBLOWhxMnlmOUUvenM3dWE1dE15SFk1U1dFcHp5QjJOdzM3L0t0?=
 =?utf-8?B?NzU0RjIwVVhUWDczenkwOWd2dWMyTUpaOG91ek5aTGo2M1dMOUJLTnJRWG1j?=
 =?utf-8?B?dEJERFp0djhtcy82ZWtvYXhJYjNqVGZFRTJtUTFqNWpKenp0Z1V4eVpubGZK?=
 =?utf-8?B?YVJSN2xZK3hpMExnZTFmOHR0NG4rUDQ5QklFa0EvKy9TOE1qajJxdlUvamh0?=
 =?utf-8?B?aUVsa2w4RWlyY2o4T25CelFLNzVZQzNpNFJqanZkVW1TZTR6T043SzJ3TC9q?=
 =?utf-8?B?M1hPRy82YWpaOFA3MDFqcjhBdjA4Y3p5bXo4SGxWeTErVVBVcGdXTEVpVkpy?=
 =?utf-8?B?NjZ6S1JhdjVvQlJPWUVsazQrSUJKTVNXQ002SGxpd0p0M1B6Y0dsbmtwSzJO?=
 =?utf-8?B?WElHYlhlb1QxNlBTaGJzOHBQb0JMT3dFRllrcGR5cXR6dkJkbVdyVXZJWUdw?=
 =?utf-8?B?SGpHTDlOYy9XdXgrV3hiQ25uN0RhdGpnRk9iSTVzVzF3MDJyMnBiOHQ1bUI3?=
 =?utf-8?B?c1VJb0sxalAxdUkvWmNpQStydmVKWmMvcXMyRUVCekNQdytWb0tOSTN5ODI3?=
 =?utf-8?B?U2k4eURJOVhNaXYyZmhqWjhRd0xkRit6aTVGQnI3ZVQwVWFHa0d0RFM0SFgy?=
 =?utf-8?B?WjRHZkROeVNzdWJaMExQZVdZdVFMZ0NGQ2VDOTFmWjdFYWxPZk1Qd1grU25Y?=
 =?utf-8?B?dllma1VoemFaNk1TMCtFMG0xUUFGZGV4MjRQaFVPV1kvYUJWMnBQS0g0OU9B?=
 =?utf-8?B?N0RNZURUOG91WCtidVRXUjgrUmpLRTN0bU1GbmNndEwrNFQrZUFjTDFMdFZv?=
 =?utf-8?B?aE9CRU52bjVINWFGODAvcW9RS2tpY2M4TG91eStKK1lLODdGYXJMQkMrMHM2?=
 =?utf-8?B?WndUa21MbFpKMVJ0Y1Nsc3NpSERteWM2OURBUkRmVmFWQXJHeCtIdjVPT1FS?=
 =?utf-8?B?UklVYW00bHhVdmVMTnd5UFN4cXhESkRQZE5TcFhHVXhTUWd1b3VzSzZaN3RP?=
 =?utf-8?B?eXpScE1DbEtYdHJPakU2enUrTmVBR2h1NHdZUTZhNFk1aHhtZmN2aVBZb0Nn?=
 =?utf-8?Q?fhAc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmRDTHpVTXN3VjZ2a29SV0FFVzRjRWNkcjU3STVmMVN6QWdyNUZ4TVVTYTJr?=
 =?utf-8?B?Q1oybFJqWGtJdDhZZnFGdDhxSEdXZXhxSDJBcHRzazRocW0yUmZkeVNsRWpL?=
 =?utf-8?B?OHJoT0hUMElJZ1d2bEVyQkFRTlpDMW1GWVo3Uzl5VUExMENGU01YemtXMkdT?=
 =?utf-8?B?U1pISFpjTjBUSnlyaEZlbXVVNWk2SU9pMGZoaUdvUE9aVm5DSU83YUc5TVN0?=
 =?utf-8?B?NWsrOGxoc0pIdXM3VmQ5OGtXTWZ1Y2gzRDhPQkhHclJzdWdYeks1RStrVm5w?=
 =?utf-8?B?Nm1sbE03UGRhQVlxNW5LUlpQelF6V1Z4anN1UjA4M0lsUWVRbXBWYTlHbjVG?=
 =?utf-8?B?TXhwbWpybXVnakhpYVZlUzEzM3M3OHp4YW1Sbk13RW1zemRkTW9zeDBxOFBH?=
 =?utf-8?B?MDg4ZVR2a1REb0llazF1MWRJa01qdHc2Wm1sV1MzTmVvZnF0RjBuQnUyOWVH?=
 =?utf-8?B?ZUpSeUh2dGJUWFV0VzNac1lvKzZjVWJJUnk5VjI0RlFUd0JHaE1qbkZZV0Rp?=
 =?utf-8?B?QmpLMWdsT1VOcGJrN0laWkVRSmRrQmNaYWZsQ3hOMzEzU3JkNUV4WTl5NTlG?=
 =?utf-8?B?aVN6NnUxM0hSaFNKMUIrVDZMaThyRER6Z3YxS25FYllVUlgwcUh1Z20yenhx?=
 =?utf-8?B?NmZXaG5KVS9zaHFBeFE0VW9MaGs4Z0g2d253T05jM1BJc01YRnJiaFhZMm5U?=
 =?utf-8?B?WVdrb1dLSmgyc0lCWWVscnNWNWYyWlR3SEFFZFkvM2llQmxZckcvSmdxVDN1?=
 =?utf-8?B?YnZ0Rk9yVHcyRjI0blRqVVZYVVNlUGJaTXA2b3JOT2Vwb09CZ0JVcE43N05r?=
 =?utf-8?B?N1NicHkzc0JUekg3T3lLaWJONG5kNmVFTC9VYUQyUHllMGJMeExYVUNjODNh?=
 =?utf-8?B?YTdJUERrdEVsanNBdFlrMmsybVowb3E5L0pHcHVURm9La0lCeXY1RVFaaHg4?=
 =?utf-8?B?R1cyWElPMDJxWGxsNUkza1hBMGYrV0VFOU5RcHFnVFo2dVh3LzhRR2pRL3ND?=
 =?utf-8?B?cHJZdnlSVVg2T0tlNkRUMFNJdzkwM0lxYkRaVnJqcEFXNy9BU2dGTytycUFy?=
 =?utf-8?B?NGMzbU00YURyZjJqR0hCU3J3amZjRjZaUmNsc3N3cXZ6YjYzT1k1eVUrNVJi?=
 =?utf-8?B?cjdOL2NMQzZnOElvUzFNWU5nRzY3NW9oNG9UVjQ0SlJTU2hlbkdsZytJcHFM?=
 =?utf-8?B?Z29ONHhkaXRMSGc4R0FuaU1CbHNCaHJ2dUIyNHI5RCtFN1JINk55NklUeDFJ?=
 =?utf-8?B?SThIbTNnQkRKK0VneWpFN3l3eEVscERLZWczTEpDRkJXOWk4OFRUUmtndUJI?=
 =?utf-8?B?ZnRPS3J4Nm9JT3RnT0hObVRyanAwTDhFOEJUZjZtaVBZV0ZwZU1sNEl1NTls?=
 =?utf-8?B?bEhhREdydHJXNWlEVXBSWXVETThKYTZOU2NrKy9ZSjF0eld5V1lCbmZnQkpi?=
 =?utf-8?B?RVh3TUFFOWJudTlXSW9FdVByb3UvMXpLN3VRaVE5eE96b1ErWkdVa0w0cFY3?=
 =?utf-8?B?ZVZWQWxxUXMzdDZyc1RyZXp0MllsSFBUcnJYL291QW5neGFXKzFMY0dCQ1hw?=
 =?utf-8?B?dENmUm92VFI3c1hFZ3ptNk44VW1BNlc2SVdsUTc3b1lyUy9rdUVFUlpGYStG?=
 =?utf-8?B?Y0pXUm1NWmp0ZXFBWjQ3SlAyMDZGL0kxTHgyT0NDUndYMVlCSjNENTdLanVV?=
 =?utf-8?B?d2dDWGFiaE03QVVvaGFtMkZUMmNSS0ZLdmtTVlJVclhJbVN0QmlJczRBVGZh?=
 =?utf-8?B?aThjVmZWb3QzUERYWDBnNGN1UzErUG9XZmlvdG9EemJnQWxJUDBpRE1yaUds?=
 =?utf-8?B?RVpBcGFnYWlzU1VGRmIwYlJBbEh5bXBId0NIWmRRM2RZWGNzTGRBQjJjdnBU?=
 =?utf-8?B?M2w5RlRpUjlhanJrYmxselIvOWg2M2NIUi9xY21JanQ0VjJadm4yQmxENita?=
 =?utf-8?B?bE54RFZTOUhrRXM3UlpxaytoZWxwcVBiU0E4cm0zdy9MYWp4NzZKam95R3g1?=
 =?utf-8?B?M2ZvMXdjY01lb1RaeGROblkwQVhqT3Fnd1lKUklhdHY1UTJnM25BMEJpSk00?=
 =?utf-8?B?enFVZkx3UzVqWFdsQjhCTFhrYkxwQmJxVmlqb0VCS0hIekpYdCtmYkN1c3ps?=
 =?utf-8?B?SCtSM1QvMlczUjZGdUZLS3UrWXdoSlRiN3BSc3VMV0RGYVdVQmtZVzV6cVlI?=
 =?utf-8?B?NXhRdjBsR3Y1bVVnUktVNytWMzNVN0twZzZUbjF2dm1wTHlha0ttTzI5ZHd6?=
 =?utf-8?B?YmJmY2tYQk5tSjZoSkcwMlhqQkxoZFVEM1JLUE0xK0FJOGZ0VWMvaGhVZ2Nw?=
 =?utf-8?B?amYvQ2JIVGs3YXN4alJxanVxcjl6cWZvWFhtcTdwUURxVUFsNGpEOHkzblU4?=
 =?utf-8?Q?r1QVxpbddY8llUL1DfbWiFI9gGqGhasFoAEyf?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 24612e22-b965-4c2f-a786-08de58420ddd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:36:25.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pglpl2dFIdcI33ArfKYWc3xdzNVdXBhb1SXJZl88wszphXnLLQOg4hURaBpRt7391uZ/rJVv/pLglJUVT+OgjVq/ZD64vcUhx42FRrHOFDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10352
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 16:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8603

Hi Antonin,

On 1/20/26 4:17 PM, Antonin Godard via lists.yoctoproject.org wrote:
> After the Poky repository obsolescence, refresh the build directory
> definition. Fix the formatting and indenting issues while at it.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/terms.rst | 46 +++++++++++++++++++++-----------------
>   1 file changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index 6a9f88061..93a2febc7 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -63,36 +63,39 @@ universal, the list includes them just in case:
>         This term refers to the area used by the OpenEmbedded build system for
>         builds. The area is created when you ``source`` the setup environment
>         script that is found in the Source Directory
> -      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```). The
> +      (i.e. :ref:`ref-manual/structure:``oe-init-build-env```, or
> +      ``init-build-env`` when using :doc:`bitbake-setup
> +      <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`). The
>         :term:`TOPDIR` variable points to the :term:`Build Directory`.
>   
> -      You have a lot of flexibility when creating the :term:`Build Directory`.
> +      When setting up the build manually (see :doc:`/dev-manual/poky-manual-setup`),
> +      you have a lot of flexibility when creating the :term:`Build Directory`.
>         Here are some examples that show how to create the directory.  The
> -      examples assume your :term:`Source Directory` is named ``poky``:
> +      examples assume your :term:`Source Directory` is named ``project``:
>   
> -         -  Create the :term:`Build Directory` inside your Source Directory and let
> -            the name of the :term:`Build Directory` default to ``build``:
> +      -  Create the :term:`Build Directory` inside your Source Directory and let
> +         the name of the :term:`Build Directory` default to ``build``:
>   
> -            .. code-block:: shell
> +         .. code-block:: console
>   
> -               $ cd poky
> -               $ source oe-init-build-env
> +            $ cd project
> +            $ source layers/openembedded-core/oe-init-build-env
>   
> -         -  Create the :term:`Build Directory` inside your home directory and
> -            specifically name it ``test-builds``:
> +      -  Or create the :term:`Build Directory` inside your current working
> +         directory and specifically name it ``test-builds``:
>   

suggestion: to make more digestable:

Or create the :term:`Build Directory` named ``test-builds`` inside the 
current working directory

> -            .. code-block:: shell
> +         .. code-block:: console
>   
> -               $ source poky/oe-init-build-env test-builds
> +            $ source project/layers/openembedded-core/oe-init-build-env test-builds
>   
> -         -  Provide a directory path and specifically name the
> -            :term:`Build Directory`. Any intermediate folders in the pathname
> -            must exist.  This next example creates a :term:`Build Directory`
> -            named ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
> +      -  Or provide a directory path and specifically name the

suggestion:

Or provide a path relative to the current working directory as 
:term:`Build Directory`.

> +         :term:`Build Directory`. Any intermediate folders in the pathname

suggestion:

Any parent folder of :term:`Build Directory` must exist.

> +         must exist.  This next example creates a :term:`Build Directory`

s/  / /

> +         named ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
>   
> -            .. code-block:: shell
> +         .. code-block:: shell
>   
> -               $ source poky/oe-init-build-env mybuilds/YP-&DISTRO;
> +            $ source project/layers/openembedded-core/oe-init-build-env mybuilds/YP-&DISTRO;

question: do we support absolute paths?

Seems like something we could add a word for here? I think we do but 
I've never tried.

Cheers,
Quentin

