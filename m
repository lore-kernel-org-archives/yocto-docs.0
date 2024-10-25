Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DFBD0C617
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 14:20:58 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.78])
 by mx.groups.io with SMTP id smtpd.web10.13117.1729866055741395922
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 07:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=e6REB+Ks;
 spf=pass (domain: cherry.de, ip: 40.107.103.78, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbL45ERy2m97gOREURJ1f+6tUNDfD8MkEMvQgMnVKmbvVlY1NnkP0imUque4cbpHVRD+QuHvNthqNOixXFxJTfTOad1PvCYANEAA3ntMXeoEeIU8fqhFTNjVud8FPbin+Zx6yRf5RM7EsiD8PxECp5BB/6Pjpe9YVc9qp0MYe0R4APD/dJ8ZpDby4N6mWEwyKpx8MrHwYhsfXYAxkAuYuTfMq2ys+g0OlBgTB35rRzmiSAtBa0mLxNQJB8RyY4cfb45oWqgCeI6VHKYA8QMr4dlZzHh4ZVSiHJWlg9sfsXkYdbgM9Hw1ZMGCY4Wgny/YH3eootbbKcJyyvfJUTEbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvGgi4Ez/uxruPrKfusfVxvFz1ewXfk5dBGxmkwqQBI=;
 b=Z+9OLd5Ey8hi0uSZ/VIftzyfyTdsRmYBJH76xXFdWyC7xFDeUxRLwRaDjDDHBYWXJ/vN1TyeLQvBG70AVxMPeWrjkZw/mCICwbpoaqPX6hfNXFRdK2//DBJ0s5ZiLHyC7zbdGE+49iWvk9kG8n7O1rGqPe29c+geqy2IOCsqW5PLxfZ711fVmi492hF7d2DjyymAfzSUv7OsQUIx7CsLX/3MWz4yPdEvQq4VppZYZQIwsZwQzdVYkp4FnnEnqR0soBGX33mbm+2pk8kWMBDMxwD3tX7k87Wm5m4w2XUwcTpitL+bEGcyHzokmYuxrjZMWbcEfcBOXiLkBbNEdFgmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvGgi4Ez/uxruPrKfusfVxvFz1ewXfk5dBGxmkwqQBI=;
 b=e6REB+KsAXk5Q5OySmL+a/PDCJbTArrFUxLfK6XKyfcP62IQ9v11JnvU3zbiDGHGQmlgQ9V4/2yDqTWjV7IamMmKbNcG4T+UbwNdRJG4fKi6RqPciapzwHQXXq2bS5gHDYfimQ8z00BZWUnNiZDENTjA8syI849J4SdOYc3Zv4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB8001.eurprd04.prod.outlook.com (2603:10a6:20b:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 14:20:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 14:20:51 +0000
Message-ID: <25989d57-3375-4f53-9a3b-8afb28da2e43@cherry.de>
Date: Fri, 25 Oct 2024 16:20:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: update current releases
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241025-update-switchers-v2-1-290a6c777a68@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241025-update-switchers-v2-1-290a6c777a68@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0284.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4118d7-e78c-48d1-025d-08dcf5003a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TDU1Z2pVa1ZwNHh2M01zeDg2MjdJd05hS3ZabTE4TTVxc0NaWU9ycUlQM055?=
 =?utf-8?B?SndPUnAzYngwSjN4c1E4U0dlOEZURFpFcFhWVHRnSHVDT2NuNVU0NEpLQlVT?=
 =?utf-8?B?eURoVXRHVHBRdTJQWlpsQjVKOXdLNll3SDhJVEw1MzVMeUpKV3ZEWDZDVEFj?=
 =?utf-8?B?aUc0UXpnRGt0bFo2cE43OFZjVnRSdkFFSXcwVVpmT0VqVXBpZVpBNFYvK1FR?=
 =?utf-8?B?NUNVL1oxT0lGOGEzejZOM1hFUjEvVVVXL3NiT1JQaHVnU3hBcjlnSFpGVVgv?=
 =?utf-8?B?Z1J0S1EwbHVDSXo2ZkxzNDFmWnNkMUtESEFXQ2VtNDJKQ2Z3WjZoQmRxNVpx?=
 =?utf-8?B?ak5MUFRObWZKOGRQblRnVkJmL2kyMzFLU2NYNjUyY0wxdUR3MDlPVkNhV1JH?=
 =?utf-8?B?N2IyUlRzNXU2aXhMM2RsVllRdW1JSGord0NVZzlDMzZEQjFaMURXRW9KYUk0?=
 =?utf-8?B?NDdTVFBSMEtybmtXU1Z4bkhDZHM1ZEFqMFRyNWk0ZFlSOHhhc3lSSXB3RXp5?=
 =?utf-8?B?RmZNVmxnV3J3ODAwaFZWbVFhNWwzWS93WEorNnduc2xMWHN2Y082cDFYU2xQ?=
 =?utf-8?B?S3ZTTUhSNlpTSXF1by8wUjlpOC9MVG5xUDdmUkZPN1BudTdOZTF2NlNOUWNP?=
 =?utf-8?B?SGRhTVl3UXM4SGtLL0tlMGk2dXlUMy9nMUNhNitzODB0UDRnOCtUeW5KVnor?=
 =?utf-8?B?WHRVb0VidDRTcms1MGxJUnI2QTlUSFRYaUF3WG1jckpGRG9mUm42NzhuNFBh?=
 =?utf-8?B?OS9jeG4zVjJ3V0RSR3BCWElNVjdWMkkrWWVzbkJhYk1HbWtSdnMxdDRtQWtV?=
 =?utf-8?B?MXNOWkQvd3BhMG0zUHZ5MmJITGdFT0cwOThDUVRlSUxHN3NlcmNuWVZqNWZl?=
 =?utf-8?B?RjNKQlNFZmxsVndCTkRqY2RpcHg3VFVnWjhLbTlNTlNucERNZFBnam8yZjlR?=
 =?utf-8?B?WHZGY0swTHZ1NU90TUFPM1hYa2x0WjBGQlFYaFhpNFE0bkZqUVczR0JpUWhh?=
 =?utf-8?B?NElNeUo3WS95QnlVWGhsQjhHQ21JNlhaOGdscEVnTThkQWgrYVpVNHpyNnRt?=
 =?utf-8?B?SFl0MlJLQjJsRjRxYWwwaGh6WkIyWUR5ZWdzK1ZyQU1wcmNnd1BSVERQc1JG?=
 =?utf-8?B?YzE1Zlg1VmhxellrSEpWTXBJV09TQUZQa0ZRTVUxOHdtRjRXNTQ5ZUNxQkwv?=
 =?utf-8?B?YlR0Y2w1REVWM1BzQzVIa1VxTDdBWFQ0TllWb01SQkhleGxtSGhOUGV5bHlS?=
 =?utf-8?B?aXlUNDUyT056YmZzM09HNTRpaUlJS2F5ZU83d0xPOTZGRzk4RTNQZUdNSnho?=
 =?utf-8?B?c3NZRGNlekJ6L0R3cnNZTkJmaHlrSWJnRkUrdlFRdzJCNktva1c0Q3ZvYnBw?=
 =?utf-8?B?dHhSUkZsOU56elNoM1JVcmNCZ3Y5SWp0RWhlcVJVQlJJbFYxeXZsU0JIVU5H?=
 =?utf-8?B?ZWM4VkFMN2hvYzIyZDNyQzlWeXM1VkhKanpxenNRb3d1NG5QYmVJMFQvUkJG?=
 =?utf-8?B?Nzk1QVV0eEtGVjU5OFpqeEwwMVMyZ05DQ0Z1VjRQZ2F5MzN0UEV0SXJPNE5M?=
 =?utf-8?B?VFpFeG1oWlBBOW41ZWVFNU1mdStFMGorcGRlc2Y2MWhKd1p3QUxxaGhzWDdE?=
 =?utf-8?B?U0dGRFZZc2EwY1EzdFNrT1ZYczJzdmRuOUIvUS9TYWlPYkFtT2xEbmZzSlhY?=
 =?utf-8?B?MzZvTzF6V3BsSmIwRVdvelZyV1B2S3haVUVOb2ROclozbWZKSm9UZ3FRWndZ?=
 =?utf-8?Q?VX9UO4qyyot0QSMZ7dNNqRDyUoG6FeTF78GnytR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bk00YkxsVThjWFVFVGh3VnRNbG83aTVBdHV0ZHpKZTB5ZzNxaUErWnBVRUQ5?=
 =?utf-8?B?UlBZK0pGdUtCSWxxN0MrSXdxRG5PZG1ldDFYdFI3dnhHcWpGYnBtSE1NdjRo?=
 =?utf-8?B?UXo0L1lIeVJFOTlzd1o5eXowdDgrWUgxTFFhTWQvcW9OSk4vaTlUNXBjb09w?=
 =?utf-8?B?ZlpPbERvbm5hK3pIaHhKWTRwWGlRcVQ3TWRlYXZYbFNMRjlPdCtiYzgrUnND?=
 =?utf-8?B?UmplZ1NzOE1HQVZuYUs2TWQwZzM4WUl3aVJ3eG80ZWlwNFdUeWFJYWpwZ0hp?=
 =?utf-8?B?Y24ydzNEMlRXZUEzOW1RRkd6dVBzcDJ2TTljOTZnekVsZVBmSDlqKy9kOGZw?=
 =?utf-8?B?OTlEeTRFcm14Z3p0U29WU1hkRXhTZzFhK3hJblpBUDJBVFY0Ly8yU0sraHZo?=
 =?utf-8?B?YkNlNm5mRTZ0MXV2RDA2clgyYWF3VXkvYUpKMy80cllicjZoSEF0MHBEYWtD?=
 =?utf-8?B?NU9KKzlQaTdkc09FUnMrOG9Cc1IzWFFQU0JubGNZYlM3UVI5SDNqOHhVd2hv?=
 =?utf-8?B?cmVnWUJoRE81R2RsWjZyNHNvNi9yY0sxREpHZGgwMDJlblh3YTAyWE9tcy82?=
 =?utf-8?B?alVZVE83L2RrREw4T3hjZnpmcmlUS3daL2VUdlZXaUE2VTRpOHhrblgzK2RV?=
 =?utf-8?B?bHFYZWY5NEQ4NUZITEdLaU5oNmc3K0x6NVVBRksycVhJRjNoZ1NaWEJNTHQ1?=
 =?utf-8?B?N3NkNDRDZ29McDV4bUk1SXhOS0Uya0tZVmhKRnE4QlNkS0paZW1VY2tPYkVy?=
 =?utf-8?B?SndaRnl3cGx0Y0prN0N4U05CZC9SMDdoMzZja2VaeE5GZ1pxVUY1bGF2aVda?=
 =?utf-8?B?aXUreHBQZ3FMRjBPbXVwQytHSktobE84bFU3S3ptMkVJR2dEWG1KUjNtY2h1?=
 =?utf-8?B?ZCszVENHNm9Zd3pRQ1lBWkUrS2R5eTd4WWxqeitpWEZSMGs4RzFhTFg1RlZy?=
 =?utf-8?B?aUwvWkFrd0dlU3JaSUpMSng1TWgzWVE5cEYwVVdhL0V1QUZCeHFCY1BzRnRs?=
 =?utf-8?B?cm82UWF5d0JZRkVFSkxpQjJyRGJHNmMvNkpQM3ppNXBpd0s2UDBtWTh2eVFk?=
 =?utf-8?B?bXM3S0tEQ0JQQm9nVlBGcnFFZWhmejBnWXFYa3pzQ3NUeko0SjdLalVKbnUy?=
 =?utf-8?B?S0FueW9FbWMzSURiaVZwQ2Y4Nk9WTmhMYVFhUkI5RWhZa1F1NlBPaFBEcWJB?=
 =?utf-8?B?TUVZUDVBMkFWTXR2aitjdzgzeXJoZ3BFT2FNcEc3VVB5T1F1L2s1WTJiVTYy?=
 =?utf-8?B?SFl2MURxN3RidkhmN0tiaEdNWFFTM2dtNm5KK3YyK0R5QUJDckdGZGdvdlFK?=
 =?utf-8?B?TC9TOGcwaXl5UHdDdjUzRlFpcVYzTWFBSzJwZmtjRGRwNXVHZHNacUJDc2Fs?=
 =?utf-8?B?WHd3ZmgwVkVySG5MQ2IxMGtDZjRBRkZvMjd5ZFppR0NmT1QwNVJaY1NmMFBJ?=
 =?utf-8?B?TlRXVmN3SVZtYm5uaHpMaDFzZlJDS2szdVhhOWl5RjZGS2VRVFhha1hzd1Y0?=
 =?utf-8?B?Z2pkZmlWQmc1Y1dUallIRU5FOWlJQndkQnAxbFNCS2tNZEQ3QlNhc0UvZm9V?=
 =?utf-8?B?aFVsNituUGJkQUs4YzR1di96aW9MN0Z1dkswTTVQZlJ5MXRvVWtweVVVYTRO?=
 =?utf-8?B?Z2U1OC8xMXBseDRmM1JCRFFRdGtlL3FIbWI4ZFZXSmIxdHZVN0J1UzZoSG9p?=
 =?utf-8?B?cytESXV6YVpCVTd1NnkyM1RzVCtWeTdXR3dtZDhXaVNOd2puNlE1TGNOZHVj?=
 =?utf-8?B?aGovQmlOMFRKaVpTYTRZbmZ0OWtpWjVSVkR4NFliVzZhdVdmY2J5cDUvUDU5?=
 =?utf-8?B?Q3F1UzNqMWQwWWVqSWhoaWlxVXFjQXgrMzh4QlpwK05ubmMzWFg3dlVUWm1K?=
 =?utf-8?B?UEovc0gzWnBpeUNOcm9jdEx3SkNHd2dkNEh3dEJpbEQ3R0N1ZlFZZ1VsY2NQ?=
 =?utf-8?B?SkEyaDRsWWd3QzRTcDV3T2Z4azFiVk1BRjJDT2RFZndyUzJuS1hOSE90S09E?=
 =?utf-8?B?dzMyRXZXZ1JsMTFxOVFiTTluVU4xU1FxKzVkUXZtQ0FvR3JyNnprVDRCbnRj?=
 =?utf-8?B?VzdiajVkOXZLdWRPUVVJYkQvaFlzblF6L2w2SlBXS1JVMGMzN2xDUTRCNVkw?=
 =?utf-8?B?WFhSUElmSjhyNm5RRWNEVzRFc0pwU0NyQnROc3UxRHR2M3JGS00wVmFiR0g1?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4118d7-e78c-48d1-025d-08dcf5003a96
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 14:20:51.3060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ULHm/dVdH7DaHZQDmksSRAS7Alh7xpoXlUlXAMtLJNcYqv2ZNt8PKwfIst3gkLv4mZg2d1DSjegneSpYrWXFuj5TXWy7ZnBl+Vql7Ihffk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8001
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 14:20:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5594

Hi Antonin,

On 10/25/24 4:07 PM, Antonin Godard wrote:
> Remove dunfell and nanbield which are not supported anymore.
> Add styhead as an active release.
> Set walnascar as the dev branch.
> 
> The switcher menu now contains:
> - Unstable (dev)
> - Styhead (5.1)
> - Scarthgap (5.0.4)
> - Kirkstone (4.0.22)
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> @Quentin: adding Walnascar as the devbranch does the trick and adds
> Styhead to the switchers menu. And indeed, walnascar _is_ the current
> dev branch, not styhead.
> ---
> Changes in v2:
> - Add Walnascar as the devbranch, which adds Styhead to the switchers
>    menu.
> - Update poky.yaml.in.
> - Link to v1: https://lore.kernel.org/r/20241025-update-switchers-v1-1-5e540ead879b@bootlin.com
> ---
>   documentation/poky.yaml.in    | 12 ++++++------
>   documentation/set_versions.py |  8 +++++---
>   2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 0c04b615eae07e722982ad8808b8d4ff228b5cb5..c770318f2be76cca3ea23a25d819ace46d157b4c 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in

IIRC parts of this file are now autogenerated, c.f. the replacements 
dict in set_versions.py.

So it's likely unnecessary, but... it doesn't hurt :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

