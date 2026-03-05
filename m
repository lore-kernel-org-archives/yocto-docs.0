Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A837F3093B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:01:01 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41869.1772708452894925972
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 03:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Picv7Tjn;
 spf=pass (domain: cherry.de, ip: 40.107.130.20, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvHIsKvcpSQb+4QCxGoSidXqCdZ50CWYwlxngPVoCVrwdzOSQJ1aX7xVzo4+bofCQo3nvD0x6cWmGEZxUofMxHzwtALHbVzhYDfTy2zu7KaZeD9epXxAZLbUIAGU/lRjTFPIFNpUvU8aDOYdUP3DnTFDSue91dBVhJ4QkSUROI4EjXqycpttzHERyXn1VftDMPJ73lEJluSX2nrEE3CKPmh1rPcHV54POvSC31IMgbb5qDHlTFrkOmq7FN+goUWk3zJmVmgdJgoweIcs+4pRD3Opm+6TkkMC0ChiSAJlIPDpfwzP5MbatwTv+aYpwOYKkk/yapvK+dn0V4ey4PI2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWGC4MX0Ixr6yjePUGgCJ7uz8TULRp951UFRneK3BD8=;
 b=WeBYbQjGFDl1S+15Q3yI8oy9PlngM9KkOalUbxgxmF4DVNYyGVogqxJAXutYu3b9qr7izyofywr2jDvjrIcfAzhB66MgvHjubsy/5u5NJTd9eCQ9eHEprG4pRMKtoYNx5S4J2eNRFI8qFjzuQA4ciH8H++tXjVTRNLjp8edLyZhcZvvd8A3kI2X2zRHGT9nE0tbyQnkZLUogiM4wEUBUSkXBoaKb8sgGBLxNkZhftLTEAKXvmKJX82Xf8rN5U/dLxWyGJsdo3nGs2PQ5n5eJGwF5GyGSjZsO6QxIVtYwB4SwN2bl8wm/U5RrPzCyxQgomHQhtNzF2KPs1WHnkmO08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWGC4MX0Ixr6yjePUGgCJ7uz8TULRp951UFRneK3BD8=;
 b=Picv7TjnVtY+wpw0R5iyJI1ruAN5l4QR/MTpqpxaquwqHUXuguV1OW41IOaqZVwlfKMP7FO2Hke6aHnQuXv3NeoPxfx5Nz8i8jqJ9Z+fuBgWCwzYO4v2mfudwhq+yM+MvbnzPcu7AiM6AVcCid3UfvHfYXxnIssq9zhKw+lq0FQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 11:00:49 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 11:00:49 +0000
Message-ID: <1191bde0-4879-4d5c-bb6e-8a8b46727f7d@cherry.de>
Date: Thu, 5 Mar 2026 12:00:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 5/8] ref-manual/variables.rst: document the
 SPDX_CONCLUDED_LICENSE variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
 <20260302-release-notes-6-0-v1-5-9662dee58591@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260302-release-notes-6-0-v1-5-9662dee58591@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: e1933257-b4b8-4026-2297-08de7aa675b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	+A1x9EZ4rZY1zqGH/V8wDLAY/pWvoINVBJAtmWWTvmNu71wfkxRl+4JN9lqHREe2QqQxRuf9KsmB5u2jK5Dzz3Fxl8kNxIAixdtk6AETlqT/IKCRplIU9I8cIlOYOwKWoRgJGg9d5YD7buKglX3N+P5IU85XSbI4PGn7FJzw68Dkf07dwmLxmB8FdwuCS8f+3NRDHsZX2eeKcIG1NCJYogyqZ+gzSGtgCms/aVyDsiLFk3lKDZ0DJO41PuKaeQimCGu3vp3oVDxFbzjYOESHbZrLmpDniVpbZbyvZIAw2B+X5HAbiLK77uKhsPN8AIJElyfCoUtpGUKCUl1GPPpbE/gAKlj4xXd8gQMQ1I4oA4aRlH9tiWK3mwq68ZdSoyMrqfjjt+qq496REG1WX9PekzSbtfzX4Mfk7CrROyW5psiiMJZaCoo3wH3gytNXrhI35J5LQ5d52Z++4a1yb2F4NafTpENqqy79Sj9Q/9zOrKF1g/PAbhJVtqU2Onr2vE7nc1Kr/lEFv2xGVow9xd/yIMrUTvbEQsntpb5GN4X7JVVeqNgF0h5F0y3l+d6ZYwnQHUHC5t6CXM+ACPu356iySttSVXkd3MH//5Tc5zL/o2YwvxiyIUA+A2I9UW0MgxAzVLHVcqGItQgFgC2RGbw5Y11XmDUVnE0oPfV62LKPp1zNeoKlS4S/ST1UdsmEq/7qHZS83sSNfD4uYy+qE9fuJg2HBSbrrMq4vT6cW3UaHXo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QzNDMytyd0t6TGhXNGsxQ0hVV09LTWQxYUdDUitpUlA5UUg0QzYrTE9pcVNh?=
 =?utf-8?B?b3RpM3dsUXlXdkdSYXNPYjBFN3VsbURIYkY0dFVDd2xSYnMvVXpCTGZEY0hB?=
 =?utf-8?B?R1NZUlcyS3JLZndUNFJkci8xYUp4VzV6ZVdPRG5Ja0hzZk1DRGx4U0lRR1ds?=
 =?utf-8?B?RXhxaXNUK0JYYjRma0ZIQzVZRVFwRVZITFBaNVcyd1c5QW9sOGdjQ1BzdFps?=
 =?utf-8?B?bStGaUhiWDRUeHBQOGx0eUxZUUlSTmphMWc4L1h1UndmV2dyT0diL2FLdnM2?=
 =?utf-8?B?UWxPYkdEeHJWc2paS3AxeEJtamU0elpJeE1lM3IyK2VQNDh4bTE5S3BOazNP?=
 =?utf-8?B?WDJqSTF3UXRIeUtlRWxncEdiMjl4TkhUbHVhTnlSK3BOSGxqOTcvb2tPUGJu?=
 =?utf-8?B?MFYvcFRnL3UzWUQyUi9JWWtzcG9qa1hCaWRLNW5SeXFvTXZ1enp2dmNaN3U1?=
 =?utf-8?B?KzlLTHI3MHptRGo3MFpzRjVlUkFPaUFyeEQ3dUFYQjdoR2pHM3JWb1Q2Y1E1?=
 =?utf-8?B?Uko2a2Rpb3FjejZRZmlvMXc5VFloT0pQdW1ubFhYTmVCb1lqTHZHQzUvNlRk?=
 =?utf-8?B?Q1E5eHIxT0pwYjhMM0taSnM3T0gyL1duNEVzL2UxV2Nld0szZGU3UDUrak12?=
 =?utf-8?B?ZE1EMWowVGFYa0pZT1JlbUFKZGxRQXVSemZsWERiTzUxbjNvTEFlNDNtODZT?=
 =?utf-8?B?WmlrOFdVWVdTYXdnQUUveDNueTlrQi9RaTRFaEdabGZnQ1AzQWZMeG43WXFX?=
 =?utf-8?B?VHVTcUs1U1krc25tSk9uaW1PUUl2OHdwQXdjNlpWVFFuai8xWFVldTBVUkpT?=
 =?utf-8?B?dU42NW9yWk5iNmNRendRSjNIWm5uMG0rYUxXeEdoYmI1MGFDR1lGWnMzS0t0?=
 =?utf-8?B?NlVzSkQ3dDRhNkgxVnlDTWwxc21iSDFUbERMcWx0L0dpN2F0Ym1QTHBBRXZK?=
 =?utf-8?B?RGlkV25DVXpRc2dFSm1XQ1RrSFhjYTZZQ0xFb00vQ0NyZW1lWWM1TFZVejFa?=
 =?utf-8?B?UDd3NjhCbjJ2NmszQmJTMUdLTTA4a2JXT3d0U21oQmt4MTNOOWM4TmJlclEw?=
 =?utf-8?B?dC91WkJ0YlZLT0FESjNkV1R1NHF2SUhQY1gvRkx0RWxITFdENFdVTDhsM0xV?=
 =?utf-8?B?NnlRblhyZjVHT1Fqdm5xVzhhdlZKWjBtL1lUMDdtaEdFL293RUJmMGF0ZTBN?=
 =?utf-8?B?c2s5QWlmSVlKdkJWbGdGVDRGZmNJbnNVa0M5UHpNUm83RXFJZUZVMmMrOC9z?=
 =?utf-8?B?SlJkbmZTMFpoUjFxelBhdFppMmg1MWduRDFYNzBnQ0hRbXd4WS9SUWVVQm1j?=
 =?utf-8?B?M25aemxCdFYrU2N2TkJGTzE5NFZJbVRSVXVMSWFKNEFDc084WjFDcGVHTVZu?=
 =?utf-8?B?azhTV0VtUTVKWm1qRitXaS9sU0RYa01uSHJab1Vublh5R3JXQzllYlBkd0tj?=
 =?utf-8?B?clM1NXA2dTZGU1B0WGoyN3RlT2R1ZE9MR0pQWllKTDltUHlyczZiU3hIYlNs?=
 =?utf-8?B?K2J6SkFXQzZZekFkWjd4WjBpODNnN20rTGVraW1pOG9Ja3ZlNUVSbzEvYTJO?=
 =?utf-8?B?RVFaaG5wcS9qSkRhekhpNXhZcHRCOStJcXhSVFp6K3BFR1RkS2RhK2J1azZw?=
 =?utf-8?B?MVRYN3ROakhhNmhkR0N0REpBRGUyTDJlODhpUGNTYk1Sb2JmZ3pPMTlZS1kv?=
 =?utf-8?B?dW9rakVydlFPaXArMFIzaGtQemtYRW1nMlhIWUtoK2NyRElJYUt2ZXRjNXZY?=
 =?utf-8?B?THlEcFhxVE0vK1hYTVdCQ3UwTUd1VHJJemxnemh4cFpyV1hHL2tNL21kWmZ2?=
 =?utf-8?B?ZzIxaW5uUk56SU5PRDFXd2dNaXlBQmZ0VEtyWjFDSjZ6eDNmY2krUFVOS1BN?=
 =?utf-8?B?K0JwN05LbDlRRGRoVENMYk52TFgyeHpNUzB0clFndkFpNmh0RFEvRTFXRmsr?=
 =?utf-8?B?ajN5eDhaa0VjcS9GOVZlSXllWmdRRWoveGpSL0VsS1lUWlpFZmhDMDhuZ2hJ?=
 =?utf-8?B?aEUycE1LeDd0SE5vcjhPVHVDN0hrQnlGRldBV2JmKzhhUXZzV0oxQU84V2Fl?=
 =?utf-8?B?bTl5OTdLZm1oZk5GZDFSMmdDSDFRWGFhdEJwa2tkOXNWd1ZuQTFCdlFJM01z?=
 =?utf-8?B?NVM1b2h4Uzcyb1dJY1hmQUdwSWVuc3g3K0JyalUxRHBDZk85d2tyZFcvQmlB?=
 =?utf-8?B?OW11MXRiMERwclh6U0dzNzVpL1lMYTVXVCtPWFViUWduZXR6R1JNV2tDZmwx?=
 =?utf-8?B?VUs3VVRPVTZMdHJnVXRNWmtMNVVwWnM4REpJaXBLVkhoelRPdjFXYlBDeE9F?=
 =?utf-8?B?Sm5ERmZFZzVLKzY5aHlHQnk5aHNlT0ZKZUJncWJKQUtiNUJoMGFxU0ExSW1D?=
 =?utf-8?Q?nf49SVu09OGqgN5VnZfn+Jdful+//Q0U6oCiR?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e1933257-b4b8-4026-2297-08de7aa675b1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:00:49.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaiMY/VdB1dWWXJW2CayXh+LtCcZH7qMXW9e0PQfUJ8FYyxe0lHDd7W+p6+BLLPLIYu5WayR8ULGN7vefnU5UC8UHD0E6Bug0TqLsKbwRFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 11:01:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9064

Hi Antonin,

On 3/2/26 10:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Document the SPDX_CONCLUDED_LICENSE variable, added by commit
> bb21c6a429a2 ("spdx30_tasks: Add concluded license support with
> SPDX_CONCLUDED_LICENSE") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 579faf7be..f8056b03d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9194,6 +9194,22 @@ system and gives an overview of their function and contents.
>         (+ 0.07\% with the tested image), compared to just enabling
>         :term:`SPDX_INCLUDE_SOURCES`.
>   
> +   :term:`SPDX_CONCLUDED_LICENSE`
> +      The :term:`SPDX_CONCLUDED_LICENSE` variable allows overriding the
> +      ``hasConcludedLicense`` object to individual SBOM packages. This can be
> +      used when the license of a package was determined to be different than the
> +      original license string value, after analysis.
> +
> +      This variable can be set in two ways:
> +
> +      -  For the entire recipe::
> +
> +            SPDX_CONCLUDED_LICENSE = "MIT & Apache-2.0"
> +
> +      -  For an individual package produced by the recipe:
> +

Inconsistent with the first item in the list, this should be ::.

Cheers,
Quentin

