Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD818CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 14:35:44 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.35])
 by mx.groups.io with SMTP id smtpd.web10.360.1759934142686166749
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Oct 2025 07:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Wcwg8tEe;
 spf=pass (domain: cherry.de, ip: 52.101.83.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVJv1gqX7Nd5adrAIiP0yKMTZ1851JsDISwnJ4PowTzsYdywLmhC1nScXfg4sBxso7oagPZrBfzFvIz2Ftqv7AFcCsRO1fFOUYOZSFj7+8FDwQK9NSSajm6ZpaSMUb7hj1cEeTtLijC99hT7bLoQ2NMMxErPWW/ak87/tdOJvBkJFiL+V+zg1kNhOvER2yguwjSg0pIAuaDl8/T5VexnyezRWWeKJtkikJiLB+yJWyaFamkxwspfCDAoeT+CJg4ZbDRc0y7srw7vs3hlS2JJ22PcnpBDQrLDnGGrkQUWuURP4CEexVBzae6Ryb26wAQjtYhGfCPwCyJ2AkPxPH/cUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcWaxFNgQ2F/qb4ctHpV3/LX2uEbRUKcjo88tnJc6y4=;
 b=mWoPnYvrz7LyQY3/Ln0k5wAsdSQoK/1a7RFrjLriX6ngWeRZCyEMrv2d3+QXTcT2VemcTzqK9vFNmm84uQ1mWOMdN2PgQPo+lIPMbmdmjBPG+eMSPnXS1zJop6cDdEXpzSiCw4flvxTUumnkWoOjZXv2dooStZfqYhg+wVDmXy2PseO2OcZK4juEs4dXe4tLSiDAiOH1HUfe46Qa+WZdjQPqGcMo6AnGhaT9faUn3kC5x63avYMXaTcLDZVuigGuM76TdMRFYMz644co5pTRnMgVfsw3TR52u1LzGpczNKE4UfaRKeOzjxMMMGfeEznyVvgRhvgVWhr0+0KEaUtNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcWaxFNgQ2F/qb4ctHpV3/LX2uEbRUKcjo88tnJc6y4=;
 b=Wcwg8tEeCofQcP44pYTur7uC0XN0C+3h2ow2pxgDZxm93xvuNY6uuqsU3th6RX6AGYLDFCU1In9SAk9/uwxMn4Ud9BHxKfwE/xSEZILtKDaIAIh+BlKbV+QZ761Lu6kYDTYuHk/VO5TV/NoCOBKVeH5EF9WQkKEcKEWjkarWK2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AMDPR04MB11300.eurprd04.prod.outlook.com (2603:10a6:20b:6cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 14:35:38 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 14:35:38 +0000
Message-ID: <47ff3443-0965-4ba1-a59a-a6461bad613c@cherry.de>
Date: Wed, 8 Oct 2025 16:35:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/qa-checks.rst: fix references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251008-fix-qa-checks-doc-v1-1-5f92cb2a82ef@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251008-fix-qa-checks-doc-v1-1-5f92cb2a82ef@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AMDPR04MB11300:EE_
X-MS-Office365-Filtering-Correlation-Id: 24993ec5-1621-4028-0ef1-08de0677f2b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YlVRRVlNY0Z0YTBMTmIwZWR1NEZKNkFRaFVZdVZIb0V5Qy9WVHg5QVpiblBi?=
 =?utf-8?B?L2xBRGFTWXJuVDBpcCs5UWdHYkJ5aldkZktUbks0azRUUndwU3FwY2ZEL0k5?=
 =?utf-8?B?WkhyamVrajI5ZTRJR21XZ0tFc1E1ZTZ0Z2NQeWlZOTRtTGZWZ1lJTk1kdkw5?=
 =?utf-8?B?V0ZVZ1M5K0NYNFBFSWs1R0VtZFBtYis4ZjhVQjcycmQ4ZFhPZHppWFV6Rmlr?=
 =?utf-8?B?cUZ2QjduU3pMMThpM2JhOUp3UnZtOGh0ekNDWTdITlphcFdvVHhucy93bUZE?=
 =?utf-8?B?QVQyOFFXTVROYytaMDJyWlhoclZqb1hVdG5QbGJaUUk5WllxS0JQUnlaVS95?=
 =?utf-8?B?ZHV3ZHpoRGJDYVI5MXNCc0pJQzc2SUdUUEdXeVZtR0VWVGw2VVVpVzVCREtB?=
 =?utf-8?B?cU5jam5sclEvcmpFZ2RQZkorWU03NVAvSjUyYjlGajlCb09rUXY2L2RqT1Zz?=
 =?utf-8?B?eHVyRUJDNGhhdVNCK3lCMHhNQ09iUFhvUjJLcGV3M1EzWjQ1TUtxWldlMHhZ?=
 =?utf-8?B?ZktXT0hta1p1Yld1dHo2QlJwVTlRNnZvdkJZSElqSVBCamNobzVKSWNxWU5u?=
 =?utf-8?B?NDNLTHJ3QXVJWEtyUzZSa1k5YnZtYU04ZFVZalFiQm8zUTVseWUzb2JFMDdq?=
 =?utf-8?B?MVU1K0tRbkJEdDEwWERIWTlWeGZidWd1R0t6cmdJWDZDMkV5M21KdkpvK1Zr?=
 =?utf-8?B?WTN2VEZZdmRMWkJub3dmU1RqaTRvK0gzNnlUVk1McVFHbURpR0NJcEpxWkZW?=
 =?utf-8?B?eVg4ZWdwZ0RTZVlxOENycjZ1RWxrVmRTbDFUbEEyVE01NUhidXNVdTU1VkxP?=
 =?utf-8?B?Q2YvS2owdWFXWFo3aEVUeG9mdHJwN09wdW9mczRKRmlsZFVxMFNQcC9lRjRD?=
 =?utf-8?B?ZWZmSjlVMWFYV2F2NUpBUUdQbE05d0JjVWRtS2pwbDhLa3pRamdhNWYrKzBl?=
 =?utf-8?B?NldzVWowM0tLNldQS0FVakcrcXlOUDBZeTFDdmx0a05PQVZhZFAwdHNlckk3?=
 =?utf-8?B?RjMyZnRRMjhyZ1BsZHN2Z0pxVFhWc1JiaFpTWElqK3JpNWRKakdzNGVtS3dO?=
 =?utf-8?B?Rk9XdlhCZzVrMjhzNlk4UFlTaEhMZmc2c0pHb0dUUW5KS0l1QUQ4TFJWMWNO?=
 =?utf-8?B?RUdlM3FhT0hLTnRiSVlFVTUxazhQWCt6aDNIQ3YzY2lvQUhBMmdPV3J3dWx5?=
 =?utf-8?B?ZWMrOWtpRXRTMHNNdkZtTGhiNjVPM2d4SFppeFQ5Qk1pdnNnbEhlcWh5eWVm?=
 =?utf-8?B?eHBEcHhJZ3d5WUhlMjNpQ1kwWjQ3RWtTWHEzaDBuejVaaGljL3dobVRnMFdM?=
 =?utf-8?B?bmV6RHpaZzh2MnJsb1kzQVZUNG5jRlhVSmZmR0V5Uk9JTlFFTkFFTEhtdCt6?=
 =?utf-8?B?ajlNK01QNXVicEVkaFg3QTA4amZvZWdlNi9HNE5BYWhOa0xOTUNCTTFoWis3?=
 =?utf-8?B?RkpVNGcxdjB6ZzhkbVgzR09VMXVvQjJXUUtWUzgxcUFDVHpZMFRDZzJwYkRY?=
 =?utf-8?B?eFF5WTNBQlBRN0xGQ1B5SGsvOXlPNVBqcXJGOVJGN0I4am1hK0R1dndnamlR?=
 =?utf-8?B?WUduVy9VS0FCazN0YlFMc0VsRGc1Z1crb3plL2xmT284WFdmREswdVdXbzd3?=
 =?utf-8?B?M1lCMnB4T2Q4OHQzM1BiWDZUSjM1NElSNFlXN2UwU1Y1bkJXbHQ3alcvZ05D?=
 =?utf-8?B?NFN5OXRzVHY1VVJ4VEpxVUlybEI0QXF2b1R1MU1RMmFQQ3ZjbnN3cHNSUEJq?=
 =?utf-8?B?cnJWVTNoZUE3WnRCZzcvM3JGbno1TVkvNnM0MWwyQW5VMzRzakREVHRWbzBR?=
 =?utf-8?B?VFZhNGF3T0k1RXY0amx2TzZuL0ZQU1NBZFdXVURzdzRKODBqN3ZtNGwyNlk3?=
 =?utf-8?B?VHROWmpaZkhQa1ExclBQTG05aVlrWnBBeVoxallZM0VNbFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2prSmVqNGozZnAzekxDMG5TM0JrbE1LdkpJVGVFejg4Tyt5L3ZhOFlSYm9M?=
 =?utf-8?B?Q2dWRFBxWDJsNi9QWU1ueFpzVjQ3d3lNbGw0RHh0TTVxaHhzV2cwZ052Vk40?=
 =?utf-8?B?QnE4QzZzemFyL2dYQVhJcHYvOVcwdkVjUWIrSGxENG52NTM5Z0R0UHR6OXR6?=
 =?utf-8?B?LzVHTVk0VEViNktKc3V1YlhXc0RidTF1UUZVWE9NVkpGSGdPRnZuOWVkTDkr?=
 =?utf-8?B?TllJL1FsOFpLZ0tFeVF0VldBYWNJZm5tb2dQMHMyQTl5emJnMWR3eFNTTHhn?=
 =?utf-8?B?ckFCMDJDeHR5S1BmOE5FRCtDZjNmRWFHRFp2aVpqNU5tdDB0dWN0UEc2dkUx?=
 =?utf-8?B?TkgwcDgyWXdqYzFEVzl5Rmc0VldTMjkzY3lMdEZWRU1uZE9pSU9xQTdlaU9P?=
 =?utf-8?B?L1ZjcnRYUVZOaWZnRUd3eTYzdi9WTHB5T0NvTjltU1FYQXAxa1U5dGdQRGdP?=
 =?utf-8?B?emk0MnNxM29xWW5WNUdhWnpGNXEyS3JsZXhDeW5rOTNXZlh6UmxCbjZtK0RW?=
 =?utf-8?B?YUhnekN5VFU1bnplQUZyS1dHK2k2VTVZMFkrcmZaWHNwS1Z5bWF1UlZ5UzVC?=
 =?utf-8?B?d0dVbEp4amsvbU9lRUpMc1gxbGVQL0pOa01jNC9iWDJ5Tlc3ZW5ZK0FoaUZu?=
 =?utf-8?B?U25OTmtxd0ltUVdmb2VuYVM0dkR5Wkx0THBNWFRYNklnNEFTUW1EY0tMTHkv?=
 =?utf-8?B?dXFoY1NnZkFzZkpoZWYrelhaOHdUd2lHbldpQ0R2SHBSNWtPdEk0cGpaVGJs?=
 =?utf-8?B?ZlIyM21iVy8rdUMwZFRKWFlZK3B3NWUrZ0ltNkF3OGtUbTh5L2JKRUw4THN2?=
 =?utf-8?B?NERBclAxajNmUEhOUEpOUFhyY2lJSGY3enl5ZHJBMlVMRXFENnZ5eVZid2pW?=
 =?utf-8?B?VURkWWYvVkxEYk1yTERIUGQ4MDhDTWhnZDJTcitKZUlaekk1UzNYYVBZb1dw?=
 =?utf-8?B?K3JOYk92bFhhVmMwbEhGNTJVcmlNUnJSL2xMMVBDWmptRERwNjFVdTRmRHE1?=
 =?utf-8?B?alRrS3ZJSHZTc0xuVHFrTzJVZTM5aUJrSldYN2doNU9xcHJ2Z3ZFT2ZqV2Iy?=
 =?utf-8?B?UXFmalZWR3hpRDdhTnJDcjlZSithSXhvQ0I3dmhTb3k5THpJbzFzU1VObFdP?=
 =?utf-8?B?bTBpWWx1ZFU1c0xQUGVScEF1UGxaanUraWFoWUtzM01JbzMydkhiUXZuaVJQ?=
 =?utf-8?B?VkdoMzJIYXg0VHQxc0NSZWdTempTUWFIUHExWi9tU3g2aHlkUUUyQ2REaFJa?=
 =?utf-8?B?bklGS3hGU0lrSEg1bEYrSWQvdlBDQTNEUDBBaEFTWGg5WGlxYjlicTVLUlJ5?=
 =?utf-8?B?bFZFOE9HZGd1UHAra1h0Rld1ZWtoV04yZHo4ZjZ6eHFyMTNkSXRJcmpQbmVW?=
 =?utf-8?B?QkgzN1ZOOXBGaTlOOXlLNHVFdWUzUHpsZU03d0I3QnBUajVzaExjMFNjVS9I?=
 =?utf-8?B?b3kwMWpoWS9IU1p4YldNKzlCZFZsOEloMUw1OHZUOVV5c29iRS9tN1dTMFhz?=
 =?utf-8?B?c2hXVFVNNUcrTzFXNUtSazNEdnpkanZrOWNReUdVcGhqR0dmSVp0ditEdTdq?=
 =?utf-8?B?S1lrSmZxNHhObnZ6UXZhajNNU1k1UWROb2NESXpMa3g1aC83SXFPY1IwRHNK?=
 =?utf-8?B?VTBndHZGSUpLNHJmbE40N2o4aENFTmU0NjA3b25hN0orVzlUdmlYMGlrVjEw?=
 =?utf-8?B?Wmt1QUFyQUdWWU1QQlhtNU5YcnBvV2xURHNmSmVyN3FRZ3BZd2JYV1FWNmtz?=
 =?utf-8?B?SE1Hb3EvTHQyalduTEovS0lOUVlKdk1LOS9VN1lHMzNCZEZDMXFHUzFLaWU4?=
 =?utf-8?B?cTJKWDhoeEtzUU5UWXRPc3VJVHg2akRwQkhZZTVFUnFNRHNtOXQ2R2svVFJp?=
 =?utf-8?B?VVNjLzc0aEZiczAwMEcvQWY0RGFESk5qdWVta051d0FaTmRPQlVsdldadnBQ?=
 =?utf-8?B?SnFML2NucTd0VTVjT00rVDVlSEFpVW45VXVQblRFYWdKRFNGenRCT05KSnBM?=
 =?utf-8?B?TWJjOUFYTmpUMFJ5N2krU3I2RG45UC9yaFdTR2k3YjF4QjEyZGh5djlGanZQ?=
 =?utf-8?B?MHdEdzRHTnVrWW9OZTcwZFF3M3Y4SitkWGc0ankwVnVERlBGd1BQQkVVekRw?=
 =?utf-8?Q?BDYpoxUjOS9wxtQboCsXdNiVA?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 24993ec5-1621-4028-0ef1-08de0677f2b0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 14:35:37.8994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uo9LP3hy09p++83Q3NfCpBaY1eX9j9JymZH+lOLwYpHP7rggkEsiurtKSWlJx67HPpNlyFORQ+bx/HvC7Alfee9oFcx4F3lHyp9DidfwONU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11300
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Oct 2025 14:35:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7663

Hi Antonin,

On 10/8/25 3:33 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The references in this document do not work because references need to

They can work if I understand the sphinx documentation[1] correctly, we 
just need to provide the text for the reference link as there's none 
that can be automatically provided.
This is something we probably don't want to be bothered with though, so 
I agree with the change :)

[1] https://www.sphinx-doc.org/en/master/usage/referencing.html#role-ref

> be associated to a title. Change the bullet list into a section
> separated document. This way we can cross-reference QA checks in other
> parts of the documentation (it was previously failing when attempted).
> 
> The diff is a bit hard to digest, but there are no changes to content
> except for:
> 
> - A fixed typo (inhert -> inherit)
> - Indentation
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/qa-checks.rst | 1104 +++++++++++++++++++-------------
>   1 file changed, 643 insertions(+), 461 deletions(-)
> 
> diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
> index 69ecad74b..56128995b 100644
> --- a/documentation/ref-manual/qa-checks.rst
> +++ b/documentation/ref-manual/qa-checks.rst
> @@ -45,31 +45,37 @@ Errors and Warnings
>   
>   .. _qa-check-already-stripped:
>   
> --  ``File '<file>' from <recipename> was already stripped, this will prevent future debugging! [already-stripped]``

For consistency sake, should we always have the error message in a list 
even if there's only one per section? e.g. ``arch`` has multiple entries 
in the subsection so we have a dash to specify the start of an item in 
the list, but ``already-stripped`` only has one, and with the current 
patch, we don't have a list. Which means a different indentation both in 
source and in rendered form.

[...]

>   .. _qa-check-configure-gettext:
>   
> --  ``AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]``
> +``configure-gettext``
> +---------------------
>   
> -    If a recipe is building something that uses automake and the automake
> -    files contain an ``AM_GNU_GETTEXT`` directive then this check will fail
> -    if there is no ``inherit gettext`` statement in the recipe to ensure
> -    that gettext is available during the build. Add ``inherit gettext`` to
> -    remove the warning.
> +``AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]``
> +
> + If a recipe is building something that uses automake and the automake
> + files contain an ``AM_GNU_GETTEXT`` directive then this check will fail
> + if there is no ``inherit gettext`` statement in the recipe to ensure
> + that gettext is available during the build. Add ``inherit gettext`` to
> + remove the warning.

Spurious leading whitespace for the whole paragraph.

Cheers,
Quentin

