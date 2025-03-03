Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997A2C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:14:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.58])
 by mx.groups.io with SMTP id smtpd.web11.57439.1741018494321859923
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 08:14:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Opxk2iS8;
 spf=pass (domain: cherry.de, ip: 40.107.22.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hi3rioFZZDUTledjmqbWm31cRvu6qJrI5mjaJukTnX6YhVABMSuDO0MIAJQ6PcadegcOwmeZcu3/kQNVLB5T8JTQxEcNBPxo1vywdrypU90d6xc7gr9QJAVnBbc59E0jY8ZlJRx3ZdmDPt+E4a8pcfw0gsQaR8oPk84OGSY1EYn5JG5DZ5IewvopkBo4DDHHShCdjrMw39jc3AfqjeQhzpA0FxaSbKKhJQ9ScVu442GlDmAbvGMoN192m8J7C3HJ7uQIVMPL9599uLkiD6IOdDYolsM6uTNxNiwqnN3aSQoTlCS7hAC2Jia1uD8wNUqAXWm7rVryBpCdy8y2d+OEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAGyaNVjWqONGOlcIGh17HzNALxq6q9bpPeIcJedjCs=;
 b=E205TouXTH6vySdBqxmAKGmB9GlHrQt4WkO2nxXc5SfdOxtCjso0pmhDfT5DmqDnaJYoYHnJBrbk3NPY8szKdylH4xLNz4d2xYDRqonEgOcaurXMtV7G+/ezjZ8B3KXeuTVIivGdcmIiL2/hbJUpgWRDh6J/iX/EFY4bEV7mF7gu3IfSzL23xZoFO2D56MHZu1Jq34iTKXxvQXtTta3eoPEs3Atl4MRei5ZQ82UBVPk3E+avt5uE6oE26/Gy0ykHGZSWfQyH+rQmkDif6OvfL1WhoFCMSiMQ5m6Uksg/CM1nIKjByMUwlfe+adIGa0OJM37wDeYhQk1y2QEmYLh5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAGyaNVjWqONGOlcIGh17HzNALxq6q9bpPeIcJedjCs=;
 b=Opxk2iS8mmPlRIFIZEj0e1g6j+AzD5Rih5P1gPl6ttQcA6dKtCJxQl2xQtXEjNxAhzoXyRi2pEFOYLVwnZMiK71DOH9ZFKmp3xtoEcLZNIYKQXBCwo8VHV9/F0Hjpx+dta4Chaaa+ZVMPhrsOWR672wd0XZbHPY+Iy56TiQEWn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7712.eurprd04.prod.outlook.com (2603:10a6:102:ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:14:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:14:50 +0000
Message-ID: <2b5e2265-23d2-499d-859f-a450fb27c608@cherry.de>
Date: Mon, 3 Mar 2025 17:14:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] Remove all mention of core-image-lsb
To: ross.burton@arm.com, docs@lists.yoctoproject.org
References: <20250303144502.308036-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250303144502.308036-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0271.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 59133479-ba85-42f1-ede7-08dd5a6e8668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VzA4V0xQQ3dMWEY3Rk1WZ091cjlUV2QrTTYxQ0RhSWtnWG1MdGJwZDZCNnhX?=
 =?utf-8?B?eDdURXBTMk81bHFhVS8xenVjejQyMTZYZnZxUGcwMUg2YytwSFlXaGxpRzJ3?=
 =?utf-8?B?MjJCamdQMnFoNEt1MEUydG5DWjMyRXFRMVJZSUlyemdSKytnWWRkZGhsMGdU?=
 =?utf-8?B?K3ZMcVI1UVZzQjZjVFVQRVhaY1VnK3VGUnpjb21Sc1B3aTJiNzA4STNpcWVr?=
 =?utf-8?B?aXFGT0dxM3ptM2VsQTliL3ZDVVpEYk5CT1ZPQTBjWEl3YUFlWTkrUUxCd3o4?=
 =?utf-8?B?b1piMnZ2S0JUMytMd1VZeVpNeXdlc200MUd5OE4vS0JDRk16UndSdVRldi9W?=
 =?utf-8?B?NXhGWU4zTGg1RzNpaHRzM0NUQ3VNYnhaSWtzbnhTVVpHNHcxVm1OUHExK1Fq?=
 =?utf-8?B?aVM0bzJBcjVRL3NmR1M3U3hlcXFYazQ3RDc1TUpYaGo5a01EMjVuQlI5SnRy?=
 =?utf-8?B?UkdWTk1LZG9ETDMyOFlOOXlXbnl2c1NFZ0pwZ1k5dWhmU3Q1ditUZEhHYk0r?=
 =?utf-8?B?dUl2MzBTVE85dGRLejZ2UUxDOXBuSHFXSUIvNVEySXVKTUlVcmtMK3c0cUdx?=
 =?utf-8?B?N2dqUWJpUWhsaUw2R0V0bjhaZlZ0RC9xTFNRemJrc2Yrc3ArME5vYXJ6YVc3?=
 =?utf-8?B?d1ljRGI5WjlTTkRNTVd2VFFuQVB3L09uc2VFL3NieVBjalVKSlRVMTZWZlpv?=
 =?utf-8?B?MTkxbXRTdE16N1JLVUhuY3UraGJ2TFU4UkxNV1R4NUtyZ2RWMVovL2d1dzZV?=
 =?utf-8?B?TlBpL2pGMldlazMwZVY2NWVmS1prRWZKa2RvcWdMRHN1WXlDaVArOUVOYWFr?=
 =?utf-8?B?WmtuQlhjVnppYW4wMlZzbDk5S281SFVZemdTbk1DZkZwS3Z4SGVsOFJ6cVNM?=
 =?utf-8?B?dGwvMEt1dTZpTklncUM3MEdKZHMvNTRoMHBZSUhDeHlOWURhQVhwSXZrUmM4?=
 =?utf-8?B?UzkvRm9naTQvYTMvLzBISWdQK25uN3hkM3ZOVkY0R3NRcEtsZ21ncnRISEo1?=
 =?utf-8?B?anhXTSs1eHpUd2JNUWMwUmZpYXBSSk5yeVVIWm96czdzMkJWMVZ5K3lna2l6?=
 =?utf-8?B?ZStNbisvUUMwK2YzVnljelhlM3V4cWYvYjNCemlDZzRSSGlMMUNhL3NGOVVS?=
 =?utf-8?B?ZlVIQ2g5eVRoMFBFTmJEd1gzMzE3UzBvYUFDYXpua1NzTDdKdkpLbHAxZEJh?=
 =?utf-8?B?NXZPUm5WZXhSaGI0Qk1mNlJMdGlxSy9JSUhRenAzakxjVzdwa1FZMDdhUjkr?=
 =?utf-8?B?Q1pLL1ZvMFJJUTVOZGpVbFNFQTdVSjI4d0hkTXQrZlZWUngxSTRkMXNaZExu?=
 =?utf-8?B?dmhUcER5bHlXRlFSRE04SzhUeG5uVWxkVTF0bTVJc0NabU0rb0dMQ09Lc0JC?=
 =?utf-8?B?Mkw4amcwd1gzQlg3VVVpT1E4czAzblh4Qy95MDhJR3BzNTNBZjJzWEpuRjBJ?=
 =?utf-8?B?RnNuZkJmdktXditBdVF2elYwTjQvUWJvVlV6aEFmMzNMcmh5Ni9mZENEQlVF?=
 =?utf-8?B?WjhWZnRlaFhpNmh4SkJRRGR1ZjBpdE9lbTE5cFJBT1l5VHY0dGZiZ3EvcExG?=
 =?utf-8?B?R2xCOE9tVzB0ekZlK1ZqWjh4dHZpWE9ZOXZITnVJdTZvWFNpWTNtZ3l6OXFa?=
 =?utf-8?B?aFRIeDFVZER4elpKNXN4eXZOSmFYV3lGYzVSUTh3YVdRYzU5U3dVcFNpenB4?=
 =?utf-8?B?N1VzNnMvR0UwZXhYZjR6NUM4NWYybTBjQW5hVEJJeWVLUVNPTmZIbjdVRy9X?=
 =?utf-8?B?Q0FUclN5YnlZSHc5a0dCdXNRbUNIcGRUb29nL0lJS1ora3hNT05vYklKVVNF?=
 =?utf-8?B?aEYyQmMvK09MZDF5bHpyVEwxN25qb3lBL0V4c3pON1BjMzRGb1N0OGxMYmZI?=
 =?utf-8?Q?fMnmCOGqRs7Tj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXVnUzZpQjVMMXpGcVBETG12RGsyU0tBQzFZQ3JaaTl6WGhvWXd4aENLamhH?=
 =?utf-8?B?NVJ4eEdwV0ZvSjFWTEJOSloyOTIyY0ZWZVl6SDV3bVNEekh4VVh5NU1lUjdC?=
 =?utf-8?B?R3ZId01raFpGcUUxeVcxUmRnY2hnYXh4OWJ5L1NDa1o5Rk9zR3orckV6QmhE?=
 =?utf-8?B?V1BST01URk9xcVJ0V0RHM2t2eUJvL3F2eTJWTFJtaXRRVlRtWjIzMzdRNGpp?=
 =?utf-8?B?YTBMZTliWVNEdzY3bThuYThYc25mM055UkVtc1FYeDRxMmVFQlpIVjllclJT?=
 =?utf-8?B?Mk4ybFc0d3VwYXhpYUFYcERHQ3JlR0RQcG5aRXY5R3JwbkpseUc3aEJoSERu?=
 =?utf-8?B?czlIUitPNkcxN0F3bzIyVTJlODJQMmZqQm9zWStKSlRBWWdOMHhCcGJYOFZ1?=
 =?utf-8?B?Vy80UGJCY2RldW9GVDQ1YVlrRVo0b2FCUGZCTWZPL2ozcExCQXRCd21uT3ZD?=
 =?utf-8?B?NjJ3Y1dkcUZ6cDJHa0tkTmRlVHVTbnhkWmR3V2gxUHI2Q0tzOFVKVE8rWHhN?=
 =?utf-8?B?VlREYXo4eENRcXdrY0lTWG5yb3J6TnNSbEhpOHJWeUxqanRsT3lMZ0N2NUJm?=
 =?utf-8?B?TnBhTzZtUVFoRWY4VEw1REo5NEdITkNiR0p2VFB2czdpUkI5bkFpSWtidkxS?=
 =?utf-8?B?VXBGQ2dIdzRZbVhFMHZVZmtHdmZpZnBPMGpZWGp0RVdXSDlJM09DdWo5SjBx?=
 =?utf-8?B?L05OS3R4M0dTMUlaUFNLVW95VDVjV3VmUG05aUsyV3dNeVNsaDhoTmZmSnFI?=
 =?utf-8?B?emIzSnQ1N2d4SVgrOTdtSUVTRnF1cWdaV2txdXRTYzgxV3k2RCt3MnJpSDBn?=
 =?utf-8?B?ZkhxNEZSU0FjSk5aUm9SY0lwWWFsYnRnNkkxVXRnRm5rTTcvQVRKTzA3QWFy?=
 =?utf-8?B?dEtHSjZPYkcvVWYvYm1UWDQ1b1U2TXFHYlpiUVFZVmF2T2kzdGRwVUYvL1Rt?=
 =?utf-8?B?VjVCeHdFaGNjVEF0eS9QSEMzYTRiNzZ0ZHdUYm5GWE5HL2JWbkdISklLWTl0?=
 =?utf-8?B?UDhFSzZwUDZLTHZUaDlIN0hCWVhpSEhRRndFeWZ2RzcwQkR1M0xIWHZVQnFx?=
 =?utf-8?B?R015K0lVVmtJa1hPVVk0ZUlHam41enl3a0lKRUg0dlJXSFovaGVFYzRzaDlu?=
 =?utf-8?B?TmduQUhzOHhwK3Q2THVzUktXUURPcmNqVjAyeUw4QVlqU3V6ckFFTmlRS3dB?=
 =?utf-8?B?bXpqdk13WHlNTTBCZGtnK0VXVHk0SlhrVEQ4TzNFQThPVDZKQVE3bWxRVDlm?=
 =?utf-8?B?ODRXUFVnZmc2RXBMa0toTTJnVFZTanhURUg5S3lEdTVzd3JWbXk2MEUzaW5h?=
 =?utf-8?B?VFFOUFNkeFBJNW9sdG1GRFYwVDYzQm5OU2dyNVFzQ0dWdkpNR21YbHd5MXV1?=
 =?utf-8?B?cThpbmtyMnBzOCtyeWhlcVdMUzlmaFJYOUJqaDNtQ01FKzR0ZzBYVFlEOVJa?=
 =?utf-8?B?aytxN0VtTmhhZnE5RGluRnJvTlY3NDBmbG14VnZJaUl3dlhhTG13Z2paZndt?=
 =?utf-8?B?NFMyNU1yV0FCMTFYY3VHRTluMFNBekNESEdoaVMvVW83Y0tVUENMVUNsRjY4?=
 =?utf-8?B?U0xlNzA0UU5CQkxaMDJmU0VuVzNSTjVGV2Y5N21EamI3ZGVoWnhhTGcvaEFU?=
 =?utf-8?B?dXZXazRpNGUyNUlGVDBFaDJuSVhMVXNyYnNJbGJBSy9kU1F3S3dHS2VlRzNH?=
 =?utf-8?B?NldlSXdpYkVZYWM5M0pUUEdDMnVlUlpaU1BLdS84d2pSRnR5d0hnREpFdWtG?=
 =?utf-8?B?M2F4MEpqdVBPSTZpQUYvNFNiS3BXZkhPbHduUVJWbjd0VHo2STNhekxxTVFE?=
 =?utf-8?B?dzE1dHpDSHN5dzY2Rll0eUY5R0tSZGhxemRBYk5CR2pvUHlDUW5XQUF6aVFa?=
 =?utf-8?B?RUhDWUJ2QTJYVlNNWDd0eFhrSFhsNFByb3RKZW1yQit1Mkw5Mk1jSVVoeWx3?=
 =?utf-8?B?VUxnT0ZLc2l6ZzJBYStXdzB5SkliOVN4SjBadGdmVVlIbzVvZzlFbHVUUTZ2?=
 =?utf-8?B?T3JyNW1wWjQ1SFAwSDdDbmhWenZ4VzN2TnhIOG41L3RHRTdGeU5tS2hyVEQ5?=
 =?utf-8?B?NTFIbVhlajNwMHduYkJnVkZWY0ZFWjZwQjA2WWhWY0h6bS80NTZPQnFaZEFu?=
 =?utf-8?B?TE83OU5hcFdOUmsvU2U2VE43bmJ2MG9nYUJ0ODB4a0FJZXdoZUhUSHRlYm9i?=
 =?utf-8?B?YXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 59133479-ba85-42f1-ede7-08dd5a6e8668
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:14:50.6342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNeOL32A69feNXwmkmgROZ4C5WFIBn5mRhW9d4sSp+5OiPEtilTCLfYWEUhI21YvUew4F4IsM50SAPZVaO4zaqCm6CRR13T51zQiq08V5Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7712
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 16:14:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6487

Hi Ross,

On 3/3/25 3:45 PM, Ross Burton via lists.yoctoproject.org wrote:
[...]
> diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
> index 19f3e40d6..47dcf4e82 100644
> --- a/documentation/dev-manual/qemu.rst
> +++ b/documentation/dev-manual/qemu.rst
> @@ -280,12 +280,11 @@ present, the toolchain is also automatically used.
>         networking.
>   
>      -  SSH servers are available in some QEMU images. The ``core-image-sato``
> -      QEMU image has a Dropbear secure shell (SSH) server that runs with
> -      the root password disabled. The ``core-image-full-cmdline`` and
> -      ``core-image-lsb`` QEMU images have OpenSSH instead of Dropbear.
> -      Including these SSH servers allow you to use standard ``ssh`` and
> -      ``scp`` commands. The ``core-image-minimal`` QEMU image, however,
> -      contains no SSH server.
> +      QEMU image has a Dropbear secure shell (SSH) server that runs with the
> +      root password disabled. The ``core-image-full-cmdline``QEMU image has

Missing whitespace before QEMU.

Otherwise,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Should be backported up to Zeus (or whatever more recent we still 
maintain docs for :) ).

Thanks!
Quentin

