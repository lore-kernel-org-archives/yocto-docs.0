Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D8FC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:38:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.40])
 by mx.groups.io with SMTP id smtpd.web11.58028.1739209075179974995
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 09:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=X6ad9At6;
 spf=pass (domain: cherry.de, ip: 40.107.22.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MI3FlFltZ7yuehJ2VF0D5ouE+fLOFnxm95ElY2eNpxbkAHppu+XOEN7SBzSef/KmSaX5lptppyXcVxAc5pCNGtkJFEiYE8L9BFzaXintTlUoa2bdgEmURCQZoFzE7/zIc+2UICcbDOU7p5i0hvI97FPMXhJzzInjBKujWets52DApKvVnY87uO5qM4MFSSJs4bQMcAe124a2Jxvy82i5gSmbtQNPMy6vMusLN5lUUZ6JOXNFgE+wDicNpdoJIxCC2jzg245Hp4azKLB3vFeBY4hvEFgPHUgyLHnSch2zmpyYR2CUnVsYBCYErtyedzBJXpRfZkV74GTGDfx9vr/zZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgfdqCBYZlLO/3bsvuWdBvxLLyuZq+nnLzKMDlESAT4=;
 b=PjNhclrqh+gU1SkEPxpHxC/9DPKayGuzXjtl9TFYCDWT8NA6qDfs2ClKB3RIT54t/V0l3CoPNRFD8Q+QZ7+MscXgrCh3iPsdX4BsFBO8yu+7SanSTo7YAycqrJwk8uSySlAu5Uv2srTSzE59Ek72GZSIKnr7o8jMszqiLarYMVt2dslipBG90hn3TnBlZm6K2baJMfMsHtFpZYAtendg0G0m5S1zU1h4M3T8g/zI0wBHgSAm8J0BRGx0FdpWl6I0n9w9Ze9uybenK352WnOOywRZulgzTpKhaD0nSBkm7L796VH4mFbwPmXyIhWD0gJWZ4i7GdugJXwPGFFWHoOVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgfdqCBYZlLO/3bsvuWdBvxLLyuZq+nnLzKMDlESAT4=;
 b=X6ad9At67MUY3JtwKS/y/dV0JwW1B5kxkchKXCCVTsgjH+p3/PmIfnnygWr+WXz1QCwcB9RKNmWf3TSYtUNkYzDSRfYGTWTjcFPyxhhYpKFGJWZmyOocYBxJAuXpw/ORZ5CpP7Yns2qr7ob3PDVrkqSOU/SBIBKlGWR0eH/DVFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:37:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 17:37:51 +0000
Message-ID: <8b15c9fd-f33e-4b58-b306-e66822093887@cherry.de>
Date: Mon, 10 Feb 2025 18:37:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/4] ref-manual/variables: document
 OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
References: <20250209233245.1397155-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250209233245.1397155-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0223.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::44) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: e6692842-289e-47b5-b58b-08dd49f9a469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXc0RUFjVTRwR2hXYWpiMkFicjdCNUV2MWFtR2pZek1DRWZlZitjTk1iNFFP?=
 =?utf-8?B?WGkrQmJqQ1lIckhDMEh0Mkl0ZytYOTg4ZCsrWisyajF5V0hTcVQvKzljQjM4?=
 =?utf-8?B?RDdYMmIxbWNyRUJrd0IyamovRk9GWXVldmdyS3Q1eWhDQ3Z0WlRmR1lXQW9Q?=
 =?utf-8?B?YUlKQm9PUXJEZmM1VWVOZGxzVnhFMXp0L2wyQTNTR3JMcURGUzB6MUpyQ3Zs?=
 =?utf-8?B?a0Q3ZmEwdGl2Q1k4VkZOTGZXSHlyVEUzTmg0MHRFNDRLYjRJWVRma0tTZ2lF?=
 =?utf-8?B?ZkhmN0JtK3lCVDFlZHZKemJPeHlnQXNqdlhqOE8vRHNMS1hCRnl1cmlBUEky?=
 =?utf-8?B?UU9wTWhCZEdYcDBWYlJNQU0xbWVrSHVOR296dFNid1JPRXA3WHR6OE95L0JM?=
 =?utf-8?B?T1d4SDlicmM2ZDEyMVZuUVJaNWtEdU5USkowMlgvUTh6clpMT0F5Nk0yR2Rt?=
 =?utf-8?B?Z0pyWG1BTDFLQlU0NFJkSURoS0VCSzdqT2kvdlcxanJFTjVKQWpTWWVROCtt?=
 =?utf-8?B?TXQ4QVJNU1BRV3B0QmR2N1FEUnQrem5wZDhkUlR0R20zbDM5K3pFL25Vdm1W?=
 =?utf-8?B?TGJmUVltVWlwUWtkaFRRSk5vY3N4ZEY5bHpnNTVjK3Fra1dtdlI5TGRVampR?=
 =?utf-8?B?UGo2STZZMU5rdkpiWDRwVWY2cTJCVHA0ZlVkV0ROZ05Ba0NxUmZOL0JFRDh6?=
 =?utf-8?B?VkUrVWtxVUFNWWRFc2pVSys5OGIvL0FrRTlMSGNHMkFpRjZJWEdwWUJUWGgy?=
 =?utf-8?B?SkRGVDJCMXMwdUhMK2J3cnZZcG5QY3BwWVE1TCs2aEhBbzFvSW9neGdXdUVZ?=
 =?utf-8?B?R3MwaGx5QnJpeTZnNkFDaTR4cHBzaE10MVpoUE5lOXhrWDdKMFVJSmI4bFVI?=
 =?utf-8?B?THZkSmRPVjhKYXdhRnJwMDVYMTRrOFIzWFliVHZ3WkxOQjJrNlRncnhDOHBn?=
 =?utf-8?B?Z3JrNlhoWElENTZxN2Y1VHV3UTFUQ2tQbFppUTV2dkw5YjlMcjdpUWVuaTNE?=
 =?utf-8?B?SGpOZUtDdGJHb3VvV0N2VnBSNXh1a09HcTI1RVFucGJHWE5SUi9EUGpJQVA3?=
 =?utf-8?B?V0ZFdW9mbGtXTHB2eW9UOFc3NG1JaTBXdk1XUnVuemY1a3FqOXJJaGFvWG53?=
 =?utf-8?B?dHdEelhZWnF0NTR5bThzUmZwOVBacnZhZCtYYW1URGFManpwd3JrcFBXZVJZ?=
 =?utf-8?B?Zmx2TWI2Si84Qzk3dXRCZ3F0ZTg5cnRxbGtXRml6OHhTZHpWMGROVUhOZkEy?=
 =?utf-8?B?S2JMaDBmV0NWL2FHdTc0UkxLc2hnakx6dHMrbGRJUlFOS0c3aW9zRzNsSHph?=
 =?utf-8?B?T1MxL1U3dDFlN1VnVThkSUlJSHM3akpvakJTY0xmcEVyWXN5aG1RS1B0Z29R?=
 =?utf-8?B?RSsyOXo4OU5kN05IN3dYR2k0OVE3U0xQQWlSTHVISnBvdWdibVVEMlJiQTI1?=
 =?utf-8?B?bnpZQTdOUXlLMTJ1K3BIcnhzNWFOaWtJSVRpeUZoeU1BM29WMW0wZ0tuc05a?=
 =?utf-8?B?MHJpT2JnQVJzS3RrTWxhbGxPUlBvMEJvNWFWTFVRRUhVajlsK2U5b3g1VHhm?=
 =?utf-8?B?bWZkeVUydnBiek12SlJSZC91S3Rpd2dML2dNdGo3V3hXcjE1TDB4cUtSUStI?=
 =?utf-8?B?TFh1NmIzM3pJWHRaSXE0bUEyK0J5cXduWXlYTWFIY09UZW4zWGkvTUVrZDdo?=
 =?utf-8?B?TTZBcitGNkpCd3JJREx5U3ZFY1VGY3JNTFdBdTBRajhjNmxVY1VQc1h2UVFz?=
 =?utf-8?B?SXRKekl6d09LQVAwWG9hTSs0YW9vSFNWVXV2VWp4YjN1dXdQa09pa1BGamFK?=
 =?utf-8?B?dzM1dHNtaTU4bXdEWHluVWxFUGlsVmc3aVN1WVN1bG1QcUljUTliOERpVWNz?=
 =?utf-8?Q?C4TJzRoSk08V4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cUY2UzdjSjlCQ24ydENiRXRGOGZCKzMvaWVkNWFsSzYxQ0FRazBjQW9LSmZh?=
 =?utf-8?B?NDNYTEp6WCtsY2k5V3dOc0c3WkJHMVRWME4xRXBDQkVZbGhyM3VqT05DcndX?=
 =?utf-8?B?T0ErK21Fd0JaTCs3ZDBsaVM2T1AweDdmL0dNRFZNQ1FFUnZWaDB6cmV2elpZ?=
 =?utf-8?B?SkI1UDcrUVM0MmdOWVRQcEtwYU5vaHdrNVlqVkRiLytqZkx3MGFEcmVMVzc1?=
 =?utf-8?B?bmhWVmlKK21ZcVRITGIyR3ZwSUM3YWwrdXV4VTFQY1MzZ2U1N3k4R29ZYlEy?=
 =?utf-8?B?RjZseXRFWkF3WGoxRCs4WVBJT0dJVjdMK2NieDBKWU5kZ01PNTA0M1hZM2Jw?=
 =?utf-8?B?ZmNaVWlnM2RDTmtqOWptcTc5bDA0WGs1YlJscWJ0eVhUMTdTVXl0TjRQbGs0?=
 =?utf-8?B?M2Yxc3MvUTNjaXRkcmZDS1o5YVM0b3JJdnRRd095cTlHMG4xUi9nRG04YUFH?=
 =?utf-8?B?Yk44QlllNUdyY0dJa2pCOUJzaVE5K2pGbkVWTzZOMnZjb3prditQa0E5Y1ZX?=
 =?utf-8?B?NXk0dUdzSS9QNXRmNWh1OUVvTXdJMXhzSVdqY0FmZHZKVTVPOVhrdUxFbnZq?=
 =?utf-8?B?RmdWSjFKeHlIcXRxNnhmN3lTK3ZGMS8ybzFCWkxzaXZjMDhpV0FSOTlNbjRX?=
 =?utf-8?B?Si9GNnMxM3JoSGdzQTJXbS83T1R0ZllFcEU5UWFudmRnQXAyc2o1SE91OEJs?=
 =?utf-8?B?dXY1Q2R0em9yQyt0SjgzQ3BCa3FBcXFLd0xuclVVTDYvMlMweEg1WFhFR05U?=
 =?utf-8?B?Zi9PTXpUMmxWM3pGNFRQeWJ0aERnTEFzdVh6NFk1WHZOZ0dxWEM2Z25zVzl6?=
 =?utf-8?B?WU1uK2o3RVZkbTBFN3MzQVNMZXI3RzBwdlRBN2lWM05RSjY4T0tBdUtMcHVo?=
 =?utf-8?B?L0s4OVl1bjJWV3lYNHpRQkhSNlRoalJ4bkZ6dm1tQ2t3MkhLVkE5VjN5dERq?=
 =?utf-8?B?NS9kM2ZScmx2VGo3UmgwdnR1TWQwRDJoSktSbTMwUkJaeUgrT05RUk5UNHpn?=
 =?utf-8?B?a0JudFNWYXdpU0w5U1hyeTZBb3lxaVJXUURTNWk5eGlGK01vU01RZmZIRDZG?=
 =?utf-8?B?ODBIQTZTd0lJVUg0Njk0cmJaZkxud1NmRXNueGtVb2RmZzFIRkFscGM2aG9E?=
 =?utf-8?B?MmI0SGdhTFh0c3diRnFibXZmQ3JkZXFZaWsyVGFjSDk2RGswbG5KQUR4TGww?=
 =?utf-8?B?Ym0ybUswbExaRE4yUkJ5azdzeURwREpiZ09wQy9QbTRzZzR6TlJJSkhnRnI1?=
 =?utf-8?B?eWtidm5xUFNONDBQNHdubEtKcUtiR3IwajRTNE9LU1IzTERIVlNBOGRpMC81?=
 =?utf-8?B?WkdKMms4UFJMbE5YYU5mMmhZdzVxTmR5a0tXY3daaHlmR1V3Mmh5Y0dnUnRT?=
 =?utf-8?B?ckc5dFZyWkcrRVFmdzNOanBSOC9jTGlZdHQ4VTQ5L1lES0E0TUw2K1ZKL2E2?=
 =?utf-8?B?RXJBMzNNSjdhUVdIZFVvT2d2NTFrL3dZcXE1d2tsa0VRa3ZkTks1RVlFUWVu?=
 =?utf-8?B?dlZGV0w4ZFFxd1RmcHdhOGVmZk9PSTZPajVYcEMwS21tU094WFZMVi9leVZs?=
 =?utf-8?B?WU5vWVZHUTMrcE5oemFMZE0reERUTUxFRUZYOWYzSHkrR2JrZHMzM1E3akJl?=
 =?utf-8?B?clZHb1RlT3MwWDROR0pIVUlKbDRRVnFuSlRFOWE0NFJLQTJ4RVBSeW1Yc2RZ?=
 =?utf-8?B?cW5mUFVVbmJ5ZEVxQVMvaE80dDdVUjNLTURza0szbHBBNXpnYkVveG9HSTRP?=
 =?utf-8?B?c3ZDSHBQTVdMZEdBRWhLV2xUVjBFN3oxRzlGV2t0bUtqaDdFd0ZKOG9jdWpN?=
 =?utf-8?B?bVNSU24vMVZhUzZ1akZYSjhzL3BycWRlbDgyQUZBMnE0bHZIOFF1YmVVQmxi?=
 =?utf-8?B?QXVBWFlFeElBKytiMlA0R3dqTjF4YU9FcjMzMlhYUkhpMDhGbkxacXlMckxu?=
 =?utf-8?B?OFU5eG52elV6NzZhZFpLekRhMFlTRnNqcEh1MzZzMWllc2JsOERUQjNjUW1W?=
 =?utf-8?B?eUZpd0dDODlod2lHdlVkV2FMY0hPYzVaWnhxM25TWTZUU1FhVjNyMlVGdWwv?=
 =?utf-8?B?cjJtUmpmdkhSNnVaSDFOWmF3UXRrNkFyeUxGSVAwUHp2emNkTDFwSnJJOE9I?=
 =?utf-8?B?U1puSVZjZ3orT1FySmxVUENmeWxmZjlpeGpHSzVXanR5VXFBczBSU09ETmhl?=
 =?utf-8?Q?xpMFFafyYxZM0dWGM/L14Kc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e6692842-289e-47b5-b58b-08dd49f9a469
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:37:51.2136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDuRMHb3XWJZ4ILMzFZ4Sau9fQziXNiSXL0fwwA13w5BR4bM8J7ZNb6konCtOJTaEK47cI+AvlQTEqcqCRgUubOeKI47HIGokag4zeMuD0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Feb 2025 17:38:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6323

Hi Yoann,

On 2/10/25 12:32 AM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> This documents the variable used in the "automate testing a single
> recipe's reproducibility" feature [YOCTO #15701]
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> v2->v3: Quentin's review:
> * s/target/target(s)/
> * Removed Guillaume Reviewed-by (given privately)
> ---
>   documentation/ref-manual/variables.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index adbef69d8..2f1937632 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5807,6 +5807,11 @@ system and gives an overview of their function and contents.
>         For additional information on how this variable is used, see the
>         initialization script.
>   
> +   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
> +      Set build target(s) for build reproducibility testing but activate
> +      :ref:`shared state <overview-manual/concepts:shared state cache>` build
> +      for most dependencies. See :doc:`/test-manual/reproducible-builds`.
> +

What do you mean by "most dependencies"?

The code I glanced at in OE-Core seems to indicate it adds all DEPENDS 
from each leaf recipe to the list of targets to build with sstate-cache 
(the same way it's done for OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS).

Cheers,
Quentin

