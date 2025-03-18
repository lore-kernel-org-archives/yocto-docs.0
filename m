Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B6DC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 10:56:54 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.1])
 by mx.groups.io with SMTP id smtpd.web10.8973.1742295412813177139
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 03:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=I2iN/svJ;
 spf=pass (domain: cherry.de, ip: 52.101.70.1, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbV/hoF19emhLqh2TWmVvnK55ehJQ3kpe20cqhgvCeqNQE0T3dgO57OWhZXnIMZE7LKzf93SQUkOwZ/ZTw7AX7t1SxryPJ43kJFHrLei4NEcTL9fj8/6MGEUgQBtD6DgwTW5l41kQoE9kgQKL8IdUrgPba/twvrcBSPADuT1F73kbv59mNBz6XZrWBbwqkF78Hk1lTUdxuO5KjYyeECl70EYgLfJR7xwVUzzNOvJBHVeQI3rvTdoHzz1ZVXYGZhuOwk3vooxcnMH2v8xdbYG+3HwBS6tBZ2fUhuZX9sE/weEOWVNe0Ti/X/ydQPG1euv5jr1LaWVndYKwdCpdRu1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4oKK8jISb4dsID29kR+t5yHaQHr+7rJen82fap4Yf0=;
 b=tGE9QRrbambjUvC7v2g9Hp1NEpGCngHPZ5bzSwc7jOYmTWZyErSZdhP81xRk4ZEqHTItmISy8Thvj7v8qLYxpisD5jPLkVSw/1MvoeGeXIqadezj7BvxGKVyTQwE9+TdTB1DDdfJGlSTRdOr8JqkjYQiaQKfLG6Atsq4vMoYaW4Zs6nsJvqfQmEm5MrdXA5Oasd/GwDJWJV1JqPb1OFbMKDFqmCgdFzg8CcZVzJFOWKNDKrsxw9zj8CAZX1xTCJHTqqI0B1YGW9wCuf8KWDbodZcemw29FdQ+wuNQzWZz60i8LwK1lTjXTysMwVzTBxuUUDpfh1zMBSQOb/c+PYKgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4oKK8jISb4dsID29kR+t5yHaQHr+7rJen82fap4Yf0=;
 b=I2iN/svJ8ekDT3BcOWPBEfHwG2VcJzjWv+mmGIP7fBxnyBH9WzbY+8JSha+KH5wRDzfSfC8LlJmJml3tnwuA8mWAWzIQA/zI27CVtxjns7ty6jEREuBGn3yXA2SMYHtOsT/jIs4h6UTsw2NLHfUoYu50gtfqEt34XcQAV722UKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9258.eurprd04.prod.outlook.com (2603:10a6:10:372::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 10:56:48 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 10:56:48 +0000
Message-ID: <f7fa065f-8a8a-4768-9c63-fdcaca4602af@cherry.de>
Date: Tue, 18 Mar 2025 11:56:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: encourage patch
 version changelogs
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20250318035605.1221-1-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250318035605.1221-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 954ec4dd-6188-479b-edf0-08dd660b946c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFE5VjVyc2ZIektkUUJybFhzc3RoNi83TnhBd2syUXlPSGx0T0RUb3l0a1hR?=
 =?utf-8?B?NUwzMG5IaUpMdnBmb0VYYXFIWXRkNStYN1QvR1UvOUJBVENkR1g1Y0hjeklv?=
 =?utf-8?B?ZUtZUnBaaVlRRHJzc1R5Q1B4dlZKRkF2QU9wNWIwZGFJUEhhUHdRV1Z3dGhz?=
 =?utf-8?B?S1BhVjA3d0ttWXlTdHJRN1Y1dnUvNlA4aXFGK3R0TW1LQTVGZEVQekozTlNy?=
 =?utf-8?B?enc3VitPMW85L0pJakx2eW5DMEhZRmI1eUlJNEYwTFlnYy8weEZmMEgwQWJN?=
 =?utf-8?B?KzVTbTJQTnd3R2ZpZUt3dVhGTUg1N0JJLzZ4WmIzSThrU2dXandnckhpWW5q?=
 =?utf-8?B?bVJGcW9JRjh0WkZkdG0rc1hpMk9XR0NXamFEOXVHYk10aVhKY0JyTHpwanNZ?=
 =?utf-8?B?VWtzeHBmdXFadzNxRzZTYWQ4Y2w1MHVHUWFTbUFteUlWQlV2eHdpVEcyOFNv?=
 =?utf-8?B?Zzk0aWtydm5OY0hWUHJvSlpmdzlMUHFpaDBhc3lMaUk1SGwvUGRacm5VSk5T?=
 =?utf-8?B?Z0NuN240QVJvcEJKNG83WjZFZzJDN2s5WitpOUQxS1BpQkJJcmlQT29QOHdL?=
 =?utf-8?B?eU9CKytwbzg2RERSdUZldTI0emM2YzkxYnBYWjdxRW1YUkJLWDdWWFVpSVg2?=
 =?utf-8?B?NTU3cDYyZGpOSnhrcHJjNXBySHIwQXFEczh4aUZVQzd6cmxkWW5uVUtvSG1Q?=
 =?utf-8?B?MnlRajdVSVhMSkowMlJUTkRhRy9PSEdjT2NqV2hNZDV5U0VLa29XK1FaRHVB?=
 =?utf-8?B?WWwxTHBRc1BWeTNBa3BteEFCMmUzM1NBSDJtL1lYS1pYMDJkVlpnZGx3cWRu?=
 =?utf-8?B?ZUlLMk1oYU5aTk9wS09VaTh2cXpxZGVIMFZ2ZFpZWGxlUE1oV0I1MzRiN3ll?=
 =?utf-8?B?alRrRnJlRlh2cFJHRThiVWljTUs0UFNxWlRsT0NZdVZVVkZwdHlqM3JZUHFJ?=
 =?utf-8?B?aHU3c1VqMTBsaXF3WmhqQytaY2g3N2RwdVhTSlk1RWpNZm5tVXRYNTZPeDAy?=
 =?utf-8?B?Tkt4NzdRVE9yT2wxNXpwWWhPWmM4Z0hYWUxQWkc3VndGNnNsblZJb3ArMlRB?=
 =?utf-8?B?dzZOSnZqd29sQ2RGb1p6ZHhNeU94TDl2SlN4U0VxUFB4UXpucDRsVWJST2RR?=
 =?utf-8?B?TWtXL2NXSlJiSFJjNmNIOXBrNlJTbUN2L29teEd6Vm1pbnkydnJ1MnV3TlVP?=
 =?utf-8?B?c25kN1lQZEpWdmxwcTlDdFBzQWlCNjhBeW1kK2V1eDdWR2UyWUJMZkQ0bXNX?=
 =?utf-8?B?bVQxS05jWDF1VVFXaEZSVnRBcTJhUzF1YmtCaTdvdUNjTkxaYTllaVVGV2RS?=
 =?utf-8?B?SUd3bHQrc01IRWltZURRRm5ENDljU2lvM0pURDRzQVRrSTRwOVZ6NEdKWmVi?=
 =?utf-8?B?dmJ5TnBIZVRGL3liQStYRFg0NE9BTDlzMnhOMXRBNkl3dFpZRDQvN1B0Y2Z0?=
 =?utf-8?B?MG40akp6QkFCblJWdmdIVHd6Wkw4Mk5MRDkzSzgyR0NFN0lWSUVoMS8vUEd5?=
 =?utf-8?B?N3JFTHZYSWg4bVFSbGJsYjUraUI0SVFmaVVLdS9yK1JSUVM2b1JoYXVwQXo2?=
 =?utf-8?B?aHh6Q3Y0UGQyRUNPU25va2pjMVJFdlJINVhaN2pIMlBkbGN0THM2V3htTHRn?=
 =?utf-8?B?dG5SQm1helliYmRlTitiSi84S3BrYTl2di9QbDlseEdsQlBXRTVxSHlGSDVq?=
 =?utf-8?B?WVE1STcyWnVHbnM3OUxvaE9MbWsrWFpoc2xqWXYxQ2N5bUJIWUVuYUJRYSta?=
 =?utf-8?B?S1NwYUlGcU80NFBNUzQ4MG5ZRXRnMGVHSkxYRkd1YnFQN2hDSStqK2x3NG1L?=
 =?utf-8?B?UHpHSUhXMU5ySC8wcm5TaXB4SlExTXlveHN3MTY0WTRucFJtWlcyZmFHZTJY?=
 =?utf-8?Q?e5K7HbxaNYgt1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MDY4Q0pua01ubjMzT1RRaHVEK2NkR2d4V1FCdVZLd2d5QmM2enlOa2JQeFNB?=
 =?utf-8?B?V3VOT3Y1eisrajE4MFp2TWhlb3Z0L2FrMlFaVWtGQytSTnRjTnZFY3YrYUtT?=
 =?utf-8?B?elROZ3M2UzFqcXZLbldCcTdQeEJrZmJ6MmRQRDA1Q2x6L0VpbW5OVXBFSDF3?=
 =?utf-8?B?L042SGt1NE1Eb2JoMGFkMEFTTTZzWFlYWkZTUzM1Wi9uRUdQSGd1Qlk1aEtk?=
 =?utf-8?B?WXd3QVd1RWJPUmVzUkpCSUVWb0VXYlpkeFBPYllYblpDbnliYmxwd2x3ZlNw?=
 =?utf-8?B?citPdEt5MyttenM5dkNkZVZyY1UxTnhna3F1Z2NyZ2FuTTZJMFpqUjkxZ2I3?=
 =?utf-8?B?U1RlUHZSTmtSbCtNQTBRR0w4Wm9vUzVzS0lQOS91bndEc3FhME9ueUNxbkxr?=
 =?utf-8?B?VG9zZUREM1FpTjNzTDl6eXNDNTgvWm1GbHB6Qi9uQVlBNVk2b3h4VTBJU0Qz?=
 =?utf-8?B?Tmw3UkVKT3ROTzdUdkwwc0lTWkpOaG00enp3OVQzaXkxYnBlYTRad3hRUGdv?=
 =?utf-8?B?V0NPRjdzRTFkeE1qcDd3dzJybGhLdVJyMkhoWEdKelJxVEx0RFlBaFY3bS9o?=
 =?utf-8?B?dGJKSjd2SFUyaVZsQmN2V2Q2WVMreldSTWorOG9WUk55UkxIL3dsdzNjZU9k?=
 =?utf-8?B?ZDc2TDBzcE5EQjlaU3U2dFp6ak05NUZYak14RzJUZEVNMXZRQXNQQTNrUExL?=
 =?utf-8?B?NUZ1V0syV09RSTVJUmljL2wwY2EwZkJtUERVL2FYZ21GK1JXK2VsWEJXMnd2?=
 =?utf-8?B?NUZ0bjY3eGxKOUdTOXMrMFlmdXg0VFFhbVNyMmxtOEE3M2M1bGEyMmtybHEw?=
 =?utf-8?B?VFhpclhSdUM0bjcwNkpLcXc3b3VQT0VwVGQ2bTdNeW1uY2svUjh6UmJBSWdu?=
 =?utf-8?B?QXRLUlMyVTlnYi80bUZqZnBYWk5tODBVclQvY21TNi9xSHBHa1BsazZlWVBx?=
 =?utf-8?B?a3poL1BxMGtXc1pFV2FqdFU0YUhRZ2YrQ3dTTzJxR1lSR2JrTHVaelFPbkdJ?=
 =?utf-8?B?ZVVOdWU3MVhTM3o3N01IWHVxbm1KdGtCSG1hbHg4dHJEeXZjdUlXTkdxMHF4?=
 =?utf-8?B?cUFFZUZsT1k1K0h0Y2JoOS9iNER3QlBpSlNTL0R0Wi9TU28xUkJrOXJ2UGFG?=
 =?utf-8?B?U3FjTm44QUswVm9EOEVUNnhKdkNBL1NHVXE0VGRkL01FZEo1Uy9zWGxjd1RJ?=
 =?utf-8?B?U25JcnMzRHhYeSs0ck1KMGtFRHh6UUNtRGd1d3htZ05zWnpNR2VTcHVXTVln?=
 =?utf-8?B?Yi9HRTNmbWVTd2o2V2xGQm1BYnIyYlh2L3Z2YnptMFltWnZ4eEtvWVJ0N0hv?=
 =?utf-8?B?NFRqTktqUXo5ZER5aFl3YWdzSnViUnBHRnU1aUpaeUp5N3FXVzdkMVNDaFRJ?=
 =?utf-8?B?ckl6OHByVzY3UWZHcFRjWmNkZEdoYmUvak8wWmlhcnc3SkxpcVRDWUdrYitX?=
 =?utf-8?B?ZVpvUnNNVjcxT1dKMlBHd3lNaXpQeFFhcnF6YXZqOTJUSEJjdElMUFgzSDVp?=
 =?utf-8?B?MURtdDk5emFqanRVYTRTWWNUQTlBUzBFMy9xU2llMEJvNEl1WDJtUDBwak9J?=
 =?utf-8?B?WFFvdGgxU1hzeFV5Z29PenlGY0l0SlA2NHVWYm8zbG5ndTdFdkloUmFqaEZj?=
 =?utf-8?B?L3drU3pGRCtrZHZJZGlSdWRkZTNlUHNFZ3B0L2ZQa25wSHRSYlpUbWRrTnhW?=
 =?utf-8?B?MjI4ZE5ubmpXcEVQTlVWdTBDMS85UTdCZnRCMXFBS3JmTWVTb1YwdW5jbHQ0?=
 =?utf-8?B?N2tROWhORW1OSmZzNmVsQnR2UDN2bUdpR1I1MEVkem94ek4ycjNGTE9wSlAx?=
 =?utf-8?B?N1FjdzFuOVZ6UGJPT0dQb05OTWR5eHVBeGtnM3NTNVRwVEVQbkdBV3l4cXc1?=
 =?utf-8?B?czBYZlpjR3V4eTBSeGQ4aW45L3RyS2ZxemY2Nk5XeHlhZ24xOWZEa2xxVE95?=
 =?utf-8?B?cHFnRDJIOWVCc08yWUt2TkJDcnRJSUFRQlNqRk1ZaFEweHF2d1BFYzB1OCsy?=
 =?utf-8?B?QVlnR01td2xOZVhCN3lEUGZBSzdBQkRpRWNRYkVzMVJXQWJPeTJZYzBEMlZI?=
 =?utf-8?B?NGtieEk1SDc2UTVldUtMNFRoTmJBOUJpTzljMTY1MTdjUURiMlhXQWhoWnNR?=
 =?utf-8?B?QUNTcVlvRll5RFhyRDBrS00vL1VzM05RVTRySGZ5YVd2RzRUVEJOUCtMU3Fm?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 954ec4dd-6188-479b-edf0-08dd660b946c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 10:56:48.7709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCS1uX2VsvvMcx3Ay+QgzBpz2xqn/xRqGELC8HsFb0AGkUc5UKhkW+NVFiGLtwac7Ez4nOp6qb4XaTzqaZjZSDnhKUM/NOZJDJViDAY8R9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9258
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:56:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6592

Hi Trevor,

On 3/18/25 4:56 AM, Trevor Woerner via lists.yoctoproject.org wrote:
> Add a section after the 'git format-patch' information encouraging developers
> to add patch version changelogs to their patch updates.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   .../contributor-guide/submit-changes.rst      | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 0675aac984cf..5ade6ba5cdef 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -776,6 +776,38 @@ argument to ``git format-patch`` with a version number::
>   
>      git format-patch -v2 <ref-branch>
>   
> +
> +After generating updated patches (v2, v3, and so on) via ``git
> +format-patch``, ideally developers will add a patch version changelog
> +to each patch that describes what has changed between each revision of
> +the patch. Add patch version changelogs after the ``---`` marker in the
> +patch, indicating that this information is part of this patch, but is not
> +suitable for inclusion in the commit message (i.e. the git history) itself.
> +Providing a patch version changelog makes it easier for maintainers and
> +reviewers to succinctly understand what changed in all versions of the
> +patch, without having to consult alternate sources of information, such as
> +searching through messages on a mailing list. For example::
> +

If you're looking at this from a maintainer perspective, maybe consider 
using b4.

For reviewing stuff, I sometimes do

b4 diff -v 1 2 -- <lore.kernel.org URL to v2>

and that helps.

This is orthogonal to this patch though but just wanted to mention it :)

Cheers,
Quentin

