Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A08FCDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 10:07:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17755.1782209263804935006
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 03:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mxbnC5ao;
 spf=pass (domain: cherry.de, ip: 40.107.130.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdruxvyoLoGlkisYGm7AhELkMKKDPP9J2rutKIPoWs7aUH8BhtkYSMxUP4cH05ZaLf/qM9Z0R6Hc0uOBah05v8jMDB79HVrvW81/4YuiwkM9JKZxesPclVgaNAuywK6rt+Pzw+EJSoWkqbeCZ6IdAfOXoiYLuTLtE1IVqhRKTVJWP/fOt/ldDi4QWdfbYuER+Z63t/GWHME4KapCh6PE41nM5ZkYg6etsSeyXrwiOqRS+j7z0GZhXbjRVKS/QbQX21TSMVdJkgFlPRVPvlQsk1VNi6YLFyo5ipY7iX5913JQm/qMhskboId+739wt6TDJy9pIfEk/PCvn2iURZypFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbGfbaiOw/u5G7/xelZ2pWgtdWskP1OUN5lTN2a1KeA=;
 b=r43Dlw4iImVOb+P4NIh4ndGRKOq//i1hYYAmlYMDOcrdt+fHyNkr5zYBx7h8qDch4D2rP/aUrWwzazrXGlbU18VyeWAYxr518EAoCE6RTfqFfPUGTwM1thzIt8uqZ9C2c772Dk9AQ68mDRDOJW5qh2fvVqnCLP1CZrhj1LZxQIeGhhlsUThdIkgzyDE85jfffeB6rx6+dUOe68J1iVTjiPuFA6RmMfJx1R2d7/KKTYOaUFYz5B71X5Vst2WUNCjbncroaMupPDvCCukjxR/k/6W2zsdt+5+U/20WesU7bqvPaD0fhOQIRc/WTSBsGJxFf5faQXRWZ97z8owLabmESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbGfbaiOw/u5G7/xelZ2pWgtdWskP1OUN5lTN2a1KeA=;
 b=mxbnC5aoeW82qsWM1Wq2Eeqn0Apav5031150Anbj3c+XvQrUFD/ExdZHlTBZC87NA+dXBF6gS4zq1YiouXaGrLFQZ8JfO2vNlQPIJlZWB+Oy2mlTMfIzmlh9PgtkKZswKInuFMZ/lGLRuMPXCCDf3J+oORo5DugyglzIUcjUs/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PAWPR04MB9934.eurprd04.prod.outlook.com (2603:10a6:102:380::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 10:07:33 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 10:07:33 +0000
Message-ID: <f4fbb4d5-585a-49a6-8d81-da4178ce43ab@cherry.de>
Date: Tue, 23 Jun 2026 12:07:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: add more explanation to glossary
 variable LICENSE
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <3beaf215-35cd-0e87-ce29-cdf2ff3a8135@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3beaf215-35cd-0e87-ce29-cdf2ff3a8135@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PAWPR04MB9934:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a0d4d7-c702-4504-8405-08ded10f3e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wULXAx9l5LV/6AsN9zSWgBJ8Q8TzwWQLqZx23lesC2ag8C1bTqM1vHI1+m3FNt/5qQo3NgSGdHg/Hkyoq9ZibkyZHBpsOo1JYbibE7JXE5Saucud9WGTshqyni64Vi2U23GZmzWYNLpG9RD7b1Co0kPOQjnALT4Qv2k+jz/zIH6rMO3fh/4iaKzkNkDoe/MbsXpk5IXg7PzQTdMIhvR9N0wW5FvDxYTvkXSL8s/W9i4gFInRAM++FhqIibMfUHUzG9n33OThh4d2FjfK0NT+MzUHG3Iwz5qOg1z3blEdJeEGQEI+/nXU3q+z40MIqZeww3Dnqf0buqYk3AP+WuP5carnyZPhosXqcoLcqT5yUSMSIrb4lzROol0P1NEVwKdK6Ks7sn2bpsSMIW9Jxy1IUo8kzNBC1apd81hLC5wf+w/v+3ygggVIrHsEc5II4uAOQf3JGNel28Uz7R0m1snsTtM6NBCtJ8PnzbuOCW6AcB9fMV5jMTslBePBBPQexGhhjhhhT3/dhOdAJT60aXDtuOXQehqi0Ay1h0heDjRJwd3WRbYbzj1X4Cvlk5HwnRrCbxFlGUMFMGFm7JAsUFbNk9PLKGQb7qy29vRp5r+zYFvKCD2ihjL27OMfgyF3f2oYGfbF9Ki17PZmLNOlxXtpq/vG7W0EJNnTKrRn0mMOQeA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0QvYzkwa0R2R09Hd2NTaTEwNmpHT3NQUnJ5eFhvdWMyemtXTUVsWGFXRGhW?=
 =?utf-8?B?eVFjNTgxU3BjRUFYSkp1S2YxV2N3OERadGkzN2JrRXJia3dMUWVUSWFleTBa?=
 =?utf-8?B?N0o1NnNycU5VTVRMR2wxak5hTUUzenEvWjVIN3pKTHQyejh2R3k2aURBSXNN?=
 =?utf-8?B?YUdFWkhWbUtCNEhCVzBXakxHWHJLSUVYNHRkY0tqMk53dzFtTWxzSW9hRm5S?=
 =?utf-8?B?Z2VpdW5XWTk1V1VNNzRNUzc0Sm11N2FnL2YxQndoRWkrT3VyRnkvcTZuTG1s?=
 =?utf-8?B?dzJ2MWVqM2FSUThGeXZYSVlqbU5OVExEWGMvY3cvOVRuZVU4anlkR2VGZXZ0?=
 =?utf-8?B?ZExnY1AySGt6NkFjWjZkL0pJUmw4MC9IV1BYbTdmMGtFbXQ3NmxOMGwvWnI0?=
 =?utf-8?B?RVZKTEQ5UitpSlIreUQrajFqb1BEMmU2SCtzUXVTN1dvQzlISDFQM0dERWVT?=
 =?utf-8?B?L0kwd2pnK3U1UGcwS0hQNm13dENrRVZNdElRRTBjUGM0Yi9wdnd2cklBU3h4?=
 =?utf-8?B?czdFV3FCNU5kdStQUjJ3eE1Hb2pZOTVXdVR0Q2tzY1IzMXFZZ2QzV3hIa2Zk?=
 =?utf-8?B?VXBCYzNsNUdCNDZRcmdDU3RKTG9Hd0ViSTlvdFREcklLT2pJSURldEhlbWQr?=
 =?utf-8?B?UVEwSU1tUzl4djYxVythOTV1WGFHV2o5UVNWZkw2U0tKYXBONGR4L256TlVN?=
 =?utf-8?B?UCtWZnNGNE9jTzhsd2REL2wzOHNlUlJUK3Y5OHVOTnBFcW9LclBjcS8vTkZz?=
 =?utf-8?B?TlNDUGVIRmphWTAvb1d3VlJIa1dkZVJ1RHBQcHRYQW0ycDBJSExadEYvUzZE?=
 =?utf-8?B?cS9JTkxzNkdsazVzT2pSNzZ6SnlsRnI5Rkk4WHJORmdnZ1ZWMWpsMy9KcXM2?=
 =?utf-8?B?K0tORVV1YVBDVjAyWEZnR2hxVU5UakNwYWtJbFpyZkR5ZG1XL0FCY0tRNlVs?=
 =?utf-8?B?cGd3UlBhWUJkVzh6WXM1RS8vemtad0Z0dGJsT3VWSElSYnpHMzZ5WGJRWVdk?=
 =?utf-8?B?N0VMTE5NcStkSEtkV1ZpVE51c0RIT251RWF6WHFZVGtiRXV3bk1jTWhjN2dv?=
 =?utf-8?B?bFN5MjB6ZzFxdkYxdFZHVTZUZGtURWNDVkhiZHBidzkyTG55M0RYNnovSW85?=
 =?utf-8?B?V0lOczNKc1EybGVoSktiejI4NWxoNjNWbXBrWEYzalFCVEc5U2tmWEovRUVI?=
 =?utf-8?B?YU1EaVY5QXF4VkZSeDhUdytOSFY3RlJnWGNuTENjTUYrRml0c04wbUdubXJv?=
 =?utf-8?B?eTllanY5OWE0bGxNK1AzUlp1eGNaQnJXQ1dMN3JCRVNVUGpXY0FjckNvSjM3?=
 =?utf-8?B?RWdobXMwOWhicUFQbTJEUDJOaGNVVzcrM0YvZ1c3RXY0blFMY2VsbWFRSEIy?=
 =?utf-8?B?TUtvdU1NRUI2VjF5VDlNSjJQVVhRMHp6cnltS3ZHSXZPWFN6WXZjdVFXMDRa?=
 =?utf-8?B?dHhVS1Y4Y1cwQlVsNkhWV3o2V2NYL0ppWElITDA2clJkTWRSeWN1anVacFVX?=
 =?utf-8?B?eHR6YURJSWl2WlBjVnJtcWJDaFBlaVlOVmpFbkh2aXhrZjFxKzNYa1luU1Mv?=
 =?utf-8?B?MUg3c3RIQ29jK0FMN2RZZkoxMWxkY0ZkZmEwWkpnL0pYbFlpSXVJT20zY0tB?=
 =?utf-8?B?akdKMWRrTWQ1QmJnZENlSi9idm1KaW5Ua1lNRnRFWHdPbC94WnlKQ0h5aCtD?=
 =?utf-8?B?TDZyTXh1R0hTTG4zNzBhb2NGL2loTnBoVVp6V2Z1YkswZ2oyZktWWitoZ3NC?=
 =?utf-8?B?ekd5c3lMS3paRlk4MmpLVlA5bmhwTjU1R1JXMk9pWXNxcUNrdHZKdmh3c011?=
 =?utf-8?B?M2srSFpqcnRaR1hMNEdxWEpYYkRRZXVjRVNZNkplZXFEQ1JsTDNvSnhzTU5C?=
 =?utf-8?B?T0JITitKVEhSTm9DVDRMRmV6UEdYY1h0OTVRTFhzb05UL29OS3NIUXh1QklK?=
 =?utf-8?B?a2k1aHJUME4vZDhOYWRjZ2R6WkR6ZTZKcm15TkNnZldFSE91a2tSTjVYNS9V?=
 =?utf-8?B?RDJmSUl6RDRjYUl2eGpPaXBJZEJuSzIxbmtmNjlzMnMxZ2JRRzczdExnTjVM?=
 =?utf-8?B?Qm8rc3FxK0dlNTZ3RG1PUkJ3aGJrb0RyekVFVjBCaFoyaFVnTGJvUUlUSHFN?=
 =?utf-8?B?clVtVGJ3b0syZ25BN2d2U2RHWlExNWFVNWdxQXpSTUxnWTY1Ynl0NWZsazZ0?=
 =?utf-8?B?Zk5BbG85cnVqT2xRTWtQL2tEL1M1Rzd2THNzaWc0TUQ4Yzk2MDNRbGFiUUZI?=
 =?utf-8?B?SURNaTg2V0hoUWQ1SUVmc1VhV0tnVElyMHg1NUViMmdOY2tyQUJOekZVQnBU?=
 =?utf-8?B?L3VhaFNVSFJWclI0b2xQMjJTdllPQkprZ2pjcTNXTjdYcHBGdVp1dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a0d4d7-c702-4504-8405-08ded10f3e5e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 10:07:33.5450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RocIZdnygO+0LNR5OUX/j0py+P8YClUvZ7vH3nMGcaaJovmDOW506Xh+vBo0lQCrYgE/K0npXMqQjNXSxQP2mkUgpL51HHC034ozUn/3z0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9934
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 10:07:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9839

Hi Robert,

On 6/17/26 1:56 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Add the following to the variable glossary LICENSE entry:
> 
>    - it is a required variable in an OE recipe
>    - it must be accompanied by LIC_FILES_CHKSUM, except in the
>      case where LICENSE = "CLOSED"
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index df3666f1c..3558ccf2d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5871,7 +5871,8 @@ system and gives an overview of their function and contents.
>         section in the Yocto Project Development Tasks Manual.
> 
>      :term:`LICENSE`
> -      The list of source licenses for the recipe. Follow these rules:
> +      This is a required field in an Openembedded recipe file, and should

Isn't it required for all recipes? It's a bit confusing to say 
"Openembedded recipe file" when I believe it applies to all recipes 
(provided you use OE-Core, but if you're reading the YP docs, you must 
have it included, if it were the BitBake docs it'd be different).

> +      contain a list of source licenses for the recipe. Follow these rules:
> 
>         -  Do not use spaces within individual license names.
> 
> @@ -5911,6 +5912,12 @@ system and gives an overview of their function and contents.
>            LICENSE:${PN} = "GPL-2.0.only"
>            LICENSE:${PN}-doc = "GFDL-1.2"
> 
> +      .. note::
> +
> +         A recipe's :term:`LICENSE` value must be accompanied by an associated
> +         :term:`LIC_FILES_CHKSUM` value, except in the special case where
> +         the :term:`LICENSE` value is set to "CLOSED".

Remove mention of "value", it's unnecessarily verbose.

Cheers,
Quentin

