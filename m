Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8C6C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:50:57 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.55])
 by mx.groups.io with SMTP id smtpd.web11.84712.1754045452743267341
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 03:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VnojTgYz;
 spf=pass (domain: cherry.de, ip: 52.101.72.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXm6PgnMkHWSQDEbvjpipzSRNA6abcKtBUz62U2idxUVAO0cm9rNuwc2g1V6ilTi86NJ1loZiSEqosgDH57T+DMzSnHWl3RFPAyqNsHI3Uiv6vuWlYitesICfQVURm6NSCdWnjfky4K5oGCKne7dHYCCZkUGFGtbaclrxDffkW1O5rYBiGbJqmUV6aQcl1YHrTvAwVjaUBB4ks4WqO/9A5c7tMSqkTwCf64uWUIJYd09FHqXhCkh0ZZDPgh0eD/ZH9p8g680p+ICii7wBGLJxy+PaTb76LGnmRLJCDw+2ODNeZpgnmRJ7VVDaXojsEJ1LgPCyzD5jLA16v4HaypO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1U1aQvmsFpL9OOeZPFlTmIismxTgKAZerZeKWnYgd8=;
 b=Dku0HwUXz0GFAAYChkzoA7SXa7/hSkEPfv6a+0hkh3MCT55ZiJdLcOq3wM0/K7PS/9quBCKsqQ80GFtFZ6oUSBTpVafn4kAxRgH2sFOT4r5Eqe8Bx/VU8tCr3+RWnaBcL138AyuyXN0BSojN9YsS04O4QoCGFgaNYg6yRaSmutcnoY9iP9H8KJBxn8noeI6vV6k0081nbwh7oAEz3CFy8oj2+j+X+c2kbna+IHWUV0RUgQ/M2Cc6d8WsoW6K6K+eY8ZkfLj7n7TVkY4BBgUb5Xppki1x4iY/9OHcKxpSRjQsbqFFgeCwgCURS1ZeVM3Utaswr8sbpUXKuFh7j2vZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1U1aQvmsFpL9OOeZPFlTmIismxTgKAZerZeKWnYgd8=;
 b=VnojTgYzgHxYw+qc7BReWn0YPyJtECnmImHXRmO3Ug8ubHEV6O+loAqrsdHJEHXu4mJGhgaQW0pza/z9CboOXzN+REkIuTaXJFFPofoS/nFc1GAY1Bjlb/R5pYg7JN/vLzLlEAP2BZieNIGRr9OOMGiXutPrWrbg4eAprRCXNsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB7713.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 10:50:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:50:49 +0000
Message-ID: <71db6fb2-331a-43a6-be8d-51ed8c2a3687@cherry.de>
Date: Fri, 1 Aug 2025 12:50:36 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2] ref-manual: document new toolchain classes and
 variables
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250722-new-toolchain-variables-v2-1-b02aecd666e2@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250722-new-toolchain-variables-v2-1-b02aecd666e2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0084.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::29) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 680b8793-7d6d-4867-3112-08ddd0e946ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TkwrTUFadTl3VVNuT0I1ZVJ4Uk9nMmNEaDFxME9VZlpONHhJWEEwZFA1U0xD?=
 =?utf-8?B?WXZMaTZFa1dUbjJvenFTNHRjcDNzOStOOFk0SVg2eEpWa3hub0N5azdBU1VE?=
 =?utf-8?B?bmpDUGxRS0l5R2g3WnUwSGFXQmxtNTJ1V3d3WFNZbjFhR2ViWUZ2ZUZ2Q2Fo?=
 =?utf-8?B?U1JIUXZwaVZHVzc5YzhCbzFqUEptNVN2VTZDb3h4VVVkUkQvdmRJTng3Zk9s?=
 =?utf-8?B?a0YzeTkyRndHUlAydWtjUXFkTkUwek9Ld2tyQnNyYVlyMDNZRDluSHprSnR0?=
 =?utf-8?B?Q3kxbmh3UEEzbFcvUFZFalJSbGZLWXhTSFM0MFBGSUhRT0F4YVhqNGtpaG1s?=
 =?utf-8?B?MWJtSHB4dEJMcTFWZmhmVXVyaUFzWkdINWtJekl5K1VvVUJZbEpmb0d6Wkcw?=
 =?utf-8?B?WkZTV0NnVENQeGJidjRjSlNnYTFISHU0SkkyUDdLNFZsSnFMVDBYUG1ZQUsx?=
 =?utf-8?B?M3hEcU5aenI5c0htbG1pVGxDd21ZalJaUU1nT2JaV3NRZU9nZWxXODQ3OEVy?=
 =?utf-8?B?Nk9JWnJ4ZHFPYjAxblZqVnZJaVg2dlF4ZmdDL2prd0N1WFZ3WXlNcDRGUW9K?=
 =?utf-8?B?OWFRVnQ1cHZkOUFGOXZLTnExTWpGamdWaGRmTmkwbXlrcEMrQlVBMVlNbXpi?=
 =?utf-8?B?L045VWwzaE9CSmhlS2dzMjZPQnZGOXVNdTRqNUdEZjUvakE4YkNkZERzNHls?=
 =?utf-8?B?MnEzMFBFRnFPNXQ2WUFCZEwzQUN0NDAwN2krZGZzMy8zS2h4ckttbTgzTG9a?=
 =?utf-8?B?bWZrellaUHJNWFhtNVZMQ2NNdzNQdThabmhkeE5tN1FwNk1xK0NOZmdBak9U?=
 =?utf-8?B?aThQbUlsbmlLRXRWQk8wbEpJczRRdy9vV2NmRGpvYllWRnBGV1U4WGhiRXpI?=
 =?utf-8?B?V1pWMDJOMUFheStUYTdGSVFiZ2RCd0MyZXJNQWhKbzAvZ1RXQmpiTS92WjRR?=
 =?utf-8?B?MWpMYy9qSFNtbWl3cjZ3bHgzaXlxNTgxRXc4cEZKaVQ4dlp5OW5CYzdSeHoy?=
 =?utf-8?B?dzRhc2Z4MXo3WDBGaWgxUUJkTERtdTFIY1VIL1djUVBoZVZCbURYbEJDcStv?=
 =?utf-8?B?MEsxblZlck5WSS9wVWR5bVU0OUhHdzQzSTQ1S1B1elFEbFoxS1JsSXE2T0xm?=
 =?utf-8?B?OXNYODgvTmQzY1R3ZjN4Y0ZxZkJXMVBjRmxzQ2w5d0VUWkt1YzhOR0VTaGZh?=
 =?utf-8?B?b0djWjZCd2xFa0RJL3FPNmg1OXlveGczaldlUE1rYjdEQ083Y2FwUWxQOFd1?=
 =?utf-8?B?QldhMFAxYzNsSlBJZkc5L3M1Um4vZC83Z1pvYjlYdENpdzVvV0xjN3NuNzNx?=
 =?utf-8?B?K1kwYW1PQ3hKd0dRUkZ6UXVaMlU2NGV0RUZJaWNjdHZwd3VmcHdzSi9SVXA0?=
 =?utf-8?B?eXVRUHJFcCt5eTFkOHV0OUVQZDB1cFYvcU1CL1prMmovczZpRWVDV3B3d2dV?=
 =?utf-8?B?UUdaQ0FyeDJQa2xzK2lONU9wNFIyM29NT21uSlkybVhXcnZhUkI0dDIwbG5a?=
 =?utf-8?B?SzZNSnpqN05PQ0ROWGEzVHNvbkpNTnhnM3NQeW5qaVRNZWUrVG1uRWRGdTZi?=
 =?utf-8?B?R3BWbGxQMmEwYnRFUjc1R3g5ZHVZd0NpQWNOQXFLbFFBcE1Cczh3NjJKa1A2?=
 =?utf-8?B?U3hxS0pSbGhoQVhwV3dsbm05T2JxcXNjeGcvWEVSZkZyTW9JS0RldGdGTEpB?=
 =?utf-8?B?RFRuSHllWTZmbitwa3VrUThRS0FVRTdRWEFKODRZeTNybXZaZk1Eb1ZLTWFI?=
 =?utf-8?B?UjVPQWw2cEJDeHdvdDBiS1FOaVpNTzh6TC9jTnFHL0NXTkJySXJ2ODZqWkYx?=
 =?utf-8?B?M01qd2V1bnd0V0RiTTBZQ2ZnZXRQeVpna3c2RklmNmxEWVdQbEhsZE5Wc0Yx?=
 =?utf-8?B?SUMvc3VGcnBBNVNTUFdHTi9qR1JjNlp4c3ZPcVhYKy8rUHZpRjJWMTZoNkJv?=
 =?utf-8?Q?azMfUd7CRBk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?My9yeW5HWlAxTURwLy9lOGFsb3pJQ1NiMzUweXRUMEpiRS9oNlFHV21Qek1y?=
 =?utf-8?B?Qk9rVkwxUlFzT05zSk5LS0g5M0oxYlJIdmdyUkFvQmlCRmlzVHlGNzJ3RFEw?=
 =?utf-8?B?VjE1RmM5Y1Y0VUdmYVpPUkJGUEllKzZaZUtjZXYvbDZpcjVFNkNyTzAwSjJp?=
 =?utf-8?B?bTV4TDd5M09XamRTTTcvSWt4Zjh3czltd0pVQnB2RUFoYmY5L28vZ1kyaVgz?=
 =?utf-8?B?TVhpVjlIREpzVGNuODJCS0NVbzZ5T3VGV2RQQmlCc1N2ZEJEZlk3cnJvVzEx?=
 =?utf-8?B?SmRwUEswYjlXVXZ6K2pNM3hGQWNDeVJwa1hWWTdub2NLekhkTmpJckdRa2xZ?=
 =?utf-8?B?SGQwSDEyVHFWYVVtN3dMRTJXeDhUWHV1ZWxsWFhUK2RpS0krYlNVMlFYMlZ2?=
 =?utf-8?B?c2w4bC9vcWNqRFVCL2ZiMncxSFF1VWpHb29sK1FJYzN2TTRjSjJEMzBCUXpX?=
 =?utf-8?B?TGhyZkJWS1BySUhqMkVNRi9naHpuaUZrTVViY1RpS2pXR0h3Z250SVppeWVK?=
 =?utf-8?B?WE55cDZkQzllSFJFTThibHBVeGh1c29jenVmTUNPTkN1RWt6WEh1azNjRmxh?=
 =?utf-8?B?T1JIMDBiYUhtVUxMdE1sN3V5VWRva25ENGkzNm00bTBKSHZTMG1Hd0FocjhC?=
 =?utf-8?B?eXVocUNYaFNYY2lUeVBFQUZEZFFQeVB2ajJWYUE1Wm1hNWduZVREOUdRNERz?=
 =?utf-8?B?VEVQOW1KUTJtTlpiWWplcGI1aWtxUUJrczJYcEJCNWd3L3VKT0dxSE8yajBx?=
 =?utf-8?B?bzlDZWJvZzNnRmtFQjc3TEFleElabVBBcnlFdU9Rc3AzRVY2aGp4WHEzcDd4?=
 =?utf-8?B?VTBYSGFPWTRYMFdXWnh3ellNcWpQRUdLb3U3MFFvNkQ4QUpNRkUrT3M3OHhU?=
 =?utf-8?B?eWduQ2VZcmpwRk1MV1Z3VG1lb3J2S0Vydk5QSUFzalV1SndKK080eU9TbWFk?=
 =?utf-8?B?MWxqTGltQ3Ntc2I4alVtUTN0QjhLUU5rb2h3czRQd3kza3Rzb05yMVYvSnc2?=
 =?utf-8?B?Mlp2bGtBN2x4R2VJRm1RTHRTaVg1cXlZTkV6RkpabHY3ZVdoTlUwZ3NZcTY1?=
 =?utf-8?B?MkdvamdRTDRFT2lGUmZYTFBIS2U3Mll3UHBkRlBSbFQzd3dicGpNSGZobW9h?=
 =?utf-8?B?NFFJRDVmOW1Zd2MreDVsZXZHUG54UnB3MkhmOFd1a2RZSEtHYndHOXl2clE0?=
 =?utf-8?B?ZGlxSGlMWDEvSWlzdjBTcmdqbHRLUkZOTVpCOFBhTFJPOURMZ3I5YytNSHBE?=
 =?utf-8?B?eTlsWml3Qml6SkYrMzNUVE42R2N6TUJ6dVBDWDF2K1lyMVhOK1NxWFE5T0ho?=
 =?utf-8?B?eXVyK1daTUJ0RUFKRUd6OUJORmZsNzVONEp0dW1FbXB6WTI5MEZqYnljM2Nv?=
 =?utf-8?B?L3d5dmpGT3NJQ1VHTUFZRUtZZXk3ZVQyMWZaY1lId0Q4N2xZL2tEdUN0ZWFw?=
 =?utf-8?B?UzExT3lxUXUvUkg2eUxlZUI5WXBJbXZUdEFOTjMwWHFyd210YTZyblBhcmpY?=
 =?utf-8?B?Z0J3T1UxZU41NXZjRzBQazlmSzVsOHNRaFFaQzRMYU5salpGUzlBZVBDTUZI?=
 =?utf-8?B?YzFuMCtZNUxFTmZMZ0VHeVkzMzdaSlF2TG1NZjZXdmpMN2QzVGdINENqV201?=
 =?utf-8?B?OFR0aGdlajVoUlBLWkNSbjAvKyt6alRwS29DMEVZaEFFMnN2RWo5KytGYnUz?=
 =?utf-8?B?UVNmREpvTDd5SmNmZHFkaElvNFh3MStMd210Q29jN3VreFlZdDZtVy9EWVAw?=
 =?utf-8?B?RnRER04zT3I2cHp6VG9tb2N6Q3pHcExMb1dHNmFicHdiNHl2S2VBdXZDMEdK?=
 =?utf-8?B?c08wa0xmVHI3dVVqMGRER2wwNWhwc0Y1UXBPNGswREZlbjA1ekR0WW1QWkJa?=
 =?utf-8?B?RTR1a3JNdUp4RzNUdVBvTXBqWFpIR3paYTdOeVp2OUVXWDdYN3dtalhWZ0FG?=
 =?utf-8?B?OUFFSFVmTTRrNHFPVnVhTWJEMTFRMHFadnVvQjhRR1RZU3VHMTVnd1F4Um5l?=
 =?utf-8?B?RHFQS2dUV0FNR0lLR3ZZSW83RnkxUGM0NFlMbXB0QVZqNXlPSEExTmc5NGs3?=
 =?utf-8?B?b2lrN3J2MlUvN2JyT213Yjh3WWFqTzl4WnJnaHVmWG51ODlrVWVVenFyVjlE?=
 =?utf-8?B?Y3pCZlJCRE0vQzA3QWRHaWVKajlEQWxaazUrbEZ1T00vcjVtTGpxMGxFQUZN?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 680b8793-7d6d-4867-3112-08ddd0e946ae
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 10:50:49.7431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PphtyI4fxBjNliqedG+jqCMVeO93UXuDqCfov7m/DPgqVl1WVZl1DoaiBaA4B3/XuTZHge5BCL5c1GhTtLWZ4h6BXI1Q47TjkQBE8WfH/+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7713
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Aug 2025 10:50:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7429

Hi Antonin,

On 7/22/25 3:33 PM, Antonin Godard wrote:
> Document the new classes under classes/toolchain as well as
> PREFERRED_TOOLCHAIN* and TOOLCHAIN variables, which allow selecting the
> toolchain. For now there's "gcc" and "clang" as available toolchain.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Looks good to me,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

