Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F75C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 15:47:56 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.64])
 by mx.groups.io with SMTP id smtpd.web10.44409.1738856868630358571
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 07:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OwfSgHwT;
 spf=pass (domain: cherry.de, ip: 40.107.249.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MN40hceWmIRSr3MSETcm009qDhbdzcOGjPABtw5aNqpfh64UjJXIT7nHjReZl6nOPNUut0iyeZcWge7PmstcXEWr2ERRbIFzzT5sgUFT/PaDHXIW1zccTq5270i3nBpPdkwHgmzNUQ/q51K6bRY699MTmsdbIfVdN8z3sgYf+yMxCTM50I7KZD0JquR4jWmSHTn1BWK1Mk3H8AvXQdOA9JkRZ6UUuuxs2vXd2xo3NFirpk02ahkD2IiJixSXOQR5uF0JBHcc47JV6rXABpNRrxQMIp0tcC+p8w/gkiQn+lEsps5Dn7UAhWCTSAA7eHnPcfzr6Bnsn2Hgv9yLqOgdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saQHuvPvaTr4XhFNKKP2srMtA5cYXOSDQHQSxtrGDw0=;
 b=myrYGCW15tqlQFzGnoGPghSL9XrvffByPuwRM02vkMiRqexUlalO61T81vXto1UMahP8Y/SNLNO0haa24/T/nOplbjzBGMqgL8TxU1E07tY9PQiD4SBKRpEMBjTMEMX+/nicj6aSyZR5yQqUEMNkGoZe8bXjXsGrixWGAv7hvyecG6fPmtk1g10tzcUrfy5K+vewmzCQkHE7phivC/hBTGIhZ2zI/Q7UGr6MApwMSVHNm7tjMk7edgDjBT7FrM8onERuLabp1Atv+lyx/CCThqFHeVEbzy2qzSWkXDd/h81bUxhjFGDoAOHi27S/IXUpUTX3Dn+7LW3wHOem6wuqPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saQHuvPvaTr4XhFNKKP2srMtA5cYXOSDQHQSxtrGDw0=;
 b=OwfSgHwTzhxUGwhOeNmsaRP8Hww+2qmU8rlqzi7kmASnHSMsspRguIo70pbeULkGxCigGCir4yVhHsHaPNR/q4ke0dHepDi3v7b4D2muNqrYokYo50sg3xMG7Hyl3yhrZSQkg1bkkUtTrkB0HWdGJxp3HEz7zlDmFPQ3Le6AfjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10558.eurprd04.prod.outlook.com (2603:10a6:150:20f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 15:47:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 15:47:44 +0000
Message-ID: <e3413524-8770-4b66-bde8-e8929c3d756d@cherry.de>
Date: Thu, 6 Feb 2025 16:47:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual: Add missing variable
 IMAGE_ROOTFS_MAXSIZE
To: Pascal.Weisser.ext@karlstorz.com, docs@lists.yoctoproject.org
References: <20250206153529.2546767-1-pascal.weisser.ext@karlstorz.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250206153529.2546767-1-pascal.weisser.ext@karlstorz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0245.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10558:EE_
X-MS-Office365-Filtering-Correlation-Id: bac3a5a1-61b7-477a-86ab-08dd46c59908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUhQb1lwcTNVOVI0bnRxd3pMQTVBVCtDbWhrYy93SllSMnBrQjRvVVI1SXVz?=
 =?utf-8?B?TktLcjBaUW01SnlkMmc2UkYzeFBQMGRTbGJsM1YyalM0OFo2YnNoalFtbElz?=
 =?utf-8?B?cjVYRG41aTNUQm1ZNjVOd1lHcWFac1loVkF0MGhnTDNZc1UxajZWRnEvT3RG?=
 =?utf-8?B?RmdTYjQ3QWlmYWhQNFV1U3Vtd0JoSFFOdUkxYmF0enhWNXZrWWZhQ29FeXVw?=
 =?utf-8?B?NCtDYnU4MUY3VkdlUkZ0MGdPSE0xV0k4VlY5eUFsSUVqODd6eHZxcjdiRkVq?=
 =?utf-8?B?eFJVRUVOeWFWby9WOTZlUVR1bW1iUEhiNEI2dlhPamRFbzJZVU5pM0gyNmZW?=
 =?utf-8?B?TU1kTGZ0S1doNnpWK2ZwN25MVldUUnh3VjRKS3pYR0d2OENRb0NKWUxTaHlq?=
 =?utf-8?B?LzZGV0RQK0hJbzFGVlhZcnhTbHZiOThVZmoxMXNURXNNWVdSdTZnUWRZR0xi?=
 =?utf-8?B?ZmVrNUpNVHJGQW1mU1hTTjZxb3VscnFpY0JscjEzV3ZUZ0RIcnFBVVNuSUlX?=
 =?utf-8?B?VFFSR2ZlVmZHU0tPTTBzUHdaeFQ2Q0krd3VJUGFmTEw2VmxzaEljdUgwV1Q0?=
 =?utf-8?B?eVY5ZlJJdTNoYlg5SkdXVzFCdS9OaVNyTFZjTjNzeU5qKzk5eHBRaUFIRFBQ?=
 =?utf-8?B?a2pyQVhmbnJwNU1WS0xyT0M4NzJVempySVdqYUcyK1NjY0N0Y2c1cnRtRHc5?=
 =?utf-8?B?ZWJPZlB3akliK2tYbW9Ba3FuS2Z4YWtVbW1qSnl3QXJqUmRPMVhhTXdQeFJi?=
 =?utf-8?B?NmIwRnp5UWt0VldvdkQxT1ltSnhvZmNuRi9IVm9sNEJkVjhVNExoQXd1Ni9S?=
 =?utf-8?B?Uk52bm9UbVVVZXhVMGQxSmhXYkdJQUlFUDZJNDIySDZ2NlBIOFlWRmlIOEdZ?=
 =?utf-8?B?MlRJNnNadWlJdi9HR2VkSE5GODR4V1VUcUlLS0t5Ymw0dkdJUWI3VFFaTVdi?=
 =?utf-8?B?eXJFMVJ5SjJvajJsbllKQ3N6eGRkNmpaVVE1Mkp0NzRwckJCdE8yODBOTHA2?=
 =?utf-8?B?RWpiT0ZIS3dZb3BLeTBPK3BURGVLMFpzdGFsMDJqb0ZDaElUcE4yVm4wRzF0?=
 =?utf-8?B?ZnVIaTFnVy9NZDF6RkFQekkwaHBPZXl6WkdYU3FEMDFaQU5YOUIvY0FKUi9S?=
 =?utf-8?B?NWZZckJWRDNsR0dOZ05xY2NhaHZQN2VNMTFSQWh1aGQ2T20zcG9RRW1EVEor?=
 =?utf-8?B?dEJhYzlPQ2l4MUN4bjNYM3E4WFJLSVg1MlhqT1UzYlNXK0plb2JnMHp5R0J2?=
 =?utf-8?B?S3dra0FpSTR5eWRBaUs2dm9qM0krcjFQV1RKYUw2akFOYzhDbDlVcXFxS29S?=
 =?utf-8?B?clFRb21nSUgvTGZ6aTV3b05tVmlJeXhqcG92V1U5YkNySHo0QjFKOFlZRDRx?=
 =?utf-8?B?cTlMMVBiSk1mNHBRWVNXSjh0QXFNU09kWmRqR2k1RGgwWVN3TU9EbzZ1WGs2?=
 =?utf-8?B?T0JLM2ttV0xzUGVIK3MvdStEc3dRZTZWS0NocjFvZFhFak9PMGNUdmcxSVdh?=
 =?utf-8?B?RjJhd2diTEI1NmFIUlRNcjZabVZCTHlXcCszbzV1WmZXQ2t6ZGE5TkpvaE1E?=
 =?utf-8?B?dWRUSU05SENFbXN3Mk05cVhNd3FBOXMzRVlGc0VpZElqbGZUZmw3V0ZUVG55?=
 =?utf-8?B?U3EyVkd5VEpwVDJYSTVWQ0pkNEJLY3BUc2lPblBHUTk4VnZTZWpNQjBldFhC?=
 =?utf-8?B?UjRPcXVYaVJDaHlpME9ZWG9lbzRxTlJUNXZmbG5BdVFQSGxDK3FTMmZOYmxr?=
 =?utf-8?B?M041K0NiU0tpZVp6NzJNb2MzTDRmWXoraEkrd050cFZJR3FUQ1l2UlAyMUJ2?=
 =?utf-8?B?bzg4RU9hWUYwYjlhR2hmRHlZbG5lbGdSSG8zOW0ycjlWdGtiVEh1dllTVmhq?=
 =?utf-8?Q?3N9KrMs5IqxKK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NCttLzdzRzRCT3VYSUNNWStwcW1hbmRuREtPa25pZVhYRnpaNm4zOXpuV0di?=
 =?utf-8?B?ekVaY014Y3NWamdKNnFGOTB6bllPOHkrUHRVUTBaazN0Tzh4RnVUK2F4eVFJ?=
 =?utf-8?B?NzBKR3pHdzVQbnBmR3dXZlVzOHRZVFIyR1FzYkNSRytLMFhteS9ZZHJoYWZw?=
 =?utf-8?B?SXFyTDBKTXpualkxZm1SUEpsOVMrRmR6Rk1WM0pjOHlnZjcyRjNORmhSb3Zo?=
 =?utf-8?B?dEZybEpDTWFNd2MyZE5tQm14dlQwQ1BWc0YrVXA5d1oxMlZ4RU9ydkU2UW8x?=
 =?utf-8?B?bHFISDZJdEo2QWRuUTArSlREZmtBeU9HWEhrSFNOUUs5TThMbnNuVTdIdmhs?=
 =?utf-8?B?Z2s0TmpSMm5IVS8xcklJMmpCbW9IUHhiWE5DZzgxaGN2UTdibm12TW0wdWVP?=
 =?utf-8?B?Sk5zRzZLMSt6T3JNS0w2Wnh3N1VzYmFWcXRJeXZRQlVDY1VKYUErY2lGUEVG?=
 =?utf-8?B?V2EvaktrSHZZckg4d3NYRlIrdFhEZThzYlVLVlh5QmJZaUdwQTFQNVdILy85?=
 =?utf-8?B?enVxdEM4c21zT1lFdCtmR3FmaEp3akRjN2FQcndYSjlCOENiOGRmOHh5bm5l?=
 =?utf-8?B?dm5zZ2wwZ0tuZ1ZUQVQ2bVRmTXRneGY5ajZhZEN1Tzk5eUtmVlF0YkNLYlNj?=
 =?utf-8?B?VGlUMzl4V2dTWlpXN2tuK2o1VWNnV0ZpbklzV1dmTnA2ZktaZUNxRFFtaVgr?=
 =?utf-8?B?WkU0cjlTVTJKWWlJYjBKN0RCeVQ1SndIK3B5MUJYRlZhZXZYVjhuYkQ4bXVx?=
 =?utf-8?B?bFdlRnJWU1lrZExvQlNhWENIUksraHFaOWZodkc4ZmRLeHhtdG9oenp0alJo?=
 =?utf-8?B?ODh5S1o5UFluclFZMkJRL3UyV05JUmVDbjVDYWZnNVdrQkd6RE9Gb09vczdO?=
 =?utf-8?B?UHRyNEtpZnJZb090dGgzcjJITVVXbEVTeUlYdFdpMkxGQm8rMElhQkwwZWoz?=
 =?utf-8?B?QWdaUnhRekxLQ3Y4OWxxdDd6NUJaWnl3UE5qYUF5OWpzUkE2cGJNT3VScHpQ?=
 =?utf-8?B?RGlITVoxeU5XNGVoNHAwVGx3aHF3RUZuVnBudnNmOWoyTldRRjMzMGpwT2xz?=
 =?utf-8?B?M0dtbDAxM2FLeTM1dXJTUFBWOCtMZno2a2hCMkNINTBBaVB6bEpUQ1ZvcXZD?=
 =?utf-8?B?OXppZ3VnUUZ3dDg2OE5ua0V3QW9vRWxqaEpUSU44QkJRenM2ZUdWOTlFQitQ?=
 =?utf-8?B?MGpvTEQ4WXdFS3JKTW56eG1ZbTJlQ0R1R2JVM0NtaUhQUlhsMTNGQnNBSnJx?=
 =?utf-8?B?QkhQby91YkdjY1ZxMmo5ajVKVHdWT2xZbmdNVzJtR3IxZ3JaaE96enNGS1FF?=
 =?utf-8?B?ZDRaZFZCVk9WZjNMTTVHTHJsdG96VU4zeUZabkllRDVIZ09UOXU2dmQrMTZQ?=
 =?utf-8?B?bGxRVzB1MExVM21ZZWpNWTFwTGdzSkVxY3BLTlg0K1kzQWMzNnpyU2REd08y?=
 =?utf-8?B?NW00Mm12RnhLNGFKbzJnRGQ1a01Yd0hFMzFJcFdON242SWI5bHVXOGFYcWFB?=
 =?utf-8?B?ZDJGRWt3aytWMW1Nd3NVOHppVkpIdy9kWUtORFNDQTBWQk1xc2JWaHc0SGta?=
 =?utf-8?B?c3lSaUZQM00rNXQ4MWYzK1lrYnczKzRTSDBiYzFiUkJYbmcvbGtlWFUwRlR2?=
 =?utf-8?B?aDVPSlBXTHdJSi92NkM2aVJQM1FGZzBLUTIzQ2dOeWlRWFJGcmtSWW1TWDYv?=
 =?utf-8?B?WHNaekhObm00UXd4ZUthb1lCZUxKanBjRmx4bC9KbHNqNDUxRnRWdE8wRFIr?=
 =?utf-8?B?d2x5cVNHazM4NytlclVVRFpsU3dZdEdaUm9KOXVkcWl0bzFWQkxReVdpS05j?=
 =?utf-8?B?a0hUVzZCTkR6WUtxOTJsUU81YzVab2VkZTlOOXVZVVVXTmpiQ00wY3E4Ykoz?=
 =?utf-8?B?WERTaFRDbi9UOGhYNWxsRXo0M1Zkd09yMnJjc081TWJrZnhQbkJtRFg3ZkpO?=
 =?utf-8?B?WTg3TFBScVZ2MlFKbTFXNitaNjk4dUFQMjc5VmpnUUpXSWxPSUozRGFDS1dl?=
 =?utf-8?B?dUEybGtkY2hNYjZ2VG1tNGdCcHhjSkhGWWdnUXBKM0tHNFhtNEhiYkdPdCts?=
 =?utf-8?B?UmdzeGtvajJOQmo1N29LdTAzSWxuNzFwVUoxamhySEdqM1NzSTgxUEd3VGx5?=
 =?utf-8?B?UWViTTdPeXllS0xHYWFucEdodEFXaTNBZytlbm43M09BQWk0ZUxLNGlpamlE?=
 =?utf-8?Q?mzYFaU3QAvE4gUA/YgdMSRY=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bac3a5a1-61b7-477a-86ab-08dd46c59908
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:47:44.7997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVCnxSmRH+h2GNNLrdWvEkRTMdT1cOihiTz5TyLarZ8RxygCvMXrclLcQFGZG5Si12ZKFYSJiFFw5tpDVM1ECZ8dqpvpNTSRYVwQx+LrXOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10558
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 15:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6264

Hi Pascal,

On 2/6/25 4:35 PM, Weisser, Pascal.ext via lists.yoctoproject.org wrote:
> This patch adds the missing documentation of variable IMAGE_ROOTFS_MAXSIZE
> to the reference manual.
> 
> Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

