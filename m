Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6AAD1AD5B
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 13:36:37 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.52])
 by mx.groups.io with SMTP id smtpd.web11.23428.1729085793999575361
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 06:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=I8vjLeju;
 spf=pass (domain: cherry.de, ip: 52.101.70.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9JI795n/BJcuex4wU20WDv7clCrxNt0sGcn6xb5cmU9RqCkykWypDe4SaSHQn1xhWSxTzI4GEuLpEwOlJLX4kUs6SmsV32Q4VUX3gF9mViShdfSluk84X6D+1M1VAQRCjOSZId9eKhxbOuOTwTxSxhAS3Y1D1CgEbIisNOikeMoVsR7K0zhAkvJYS066CFksCELSjY8nyr5jtpBrbLF7TdG1KK2vx9dI2jr00QNfoWi/p9MzvPzICBQ+xuX6hT/qkhwlKq+WiNgNF2B+oZyFZRGt6Z+e/EbtzlW+PVwgPPiC5uYWmTLyGPEik6KTK/0he6nTpNLiktBu/QYvNJTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+7ALT7yvhPJ3WohhVweuHqU7TGJHiVxFpkFCEU1qR0=;
 b=EZMF8bivnfOQBIht+rCrdPx4SnlPfZU84JOm8xHBY6xENYh8poh8B67NuNSkGmtTeY8QVWCzQx9+zcjkUzLHEYa5vRsrZf153VmkimTSn6m0QP3WqSfWaTCEX6wEqw2G0mgLKsM4EZwJAsblUd+j0B9w7fAPp2Ie3OeFvgjM1ycyHcAkI242uulNcYMVaGW55ChX4Cq8i1t/iTNO1jdjJcNlpWE3rf1mrvHmVdtflVcYAhsgz7j3fOM76WmssdnGWGc6sReUbUSEsqLhsWCSyVMaD4r1Te7i1BlgkYdc7xisQ7sgSKD8TUklXzDlLElKFRIiSncgGgxPvBJ/drDgEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+7ALT7yvhPJ3WohhVweuHqU7TGJHiVxFpkFCEU1qR0=;
 b=I8vjLejuRCabpvaHg0An/Dod6osfLKNotuOGhYKyKRdqj8P7DV4VBQD+NrhmoLi+sadiLWyxPL+yqIrsl41bRBw+Cb/7c9Xkdnlso+ylXJjeURRSnKHndWjW8TNSRakQ5h6J93xR6VPb5Cs2xEv18r26vjKoM9OnAeRiBpHzYpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8589.eurprd04.prod.outlook.com (2603:10a6:102:218::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 13:36:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 13:36:29 +0000
Message-ID: <b96c8eaf-df55-4276-8ec0-d7e8a7b60f42@cherry.de>
Date: Wed, 16 Oct 2024 15:36:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] release-notes-5.1: add beaglebone-yocto parselogs
 test oeqa failure
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ross Burton <Ross.Burton@arm.com>
References: <20241016-5-1-parselogs-beagle-v1-1-ade903beb18a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016-5-1-parselogs-beagle-v1-1-ade903beb18a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: e14bb026-8d41-4be3-c011-08dcede78a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NVVaSmlETC9vMEJ5OEZ6cWRqN1F5ZjBsMlA4S1dkZVRiTERRaFJadTRMMndE?=
 =?utf-8?B?b0VSZUxId3g5elNKL1F6by9RSHBVVzVSc0RRL3ZqSVFoNHRzNHNyMFcwSzVw?=
 =?utf-8?B?UkMyRGhycWU5bUtUTHFlUW9PL09xSWNyUmNCdTMvUnVNTjhTbGlGYkJ3RlNW?=
 =?utf-8?B?WWFDZjk2M0pxM1pWeGhXeE5VN0U0TEhMMXJWRXpPdEV2bThxOXMwcFdseU5r?=
 =?utf-8?B?cGg2cDN1bUhqMXlzWjRCMzNsc0RzZXZqQ28wSWVLR2tmSHBZSVNQaFBUTVd6?=
 =?utf-8?B?UTFIMEg5YytvU3Jnb2s5RVZrUVlITXVrTEIvT3BWaUdSMmk0dS9McHBXS09L?=
 =?utf-8?B?YUNvdDBZaTlpWTZqNDI1ZW5mVWVlSENaMTRXSXN1ZW43cTE0L0ZRRWEzU2pu?=
 =?utf-8?B?VzdHdXNPR2hYL21nemhQRXB3L0srcGRudldQVUtjWmxFbXYwUnZIUFZYS296?=
 =?utf-8?B?YXpXSlU5NllXaDdLTXpaZjF3aG9RVk5KdVFEUEdTOU8wdzVmL0QrNlBoMUZ3?=
 =?utf-8?B?Y3R1L09kVDZuR0c2dkI4NHluUXhCak42MjduM2VHVEFQQTRydHVuOEdzdndB?=
 =?utf-8?B?elV4dUtWQWJmNWlvSkRPUjZLSEFtS1dOVmRNVkdtNlNpMGlwQU9XNHp5Nnhw?=
 =?utf-8?B?SmpIUEF6Y05XY1RMTm1qRXF5dTl3QlhpUEJQZHd5NmpKNTBOSHhrMVZxa0Zr?=
 =?utf-8?B?TzZkL1J5eGxOUE5pM3h4TEZjcjN1L1VzWnpsSCtHZjNGNWVkSDZsT01KdzJW?=
 =?utf-8?B?WVRyNTFuY2ZFTDQrMHZjSktFZ3VVZGpWbEpwUlJjcHdqMXlFaVBhcFFCWDVC?=
 =?utf-8?B?VVcreTJ0VENaemhSdHBDOEthWjNYUjFOUnRQRkE4L2hGbmZPZnlJOFFYSzhX?=
 =?utf-8?B?czVWRVFIQWsxUXU4K25qcVkrWjltemxEMXQzZVdmajBhbjdRRjU2K3YrMXhC?=
 =?utf-8?B?UlIzL1puamtzNFduTy9IQkJZV2lzZTkrbWNqSlZNY3NuSW9yTytPNE5Ma3JB?=
 =?utf-8?B?NkFJcC9hUlRMYUNsMzNLZnNueEhIblZNdmNrK1YxRnR2Q2kyaTFiRjRES0ta?=
 =?utf-8?B?d0dRS0IvaStwUy9oZXBmUzVScTZHb2F1WUFUMHFDVjRRaWkrTVlMK29HMi9q?=
 =?utf-8?B?ZmR3WWNXNXNycldTSmZrbHdHSmVsR3p0cmsrZFJ0Wjd1VXJiRUJxM0NMaFlv?=
 =?utf-8?B?c2JHUEtkcjJENEZNM3hqdmhCS3lGVkNoNWUyNldzUUZhOHQxNVlGOHFXTGNl?=
 =?utf-8?B?eUZEUmJwaEpUd0VuQ1haRHF1WGo4NzcyMUo3d2o1NkJnNzdqN2d4d2ZBanJ6?=
 =?utf-8?B?MDFDWFptUWdRRFZEeC9pQXhjSnBmRnVzZXAwckJhcGRrUE9SbHVoQ29qdkJp?=
 =?utf-8?B?NnFqNnZkamZVVENjMVV0YngxNWI5ZXRqN1FJN3g5cnpFSUxxalAzVHhBMDZP?=
 =?utf-8?B?b3QxTG9nOEdGdUZUUktiQTIyWGE1clpXVEZUQ3NLc3JDc2tHeXJDb0dmSUd3?=
 =?utf-8?B?MWR3anVZYzlvVWdqcVowNzhMUkJXNVNPcXlPS2lXaTNsTXdoZ0pJNk0rNGJS?=
 =?utf-8?B?clY5UTQ4Zmp1UWRrOFNwSXNCOXdFREJhQVlYcW5udDRuR3dDblgwMzI5MXdZ?=
 =?utf-8?Q?szDtXPMedLk51iBYtQVMXcuvKws+zYprXena6dpjz/H4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDF5VHZhZSt0ODFmd1JkMytVcTZ1MEx1M3JpeDZ5bk1QMXpOM1lJVHlVcDMx?=
 =?utf-8?B?bDhMRU5LbUE3T0dJdXhCQmRGV3pQWFllbEhSUWZCUWF4ZDBHV3JlN3JJbXdL?=
 =?utf-8?B?QkpqcTF2SUVKMDVxMEttOFVKTExLZmVsaGJQQTV2cFhreE1YTnFSZ1FUeGRk?=
 =?utf-8?B?QmlqaHpnd1p0VGlWenZQUVhlUXBKOVBmZCtSVE1BSFFmUThDVWN6Ukl4U1Q5?=
 =?utf-8?B?WHhQY09obXJEN2wzREJ3bGxDbk5wOUlMZFRicnRlUmw3MkNJOHhOMkV6QmY5?=
 =?utf-8?B?OCtJYW9Hd210enF5dXErSU5xQjQxc3NxcnB6M0Q0WmNuRmd0TVVpRXFOQkky?=
 =?utf-8?B?aDVqOGlQVmpPUVlHMlFZWkVMN1RaUnMzd0VkNW4wZmZLYm1nTEJtbFIyQnBV?=
 =?utf-8?B?elNFL2Q2cEI3L2lOeGhOL0pIbjdyWHNFUER2MjFRWnN3TXJWN0pmclF6RFQ1?=
 =?utf-8?B?VkNUWjdaT2llL050cVhLbmxKNzlkYThiNUg3R2Y4YURFT2FvS2pEL3lIRVRG?=
 =?utf-8?B?WGFkR1pNVjhCVElGbkNjZmF2UGpiUGVRY3FnU0RmVTFqSURFZEFUZzNmV0pE?=
 =?utf-8?B?WDNHcmx3enJtYnZUWndWdDFCSUdlaDJNVUc1RERBQW9KTWtVRlJDR053NXFj?=
 =?utf-8?B?QUdtb1F0SDBQL29MWS9VZGlrMWZGZ1lMcHQ4WEMyMUhjbUxPbW9ObVpJa1Vw?=
 =?utf-8?B?c2l3MXo0NFc4dmw2S3l1Qi9oZGpPcmlWZXdiNVgwSXZBZUdFSC9UMzhXbzJa?=
 =?utf-8?B?YnBGbi9ZcGgvZS9FY1Rzd1ZoT0dqRmNsZGNpYXRMQ2NFM1pTc3pTbitldDc4?=
 =?utf-8?B?WFlIWktyWXVaY0tYQUlHa1VTNSs3N3ZucEdrWVhwWlRtMVV3Vy9MclBvMzFo?=
 =?utf-8?B?MHFTMktMOHBHcmllS2VoVy8zVGpTNXdiYVVTN296cW9tYWVTd2NYUmxZY0I5?=
 =?utf-8?B?YmZHNEJZSEp1MjRFTVNlQ3UvczdqUnAwZGVGWW9oZXBCQmtGYkJycGpZRnRn?=
 =?utf-8?B?eHNIMUxtY01TRXlVNlVlR3gwYXdETTREdVJhM3M2RVBuQUFnVGduWWFmZXph?=
 =?utf-8?B?anhUR2lDTlhzR3pxZGxub25URnhVM2ZHUjkzbFpaSHdFa1VNOUdnOTByTkJH?=
 =?utf-8?B?bktyWjM2ODE0Tlg4aHRYWGQvL2lsL2RUMjJCODg1TVNndlNIVTZWMWJPWkkr?=
 =?utf-8?B?NWlmMkdLcFNkL2d6V0V2djNkQnhWMEU3dXYxQlNKbjllRWZIdXJPK2JCbS9U?=
 =?utf-8?B?czZ1cW5SVHZaMnFkaE1kTFZjb0pZa1R2Yi94dThrYmVBbHkrSjZDY3FlWUE0?=
 =?utf-8?B?c2p1YTBieU5LRjhFeFhZdytjSWloMXpabG9oUHRId2x1U1pPbFZGZzFEZ0Er?=
 =?utf-8?B?cHoxcC9jTVFSVm12ZWQxbWloeDRmclEvbGpobkx3bDJqeFg3a1NFZWNPeGs1?=
 =?utf-8?B?R25NYW8xSWwxNWg1WXFGaWR1cGxXWFhIQ05TcE9MS05MbDhYSDV5emtHdGxH?=
 =?utf-8?B?eFZEZmxiTEh1NU1Ga001TlFIMldqRjRKRGdiQllUK1NZc2ovam91bzBTczRl?=
 =?utf-8?B?VnpPeXVPTHgvVzlzd3B3RHNBUGwzZ3FVQUo2WWt3NDNYMmxJcmE5R2owSlg4?=
 =?utf-8?B?ZFNHaktHSVdBQ0ZENnNaS1VrdG9UaWp1a1hPeHhJQU9CSjNsQ3B2OUx0ZzRK?=
 =?utf-8?B?a2p4a2IxZEpPaGxOS2w1U3R3TW1LV1FZTWVvenVzYmU1VEJ1OGppVXJKN3ZP?=
 =?utf-8?B?Sy9ZaG9vVStLMnVDcWhId0hXNVpvOHFyU0tXTE1BV1pWQlNhZ1FrZWhqYWc2?=
 =?utf-8?B?ZkFOS3ZWZnBjVDRwbmJCdHB0YVBXOUhRMEJrSHpXeVhLZ29kTm1CQzNxVlRz?=
 =?utf-8?B?NEZnMXhrRCtRZlM1WUxqWmg3ZnU3QTVoWUpJZER4VEhCL0dQUmJUN1dLaVpL?=
 =?utf-8?B?b2hGYm9XaGFsTkxzeGlBRzhpa3lTUTdoelZaM0RHNVM1QmVNbFZyRW5rOXVQ?=
 =?utf-8?B?eG1VQ1B4aHV4T0RMbUZSbzdpRXhXVit2bG5pdnVmM0ZQZ1FmWnMrMlFvb0w3?=
 =?utf-8?B?RWN0WjlCRlpNaHI4cHJFWkUwOURzR0pUNU04ZWFXZUhsTkZkQktCemYyTmF0?=
 =?utf-8?B?VGU1SEFlVDlRTW9ZZTFTRmJkNmFKZURYblJybWRITndqZXZKUGhna09VVitu?=
 =?utf-8?Q?zKNmN7E+LRAw1YCS5nWFDBA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e14bb026-8d41-4be3-c011-08dcede78a58
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 13:36:29.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LY5N/qYy0XI93X7UAhme3d/hU7p0dfuVVDybQps7K1iUL08xEu0XCM0FOOGn/9ohSQZ3Zg1fxzwAgQ6k72wYiUkO8h7moIyoskN2SJXgcr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8589
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 13:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5509

Hi Antonin,

On 10/16/24 10:33 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The beaglebone-yocto currently fails the parselogs runtime test. For
> details see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15624
> 
> Reported-by: Ross Burton <Ross.Burton@arm.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/release-notes-5.1.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
> index 0f1cb5312e1a59fdfff2df57e98b6c4a27bd589d..7ce1ef2299189f7bdc566a8e549f4dea105626b5 100644
> --- a/documentation/migration-guides/release-notes-5.1.rst
> +++ b/documentation/migration-guides/release-notes-5.1.rst
> @@ -402,6 +402,12 @@ New Features / Enhancements in 5.1
>         scripts, fixing some issues seen when :term:`PACKAGECONFIG` would
>         conditionally modify it.
>   
> +Known Issues in 5.1
> +~~~~~~~~~~~~~~~~~~~
> +
> +-  ``oeqa/runtime``: the ``beaglebone-yocto`` target fails the ``parselogs``
> +   runtime test due to unexpected kernel error messages in the log.
> +

We have a bugzilla entry, so please mention it so that people can follow 
potential resolution without waiting on the docs to be updated (or us 
forgetting to update it :) ).

I believe something like,

:yocto_bugs:`bug 15624 </show_bug.cgi?id=15624>`

should do the trick?

Interesting that there's a double whitespace after the dash, was that on 
purpose? (Trying to figure out if we should mention this in the 
standard.md or something :) )

Cheers,
Quentin

