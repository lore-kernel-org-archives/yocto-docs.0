Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C5AD12D71
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 15:00:57 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17300.1764774055881835554
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 07:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OGOakM+I;
 spf=pass (domain: cherry.de, ip: 40.107.130.20, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gi7e56GjthMl/Savit72uOGac852/gjLWa/mjAVDJFM4mURoMssVPyZG7oPWuGeANHUUNuQsIYye70AWCw4+EXCFuSANov6QIwQvuLBZAspAJUbu/wno9/UKMWMvc6jfHbtTex3GSfCho1oI2wTqu4faxn27/VI/jV1XzzBstm1XVn9LK39zrQ54gv29/XhpRypS3As3ICDVHVAKfQf50L4VdlXE5AsD6gn39uJqh6FYWKpmpcyLUYJ3ViwAENKz1hpuhmAaPiACguZ8QiS75/vKyO/PFktMX9pLzkpCt4KTOB3Hie38Iz1n70DuvhGGRNrhq3k2vdYPulstnFTwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpmuCPuY+eKdHUsH6Dti5q6oOmXQlr9ID8QyXLz5zL4=;
 b=cVLHuowMRWHruUm9Qyfo5FOLbemAneTDmwELRFS7yMd5m8IAHmwh44v9HwltN1JSZGAmgX71uL3nUIF0t/oZx4Lpuaz3JxjSBqHVcGRdJcJJPH1uc4i8hPXXVTn5Wtb1YKdpL41NjYNvneX2PfMo722sIqc0FZQg42ZxHSooMjTk6EgxjrjZSGLkHNpp+67rKtWt3rmyS0ylzmew9/T6TXLudXDOEErjiDPY6UIYwmY5nJszJ+51cui2HopeZsE1RnnCX+s3NCfzQqjs5I/L054IxHlVpmY3SUX16JrRac0YzbBvrXPCktmAiT6sdaf4GR1/ItAQshIQ1WK5VsgyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpmuCPuY+eKdHUsH6Dti5q6oOmXQlr9ID8QyXLz5zL4=;
 b=OGOakM+ILD1rWHNjgxwkihMb+MqRA8NM7XXdMi4PYulpa2lXZU5pCLDwf8W+RXTviZDj0TXjNES4eQVt4jYVa2Zd+Vaohg3MmH2AC++nH8o7ZgGnCtxlmmkuywYm7+gWOaDYxEM1aXUKwNZyUlDKo3Yh+wkoGQI7WfodC8iIBA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by DBBPR04MB7834.eurprd04.prod.outlook.com (2603:10a6:10:1ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 15:00:50 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 15:00:50 +0000
Message-ID: <261fa295-2ba9-4d9c-a0c8-a9dbf2f77fbb@cherry.de>
Date: Wed, 3 Dec 2025 16:00:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/4] set_versions.py: add wrynose as devbranch
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
 <20251202-release-updates-v1-3-889513ccc384@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251202-release-updates-v1-3-889513ccc384@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 8832c06d-f11a-4ad1-96ae-08de327cbf86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3VoN2dNd1RBNVVGcDVJd3FpMHVXOGVpZkRGdjA0b0JNY29EalZ0eFgvUk44?=
 =?utf-8?B?a0w0UnJPbzF1cEF5aG5velBVQWdjK1ltK2FHOVhKYzkwSUQwRmVvR0taMzZu?=
 =?utf-8?B?dWY3SjlBdnZWdEljSW9jZXdMSnc2QjhMQWNSU2dzZVYwSjI0OTNvYm5iOG5L?=
 =?utf-8?B?TEdEQkxGQjdhRkVqOFdKcHNMci9yQjJtOGdLclVSd1Nlc3AzUERyWDNuQUdB?=
 =?utf-8?B?ZFE0NFpGK1FrRU9kbndxVWdVUDNOQlZhRlNsM3AxN24rRXpXcUlnZXBpaEg4?=
 =?utf-8?B?a3pmM256N2FvcElUdnFvbTRnQlY2RUg4c2s4amNVUTdrQzgzOHFPbGtzVnJi?=
 =?utf-8?B?bnNlSHI3eS9UZS9BM2g2VVNacXBIYlBYWVlReW0wbzIxLzRISnZkb3JiS2NF?=
 =?utf-8?B?SkpaTTFmZ29KSHFscm9vUnhGSU4zeVgzNzRkdS9sNGFSbWN0aENOaHpZVTRm?=
 =?utf-8?B?bXd4K1EwZjBOSk45Z3MyK3B3dWEvZnhkdHN4ZDR5dEJEUnh4WXpTZTduQzVI?=
 =?utf-8?B?c0VLSENpaHV5d0hadVBDRU5aS1BsbUVvbTNLUjNFeWs5b0o2VGpnQXQ5MlNr?=
 =?utf-8?B?SW5TU0FmdnRSVjFUSllucnMvTWRFUE9IbWM3dGJianF1MFJXQWNQN1FmeThv?=
 =?utf-8?B?QzQ3T0VIb3h4MTJrOWtrckhBOTNYdklXNFR0SDlnOWQ2amg2MjI2Nnk0MHZv?=
 =?utf-8?B?WWpnczJGQjRzMThSQUZRZkVZQW9UVGxiRVBUdVZBRjdlSEJVMFJ4N0syOHhu?=
 =?utf-8?B?Z3o0QmZpb1hIVlhPUHJqZTBHUTF4RlBsK3FrQ1ZKU1NjWjlhSis5dUNNNU92?=
 =?utf-8?B?WnFiZnR2bGUra0pubFl5YzdQTVBiMGhZVTNKaGtBNXdacDhVL1IvYkFXVXNC?=
 =?utf-8?B?cHJ0c0REKzBiMDc2R29Qd3JHQzcrdWhYRUJpZno0UnlScUk3bi9sSmhUQUxi?=
 =?utf-8?B?MytMQ1RUNXEzbW52UGtXOWdrUHAzeW04YTMrTzMxeEc2TGxoZks3eHVBSzVi?=
 =?utf-8?B?UmFwVEVCYnVXWjJMZTVNelgwcjU4aTMvbHlIRC94bUExeG5ZZUpJUi9UWnlY?=
 =?utf-8?B?cXJ5aW95NGcvT0h2ZU1jSzlRZWVrOC94ZlFWYjdmSGpkdG1ZNDhDN05zcE5j?=
 =?utf-8?B?YkVmNll5YUVnM054Y2w5cm5rR2YyTXYzT3pQcHY5U1gvVGc0bXd2R2ZJZUZH?=
 =?utf-8?B?TlkzV2JSR2tXaGV0NXduUnllZC9aV2F2R2lPTTFjYUhEbWVEeUE5RjlIMy81?=
 =?utf-8?B?S092Zk5KVzYrVDI3a3c3ZUpiUzEyb2VqR01xdlpHN0s5NkZkc1hBMEZubGVM?=
 =?utf-8?B?d2JpNDczWmRjdEtjM2toTUNOMGlGWjkrTitzcFVraG5UZTZ3UFd6N1lsL1k1?=
 =?utf-8?B?VXppbHF3c0Mxdm5ETFJMLzdWUlRUZG9udUViejJSN3lzaTBHVHRJbU9SLzB0?=
 =?utf-8?B?RGRJdjBDeTh3eE5sdzJ1WUVMUzZFU1lRdWRPTDNXMTlUUElHUDFYZENMREI0?=
 =?utf-8?B?VkI5NU5ZQzkvTFpNMThQNEVJU1dnbEtaT3Z4TldrbHFvRTBrMjZ5anhucFFM?=
 =?utf-8?B?YmF6bWNlSEYzVzhITjYwZkYybWV5Z3czaGNXRUtTTlRIV3E2aTVJMFpWSTdV?=
 =?utf-8?B?dzFNSHYrL21GMjhUcXp0ZWJiU05uT3QrY01UenVmZ1VLVzdiSHB0clZYSjNn?=
 =?utf-8?B?RDNJREZLVnFoYUk0WEpGNEx4b0VvVnF6Sm9nN21WK2gzZ0ZQSzNoYmZySlNU?=
 =?utf-8?B?YUZib2ZRc2pQdDdndTNyVUIrcUROMFF0WllFUk1CSFZHdWgya3l5WTFYNnhh?=
 =?utf-8?B?QzZ0c3ExWW5lbzQzck9venJBYnRZb2taMXJtVkltdXIvb05pZGNiVitiU2Rl?=
 =?utf-8?B?YzY5SSt3QW91czNuc2xNUU1nNU8rbFk4empOWDQrWjlpNFlFZkh1bDgrTHJk?=
 =?utf-8?Q?wy2GmrTFpvAiMRUPF8rEWBFWiLzVlG9j?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eStLZ0Z1T0F4UjV3aWl5bjg1RlE1aitZamEyNDYvYVlrb1h2UVl0dHQ0NytD?=
 =?utf-8?B?bzRZYklnUnFiaVNqWTNRaXIvSXFUeWpIMEVvSkU5VmtTcFpUVFlPSDR0cHV4?=
 =?utf-8?B?ZExSRFNBVnQ2M3h6NjMweW1FaVBycFFpUlpWSzBXZFFsWlNyRFI4YjBNZ0xs?=
 =?utf-8?B?ZjVTeVVNWWE3dDZkN1VEaVpIT1dCVnJvbjNFeWZEajFDQzlvbW1ZZ2EwbEV4?=
 =?utf-8?B?cWNNRVF1eU9zc245WUVCSnEyc3ZMNXlQVVVPOHZFYmpFbG0xYm5rbXdwckxn?=
 =?utf-8?B?M0hBV1BaS29rTTFEKzV0d01nOGRzeENoemp1Yzlxb2FGTnkvdWdwQzhNbVVM?=
 =?utf-8?B?NldoUDU3elpjNTlWOFEvOGphUWIyRUxwLzEweHMya01ST2l6L2RjQkdGT0t6?=
 =?utf-8?B?WEh3Z2U1NzlERk5tV3J0K1RrL0VoakJKRERjUnRvRUZ5VzI4UnVmVHlpTU1K?=
 =?utf-8?B?dlVNOHc1K0NsNXpBZHJIelZkNk9udmlJM3RNUFkzSXQ2dUN2Z1gyRkJ1anMz?=
 =?utf-8?B?WHRwam1yZStVT1hUOVU0dUJHWnZkYk5icVBBVjVLZTdJTDBVSXNUVVJXSnZD?=
 =?utf-8?B?WXVLeS9HUTRscnc5K1pOSDRJQUhsY3lKcWFENG1nK2E3NWVOQzVkbWtLUEhW?=
 =?utf-8?B?Y2tVTlZJWWIrdmNpNkhBTjN0bVpUenJvUUJONTNoQVQyakNzZURmSmJ6UG9a?=
 =?utf-8?B?OWhFRGVESG4zbjNEY1NiUWg5SG5wZ0NNakM2bXE0b0grWVRqOGNMNnhGOWNV?=
 =?utf-8?B?WFFld0tSWTE2NXVGbm05b2hJK0JidFNabytueTFSbG9LMlZvdjVCVHNHNi9C?=
 =?utf-8?B?SFRrdWN5TFlZTTN6ZEc0QjdQR2J5RjRVWnNDT1F1S2IzVnlCaDV1RDY4aEdi?=
 =?utf-8?B?MEZMNnhidEIrUHI5aStOTFJjVzlEUExYRGg5OFJCdDQ4WDR3T01kWWhVUlR5?=
 =?utf-8?B?N2ptOEhDaUpVeUs0dWs0NjNEOXV1SFhOMDdvUTNJaWJ6TjdzOUc2Y0QycjJm?=
 =?utf-8?B?NkxUVHlTdmZ5SEZUTnFOdTAwWXBPUzBlZnQwOURxaEE5YzEwdXg0UUpJd2kx?=
 =?utf-8?B?aUN5eE9FcmRBeFdpQjZpTmhDV1liRVlxVFZnNWdSNTZjMzNGVlE5NjJWVGFw?=
 =?utf-8?B?eGxETnQ5UFFzN0tETE1aSHBIMlhwNm81UmE1WnJreUsyR2VQbnFVTnIwMWo2?=
 =?utf-8?B?c2FaTmZ4VUhBMU9hSmNFUG5PcHZ4ZGdwQkJNWUR5bUhWd0hiaDVPeno3djJ6?=
 =?utf-8?B?dG1aQjJrU0VQb0RNc3FhRTZ2SXc4Ykg4bjcxL0xKSXNWWStiRUNqcjdnRm51?=
 =?utf-8?B?aFFsYTlmcW1kZFdydStzZitlWTB4Zy9ONmNPeXlaTFl2eHg0WlFDcVR6Um5l?=
 =?utf-8?B?b1BFYXgwcEFKbVF0Z3FRTncyWjFrRlE1aVZULzVlRlBmR2s2eDJ6VWJET25H?=
 =?utf-8?B?VzFkbjh5ajl5SjZhbkd3aVdKRTErMGhvTEZ2bE9wQTY5NzJLa3krZWJuSjUx?=
 =?utf-8?B?b0Jxa3Rkc3d4RHZ0ZCs2QSthVUwxL2VsTE50eDVsT2tJTmtmNG0yUkJZOUhX?=
 =?utf-8?B?dHl6MDNWcVI5U3lmNm1lNEVLNmZNR2F0NkJ0NUtLMWlXbkw2MVQ5bEp2dHJL?=
 =?utf-8?B?TW5jV2RzMkx0elZmMW1nVDUzZ2pZWThUeDkrT3JicThqanZRSUJmUDkzaE4w?=
 =?utf-8?B?ZDVpYWx2M1g2TVhTTmRyRGNXVEppTzhLWGEvYlprTEdTOEZWd0xLVHVOUEdW?=
 =?utf-8?B?cXZsZXhpT1Y3WmE3eVphM1JtUktVcGJRN2JCTkFEbFVBQnVLZExCNVZkeHE3?=
 =?utf-8?B?LzBIbVhWT2p4ck1DTCtGR25jMjUzTjFCUFBVZ3F4R0cyMXJPM0pZcUdlMVZV?=
 =?utf-8?B?SzFTcUxZTmUwcGxCN3JXTFo4TTdmK3k0NDBxTVNWQjdzTXlkYVczcDNQNDFG?=
 =?utf-8?B?RXZhWVJUaFA0VW1JWDRZQXVwVGZvTFMrS2o1c0hQa256RHpmMnpxY3ppZ3A4?=
 =?utf-8?B?SFlCOEJlTldWZUxCMmh2cHU5WlVWRmdmZTNaMmdrWHpHbytpNkx2ZnQ1S3Rt?=
 =?utf-8?B?cWNHQkZKUEREYWh1b1NRdGMwWTRhZExRbC9RNlBHcWt6MlFoN3VBN2k1dWZX?=
 =?utf-8?B?Ui9COEhJVTBJcHBSeVBVQjV6WnJ5bXZTN0VIb2w1Zjl1a2dmUzlJeTBYdVUv?=
 =?utf-8?Q?ShitbQ6YYb96fz44kyey98w=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8832c06d-f11a-4ad1-96ae-08de327cbf86
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:00:50.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qn3NrNOe6Xe7zpomnOjGu4Vu+qG54Wf1Pe/kMbvSyFO2fpUuOw6PXmw0ELziWckN6d7/UV+q99Hyb7WylQp4R0h27ZyMXkB4AX+TsrG3DCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Dec 2025 15:00:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8197

Hi Antonin,

On 12/2/25 5:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Update set_versions.py after whinlatter release.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/set_versions.py | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index d146f93bb..0d199a885 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -26,9 +26,9 @@ ourversion = None
>   if len(sys.argv) == 2:
>       ourversion = sys.argv[1]
>   
> -activereleases = ["walnascar", "scarthgap", "kirkstone"]
> -devbranch = "whinlatter"
> -ltsseries = ["scarthgap", "kirkstone"]
> +activereleases = ["whinlatter", "scarthgap", "kirkstone"]
> +devbranch = "wrynose"
> +ltsseries = ["wrynose", "scarthgap", "kirkstone"]
>   
>   # used by run-docs-builds to get the default page
>   if ourversion == "getlatest":
> @@ -36,6 +36,7 @@ if ourversion == "getlatest":
>       sys.exit(0)
>   
>   release_series = collections.OrderedDict()
> +release_series["wrynose"] = "5.3"

6.0?

Otherwise looks ok to me.

Cheers,
Quentin

