Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35614D2D11B
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:45:33 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60355.1768315530460584936
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ERBSEqLz;
 spf=pass (domain: cherry.de, ip: 40.107.162.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNGyYY0EBZmq2EQ07FZWFZJGxCQUuOx12TRZalbGo2LA6OLs900jcccWChcaXu7QwuknhhCI2xYPltXHR4/r73OpOxT2ZfMhTWshbisEEy5wMCQctCJwo+oDWuSCBvDlTJ/8JxbiLfqGN59SLzr2ypOEDWT5KOp3HljFtA4P3YSQIkONf5HYs4giuB7yfywqGL/fe6lMMX2NqqEXOdLVR+tGOfA07tQHdtvcuqxWt40b9QsN6R9Ae00iQpslQ8EyHJqhwO/mbxkOfC8GBzWVnpRzsLehj643KvSUkWecfbRrYAwhSfquc0tjVXCgkzwiPltcZGVD/XMCJnnHoIs00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=ZkZLVp8Ob8hZhUZcpfcKxX7GjyS49jGgLFke7uIURbfoZpSpfE5D52r9OtPD0SvfMgjQ8fsC5LTQkV8Xa6xHCBKARO7ksU9w1+6bTY/hu8ZwYWhvvQRyCxMtDee+wQOyY6AuHcrT9aZcRsiX7wggwJexVyOUPtnGh/PBimpcEZ52MtbcLnplzYRmL76OuP7lSsjsiAZxDjbMMWuI0yluqwsgKlpUbopc5aSvQQS6Z2IL9tJ1K/65TwbBS14/DHexVPIuW6F0DxLHfJL8zuDYrmyW0WVgJjSfkzAkQDwcYNCWOhnioLWRkZkTydAFu6s2KRahL2wK6gkC8Zuxqb4Rcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=ERBSEqLzwHiZ07qKCjBW9w2LDGtZu+7nMLN9TnPoebzO9nJ5HUdYiLyu9L5WoU0yPVv3zMUT9jJO39y2zh15e91VuY43B8bo6U46w00K6lv21fvCgzAEcEDaKQUA22B7tQl2/TBI9gJ1ST4u7kUbFlFFtTk6OopQw0GyQtxOg1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB11219.eurprd04.prod.outlook.com (2603:10a6:800:29a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:45:21 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:45:21 +0000
Message-ID: <3672027d-fdd6-4b95-827d-fc41003cc80d@cherry.de>
Date: Tue, 13 Jan 2026 15:45:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 34/53] contributor-guide/identify-component.rst:
 remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-34-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-34-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0300.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB11219:EE_
X-MS-Office365-Filtering-Correlation-Id: e6dd3fbf-9918-4575-3c40-08de52b260d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TUZEalNocWJTUVhacGpoM2szVTBrdnVSVllpNW9VQUJhR0FDVzNHaXBqV3Ux?=
 =?utf-8?B?enlJTVQralNIRkttdVlCbE9KYzVmVkxaMjRDSnkxTGxSbVF1Z3VJSGlKSW9j?=
 =?utf-8?B?cGx6WUkvekVveldoLzVldE56b1NEUFRwMVVGY2hjeWQweFAvYXVHbmh2blo0?=
 =?utf-8?B?Wm10a0t3cUdiYWY1Z3hPV1dnUllnSHFFMm9BdmIzZ1R5eHJINXg3Ty9ZMnVa?=
 =?utf-8?B?RURIRFRjazJ1cDkyRFVJMUEvdFl3WFAyZVl5ZUR6WE5RNFo1T3Q1SmJWTUo3?=
 =?utf-8?B?RTFOWTFJVWFLQ1FkSXAxK0x4YytzckROUkx6U1ZMbC9icjY5OHgrK0JjSkZF?=
 =?utf-8?B?ZGl3RjBpekZrWWFJSEJPZEpFdUxoc1RKcjF4a1FDNm5lbDJHM3ZaWmtDdVBa?=
 =?utf-8?B?bktka2dkQ0xSbVNwdHdpZ2dIZFc4QjFYaXJxVEc1bFh5QjNHQWhkWUZOVURH?=
 =?utf-8?B?MmRrdjFNOGt6bCtnMmRkMTRZNWwyNWJmcmg3ZHJnQnVzLzlONWVNU25lckVP?=
 =?utf-8?B?M3I5L2dEbjBaRS9Sb1NabklCTGNUS0pRWG9WNFJIQkpibmdwRXhERnhBb3VF?=
 =?utf-8?B?WS9INE9sYW42Z1d2M0p4QXJvSXlRY0VIVTFObDNMSHpqY3F2cC9vTWRmNS9y?=
 =?utf-8?B?aXBLVTEyV1FJVHNybWpVa0ZXNmJjd2JySnhWbTUvUDVjMTVlbUZtcmpmMzJU?=
 =?utf-8?B?OXdtbHYrVk9WQnE3dXZBQjdLUUdmckFWSHFNdG5TaUdoZzhuazdmdmhVMyt6?=
 =?utf-8?B?RERZVlZ1M1Fqb0lDL3FjUHltOVJHSEZyOW5FZ0lReWpzR2lmM0hVazJDOEx4?=
 =?utf-8?B?ZGQ1ODAvdVlsMDBTK1FOU2xhQjhkOWJoYWM0L05TeDhzSkdZTU5HaDNqYjJl?=
 =?utf-8?B?R29rRk1pWjJ4ang2azl5ZFZTUnh6UFI3ZDF0SmJxSEU5VVVYZ0RLREtXSkNK?=
 =?utf-8?B?MzJnenVFcElYWEx2Mjkyd3NYb1RkczJOeFZEOWRPYXRidHpDVSszQ0hTTmdS?=
 =?utf-8?B?d3VOSEVwR3V3RjU1cHdzMzI3NVM0MjJSUE0rbGtRU2JhUzRLeklJd1E2U2hW?=
 =?utf-8?B?cVdxSkJoK1BVeVZGQWJBbG5Pc0QwNFRJVG5HWWFPMUlpdlAzcm1CaFcrNW9h?=
 =?utf-8?B?UVZvZmhQUEhEam9xNnlmN05QK213WjZHTWpLbVptM0ZjK3p5VDhXOWZQOTd1?=
 =?utf-8?B?YlVrZUgrcVQ5YnlXcmJId3F5eXNVNkRiUVpwQ0E3aFVIenhMQ3IxOU9xdk0z?=
 =?utf-8?B?SStTV3dMS1ZxVXFQWkROYjBGVjZUaGc4NFowdmV3T01jTmJaUThneTk5OGI0?=
 =?utf-8?B?cWtDcjRWMGtkWUM3T0VFZnpReDIwT1h5cHl2WHpURDBoVjZNc0QydElHT1Y1?=
 =?utf-8?B?dy9pRFFYdzNkR0ZqRDdkcGhRZHY5Zi9yNnMramVqM0x2U3JlSUFjUFg1ZEpu?=
 =?utf-8?B?bmdveVAydGxnbFhpQ291cFlxQ05oRmJ6aUFTeXBtbWI1dGRVa2VwTGIvb1Zl?=
 =?utf-8?B?SGoxdWtyZkpvUXAySEp1aFBFd3lDdHZRanE4ckV6a2tvbzVpOUtleEI1TXdW?=
 =?utf-8?B?cmFHcFhaWVVyd2ptU0kva041VWs0UnNyMUtDYWFaQk56cUJ5YjE5c2Y3QVZj?=
 =?utf-8?B?ZHN2RTNkWmE4RkhTSjlRYk1IdFRTVEI4bmdqa1lYdURvTU5vQkdmTWsvK29y?=
 =?utf-8?B?aDhUaFpQRXZ1aitYcUtSa05XY0hhOGFNM2tkWTgwMDBXQndLRHAySzh6Z3I1?=
 =?utf-8?B?TGJ1aFpZZXA2elg2cDRpSkdYTzltcnFJSXZKZ0lYZzN4SE90aEZRaWE3NFM4?=
 =?utf-8?B?U0VzS1JzY0dEbUtuYnJUQmFuOFNPcW8wZjMyclhCSlZZWjlNUXNDcHFrQTRU?=
 =?utf-8?B?M0I2RHNmTFhTYzFYRGF5ck11OTRBNWtMMjBYRWtCcnBMcy8vaXp5ckV5anVE?=
 =?utf-8?Q?v+tbUSm7dVDcTrvPypqTsOspRaM+8Tsq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q29EWjk5UFZXSnlOUW1HaThlWktBUHVFS2FwRkFlWUxoNDMzYnlESFo2cURm?=
 =?utf-8?B?UWFqYSs5dDBiZXllbXZweGRmWitaZ1krZlRIa2F2Ukl2Y2NzMThaN1JKc3JX?=
 =?utf-8?B?R3AvM3E3dXFpNERHMTZYbytIY0orNTZYL1p2d05jWUhoV3UwdDYvZWZuQSt1?=
 =?utf-8?B?R0tqNGRpVnV6a0djV1VTS3NHRXRlbW9VNXR2TTRYbVpDZGpnL2ZYWDFXczJN?=
 =?utf-8?B?aG9pWDVSZ0FxTzdyRkZpS2phK2VFOHp3Y1p6eVlhYUVCL2pGb3pzWkJ3MFlV?=
 =?utf-8?B?MHR3L2NhU1lDWUkwSzhieUlxL2s3TzAxUWswWStWUnpWbTlpTnpxZXo5OG1h?=
 =?utf-8?B?blM4UDUvQkVWMHIxMU1wOUdHVmN1K0lwSldKODhMQ3U1YkZLekF6czN0MDJq?=
 =?utf-8?B?NnNWQWNLR29WTHNFbFlyV2JGM1FCUngzZEROVnYvYWdiN2VCZnNHelI5U2hm?=
 =?utf-8?B?c0txL3ZaOGpVNm90cWtEdFAvRXRMYUtKRlRXL0xFbEpEN1VGaXRVTU5XaFFn?=
 =?utf-8?B?dm95RkhSOWNTY2hzRlZZWjNlQ0NaTzNRV2I1ckFydDBYMTJ5czdWODZIYi8v?=
 =?utf-8?B?RksxYXp4cDBjQkZnOTAxc3Z2WmJEWnFaZklVeTYzSVYrWHhhdXRZUEFOcmIv?=
 =?utf-8?B?OGNvMWt0WEwzQUdsU3N4NDBXZnF2U3hMODRsTFFRVWRoT2IweERJUC9DNkFO?=
 =?utf-8?B?YTJVOUw1bi82NkplTm5pclM0b05GMEF6MC9nRDk4dmJpOFpFVTRvQ0cyeGh4?=
 =?utf-8?B?eTBvWmpDYnk2elBJVWlxR2wvZU9iazhKZFZkODRWK0kydVA2cEF1UUIyaWFO?=
 =?utf-8?B?RGdRZ2hxdkhCcjl2a1M5RG1ud1F2VDArdlRNb3l5WGU4Zm1UaTJaa2dYeUg4?=
 =?utf-8?B?M1lXMHEzVzN3MHNhbS9wRzZZZEdhTS9oZ0RMam1RNllOTEVBM3RvMHNidHBv?=
 =?utf-8?B?NU1mczV0RDh6ajEvbzJtR3lBSUViaGxzZnpPaFI4eU5QOFpnUWdNeDJvNkgv?=
 =?utf-8?B?SS90V2NtSy9WQWhrWG5CQlZKN0I1ZE5LcEEvYi90eFRVSWU5N1NCSDlSY2hY?=
 =?utf-8?B?aDVsOGU1dUt5V0pNNS9qM3A1WHdqWmVuWkhEYzFZQ0VZckU2R09QZXlaRWJO?=
 =?utf-8?B?K0xmWW9hVmx4c2hNU0Mza0VaZmNtSDVxeDN2anhTR0NWdG5Ba1FsZkowUHlU?=
 =?utf-8?B?SDNEdVg3TVJyUXQ4cmR1SGtDcHlxVG9EaEJrRGljdEZPY1JhUzREVkIzYTdt?=
 =?utf-8?B?UHlnOHBrekJvTnIwZklSZ2U5cmZQQlZwM1FObEZLbW5WUmRlQU5kdmZIdC8r?=
 =?utf-8?B?VU4vMUNVY3dESEN6cThFcmpkMGk0Nk9KTUZCRnhFb2tsR2wrSUNDYUVtbDl0?=
 =?utf-8?B?VEJta043bzFidXFHRWNkdjdway82Y1NFMGNJekc0bk1YY25aQ1cra21EcE96?=
 =?utf-8?B?aDR2SmxxQW9KWjFNaG9hbStyNm5ZNm1OZHFUTzJ0TW5vVUF4R1VzWEgvMFpQ?=
 =?utf-8?B?ZE5ybGdES1U0Ym1iM05WbUhqYTlUYmlIM3NuRzdMQkU5MnI4T2NjVUlGUGJD?=
 =?utf-8?B?TGhuRVRsZEtKbkhzRm92Vk1nNHJ1U01tUFV5Wm5uekN5N2ZoeHplQm5seFla?=
 =?utf-8?B?dkZkZ2xaSFZvaEQxcE5Ib1Rrc2s5cEZqWGR5clRVZEFHcUVHajQ3YVRIN1E5?=
 =?utf-8?B?dUFEMmpydzEwT1kvSWpsaDJSaVBXMC93M09USy9seFh6bkwrWTdSSUJia21I?=
 =?utf-8?B?WW9hY1JYL0owVzI4c1RoRWtsd0ZKNTdwTG14bHk2WTlXTHkrQU95ZFB2Qnp5?=
 =?utf-8?B?SGhDZDN2K1hRZEJ1VjdJYVZnb3hlakhDMmdzc0l2RmJ0MW05WWNUYjRQZExH?=
 =?utf-8?B?NGc5aXlUUkkzMUJPUU1JOGxjdFUrQ2JiK3F4dFR4dFl5em90amxxSGVJU2RQ?=
 =?utf-8?B?RnBiSkdiS3lGMnhRV1hseXVZZFBtMVVMMk9IeHc2M2lkaTBHNVhMZzdYU2FF?=
 =?utf-8?B?UkQ1cTdla2Z2VUptdkxsK0JyVEZUUG0waWdPbmZjdjlsUDFVSXA2b3ZiT0ZJ?=
 =?utf-8?B?azFvVVpNQUc5NnNqR1hwR1U3ck80T3lHTDNvd3VuSVUvMFBPbE9DS3V1Ymxk?=
 =?utf-8?B?aE1mM2JqK3E5RmhiK2ZTYTBFMzNTelg3UVorTEpDSzdLaHlNL3VTOXpvc2FV?=
 =?utf-8?B?UUN1K0p6ZFdFSTAxb3VYN3AyUWlvajRpQkQ0dVZUMWhoZm5kSkZTNllJN3pK?=
 =?utf-8?B?TjlHOHBvWmZ3cDRvOUo1UkVuSm1ESzZhU3AyaGdrWmI1NUkvajkzRk5jTWNH?=
 =?utf-8?B?bXlOaTYwRGRMT2s5UzEwQUlHUDRjaGRXU1ozYi9HVGptZ3BITEpnZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e6dd3fbf-9918-4575-3c40-08de52b260d6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:45:21.7015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83AHgywVyYUsX3vusR09DK+udfOKGH5uK2dGQ5ZyXzvE+vBk7f8lPYUuPiVb4/vIx39Pbd9q2nNgsByE+P5uTXzzd49To/TGPAYuq1mR/8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11219
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:45:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8523

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

