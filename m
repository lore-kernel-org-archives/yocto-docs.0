Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C63C5DF8C
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:49:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1627.1787338173446729958
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 11:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GFfHSWm3;
 spf=pass (domain: cherry.de, ip: 40.107.130.16, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtVxjfTJrkhOsSgGl0vFqVdEIbGa04gJUCwo/tnolhFlhl6FxLvuFwR4apXpCjLt9NeuWHZzjclYavIOqaFZ12MDqxlwUOhkztX76mRgYPfL4pJDuWP8kof/674AuC5Xy+s5YY8UWRr1j0zCtIsDL3OExCDiE2p1Wlb+vCIxIVAImtvhD+vjaizsnk4qVPBATfz0oA4YHJrRjSGQz783ZulTVdoiDaazm/PjEMT8ESaJFMtiN2L4KZUkOFSYqCYsFoTRYmv25rd58ygTTWaE+NE0DfiysV0rhGWDS/n+Bhv1NJfJq7Tffj4pXXOrEuSogPRrWw26tcAoSLlmOlzOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjbFhN3IVEdFPGw7g9SzOfsRYGjzJWDSiX/QcD6yuI8=;
 b=ZxzQdnrxsHyWJx3IY/EUdiR9X20hEGg3/tBQg6M5/xDdaKz2pV22uvg66wV6u4sCmSPHR9dk5I95agAIk1wHxMvuyjIjKOT2mF2L2NAOdtlCjA7ircxjjJIGb1jHLxmUQWeRW+vgxZNT5ReL2QoUX/iZapSgsiTYqmntFnzzODNhyPUPIlgTP3JSj85x3NMirskNLN2PIG+7lZ8CvpvQiiHt9YJt3rKwtfmzH7V1h+wmTdTTUhSZ5Y9weVwbQNIo3jxPzH1jEJomQKP4hayAjhhCoLVFSnsP+TGUDQBNK5Edpl4WUlNYL58dxp6ce1mF60IXULh0KMeRfm70MunL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjbFhN3IVEdFPGw7g9SzOfsRYGjzJWDSiX/QcD6yuI8=;
 b=GFfHSWm3ADSR8XxeLfJb1geO8+SJyIdgS4cy+mb/n2qJwf49kNwZdUT+05/lECvz2ep5CiyxT0K6NowjWyQMHEebJHp6ahBe5ayoo9LeoSYHMUm+QjqIywqz0plF18M6qo7PRvboyOGTOJAcGq2O+SlQwBxddhkZnvqEZj2r01A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB8062.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 18:49:29 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 18:49:29 +0000
Message-ID: <e51f6266-a770-4275-9d2e-418dbcaf94de@cherry.de>
Date: Fri, 21 Aug 2026 16:37:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/features.rst: fix some cross references
To: daiane.angolini@foundries.io, docs@lists.yoctoproject.org
Cc: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
References: <20260814202800.1106393-1-daiane.angolini@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260814202800.1106393-1-daiane.angolini@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::35) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 751d429b-fcc7-48df-f1b8-08deffb4ee64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	uR4usd/0iG//fgTaFSha08OCK4G9aZ2N5+aqD/eja0JtSYIRGxiJJG6HljW0BHzakeZ84v5qFc3TiAHV1LCjHf+UJCTRTCap9tLduHO9YLjweD74z+rr3Wcg1ySP85jhIZCKYNwTewoIrqF4WDxYOUUZs/aQpaZuV8iJav/r2K5jnOUWP6g6tJXmEVnNew+G//UKACi6CJAntGBL0eVk/P8sV9MtpUo/ZG2AVbYjJ7cqkw48h7j9yeHz6WKbQ+fOHH5rZBgbPb7dB96DWowU230eAIPKj7wuC0tSSAGOR8fJ/aJm1/FBk+U0T6GGrb17WUFjxqhB5dmGeySE2hWZub2CRideIZGYglWweIuJu+ivpcYiTWwIpYFZlNegr/ZecbkXDVQ/PS4MtjFq07N2J0V0p2iIkAccGGHlzHhubYM3Wr/xCv7WRnliijCKpsVLM1MfC1sQw5y3k0tKweUiE4hTKshPFTpGSZZ7V+dP7LA00E66SimFGaGjqoHtd0c3cuOQkHhdRqGBPNbBdmNkLOuXLWozduOiFs0aFG4ltaIOl5G+A5Jleeun5diXKHfPoPwGZJXsssOcQFS7bthpWLhMmiEatX+Egu3/6NneIAHp3J9pPPZvlx7Lrb0Es1Qxb4GtNTTWSOpQEx9qP98Uhj6meb+bWrvGC0WvTvcGj+c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWlpVDRHaFpJMGJ1dGpMWjNuYS9NLzVqcVU0SGZVcmRkZHpxS2Vsa1Mrc0tY?=
 =?utf-8?B?QVlpSHJwN0ZPcmloM1loNFNyMm03cTMrc2tQZXloTWJqOERBL2VNeEF2TlZ5?=
 =?utf-8?B?WHdRQmQ2MEl4L0hmMEJrRy84ZEdPWmp6VHEyVUExYnRLTnFOZGpJQjU0MFNa?=
 =?utf-8?B?UWFESkxlbTNwVHEwQXdDUnRRdGVvOGdkZVI0Z1dpZ1FDNVZiMEhmei9wUkky?=
 =?utf-8?B?V3RVVFROWEtLRWVucVdJcDl2TGpIZDJkT1dEa2tRRS9KZFVEcHN0dk5XTjlp?=
 =?utf-8?B?TUc3Rkk1ZitmT1RFQTU2RTh6VjZKZXF0K0N4TFVoV29tL2J3YTYzcDBFa3hm?=
 =?utf-8?B?QitqcGpZZWJTbW1iTkY5TlBWdHhXelZPeWNweXlISkNBc3NXSjFHUVUzSGhB?=
 =?utf-8?B?aW9PTDVMdmZhZFN6M2VDM1pnTnpoeEpFYVJhZVRZdTFlc29ac0U1clR4Tmlw?=
 =?utf-8?B?ZmdXR0VGdDU5NmxPeFdFZkJ3MnBKdDZ0cTlGZGwwM1kxZkZ0eEs4WlpxV1BK?=
 =?utf-8?B?MlpVM21ldjJYNXIrRGdiUWVlRzhCbmpsdmpSbE8zOE9KNTJoSjZvMEJmNEpW?=
 =?utf-8?B?bTZsWkZDbndhYXJLWTMyU1BwU2hKOSsxdDZCSHJrR2t0TU9vcGJIZi9teTly?=
 =?utf-8?B?OHIvamNpYmpybm1NbmxrM3dMOHpuRXlOREZRRTJWMEZGbFNpQXRTdWhhWEhy?=
 =?utf-8?B?UUFhaHd0c0w2bWp0VkovKytudy9BMys0V2w1aFE2bklhRFNzM2pmcjhsU2lq?=
 =?utf-8?B?VWhBeDM3b0V4aEpLNGoxZ0lhSENqQzBlaUxHb2dqWTArNmJJVjhwdUFsb3Y3?=
 =?utf-8?B?eGlCT1A0Ni9lV2d5MklHR0hHcXRqd3pzOE95Nlp4U2pEVDByS2tMQzZMYW5K?=
 =?utf-8?B?UjhET0d4V3RxUHNDdGIxWitrQVRFT3RZVFRmS1pvdnlQRWk4Snh6K1VrT0JB?=
 =?utf-8?B?QlhDTGxrZmZnR0REd0RFL1F6WFlpMENKK2kxUU96eGp2RWlBMllpL1RBUEFn?=
 =?utf-8?B?SWQ5eTg2RDc2RUVMQXVuUlIxVy9XWGJHTGh2MGczUzVXT0R6azdGS2pnSFM0?=
 =?utf-8?B?RDl1QUpUYkRlSEJSdm11VTY4bjF1VDlJbUxGeDhwUW5xVFpwWjc5OTFocGIw?=
 =?utf-8?B?Tm9vY1ZzT01zYWpvMXFUY3FkRFMzWHFOM1hkMVp1MHBXUzg2V3JBMS92K2Q1?=
 =?utf-8?B?dnpCVVpHZHA1Q3Q2UW9KWStvL0ptZVNDN0g1ZGtVMWtGeE10WkdiTGZJREtY?=
 =?utf-8?B?MTZJdG51ZDYwY0hYYVJRWEFqbzNsK0p5MEtvZUxEMzI4cmozZDhxOEZWZFNE?=
 =?utf-8?B?WlZTZCtWYm5aeis1OEpFOC9HR2YzS0pIT2F5QVdLUHBNaGhBamZmVjRNM3JV?=
 =?utf-8?B?UTZKcFh0M0M0MnlDNjZqQlFBSThjYjBtbHJ5WktCbG94dVp4eGZ5WHoyNTNh?=
 =?utf-8?B?R01na1dtalVDeHNtY3lHZUcrRU5wNUNFc1ZmNVNVV0QwWXp1Ry9lbHlKMHgx?=
 =?utf-8?B?YTdZMzRJNFpINit0clZFUW1zc2pKMHBNUXlwKzZpOVh3bnVtZWpqVWFJZFVS?=
 =?utf-8?B?MEkwTCs0NU8zL1p4cXN5STBnTk9qVGVVZFBKcHlSbnQ5ZDFHd0h0c015dU9v?=
 =?utf-8?B?TmxIcFFuelZ4bWtSWGNaUHVtb0FBNEdTSnhkNHpPT1B4Tkk3bUt4ZGF2aE13?=
 =?utf-8?B?TitQWVRzZHFGKzM1blVzdmFHOGpIdWpsOVdYMHMxN1gzeE5wblc3a09CN1Bh?=
 =?utf-8?B?RjA0cnh6OGViNVVxcjRLbjBYT1lINjdhdHBPalVpSkJuKytlQTQySm9lMnRN?=
 =?utf-8?B?bmprKytSNzJ5ckRzelNpdG9qOFJic2RBeXhTcUkyUVJRZkJBTGJkNGhnSFEr?=
 =?utf-8?B?TmpCVWN2V2diclVCUGxpallIWElRR0l4RDFSTmNQUzJnWWV3OFlZVGt1cGxP?=
 =?utf-8?B?bFRtcHZwSzNwRG83SE1mU0M0ek1SaUlXL0t1L3FJWmdnRTd4WG5hL0RnbGpQ?=
 =?utf-8?B?Tm5ibzM5bFFwTXQ0S0VwSGxNK2EwTzVtdGZpU0ZvaXNEUHRFTmJOZTFGdmNz?=
 =?utf-8?B?eDdMNlVsRGloUVlTOWsrL20xeTQrcDJnajJ6ZHB5MHRjQnFzeXh2eEVQMkNp?=
 =?utf-8?B?VHJranNWK2YxUzlqUzE2RDdEVVRSemY0Q0N3aWE4Y2ptclhZWU4zOWFDVVhw?=
 =?utf-8?B?UXNKdzhRSzV4YUFIZll5SGF0T0tWS3NDdTZIT0U1Yk5jbFp2WXZqUzlRYWZI?=
 =?utf-8?B?S3RIR3pDVnZ3UWlLdng0RkJVUzBQcE9BMlhZZ2lUWjlpRXN4TkJ6NTRHNGUy?=
 =?utf-8?B?THlTNWR3ckNqYmJOZVd0eFQ3NDdrVXQ3ZnNtK3d2SlQ4S1djQkNBYnlCSlM2?=
 =?utf-8?Q?VuIe5KWsw7nVBmsolLSLzLH0S50XToMn0ZUp7WDdpWwbP?=
X-MS-Exchange-AntiSpam-MessageData-1: BzDJgie6LCUpng1Kc1ZOq5kSDlhgO/c1rEc=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 751d429b-fcc7-48df-f1b8-08deffb4ee64
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 18:49:29.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPutIpmSeHhkChYBGu+rZSte5z8HPFTQU2YSMkj9gys6H8kWXoqSqLUJXUWj1Qjmhmx6+XYMKWAJFvNT3aEoSnzE/FXy9IPWycupykCaFvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8062
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 18:49:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10317

Hi Daiane,

On 8/14/26 10:28 PM, Daiane Angolini via lists.yoctoproject.org wrote:
> The text does not match the cross reference, so change that.
> 

Yeah I'm not sure why we keep doing that. We already provide a link so 
I'm not sure what this helps with. But eh, better fix it like you did so 
at least it matches. We can always decide to get rid of those later on. 
I wouldn't be surprised if we have other mismatches in other places in 
the documentation.

> Also, drop an extra colon.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

