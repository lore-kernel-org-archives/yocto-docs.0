Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9300BC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 11:01:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web11.11817.1741863691678763304
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 04:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HskOSKBH;
 spf=pass (domain: cherry.de, ip: 40.107.21.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nopAroDJXvGKnr+/xNrBaf8oChZTYvjHsATRvwx/HsC4aJh0XLDcqjMGyGj9KwBXoUlxc5qmd2A1nn3qcF5wkr3CKidw06HGaNgHQg3+KXaP+rVPROQr3iu5NEVUqH+DzbYexll+0B0GEYqLnpJVqGCvCVskQsXtwx/frKNlKUnR8NWiz9gmn6QmZ+UDFushE3wXKz1+6ltWKoSPp2YL3wQIqfiAEHwOhGqGWZZMqa/qpF/1yMqEuWioybZ10ILZUbcxNECgDKV3OqO6/AbhhLRuqzRvFxwr/+ILhZwUBFbccflZPXQe2aPMwEMG/WimtKYElWDQNrzE1OqqiDtFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOTmfiLiy6tPWb5gkHI/fqFwQEOqZy1PEXqPWM88sP0=;
 b=BLpFOZdPvx0bT2dMpvnBzMXPEZpJgYgjbURL2UREandTp/dEjdmx6Z91B1NIgptS+r9O0mzj9EEDwYDhQcWuPGBqaM7QeIl0eyNZLUX810h9TMaSlm88GhPEzie7iS1GbgSbtWv/mVc5owxIHhkIsP5aTVM/NULPYlsgzggqcCJ7z1G3jTCBU6taTdUns7NZ13Lr3xBM6kOn7sWrTJQhu0OFJ7infjzfFz/atWRhJVa5dHho5YVJwpCTcOvwquUXNf4IoljDS/K4O1DtaUG/ruCk4gmHKm14Up+6B+EcqSLA8W6GxqBVk9HArCnA4iQyGtykqwdJzsi1wyNpMpPSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOTmfiLiy6tPWb5gkHI/fqFwQEOqZy1PEXqPWM88sP0=;
 b=HskOSKBHT9zMKjkXEBGkh5KYgn3GXLGStfCip8rchboavtpZp5OMgdwxcykeyTseEpZC+hNGk3Te9rYzajzJ3rZWAFfAGQ1QuX7FQCtzbP9l16VzifIj/Ne9VNcjuLLlqbv9LwsPTPELXSiW5OBbTzM89S0c6ygaPG2kZCQsooo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VE1PR04MB7439.eurprd04.prod.outlook.com (2603:10a6:800:1ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 11:01:26 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 11:01:26 +0000
Message-ID: <1dcdfd51-deae-4327-95d0-b1989d503fee@cherry.de>
Date: Thu, 13 Mar 2025 12:01:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] migration-guides/release-notes-5.2: add known
 issue on stalled NVD
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250313-nvd-stalled-v3-1-1ee9b67a975c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250313-nvd-stalled-v3-1-1ee9b67a975c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::16) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VE1PR04MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: d2214ee5-bde6-414f-b87a-08dd621e6694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TDNWZDExUFpKVWhJVkh5MDFMeVNGUk4yVjRJdzRQc1VkZjZyWFJ6YzVNbzJG?=
 =?utf-8?B?aHY0YVlRUUVGUnNoTTl3ZW1KMDRyR096cFhQRjFDWWF0VXUyVVRaTGl0N3cw?=
 =?utf-8?B?elNqSEpITDAyR3Z2dmRZMmxISk5iT1duS2FGR1J2aGFTbmw4enF5ZDF3OG1p?=
 =?utf-8?B?Zm93RTdSbjVzRVhwdzRiaGozNW9naHNaekJBNVBkTU00dW00KzBaZzNmeXRM?=
 =?utf-8?B?aVRidlBjSGRhdlpYdkVmck55UUZWUDRsVFRYTnRkVGplemNZL2dBT2VvUDdr?=
 =?utf-8?B?WFRLaGh2amJQLzNxd200K0hwZzMyaU9Kdk54SENNdksrdTVMMVJxaHQ1R200?=
 =?utf-8?B?aUhEaDByNTJlYlJZTjBYVVk1bWxuVXYxVWo4Z3J3NTRZMmhFSTJkaVVmc1Bl?=
 =?utf-8?B?Q1lRM0lIQXZGYWM4K3htRHZKdS9ET3lrY2Nwa1lQMHNOVUxkUFZUbDBCQ3A5?=
 =?utf-8?B?MUFpVjgzdUJ0U1hQKytTc3N5ODVMd2YyM0RKdWN0T3RYVkI3TzVqVnN5Tm5I?=
 =?utf-8?B?L0tobGg2QUJFOXUwSWlGTjRrUXB0WmpqL25hTmZBQjBleXNwVEprUWk5Skkr?=
 =?utf-8?B?aExsMlJrZHlmbDdGbjNob2VWNzJDSitJKzNadnM3Y0RKUE5EVzliSk5rQ2Ix?=
 =?utf-8?B?OGVSdVpQTG5uTkFpMkVqMk40RHR1azQ1Rk9UZE5wR0hBdzdxeXBYWE9oYzdL?=
 =?utf-8?B?THk5bmdDYnVZL2gyWmxXZHZSdzhxa2RUNWhQVXpHWTBCTnZiTEE0QkNqTmpk?=
 =?utf-8?B?L0pkcElpQUpTeGNCZ1pheFczSXN1NWpTWWg0YThoL040Y1RrbUxONFI2NTVP?=
 =?utf-8?B?WDRGcVV0bXJrdnpOWGtrazdxUVdRZnVrVHBmUzJwYkZOWFFGMWtxVmtEdFVN?=
 =?utf-8?B?RUpucFU3VUdXR0pDN3JmMEVuTmM0QU5SM1J4M3BTQllBaGhERTk3MHFOQUw2?=
 =?utf-8?B?M2o3RTdmbUJEaS9ZVmRvRHdVTC9mMU80ZzRsZHM3U0lDQ01saXJXaGkwZ3pj?=
 =?utf-8?B?Ry9rV2JYUGhWMDNuWU1maFg3cjh4a1FyNVVmZnNtL1IxK2lZeGZpQlZ2VEox?=
 =?utf-8?B?SHNGOGYrOGpzbVF2QWdNdHRWbHpFZDMydkVvWEt5QnVZSXBSajNFWllWdmsr?=
 =?utf-8?B?R2czbVpwRDNLcnp5cnlaZWZqWTlFY0Y3VlZmRmRqM2JsUVZORVFzWUpKQTZR?=
 =?utf-8?B?cHNpL29uTlBoOVJqZ09wcEhWYkJyNlFUWW1taktBTXJaYURyZDFGZTl5elZp?=
 =?utf-8?B?YXZaTE1JTldneWRoWC8xNzdTOEh6b3FhT3prcFJxck0vY09aVGdQT2VhTTRa?=
 =?utf-8?B?WGxtZVFWVWdjSCtTWEtreUZUd05SeEt3eG1icXB5M29GOXZmTm9IQXRscDRI?=
 =?utf-8?B?QmY5aWQzUy9uVDlIVDZKZWt1ODgxUnlUWTIwSVMxb3p3R0E0OURBaDl0NmtZ?=
 =?utf-8?B?L0pEc3NIZmJqa0lZV29wREZLbTk3cXR2WkZnelozZUN4a25iaGd3MjFFVEY2?=
 =?utf-8?B?L2Nod2ZvOWRtUnREVDAwbTNmN3pkTlRyL0w1ZzFnek9EdnFXYkVtNWFUMnMw?=
 =?utf-8?B?bTNKeWc0MCs4K3Fnd2dPNmluMHNNTHNZVzNuc3BheU9YYlk5ZVhIbmNzUDJN?=
 =?utf-8?B?dXFnVGc4azVRNUF1MVQ1M1cyc0ZjSGxGbmNkdmVReTAwOWRpK2RJazZrQjl4?=
 =?utf-8?B?VWprT283UmVoSXRWTGtydFY3cndmcDhHOURwb1NMc1NxeDJab0RzcTRVaXBG?=
 =?utf-8?B?UGhxVUhTbkxXU29uRFFhOWw5TWtrY083akRXMkJEZXFzMXFtMnUrdEFuMFFl?=
 =?utf-8?B?OEZJRHExTVVCR0JSaG9zZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TG85ME94NWV3dndPaEV2TWFDK2xGYVQ2K3FnYlAwaERZd3JvaWVSalZYeExX?=
 =?utf-8?B?YlMvMndkM1l2Z3JNdUZFM0hpKzkrU1p1Y1FtQmU5R2ZUVENmaXAxUXdMcDlV?=
 =?utf-8?B?VVJJS283N0ZjamtFVjZuQjgxVXUvM1ZPS3FoK0J1MzlOQjdqQXpOYXp0b1pn?=
 =?utf-8?B?VkkyOFQyWjZqRVd4SGI1cXBGYWJQYVdBSDlnMVN1QlpFYkpualhzZGZRajdH?=
 =?utf-8?B?VzA2eTVRRkxwRi9EbFY3bldqOHQvTGVybnBDQkFuVHBaRThYYkZLajgrZm42?=
 =?utf-8?B?dXlaeXhNY3J4dk5sTksvSjBpTkNMK3dqWGVrNEw2QjdIZ0J6bzNOMFFDaWwz?=
 =?utf-8?B?L0xlWjY5cWVMeVcyUlQzeFpmQ21MY0FiQ0QzUFNRR2lSRmlmZGpoa2lkODZW?=
 =?utf-8?B?b2xWaXlYL1ZobWdKWnJGT1M3VSs0Q1hGbk5oZVplM2xFbW1VakVYZ0wxVlg4?=
 =?utf-8?B?cDFZOHRDUjg5TG9ZakIyMzZ1eVRXN3F6VGtOdjJ1SWw3WjlzalAvUDhXNkFS?=
 =?utf-8?B?YnNtL1V6SmI1bHVCYmFIWkhtbnZ6RVQydTVFMzZ1eWNNaDRoR2ZMM2J2R1hi?=
 =?utf-8?B?T3dxTHlBSlF2dVp1YjNCS3NSV1NXRXRMeHRSUWxQTDM1RFovMUhXWHVFNm9F?=
 =?utf-8?B?bXAwY0t4SDR0SWRSRTU4VnJjK2tLcmdVNlg3ZGI4cjFJamJjNUYyeHlRU2do?=
 =?utf-8?B?TzdzTkkzVDZValc4WVlTU2xQTHVndm14d3pCck1Ob3VJbDZoVmNKL0Y3NEdv?=
 =?utf-8?B?eG8zKzkweUFpaExCSnI5MGpvamx5L25jRkpCTXZFUXI4bXRFRGduTTJhYjN1?=
 =?utf-8?B?RUR5MjhVUXBJRi90N29tU1E4Y1dhUm9PMnZPL1d2TWI4LzNieWFna1FiRlNE?=
 =?utf-8?B?VDhyU0I0SXNMYnBwODliTGxXUTFEWW8vbUdWVXBuMVVNYkJXb3k3ekRDaDVW?=
 =?utf-8?B?TTN3SkdIQ2tDbWdobWhnTDVpaHF0eWlhcE1oNjZ5YkJJVS9TMUpXY3NkV0Z4?=
 =?utf-8?B?YnZ2bkg0akgrN3plZFR0US9PQm1SWW4zT1FXQkNwMS81cy96eW5SYU1VQUxG?=
 =?utf-8?B?MXBqZTluVWtlR2VUY21FOFNBbG40aXRYY2txYUhyN1VtVlM4WTlwdUtLQW5l?=
 =?utf-8?B?OVdqVjB2ZW9OZ1BXaGNWRkowL0ZxeVdjSXovMjl0aWxiS2lnUHI4TklqdERD?=
 =?utf-8?B?ZDNVbGVJWjVOcVVjSFBKbjhDUFpKakx6Z3IrV1VjTGdRS3JXSzZId0drcGdk?=
 =?utf-8?B?WEdRUGFnOFVzakRYZnZmbEFqRkhOeGJieTlHdk5XdDRTNWNISHNUcUpSOEFr?=
 =?utf-8?B?ajRJK3ZWNHJYUHVMWnRCL0h5aFpRZW1BSWpKNTdEUWwwamUySjJ2U1NWVXBh?=
 =?utf-8?B?dFcvM0RpTjlPQWlXZFJ6ZDdFZTBNM1RSTmhIQkRZK1g0dXZ0WVdrbk1DcjJG?=
 =?utf-8?B?Ty80R2I5bENpTmtQUmRQeEFPVU1IQUd0VEp1SEZVU1liZFQzNktKRjNrbDJ3?=
 =?utf-8?B?TzRkQW5IVzRWVmdZTC9tUDR4anNDQ1N2MC83S0MzMzVLeVNQNGs4Ukp2cXdz?=
 =?utf-8?B?Ui9Vc0dnckJNTkQ3NGxpYWg2a2h4eDErNmFBdkw5Wk5wUjYyN1o0dVFGVmdP?=
 =?utf-8?B?QlBRbE56TmRVcDJzMjlwQnREU09teXQxdWZ2UTErUk1aQmYwaE8rYit3NjJT?=
 =?utf-8?B?MmVBOE9KTWhxQ3RTT3NRTkdPV1Y3VkM4ek5qU0pxVDhHektxRk55VzB3b05U?=
 =?utf-8?B?bTNnVkUzVUtQWnR5THQvQ3p2czdVRjlqdlpjSEZEa2RqdVBPU045bmlZZG05?=
 =?utf-8?B?YzhkYitEQkl1a1QvZkVzOU5IMDVPV0tuak44ZGg2dzI0UlFZZ2dRcnZSQTdr?=
 =?utf-8?B?eUZUdWFObXRQeCtKRnFKUzRkVURaTmhyemZYbGVtTTV5N016ZmFwcU9sNzZ1?=
 =?utf-8?B?ZFdmSGZuSnB3emdYNUVuQXRTMWRWcWt5KzlGckQvMXh6Z0tVc2JFQldlbHpv?=
 =?utf-8?B?L25MNlpZU1EvdTFmZGU2ZFk3SU5nR0RhY21MMnBvdFhQU1RpWElvNVh6em9S?=
 =?utf-8?B?QWxLYW9VOHBpVVZ2bWR3ZmdCU0RkTktKUEh1T0NqVHpTTUlTTXFQcHdPdlRS?=
 =?utf-8?B?V0s3UG52UzVDOWZ2NFVkSmdCR3JDZUVvM3hJRFpNWnErdkdMVEZLaisram9h?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d2214ee5-bde6-414f-b87a-08dd621e6694
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 11:01:26.7364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMwtfnpv1h10x/+5AdwN8YK76KnzqHKA1iIvUxH89qEhWo3k/e+Z6Mr9i9N+EZpdmpBuqmk0C0EK5hJkr524rmin6H2+WLYtN62IRd6nBC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7439
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Mar 2025 11:01:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6556

Hi Antonin,

On 3/13/25 10:41 AM, Antonin Godard via lists.yoctoproject.org wrote:
> From: Antonin Godard <antonin.godard@bootlin.com>
> 
> Add an entry to the known issue as the NVD is not up-to-date, the
> impact on current CVE reports and future plans for the Yocto Project.
> 
> Follows the discussion on:
> https://lists.openembedded.org/g/openembedded-core/message/212446
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v3:
> - Suggested by Marta (thank you!):
>    - Add what users can do at the moment.
>    - Simplify the sentence regarding the CVE Project.
> - Link to v2: https://lore.kernel.org/r/20250311-nvd-stalled-v2-1-fd3825beaf01@bootlin.com
> 
> Changes in v2:
> - Typos and suggestions from Quentin Schulz (thank you!)
> - Link to v1: https://lore.kernel.org/r/20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com
> ---
>   .../migration-guides/release-notes-5.2.rst    | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> index 417b202cd..60564bbda 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -402,6 +402,30 @@ New Features / Enhancements in |yocto-ver|
>   Known Issues in |yocto-ver|
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> +-  The :ref:`ref-classes-cve-check` class is based on the `National
> +   Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). As some are aware
> +   of, the NVD database has now been stalling since beginning of 2024 and CVE
> +   entries are missing the necessary information (:wikipedia:`CPEs
> +   <Common_Platform_Enumeration>`) for the :ref:`ref-classes-cve-check` to
> +   properly account for them. As a result, the current CVE reports may look good
> +   but the reality is that some vulnerabilities are just not accounted for.
> +
> +   During that time, users may look up the CVE database for entries concerning
> +   software they use, or follow release notes of such projects closely.
> +
> +   Please note, that the :ref:`ref-classes-cve-check` tool has always been a
> +   helper tool, and users are advised to always review the final result. Results
> +   of an automatic scan may not take into account configuration options,
> +   compiler options and other factors.
> +
> +   The Yocto Project team is working on a solution for the next release (October
> +   2025). This solution should be based on SPDX version 3, which is already
> +   implemented in the Yocto Project with the :ref:`ref-classes-create-spdx`
> +   class.
> +

With the added note, this is now in an odd location. "Working on a 
solution" to what? The fact we shouldn't trust the output of the 
automated tool?

> +   The `CVE Project <https://github.com/CVEProject>`__ is currently seen as
> +   candidate for being a new source for enumerating and classifying CVEs.
> +

I'll let Marta chime in there but I am not sure this is relevant 
information in the docs?

Cheers,
Quentin

