Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1A0CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 13:13:35 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.37])
 by mx.groups.io with SMTP id smtpd.web11.32284.1761570813407668858
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 06:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=K+69VcXS;
 spf=pass (domain: cherry.de, ip: 52.101.83.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6K8DZwNDCYolYjSEY1r2SHFEdhiwSqvzHQXgEWsCBwdHzL6fyN0FNUYWBqh01tJK746vICNu5pPCcuIkwn1OJIP9aq8KyZlyOVDmFk/79waF9CRANzU4uzwqaXW6tQW+6Z1ZkC3/1NYiOo2X9X8dFzJSBsCY0NJVuQBdC0wiobh7KM6SGMLrV1kJqcCeaRCTsgMK5Dtx3T06behXoAzXAsUZq/+1YmrfEp8we9HJCQprDJzk9GufLW+zUcF2ET2OzQZZdNChFNI+hUj0O87bGQO5Y7Rf+SCY3wRMpP2q4O9XAxYTCf9BRqpJ0G0D2sTtodm6X/UXmV2JBTX4CoDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Y9NmMnl6xkxV0c85tFlHmkHIdv333MflaLVQI+cOek=;
 b=tz7sUKdIAMVRwjB/i5viMJ1EuOx5/50CER0Udvc+MC0qMo9lyV9NQn3W1CLAD8of2YUCgTznITBInly2WLipvBu6zTcxCUxZigZWnd6Ydalkefz4bYoxqO5mTVuSmCDD2dSdX422Q2kNU2+PXlXP2WN9WPoKnbb8KZxu0vROdlSbj5zWL/puI/XWXlhgITzo1aqqk+zIhB36F589Rn28rDUmRJ6CPBv8vX5XxOfelkYkRb/VIIdRBq19b8OcE5Ymfxmrf4weknTR32FqxnwhuaBesi3tIYHn5fmk/StKx1HBQeF3+RStHfJDVJEmr75UpI+OAVnvVfLHi/Tg//ZZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Y9NmMnl6xkxV0c85tFlHmkHIdv333MflaLVQI+cOek=;
 b=K+69VcXSiEkmhekS73EahWxNofzhoJfURdGlCsUUd+y53FS1KoOnRtFse6M/0rRpwbgFAolG5y2MFiAdVUkFOfqpyv2kNwXAZEQcfJgZiXTdDuK2vcQ0rxaOvM7ZcrykhFG+ckoN2WQ2DyoqChxPHb17h40jxJTkxI2kIp/kITU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB8011.eurprd04.prod.outlook.com (2603:10a6:10:1ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 13:13:30 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:13:30 +0000
Message-ID: <55cfb397-b2d0-4c86-b8df-2a7c278acee3@cherry.de>
Date: Mon, 27 Oct 2025 14:13:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 15/16] ref-manual: document UBOOT_MAKE_OPTS
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
 <20251027-release-note-5-3-second-hunk-v3-15-07d36e2380b8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-15-07d36e2380b8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: b6262aec-59c5-467e-1931-08de155a9f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDZiaDFiUy90T0plU1BuNk1aMlkvTXF4UllCVTZkeEdHMXRyS1A5LzA0ZUYw?=
 =?utf-8?B?bmtuVUlMU0ZxYlRycVZicUZpY1FBTVBUd1JPQTlva1MvZnhWdHgzU21ZVTNW?=
 =?utf-8?B?SGhCT0xnSEJyRlBhbE5OYTlTN2dNTGVQaVpmd2szeDhSUHAvT01JQjU0aVJy?=
 =?utf-8?B?QXJOT0YybVg0dDVUMVdtYWlKejBKZXpONm1zM0RqSUNUdytmVVpPNG1vdkNa?=
 =?utf-8?B?WkNyWkZ3aGtON3hMSGFIdTVwOXhDK3BFQ2ttRVY2MitudXVRZkx2L3pjVGpa?=
 =?utf-8?B?OE1vL1YrYlZaTHowa3dHNzhDeHY2akI1d25Qb0pneU80T1ExNzc4Qmg4R25x?=
 =?utf-8?B?THZ0a2ZSR3NjSmMrOGNWaHhNNEdsKy9WVlZ4RUtHL2p1RzVicE1mNGJvZ01m?=
 =?utf-8?B?NmcrUnlNN012R3JjQzJYZFIxaE5Wd1F0U0d3NEZWci9FbEhGL2dZLzcrUWpB?=
 =?utf-8?B?NC9BeHR6ekJkNUk2dnliNWVUb05BanFRRXZDQmg5ek1uVG1rTEY0UXViM3hV?=
 =?utf-8?B?S2FSQTBvWlQxTUtQZUZsaHY1aktBOCtLaGNxZUoyU1Nxa2NxWDdBNGpQYlNM?=
 =?utf-8?B?N2RFYW0xZURUQmZGSWswTTRIYXBEVCtranlyWWh0d0RqRVFBdjJDdFFyeFNt?=
 =?utf-8?B?bUl5a1M5UktiMERzczd5LzBFVkRudDhyU0lSamNOMkJGU1U3Q1ZUT1BhNUlk?=
 =?utf-8?B?NFRzUit2b091dUsySzNzWUVPRGVQRjhSREgzQ2VFQmVobkxodGdHckM3eUpj?=
 =?utf-8?B?NmY2ZklqUCtPbDc1ZTZGSGVSU0tYR3g0VzQ0SHZReU5taVpEbnRYdC9STEps?=
 =?utf-8?B?ZVg2ZHhjNFo0TzhqWDRRS1h0L1FkcnEyMWJGb0ZFYkM1YXpnMEJBcUhoZisw?=
 =?utf-8?B?SERuWGNCMndyTG5OTThSNDA4eHZwTzd2eERFcUE0MG5PQmRGZnhMVi9VZUxH?=
 =?utf-8?B?alZEQTU4eTNmNG4yaXFpb2xMMnpOaURIcFZZdVVuQi8waG42S0FyTUM1WGZ3?=
 =?utf-8?B?bEJKK3FxTG9tNGRWOHAwZW5oL3Babk9PdzlqVytJc1ZBOXF3VWY0Wk1HTXQ0?=
 =?utf-8?B?bXp2SjJZdmN4cUtuM3JwdDlhRkxKVC9wUXN6dFUrTWNNK2o2SFpNckx1RnJi?=
 =?utf-8?B?eFkxTkJmNDd0Z2xTWU5OYkhGbjNGZkM5OFRWdnZodlpwaW5scEdtWCtLSEJa?=
 =?utf-8?B?S29pbzJTREVEOXpQVTRYbGRKOURQWEc4ZkIrWStaS0szWk4xQmpycjZMWVdR?=
 =?utf-8?B?Q3dsQUNMQ0pEYm5ESFFLaG5xWUZxSnAvWHlwUmJWbkhhdFh0eHBXTHd5M0RT?=
 =?utf-8?B?S2M0bmQvL2t1QnU4bnVva0t0dEdHMFBKZmZiQ0V6TldtK1pPRHFWUy8rZ3Rl?=
 =?utf-8?B?ekxNM0pOOFJud3AxU1BjM1pRVDlUc1RRL1N5c2lnV3pneDI2aHhSR0lPaStP?=
 =?utf-8?B?Wmsxd2NYeTBGaUNhVXc5VkxjdXpDdU1BUS93TW5qTVRER2w5QjNTNmlLMUt6?=
 =?utf-8?B?bjQrUVZTaEtzeDlQUXppYnV1WGFGRS9PdUhtMEJtUk8wbU1ic21vUDk0REhW?=
 =?utf-8?B?WE9KVkFsV3pNOEJXczFHb1luKzJaZVhVWVNzUEZzVXJZRllIT0hzVVNKRlZk?=
 =?utf-8?B?TjN0YTg4cFU1ajlsb2NaM1NQRmVLaDNHRWt2VVc4Y1p5SWdiN3llVGZLWmxF?=
 =?utf-8?B?cTdiQ0NHNDNucTc4alZ1ZUV0YkFFR2hrb29UVWhSK0pPSmhISnN4TVd1LzR4?=
 =?utf-8?B?OVNKT0FKd2lhaEZNWURwNG5WRUtja1B3M1dEZHZyN3FJOFlGendOOHZrbHlt?=
 =?utf-8?B?YXZzZHFMQmtZOUJrOHRoUU1CdW9SZlpUaXhIeU5zU21xUm1QS3FUaWNhTHd6?=
 =?utf-8?B?SHF5c21aLzFUaVNkZXN5bS9zanpvZWFYcG41Q2daeHhtK1VCenVjb1B5azAx?=
 =?utf-8?Q?5KeLioIxX8GaQvQsvtEZtMF6/Ararryu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?by95Ynh3dGtSVVpTSHlaOFlodWJ6MmRGaW4xZE9GNFpmTE1wa3FPdFpOTzlt?=
 =?utf-8?B?YUZRZWJlVUdaY0VGd0VOOTZKMGpQZk9HMGVWZk5rQ3FJZ3R6YUJGR2FwWmxD?=
 =?utf-8?B?cGttUERUSitJOC84T2dMekdLK1A5SW1wNE9MbkdaRW9QMjFhRDFiajlqZSt6?=
 =?utf-8?B?SEFLck16U3RjZm9DZ3VIMmQrZ0hoOE1WOU9yaFNHd05RM0dKOFE4ckF2bmJO?=
 =?utf-8?B?WEtzVWNwbGVySVVqM3dTZ0x3NU5TSENUUGo2SU1YVEZnakhJdjFXWTlaNU9q?=
 =?utf-8?B?cGYzTXlPcTNLUm1nM3lSUk0rdTdGWC9XZjlPL3h3MkxPTGdvbG5QMzRnRWhk?=
 =?utf-8?B?eWFRcjhIL3Y5V0VzKy9yano4M0xXKzNNalBWOGpvNkh5VS9iMmFJbE1WNzFr?=
 =?utf-8?B?QXU5RFRZMDRmSURYcm45VXVJNHk3cVU0bEgzakhaTUxQL25UaXpTVURQbE9Q?=
 =?utf-8?B?SnozS2dqMG5uTUdQUUFFSDc1TksrRWt6ZS83SHovNTcvZ2ZxblYwQzVJaW9n?=
 =?utf-8?B?T0NOLzFBQXo1MUFSb2NtblNQMmZpeldMNHJhN2Y1eS9QcUpZOGRpcjNzdXpF?=
 =?utf-8?B?ZmZlR1BkMzVFVVBrWEVZdlNsbU5aa1ZpdUF4WGgvak5mb3N6Qk5LU1ZvZlQw?=
 =?utf-8?B?NGtia2VPVjYzQmVPSHFSemRrVmJqYmE0R01LQVVDcFJLY05BNWx3WUIwYmxj?=
 =?utf-8?B?NVVDMHZHMGRmTXljMmQ3RVMrSE56M0xmY2Y2bXIzampEd2k1MnFBajVENmln?=
 =?utf-8?B?ZTI2THBIUXBSUFhFd0RQYVdEcGhkMlI5c0FsQnI3aUc5VHZQaWxadktNMlV2?=
 =?utf-8?B?RmpmRWkzWHp1am5rMXZsbXNOcDc2Q1NwV0hhWnVqeUpGZDVtVFFDV2txZ1d2?=
 =?utf-8?B?U1VXUHE2WVJuR292bWFhdE05TzBFSHRYa0phcHN1TkZkV25EanBxODJoTTc5?=
 =?utf-8?B?ZVVDRFdNL3doejlTMGpPekdMWmprUWIwQnoySGdqMm9HbnJQcG5QOTluanlL?=
 =?utf-8?B?OXo1RTdlclRWL09FM0FDWnJGK0RhcHNkakMxbmFHR3lxZGlyYWlEeFR3cm9p?=
 =?utf-8?B?MngwbzQwQjRnZXFtdG4xQXJPeFNqOUVtazFHckZqdVdmTU9WVlBDTmptb01H?=
 =?utf-8?B?UWJPTm5JSTZqOFJ2VFdyQWNTa3hjdHRURTVxZGdMMzl4TFJsWU90aWhtTHRs?=
 =?utf-8?B?aWxzQ3FnZ3Z3MWMzMkY0MVh5OGxaRDZLUDlpc3B0bUlqUUE3MXlCU3hncG1W?=
 =?utf-8?B?VFJaN2pNMk9KTnVnUTNORXhhNi9EY0lhc1pwYXB0VXVjL05XUGRpS3dkOTk2?=
 =?utf-8?B?cjFoVU9wdTBDeWxZNG84SEN5WE5vdU9CWFI1bS94QVVqQXBMaElUVUc1a0Vp?=
 =?utf-8?B?aE8wY2hUUUNCdzNUR3NsM1daU3JlWmI3WVF3OGJhN3ZybW5xRjJoampackp5?=
 =?utf-8?B?SXN3NVV3T0hIUS9KNmF3eUNtOG9VWWRYR1NTNWx2b0lQOEsxbStMcEk1eDI0?=
 =?utf-8?B?QTNCU005Y0Izc3ZvVytLaElUTVNPb05QMXU1ZXFkWWF6YUsyNHNYTCtGNjhx?=
 =?utf-8?B?cUFiNy9aMU92QThCS2MvZGtlSkFFamhWT1ZRUzVXUVROM0RFUDFvNUhYdmZh?=
 =?utf-8?B?eDd4Z1d4aXEzUlViUTV3RzNXSExGaTVucUFUVHJqSVNSYmNPU2xNL3BIUnIr?=
 =?utf-8?B?aFd0c0JpVEJHY2cyVWk1VGlBRjVrTll6SUh4OHBpcjlYNFhLc2htalBYRGZK?=
 =?utf-8?B?Z1ljNFhMM0szVEFjOHJOeDIxMVEva2xxT0hjTWFYYU4zYlZlVit6VnZqcEMy?=
 =?utf-8?B?WTE1aTJENi9ROHRDbVB1OG4vY1UwYUFMWGQwd0Nxd2hxREw0RXdVRlExRUZn?=
 =?utf-8?B?RTFtNTQwcnBQUXRYMjhTdUNsS3F4Q2R0MGx6bTdLcy9YNnA1VkhNbnVRNE83?=
 =?utf-8?B?ejQydWJUWUV2c0RETjVDZWtEVnRIL1FWMnRjRzJLUlNzNWgvQ2VQMXYzVnJj?=
 =?utf-8?B?VXVIT3d0bGpwVDNKV25naXZpbjlJZkJNOEluZkR1YmdGelhlcTRRenFGSVJj?=
 =?utf-8?B?K05VREJzRk80c3ZJSnFvY2JrR3lFMlhlUitRUlhKREZoT29SV2VJbitiem5S?=
 =?utf-8?B?d3Q2aWwxZVFrckRpMk9XL2pkL1krTmF3NGhWeVE2dFlnOWU4TW9UUGZvakFI?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b6262aec-59c5-467e-1931-08de155a9f6d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:13:30.0428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/bCLCyp60dUDkGNm3xK1YoMvxMmNosRMDVU1/pLfSLwa5YF7xpdIF/0tSEf22zsiJr/HbuSmQb5AR4IOF8A0QmEAyafQKx8E2UMt7X1en8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8011
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:13:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7871

Hi Antonin,

On 10/27/25 1:43 PM, Antonin Godard via lists.yoctoproject.org wrote:
> This variable was added by commit 3338330e0c46 ("u-boot: Add specifying
> make options as part the config looping") in OE-Core. Document how to
> use the option in UBOOT_CONFIG.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst   | 8 ++++++--
>   documentation/ref-manual/variables.rst | 6 ++++++
>   2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 2a69d2d59..9fd2fe375 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3241,8 +3241,8 @@ There are two ways to configure the recipe for your machine:
>   -  Using :term:`UBOOT_CONFIG` variable. For example::
>   
>         UBOOT_CONFIG ??= "foo bar"
> -      UBOOT_CONFIG[foo] = "config,images,binary"
> -      UBOOT_CONFIG[bar] = "config2,images2,binary2"
> +      UBOOT_CONFIG[foo] = "config,images,binary,makeopts"
> +      UBOOT_CONFIG[bar] = "config2,images2,binary2,makeopts2"
>   
>      In this example, all possible configurations are selected (``foo`` and
>      ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
> @@ -3280,6 +3280,10 @@ There are two ways to configure the recipe for your machine:
>   
>         This option defaults to :term:`UBOOT_BINARY` if unset.
>   
> +   -  ``makeopts``: the additional options passed to ``make`` when configuring
> +      and compiling U-boot for this configuration entry. The options in this

s/U-boot/U-Boot/

> +      entry are added before the options in :term:`UBOOT_MAKE_OPTS`.
> +
>   -  Or, using the :term:`UBOOT_MACHINE` variable (and its companion variable
>      :term:`UBOOT_BINARY`). For example::
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index e80c5a6e9..d879a49d4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10906,6 +10906,12 @@ system and gives an overview of their function and contents.
>         Please see the "Selection of Processor Architecture and Board Type"
>         section in the U-Boot README for valid values for this variable.
>   
> +   :term:`UBOOT_MAKE_OPTS`
> +      The :term:`UBOOT_MAKE_OPTS` variable can be used to pass extra options to
> +      ``make`` when U-boot is configured and compiled.
> +

s/U-boot/U-Boot/

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

