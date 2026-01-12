Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBFFC9EC77
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 11:24:43 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30801.1768217079865193747
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 03:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=H9het6Gs;
 spf=pass (domain: cherry.de, ip: 52.101.66.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbbFJR8xI+q/Gehzx3slwfiPkaIE1JbAMkW1x8tK0vYLJWivk8LWElRyEHnW+BoN8wGdPFnBPKdJbOjii+BSkChhVI3cjm2GGcnVLt9cZAQNPewhtus+Dzl5iaeXDAWfYvnO/H/+Dz0H6MxM0LbtuxfrVVH5G70waSBl21CW2On4Aoi9ktXX2veso7WHfAT3ZBejQTwG5jc+Dj4A3uPtgo23ZtdIgehj3aYGb14kzIXATWW45cLO7aazJFHLxgik9vkJV3K16WeGIpl+u826P+scWbdkIbMyXWVQ09/ZlxZ8w3d3u4/Ks91bL3y7Ws+mkm9M3FOvGl1Rqo4rAbxO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEyiSSx9FgsYEOGqNgHNa0OKwPGD9H6so+v0qvPaJNc=;
 b=Hndznja1fxqCfrjIM97S2GTOmtW0HTgpWtzOKdtEYIF7mvtoQPOp/4vNYT2ILNNAYuzTGN/eWwm6iJ+NmK4q/bhHQtFTgu27Td0KWno1yetST74kmtDZV3zuyw5BL4wbQ1lpqUcX3Y2qfeHWHoysBYfwcSHwZfe8PjLer0sSe9kJDAC9RJ0ILVFKqpBPP9fO4fFV0PnuteqtayJuC5Fi1yxe5cNgkxf3wq06+zvsqSXSPuHzoX0Pkjr58rKz5lVMoNv+we3D5BfIq/wKMekNEn3Wez4ff/mqSY4t4jBS4UJ4jDgC1cnyTegrIHjof2u9qzJlGSB0XuQN8jZiYB/O0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEyiSSx9FgsYEOGqNgHNa0OKwPGD9H6so+v0qvPaJNc=;
 b=H9het6Gs7pa991s6AZb9RTPE1ebqWwlm+HAuDARgQdb4TBtDDSSms10IcKucUeZzLCtX/4ZsWSxPAf+Cc2VzdLIvhugBlhomk9scqwrMDXDo+jRfA+3lpAH7H8lVix8/LpLGwEjJMFBy56KUMyYJ+r+uSnPnEIQe2kvmRPsn7l4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10778.eurprd04.prod.outlook.com (2603:10a6:150:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:24:33 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 11:24:32 +0000
Message-ID: <f2e7849c-2d40-45cc-902a-c1075c963383@cherry.de>
Date: Mon, 12 Jan 2026 12:24:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] tools/build-docs-container: create symlink to latest
 build output
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
 <20251222-concurrent-safety-v1-4-e3d86e44cd38@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251222-concurrent-safety-v1-4-e3d86e44cd38@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10778:EE_
X-MS-Office365-Filtering-Correlation-Id: adf6fac5-d6ed-448d-7aed-08de51cd28c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Wjh4ZUw1clE4T0FxVHJId2lIWFhaWlo2UXFKRFRLd3RsYzFkc29zMFlqVTRB?=
 =?utf-8?B?YzJaZ1dxSkVhZ3REUjlWQ013SlB2eHlkU0NrVUdVU1VvcC9tc2ZWQzdrNFJJ?=
 =?utf-8?B?WjYzdWFVZjAzeU5KZlZmRHcrMFdGNHpjR1JMOVRpeTF2UFk4cHVXbFRqeWFu?=
 =?utf-8?B?UDlVc1dyZkVwdURBbzZjeHVzZy9Sa280SHFuRTcvU1dwQW8yTWlNcUdCeXZ2?=
 =?utf-8?B?RlluSW5QT09mRjZDek9xd0d2S3BLQlhtOTBKTGhqek9uYUNYcXhTcVR4Snlw?=
 =?utf-8?B?OGhkd2x1MnUvZzF6STU5Y1RJVFl3c0xFZlVMbWE0cTRWMjBjY25rTU1qUEIr?=
 =?utf-8?B?WFFYMmw3WDRMMGtvekFXcmw0Umw4VDh5SWt2SDZJcGhjRmJlVG56SXcrSUMr?=
 =?utf-8?B?MGNWR1lINVNkS0d3dlg1d0FaemE5cHhWTWtkUmlxbTBYTHhkYmpkcW1TNDhG?=
 =?utf-8?B?Qm5BQ2hlTDZ3QVhBTkVrN2NoZXZLVzByMTN0dHBNS2JoN2s2SHhIQnpvSU5O?=
 =?utf-8?B?L09wTDU1akRuSWJLYlUyMWVHK1dDM3llaGhxOUdSbGlyOXdielpNVVp0VE1E?=
 =?utf-8?B?R1NmQmJ0ZlZobTFhWXl0WThnVlhrMFg0bTBuZ2QzdEo0TnlYcDdWMTl5NTAz?=
 =?utf-8?B?a2d2d1VsbGpGTm1qRi9VTStsV1ZJSzlaV1g5a1BMOVo4RkxYK1FiNVBDZ0Vp?=
 =?utf-8?B?ejZIWDloUmN5Z0JJVlRFWjdtYzVSN3JHc2VVRnVvWHJmNm5yTy9mRUNnYzBG?=
 =?utf-8?B?SFZBdXFYTWpvUmhnYTZMWnpSMU9TNjJ1Sy8vTEpqUUdXb3FtdDlxU3VXazVY?=
 =?utf-8?B?eHBWWCtUOFdJaDYxNm8xSUJacHlua0xhSi8yR1M3d0hPeUZCV0c1Ry93OG90?=
 =?utf-8?B?WVlycmRhWmdoR2tYWTZhZ3RWTllRTFU3L2Eyb1NtcERhV0ZsUXVqa25WMk1p?=
 =?utf-8?B?MkJKMHFTK3JRRmNYZVRpejJ2S1ZnUngrK3NwaTR3b0VxMzVYNXpRYlJLeGZO?=
 =?utf-8?B?OFNhaUVSSjB2bCtHQjVMRGRZbk4vK0VRc1hvcVpGdjNZb0tZK0NpM2FDMFdK?=
 =?utf-8?B?U1JDelJIV0hhNEREQ29hUnBPcmFxV3N3WVJ2SjVQU1FYOE0wSkg5a3NmV0g4?=
 =?utf-8?B?K1crNmRBQTdmMnpHS0Q5blhlcXJQS2tvWEk4REFSOVgrQ1pNbzNrVnhpZ3dr?=
 =?utf-8?B?RmFtKzc2WHZOSXl0MmhyTW5UNzB4czlJRWt3VFJHZ2NpM2REWGQzZlZmVitP?=
 =?utf-8?B?ZDU5SUhiNjk1WXZSWTFkd3FwNmJXdmRUNVVUbm5Ia2NrNTI4aTJNaDJzT1Z1?=
 =?utf-8?B?OTRveG5vV0tHZlhYcVRlT2lpcDRRd2Y2WXc5TGpvMXBUaGpZOFVzcTdnaDQy?=
 =?utf-8?B?ZWpLaUlLMFd4RVJoS0FYUFg4bVNRWjBDeUlFOHpNY3NFQWRnR0pQVTVpSGNQ?=
 =?utf-8?B?NmNVT2hhak9KT0ZoS01PNVppSWVKSlh6M1NnU0czYVBGSjFrMGYrM3k0MUtD?=
 =?utf-8?B?TElTT0ZTeGxpUE9uaHd2aHRFZjdtekN0UXFOOXVadFVlNUF5cmhxRWFUa3Av?=
 =?utf-8?B?VndiVTF3VncyN1dRcFRwQ1prM0FxR2pwYzBQWUUzUUtMY0hNOGFLcjJZMnIr?=
 =?utf-8?B?SkRmUkx6aS9ySUZBQktiRVg2MDQzN2pYd2xsekxxVmJGRW1sRmxncFkzb2wr?=
 =?utf-8?B?K1RSeWE1Q2ZEYXM0c3VkeTZyUFB3eVRMd3JKbEM0cXpJMzk5c0k5cURSOXd4?=
 =?utf-8?B?aU85R2VRK0k2MlhVUU5QU2tZVDdUYUdnZXlKYzBjTEs2YWd4OFFUeXZlUzVv?=
 =?utf-8?B?SWlMZ2MvTVJXVXpGWHdUZGpBWk45U1daa09MQzlSdVNRMW8rK0VyZVI5aDRa?=
 =?utf-8?B?NmFLaHNRa04vOWRwMXU1VEdqOHZOZWVIbGZHcHF0ckZGLzV0alUvYjlPZUFz?=
 =?utf-8?Q?n80L38ysEH/M79+ngiwBK8lO9ZEyMC2W?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXdxYWJvWXhKc2FxWjR5QjlmU1NMSzZQamFPU3FFdVVMeUo3VGp3VVVtL2t2?=
 =?utf-8?B?aXVQS3F4UUlYL1pTUHdrL3pzcG1pcTQrMEM4L0J0UDIrYzJJd21XOC85b3Js?=
 =?utf-8?B?eXBzTkJsZFJBT2NPa3ZNZVdjK0hnRUEwdlc4aEFjcUFRQWlvTEtGL29tSTBP?=
 =?utf-8?B?WERlZGsvbGNjM0ZiL0dJS09Qci9hUHBOZGFBdVBNTXVaM1NiYnlTQ0tnSXMw?=
 =?utf-8?B?cUZhM3hkOVJYN2pEbzZONU4xMFpaQ0tBQ0NoTENKUjBndDZlQW1GcTVDRDk2?=
 =?utf-8?B?NjF2Y0RyN2VmaDhZTCtrWUtEWk5WWHE3NlAzZER5UHRjZ3U5RlBiNCtjdDNT?=
 =?utf-8?B?dk9MdUErTEJyYVhhcFk5TSszWS9QeDRoZ2IvVzdDNUVWOTFLVCtsMTNXdUpJ?=
 =?utf-8?B?cWc4ZnBGaTF6ZWRsU2RPRURsSGNiYy9lazd3NGc2MG9IZEk1aFU2MmUxZUtJ?=
 =?utf-8?B?M2RFSEE5SjloQWFJV09jUU1MVUhrWEtCdGFWcmhuV3BjdGtydTlucCtLRmZM?=
 =?utf-8?B?NFhTVlJzNHAxakZKZ1dlc05CaThVckZSM2R2eDk4S2Y4amorcTV0aEg1YkN2?=
 =?utf-8?B?cTZJQXFCQVhZNnduaVdzdkpmOTR1UytGZEtpL2R5WG1nVWFEbjBMWDJwZWJU?=
 =?utf-8?B?Nmx3ZFpJZEM1aDlmajZjbytQdklkZGhpV3ZOczE4bkg4eWg0WXFmT3RRbEo5?=
 =?utf-8?B?RVJ5a21QV3VSRnF3WDM3K1dIQlNOb21oSDIwU0l1MnpxMXJPR2xJalVxRkRC?=
 =?utf-8?B?L2tkUjNSbGdoKyt2NGUxWUVXTEU5WmxXYjhCaEpUaVQvcHVkanZBSXh4Yzls?=
 =?utf-8?B?WVdqMFF4SHZYVFVYMnZpL3lNUzhXQ3VPdVlRMkRsMnp1eThjR1ZWUVFNWFNB?=
 =?utf-8?B?WnpZRk05ZWNmb3ZLdG9iSTB5SnVSZTM4bUxBN1hqUnpYYWhNWGljQ0JZeFBw?=
 =?utf-8?B?MENWbmhMd1ltb2svZU02TXBvM0R3YWZWcXBsRjRnMUprNzNWaW91cGEwNlV0?=
 =?utf-8?B?L2d4Y3FwcWNOZEM4eEQ1bHY2R3JHdjUvMU9yTkh0bWJGWWdGamhXMExXT3F3?=
 =?utf-8?B?NzBVSWg0TjlHcTFUWXY0Vy9zZEVVcFFVbGtTNU5OclM4V2FoblV2bERaNWVi?=
 =?utf-8?B?NW13dUI4TXV2VE1QQ3BVYkVYS2RISWFVMjNzeGVtdlZFZjJyVXhSaDdCaklh?=
 =?utf-8?B?VEZNYjRLL1I1TmNzM3VkaDJyM0hNd1drV0J2V2dPR0hHVFpWOU9jcEhTYkhU?=
 =?utf-8?B?Tm5qcFhEOHg2OWozSk1PaStIZzRJb2YydnlwVHNtWmZOWFVXZDF2QmZTSFR0?=
 =?utf-8?B?Ni9BREZqdE9YTklYQWxKOU85RVVNdmQ2NFFYc3ZjZ01Jb0F6M1RyanIwRGxF?=
 =?utf-8?B?NWZtSTNvc1ZSa2FTQnQxeFRlRlMvbllHZkxJbzQrTWp1Z2taV0VFZmVSYUNO?=
 =?utf-8?B?RGpONFoxeWlKeFMzMjFaM25FVGVnQkFrbnA0VmVKMnNHQk9ZQzlBVGEzQzZa?=
 =?utf-8?B?K1hCbXUxdUNKSDFTazJJYTZpd1VuRngwQjFDSzJTN0VOTHhsZDhsRWdOQi9V?=
 =?utf-8?B?TDNTZVEzOWppVXJUeEIwaXNVT1RMcm1QN05RMWVsMmdrSEVJaWdaeklvaGNu?=
 =?utf-8?B?VENRQWtKcUxtQTZmN0ZVbzJ5ekhHTUgzSUg0L21MdGVJZEUvWkt2QnNPb09T?=
 =?utf-8?B?RHpUbWVmcTZYY2VZS3dTa3pIb0FJa1ptS2poTE1XUDV3V2EvU0xMV3VxWFZh?=
 =?utf-8?B?M21BeXIveDZxMXBGN1ZvT3o0U2JYM1lHRVV1NTBycGZGaFJ0UlAyelJDaDhS?=
 =?utf-8?B?OUo4QWJ5SXh4Nm5Ldnp5dktrNFV3SGFhSWEzV2Zvb1B4eXd6NzA3UXB0NEpy?=
 =?utf-8?B?ZDJ1TzZtOXR3WGpzcldOL2xINjhiUFpvbTlTNjU5OEtLSlZaMmp3Y3BiMUhW?=
 =?utf-8?B?aExrWmNyQ3pjdjJvL0ZhUys4cTMvbnlmcHVWYVNRM1VadWNJWnU2elBXM0lC?=
 =?utf-8?B?Q1NQMTVvR240VWxBYVMxNDF6Y0RKbWZ6OWV6OGczYlNTV3BxQWhvQkdBcXZ5?=
 =?utf-8?B?NE5XU05FZk1odm9IVUVYZmpoZFlqZHRtMVhCZTIyM1dGRXJ4cWZIVDNCMGhQ?=
 =?utf-8?B?bnpHcHM1eTZGTU4xSXNNbHRkZHE1MXBhSmpTWHZTYjMwNEZOZ1NyZ3YyOXpC?=
 =?utf-8?B?NTh4U21hd2syN1lwbmx5Q2c4RGVUM0RDb0wySDFkeDhMcGlBbFFrYjdvT2sr?=
 =?utf-8?B?U0g0NEhHdy9aN3FaaXZSaXh2aGc0c0dJV3BNZzErSUpxYkhKalpMRU5KVmRN?=
 =?utf-8?B?QTMwNXhjdG02QzhqMThpc2txV013Q1BBaHdDSUpveVBqVy9JcEFCZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: adf6fac5-d6ed-448d-7aed-08de51cd28c0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:24:32.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmGBOO0oEt9S6yQLOmL7Z6PgdLLskXtRYDOUIvFA/WcwjPuxrm7hiGjEHkmGMPBo1BcvjC6MeSX9n6jl9NO4dIHuW96rxh8c5GgDPFFugwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10778
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 11:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8452

Hi Antonin,

On 12/22/25 1:27 PM, Antonin Godard wrote:
> This is useful to open the output always at the same location.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/build-docs-container | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index b377777ed..7f3ba3680 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -185,6 +185,10 @@ main ()
>       --env BUILDDIR="_build/$orig_image-$image_sha"
>     )
>   
> +  # Create a symlink pointing to the latest build output
> +  mkdir -p "$DOCS_DIR"/documentation/_build
> +  ln -snf "$orig_image-$image_sha" "$DOCS_DIR"/documentation/_build/latest
> +

But we haven't even built it yet? It should at the very least be *after* 
$OCI run.

I'm actually wondering if we shouldn't have it as last command in the 
Makefile targets instead? Because here you only add the latest symlink 
if we're building via the containers, but we could also run two native 
builds in parallel (well, hopefully at the end of this series :)?) and 
we wouldn't have a "latest" symlink in that case?

Maybe we should do something like

ROOT_BUILDDIR = _build
BUILDDIR ?= dev (Or something else, just not latest)
FULL_BUILDDIR = $(ROOT_BUILDDIR)/$(BUILDDIR)

Replace all BUILDDIR with FULL_BUILDDIR in Makefile.

In all targets calling SPHINXBUILD, add after it:

ln --force --symbolic --no-dereference $(FULL_BUILDDIR) 
$(ROOT_BUILDDIR)/latest

(Not tested)

What do you think?

Cheers,
Quentin

