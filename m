Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0161BC28B30
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 12:50:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.web11.8053.1741697412422209811
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 05:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RfFJQQna;
 spf=pass (domain: cherry.de, ip: 52.101.70.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuSXer0nBpI/xkpYjnO7qbaKE8Qb97zAK0XtB2+Oe9k31hdyeDd9ClpO1hcvERhlEqFcc4RzBSl6uuxhqC5AdWuDV4YFEoOVLI4Pevvxqv3MUYSRRuusNgB/73Uug1Yi9YOb0M+Ajf+Zy4Un9yfk/JrwDMdbRgKUqKim1+rYanJLM0djFv+9nH72XozMIPiewfpLyLk0yjMIBTOo0Tw2oeJ4+/xDp0EWlQeQO55fJk28lOmfnCcvBKJWv3l2Ts2q2uBqb45dRSJVmnJLQEOmQfWvvsInLuQqQHOtYCfV0+dih0R21rl80YIcFgKUHHyTa8JihZa5a/eTwLKU936XqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsSaBKWGuBH0TPS8XKOPFIA1w/c57nXUukO3M75OUP0=;
 b=xGBO2Og8p8UmGQ0zKGI0d47fYiAk+S/g7l7Npry8gNlSFP2Qa49a5qJimtW2baubC9NquFX0lozRIR4M/tNshqmxL9l4FNGGLwJ2Zc8piFHeOeGe7rylNu83jz8XmpAIapb0gqXXk5LPon0L5ZITmvDIdpZ6WXmLhHHAD/tIXqqAQqD75f75xIbo5fQzCDsi6k5MIVEV+Kwm0p0fQJDUWiraGNhgMbhje+q9Dhp4rleuj56oxan5gZRv9OCkTvGhbGMDBs9tR52J6LUhIiqHgsjdICvmIQqYne1M7JK5nvR9M34m6zB1UIenKTfnYP1sbk2/T19Ohu4rGW1rCRcTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsSaBKWGuBH0TPS8XKOPFIA1w/c57nXUukO3M75OUP0=;
 b=RfFJQQnaU1FDv/18uX0HTQGy+MNan66ToCWL7A2kW8S7RlYScQWIhfAj73DUZ498yzf2rGO1ue9JLAlWw1NjmLhOI0x5Yo1dem/jRZvq+Pwq1KfETmDK1Za0MwJFkEtVO+mJtqZN15CnHeMNM9f49TjgwlZhoJODbv9NkEAKx7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9674.eurprd04.prod.outlook.com (2603:10a6:10:306::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:50:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 12:50:08 +0000
Message-ID: <0d48ca3f-8bb3-4ec7-b431-9cc32fdaa395@cherry.de>
Date: Tue, 11 Mar 2025 13:50:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guides/release-notes-5.2: add known
 issue on stalled NVD
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9674:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfad14a-b4c8-40bc-3646-08dd609b40d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TW9uNllBcUJKd2hOTXlYVmZTeTBtRVFJV0RDd05QQnc3a3g1ZVU0SDRIV01y?=
 =?utf-8?B?QWErSDJjdWRnWm1nQ0FFbHh2dXlwakpSZDRMcGZpbGM2SVlPLzc2M1pKUk9y?=
 =?utf-8?B?N3hmUU1jaG1zT0g4M0Zaa2s5YU0wQzAyRGZGbVRUNExwT3BjaWJsa3Z6MkVq?=
 =?utf-8?B?d3dxS1BwMjJQb05TQ2lBRG9meWRMZ2ZralZ0WmRVN2YwaC9PQWNsTlZFb0FG?=
 =?utf-8?B?aDBvS0RKNGcwbUk2Tm4zcnZXTTJ3QWFNb0RaOGYxWlRhSVNad2pkMFA3eFhq?=
 =?utf-8?B?aTczZmNvd2Z6N1Q4UlF5YVBBTm1vQ05LRjd3L1p2NkIwcG9QUXVQYjJmUFhx?=
 =?utf-8?B?VS9xQ3RiYURyOFZJVVNrMy8zUzM0Z3cvSUczR1VEVVIzSTBTOHNlaEZRWk9q?=
 =?utf-8?B?TkJtR0R3UlhJc3Q0QTlYenEzZmkrbW5JT1p0RUdnajNlM0V2R2JGbWJIWVNN?=
 =?utf-8?B?R1FtL08xZ2VLVys3R1BQcGgzRjFFZGp6ZC8xM0p3VS9sWCtpYms4TUZPQ255?=
 =?utf-8?B?aFI1RTg4S2RkMUcxSThKS1R3M3VoZm5YVFlZdWxqWTdIZ1RSa0Y1bG54ZGh1?=
 =?utf-8?B?T0U5dHE0OTBIVEZZLzZmckc4YVpBZDhZWm1WUlI0bHJRRncyMnBHamNka2ZL?=
 =?utf-8?B?dVR6VVdRQlkxVzZjU1BvdWEzSXZiY3kwQjJpTlFQeWltNkdUUFJMSFd3ekFV?=
 =?utf-8?B?QkxyZUh1ZkRKR001VTlEeXVQVjAxUXN4bDhJand1OHM1Wm5OTGZHK0FiNmhx?=
 =?utf-8?B?RkFMa2EvR2lZMkk4eDdmMXM2dG4vZFhjY2dBN3FmNXE5NGlJazJ0WlRBRURS?=
 =?utf-8?B?UDlRNmg3QjJUZVBlVEMwcnB0RjRPcVJhSEtrYmlYN2owYTJMbVY4cEZ1bnpH?=
 =?utf-8?B?ZWpCL1Fta08rT1FHWlRJSGc0dUlGNDluVitYbXdIcW1RWEVnOHJyY0dsK0JC?=
 =?utf-8?B?Y3h0a3lYdnpBOUFtQmdJd3lnSU9jOU1pd1RjbWYxTDZKc2RhT0ZWeHNmM2o1?=
 =?utf-8?B?S1NHQUs3V3hhR1crU1pIUFdyQWIzREZTMXN2RmZrYjltcksreEdOLzJJRmxI?=
 =?utf-8?B?cElsdnZzQW9JTE9oTnJqaFVKQkJXTk5sRWJicENzZVI0VVRTaklVWVRkb1ZO?=
 =?utf-8?B?YXMyUCtDem9JTjdFUXhWRG5kQVVpZjlZa3BZNk9VUzR4blNVcmFxOGtjOFhS?=
 =?utf-8?B?QXpBUlRKY2xpZmJjYkZCWThDY2xBeERxRDBwTHFRMGdOY2poT2FnbzRQMjlj?=
 =?utf-8?B?UFc2Y21UK0pnbXZhU3crSlVpbk50cHF5VSs5UCtZVkRuZGFnRjZzbndIOHBC?=
 =?utf-8?B?QVg4Z0dJTzkwYng4TUdBZ05wN3JvZGlDN21tM05YTUJUbTBMSzI2bEtpQWtS?=
 =?utf-8?B?Zm9haVE3a2QxRjJpZFg5VURZTXd6M0VUQitXckpyaksvTjVzOTJ1Y0w1dHUx?=
 =?utf-8?B?YVdHUVErTG9GQ0pKcFFab2hKOG1GQnhQdzdKSG5STnZMcG8vdkg0Z2trZEF5?=
 =?utf-8?B?aTFEL0xNQmUrWUF1Mk1Qc3d6K0lSODhiODZZK25hRDFZUmN6bFNwOW5aVWo3?=
 =?utf-8?B?c2pJcnMyMEozcnE5aEZ4N0dmYTJ1SXU4MmlMbEd4VFVFcmZMYm9KNnNOT2Zo?=
 =?utf-8?B?YVoyWVBWaUh6MXZlNmc4NTZLQUpLb1RQSWxwbkM3ZWY4dG44cXMxOCtoM0RK?=
 =?utf-8?B?cTBwSTdsZmUxSVhlS1Rmc3NaQ2E0MDBWNU9UK1k2TnNuemI0NGtHcTFjTHRE?=
 =?utf-8?Q?EFrUV8ymnPTMj0lt/HdkrFSMe7+ZxaWSPnCQ8me?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVE2eEV2VldITFU4Mm5IbjI3STFLUEt1QzhHQW55RVJtYUVBaTFjU3VrWDBV?=
 =?utf-8?B?Wjl1UUZUaHdSdDF4SHRSbkI1YkcrSVN6c3U5ZmI1WTBMM2s3Z3hTa21CODFD?=
 =?utf-8?B?VlNlcGs0QXpZbEM1UXlFUVVOWEtWZjFUS1RmRjN6VHRIZDF4dkd1T3doMFZX?=
 =?utf-8?B?bGlLZUpBdDY4OFFKOHh3RkRzOUdzOHQvTml2VlM3aFc3MHphWUxJK3hUcUly?=
 =?utf-8?B?RU40ZFZFdFVTUENMSTF2QjJDaFI2NTlvdFNRb1FleGhoZUM0bWJTekRwdFBS?=
 =?utf-8?B?TDBnWDdSVHZFaHk0R3Awc3ZJckV6cGc3cDRBakJ0YmNraFhneG1WL0J2UzNz?=
 =?utf-8?B?WFNFaEMrazUxbHYxaE9ESERvWkFyU0Z0c0JCTWpTaGwxSU1PVmNRNC9JNU8r?=
 =?utf-8?B?bVEzZ2x1UEJaMElENjV3a3NOS3diK1Ixd0x4UFdBcE9HckwxWUNQaHZIYm9H?=
 =?utf-8?B?TEt0aUJsdjdNMTdwQ0kvL0J1cUV2UVlKSkhicDB0bVN3VmxXeTZnYm00ZDhQ?=
 =?utf-8?B?YlNhZjdGdGhOS2xSVWc5RVgzc2k5S3ZhemtFNXZwNmVPWDRWM29JcmlIa01w?=
 =?utf-8?B?MzZjWDRTQndrUVRFS3huQUhZWjFCQitHZDJGU0VkOUdpWDk2ZzBHWUtmRHBD?=
 =?utf-8?B?Zml4Y3ppQVhZT0k2UzNKQ3RkWERzRlBhbjBld0c5bzZVcUVoSWlxU1dXMW5a?=
 =?utf-8?B?eFlHcm4rcnArSjQ4bjdRS2NwVWJzWndHZ2VjMHZiZGZGam5UYWxhL1gwWTNR?=
 =?utf-8?B?dDlDbjcyWWkvOWl0QzNySzJPb0ZIbjZkUE02Mkd6eEJUOTZXVzBhT0xnL3dj?=
 =?utf-8?B?c0NSeCtsbHdQcTNVcjNTbjhxRmsvcWVzbzl2NUdOR2YycUNFQUdON1hkaXc1?=
 =?utf-8?B?U2dBM1ZoV1RsSU54SzltNitBTjZZSFpqRkk4SHVWS1BaMXBraFBRRmlPWVJq?=
 =?utf-8?B?SGxGWHdQckE0Uk40SjBsSjJmcmtBY2svWTdJMm9FMm5FWEEvSkkzNVFBaEdy?=
 =?utf-8?B?Uy9vakV4cCs1RnFFM1E3cUxiZlk5Y05oVWl2SXhFckxRaW8xczdUazlySWVV?=
 =?utf-8?B?ZTVvWi8vMVJOL1pMblRUUDExYVoxd1BFamFyeVFwc3o2eXVnSnord0lSSGo5?=
 =?utf-8?B?c1hNWkk5VTY1ZGRpYmxrM3phZi9FT21Bdkt3VjBDUzNDWmozR2VjMWdjcE5V?=
 =?utf-8?B?MlpiejNiZzBmNUxEMkpETHBVc25xNUdzRmNTVjBRS0hkZHR6ejgxQ0tmeGJj?=
 =?utf-8?B?NExTT1NQNkN6RmJKQmJZdDNsaGMwcTVFSFBqMFk2eXRacjREVGJMOVE4RGtN?=
 =?utf-8?B?am1pQ3IzMkhxMWpDSmR3VElOOGN5aXExeFZtSmcybFlmSHZnTFJzOFZHK2Zk?=
 =?utf-8?B?TGswUlhBQkl6STFjUHZTd28yd0UrRHVVNDBTTGU4cUdXbVdCdEtHVWdvTVkw?=
 =?utf-8?B?ejNWcDIyUVFTZjY5M3lXeEg4V0RHbjhJNTN4bUFsSWloL2RMalVCb2ZpQ1Vu?=
 =?utf-8?B?T29wNXpUeEdHcFVJZVV6RkJubUg0Y2UrVVg1d0JTNTNJajhsMUEzY3d5YmNM?=
 =?utf-8?B?NndnRzdYMlhLNUhuWDdlV211UzNJeGU1ejZoMFdTQ29Nb2VCc3FibDV0clNM?=
 =?utf-8?B?a2REc3pac0Mxd3VqMDZYSWNYLzg3ZjFZODU3ZHVabEs4TERrQkUyNVZwSXJD?=
 =?utf-8?B?UEVBZHpvRkdFNHcwN1lBOVhBNC85TVppQ1lNQ0VwbVhzc0JESk4vd0ExdDVw?=
 =?utf-8?B?Z3VaWlczcGhoN04yNDFseUNMZ2JBdXhYaUpHVUZ2ZEZ3SkJDNXZwM0JXOGJi?=
 =?utf-8?B?YXY4enNOUVBIdHN6UXkyUGpVQTAzVWI0ZnQ1bFZaVkxWOWhDQ1FISUIzUldz?=
 =?utf-8?B?MTdZbVFCMVVIU2FjL0hIL0JleDBNSk1OUWxvZkJEZzJndGN2T2lHY2F2Q0Jj?=
 =?utf-8?B?aUk4WG9DRVJCSkZPNjd3ZDMxb0JUYnRFNkdFK0tHdGE5d1NRV2ZROHdUeGxT?=
 =?utf-8?B?bkoyc3RSdnEyU3krc2FQMDQ5dHRhTkMxRlN5WnZJamVLYTY4Z3h4T25MNW5u?=
 =?utf-8?B?U3pZa1VaMm9YUDlqUXlLcUs1aFFFeU0zM2c4YUpvQm5XQU5TTGdaZzAyUzNn?=
 =?utf-8?B?a1JvSnZmVTcvZTRNMFlldEJDQUR6aEdvaFdJc2JaM1VQOXM3dHozcGZXU0VH?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfad14a-b4c8-40bc-3646-08dd609b40d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:50:08.2583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LA87zNXrCNhrMG5GSi3lGNXUf6oEdirzf/9RoEXTtOeXK0v7hXI5rP9/fwBg22Ln73O01Jnf2v9+qJ0oyXqan/Qfa4SQ96lSs9lfKjKHCc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9674
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 12:50:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6533

Hi Antonin,

On 3/11/25 11:56 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add an entry to the known issue as the NVD is not up-to-date, the
> impact on current CVE reports and future plans for the Yocto Project.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/release-notes-5.2.rst | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> index 417b202cdbb16d1ae6b95d8737b36f76a58cf6ef..eb8011a2797b1d3cc58514ffce01f0c8e7ab6f63 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -402,6 +402,23 @@ New Features / Enhancements in |yocto-ver|
>   Known Issues in |yocto-ver|
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> +-  The current :ref:`ref-classes-cve-check` class is based on the `National

-current

It's implied since this is a release note for 5.2.

> +   Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). As some are aware
> +   of, the NVD database has now been stalling for the past year and CVE entries

"for the past year" doesn't mean much when read from the documentation, 
which can happen years from now. Maybe add some info on that so the 
timeline is clear and people can cast doubt on the sentence a few years 
from now?

> +   are missing the necessary information (:wikipedia:`CPEs
> +   <Common_Platform_Enumeration>`) for the :ref:`ref-classes-cve-check` to
> +   properly account for them. As a result, the current CVE reports may look good
> +   but the reality is that some vulnerabilities are just not accounted for.
> +
> +   The Yocto Project team is working on a solution for the next release (October
> +   2025). This solution should be based on SPDX version 3, which is already

Maybe use the release name in addition to the release date?

> +   implemented in the Yocto Project with the :ref:`ref-classes-create-spdx`
> +   class.
> +
> +   The `CVE Project <https://github.com/CVEProject>`__ has been working on
> +   catching up with the missing CPEs an so is a candidate for being a new input

s/an/and/ ?

maybe "and is therefore a candidate" instead?

Cheers,
Quentin

