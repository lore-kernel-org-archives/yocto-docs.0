Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888EAC3601A
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 17:37:44 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.19])
 by mx.groups.io with SMTP id smtpd.web11.1623.1743701861523465467
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 10:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=MOC9ZUn8;
 spf=pass (domain: cherry.de, ip: 52.101.71.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymLw+AseKjbsGWKe+Cc4ewrxrhdThyqtioU5Mw09nRJKUS8GKe1DYeIHQ5KlJ8nYLdWZ/cTZ/A7EtwDvRZNL2NZnjhBY1EtTClU6yLftozO8KfmqdaUTRUcIwUhJxnSwRiPy2ATwmxH74OpfJW0Bk5ohZYc/irRijbBOC+QPLuOK+PBfkds7WL7AhlQvkwufEr4dIhxpKERhojFmGfcrz9CWRbPOIcvdtCZ3KDPmJR9gmNZuNoSDbOiurz4bsEQ773wVbeugyJl6WylfxEwXNKyUpG8t0AQ9hACwKAFLGbzki6EqHf8YiDIbRh+xgz/dhh+0EpP36xnDwtnRjvamqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4R8W2D7SZsV2EF3+Wn8lYHgNhyu49EiD4G14aLTVJxQ=;
 b=vOeGBxbhD/2aCvS1PFDMRfgcxNc5miw6y71XeFAPrP/5IqOhPtr2Hcna0R9tfv5wRcSNDy0mGFADHcsiBfHCHuRbchwpWf2BXdO/BXV9aW3cwJ6N9K66dq0u0KJPxW99SsoDpJbuD7mhaoebZcNBvu+0n7JGqQInXleIuNbApJ7LxbeUkXrB9Pg352OKcq9reo1xGk/5OPbXX5Nfl4ZRSAe4hpCW+HIEoK3ucP4SxTo7W1MiZhuA480N7s/vSaMOnV+AKrSihHO/wIIIdgfHDDfSO1tfMhhGkRP7qVrn34eRblrVgA27lNRnAGjpkQrl23AYGhxBQbH2nNEQ2x7pqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R8W2D7SZsV2EF3+Wn8lYHgNhyu49EiD4G14aLTVJxQ=;
 b=MOC9ZUn8hAWGLyzxlUqshZ1D9MRc1caH0TprFL0udPGtZGLyT/tQGY6CtqNnFOWezkcT/aORsQh2c30eC4HE6NIpkJAn/47jOYAfGx8JH8JhTLvDSriD5c+9TfBuhk3Zd0UwYL6InhpsAXij0PQizgnRveanGQxwDtnMCLbTHQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10471.eurprd04.prod.outlook.com (2603:10a6:102:41f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 17:37:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 17:37:37 +0000
Message-ID: <ecd14134-aaa8-4492-93d5-62b24347d816@cherry.de>
Date: Thu, 3 Apr 2025 19:37:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] migration-guides/{migration,release-note}-5.2:
 improvements and fixes
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com>
 <20250403-release-note-5-2-updates-fixes-v1-2-13d16361f17c@bootlin.com>
 <874b31e6-63df-4d13-b967-3014e6ea8ffb@cherry.de>
 <D8X3LOMBN1NV.TBIZ0Z7H4CCQ@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D8X3LOMBN1NV.TBIZ0Z7H4CCQ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10471:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e51923-038d-40b4-e9d8-08dd72d639a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N0JPUXlSZ0gyeW12WGVvbnNGN1AyZXp0dzJjOW91UXVuNlZ0ckVUME81MGgv?=
 =?utf-8?B?SXE1Rmd0aURYdHRlQk1Vc3MxTDgxaDhMbEEzZTQxTTc2WTc2RXg2OHV1emRr?=
 =?utf-8?B?TVJjelVMcnFqYU9aeUpsVnd2UkFlS1pIWHNQZkM5V0RVMUV4cTVIenRyVGdC?=
 =?utf-8?B?VjBhZXEreVFiT1BSUCtRdnVhWDlSMURwbFViWDVoTEg1SW5zeUFGRGViWGVr?=
 =?utf-8?B?cDFmRVFPdittZHZ6L0dzWDhJRjFlVGN2M1BMS0VIRTluMFBzSzNuUFVmS2Z0?=
 =?utf-8?B?cjEvMVFIcldXa09hTnJ1SWNVSGQzMWJjcjNFQjZKOUhNaGZpRkJ3Y1REdFYy?=
 =?utf-8?B?NFU2d1lFRDVhVUhZMlJ6Ymd1cUlONzJlbHBPcmR2VFpMeEtRdkp2a2ZYOWlY?=
 =?utf-8?B?NzRxQ1pCRTYrR2h1UHNzdmxhMVNCbElnYUN5Q2JOZVhaVjQva28zeVFjZDQz?=
 =?utf-8?B?ODFSbFhKeG12dXlRSDJWOVdseEtLcmFpL2dqMmlucThhSG9KUEpDVjY1VWNx?=
 =?utf-8?B?UnRlWjdGS3YzeGlsbkl1R3JteFJRT1JYc2VDVWNEWXhYdlpWaUduL0ZIbXJH?=
 =?utf-8?B?L1ZiSnEzMGVQQytKaGdLSUZOTllNRGNYRG9NNlRRamU2eTEvNXFYN2o5dGVZ?=
 =?utf-8?B?OXh2K1NHMjJlbWlHUmRNcHVCbzh1QmhkV2J6UXNwc3Zhd2MrK1FsYzVlc0tU?=
 =?utf-8?B?THhNU0s2ZEx0YTdOdCsxc0dWcmlIRHFGRlZTNC9TNUE0b05mZEgvbkpWdHF1?=
 =?utf-8?B?ZGVQa1UrWUdkTnhNRTdjUmJFcFlXdnBwdjVTaFlnaHp2UEtES2NTZWRCVFN5?=
 =?utf-8?B?a2ZkdHpIK1hUUDEyNHJQMlFPN1R6SVVmc0wvMHcwY2pZZlVxRkMvTGZoUU5u?=
 =?utf-8?B?djIxQUlSempMbERzdUxFSjFOQkdNR2prWnpFREFZWXBBQkhBT3l5ejBIMkYw?=
 =?utf-8?B?TFVXcHp6WW9BbW9mc25qRkNCdUJ5U1lDNmhhK0lvUGNodFVYQW5CY0s5SVlz?=
 =?utf-8?B?MzhsVHRwMzFkK2QrMUNGQ3YzbENWbTNCcncvQUZHU1hPeHloQ2NsQjNtU0Jl?=
 =?utf-8?B?eHNTdC9DRkRiSEtLNW9FYW9NU1BUdmZKT0xvRE1QcUlxYS9DTmlBa0pBd016?=
 =?utf-8?B?RE5aRjJqa2t4b2tPMElhbUYyaHlmNTZYMW5GY2ptdmZwekN6YytGOHpKa0Zm?=
 =?utf-8?B?VzFHNVAvZ284TzVmNUNrSHh3bDRUaHNBeTZvRlJBcG9JS2ZwWCt1djd0amVS?=
 =?utf-8?B?b3hwYy9OaFhLcDlkN2pTcGpWUEJpenhXU29Dc3JLL1hoWm9leVBhOFZLQTBh?=
 =?utf-8?B?N0ZiSmNySXhPRHRsZ3BaZ096UWFGSDRnUEgvWjdqZ0xvQ00yek5wKy81SmxZ?=
 =?utf-8?B?NTVldU9oVmdTUHVhcE96R1FmREMrZ2Y4RVJiWDNVMUEwdWEyaWxRR0JsZE4w?=
 =?utf-8?B?TitvVWgreGRwUmNCQis0RnBTV3h4YTFwTDFIOTdQa0lBNVV6d3NOcTZCbXMx?=
 =?utf-8?B?bWpmVFhNT3Y5enNFeWkwQ0JLUkMyaHpSS3dwdG03cGtsR292aDY1c2RhNEFG?=
 =?utf-8?B?ZnRhM2JyWU4xdHF3SzZUSnI3ZnQwYUtud2dtUm8yMmxaVE5LSEp1K3pRRVZ1?=
 =?utf-8?B?SFIySEdZa1l6UlM3aUxYRnpZc0JvOEYweHkwenJlekpxZ1piK1I4OGIrMGw3?=
 =?utf-8?B?Z2tWcTR1VG95UDRPNVBEUjViamVJV2lpU052ancvUUk0UGprbjR1VDFtQVhE?=
 =?utf-8?B?VklveWR6VExob1ZFNmMyc3ZDNDV6a3hkellCK1RvaE9Zd0VNRXlNcGtJV1FM?=
 =?utf-8?B?dXBZS3NzNm9Wb0ZkM3RyUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlRhWnVCWlR1UzZtRlJQU2lialVjakU5bDBpOUlLTEhZc3lzTytDem1FV3pI?=
 =?utf-8?B?TVVWd0wzUnovblpQL0J3VDF5UWhXZkFodnRTcWdnOHlmYXk0bEVydlZmRm1q?=
 =?utf-8?B?M0JxRllubW51eFhsZ2lMRU9meG5CTDF0d2N6ZWpOR3BEN3NXaElQWXNzaENi?=
 =?utf-8?B?d1hNMjYvRzRtVWJFNnZGTVh3dmNLOUJMQ1NjSU1ZUGdaVWtVOVBxZGRReit6?=
 =?utf-8?B?ZlB3TG92VGFvY2llWlFOaFQ4NEVmT1U4cGtQajBWOWFkSEc3MlVxNS90YUpu?=
 =?utf-8?B?R1IzcTE0Z2pxb1BiZVFSYkFLbjRnUkJDa2FtMEZLQmo0S1VWK0FWMFlQcjdl?=
 =?utf-8?B?UXprM3hYb0xoQ0tYVkZxeThOSytlNEtiWEpGb3ZYN1dZRmJOc0JuYXZzeWU2?=
 =?utf-8?B?RkM3Y2p0UkJRR29iUm5teU1GZlpsdFZzdHR5dFJkbndSaHNNMzk5SEU1V21B?=
 =?utf-8?B?dkdDTWJtUGlxNHFLN0grQ0VsWFRxcVZFaXRtUUhwdmJjZDRvcU5EUTBaNloy?=
 =?utf-8?B?eVpNZjBrYmgvc0pOekNxQWh0WndSbzJEWXI0cUhnajhnOEhXTVVyQzA4b2Iv?=
 =?utf-8?B?UGVKRiszNGJWUkZMWHFhS2JWNlNuS29WMG4yYTl3VUl0ODJLRGZiME5rL2c5?=
 =?utf-8?B?U212aVBCdWdzdkc4Um5KNGoyWlpYSFVsQnZXWjhDcWJkVlQvQkpSTkRWYUh3?=
 =?utf-8?B?aUVMZ3d4VmNyZHh6VytGSGJKaGhOTmFFelZ0TG9CZUZOUGJCNjdqTGRNdXJM?=
 =?utf-8?B?bitmMnJVWnIwZzYvNlpDK1BFUUJqdUFWZWQrdFZwZjZaNHlvRDkvNlJISVJ0?=
 =?utf-8?B?T2cvNHhGTi94SUJIblJsWVdBbWNSVEswcjNVN1FSMU9nTERlTHdHMFQvd21D?=
 =?utf-8?B?WndtMXZXQ20yM053ZlNIeWlwd1pmSXR4VEViMEZQbjlYTjhST3BZQ2hTSE5k?=
 =?utf-8?B?OWtLMjNrNDVuUllTQXNOaHZHdnBZNFFiZjlqTzFVR0RYUVpCNUdkVEhBdG5F?=
 =?utf-8?B?amRYU05jbWdUNEZDRFo3aXZVektCaENHT25tTE5QaStNNVd0TDh1L3FsT3V5?=
 =?utf-8?B?K1hoUVhEYnM5QWhIQzhENXAyT3M0cUk5cGhWSXAvdmJmRVZ5OTBOblp1V1Rp?=
 =?utf-8?B?cHViTDM5b3o0TnBKaFRteGo1aVk4MnVWa3oxMnZIY2I1SCtNZ0NQTnRIUEpE?=
 =?utf-8?B?MkQ4Z2JJb2hTV2YycGtxcU9JSTZmemxnVGQ0WStiUkEwMllVa2pzem5reFB0?=
 =?utf-8?B?cnF1a3dDN2ZTZnZHbkN6WkJ5UGlyVHNiZDFNeFlReUJYSGt0UytTeFFsMXQr?=
 =?utf-8?B?ZE9mRGtQZ2srcXlURUZuWGdMVnBkT1Zzc2VUWTl6cUJaZStFemtobWVramVx?=
 =?utf-8?B?c25KMDFQM3ZlQnRQa0hsVGNjckdFWHZGcThCaWpPZFNvV1dRZjNkR0pJNFFC?=
 =?utf-8?B?bEJ1Y0JxZ0R1dW0xc1ZzYnAwTERJc3dMZEcyTDRRZ1pCN3diSmZiQzkvMVBn?=
 =?utf-8?B?RHd0bXNFd3h6VDFZRjZxeWY5L3BtdElhYVVPSWx5Qml1LzV6eTZtaHdpWFU5?=
 =?utf-8?B?c1RlNHpDdXdjR3diZkhuc1g5SHUyeUFMY2phTXlNRW9Id2s3ZTM3bzVncmNY?=
 =?utf-8?B?NTkzSFlmVUNRSUozSVFkL2ptUVpWZStZTkJ5SThZdituamZYNEtXSytyOWlu?=
 =?utf-8?B?OS9tU25oZFcxYVFCZ2VOWWZZWDVMUWlXMyszYlh4and6Z2lXOTNFYm9qaWhh?=
 =?utf-8?B?d2Vha0ZnTGVrczdMWTIzVWNQY1ZRUURvRUxqd2hSVFovUFRHUnJDQVQyK0Jr?=
 =?utf-8?B?ZnNFUksveFg0SlNEN2lkYllnM1ZUams4ZjJzYlMvSVdjYW0yNkJCb1FYUTBl?=
 =?utf-8?B?bXRCVGVJUnlBV2ZOQlRmdEFUTEw1a1Mxdkdja2lLM3lXZjdCeTZranlSTnVK?=
 =?utf-8?B?Q0J2bHhhMElyT3NBNmFVVm00QlBtcjk2ZjFjaWdCOWRBUG1BbkFYU0FLdmpx?=
 =?utf-8?B?NkVsZktoaHRsMTNBSlI4NVloSVQ5cWY3NU9qZUNvb1NGelBkaTRQM3FhelBM?=
 =?utf-8?B?N240WWJDUEJUU1dXbWpvaE9ubFdIakVKemxpMG90S2ViTlJsSXRDdnk0MkEv?=
 =?utf-8?B?akdFZkJ6Vm1IaUg1cmRtaE84eTZLZXNxNmc4Q0txVGdpMjQ3ZUV3NDBwbEE2?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e51923-038d-40b4-e9d8-08dd72d639a9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:37:37.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5eFEShFMGh+NIUUTIm44mTcWVHdxsKUmgqUUWguoELSXSKP/l3d9Jdmo0uzFFVhXlk28i1ij38IfqJh21V3oYGEBzbTRBhs9pAtInBhSIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10471
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 17:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6711

Hi Antonin,

On 4/3/25 5:10 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Thu Apr 3, 2025 at 4:23 PM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 4/3/25 4:08 PM, Antonin Godard wrote:
>>> Address some of the reviews received on the release notes and migration
>>> guide for 5.2:
>>>
>>> - Remove the wget fetcher addition, I misread commit 0a9f90ff658e
>>>     ("tests/fetch: support setting PV in the wget fetcher") from BitBake,
>>>     and it actually affects the tests for the wget fetcher, not the
>>>     fetcher itself.
>>> - Add a way to transition from the branch=nameX,nameY syntax. From what
>>>     I have tested, I achieve the same behavior when using one or the other
>>>     syntax.
>>> - Remove the default value for SPDX_PACKAGE_VERSION in the release note.
>>> - Fix a couple of typos.
>>>
>>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/migration-guides/migration-5.2.rst     | 10 +++++++++-
>>>    documentation/migration-guides/release-notes-5.2.rst |  7 ++-----
>>>    2 files changed, 11 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
>>> index c54f054c7..59f21ff4c 100644
>>> --- a/documentation/migration-guides/migration-5.2.rst
>>> +++ b/documentation/migration-guides/migration-5.2.rst
>>> @@ -193,6 +193,14 @@ anymore::
>>>    This was rarely used in the core repositories, and this removal simplifies the
>>>    code logic in several places.
>>>    
>>> +If one of your recipes is still using this mechanism, you can split the
>>> +code source fetching into two separate entries::
>>> +
>>> +   SRC_URI = "git://some.host/somepath;branch=branchX;name=nameX \
>>> +              git://some.host/somepath;branch=branchY;name=nameY"
>>> +   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
>>> +   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
>>> +

Just to make sure we don't miss this for the v2, but this "solution" was 
rejected by Richard as non-working, see 
https://lore.kernel.org/yocto-docs/9c3af54f0c74af0b9d0887e0408fd591e936c4da.camel@linuxfoundation.org/T/#u

Cheers,
Quentin

>>>    Git fetcher: Branch parameter now required in :term:`SRC_URI`
>>>    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>    
>>> @@ -242,7 +250,7 @@ The following recipes have been removed in this release:
>>>       :oe_git:`openembedded-core </openembedded-core>` or :oe_git:`meta-openembedded </meta-openembedded>`.
>>>    
>>>    -  ``blktool``: It was created in 2004 as an alternative to hdparm and never
>>> -   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active.
>>> +   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active).
>>
>> Mmmm, should we say
>>
>> s/remains in active/remains active/ ?
>>
>> Slow brain day so maybe my intuition is wrong today :)
> 
> No, the slowness seems to have been on my side the other day, thanks ;) Will fix.
> 
>>>    
>>>    -  ``cargo-c-native``: converted to a target recipe and renamed to ``cargo-c``.
>>>    
>>> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
>>> index 05fc92e85..2ad441449 100644
>>> --- a/documentation/migration-guides/release-notes-5.2.rst
>>> +++ b/documentation/migration-guides/release-notes-5.2.rst
>>> @@ -44,11 +44,10 @@ New Features / Enhancements in |yocto-ver|
>>>          uses.
>>>    
>>>       -  The :term:`GRUB_MKIMAGE_OPTS` can be used to control the flags to the
>>> -      ``grub-mkimage`` command in the context of the Grub recipe (``grub-efi``).
>>> +      ``grub-mkimage`` command in the context of the GRUB recipe (``grub-efi``).
>>>    
>>>       -  The :term:`SPDX_PACKAGE_VERSION` variable controls the package version as
>>> -      seen in the SPDX 3.0 JSON output (``software_packageVersion``). The default
>>> -      value for this variable is :term:`PV`.
>>> +      seen in the SPDX 3.0 JSON output (``software_packageVersion``).
>>
>> The indentation seems odd here (but to be fair, it is also in the part
>> of the diff that is being removed).
> 
> Hmm, already on the previous patches you noticed this I think, but after
> verifying in the code, the alignment was proper. Actually, I may have already
> seen this in your answers before, I wonder if the problem is on my side or
> yours. Exporting the email in an mbox file does not show any issue as well.
> 

Checked myself in the tree directly, indeed, 3 whitespaces followed by a 
dash, then two whitespaces and then "The". The next line is starting 
after 6 whitespaces so the indentation is proper.

I looked on lore.kernel.org and it seems like your patch was fine, and 
then looking into my answer, it's oddly indented again. Maybe my mail 
client doing something, or my mail server doing weird things again. 
Please ignore then :)

Cheers,
Quentin

