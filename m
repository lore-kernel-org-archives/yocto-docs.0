Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE89D0C85D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:36:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56810.1768304177462920005
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 03:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=beqw61oW;
 spf=pass (domain: cherry.de, ip: 40.107.162.39, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7Lr/Ap+WCAgdscCbHVRV9/GH0h58XdqjJvtWRzef4S0HWhVnTDto16ybXOLpd4KaHLwIM3cRBh/TfElWDWiWvzT2OcKd7Vq/SIC8cYO68aznB9AnxtalMcC1h47MFYvtLjOfMxCtDVT3OBcP3iIx0oXUrIRaMIHbiorCJFNEJ2cSFLNZgKL6R/Ux6jgSgjlK9CvH1H2rjEWtzqVAReqFxCLBcULzdAHClBOFZ56tzc8dBqmkJEFgaYTFm42Y0Ld3o4BO/9enTE5c88USU5JIBIvXO7rJE+KCOYlg/vEZI8iOB8AgoZjnCbtw/JubrSOB2AfPShZWQt3PUjG7kLtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB/BZ9CPKI5QzN0C1DYz5eZeidJoNInMHPbX2FqKQL8=;
 b=GZXpTWhcBSqn3I5Nr8Q3K66P59nCgbF0m3gu8CwT7HjS8GR63tGRusxURiiFtrbgnlPDl8m9450zY00z6A8i7AEbz2ESoQbbUFWncJ12ojTpnfdE2zPxe9FLK90VpHyndk3/paMEsUf4gBJ0MpbC9YtI1/G3/XW/6THbe2hjOm6gHZl+MY0/ENCD9S0hMJQKQztxrBncqfQz9DqXUqllEClBfGepAiwg9DS5LgHZCum7JvVEAE8pZBIHhto+aBAh/TwZXihcGyhPpkeeflRsc0f/rqAMUgmWoT/iuk+/EsH463MfjWpLFKary90p+gTZ1T9jN63Pz6qg2Go3xtTnyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB/BZ9CPKI5QzN0C1DYz5eZeidJoNInMHPbX2FqKQL8=;
 b=beqw61oWnz3FsDDKipvq5cM2YM84kF6nLoJQt6PmMSF9CuzYPO1NsML1IYcJKHIWsL0ruUNlZ+jqhr2nYuhO+yEcchAbtN9cGlukAT9MrkeeN+2xVF8jZ5wUwP40S3pq2zLw9KfYhBjxOrR8GrS9WvO8SvdeVAcQ5S6KRIADHrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:36:14 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 11:36:14 +0000
Message-ID: <1563864a-c8f2-46c2-9b4a-cb0b0b5700db@cherry.de>
Date: Tue, 13 Jan 2026 12:36:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 10/53] dev-manual/external-toolchain.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-10-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-10-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM7PR04MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: d02f6a74-2a4d-43b6-b1ae-08de5297f50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmN3OUhaRFVPNlVSSDNpUDJPMzhKTVVPa2UxWUd5UXRxcWM3Q3VaNVdMWEsw?=
 =?utf-8?B?dFJvQTlCVWUxOFZDWkxvTnVzUGdva0gwdXZmSWFxdHNlWm8renQrWmozZmVO?=
 =?utf-8?B?UFhEb0dsOStUTThHVG8wb21EQ2NmQ05IamhNaEdZbzZPWnF4Wi85aW12NWpM?=
 =?utf-8?B?RWFISkgycllOQXp5c2NqcEJvU1I4dEpXU0FLeEJvamRwNzVQdFVyU0h1ODFH?=
 =?utf-8?B?MVF1cGF6T25pMXNBV1R2ckRHc0grcW9ZODlPQ2ZtbGJkM254Rlg5b3RIMXI3?=
 =?utf-8?B?Zm1PT2lqSVZnamhrSkRnYXk1aG8rMmV5aWJkQ1Z5c3oyblorMm93SzZ1V0lV?=
 =?utf-8?B?WjV5TmxWcURhWDc2WkJrMGIwcG5oYVhwY25MS1JZRDBOSkgrTlhlOTNEdmZF?=
 =?utf-8?B?Z2pGdDE0U2M5aHc3eG9EMkxoZ1hkNU15cytBaWpZOStCNXROUG9Gb1JranVX?=
 =?utf-8?B?eE9yVjhOWFd2QlEzamljei9WaFFQNFdNUVZvVDYwUkJENU1VbFZUYWhxZTgw?=
 =?utf-8?B?SDZubDZ3d0tsMHZFazdVenBUVnVneExHRkVOK1dmQ1EzdVF5UW8rNStkVGwy?=
 =?utf-8?B?WktXK1hxNjdPYmlVbjV5T3RzdHJXWCs1Z0V5aFcrSXcrN3JmcXdwUTZOdkVZ?=
 =?utf-8?B?N0xBVzBGU0x6QmlJN0VuR2pIWTBnUzVpN3pGVTJUdFQxVGtRZlA1ejBhclky?=
 =?utf-8?B?WG5rb3ZYdjFiN2IzcUY3NDRST0xhRmFMVjF1YmUyTGJZUm1tRjl2ZUNOYnI0?=
 =?utf-8?B?U1BBdjdZMi8rR0FBTk1HZzhUUDNrMkRkWjQrQ0MvQThTeU1CUFpGNjlMVmJE?=
 =?utf-8?B?cXNDME00dDlkWFFLdml1WEMyaTNYZ1drOGM2Z2IvSTNpanN3aXB0SkdtMlhL?=
 =?utf-8?B?Wkdpb1ZQb3NXNDRhQ3pvcEtBZW5vMVd6SXZWdi8yeE9MWlRUZjZ4K2d5S1dw?=
 =?utf-8?B?c3FwcVpWaXpmU1kyV0NPazBla3lldi9MVWlsb0RiSjJQQ3BXNUswNThLTGJw?=
 =?utf-8?B?NTdiQ3ZOZE52Zkp5YmlzOEVsM0lmOVFaMk5KZGtoRVdJcFNUcDRwcnlrMHQ3?=
 =?utf-8?B?RCs1YVp6THl3Mk9lRTNaZkprczg3SjJ4eFVZOHhoV3NVT3dmVWg2MTdLM2JH?=
 =?utf-8?B?azR6d3d4NmVFMTNSQllkTlErQWp0YjFVbXNxUndEaktVK2U1cXpaNmZqSUJ5?=
 =?utf-8?B?ZEl5bGt4SnZROHFzMk0zRHA2Y3hVeEJWK3phWHhyUEpJVXpYdE9OTVBtcmVq?=
 =?utf-8?B?N1lDd1Q0d3ZIUUtSaGprSGVzMHM1Z0lvck1WMW5qek43c05CYlZjYnkxSHNB?=
 =?utf-8?B?TlEzbGdXQytXdDJvd1liYnBIdlhFMG5JNEFISEhPQ1V3THRxUkVHeGlQVktu?=
 =?utf-8?B?UjRMYitaVHl4cWw3K1JYcGorUW1Vd0NDR3RjTnloSXUxWXVjT0hKZ2hkSnkz?=
 =?utf-8?B?aGtqTTl1SHNaRHJhNG04dEpCQzJTV291bFdmQzVGUStVTFlEVW56czZmMGE3?=
 =?utf-8?B?QzIvV1BoMHUvUTBDbHI0dG5MeFhGeUNxN1hVOUErMnk2WkZPY096b1dpL3Iy?=
 =?utf-8?B?MnZ5dldMUUltVjNoLzRNYVBvWlh6VUVNRERtWVVKWElhWVdadEwySWRTSTFZ?=
 =?utf-8?B?NXJ6MGwyOXd4YTZyS3JBK2M1M21SKy9iS0NDaTZXYTQzNGdSVTJkTWF4bTVS?=
 =?utf-8?B?RzdnMzBUUzJYd1lwRjA0U2I4REZqOUEzdzVyR3o1VSt4Z2dkRWRNZ2lwNzlt?=
 =?utf-8?B?bE1QRzlpaHl2cFU0Sm9mTXNGNDJZWDIvYmljTUd3STgyZCtoaGV0d0JGY1oz?=
 =?utf-8?B?QmRqSDVFR2I0K0pNMGpDb2orbDEyTGJXK1dLOXdGNk1PS2F2QjJ0dzBiYjBi?=
 =?utf-8?B?d3p2dWgxOXRUM0ZHbUNLeWFlMzNvQ1NOb0JHU3JBa05BNE5LSlZnZThvU1dX?=
 =?utf-8?Q?nlbrbyHQQKY573KxnoXUwKNJTzeRrpkX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDhWVVQ3aURhbE91V0p0WmxyNXNicmRZcFM4V3V6WitaZm55M3BsdzNwam0v?=
 =?utf-8?B?d0tpNk9Rb3pwMzhidW92MDhHUjA4M29vMG51N3RXY1AxOFpoVCtnMTR4RWRq?=
 =?utf-8?B?dy9HdW42c29BdTgrNFVsVWhLYkdlSU1uWU1wOUw2MDFPalZkb3dWMHNCMWM4?=
 =?utf-8?B?dGRsNExyWWxWWExPNitPOXVBaDhEeFZqU0NJajhpSHN6Uy9YelNhQ1c5WVhl?=
 =?utf-8?B?M3hiUWpYWENlSmRxSDcvWnI4blIybjZGZkNPNlJhSDFMUnJFZm83aFBTeitx?=
 =?utf-8?B?dDVoZnZyREdsZGJxMDBvT2ZsbXpLYmR1dG5meXhLRUJTTnZEQnVnS3kzQnlN?=
 =?utf-8?B?UUVWZGVRWFNhb3l6VVVwNzZnK2M4UWtJaDNPMFB3MnNvem5UekdkaVdXZi9Y?=
 =?utf-8?B?Q1FERVNnTkl0WmhIWFVMbDlwU29aMWg1Vld0anVtS21IVlc4bkFlVXFiamtm?=
 =?utf-8?B?eVRlSTN5bUw0OWRYK3ZuUXlTcGVxdElFMjVIUDZFKzY0WnI5WnkxSmJxSXJn?=
 =?utf-8?B?RGdtaldXU0RIa3Z3eFlTYWhXOHZxWWxFVWl3TmgvSE5aZ0Qwd0U0S0Z5b2pZ?=
 =?utf-8?B?dU42ZjE2TWpya1oyMUoraGVkTE5oWS82TmFabnhiNWlkMitoYUhVRzV5U1p1?=
 =?utf-8?B?OC9tSlpwVXYxOEFHSENmNms2U25oT3Aza2pmdkxTZW1iM1dyc3FlcXVhTGMy?=
 =?utf-8?B?SEo0Wm4zYmJqZXp6YVhqRnZoWktEUnNES24yQWt6N2Z6d2doZmJjdW9hU2w0?=
 =?utf-8?B?dTZSbGlwSU9KVVUvZDU5L2QrKzVjdXd0UjVqR3FWdVRmVGVUak8ybWpNUVFs?=
 =?utf-8?B?ZXE2ZDU4bno2T09naTFMUWNxelg5U3dmNUlSb3VZZkN6T1BUdTlGaWYvKzRr?=
 =?utf-8?B?MDQvNHBuM0U5L3VZZlhsZDB2a0d5WkE0cE1STWxYc0hldThwcDhkZTk1alVP?=
 =?utf-8?B?Z2ZWcjNSR3h1Q0l0TmkzcmdkUFBXVlRRd0w0eXNSMGY4Nm85azIwU0VxK1hT?=
 =?utf-8?B?WHRKZlVTQzFHNHZlVG9OZ3ROT0kxNHZaK3phTlhqQUNFY2c5TVZGWmJUS0dU?=
 =?utf-8?B?UEwzanpjSzgzMCtjVWFNMDB2b25Pcmt6eUdkeUkwM3U4aVdQZythcmNWRHRi?=
 =?utf-8?B?djhraHl6MDBMZUZiZHB3WGJxOVNBQW83NzluNlNOOWJ3MDVCaURFc3JJdlB3?=
 =?utf-8?B?M3pQMEpIWkwzdnJZZ1FWbXR5ckR6K3ZIbGMrdVNBM0V1RUR6c0FuUE9ySTFz?=
 =?utf-8?B?UVU3Rkw2NC9sbldaV1ZDSzB5UW84d2ZObGs3UmlHMXZOQUZxbHBNc2U5S3Qy?=
 =?utf-8?B?NG82OWV6YTVsbE5qZVNxYVZkOW1Sc3VxRWtlcjI5OVp2Q0RyeWxBQ3dMa0hC?=
 =?utf-8?B?RFdSWTFXQ3J3enJseDNwTmZ5cFN5MDc5Wmo4VVNEQ2MvaXR2NXhJYkF2MTJs?=
 =?utf-8?B?MUw1N2RiMUFLNytMa1IzeUZWcGN6N3gycVdXNXNsaDg5REtaaTF5LzFOZWdO?=
 =?utf-8?B?UEQvV20rTnFXbEEweWNvYUY5QVJXdXBmT1hBWWRHYTZyOXEraitkWlIyeFFB?=
 =?utf-8?B?d0M2YnBXc1dmc0ZuUUFoTXhhT2ltUW9JMDNPcDJJbmlXdEt3Uk5PUnN3QXYw?=
 =?utf-8?B?ZG9LSUE5VGtVdlJkcVRGRnBmUmZzRXlUQ0FVbmMxMEpEeFg3dnp1cUZLK0xG?=
 =?utf-8?B?OUt1aHl6NUFaNkxWa3IzdDVFZ0R6VGs3YTkwZXRpRE9HQ3hoTlIzTFB2SHd2?=
 =?utf-8?B?RVRZMG85UFVmSWtRUktBaTZIOFR2ellUWm8zQmdObC9JTWh3b0QvZFlxUnpx?=
 =?utf-8?B?cTNjOGlmdXVKSzdIMFI3RWRMZHRSUUd0dmc4d3NRRE5CbTUrbEhZSml3Z0VX?=
 =?utf-8?B?c1JUbHNDcWxBU01lSXJjMENzaGFlVkRCbTVoZjhiQzVSakd0SUZqSGN6UWdE?=
 =?utf-8?B?SEU0TUhtelJleVNxOTIzMEpENG54TUFuMytRNmhsRmVDNGZYWGJNUDN0Vkk1?=
 =?utf-8?B?eDh6L2lXdnFVV0orL0djaTdmc0M1ZW84T3ZJZzRzU2E1WThGSGRHZEt3TlIw?=
 =?utf-8?B?a3BZcFFhem9TSWsyYUFHM0VJUU45QTRFd3N4bm8rYk5YN1JZVHdGVDRnRHFW?=
 =?utf-8?B?Q09QeWlPV2dHbWc3Q05HenNUNDVZd1ZuUzBqRFpRd1RhS2hVa3pRSXFtcFU2?=
 =?utf-8?B?MWhna2NWbmRQZzhnZDlHOWVDN2dHZCttRkxPazliNFQ0V3JSSGw3TTI4QU5I?=
 =?utf-8?B?TE1heU92YnhUVnJSOVA0d1lMVjg4UkJ5S1NKTmdjQUxQMERnZFJNSk1aejNW?=
 =?utf-8?B?aDFmRFk3Sm1GUTROU1JKZ1JlMmVqUk1WRDJLSG9KbzV6V2Y2M0hiQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d02f6a74-2a4d-43b6-b1ae-08de5297f50d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:36:13.9216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tf1Hxm5nt0ys9KlAzJnzqVTC4x+APowFDtBUazwA2gVnXuO+74W9VXhlNIpfQJjaRUCB8/nTmwWSBEXyw80FCtWDYSP/JDZhzu+omBRlbbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:36:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8491

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove the single poky repository reference in this document, after the
> poky repository was obsoleted.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/external-toolchain.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/external-toolchain.rst b/documentation/dev-manual/external-toolchain.rst
> index 238f8cf467..29459ea120 100644
> --- a/documentation/dev-manual/external-toolchain.rst
> +++ b/documentation/dev-manual/external-toolchain.rst
> @@ -21,7 +21,7 @@ follows:
>   The toolchain configuration is very flexible and customizable. It
>   is primarily controlled with the :term:`TCMODE` variable. This variable
>   controls which ``tcmode-*.inc`` file to include from the
> -``meta/conf/distro/include`` directory within the :term:`Source Directory`.
> +``meta/conf/distro/include`` directory within :term:`OpenEmbedded-Core (OE-Core)`.

Only one tcmode-*.inc in that path. Odd.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

