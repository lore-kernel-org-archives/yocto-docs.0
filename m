Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3A1D2D11D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:46:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60677.1768315566498311803
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XcvWhbE9;
 spf=pass (domain: cherry.de, ip: 52.101.70.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7n+YWoAfclvefoLpgeZl8TvX6KR6mRKbgXpzUjzWgK4Vz4C89/G9rKw3v7aIy+5eWxguBBJbb2Yv05Sqa/IeXNvGgtWz+JbanJ14uF7l9RZXNNy+u6OcUS80YCqtfm4lA/RS2EKZPIlp/JHuTURAXIzfOmrQugN8tsTAkl0zBlBXbGkJBRIdPHOaOaJIOTb2IC4GXRadD4O21Hnn8yCZ3Vd11OAVfVcB/295g2pr2dOBDOo/7RtYHdc3AYBEJZUImVeNCHMVKOMxcghWtKCWskMV7cbMRRslPVFVQYj9YpoMtNTKiRpWAga4Nwx6puPiTuUaLOI31UFxoqugRbZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=MgPN6OH+cIDYUSsy4zdlNxdX9QM2XzfQt30rBqUDzsQBo5cmq9gkohmkRTjxcZdURdKR2qhwQOGkw7MXr/r+l9kpp/wLXljrsJXjLSIScSu+ECp+BOGOeCfAkm8F85snk75Pt7GHSWIlEFuWzNdbAbErQIspyicGj5fD9idHp3M45ukrYlhU5TZHyY0As8rYRuXfddyx1yNPQ2VJKa6le/OuYjiUGYRGZxAx1xsQpsq1RYUn6NXjVCaPQRxiyDUrk597jU94HZuGaSt52vMTeI36O6AkYJxJzmak92tvOvlmb89SV/t1whDFo0S95wkwZk9OgFS6S7zGLm29+SLNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=XcvWhbE98NZKkIcHhdnNmsKnHhCl9MAhYKmItB0+0/ADZmgMpC8iPTtmKNsUDgyMMMuk9FIDe2cBx3uaDPYxNCbuAdC9LHMLPP20XPkuFHbYualkk5lY7foDColxxEwMzf8HOc/7xFMTrmTXAxoFIKJgajGYZGNaJbxQ4NffpGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7818.eurprd04.prod.outlook.com (2603:10a6:10:1f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 14:46:02 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:46:02 +0000
Message-ID: <0f44ce1b-2111-4203-9e0f-87b789076488@cherry.de>
Date: Tue, 13 Jan 2026 15:46:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 35/53] dev-manual/build-quality.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-35-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-35-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0286.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3bd9dc-3fd0-40fb-28f0-08de52b27962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VFZHTmRwTzNwZVZ1alRFMGZHWnRYVFZNblJydkhya0daeVVjQUdQZ3hsVEdK?=
 =?utf-8?B?VjhtNTNjRUh1NzVucDlodjVDamtQS0IzOGhjODZua1UzZWJ1K2lzZVdhdDRE?=
 =?utf-8?B?NHlBZktDNXpJemxXdmZCMSs1TlBVZFhQR25TK3hCYitCYklNZ0RSek15cFE4?=
 =?utf-8?B?eUJ0ZWlEUTZ0aWhsK0p5UGZJaGxTSWV6aUJIK3ltNHFla21FSEl1ek05U0w4?=
 =?utf-8?B?NWFnN1U3NUxRQ3VlK0ZEaTNRTE9VbDZ2elZMelJBeTJYcEY4OTJMNUpvbit5?=
 =?utf-8?B?bU5HK2FoTGxibkUvTWN2eG9VNFVHYVRUb1R0QS9VUTBmYjdHSWdJMXByTzhK?=
 =?utf-8?B?N3d1djR2MEdaOEhLNFRKMXpqNEJoRHhrc0p3Q3V2VHdFMVRHNlg2YUE2Nit5?=
 =?utf-8?B?OHNBQ3BkbXhuTFphRHlZeUU4YWVsa216Sk5IZ3JHdjJMZFQrajZod1oyUWF3?=
 =?utf-8?B?R0lHUm44bm9PVFdIL2NUNjNKVkVHWm13UUhDYURpbG5lZlBsaDBqaVRCVmdt?=
 =?utf-8?B?M3U4dEZ0Skt1RGVRMGFYVVl4QnVOdUZwVHcyNWtpRFh3N3RTL2M5STkwWjlw?=
 =?utf-8?B?WmQzQm1mL0o4b3BHMXJETWdPWTdIZzJDOXBiWVdGQU1aWC84RkpORnF4am1V?=
 =?utf-8?B?U3pXU1djbTIvUGZ3WVZCcmVFRGIyeW5LUVFXejVNMlY1MVdoV0pSVzUyZGRs?=
 =?utf-8?B?azJlT3IyWE9FQ1VKYXZsTVRKNTN0WEZWSVNwbkIxWExhbmd6WXJrMUVqWXor?=
 =?utf-8?B?SUJ0M1JPbitTcWErNExLSGx2QlJtbUVVRGNOdHRaYS9wK005TWR0aWw4dTln?=
 =?utf-8?B?SHlOckZWMlE3ZWMvU0o1WWxrOFVTTmcrYjJNNk40M1ZoNjZoSm83cS9sTjYy?=
 =?utf-8?B?U2dmMlJxcEt1RjYyZVJJWnBHaTRrZUwwSTZmNWtEbmNJaVZRaTdoWXppeTNk?=
 =?utf-8?B?U2pmcVA5ZFZJMGtoMHAzRWxlVW5Ob0x4REp0SVdkN0NJQnRNQlM3STh5dFVB?=
 =?utf-8?B?MndDYkxXUHVWNDVWbkUyV1hyVjVTbW1iR0wvRE9BWTdtWnBiUjRrejM0VVJK?=
 =?utf-8?B?UmpESDVIUjVMaW5lbFZaQVU0Tm1ZZllZdmFFWnZQMEYvSkRUZXdJSlBvZmVh?=
 =?utf-8?B?VzRsZ1BmeUM1dzh5dWc2M1VzMXdDTjZCOFpXUmM4TnRrSFo5d3doR1BGOFVP?=
 =?utf-8?B?VjZRajVZWVp6djdiTFozUjRXQWVGZUF2TEJCZW44Vm9RRXJlK2sxQURzQ1NO?=
 =?utf-8?B?UGNjOHFHbmNuQmwvbytqQzlaQnZDYWQrbGFLdysvb1FDOGQ0d2FCblBwQ1o1?=
 =?utf-8?B?RlhvdDc3VVZjRDN6MVZoWENOaVY0SlliQlpuczRPMGpKdFliT1BGWGJSSWJ5?=
 =?utf-8?B?VnIvTjN2bnRmNE82NktVTHBTdEdNTmRKWWRWNTdqbEhmeG5oa0JSaVpFaTdZ?=
 =?utf-8?B?c1dDMlpFaDM4WTRUUHRjaEFIa05wZVoyWE1rOTR0TU42SXk3SzRtOUovOUdH?=
 =?utf-8?B?TG9wcU85bUcxRlQ2aGJjaWIvSGVUbVZGcmxpTkd6VkhhUm0rMlhZeVdGUE5y?=
 =?utf-8?B?Vlp1d09TZlNlOTF4enZyZUFmeFVFL0VESkNGc1M3Q1BlOVhsU1NPNHJaNE9s?=
 =?utf-8?B?aTZOeitsNG5yc3A5dGMza2JiTHU1MzRVY1JGdHdzQnVzNDNXbkJsMVBBcEVM?=
 =?utf-8?B?VjlVeGhrYmNnWnpsSG5WbWcvSkRGVDFYRTA1Vjc1QVA2aFl1VzVrYitWdW9P?=
 =?utf-8?B?dFpzbzRXVFIyV2lVaExmL3U0S3dtdGo4T2VHZHdJLzZRaS8yZEVPaHJYSUlp?=
 =?utf-8?B?bXoxNjVRamZYOEpDK1JaZk1kZ2ZDV2F4WmVyWTJ5MkViNkxsbHB1VEFzVG96?=
 =?utf-8?B?VC9vV2hJbjIwYVJmQ2tYYzJtU2h3c0l5WWtIbjcybCtCemNFSDRPaFFQSjR5?=
 =?utf-8?Q?5obAdydWp2Ind96s0Ric/iUxTlm6h3uQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dmREa3dTY041VlY1cHhTVVVORlA2UnhQZW1hUGxwVlljd3JzZmU2VUZJZ293?=
 =?utf-8?B?dVVzclJlSzgzV3AzNDJYTkpubVdxMmJBSVBqZERJRWJUMWNMMUdkTHJLMkZq?=
 =?utf-8?B?eXRhSVZpK0wyYm9jUjI4SE9WZGw4QlBxRkFXRkpoNzAxbDBpalBVMnVSWmxH?=
 =?utf-8?B?dW91TVZXeXhFTWRLRHdKbjQ0TENqVWwxWHVCbEZGTkhGcXprZHVXaXR2Z2hs?=
 =?utf-8?B?VVpvY2xuSTdLTUQyWVZsV2E1NndJR2lwZ1IrS0tLaWJhbXR2Z0NUdiszTk4w?=
 =?utf-8?B?eUVGWDhUelBROTU0ZWM0TmYxNU83eTIzOTdtNU03dXJ6eng4WENSbllEQks0?=
 =?utf-8?B?WDhzbi94b0lSenlxNHZOcVMyTlR3TU9jV3orZHVmYVRYZm9ZaVNEV0VXVXFR?=
 =?utf-8?B?WEM5eVR2L3VoTHM4RkV5QmlieEtSanMxUStNSVMyZEVUQjZLQU1tMkRCb2pO?=
 =?utf-8?B?MEtObStvTHY1YjZob1NPNUtRNDdYR1F2NFo3STI4RkxHUU02cTJrdXhPa0Vo?=
 =?utf-8?B?cjhnWjB6UWpaMUVsQUZCeEZydTB0OVk5OGZVQUo4RUlnNkt3OG9kNk9yNVdi?=
 =?utf-8?B?eDBIU2lDYS9paHNtdGFKUkVZTE1LcWE5d1N1dDhrQXFxSFpxOVpjT255cDhq?=
 =?utf-8?B?bEFxSzRzNkI1MGxtTUF4Qk4yUEdubFNGTWh1cEtXUlNBMWVmQmR5ZDk5T0k5?=
 =?utf-8?B?Wms2NHNzSFdQSHV3aTJrY3Jtb3BXazV6QjUwcW0xaUx6cGFBZUJNUGdteEpM?=
 =?utf-8?B?NmdMZ0MxVUtUUk9lcmJlQTcyak1ENVhwWWhIU0syTzZheWtkc004aUkwd0ZX?=
 =?utf-8?B?V2VzV0FNbkhKTmk3NGJ0MFdMVVJLMmNlMis0eDZrOVhWYTFMTmhFZzYxelUy?=
 =?utf-8?B?WkhRcUxmMUlsNnNtdXJidTJBZjQvaFdEalpqS2R5cVNmTXV1MGJQMjJ4ZDI5?=
 =?utf-8?B?YzBIOFhZRzU2YWxlM3d4MENHR09sK200b2tTNXV3cG1VSlBuVlhTczUxYzRJ?=
 =?utf-8?B?WUJvYmtnT1p2ZlBzYXcvVmpLbG5ST1Q5VTRyU1Rxa1I5REJ2K0w3UXhGQTV4?=
 =?utf-8?B?Zk1WNnFtS2dTTSs3enBwRU1Da0R2V1lsUTAyakgzdk5FQ1I1U2hKNFp6UGV5?=
 =?utf-8?B?VkF6VHBwTlFKMTd1dEFTWlpyb1pFS0dTblZPaHE0dm5RVEdPanhua3hDTjFv?=
 =?utf-8?B?OXFKaDFWdFhCUEJKajBQU0dyU29KbmV6OHlHNFlEanQ3ejFDV29tLzc2S0w2?=
 =?utf-8?B?SHZ4ZU9FQzZIUzlaNUs2a2ZySVltbGVZQ2hQMXR5RDdOK2JvZkdhZ2UrSGZM?=
 =?utf-8?B?VWcybVdqYi9sTHlFRjBveU1SdE5iVlY2KzVjY1FHSzVaOGhiQmI4Qmh1bEg1?=
 =?utf-8?B?ZTFMdEFZT1l3bmhXNGVKNi9uWDZ1akQ0M25HNjdQemVwc0ZaWHRLRTlielhJ?=
 =?utf-8?B?SnFTRjBPUFhDMnd5dW9qTmhKTlJ3S0Ixa1VtM2NjNEdoeGwwbE1hR2psNVBr?=
 =?utf-8?B?K0tRNHAvd3Q2eXBvSHZCQkRydVkzTlNMSUU0K1NPOU9mUUcwOFhMYjIzMHVh?=
 =?utf-8?B?RE8xTGNpS25EWXF2a3VaUWJibDJmcjB0UWNQUGNZeWVJenVHNXZJVXA3MWNL?=
 =?utf-8?B?bDJ2cDUwZnFMV2FSa3hXejloNVdjSVRvYjl6M1pKcUNzWFVuSHM4OXBZUTcx?=
 =?utf-8?B?bHF4bUQzQ09jRzFkWHRZVkZHSlBsK0p0emhJUXlJRzJCY3crRURDSEppOHJM?=
 =?utf-8?B?eU9kZFNJZ0J6d2JITEs2ODVCTTg1MVRsbGxLSUU3WUZib0REWTlzVjZnUWF6?=
 =?utf-8?B?eW8xdURIcU44UlBmODhqNzNlWWIvUE1pTXdRVzJ6bkg1MXpCajJRSExqRDd4?=
 =?utf-8?B?SnZWd1o4NkhLQWNQNk4xbXZ4Qjd3TWowdlNwaEgxRW5hL05USEc2SDFGYUwy?=
 =?utf-8?B?cG00Y0p0aW9jcU9NTmNlc2hWOEFJSEdmV1dxNzNNcEZYR040dXg0cXhBbC8w?=
 =?utf-8?B?ckJNeHJtaUNick94K21yUU1xSXV1R1BLaE5mR0lCQ1d3bis0QUpMM2VxSDZz?=
 =?utf-8?B?RzFEQko2OWFVZEZxSDZIUzBFRU9uSUJacUxWSnp6MTFpbzJ4aWljSTVNcDN4?=
 =?utf-8?B?N3A4dnhrMlpBc2M3cm1kdHNuaVNCM01MdWJPa04reVU2MDRmK0h1YzBsQytT?=
 =?utf-8?B?V1FQMWdFaUJxYk0yWlBmbnpiays0b1ZUbG4venNtRmkrTDh3TEVORERVL0hi?=
 =?utf-8?B?cWd6eTdoSEdnVXdHVFEyeENpOFRpRVhvL2E4d2ZYbU8wN0o5bjRaTWQ1SW5n?=
 =?utf-8?B?ZzVxdklKTkJZVHhreHMyejhZTlEwRnduZC9xaHhmYWFLRmVPLzJGZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3bd9dc-3fd0-40fb-28f0-08de52b27962
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:46:02.8954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCaQvWjz/9lL3FEm7MC5IfE9+DWXTTpAOiG5rkymGu4hphTxGcr57e9cBCRltWoQrOU9o8YkZrE8R6GJA1wajDOdinRhtaZf2EIAB1VN1bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7818
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:46:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8524

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

