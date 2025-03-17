Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D312C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 11:23:29 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.54])
 by mx.groups.io with SMTP id smtpd.web11.49993.1742210605066499500
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 04:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CVmKNnqs;
 spf=pass (domain: cherry.de, ip: 52.101.65.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCOoWibHLMDxGlfsnoAp/k7wZcWph9ygYITb161/nWHWbE1Ow+iISTwcuhRgRfhcy0ShEVMqHOfdXLJL8QxkAlvinM7ordvewe3zO5ZRABaXu3b5S+g3bwh5fzHu1qV258wLvmOobYgwu6Go0EFKQUmHZNVi7zAYDJlpZ9AhPzOgT+GhCmK994uT/T8lx/WDVoIW7ClPIGatEsSlw4Cf/s1w8Ue8UHQRHB+muEMwa849glKW3yrl7Dpmc7SR4GYip/sHaCl4y//n6Dfj978IlGx6z6zpMLWOu/dJgdve2xumQUJ7w/aTjJHOf129bvEos7a13ycR328DL6T/ljl54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip9P/i4ca+8pU65gXVpfonwLfHPRBqwktTJIsUFRgwk=;
 b=a53wSIs+eYgSH0cWtXdRkP3o05+ZNLPmELy9tkvfzbL7KKGPuLbQC4kyq/KiHh6KrusZ77+V31v973HiP7WXzWP6So8fITakI3KRaZEw6cKDgpyN+NSKUKjmi5ZbMjZPQCOV/OFXt2xwIccLrDy/F5K7yD8AbUwQ7cxLHVU0gCvk4HZaOBX+9cN8KWpU9TuAnY/mvHmIxyWrxqK7yzShhPczX1fIwUmdMgaHLpiqH56dl4EQr6hcZcNqZFjiXo23UO7+19pGYqjQ5EuYGxwH0QfFMzqTmsm3jEQN8A7E2ZxsT6EePcxLXbs3PTszeNk9OPG3xDy8OkoJXWXw9hAt+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip9P/i4ca+8pU65gXVpfonwLfHPRBqwktTJIsUFRgwk=;
 b=CVmKNnqsNeJ6H8s0ziGZ4VSewEEtCKY1KiMlA6wQ/HSFApdMoprwQlTpBmSnIgcqrd8Kk2M/W3VqRzRmcgjLSMEywPM7J+PgPXhYUpD0g6c4Nh3HDMkqi7/Zou9zcPw8y2T34uwwUnFktPBn5fXDKSHfjHrSbyC8TovlznAuP6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7440.eurprd04.prod.outlook.com (2603:10a6:800:1b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:23:19 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:23:19 +0000
Message-ID: <dcca7b17-5255-48e6-abed-df41796d1458@cherry.de>
Date: Mon, 17 Mar 2025 12:23:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v4] migration-guides/release-notes-5.2: add known
 issue on stalled NVD
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marta Rybczynska <marta.rybczynska@syslinbit.com>
References: <20250317-nvd-stalled-v4-1-2eab55aa0fc0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250317-nvd-stalled-v4-1-2eab55aa0fc0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 9491523c-a9a8-43d7-4d5e-08dd65461ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cWtyNkROUGFlSnNYcW15alhOeUJUaUVIeDJOdXRXblZVN25OcW15L0hDQ002?=
 =?utf-8?B?M29yeGhISVowZFRqLzVUbUZtQjFuc29hREhIQzNXZ2I3R2xKY3U1aldaM0Vp?=
 =?utf-8?B?UUVXMnEzSmNTanVnVVVkZW5CaDVMeWpwcHNkOThxZ3pjSHNoZVNUcnh6eGlv?=
 =?utf-8?B?a256RU5Ha1dyMi9LQmFsRHlVM0t3cVFESlEwM0pUenV5Y0VORTVSekNYdk9i?=
 =?utf-8?B?eG5pb2svd3FhOTZVT3poQjd4Z2FrZytHQmpaSUpoeXhGdzU4c21ZU256bEln?=
 =?utf-8?B?NWVLUXdacGJGdzVoRVR5cnRvV3MwZy9CbUtZWVZiY1lsZHFxeXdCaGhXSU1E?=
 =?utf-8?B?RHFwMGFBdythcWJteTdEUTBYQlkyQ0xMZUdkUVRCZXhYc3BUWll2TjZpd2pH?=
 =?utf-8?B?ZlJjdk1jTyswQTIwNmlYc2RJMENtTjMzRTh3RDJ6VDNLbW5LdUtGYTVVVjRn?=
 =?utf-8?B?dzdMajQ5UkRvVTh4NVJDZzlVWWw1M1J2QjZzVkRQMVYranh2OTBHb09tWEJM?=
 =?utf-8?B?aW9uWnhUTWhNeEo5MkhEd1dyUkNXckh4dzdaQ1lLdDh5RlVoU1hiMzM0Ym5M?=
 =?utf-8?B?eDdmY0tEa0lxYWRZR0h1ZERIOHlwa3pFTFozWnJXT2NwOWNueTM4cWZmRi9p?=
 =?utf-8?B?QUdqby8wL0MwMFFSOW9YeThxTCs5cEZJNVVyc3pzZ0pSTndCVXRJN2dIZ0ZR?=
 =?utf-8?B?TDJmYndjVnBGUzFnTnhYbGVhTXFmV0wycUl3QjViSjNHL3ZhMWQvKzRjR0Rz?=
 =?utf-8?B?ZVU4WTI2Z2hFS0dBVGFyZnJuQTJXZ21Hb1h0d1RMaHg1U2NRZGpDcFF3MFlK?=
 =?utf-8?B?VGZBZFdRekRKSnRtRExhWnl2bVlZN3RrM2gxcDNSV0c5UVZJNkc0VzJpN1dt?=
 =?utf-8?B?V3d2Mi8zUG5Ma1AvUHdYVi9qb2t4eHcwcXdjOXdBcU55OVhaUEdWemUwZFh2?=
 =?utf-8?B?cm8wb25rNjRvUVZ6NXV6d3dQODAyU1ZoWnhVQzhxWUlDemY0RXV4WHlZODNU?=
 =?utf-8?B?WkFGWkRIZFIrU2N1akxGOXVjWHduMk1PckZ6OUwwbjByRkNMMjlMWFBDby9S?=
 =?utf-8?B?dnU1YVJRalpTZkp6Q2dld2dXUXdWMmYvQkFieW1xUzh4NDJwVWVrc1dLV3Fn?=
 =?utf-8?B?dDN2aTRCViszRG5XM0pTNGpzOUlvNk9ucWdlUnd5UkhkQ0VGWWpmbGY1WEh0?=
 =?utf-8?B?aU55cDY5VU04QzRxR09JeUtZTVlxZWxZRU9mdnlnNyt6MU5PUitDK2tuOEtk?=
 =?utf-8?B?NmtpN3JyZktHbHpmUXhNck1TVjRLZ3NlOXRqT1p3c2pmc1VZNm1xdGpQMnZl?=
 =?utf-8?B?S0M3RnZxMEZ3MWprU3d2Um1YdHJRUGRueCtJUzYrTktNbWNzS1RLTkY3Z3B4?=
 =?utf-8?B?UUFNaVlxd0d5RTdkTmg0MUZvbTZVRldNMUprVUVZaWoxRnYrZFh3YWE3RUp3?=
 =?utf-8?B?dDcxdjJxQWZHOTdyRDN0cDdPN2YvN2xpWTFMSFZYZXFvSTh6MWtzc012UXFj?=
 =?utf-8?B?QnJzQklacCtLa3J0dmN3SjhrVnJ4OGpoaWEwbE5pTEwxUDZUK1VGYWNtTzlK?=
 =?utf-8?B?WXhZd1FnM0l2alJ6RFFqdjFvYVAralJ4OEhqM2IvZXIzZzUzMkdmdkUrbFpO?=
 =?utf-8?B?S2NvSEtNSlBOZWtDcEJ3QmpCL2dJMGcwSm1BRjdodXhYaFNGcmluZW9MeDU3?=
 =?utf-8?B?d2JGekR0UnZJZHFYLzhBSUtkazE1Uk5SZjFxT2prcGswb3J3MllLUXVTeEcr?=
 =?utf-8?B?WE80WndrcUE0Y2pUdEFjVzZoSlg0NU02Wnh0aFN5cVc0UWRmWUNtL0J2c2Jv?=
 =?utf-8?B?TkQ2dGhBTzQycFFscmNXUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVE1RXBBK1VXNFJPMStWWDV1eGNCY2hETXFmQm5ObWE0UDBHZjBHa0sraTJ4?=
 =?utf-8?B?TkVQZ0tVVXVMR3NiNUpSWWxCMDg3S09ydUo4azBBOUwyOWs5L1MyQVNUY2lo?=
 =?utf-8?B?MlR5cnVveGJGMWYxdHJuNUpreHB3ZXFXWDdxV1pkZ3oydy9QeFVPVWpMT2Y3?=
 =?utf-8?B?WFEzT3gzM3JwMFdjNzk2Q2paUHdxNVdXSlpJQlZkUXRIRlE5LzEzWFVzMGxn?=
 =?utf-8?B?cy85aWF0WWtqMkd5SUFJSTI1OCs1QWtnalhXeFN4SEpDUkNlWCtLZE95WWg2?=
 =?utf-8?B?STl0TzFnNzBhNjRSUjNGMHNKOG5NNWE4ZWhobVlmNmtnWHQ3K012cmY0TnVY?=
 =?utf-8?B?dDhKTW9hOUxhTmsvbTRFd0U1YlBXRkYxVzAzODNQYXNOalYwZXh2STQ0dERy?=
 =?utf-8?B?eVpTc05zdGtKaCtQR2JaRjhvd29MZ21jM0tBMEZGTE1oYW50SzhCSkY0RXlm?=
 =?utf-8?B?Z0twemVTZjN0eTF6UjRKci9yRFRZbGRGa2p0b2pSdjN0TCtrNlJpRzFON01X?=
 =?utf-8?B?VkVhLzJpWEFzUDhoUWt6NzZqblpwalUwR1pnU0oyQXhKTDFuTFhVVWxvZFJS?=
 =?utf-8?B?NG4xSlZNYzcxRGlmRUVodDNXVDlQYjBCcUZiN3Ztb2gwSWRkMVpMMHFWVFpm?=
 =?utf-8?B?d0Y1c3FQQ1ZTdm0vSVVlMEtONzlKbXNRcktjNkNzdngrVmlMRytWczkxaTRB?=
 =?utf-8?B?MkkzbW45WTRDZjN3LzA0UmI5aW1za2pIUTRMKzNnekJ5eWpMR1RBR0F6aE8z?=
 =?utf-8?B?YktGblo4RTltclhpZ2VobnJDNEdiemNpNUZEZ09XSklWa2VxMW0rK1BsYjM5?=
 =?utf-8?B?Vlo0Qmd1UzBid3A4TGJRZUpzVEtGQ1c1eFdQeVIyYmdKRTE4TDJxYmwwaE4x?=
 =?utf-8?B?V0JEa3JyeGQ2dmYrNDhCREppYkVzUjc5WFlCNG5pZVJKaGxVVWxWaVY2cVRm?=
 =?utf-8?B?Q2k3M040VVU4RlNnbEE3K2FEczhicUdkN2JyM2NjNmVLa2JWdmFPeVNDTTla?=
 =?utf-8?B?bkhiM1c2R0J2RVFqLytYeXQweE11UnlDYkl5ckNVcUhrNVE5VkpaMngzSE8w?=
 =?utf-8?B?Z2tiMU9YOFBOa1BjV28yTGhnR0ZuVFNvSStzUEhxSERBaFg4dStOZmpHekNJ?=
 =?utf-8?B?Y1d1WEIxb2ZSQ28xdnhVb1V5R01RN3FHaTV0Z1V1dEZtV3JiNnJZcjJxL0Q2?=
 =?utf-8?B?Rytkb1FUVHNZWHIvMis2eWdPWHJNOExDdmdYeFhsVlNnVU81SW5TZnZJZENl?=
 =?utf-8?B?RmZETkJLN2hCS3ZFREdhRkFSK2M0NkxRSDhRVnJ1VUdoYS9pWmtMSnRjRTFG?=
 =?utf-8?B?Vjl6K1ZEclVDSTRocFVEak5xaFFuemNtVjVpRjd4Mm9IWk82SDF5ZmQrMzhB?=
 =?utf-8?B?Q2t6a05tWEhOaFJtZnA1eDRVSE1tbzc4b01GdE8ybmRaWVVxVXpWWFcxMVZX?=
 =?utf-8?B?VVRlMEpzTmQ0YkIzalVMNFlqWkh0WVJDUU5SQVJ5SjBuakJHVEk5Njd1MUZx?=
 =?utf-8?B?WmdhM1FUdDNibEVaMUlsMHJpZkFGN1E5MHdldEREZm9aMGZqMUFvZTVEUklT?=
 =?utf-8?B?R0dCRmxPdVkydm9vREgwelNlNWYzeGdDOFhja2hlNWNQMnQydUxtZVlrbnUr?=
 =?utf-8?B?SkhBNUpiQklWRDhsNGoxdHpqK3A3WFluQUYwNzh5ak9SY3U1VEQ2RE1raDRj?=
 =?utf-8?B?ZG1zeE1JUFF3d2JxL2c2czRNZlVRbXJWNWxqSlc5cVNiMU5WZWZicFNleGE5?=
 =?utf-8?B?WTl5bkhXSitrcGdJWUpDRmMzSVhFZW1FdE85YjV2VXlOVllsVk92akdBVkxG?=
 =?utf-8?B?K2hDNWZFR2E1WExKT2FTVFZvTmsxUldtZXhtcDFSa21XdW1UNVpwOU9IZnR1?=
 =?utf-8?B?MjVBcjFueDFIS1A3OHQ2b3R2ZW5tVm1nSjgvaG5ybG42VkhVRC9KV2FoNTdq?=
 =?utf-8?B?T2pyaWp1UW1RRmZhRWF0MkF3cGtTMG5pMmh3cm15ZGNWblN3SE1MWkNiajhj?=
 =?utf-8?B?b3lEdHRlR3FSKzhBL1U3TGliVmxhY2VMamJMeS9CREMwb0lhSlZFWVkvcS9C?=
 =?utf-8?B?RXJGWXk0OUlFMTNmVi85NGVjTHI3Y3h1ZEJBRGlrTms4NTZ5VG1BQnd0ZXNo?=
 =?utf-8?B?R1IvekpJc3kxSVdrS0JUNWt3L3NyUlliQy9Sc3lQRStXbXNOY1ZCZ203cmhJ?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9491523c-a9a8-43d7-4d5e-08dd65461ece
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:23:19.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOne4UMUsEW1ZC3KqxU1IrgMpbU2y/PZMTX9/0MyYfY5YCSGI/royDfOHQjLNPtdIyL4OT5sYN1v2yzmETVeze03gk+rrWBaUEJX6mYEQpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7440
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 11:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6576

Hi Antonin,

On 3/17/25 10:10 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add an entry to the known issue as the NVD is not up-to-date, the
> impact on current CVE reports and future plans for the Yocto Project.
> 
> Follows the discussion on:
> https://lists.openembedded.org/g/openembedded-core/message/212446
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v4:
> - Review by Quentin Schulz (thank you!):
>    - Be more precise about what solution the YP team will try to solve.
>    - Remove CVE Project potential candidate.
> - Link to v3: https://lore.kernel.org/r/20250313-nvd-stalled-v3-1-1ee9b67a975c@bootlin.com
> 
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
>   .../migration-guides/release-notes-5.2.rst    | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> index 417b202cd..5b7da9f03 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -402,6 +402,27 @@ New Features / Enhancements in |yocto-ver|
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
> +   The Yocto Project team is working on a new solution for the next release
> +   (October 2025) for enumerating CVEs. This solution should be based on SPDX
> +   version 3, which is already implemented in the Yocto Project with the
> +   :ref:`ref-classes-create-spdx` class.
> +

Wording looks good to me, that is, someone not involved in CVE checking 
in Yocto :)

+Cc Marta who's very involved in all of this, maybe she has something to 
say about this?

Thanks!
Quentin

