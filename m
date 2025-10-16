Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACA2CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:14:22 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.35])
 by mx.groups.io with SMTP id smtpd.web10.4506.1760609656649827484
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=oDWyr6es;
 spf=pass (domain: cherry.de, ip: 52.101.84.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ro0J9IQa4dVDkPa3EhACu/mlB6GuVTL/4UJD6lM6rBjllAjlwRYsObcyTVpK+rfRk8RC98EqASV3zTylkicykXFVeN1kjyy9Pk0Koy954r6Fvr2Rn9EjtDik3unQEF/ya8EIv2vq4VIUkM6XiUIxz1p0cy5I2KqwmxAe9EK/9PbvNxxz6XCwsyqz9F7BHeFb7Dk5nkQs5j3qeuUX4KsbYTAPpVgKSec6LopVDM70/lZ7fH5LFj3q9NCeSLEWVGoj3+yXyc3RB8BMbi2HdMncPTfQClh7y8Ym9mze7dLzCy8+qa1MfV32pQ7w10k7DXiL+Y7Z6ZR+uDvABdq5OxxJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayGcF2YDB24l6R3VMhkZ/Dc2DReFivCMEyC9omO8LUs=;
 b=zOz6V6NRkozsFGICyC0NOmySFnaoCnUhGXdk5DOVFs4WRTnqmcJDd3tRymuLbyATRbsshximnn5SY172J0EvVCfIPhU+PY9xNL23cjpLVrbTcE/mFkYUqwmdtkokN2EWdUY+u6YJSQWuSxeiK+hrZdvE3GFtExIDGI83nqWFx7jxoDvlDNbTYax2bAkDNF/E91KhKaP/e9h6l8TpmEWKfYt78KUyYWFEnKbliX9KtCgD+wJsi69i/0aP2fq/rUJYTNHmgnZqTepun/5I6MONf4nMq0uJxsujadadoopGSlv1H1x7AmlY6Lh5/UVnG014vac2PcuNF3ho0DhoDJcnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayGcF2YDB24l6R3VMhkZ/Dc2DReFivCMEyC9omO8LUs=;
 b=oDWyr6esKBRUHb4j1gHvf2vMHyXpE7It4XCue9+lLLZqzdLDSi4RxvTa7i3/mtQyDnxYOHxqAnhXq0sEo+WJpwyUlw391qq+IfvKyzr+6ZDXNylk6EnwzwbTY8OfIdMrMtUbt72rm2W9GxOVvlTAKk+cv3XXx7JKzDdUMl7BYTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU7PR04MB11210.eurprd04.prod.outlook.com (2603:10a6:10:5b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 10:14:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:14:11 +0000
Message-ID: <37e4067d-a460-4e2d-8226-d8c7c3912004@cherry.de>
Date: Thu, 16 Oct 2025 12:14:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 08/17] ref-manual/variables.rst: document the
 REQUIRED_COMBINED_FEATURES variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-8-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-8-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU7PR04MB11210:EE_
X-MS-Office365-Filtering-Correlation-Id: 9213f78e-4ac6-4df0-d1ff-08de0c9cc015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dC9tZGhQeVRVNWVkMnhSb3Fva3VGTFpVdEFpTWlOWndFZ3hKVFJWczFhZGJx?=
 =?utf-8?B?R25uSDdDcjFWSjh6ZWhiQ1VObUxyTlV6UW9aTDJjUC96ZnNNdE1ubHkxM2du?=
 =?utf-8?B?WFZadjdjQWlrZS9pbEQvL0lqMzNmaUJkWHBGUnBGMWUxc2UwOGFSNGVTT1JJ?=
 =?utf-8?B?V2h3V0djWkZjTW1IZWZhU1lKTVdCcW1TUUxuNFVObkhhM1RnSUpTUndoeHM5?=
 =?utf-8?B?azZ0RE5RSlVpazZrWW0vVWl1QlBvSm9ET09CTmhwbXRSWk9oS3pIeHAwNGs1?=
 =?utf-8?B?TTAvODArTUZ3WVN4NGQ4ZFFtL0V2SXhKelp0NHQ2Ykw3bEcwR3NNVytCM3hU?=
 =?utf-8?B?RnpjRms0dUd3YXRhWUMwZW9pSkxFOTEvTGZYLzJWd3FnZkY5NDEvTHNnVGtS?=
 =?utf-8?B?WXZXYWNkU1R1bzBLUTlmUUtHR3JTVG9ucmFqd2F2MXhiWGxyaVpmaFdyaFVE?=
 =?utf-8?B?ci8xbFQzaGpUaUNPS2R2YmJhT3V4bFVMV1pXYVAvZFNqN0s0NmlYeWxFUExP?=
 =?utf-8?B?OU1BM0o4ZTdFemhxYy9pS0VGZjlSQVJjb0EraWVXOHFWM3hxZUpZMWVkTlRi?=
 =?utf-8?B?bGdaVUpiWGlTZlkwaWRBcDJwVUJPMlllVndyVmNXUmwzTjdOdnZDdmlqZUhq?=
 =?utf-8?B?YWw1WGFEWmc3d0ZXR2Mxam5WL043TjJkQVVKR0FSN1RMY0huQXFRY2F4SkVs?=
 =?utf-8?B?ODMwWHdyWnFyTnFxSXBud1VXeW50ZHRmakpreURjSUE0NTZqcTB1dlBha3o3?=
 =?utf-8?B?NHdwUi9FRFRhcWlKZlIxd1JHY1ltN2F0R255RkVjeEdhay9RZjhQeGlwWE1i?=
 =?utf-8?B?TDZUOE04dEM2OElRdUNkTjIzL0FqM1hHelZEUjlQN1BueWFtcm9Zc2p5ZWIv?=
 =?utf-8?B?eG1raHloVTFRWnF3dTNBaTh0amhnT1pwTGxSMzRpTGhUSVY4Y2kzUUxheXFv?=
 =?utf-8?B?eFdwOG81SVFJWkhhOU9jZm01VFRPSUJ1U2lyZ044VXByUVhuSGVTQnhjL3Vi?=
 =?utf-8?B?MXhBYk1ZWDM0MFNhTlIwZ2pud3NkMXg0MHcrNmlDZk8vQ1BaZ1JySUlxNlNN?=
 =?utf-8?B?NDlDTGZXRjNQSS9vWFNBc3RKeVd5K1VyQmdIcHBPa1dpQi9HeTRFR3FXSi95?=
 =?utf-8?B?ZCtJdnlUb3ZNaytuYmZMUHhBc0ttWXVDQkVZMnJISlBvRy9MNTVBT2d5SDZI?=
 =?utf-8?B?UFBScEMxRHJENGgzMnBlR3ZNR0huamZQQjBRSm9JOGdOTFd4b09uQTBIT0Fr?=
 =?utf-8?B?UENPamt4NU1UdU0raEQzTjFyYlRzdFBQUnlOdTJtbGZ6aHZhTHdPSFRjWml1?=
 =?utf-8?B?Wk5UaWJVMjVDdzV2NUE5Mm1GbUtzblJsWlJhRldTZ0VpWWVHVTFRNlBxbGFy?=
 =?utf-8?B?UjhqRkx4cnhyM3ZkS0tteFdRaW5wRzhWbi80MmFRZmpFSHJZRHFRcVNFUFY5?=
 =?utf-8?B?bzBNRTJKUUw0K3dMN1c0UStSZ3Z1c1FqUHd4ZFV1UG9odUJSNWV0UnJETTJ1?=
 =?utf-8?B?d3V3dlFyRmtzZE90cUNhdmo2cVI0bHFIejA5UzlaY1NnME91a1R3bzNQa3Jl?=
 =?utf-8?B?TktFZkdScGpTVmJpUmlFR2RPQXgyV29SYnZ1L1NwUFovVWZnVktxV1NUOENO?=
 =?utf-8?B?ZnNDZjBobVZRaTZnd2x3OUNVUzlwRXVhQWQ2LzhuaHFYMkZRSFczMWpXK3pU?=
 =?utf-8?B?NTNobTBSSS8rRFJLOEwyaHFXb2tHMzQxVTlZbUUvTTFQOXlCQVQrWkk2Q2dQ?=
 =?utf-8?B?Y3I0RWhrZm5lUHI0QVE3bFN6TjFrbE9pUVROejBmS2x6dVhGOWpwT0JhbHlJ?=
 =?utf-8?B?aDE4Y093anZzUEllTVl0WDRVd2NSaXZ4aDZydml3VTNCU2pMd3JST0tHZEd5?=
 =?utf-8?B?NDZGMERTc2xKVTFCUDkzSWtXVGZUWVp3VXExZFE5U3JrWGQwbVZ5UkJoWnlm?=
 =?utf-8?Q?uOcq5x3nkBdS5Ah6w2IRbHBDn0EEOGRh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0lPM3lUMHpNamgyR3BDc2VKWmx1MjRRU1AzcjNPZ2J5aXhVVmVzdUZPT0ky?=
 =?utf-8?B?R1NKRWVMbDV3U1ZUUEplaUxndDVsVkNUekI0VkUrQjVDdGZScHpVd3k2VUVD?=
 =?utf-8?B?dFMvKzdLZFF1YXROWDFVb3lFS3p4WGpmc2dDZXBLRzBxNW9vdFFxT2QyRk8z?=
 =?utf-8?B?NXV2SCtFUUpNNUpoRFZrbWZGeG1KU1JWcjV2UzB4RUt4QktnREtrblE4bG1V?=
 =?utf-8?B?bmJob2E5NnhaK1NzenVlZHlxdkllZmk3cktqOHJyTVlGT1lRNk9RRFU4ZDlF?=
 =?utf-8?B?M1ZWRGZLTjJleWtXRGl0M0pwS21RZ2tEM1ZHaXFwcEtkdE1TNk9QKzhFT3ZE?=
 =?utf-8?B?K3hQb09mbWZ0S2YrbXF4czVESXlZVm5ncmNOTTl1bUtMUkpXWjVuY09oeUhP?=
 =?utf-8?B?SXk1YVlRTWFVejhIRWRNVEpiekdQMzhiZENJL2w4WUdyOXV5Y2VITjNTZE9Q?=
 =?utf-8?B?ekJlTDV1a1o5MjNhWjdnNkNDSDRydTJRRmd4d3c4bC92aVZrQVZTQzVnY2Zl?=
 =?utf-8?B?bXRZL1JmcVJQVndBMXZIV05WNDZjZVZVdHNSSnFFaGwydVdvK3U3bjhHN1Fr?=
 =?utf-8?B?NnRQYUxINHI3a1U4TTZwZzZYdElDSFF5ckRUaFBYb1djN0V1TU1HcFJqUFZz?=
 =?utf-8?B?UisxRkF6SDF0MFg3ZXpsZFNCeDhPU0F6MDArZHNiMTNnMFdOdDh1blBGNzdV?=
 =?utf-8?B?bmlrQitSNktwZkNWWEVKTXIreWxVMkNrZ1l0enBySUpaNFpFWEF3OHVLZFpH?=
 =?utf-8?B?Z08rUHNiQ21jSExBd2cwWXJpcWIrbTgrQzFhOWY0TDJ5QkI1U3NmTTgxdWxt?=
 =?utf-8?B?UHNJYitIZERFYnpxR2VYYkdRKzFnOGs0TENJMjhTMmFZREVvY0xua2psT0VQ?=
 =?utf-8?B?UFpzYmREb3daOWtlaHg2bWFoeG9ycXVRVHNrTDZ5UmZucFE1emFlTEVvOVNk?=
 =?utf-8?B?Y1lNdFlZdm5lSUpsd1F0eHp6ZEZGY3R1MTJQVy9CRmJiOTJkS3lUM3hXQVBU?=
 =?utf-8?B?YkVxS291ckRFcHNTZjBZNWU2eVVyN2R5aG1sM3hhRzJTWlFJRUp4VThvd0F2?=
 =?utf-8?B?dmxHQjJyQW5oTTVwQzlYSm1MZDdiUXZkTHYrRWFOdGNLVDBSSlBqbDB5NlRB?=
 =?utf-8?B?U2pZNEhLNnNobkdGRlJTUXFHUUNaS0JPcWxxV1Buc0pRTis2LzVuZnBiNkRT?=
 =?utf-8?B?QkdNbUM4ZWpJVUwzeHRndlorckQ2emx3U0JsY3k5OG5EdlB3cnQwWWd2TmZv?=
 =?utf-8?B?YWUxMURHL3hTK2VCUVVJSzdjR3hoZzhHZzBvZUk4dGtNbVFmdHB0SUlHWDBp?=
 =?utf-8?B?U21CSUVWb2tVYThwbm9lUlArR0FDTUpyN0xGQkR4ZjY4Q2FUaDlLN2VFbno5?=
 =?utf-8?B?Z1QvRGtMVmdkckxrU0pKUU9ESm5TMUZ5WlQzS3EvZUlua1Q4NkRhZkxHQWow?=
 =?utf-8?B?aWpFdkRLT0V1dGdhN0h5YTNPaVZERTJhK3NLVURkZmc5ZW5kNE5BdWRWSDF5?=
 =?utf-8?B?MGRsM1FGUnNHSGg5TElSdEpPNDU4MmRjeWlnVGZ4cTQ5bkdJa1RmRGlTYjZ2?=
 =?utf-8?B?cEFHYmVGcXNKc1orZjVjTnowSjJucEdyWnB5c1JvWVFQZ2RIVE1kU2ljR21z?=
 =?utf-8?B?Nm0xMjYrL1FxcjUzZG0ydHUwMkx1U05OSVFGWEc2ajBSRVA1bEN6dkZmWmJz?=
 =?utf-8?B?QmhOS1hqRFRHTTFTMllZZXBMZDJrWERHcmZUSy9TME5iRHU2dnZhbG8xVHI0?=
 =?utf-8?B?RXR5dlNoUkVndmpUcExmSEVVV3pHSUhGd2RnRFBnbHR2S01aSytDZkxvMWxl?=
 =?utf-8?B?djNnMmZ5SGJ5N1YvMGtHU0FiUENyUDA4cWR4ZExCOG1wZ2V3RGpXRE1rUjQv?=
 =?utf-8?B?QjEyTGU5Sno1eXV4RHdOdVZvQUZFTUl2VHN3cmp5WEFPOGRtRjQzb2R4eHNT?=
 =?utf-8?B?Z0NaemI1S0Nmd1dRTUlWU1k1WUxodzdjNjY4VTlFa2J3WWpUV1BKdkpNc2k4?=
 =?utf-8?B?ZUZWOVJrMzNXbElKNXd0Q3hDa3hNMnQ2RVRlSGxhdkZkQk8wVGJFbzhIMzcy?=
 =?utf-8?B?b1hzU3cvV3VpV0NLQUZPQm5xZjN6alAyRGhMQ09XalNSMDMyL2R0SUlodlZt?=
 =?utf-8?B?aHJwekE3ZS9mSEJ3OUxLQWdLTGZtTExxU3ZNeFJPenF6SmtEaWdEV05ob0Zt?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9213f78e-4ac6-4df0-d1ff-08de0c9cc015
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:14:11.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJKjfSPr1RTZu9pnNOAKuF6NuHrR7SjSpO3yeXV9u1uvnW5PJC6Q6FJZ4p7UiwE182eujYMhE76sROhmChuhEv7qyJggwiYAPS2XiUAz8F8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11210
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:14:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7731

Hi Antonin,

On 10/16/25 10:53 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added in OE-Core commit: 5f4875b950ce ("distro_features_check: expand
> with MACHINE_FEATURES and COMBINED_FEATURES, rename").
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

