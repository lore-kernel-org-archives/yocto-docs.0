Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8233FCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:50:50 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3374.1782294641351925649
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 02:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nN71/r+F;
 spf=pass (domain: cherry.de, ip: 52.101.83.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7pAFpEttFsqVTpokZdYtt/80Gdby8a6212zexQVhvK6fj8UXNNZYcbKYwifY3FZhM5BKTOVGBeUpESnaYfEI8K2Bkrz6Yq9zAWXy+2D+cqAslq3wlQwrfmlzPxnfOHUTuK+coVaXfOC3AYanAZT57ot9rFPQjnjWSnf1aJrxtA7nPmaFusEKpO5J7HnMzOkLfQhvLbz9SwCMwzY5zg1iU895HKmJ84UygqCSPz3oUih1firmtJd+Rh25G55Y/nf3VwXJAcr4M9tRLfTxcAFGUmqUIML0VTF6NTHAuLX4cTo1jNqp/waAi9OmboboRO6FGo8L9F0qMaPW2pU607NKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFqW95Zki4t/MXbw4mmKyAkVcMaG3JubMG9Il6Br1mM=;
 b=dV5iW8dGKHdkMvMCTTfVgXxFPYm7fIBrFiVRimZGfHojNSTC1CvQ/JAN0g6DS897a1Ui4Ey8qba2Te3AUJsaftkiLPHp5Sv+uVXv0u0V3RyHCid5CsWw1ZMgwe3DRV3VEoi1cpt1UFDKdLHbJ63k6Evqz36q0+CFCWUih953p3KN18nxzdwalrqQbRE+VbbaqoE3tL3Xf8MnxsekEnfw9tfY4FfCZHP+kb8imFv7F+5uTppu4FBBndKGn/NpEFA1qOc4sTFqDQw8aImZp2JS9vB9kd+Eap7Rl14x4iIxOe5vN0AUO8BL63Beq9XKLBI5gNJzTMzeqhTxPYkQxrgpBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFqW95Zki4t/MXbw4mmKyAkVcMaG3JubMG9Il6Br1mM=;
 b=nN71/r+FDMOAwoek1N4ajiw0I/ly8FeEAiR8FPgftjET/+HQKBLvyNuhIji5/ZHgj2KH4sHwMw4pjfxqFX0Ry2N0bAT6DVhlKAfkOlZDWC52TmfAYpw2kRyuTMim4sA3hoLtH8wSIb72V1wOTWj+cYFYv9IhpNGhdF9i568rL8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM9PR04MB8649.eurprd04.prod.outlook.com (2603:10a6:20b:43c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:50:35 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 09:50:35 +0000
Message-ID: <d2292a79-16a9-4786-9b69-30d7d320de50@cherry.de>
Date: Wed, 24 Jun 2026 11:50:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guide: 5.1: Remove duplicated typo
To: jaekyu.lee@lge.com, docs@lists.yoctoproject.org
References: <20260624094747.3447103-1-jaekyu.lee@lge.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260624094747.3447103-1-jaekyu.lee@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM9PR04MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: 14799135-c42f-4b6a-b4f8-08ded1d60a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	1fBDEGrNeAOzT40G/eunZa46RvNNy9gR27VjQkny3ZGxrlWr5PGkRe1bhzDEmSzAtEvxS+P6KagkisLO8iPlsIT7KCVitc8nAuh+6BGriuj2THMNfVPY459dPsC4jXu/RfS7TqmxVkuLq9vXXSFsYreksSwc5v1DcGAXALkw2mraeUI4BFqjohRR3Bg80WWs3TjNK8eGy89UKNH/LrHyAGNnKXZuQRHc6Xn9pajGJOETGnK3SeoPzslJPQ4Jq/1E12gKguNG8icbTTPZB2Ehg56KH8VLZ/+oso+OP1rBdnpzug7AQ23Y3y4sgEMWsfTQ0phMiDSLIvM3bDSbA5XKB2WIDlyqUVZPNpKKkW8GUiQGTAEh5V8BJOnV/Ism7bv8AQYc1bRTFYbiohN3l0A1DdNSpZ8t2pZMEDGoEdj+sqpyoWbNeL0VT5f8TwLqns169tT9dA9DJIgfX4mdhI4FPJ9NATKSm0eJ6Acsk7hMRficeSv5GLpsETz/WUhkkVNeoPZbUlDrKL3A/eZVd/W8Xd/NRVwvuxOVHsMwjVyy1RAPfnxjdERMGbS9I7wEJAnsnTeM3rSL9MwVnb5MgzfwhUXSc5TVGv8d9EzcLutcfebJIHE6/wqq8pjmUAxvIgPQ8k8SajgMzemMDIXeRChiauR7w3TupTlx3FHEq5otpXM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzNHOXdmWDFBUjVHZkQzaThReFRUR0lJNFNWZGp6SEVZbFdoekRLNFpCamVT?=
 =?utf-8?B?clN1Mm1GbXhrTzNBcXVtSFBSTWJYVFVJSHBrVDYyNm5HSDFqWHBTbVllenRq?=
 =?utf-8?B?N3ZGVS8xMllYUXcvbjlXY1ZMVTlXUCtFSFUxU3REU1ZhTzJDN1VtcXJCc0NE?=
 =?utf-8?B?b1dCd3VkbnVhQWNIK0Iwa2ppWm1lbFF4LzFZU0xUdUFyODE2dzVXY1d6enRo?=
 =?utf-8?B?NjRXcnBJemswazVWd1J1ZE1YcXFEbUU0NXRlV3BYQmFRcHJJTDVWd2g0dGVJ?=
 =?utf-8?B?ZTZzYTZDcnQxaG54ZjR2Y09wQ21RTzBVaTBTald5NEpMMS9OTTNpZXFHNnVt?=
 =?utf-8?B?djdyTS9IU0xEZ0MxOEhsV1d0Z2llcHFZWFJNc2RoUTVqc05QUmk0NjNwaWtk?=
 =?utf-8?B?N3JRcTNPMmgxajFhUUNySHhFMTJRL0ZoZlUyaVF5SHVjaE56Q2ZGVldGRkVl?=
 =?utf-8?B?RUxMZGQ0enlVQWVwNUJteXdsMUhtZHJGSHVnNTJRdW43NEl6WVJMczRQVU83?=
 =?utf-8?B?VTRuQ3dFakVKZXBtL2U5aDFCNFR0L0NxaXVRNmVXdUFOa3NaUzlnaWtnaVJH?=
 =?utf-8?B?a2swb0I4NURETndUVEFRQ2xuRU1NMlVFZzVPY1pQaURydDdXeEJCV3d1TFZa?=
 =?utf-8?B?ZndjWWloUEV3UGI5b01xZDEyZDUyVVJOemc1NW9CanBLeVYzdVM4T3hSL3VW?=
 =?utf-8?B?SWpJbVE4QitkbGdoaWpHTkRQWW55SW5qUisyRGJIcVJPU0RzWkptWVlEZHdv?=
 =?utf-8?B?eWV2OE5xU2pYd1hwWWtubDdQOU5pYTZXaWZCd1B0bExhcnl6cE5OaTNXQnd6?=
 =?utf-8?B?UE4vZ1dxQXdmdFg2ZFNDNWRPbXFWSU1ZMWR3cXhiNm1GYy9tWGNDWXc0Y3V3?=
 =?utf-8?B?QWNRTVRGTGtyMDZUcGl2TUgwTm8zRkNkMGs2b29ML2tyT0FvYWFwbDZpZUVq?=
 =?utf-8?B?cXlBV0Mrbm5OSWRDQStOc0FVQmh5ckxDU29DL3RZSmwrSWFuUnFYbHVLWkVP?=
 =?utf-8?B?MDcwdXR0OHF3RXFMQjJ6Yno4N2VoTnJUeDBTS0Fqa3V0dVBma0hVYXBUeDk4?=
 =?utf-8?B?NzdUZlhtMGdQT3VMUnlaUjFVYytJemM3SlZ4ckZVUTY4dU9YRUVmeGhkaVVM?=
 =?utf-8?B?VUZnaDhRVmhYNXpJTktmdnRIdm4zUlpXanRkRGFQbzNPUmtnRldPZUNUK3o0?=
 =?utf-8?B?cDV5Vk1hQmpNNkVvNitaaklxREMvdVl0N3dyaTVwYWI0ZG5nUURNNUIzTTl1?=
 =?utf-8?B?aEIreTkxVHJ0NVZGdGRKK3ZucEY3YitlZi9kdlM5YmNCUzdabTRyVTdwMUk2?=
 =?utf-8?B?UHRncEVSdldQd000c0hESDVwN0lkbHBZOGV5cGprUXliVlU3Z1QxdUwxRklQ?=
 =?utf-8?B?Q1NPODlqZ1NaKzN2VkR5eUR6eE5KVEM3aG1JWGZEeXVWaEU0UVpnVFVSRExz?=
 =?utf-8?B?K2N2d2srcHpGZUc4UGZvbnNIYy9KNmtuTTQxeUZjVTZnaFRtMjdIRy83cjhB?=
 =?utf-8?B?OUFyTVBtM0xCYUZreUFZa0pZbzZVdkRhMm9CZXV4Vkp6cThwaHR3OVlEcklV?=
 =?utf-8?B?b3VPaFljR3Voak41dHRTd0ZSMURDSXlxN2tMMFNxN0RZYzZUZ2U2ck9zT2du?=
 =?utf-8?B?cjFVYjhOQzA0SGU0U3dabG9iUTdwTUNPLzdvSGdYWWNrZTVMS1l6TnEyN081?=
 =?utf-8?B?b0I3RDQrVWtlUExTYkxpYWdYeHFOZGw2VzBpUWZDZktwakM2d25ZODJNNy93?=
 =?utf-8?B?cE5mRWYxNDVPSEpjUHhPNnRLOHh1aVJ1a1dCTnRtMit2R3kwbGZ2REx1UjJj?=
 =?utf-8?B?Y3pLeTMrZjdnTjRxYy9sM25qZW9rMXNGaDBaM1VEczhQRHlLcWRJUGU1S1dq?=
 =?utf-8?B?aUY3ejVWTG1zOEd4YXdiRFlqWEFjTG1oZ255bU9yUGdNaThMWXF4eTVqMlBq?=
 =?utf-8?B?Y1BpblVnZE9YWm9QRUF1VE9zak9mVFdra1dlKzAySlM1TWtvLzkveDdWNUFR?=
 =?utf-8?B?MVZacm5oUVJTQmV2VEZNU1M5R0dNa1k2cmRoZ0MyVkxvcFFRY0J0alMzYjBj?=
 =?utf-8?B?dzltT1ZkMU9IU2VhWE9nUEJoV0lFbGo3VmVrWFYyZTdkaHBxSzgwUDI2TmxB?=
 =?utf-8?B?Q0NzcUowSUZkeEYxMmNRUzVGcVg3UERURnNHSjZ3QkphQkFQSUcrTWhnYXNp?=
 =?utf-8?B?Y1ZodmxFQ0tOd0w1eW5kQnJXMnFvWTZRR3lwYjU0TVFRTTJYN0krSEZ6WDd4?=
 =?utf-8?B?Tjlvc2FHNmhXY3hsbnB6ZDFjOGQ3aCs4cUoyTkt5a3R6bENFRnN6YjVqb3Z1?=
 =?utf-8?B?ZUR3amgyZ1lJOElQK0E3N0xqeHRIaTMxMGZrOUpmc2NqbHd6RVFSQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 14799135-c42f-4b6a-b4f8-08ded1d60a00
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:50:35.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zn8Ejc4MtItynmtIaZ2HqNB3GiCJ/VW9x8l+MpwAeOhkvaDfI5v0vNorM8xMZy4GazawtKjxDXbPTTuX6WrSCpNX8CZneZV+7Vebrf0Z5iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8649
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 09:50:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9856

Hi jaekyu.lee, Antonin,

On 6/24/26 11:47 AM, Jaekyu Lee via lists.yoctoproject.org wrote:
> [You don't often get email from jaekyu.lee=lge.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: "jaekyu.lee" <jaekyu.lee@lge.com>
> 
> - Remove duplicated typo, do_compile
> 
> Signed-off-by: jaekyu.lee <jaekyu.lee@lge.com>
> ---
>   documentation/migration-guides/migration-5.1.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index 94b527bdc..f1c953c7e 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -23,8 +23,8 @@ supported, and an error will be issued. The recipe should be changed to::
>       S = "${UNPACKDIR}"
> 
>   Any :term:`WORKDIR` references where files from :term:`SRC_URI` are referenced
> -should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
> -:ref:`ref-tasks-compile`, :ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
> +should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
> +:ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
> 

Asking the same question since it was ignored on v1 such that Antonin is 
aware of it. I am wondering whether we didn't rather mean configure, 
compile and install tasks instead of the compile task being duplicated.

Cheers,
Quentin

