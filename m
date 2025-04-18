Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B283C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 14:05:09 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.43])
 by mx.groups.io with SMTP id smtpd.web10.12375.1744985107598437562
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 07:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=X+S4EX01;
 spf=pass (domain: cherry.de, ip: 40.107.103.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbH4ADLh32n1Q5dXFlYBTyrw2ZgNfFP0fYb/R8VPW9mATzXpob+KXe9Kv7gJwUhyh4zQ88vITC85RteroAFORL+C79Ot5adH4rM/erQ23JgZd7hTh+qrjbab1Q1TToR0OMpADy1nL17xpS1az1/w96QPM42v7z1sQAxaaDHUuFm/gXg2bNCsvsYIMD/Uj9JpcWoi4/AxxpiVYtT7JXnKPDK8TPeqCxL3g63g2oxTqw1jjhXI9gihgu4OZd3yRRPUh1nXwDVssKLCMStYyUKZRtO/9XM09z/UVl2ttBY6vSCJqfWfn93sKTZf3Dsbfsw4WPYbgDI3e+SrvhsBFYdyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHwXf+H3a+L4r+ANh9hWcRUNCcPPJuyUvCMdk6Jn92I=;
 b=M+Q10pOtfiAKpBJMxp30q2ta+jHxVdenVdcBMsLWH7jT0Sw7SzsciGuhap8MdE9OmIzhmpoEsDhIVpMXaEmvoUQlit6L0Tcg9Agw1HCJRIhCNHgn2c9jQBX9Iq6OjI3PgD9hCznyXB6YTCLQpVGm3i2RzqRvrjCgW3/jkQbOh66Kt23VHKXw90CcWMOyR2U/DrRsMOBRrAjVfHOj9Zc45Fx6/SBqImod4G2k763DGp6AupDDDZAjpgt/K3vHDHLsAB8Hl6FUWEOWFtkh1OjoTBfytPntTztIOcoXscbAEmhUHmoMWBX9+ViMncMnRGj3x+wHhZmxDsWmLIA8p5PsWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHwXf+H3a+L4r+ANh9hWcRUNCcPPJuyUvCMdk6Jn92I=;
 b=X+S4EX016rza1A3i3XayI2CiMIWLiJrhTW1rv7N/5Miz1GGfWiOFRcACFEetEpzLeZJEZXbGn5g4OP6DAjM2HRMks/CWUQyHGmnDz3xJ9tyOmzf+Hbjfg4b3wbkAg0dmJcv/fPCRcoIFU4MFXMwspRRy+N3c/wmi4NrhNauiO18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Fri, 18 Apr
 2025 14:05:03 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%6]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 14:05:03 +0000
Message-ID: <0561b134-531f-4d4a-8b5e-04eeed4db0ed@cherry.de>
Date: Fri, 18 Apr 2025 16:05:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/release-process: update releases.svg
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250416-update-release-svg-v1-1-1a57dddf99bd@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250416-update-release-svg-v1-1-1a57dddf99bd@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA1PR04MB11011:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec89aed-cd22-4d9d-147b-08dd7e82040b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aTdYVTRIU2F0SUdEVXAzQURPYlpKSy9maWxuMGdQZ1pibVI1aGpxczE4MUlk?=
 =?utf-8?B?U3ZPMDRuRHlVYWZrRE5sSHNmdi8xdWtPbzRpY1VjSjE2aUgvdkhyQlUwY2Uz?=
 =?utf-8?B?WEs3QkRHa3J6bzMyRFhzN3VwRXdWQU04RCtWOXZoV3A2enN5RFRCSHNOY3Bo?=
 =?utf-8?B?VHJIaVRrL2lPYTYvYWhCdWNRTU1oQmpHNC9yYk1XYWdHbDdrNjFRTFhmeEF3?=
 =?utf-8?B?V2xFcHJjdVZMMFBhdVBEMXJSYUhpcHBZVnZPSUtsdmJ5aUtQWUVaQk45VlEv?=
 =?utf-8?B?a1AzS2RzNnZCVlNPZHRvZVp5cTlCOGwvQ1RRQjluemZybS82cmlDZUcrU1FK?=
 =?utf-8?B?bkRqUlNTK2ZmVDR1bDZKaHJsaCtzdUJJQzFaUGprZ2lsNnhwT3hTS1gyYTY1?=
 =?utf-8?B?MXRPS3dEa1NlamZJSHQrem1FdVNSNkFFdXR0a25JRkp1TXpqNnRObEhhaWxn?=
 =?utf-8?B?bUpHMElaNWFBOFQxd2RjYWlUbExLNVRiM1hNWXZ0VmY2UFVPazVvMW1CZEUv?=
 =?utf-8?B?ZGhSNERYTGRtOWZPcjlOcnlIS0hKeHVZem41RjMya2RrMmNqOE8vdHdQZEJD?=
 =?utf-8?B?azg1TkwxdmxPc2k3c1lmdkpsK3Mxb2hiMnNNMEV5azhiaVVwbDNKdk1MM0pZ?=
 =?utf-8?B?Mmh4dHl6SkJKbFR4MjJVQUZlUExMLys4b2wvN1NtNUtzT3I2N1U4OTlrRzRS?=
 =?utf-8?B?WkQ1T0tMMTFWQW9vRjVjTjVsQ1EyaWx2U3MrWGIxRStLbHFaOTQvdFJLSTBu?=
 =?utf-8?B?NWVEQ3hSUitVVUJPRmovRksvSHY2cDE3K2V6d24rOTJOV3o3OFJYMDdZeGVi?=
 =?utf-8?B?am5jWWxxQWN3cGluMDlFWFJnRzdRRVNwbTNXQVFtSDF4Mm5oNit5NGg2b1pt?=
 =?utf-8?B?cWNvZGlSNmtXSVpPeThMUG9OZ1ZOaEl0Z2pDUG5HVmhNYytKR1FvMDVsVUlp?=
 =?utf-8?B?TThtN2pSeWxWVkNLZWNvZXZhOGdLY1VaRlBwZDNUYkpzZXhJR3NEZGt4bDBX?=
 =?utf-8?B?cmxLTnhKLzl1Q0tEZkpzODZrVFo2R2QvNld6Qmh1NzRrNC9IRkZXY2UrOWJu?=
 =?utf-8?B?M0gvMVUyY3RnY3RrMW1nZVVLQi9OdzBYdzdTU0k5ODFxMEZSTmVVN1crZlhB?=
 =?utf-8?B?M1dNZ0tlN1VML3JDUHNsUGloVjNkVDlrZmM0RGNVZ0pXKzNhWmMyOE83ZHBu?=
 =?utf-8?B?VEVyRmVGUGRIdEVpK1hFN0xWMlkvaXl1Y0I3SURvNnZwdGFaMmRTSHJWcExk?=
 =?utf-8?B?cVJTMHlHeXZRcFpJRy9EclV1b1ZITCtZQjFrSGtwV1ZMWnl2c1hwbmZlRkl1?=
 =?utf-8?B?V1BtLzI5VjV3YVVrZURLSWo3ZkJIamd6YlVYTng0MGFFZjJwNnlQS2crbjRZ?=
 =?utf-8?B?TktSSmpKdEpGOEtJdWhkZ201RVh0UXdCTkhNVUw3c204djdlOHRBOHVOS0FY?=
 =?utf-8?B?TlRQQWMySDM4cUJVWWdnTm5nQ0VHNmlXSUVhanV3RlAyOVdYcnI3bHJmRWFD?=
 =?utf-8?B?SXF5blZ2WHRLY2RjWWdoVEFwQVJSQXArMDBvb21uMG9JOTJ1M2NtQk4zVmpp?=
 =?utf-8?B?Nk5ocFNPNkNVckI2US9haS9Wd3FRNTh4VVBWN0pRQllQUmJaY2cwZkEwMXBs?=
 =?utf-8?B?ZkRUNlZuMG0vOFdqdzBFVUpuSWhscDBLdkJSL1dlUkJ6VjVscVp4TE1ZMkVT?=
 =?utf-8?B?RjJiOEpDZHRZaTBmSTZ1czlaOEJnc3ZzT3JDQ1JxVk44N3R6YUVEK0VCYlVk?=
 =?utf-8?B?QU1Xc3llR3FOaHVMMEpBeGhYSE9xczBob3BOUmsrZnd4bVJpQkRIMW9jRENq?=
 =?utf-8?B?clRsK0RaRkM4bE13Tmg1bzl0MElZVWlRd0RUQ3RrTDhnRXVtL3I0djZVaWtu?=
 =?utf-8?B?M2VVSmhmbzk1YlRDb3VpL2JBSDVvTzBYSlhYVDFuVVhlTTJvUXQxRVpoMUZE?=
 =?utf-8?Q?ilNEs1kVubE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkQwMjdqcG5GZDBld0diSmtMeU1CdTFHTS9iRlNYYWJIdkJaNGluNENYSlll?=
 =?utf-8?B?R2Y3Um1IYW9DM2NTMklKdTN1MHE0d2ludkRvb2ZhUUQ1U3NZUFlqYkYzR3h0?=
 =?utf-8?B?dW43UllLSkFVWkhOa2xjdWtMUmpodVdKT1lSb1k3S1YrejN2KzllTmRaN2Nn?=
 =?utf-8?B?UEthdmd5TlppRkZLT3Z1WERkUUFna21kQzU0UUlFbDh1TXZZNE56UkM1UHdz?=
 =?utf-8?B?djZQU3JTWG9PVkZrYThNOTY5eVR4QjdWVmhBekpwNEEvNkpqUjdmb08xRDVm?=
 =?utf-8?B?Qk9EcE53SjRDNzVEVVA0MXdOYnl5RGt2ZkVYZ1k1eGVydEdpb2pidWM1MHpu?=
 =?utf-8?B?Wk8rb0ZHQjF3L24xVklhUE5WZWxrUDlwZWRaNE4vWkwwV0dNSVdMY0xXcXQy?=
 =?utf-8?B?S3VYYm5vNXN6WTFBM0syRmhnbFNRL3hvRGpvZTh0NDRkOEQ3RFBpRTE3a3lz?=
 =?utf-8?B?WlVtSzhjcHJyMUFwMHlWTzc0YTZKL1ZLSTBURG9xd0loNlhBOFZRZklkR2RW?=
 =?utf-8?B?NDhGUStnUC9xL0ZGdmU4elN4bkdocDNBVFVjT0lpN21ZajhmQ3l2MFBtbFJ2?=
 =?utf-8?B?NkZZQngrd255ZC8wVFN2b0ZyaWFnRFRWTlAvcExKaGM4eUJNb0JMbGlraUM0?=
 =?utf-8?B?amdsc0JDd1lwbXdGY0RrSDNiYWw3cWdOM1A0Z2VUdjJBR05rMWdhVm9sTE9Y?=
 =?utf-8?B?NnNEQmZFOUtUODZtbStqZnpaQ1NqVEJUUEM0NDY3VlQvdEI2ZGJVTll6K0FF?=
 =?utf-8?B?Z0txSjRzTEp0YnVaclBzR1UzZ2VneVQ2dFZmcXJvdExlTUxiSXNIT2RoQmNr?=
 =?utf-8?B?UFdNRTYrREdzaEkyZ1kzWU9EMFo2YnEvZlNZY0lCTmtkQ2pCZCt0d2FLWWxh?=
 =?utf-8?B?ZktFYVZHMW0zdHdrL3pIa3pEczRVbW1SdkJOWThlMlVtaEVtMEpvUHRXQTR1?=
 =?utf-8?B?Q201VDNScEppWCtCQkN6S3RGcTBPN1dNdGhoMFFSamx5d2JpaWJram9ERVA2?=
 =?utf-8?B?bXlMeWJGeWFqOCtEWEZrR2lpWUxLSnFuNitIZU91a2NuT3ltNmd6elZVNEdp?=
 =?utf-8?B?VGRIWmMxdmU2cnZRblpveTdGUGg5UXhVbGNvNjFvRG5nN3pqM1ZMUVUzbUFk?=
 =?utf-8?B?TnVISkpkYjBTSmFwSm5QaktDRlJwNzRYcFJ4cTZQQVFlU2k1MHc2cDc2a01X?=
 =?utf-8?B?R1l3NG5qWlpFV2ZFeHl0bjRYV2JKMDJ5Q2tWNU1OcyszVkN4ZEI5eDlJZEV0?=
 =?utf-8?B?UnN6ZCtTREp2dXBtdisrdHFjS0FGSmZEWDIzQmVZRVgxVS9WYzNEdm9lSzJq?=
 =?utf-8?B?REc2VzdqeFl5dGdMT2lTbDUrTHhZN1Q2ZGUzMUpSa1dUN1RHNEtkMmRWVU9D?=
 =?utf-8?B?R2dQeStJM21tWExmNGk4SEk0d1YxYXZzR2QyK0JBc3p5VGZDSGh2TzhubFp4?=
 =?utf-8?B?YVZLUzg3VXBPS1ExVitjZ0N5TUxDVzdNU25QY2dqdEdWU09HNXJKRmowN3Np?=
 =?utf-8?B?MmdKK01IOWtmZCtLRTBHVjNxL3M0SFpId2dhdWdGYXAxY0J5TTVvY01leXhy?=
 =?utf-8?B?ZDdFenZaWEpWSGFUZTJzU0tkeDBDc25heDhyV3A4MnlqSHk5bnlLS29xYVRF?=
 =?utf-8?B?dUxJMVNqWkcwZkxtdHZkYkZ0djcxUlJYbGd2NU1yYVJnYmxvQndEZW9nRDYx?=
 =?utf-8?B?NFpaRGxRUTg2dmllM1IwYThJV2t6TWU1NWxnL1FuZFJhR0ZBTFF3TDFRRmdD?=
 =?utf-8?B?TWpqRysyRlVuNlhGdEVFeXpCYTZlSDhvRWVrSHVCb0FMcEpHNmJueVd3SmJF?=
 =?utf-8?B?RGxudExCTkFsemV2WDJiZXBISWFJOGxwdzJSS1BqTnA2U2NLbHRDUkN5akhQ?=
 =?utf-8?B?RFM5UERueWp5YTlVUVpRMmJFU1VjbW9DRDYzK0VjekUyT2xLQzBDMVlyZTRO?=
 =?utf-8?B?RGw4cWd1T1FyYjZNOUsvUmljUmZiQVp5Vk4rZzhQM1dRcU45YnNNRHRqTHBY?=
 =?utf-8?B?dWIxRkF6UGwrdk5pdzRWbG9Tb2sva244dE42dTY1V3hQQWM2TEp4SkZ6eUIw?=
 =?utf-8?B?MTRVR3hvRHQ0dWNCMHRnYi9kY0NlYkNUSDlCemN3UWE5OFZxT3k5Z0JKUWNk?=
 =?utf-8?B?VDhHdHRoekttb2RHdWlibDhsTUNNbHRWSjlVWlBnNjlDaGdHdWkydUlQSm5p?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec89aed-cd22-4d9d-147b-08dd7e82040b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 14:05:03.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiGjXUbpe1ikQh4Fft1rfPfQhlMb+ShXGRBf1TBAx8/E+p6OToFNJotnGQKMNQAovSdTTrO+4S8S+PSVJF2aCEPTJB/nRtsDC5nRz1CEjW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11011
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Apr 2025 14:05:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6758

Hi Antonin,

On 4/16/25 10:02 AM, Antonin Godard via lists.yoctoproject.org wrote:
> - Add the future "Whinlatter" (5.3) and "Wrynose" (6.0) releases.
> - Make the "Walnascar" release a current release.
> - Update the month in Current.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

odd choice to make the outdated and future release blocks semi 
transparent, won't be great if we ever support theming the docs page 
(e.g. dark theme). But unrelated to this patch, so fine :)

Cheers,
Quentin

