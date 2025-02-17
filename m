Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB66C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 17:54:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.52])
 by mx.groups.io with SMTP id smtpd.web10.59079.1739814842888841789
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 09:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XWQdGggo;
 spf=pass (domain: cherry.de, ip: 40.107.159.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I41MVrlSd+MtnzF/iqVp1NPnfBWYtvfaVWmSd1kqbK+XSNHIs2YRCF3v/yNziJTWMiQ2QdAPRvtxnq8usfsimTS3JvRY4ownkB6P9/QJ/y5MGbOAIgK2qjc0Nin4iDN2PPhNGfOpiErzM/iQ9ZbH03ETMeNBSqklgloXLd/0/a89bBVkLIV1lx5xCm86L2Lgk9kLx5BNebaCElZryOYqOAy8IP7Ti1DKK6wrNhKj5HMhwucTTHyAfFen0xHzN/XwWpuOZwtCcaEV3Stib380pyxjdm6NNxLdWDdFcxi5282pcECdkKF5v+TiJGcmYrD1hfiPbXNjv5emnBqBDY4b0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDXpNfQOgYSwPLbA578OeOypjV0DrffD2ORbGNmo0qI=;
 b=zE7cXUWqvJuDbu5vGIL87IOuFu98BrRLv7q5TaU7HzMkjZrv+y2RElmgQgpzaNE9JbmgX9wM5PhqbP0aKaF0NlPqsgxHJ8mQXze1J9I13VHcXS6X/QmIPnaPtoTmQL7ISz8d9z1wnVOK2ANbEpzWjk6vpsZKR1WuYx13vlxYeGH5HN5EDwR5+tmtLVAXg38Vm1GJ77mC0IbkEHNbJzQ49hi7hSfDyQmEO7MGODZihRpbWle+xhByWaPvfIpE8+lReYS7FOPtVeO/OCrfXo7tWS/PDGnv30Wv7bGQZvi3TJ1W0JHPZViuq9gKZDihiMTkOltz/5jp7T6SGXkZeH0SUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDXpNfQOgYSwPLbA578OeOypjV0DrffD2ORbGNmo0qI=;
 b=XWQdGggoUuYP/8HuIXbwVCkLHF10UpX6u8oRsy4hip8lrekCK0D9IDKzAcHdkMxYHckC/hsLHX1gJ7FzRJc+OFYUlvutU8CGOPGHgOz6kct6ruNrall4HprbcwHQxmD0ci45SvHYbAPFSz+doipLA9res227xJ2rOfHjopHldA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 17:53:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 17:53:59 +0000
Message-ID: <19027412-ef9a-4220-b865-d452ca7db3e7@cherry.de>
Date: Mon, 17 Feb 2025 18:53:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] dev-manual/multiconfig: add suggested best
 practices and baremetal sections
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
 <20250217-multiconfig-doc-v3-6-027a9fb282c3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250217-multiconfig-doc-v3-6-027a9fb282c3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: c9bb15df-f0ab-4173-3ba0-08dd4f7c0df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RjlpOWxUU1FtZVhuR2JhdnBuK0tRbUhhOXR0K1V4WHBrKzVjZ0djWm1kK2tS?=
 =?utf-8?B?cnprK0kwcVNsQkJnc2NpeTRiMEQ3VDRpUGtlUnFyWG9XT0hKaTNlejhuV25W?=
 =?utf-8?B?UnI1b1U4MU5OZnFHcHMxczU3Y3QrOEppQVZpYTRDRHJkOGU2ZWg5MmowTFBl?=
 =?utf-8?B?djMxRHdkOFlGd0ZXeFRTQnFOOGk4Ty9NRkFLeTB0ZXk1WkZveFJrdStRRGg3?=
 =?utf-8?B?d1g1M1pCSHI3aEtwS0I4bmcrYXFoaFhleW0vS1VjUXFaQk9wcFFjcndabGZO?=
 =?utf-8?B?QlNsV3o0MjZ2RUlza0RjMGQzT0VUdExLcG5pMWkyVUk2dXBhT1E3YVpGNEd1?=
 =?utf-8?B?YkRtWE01SFc2c1QwbkdUWUVVdnFWVTExcW1uQUtjd1MrUTRQeElvOGFlZlV1?=
 =?utf-8?B?MjYzRGxYY29UbUQrc1N2QzQ1azFDbzJrcnFiV0hDTkFlK2kwU1pZN1ZqazdY?=
 =?utf-8?B?c1EyOHNDUEU5UjJMc094S3JCMGp1MkY2cGxESmlZM1FLZ2c0emordkhFL1NS?=
 =?utf-8?B?c1FJd2djYklDT2p1b3JLcnoyc3FzMUxoVVFsdjhnTGE4UHdEamhpS0dCTFUy?=
 =?utf-8?B?blE3aEt4TTZUd2NJNXh0RDQ5TmJieEJycDJ6T0FuOGZaMTlCQll5RGpvMVNG?=
 =?utf-8?B?RVhRZi9obzd6VVFJeklCYzJLeEpWelJIN2dwaXR2ZTREUXAwc2tpeUtLdjlC?=
 =?utf-8?B?dUJtaGJ6YmFjN05KU2orYm1jeWlnZnpFM0RDZmFUaWliQk5uRThiU3QxbmV0?=
 =?utf-8?B?VUxIOEZ3V3hYZDVMOWxqcm01WFY0eXJKRTJHeWVneUZNWk5Hd0JEVklsTVZX?=
 =?utf-8?B?VWhDL1VrcVdQcU1YdzdQSFdoellwOGxGOVJKSitmcnJwV2lQOTVuK3Y5MjNt?=
 =?utf-8?B?eWRsZjZFNldRMWVDUWM4dDVzNjlvVHlqTVgySXljcFVBUXBNMXp1WENlNzky?=
 =?utf-8?B?eC9VbUFEWk1kZjFzZlMzZHI2cEhIb2JQYXRvTWxsL0RxSDdnZksyOU1yeGVk?=
 =?utf-8?B?RVBkYzVmZ1AraXd0R29Rdld2bUtmdERYNW1xZ3Fmekw2WENIOFg1d0o3czJR?=
 =?utf-8?B?NU5CSEJyelFHT1pId25LNHJFbHFqMHJKZmJOZlhiRTVJVVJuRkJubGhUS1FZ?=
 =?utf-8?B?SmxURDl0TExyRFNQOGFXNDBJNXVIWDZabjkwNkd4RXRPcUtvdVhsSVl3aVFO?=
 =?utf-8?B?VmxEdUpydlpkYmhESWYwU0NaRzdpcGpXODlOa0F6bmZtRDY5R09iaUJ5MG1R?=
 =?utf-8?B?dzVrRUxoeVUvWmJVZG1EcGtBMEpPZzY2MEZVOERjODRxQy9vS2YyVXFyYlYz?=
 =?utf-8?B?WHVSWUg3cVZWdjFDOVMyL2JHMFdsYVZnUHlYWUxPNUhlelk2andWTTBPWTgw?=
 =?utf-8?B?NTdYNWV2NWo2OW1XU1FkN2FwNkhQMms3STY2UFcrdE9KVmFFMG1iM2xSWU5W?=
 =?utf-8?B?TkVyYW1GZU1WeHBTcGEyczVBaFEwUWZxUEVHV1BQcmkzcHk4amtnTWlRdjFS?=
 =?utf-8?B?V045Y3VEY3JIVlZFU1NmOUtuZ2FaaHBoSkR1VURKS21UeUUzLzlhZzNLcXZJ?=
 =?utf-8?B?Z2RmVmcxbFREeE5mZThlN3Z6STdHblJ6RnA1M2JYQnNEdklnR05YdHR5eVJB?=
 =?utf-8?B?NFhvRS8xTHNOWURORTNtRU1zUW5OKzE3dTluY0wzZjgzRk9vTVVZZDZJazdi?=
 =?utf-8?B?WXp4STc0QlZRY0hoYmk2bEFXUmpwRFhTRTROVGtOenRJL1UzbkNrcFd2d1BR?=
 =?utf-8?Q?wSoHViDrGCiSNeTohNKRAmokIkDzfzXR6qvPGK7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QW1wNWVwbnFHNTE3TS9wYmRjeE1QODArV3VRU2lyd3dBVXdVQUpteEhKSUZV?=
 =?utf-8?B?UHc5OWlpUWhDWHBOdU1JUnlhUG5ITEpDczRqc1A4N0lRTU1VREdwSmg3ZUE0?=
 =?utf-8?B?SnpOeExMc2RQZFFMRHQzWDFWS3I2cE5rMDBpMFRXOU5lZFJ2cFVFbWd6WTJj?=
 =?utf-8?B?M0puQ0h5K2ZETVo2RlVtWDdIRlhzYTBEQ0Uxak9SRlJOM3d6ZmNUYy9mVGxq?=
 =?utf-8?B?Y3VqenJ2MEw3Y0p1ellxTUJCMk1QQ1dwUmJYRGcvZ2tQOXZvSHZ1MnZ3dm1Z?=
 =?utf-8?B?TnliaS9VWDUvS2k4RHhDdVRJaVJCUEtCSWhNOVl6anZ6U0s5bjB3Nlo2Zytp?=
 =?utf-8?B?SkwyUC90YndRRUI0aHlUTEJVb0wwTTZFUW8xa0xvQTVoclYyRDlJL0xzVDJh?=
 =?utf-8?B?VDVOM3ZORXNlYjB1Tlc1bTliV29qSHRTTW9LQTNweWovM0Y2WnRNZjUvRXJO?=
 =?utf-8?B?TEl5Z0JXUnIzTnlRRVN3RHR0UFZOQ2NsVlFaMHRWUVJIbXBndEpEMDRya2tn?=
 =?utf-8?B?T2taL2dwYllKZUVIYUZsRlJCckNWRG5XNEhKVVBpeHRqQmlGWmg5T0Y1MnNr?=
 =?utf-8?B?bE5QdWlwY0RwdHBnc00xSE9ndTBlRDB0elNJVjYvWEpNRXVRV0wweVRCNmEw?=
 =?utf-8?B?MDhON3pQOUpPanJsUjZhVXVKYzFQUHNSNmducnI2S1BCRzV0ckp1d0lOWStS?=
 =?utf-8?B?RVVTbUw4dXJzQkF2TkxWZlFacDYvMzNleFZGREFBL01Tc3p3YmNXUkUweHBJ?=
 =?utf-8?B?bzZWeGFKNUVEZkJYV1NZT1c2QUo1WFhaU00rM2JhdzIyZzYzNFE4MXlQVGor?=
 =?utf-8?B?UVNBSnVESXZtMjY2T3RwQ3NtZVpHVFNHUktsLzQzVVA2UlU4eDhoMHN6VHZ0?=
 =?utf-8?B?L0dOaFhaOWF2SEFoa1gzK2d1U3VKdS9salJOeTZkNTh4WkNQMzJ4d3lKenZn?=
 =?utf-8?B?b3lEYTBJSEJxK1JNRHQzZ3VXZ2NXSVR6K3BMWUpycEx6TUhlUWZZMTRMMDc3?=
 =?utf-8?B?M3FKZHR2ZTcrSVpRZG02Q3d6OXFUanhFM2lKRmw3NjNYUVNYcGVYd3NoK3hk?=
 =?utf-8?B?cnF5MlZudHlNUDFaQk9DQ2dVakxncUxVakhyQjh5bVZ2VW5Pd0M5ZVI1SkNm?=
 =?utf-8?B?d0QwdWxvS1AzN1RiZzVubEpHeUVucVoxRkNXL3ArN3lySnZMWkRrZ0RLWnhX?=
 =?utf-8?B?Qm0wOVgrUGpyK2VmcjlLdnN4c0tDOHF3OWRvVENISHNYbEkrUUFWTmg1TDJt?=
 =?utf-8?B?NEVOaVhxQWs2eHlXa1FIMUhQdDk0cmExTkRoS0hzL1JYNkJjUVJZQ3NPV0wx?=
 =?utf-8?B?M1Q1b00zWC9WNlYvUGRIOUVUdjRSdlV4STZHSkluZDRyZ1JuWnFobng2Y3Fs?=
 =?utf-8?B?TDZnT3VHYWRQeXJVWEdRNkx1TmV2dVh6akNIVGFZSGx1SDBtTTI0aHVQbm1N?=
 =?utf-8?B?WjVyL2FlUC8vRmQyNW5MZitSclE5M2thY0k0b2JsMWxIZkdOSFVnNnJ3dFVT?=
 =?utf-8?B?RkpkbjhGQWxQaGZvN2prcnd5WVE5dUpRUUd0WDZRTUNxTEo2S2ZpRTdDdGNh?=
 =?utf-8?B?T01JcUZjSGJyZWlQRGNDVjNHVlRnZ1Q5UXhrdytyc2ZyekIwR3NTaTdtZVV3?=
 =?utf-8?B?dlFndzM1cWJrR3RqUTRWVnBZQWk1aVh4VHBhUGZDQUFyS1dvVGRIVkkxMThv?=
 =?utf-8?B?cHdibENiUHgrN0Z6NTY4KzVtU25KLzZGR2NLcUNWcTJFdTd3SDNOL3J4T1A0?=
 =?utf-8?B?aDJRcFF6bEVkdWFWQXlDTFZ6MzRBOG9vNWhRaENDT2srcTl3Y0lMMjNOZkZT?=
 =?utf-8?B?MTBJR1dsYmF5Q0NmSkJlMWZ3K0crcFNCcnJtM3ZYS2hRNGlOdTNEejhyYUhZ?=
 =?utf-8?B?Q2tRcTdXNm00aUN3c1VqY0p4UEZZWGJqd250TEI5NnNUZHJlZG9Ga1NqQ3lX?=
 =?utf-8?B?dUxWMWRHWEVhSDhoeGV3VUMyZ2VXang0eGd1MnRZdi9UNXNEeE4rNkZXTWM2?=
 =?utf-8?B?dGdBUXN5RkZKM2h5QmJUNUQ5WTBXaXdEVnA3T2x6NVdSeVlqQzZieFJFaTAw?=
 =?utf-8?B?V0tjb1NKQ0ZSZlJURlpRMGhwTEx5QVFST1FNS0FDU0NIcTQrWTFLeWh3UDVy?=
 =?utf-8?B?dDVvd3J3U3J1VkpRZzFCVXBJb2FGVkd3aFhyWVlKbzRQOTNkNzB0aTFENWdo?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bb15df-f0ab-4173-3ba0-08dd4f7c0df4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 17:53:58.9410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbvBoTeQTiB8u23lm3gbmfJ5LUPYtAmEXGWKV1WlkIpmWJ2plIxgpZgPP+Mu70YGeywOGftNlEOHMHieVLt8BAwYioXjoSglwmhUnLwSg4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 17:54:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6403

Hi Antonin,

On 2/17/25 3:50 PM, Antonin Godard wrote:
> After the suggestions from Mark Hatle on the list
> (https://lists.yoctoproject.org/g/docs/topic/110487932), add two
> sections to the multiconfig doc:
> 
> - Suggested best practices: suggestion for better design of multiconfig
>    builds.
> 
> - Common use case: baremetal build.
> 
>    This section applies the guidelines from the first sections and apply
>    it to a real-life example of how to use multiconfig. This one to build
>    some baremetal firmware alongside a regular Linux build.
> 
> Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

