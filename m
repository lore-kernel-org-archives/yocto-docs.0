Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC68D42BB4
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 17:15:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.10])
 by mx.groups.io with SMTP id smtpd.web11.92304.1731431716759182905
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 09:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gKlOcrEH;
 spf=pass (domain: cherry.de, ip: 40.107.162.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=af1/gLsM5MGUrnW0qPWguUIM2MV631kE16YsbpIV+lPu50I20b/X274agCUIdy4tlii6CdhtpEg9atEf61q228jW1XEkXeWwbhjC6j2XqaNH46TOvkKVhbDDu/3892A4nzl6twsO5ZqMjp1NrpVLmAoZgfmJWRKB2e8knLvV79ykOfeHS50PGJSNY8gAjkDX9GyfwEb5W4Ki90qFP1JcsdXi3av0Nke6l7yiLBkM9UV4LKgLJLaanawdJWNG4k+TztI9eE4nI+D/P2FnIs5vEGj55VnBqq2Nkqg1Kk+4qnAOqOeZRPlSJiS4FK03FiFzIZ4so6GZGGl69y2lY0Y71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3v+zbBKCFt6Y99kwNb7kPts8Gc1+v8uAQI0kXidOf8=;
 b=EZWnRcCk0H2RUFF9Da58hzNyCphsIqP69NPUsVaZqKgygv6B+NfWrdXLGFba+DIAywgiOMpEXOeb9njsW2IXApZ6p6HrDSof6ahRRvCNz3Pk5GIUerDHoJDETvxPUqFTb1puEL9O/rYwJIrwoVIFg6npCQ7Iq/Gy+grIbQ38oJn0bsVV70SE8+HUHoxH2BWZnXwt2rFmeZWjNim7ZLlNnWw2qdnxSJNTUpUAdlQ7LDC3Gu5byjXr0W5nZWpcblqOQH+Xv3rEGQLQA/Wwu/Tt0KSdJSCsU+S9GxqPW49GjNDZOduUls68Y4BJvIrGtBF0PWxFDmbQF2MpNiiEa7rP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3v+zbBKCFt6Y99kwNb7kPts8Gc1+v8uAQI0kXidOf8=;
 b=gKlOcrEHn77zAS/zERbM7rpwzNpr8Jqxa412PoEWULzCi6a/3DIarGnQusDaXsCfLx/j+1pew1dSadjFwLQYIW/C71xeptHvkh7aT+mywaYSURVRdHwbSO+WcDbZbVlnj/wllhWY49BYqfp4/dS/XarEUY20MkA1JC1zVP00Ek4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7691.eurprd04.prod.outlook.com (2603:10a6:10:201::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 17:15:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 17:15:12 +0000
Message-ID: <7dbc6473-1bca-4bc2-b998-f924fc580137@cherry.de>
Date: Tue, 12 Nov 2024 18:15:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] migration-guides: add placeholder files
 next release
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241112-release-note-5-2-placeholders-v1-1-a15b66eae472@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241112-release-note-5-2-placeholders-v1-1-a15b66eae472@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0126.eurprd09.prod.outlook.com
 (2603:10a6:803:78::49) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcdf746-dc9f-4e37-fdd7-08dd033d914c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZThzRGlub3k0UEZFWi90cXJ1WVd5a2JCUHZtOVZIMXNpK29OZDJrWFpwZFBv?=
 =?utf-8?B?YzlFa3pwNUV5MmN2MXlvQWpJL01JQWxybkg5VlUyaFpYRGtzT3NjVHRmaVZT?=
 =?utf-8?B?aFMxVlZMMnJ0cUp0Z1l2d3gwVGY0QlMyb3YwNHdDWjlEQUxnYUNUTS9ydUZO?=
 =?utf-8?B?Sy8xakVhSFNGaU5Jb05jYkVtdnErYkp4Y2h5bWFKUjRaTlUrTmNuTkQyZUs0?=
 =?utf-8?B?Ullpa01KeVhHQnRJWk0zZEhMRDZxWkNiU0tqVDJjZ1FnRTl5N2QxYmJSdzZm?=
 =?utf-8?B?TUY2TkVIcEVoTFVnT3l1TDhjNjExNm0remNrUXJ5QmpZaHAyQ2hxK2tkRUhZ?=
 =?utf-8?B?U3Q2UDl1REFKZ2VvSUh0N05YMW5zdHZJazI0c052bnYzNmxmVjVPeXRIaVFw?=
 =?utf-8?B?VnRDOGVxRkJaTGlzK1pUaEVBVDV0WE1XT2x2amxPbGkwSkJlVm1xSHFuYjVP?=
 =?utf-8?B?Z3JIMVhMZzNtYklVR0RoZDA5T0RhK0dEMDU1ZkZaeFdNK0FpbzJEanpLbXpu?=
 =?utf-8?B?dUNraVdFWVhEZDBnRi9YaU9KU1pHWnlSM3NWYUF5NSszNmlBeFNkcWhKT1FF?=
 =?utf-8?B?UkU1MTJRQklreU1qV3VzQS9MemRQZnphQmFPOUZFNXBCR2ZtbURZM3lLMlNH?=
 =?utf-8?B?QlhHdHhaSXVGVk01MW9xVmlkTGZDM013M0RsektmV2JONjFwU0dVYTJaYUZ0?=
 =?utf-8?B?YkhFTEdLTVdLQnVGN3NXWFVaQ2dZSEZZT0Z5M1hWdTZjZmg0UVJubkUyL1lS?=
 =?utf-8?B?ZmwxQ2Q4ekttV0NCZnorV0JRVUxuSzd0Q1lyaGE3YlFhbUZ4YW5pWGRpOE54?=
 =?utf-8?B?L3gvemJldWJpaDVUS0N6bXo3YUtXdHFkRzVvTEpzSlVGUTY5cERsdlJma3Jy?=
 =?utf-8?B?endOWDEwRytpeGM1ZXJNaHBZeCtzdnhPT0JYUkRvT2pDMTY2WVBQMHdIZzRT?=
 =?utf-8?B?VjNvLytYbzI4V2FHNC9QUkd0S2dtbTJYcXRpbGFHTkZnTjJWZ1lvYXo1WWJP?=
 =?utf-8?B?Nk16a2JKTXVYckZRTkZaajFBTythYStHbkk1OTRzeTJrYytDNVdON3dYMWVi?=
 =?utf-8?B?eVoySm9rTWEreG10c3dhZzJCRDh4N0ZGOEMvT1ZhQjF3bEdZKzNhUFVQa0Fx?=
 =?utf-8?B?eFBvcjFIUlQ2TTAyODd6T2hLU1ZyUEdvcDRWT1hMV1FOMkVZU1FxSmhqeUJ4?=
 =?utf-8?B?U1lBTXlrNW8yZzVWVVVKOWQ4bEJGSWUzdmR2WHgrSlZGOU5VcWpPUzZQMDRI?=
 =?utf-8?B?L0thQU40M0xEYjY5SVhzeVhuNWord0cwcEhpQmZENTZpRlZlOGhDNHdGNHVw?=
 =?utf-8?B?cEtRRnkzZjlIUzNuSnExdHdXckdxSjdEUTRWWVJibVNld2pvR0drYWp1QVBG?=
 =?utf-8?B?Ni9OUVMyZS9iVlF4bHJlNXFXZ0ZwVzhvSndRR05lWjVkVVgrYmJrdlhKZ0lw?=
 =?utf-8?B?ZEdqY0pFT05ZT1hTdHRTcHBlQzluWlhRL3JNZlhmNkpGSkt6RmxIR215SHU5?=
 =?utf-8?B?alc2ZkR3b2N4STJJTHBVWHNIaUtYSWx0cnhNOHNlejJ1UWd2ajhtSEtrOFp2?=
 =?utf-8?B?M1orQnBrOFhWL0w1OVVybFV1M0EzZ2V0eFdGS2RMWDdHSFk3djdWeS91Tndr?=
 =?utf-8?B?dVBUS1FOdDBGd2JNRHRNN0Z4TXlLaWtLU1RlRXB5VFpuUHJtb29ocDBtSERk?=
 =?utf-8?B?ODBoNkg2NytOWXJpN2tLOHM0VnRGUThHa3RxUFhDMTZ4bWsvVjlIaHc3b2hR?=
 =?utf-8?Q?kMULfiXqVSWhR/7tz9MBxlVI4uRvhRuzhbwvL4Y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzdhcjlpRm5lVTVoejl4VlNURnUzK3NDellhdk9ySngwcjZkeGpmTmw1OHRV?=
 =?utf-8?B?bUNINUhRM3draXdCM3BGS2QzbG15ZEpLQVpMV0pMWHF5T0RkUkx0Rjl3clQz?=
 =?utf-8?B?djhYSEVwd2VkZkRsK09BQzhERTZiRjhaK1QyNUpURHM0ZnJjTE1XaG14YmFB?=
 =?utf-8?B?UGtIV3F2d1ZITVJ0Z1ZISlhydXd3MVNoaEpGL20rL1gzUEdJenlIU1ZaZXc3?=
 =?utf-8?B?UzgxRWYxYWFHVWZ6cDNWZ1N1T01mTG1lN1BLQVVMOHoxUEFZaHFrSmtBZEc4?=
 =?utf-8?B?SUJpV1NYNmMvOXpNZ2dzbFdNbFVFaXdBQzl1SmFFVmIvKzFaOFBQM0ZLQTVY?=
 =?utf-8?B?U0d1dzFZQ0VwdGMyU1YvZ2x6ZDIveUdZdFhCNlFkRjlxYVZrWjFQWGRBc1R4?=
 =?utf-8?B?aWRKdVRpdE15U2NrWjdHRHI5REdsNGVoL210NlE4VjRrZS9zN3VHeDk3cjd4?=
 =?utf-8?B?YmJSOEFsbWlhRFNGbkhHU1VPSWVtZHo2UXNLaEFWNzBUeG1EZlo0OGlBbFM5?=
 =?utf-8?B?bG1yUEl0aU9yL1VrVThBVkxRMDEvNXpRZlp5UXN2WUx1bVJtaGpxbDlySDAr?=
 =?utf-8?B?dzZjQTVBekZoVW40VnpyaVJKbzJ1WWVZWGFWYWJoTnAzNDMxVGx6RFE4NDR1?=
 =?utf-8?B?Tzk3N3JHdnNkTDRjZVRsS1h4YnpjeXF6ZzVKdE9uRWo2Rm4xa1RUcnFJdHVK?=
 =?utf-8?B?cS9LcVlXWnBwUFhOY3VSNEQ5WWRuaFcwMHRBM1lxQlJPYkN0d2FsL1RsY0p3?=
 =?utf-8?B?cDJEYXNFQTRWNTJiWWNqYWgyVldoTUZoYlV6MWUrdXkyNFJLWS9uSkJicXNE?=
 =?utf-8?B?dTAwbTJDc1NUdVViUTExM3RzWlJiTk1ZazE4THNpZzUxU0FnRFdTdTlsV2JN?=
 =?utf-8?B?SHp2QlI4RDhKNXV2ZEhBaVdyckY4c3F4Nkh1cUkvczlvMVc0dFN5d2lSRWpL?=
 =?utf-8?B?MlA5WllZWUFia1hVQ3BJWjEwb2ZBVUtweVRHbUFRKzFoRG95N2FJaXpaTFJT?=
 =?utf-8?B?SHZ1ZXU1Q3M1WlFKVHlYKzFLTmZHZUNpSVJGS052aUlJUmVRUHNzQUQ3RXZR?=
 =?utf-8?B?WEQyOE00dm5CS3lqTllLenowQm0rMjJLbjVGQldzWm1lZmhlc2U2OEdFTlRT?=
 =?utf-8?B?bFFVdjVFK00xVE9YNmhaZnpTQ2VNTkN1NFlnNy9FU3VxTW1mckhxcVk5TVN5?=
 =?utf-8?B?YTFydGRpRHE0Wkdwa2pVbzlEZW0wanhhS2tGQXY2TE41SzZFMnl0WlJzM1JV?=
 =?utf-8?B?SUpKZ2QyaHh2c2dzdzljbDhUMFhWUm5pY255QlVxM2N0Vi9UZkJDWXpXZDRH?=
 =?utf-8?B?SUg2OW9VbStybEFzSGFRUG1qd3NNb05YQk9XZ25vQkhGcmF5U0w3OFZLMGh4?=
 =?utf-8?B?OG1ZNE1UakZ2bUppSzl5dVdVYVI4MFlvREREMktUcmRNQUx4T1FNTzZWU2N0?=
 =?utf-8?B?Ty9QdDJqbUxJUWdEejNGd2huRUszUHc1dGJHT1VFZCtPR2FobUJ6dWUydnRU?=
 =?utf-8?B?ZXFya0dTTmRKZWx5Yk5wRVBoTzJXNjM5QXBoQlZUendMd1VOK1hVRWhIRUFM?=
 =?utf-8?B?NTZqdjBDVEJmdzhjOG13VWU2aEtJT1BxRXQ5L0djaUJXMVk3YXZlMkFSdHFE?=
 =?utf-8?B?aHJIV3l0eWNHaWdyMzlMQm56dUpwcEpmMmJCb1ZWNjd0ZnkzVUN2bmVIaGp4?=
 =?utf-8?B?d0JnR1JGN2F1Qk9GYm1takVCU0dwbXJ3SGExN3MwdFB1RmVJM0ZjTGozL1RQ?=
 =?utf-8?B?MTFubUpqVkNzOXIxRytkdlAwRzZOaHh3VXgveHVJZWMyZklCa0ZMVWlwd2ZZ?=
 =?utf-8?B?ZFhsL1J6MXU1MFVGaTlBcWhMQmNmMzlQN09iTjA5bEVoRmo5TFhIb0gwRHor?=
 =?utf-8?B?VFJEUWIzOFhESmtNZnZPc1ExZXowM09ENE1yTXd2aFdQZGhuT09JMUhHVVpF?=
 =?utf-8?B?SnZSbnJDeVFEd04zeGp2TENMOGNXR0Y5TlllREduVUJ4aWVac0dEOUdZc09W?=
 =?utf-8?B?RVhlTjAxNkVmc3BIb1QvV2MzTlpUV2dEZmt6MUJGY3NJUE03NDhqaFFyN20v?=
 =?utf-8?B?Q2lEM3NQeWx3ZlBSNlYrWEdvOUNkMHFTbXVKK1pWTFZwVTAxclNXeC8yekt5?=
 =?utf-8?B?U01ZMGdGMWsxQm1ONURMdDk1Rk9IOWsxNm9IQzNjUTRURWswN3NWT3FsR1Vq?=
 =?utf-8?Q?hTHAoxl/k54zymbG+1VrZIg=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcdf746-dc9f-4e37-fdd7-08dd033d914c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:15:12.5020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oy0P+QQPVXlzjTw+gMoKnJ6hym4s1WMvHKLq3ze4oieGZ3U0hoimyr6gqg0hjN0qu8nAivY/gJr0NtzKcmVJF4d5IjBdlHWF7nxyuZpSQms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7691
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Nov 2024 17:15:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5719

Hi Antonin,

On 11/12/24 5:52 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Placeholder files for release 5.2 (Walnascar): migration guide and
> release notes.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.2.rst   | 72 ++++++++++++++++++++++
>   documentation/migration-guides/release-5.2.rst     |  9 +++
>   .../migration-guides/release-notes-5.2.rst         | 62 +++++++++++++++++++
>   3 files changed, 143 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..8a077b31f87582e0bcff7ca6fbf6f300c0274e6f
> --- /dev/null
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -0,0 +1,72 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release 5.2 (walnascar)
> +=======================
> +
> +Migration notes for 5.2 (walnascar)
> +-----------------------------------
> +
> +This section provides migration information for moving to the Yocto
> +Project 5.2 Release (codename "walnascar") from the prior release.
> +

thought: By updating set_versions.py to include a DISTRO_NAME_MINUS_ONE 
in poky.yaml, we could replace "from the prior release" with the name of 
the release.

Nothing for this patch though :)

> +.. _migration-5.2-supported-kernel-versions:
> +
> +Supported kernel versions
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
> +out the box, older kernels are not supported. See :ref:`4.3 migration notes
> +<migration-4.3-supported-kernel-versions>` for details.
> +
> +.. _migration-5.2-supported-distributions:
> +
> +Supported distributions
> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Compared to the previous releases, running BitBake is supported on new
> +GNU/Linux distributions:
> +
> +On the other hand, some earlier distributions are no longer supported:
> +
> +See :ref:`all supported distributions <system-requirements-supported-distros>`.
> +
> +.. _migration-5.2-go-changes:
> +
> +Go language changes
> +~~~~~~~~~~~~~~~~~~~
> +
> +.. _migration-5.2-systemd-changes:
> +
> +systemd changes
> +~~~~~~~~~~~~~~~
> +
> +.. _migration-5.2-recipe-changes:
> +
> +Recipe changes
> +~~~~~~~~~~~~~~
> +
> +.. _migration-5.2-removed-variables:
> +
> +Removed variables
> +~~~~~~~~~~~~~~~~~
> +
> +The following variables have been removed:
> +
> +.. _migration-5.2-removed-recipes:
> +
> +Removed recipes
> +~~~~~~~~~~~~~~~
> +
> +The following recipes have been removed in this release:
> +
> +.. _migration-5.2-removed-classes:
> +
> +Removed classes
> +~~~~~~~~~~~~~~~
> +
> +The following classes have been removed in this release:
> +
> +.. _migration-5.2-misc-changes:
> +
> +Miscellaneous changes
> +~~~~~~~~~~~~~~~~~~~~~
> diff --git a/documentation/migration-guides/release-5.2.rst b/documentation/migration-guides/release-5.2.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..5c39b99e037e0a84ad6603d22ec4fb4dc2bf96ea
> --- /dev/null
> +++ b/documentation/migration-guides/release-5.2.rst
> @@ -0,0 +1,9 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release 5.2 (walnascar)
> +=======================
> +
> +.. toctree::
> +
> +   migration-5.2
> +   release-notes-5.2

If this file is always the same, we can make set_versions.py or 
something similar generate it.

> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..a6ba1e01a310111cf9483c74718315286b669821
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -0,0 +1,62 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for 5.2 (walnascar)
> +---------------------------------
> +
> +New Features / Enhancements in 5.2
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  Linux kernel 6.XXX, gcc 14.XXX, glibc 2.XXX, LLVM 18.1.XXX, and over 300 other

s/300/XXX/ ?

> +   recipe upgrades.
> +
> +-  New variables:
> +
> +-  Kernel-related changes:
> +
> +-  New core recipes:
> +
> +-  QEMU / ``runqemu`` changes:
> +
> +-  Go changes:
> +
> +-  Rust changes:
> +
> +-  wic Image Creator changes:
> +
> +-  SDK-related changes:
> +
> +-  Testing-related changes:
> +
> +-  Utility script changes:
> +
> +-  BitBake changes:
> +
> +-  Packaging changes:
> +
> +-  Security changes:
> +
> +-  LLVM related changes:
> +
> +-  SPDX-related changes:
> +
> +-  Miscellaneous changes:
> +
> +Known Issues in 5.2
> +~~~~~~~~~~~~~~~~~~~
> +
> +Recipe License changes in 5.2
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The following corrections have been made to the :term:`LICENSE` values set by recipes:
> +
> +Security Fixes in 5.2
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +Recipe Upgrades in 5.2
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +Contributors to 5.2
> +~~~~~~~~~~~~~~~~~~~
> +
> +Repositories / Downloads for Yocto-5.2
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 

thought: use rST substitutions to abstract even more out of this file 
(easier to reuse for next next release :) ).

Something like

.. |yocto-ver| replace:: 5.2

somewhere in the file and then

Contributors to |yocto-ver|

maybe?

This probably won't work for replacing text in the label though but we 
don't seem to be using those in that file so maybe that's fine.

Not tested.

Looks good aside from the "300" I highlighted above, we probably will 
forget about it if we let the number be 300 and not XXX :)

Cheers,
Quentin

