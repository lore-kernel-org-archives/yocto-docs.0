Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73BCD2D104
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:49:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59149.1768312149110735570
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kO5K1pMF;
 spf=pass (domain: cherry.de, ip: 40.107.130.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EihTNJpZqklqX5MizW8g0WVmdaAFTWSa0Qf88baH1f6NgArV602tsky2SAkkWGq01wWqv+zGA0BQ53rT34otMJoMdFJKtrEF8LAGWxiqA6fYk0MFcnHw7w7e4NWmvtjqz/yUS81qT0YFuU7UA3ZcbZ+Jk4yswx9ckHLqMYUD3SoZsv5gaWBj9gBUl3ev4uEMCELWCaUd9ZLuFBmV8CkdoxNofffNBscvNE3hWLPrOKzbPF1XJNvfAZUCW/C5XPfa4ipuYm0I+GEBLrRJ0kG41DByXevqXJLYWEQXD7EL/nj6rhy3/lQF03SYJ6rG8OyWe/VA3p3X2qc5BQqrwGz8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqcCDeAMdyntbOFMiiI6Xi83XrWTHobiDwDIPQnn/Uo=;
 b=T0aqi8i5JCbPLqtafFB4K/RUyqQ3WPEDJqgSAj+Hpi8xwQ/7wjTYNoXkQfXBaAmv5F6apAqoTwiskWOsOpQC6je1p8DtG4ePDAoqjMBz6ax5U4pgkVTCmssL0theGEnCxEDnWT4hFzvnE/HWF2ZsjMO2GdC6zHuwQ/8xKcX8RcMBsJkjtcwyw6KacOCO+sPKELR3MplDQVRI9tXge5aeHzjzbTvrbkrMQ+J29qy7gBN6xQKmycRb2djHLVCvCra4/MycFu1cJ/kSN/r+TsctlyR0sK42F0uZZ8lpyZw0rvmTGd6LipxAZvQfwXks3OH9sycfS1TiYgqsLcx8D2bQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqcCDeAMdyntbOFMiiI6Xi83XrWTHobiDwDIPQnn/Uo=;
 b=kO5K1pMFwOrU7ebGO12AJYpSvIMCSTbEXMPIH4UzUDcjxuNGlnz66l+IDbypdig97RGBpLCEPCwWizGW7oQ0uuQ8aafg+ht1z2u6+GjFmBKlK/Sks9wcO0WsIDcTWT9+zLoI6+H2uKTrFOPJiVFz2u49nyhgSy7BZAxn4To8cJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8985.eurprd04.prod.outlook.com (2603:10a6:20b:408::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 13 Jan
 2026 13:49:04 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:49:04 +0000
Message-ID: <064b4d3d-0695-4ffe-8ae0-cd53ab2d281d@cherry.de>
Date: Tue, 13 Jan 2026 14:49:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 22/53] overview-manual/development-environment.rst:
 remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-22-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-22-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bfdc5d-99c7-4421-b7d4-08de52aa8403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dWd3TElzQ2h1OHJDRWVYaGhYbDhRbnc4VU1WZEwvYmFCM25ITXVrZFN1ckxk?=
 =?utf-8?B?WWVEK0VCR3JkcWMrc3RscWJ4ckd5Q011azZ6QlRIUjdZTnlKOTZ2R2lRRklZ?=
 =?utf-8?B?NExEbzNvczU0L3RFYlZTTi92d3hSMjROWmFUNjM4K2JZaWpmN2JMcVlubTVo?=
 =?utf-8?B?L1ZLL1VTS2NhdGFicmlNVUtVWW1EWTdJZWR2WStNZFhwejN0WEcyd3prYS9F?=
 =?utf-8?B?YzRacUJKWnpRNzVsRDdGMTkxQnlzcTZYSFI5Sy9NbmlyNnAycU1wTUhwUkxW?=
 =?utf-8?B?UTZtbWZMQVEwVVdWNTNsRng3dnlhYWd6Q0dtTHlwY2lob3BaWWFiTGkzcE9O?=
 =?utf-8?B?cDJLb21TZ09QZFhYVnd2NFdVLzRIUVBWODZ1MkZDUCsxdjN4K1MrVnA2QXB0?=
 =?utf-8?B?RzdrZU1aNTVHdUVUWi8rVGgvUEpML2pKZTVxV3pZU3JLQkNVeFhFV01NWHEy?=
 =?utf-8?B?NnVkSVRpVHdnWFRPTVlxMHp4bEN5UVB6U25QcVhYOFdBbFZKS2xOTzlacXBr?=
 =?utf-8?B?QlZNdndPRjZvdHBxbksvQk95VHBKRFIycHptdGVidGgxZWpML200U3kweDUx?=
 =?utf-8?B?NFBuKzRFZ2NtQ3B2TDdBc3RMOTBybVcySVRFT2hFQmFabTZBU0xvU3dTOWpr?=
 =?utf-8?B?Zkd4UHR2RTVpd05scHdGQVhNalhIWmg2Ni9RMVdVVEptTnJaQnVmaUJRSHcv?=
 =?utf-8?B?NitLWVRzY3BQVndtUmhuQnNKcVFqUkUwVFhzSDBYdWlBWC9sVkxtODlKUHg0?=
 =?utf-8?B?bm1Vc1JKYlYvSXhuYzQrTnpSd3RDSXN3OXpFZkg0NWVtZHBPUlhTT2pEakFI?=
 =?utf-8?B?NTFmUTZ6UWJncWV4RFA1bGt4bEt3TjE0Wmw1ZjU3bUJBbDAwd1BQb0gxTTE2?=
 =?utf-8?B?SWlUVjNXVlZBRkhleXJlZ0IrUitpTUcwTC9Qcmw4OGdiWkRXdnJnSkMyRnlt?=
 =?utf-8?B?ZXdnK0JHMkNVdTdLaERicXo0QmxpcUxwbkVsSlBqOEtFVERiZjhTUlZtU0lC?=
 =?utf-8?B?enM0ZjdmR1hYMTBBREJVaXJyQTF1ZUVQbFNhbUdOZ2NtaDFnbFJzYmRqbmdr?=
 =?utf-8?B?TWxCZWo3ZE9ISXBLTWFQbjNwY2FQZ3VkRGZUTG02ekVBWThCYVJaZzRiak9s?=
 =?utf-8?B?Rk1QQ0xVNlFZcWF6VUZ1K2hENlJOdjFPaFZMWVpKVS9hTUdHamo2SVhkMHh3?=
 =?utf-8?B?SGRORUhEcmI0aFBITGpEQVpxcHRhb3o3TDRPNjZURHg1WXk5VU13R2lWRk1X?=
 =?utf-8?B?MGdpaEMvVXZJRkFPVDJnZWRyZDVxMm5lTWlZdHdpZEZDWjN4UWRBQ1FaV3FU?=
 =?utf-8?B?d3I4U28rUlhhb09KMUJpdHVLM2gxZXZ0cDR0K3Y3dzh1Rkt3YXhTQUhEMFI5?=
 =?utf-8?B?NDZ0SmJLSEdlRndnR1ZhbC82L25mV3MzaXh1UjlLbXBwL3o4QXVBVkxrelhN?=
 =?utf-8?B?RFNMVlJ0QWNYbG1heXMrai9JYzl0eTBicXVIeG5UMlplcFM1ZmxaUVNnYkFz?=
 =?utf-8?B?NWpRUisvdGd5NTFQaXZyc2l5QkZsaHlmOGp0b3BqaldSN2ZMNzVxVUh5Z2tF?=
 =?utf-8?B?ZDkycGZCVzl3MTYzK3ZUeklRMkk4UjJXaEozdmFLb2c5Rkd5Vi8vK0lTODNo?=
 =?utf-8?B?WHRoTE9Nc3NJdmRNNWdUc3g5UEhJbUkxVjFFVnhzNm1YcE0yZ0FQcC80Lzlh?=
 =?utf-8?B?NkI5OUJ5T1ZkbEVjM1ZQVERobURUVklhRjBBb2R3S2lNYjdReU9iWjE4OUJI?=
 =?utf-8?B?VjlwK3dSSExtSHNyRVJQVjIwVHhOWG5RS2xGY0lZM0FzRGV6cVVKcnVHaXdQ?=
 =?utf-8?B?ZHA1bjBpU1RlK0FCekx2Zy8vTjB1YlBrQTcrbkZ6cVRZZ2szS1BMbHlqMi8y?=
 =?utf-8?B?T1M0TzBDZDViN2JCeHllQVVsM1VmYkFhUjBiY1hTTU9oU1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZkdMZUxHYkEwSnNBR1dtdFhwTUtEUFE2VGEyUFBEQTRoZE1SOEtGR0lBRldm?=
 =?utf-8?B?cTVpTjN1Sm16azlxME1COU5BK0dna0pmT1pXUVFJaGVaM1Q3cjJSN056b0Vk?=
 =?utf-8?B?d29VUmZtbGRydHozKzg2R1VUdzFrdlM4VHdSUjUzS1JnVDJTRlYwSzFKR29w?=
 =?utf-8?B?eHFJdUc2b0hBVTJNTnB5VlE3SGxZTFpmRTkrd25kQldRVkVERDFjWWlWd0pL?=
 =?utf-8?B?elovemdTemE1a3lVUk5TWTI0TGZwMzYvd3VaaTNYaTJodjRLc3cveDhUUWVQ?=
 =?utf-8?B?QUxlbCtHYzZVUXVQUkdpR3dJN0Z5KzVDS2JuOHZvR2E5Uk5lOVRMM2pkYjFx?=
 =?utf-8?B?b0owVzlIa1AvNWdDTGZiUHk3Yk9QVzJHaEF0cEFVR0Y1VWVzZTJlZWVtQjQ0?=
 =?utf-8?B?NEc0UjRLMENKMUUwUitvSnkyMU9rRlBabnNTbHUxSXRmVEkreWVRRDE3MEsv?=
 =?utf-8?B?K1BRU2JuL2pNZEJSY1BxbzdMUG4rWDNMRUlmcXg3R090T1RPTDgzUkNiVENY?=
 =?utf-8?B?c1g5Vkp4TzBtL1NoWkJCSFNYNFdKNTIyUzNHSGhveHgweUd0ZHpWS3U3Kysz?=
 =?utf-8?B?di9CN3BLQ3docW13bXh1a0hDS2V3SWdnSFdpUnRSNGJnWEs0V0E4c24zamln?=
 =?utf-8?B?THR2Vm1QbXlwcG0ybTQ0QnZncUs0Rmt2MHBqSm85Rzg1Zyt5aVZPS1l6d3Bo?=
 =?utf-8?B?cHU2bmhTS3RqRnRkWWxxSU1WaWYrSHNZd2tNdVhlajVWYTJyRlZUU0ZFajAz?=
 =?utf-8?B?RTZUbGdtM25FWGJBZ2xkeDJTSHlsL1RlaGdwSi8wUHRwd3Vvd2ZtTlhpR2U5?=
 =?utf-8?B?WjlIc0NxVElFOENHRXQxQnMxNWJERlVmY1FyaXhvV2txaDYvSW5qczFwVCt1?=
 =?utf-8?B?U3BwbzNieE1oSHBpcDk3aGE5ZHMyZVl0OHYwZXp3MnJNcVh5dk5MYlVqWFNI?=
 =?utf-8?B?VjhOTHdPNDRyWjhXT0tMeVVSRjFCNExzT2p4WUFYUlNGaEFjVElxSEMzak5o?=
 =?utf-8?B?WGpFaEs5NlprZjQrTC9iUHdXdWo2dGkyVjh4UkZzdXpFaGoyb0ZOWDlpa0xn?=
 =?utf-8?B?YVlWNDZndFBUaDlON0xWRlpBMld3Qmw1YmFWazhWbGR1SXNWN0puVzFWckkr?=
 =?utf-8?B?ZjRXY0p4ckhIR0VsT2ZrNFY4elVQWTBFWmZWbXNNN2xwazdEU1JieWRXOUNu?=
 =?utf-8?B?ZUVCTFA1d2o2RmI5R1lkRU5oMytCMkZvRWloeHlXM3E2cWdRNnNQSzJJem9F?=
 =?utf-8?B?ZHdOcFRCL21ia25ZaXoxWUh6U1dzeWVMOHh5bjRrVGdKSC9SdmRBWjBZWmh1?=
 =?utf-8?B?R3JtZGlPemxVaWtIYWtjTGdoU1dDam1kZ1VYSUF5c3VqV2Y5OGs5azZGNzYw?=
 =?utf-8?B?bGZlNTRVVHNyYktzZTVkSndCSW83WXVic2ZJK2k2NzIxc2s2dFREWWtPMUh0?=
 =?utf-8?B?QmNVQ1ZaSVhvdjYxM0Uzc1FKZ05sbFllOWFSUjBZQnNYR25lWXZBeGlkZm1p?=
 =?utf-8?B?bmQ5blFJOFJhd2MrWnAxOTFabWJ0bCt3NjFlN3pZUlFhWE04ei8vQ1liUml1?=
 =?utf-8?B?UHdyQnE0SThGZlNidnUzc0VWZTgzeXVoV3FxVXN6WUFWSUV6RHVqVWpoVmlZ?=
 =?utf-8?B?bm9lanBGZlNpWk1LQXBMTGtmdzFFWStSbFFCamR2L3NaMkxrVXdLQzlOeXQ4?=
 =?utf-8?B?bU42M2FOM1QzTHNwamthbkdNSTI0TVcxcUZOY0JtbmY1aUxYKzdVNC9GeUQz?=
 =?utf-8?B?Z1Z3TmNOaUZ1d3doWmpERWhXeVlLMWdidTRJZTNxaHREQU9VU0FVNTg5N1JP?=
 =?utf-8?B?ZUxOSlBLVndtZ3VqNFpwQXQ4d0xmQWxaOEVyaElGbGovL0p2MmZMUFdCbCs4?=
 =?utf-8?B?a203SDBTUGQvRVJ4MDkwcTNHL2R2Z1ZrMisrczlaRmtBMW9oa0JrVmU5VmZI?=
 =?utf-8?B?ck9TeWJVZTZkK2J0SWJ3U2dmSjdPMjFFNmpMTHRZaUlIMEQ2Q2ZyQ0VnbjM0?=
 =?utf-8?B?b0VuZGpWSllMQjZrUUhZOG9tY2MxSFQ5Nm04UVJYQzQwTUNSRy92S1RxVGZy?=
 =?utf-8?B?aHBlOHpLMXBDT3NPcXdyVS9mL0hWS2ZkSVc4WkhvU2QyMHIwZ3laQ25mRnZI?=
 =?utf-8?B?UjZLZUp5eXlicmZkQlpTNUh0VnMvSUpDZUJmOWkvUCtUQVNuYTZLMWR0Y3lk?=
 =?utf-8?B?eWg4cCtIKzcxa0FUVkdvQUFqNVFUTkh4bEFmRHhnV3hBQTJ0TnRjN21KTUt4?=
 =?utf-8?B?Q3Q0OForK29DamFjaG0raVpCOHdqV2VXOFY1empieStrelZuYnZzNEFja1lQ?=
 =?utf-8?B?emEyNXMxeXVocXNxZXZoY0FaR094bWM0R05heHJTaGloZXdiSHFrQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bfdc5d-99c7-4421-b7d4-08de52aa8403
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:49:04.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzy2MJlbd2vEjT3Uh+4SO6dlEbNnG0PeUGD4whQSm+2cLWC2neqU4/wHRJ0qcRsRgXiKTQGl7NciBHKzTSD3g5Efy1RLOalXYzFe3mCUnkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8985
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:49:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8511

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> Replace the poky examples for the Git section by yocto-docs.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   .../overview-manual/development-environment.rst    | 74 ++++++++++------------
>   1 file changed, 35 insertions(+), 39 deletions(-)
> 
> diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
> index ab9bd084c..7eb57f12f 100644
> --- a/documentation/overview-manual/development-environment.rst
> +++ b/documentation/overview-manual/development-environment.rst
> @@ -148,38 +148,35 @@ code browser is organized into categories by function such as IDE
>   Plugins, Matchbox, Poky, Yocto Linux Kernel, and so forth. From the
>   interface, you can click on any particular item in the "Name" column and
>   see the URL at the bottom of the page that you need to clone a Git
> -repository for that particular item. Having a local Git repository of
> -the :term:`Source Directory`, which
> -is usually named "poky", allows you to make changes, contribute to the
> +repository for that particular item. Having a local Git clones of

s/clones/clone/?

> +these repositories allows you to make changes, contribute to the
>   history, and ultimately enhance the Yocto Project's tools, Board Support
>   Packages, and so forth.
>   
>   For any supported release of Yocto Project, you can also go to the
>   :yocto_home:`Yocto Project Website <>` and select the "DOWNLOADS"
> -item from the "SOFTWARE" menu and get a released tarball of the ``poky``
> -repository, any supported BSP tarball, or Yocto Project tools. Unpacking
> +item from the "SOFTWARE" menu and get a released tarball of the
> +repositories, any supported BSP tarball, or Yocto Project tools. Unpacking

Improper instructions, the SOFTWARE menu doesn't exist anymore.

I'm assuming we want to link at 
https://www.yoctoproject.org/development/releases/?

>   these tarballs gives you a snapshot of the released files.
>   
>   .. note::
>   
>      -  The recommended method for setting up the Yocto Project
> -      :term:`Source Directory` and the files
> -      for supported BSPs (e.g., ``meta-intel``) is to use
> -      :ref:`overview-manual/development-environment:git`
> +      is to use :ref:`overview-manual/development-environment:git`
>         to create a local copy of the upstream repositories.
>   
>      -  Be sure to always work in matching branches for both the selected
> -      BSP repository and the Source Directory (i.e. ``poky``)
> -      repository. For example, if you have checked out the "&DISTRO_NAME_NO_CAP;"
> -      branch of ``poky`` and you are going to use ``meta-intel``, be
> +      BSP repository and the :term:`OpenEmbedded-Core (OE-Core)` and

Replace first "and " with ", "

> +      :term:`BitBake` repositories. For example, if you have checked out the "&DISTRO_NAME_NO_CAP;"

Do not use this branch as it will never exist as it points to the name 
of the not-yet-released version. You want to use 
DISTRO_NAME_NO_CAP_MINUS_ONE likely (or DISTRO_NAME_NO_CAP_LTS).

> +      branch of :term:`OpenEmbedded-Core (OE-Core)` and you are going to use ``meta-intel``, be
>         sure to checkout the "&DISTRO_NAME_NO_CAP;" branch of ``meta-intel``.
>   

Same here ^.

>   In summary, here is where you can get the project files needed for
>   development:
>   
> --  :yocto_git:`Source Repositories: <>` This area contains Poky, Yocto
> -   documentation, metadata layers, and Linux kernel. You can create local
> -   copies of Git repositories for each of these areas.
> +-  :yocto_git:`Source Repositories: <>` This area contains ``meta-yocto``, Yocto
> +   documentation, metadata layers. You can create local copies of Git

If you remove the Linux kernel (why?), then add " and" before "metadata 
layers".

> +   repositories for each of these areas.
>   
>      .. image:: figures/source-repos.png
>         :width: 100%
> @@ -230,11 +227,11 @@ and so forth.
>      ":doc:`/contributor-guide/identify-component`"
>      section of the Yocto Project and OpenEmbedded Contributor Guide.
>   
> -The Yocto Project ``poky`` Git repository also has an upstream
> -contribution Git repository named ``poky-contrib``. You can see all the
> +The Yocto Project Git repositories may also have an upstream
> +contribution Git repository suffixed with ``-contrib``. You can see all the
>   branches in this repository using the web interface of the

You mention there can be multiple repositories but here you say "this 
repository" which is confusing. Maybe use one of the contrib git repos 
as example.

> -:yocto_git:`Source Repositories <>` organized within the "Poky Support"
> -area. These branches hold changes (commits) to the project that have
> +:yocto_git:`Source Repositories <>`.
> +These branches hold changes (commits) to the project that have
>   been submitted or committed by the Yocto Project development team and by
>   community members who contribute to the project. The maintainer
>   determines if the changes are qualified to be moved from the "contrib"
> @@ -323,7 +320,7 @@ Book <https://book.git-scm.com/>`__.
>      software on which to develop. The Yocto Project has two scripts named
>      ``create-pull-request`` and ``send-pull-request`` that ship with the
>      release to facilitate this workflow. You can find these scripts in
> -   the ``scripts`` folder of the :term:`Source Directory`. For information
> +   the ``scripts`` folder of :term:`OpenEmbedded-Core (OE-Core)`. For information
>      on how to use these scripts, see the
>      ":ref:`contributor-guide/submit-changes:using scripts to push a change upstream and request a pull`"
>      section in the Yocto Project and OpenEmbedded Contributor Guide.
> @@ -377,7 +374,7 @@ local experimentation on projects as you develop changes or new
>   features.
>   
>   A Git repository represents all development efforts for a given project.
> -For example, the Git repository ``poky`` contains all changes and
> +For example, the Git repository :yocto_git:`yocto-docs </yocto-docs>` contains all changes and
>   developments for that repository over the course of its entire life.
>   That means that all changes that make up all releases are captured. The
>   repository maintains a complete history of changes.
> @@ -390,10 +387,10 @@ locally.
>   
>   It is important to understand that Git tracks content change and not
>   files. Git uses "branches" to organize different development efforts.
> -For example, the ``poky`` repository has several branches that include
> +For example, the :yocto_git:`yocto-docs </yocto-docs>` repository has several branches that include
>   the current "&DISTRO_NAME_NO_CAP;" branch, the "master" branch, and many

DISTRO_NAME_NO_CAP is wrong here, it's the not-yet-released version. We 
shouldn't be using that (or set_versions.py doesn't work right now). Or 
is it just wrong for the "master" branch of the docs maybe? Still, 
people will likely reach the official docs through the master branch? 
Should we show a warning on the docs for the master branch stating this 
applies only to unreleased software?

>   branches for past Yocto Project releases. You can see all the branches
> -by going to :yocto_git:`/poky/` and clicking on the
> +by going to :yocto_git:`yocto-docs </yocto-docs/>` and clicking on the
>   ``[...]`` link beneath the "Branch" heading.
>   
>   Each of these branches represents a specific area of development. The
> @@ -409,15 +406,15 @@ development branch in the repository. To help illustrate, consider the
>   following example Git commands::
>   
>      $ cd ~
> -   $ git clone git://git.yoctoproject.org/poky -b &DISTRO_NAME_NO_CAP;
> +   $ git clone git://git.yoctoproject.org/yocto-docs -b &DISTRO_NAME_NO_CAP;
>   

This for sure won't work as the branch doesn't exist. Won't repeat the 
same argument throughout this file, but there are many other instances.

>   In the previous example
>   after moving to the home directory, the ``git clone`` command creates a
> -local copy of the upstream ``poky`` Git repository and checks out a
> +local copy of the upstream ``yocto-docs`` Git repository and checks out a
>   local branch named "&DISTRO_NAME_NO_CAP;", which tracks the upstream
>   "origin/&DISTRO_NAME_NO_CAP;" branch. Changes you make while in this
>   branch would ultimately affect the upstream "&DISTRO_NAME_NO_CAP;" branch
> -of the ``poky`` repository.
> +of the ``yocto-docs`` repository.
>   
>   It is important to understand that when you create and checkout a local
>   working branch based on a branch name, your local environment matches
> @@ -432,13 +429,12 @@ Yocto Project Release.
>   Git uses "tags" to mark specific changes in a repository branch
>   structure. Typically, a tag is used to mark a special point such as the
>   final change (or commit) before a project is released. You can see the
> -tags used with the ``poky`` Git repository by going to :yocto_git:`/poky/`
> +tags used with the ``yocto-docs`` Git repository by going to :yocto_git:`/yocto-docs/`
>   and clicking on the ``[...]`` link beneath the "Tag" heading.
>   
> -Some key tags for the ``poky`` repository are ``jethro-14.0.3``,
> -``morty-16.0.1``, ``pyro-17.0.0``, and
> -``&DISTRO_NAME_NO_CAP;-&DISTRO;``. These tags represent Yocto Project
> -releases.
> +Some key tags for the ``yocto-docs`` repository are ``kirkstone-4.0.30``,
> +``scarthgap-5.0.1``, and ``&DISTRO_NAME_NO_CAP;-&DISTRO;``. These tags represent
> +Yocto Project releases.
>   
>   When you create a local copy of the Git repository, you also have access
>   to all the tags in the upstream repository. Similar to branches, you can
> @@ -449,19 +445,19 @@ The most common use is to checkout a working branch that matches a
>   specific Yocto Project release. Here is an example::
>   
>      $ cd ~
> -   $ git clone git://git.yoctoproject.org/poky
> -   $ cd poky
> +   $ git clone git://git.yoctoproject.org/yocto-docs
> +   $ cd yocto-docs
>      $ git fetch --tags
> -   $ git checkout tags/rocko-18.0.0 -b my_rocko-18.0.0
> +   $ git checkout tags/&DISTRO_NAME_NO_CAP;-&DISTRO; -b my_&DISTRO_NAME_NO_CAP;-&DISTRO;
>   
>   In this example, the name
>   of the top-level directory of your local Yocto Project repository is
> -``poky``. After moving to the ``poky`` directory, the ``git fetch``
> +``yocto-docs``. After moving to the ``yocto-docs`` directory, the ``git fetch``
>   command makes all the upstream tags available locally in your
>   repository. Finally, the ``git checkout`` command creates and checks out
> -a branch named "my-rocko-18.0.0" that is based on the upstream branch
> +a branch named "my_&DISTRO_NAME_NO_CAP;-&DISTRO;" that is based on the upstream branch
>   whose "HEAD" matches the commit in the repository associated with the
> -"rocko-18.0.0" tag. The files in your repository now exactly match that
> +"&DISTRO_NAME_NO_CAP;-&DISTRO;" tag. The files in your repository now exactly match that
>   particular Yocto Project release as it is tagged in the upstream Git
>   repository. It is important to understand that when you create and
>   checkout a local working branch based on a tag, your environment matches
> @@ -596,7 +592,7 @@ MIT license :wikipedia:`here <MIT_License>`.
>   
>   When you build an image using the Yocto Project, the build process uses
>   a known list of licenses to ensure compliance. You can find this list in
> -the :term:`Source Directory` at ``meta/files/common-licenses``. Once the
> +:term:`OpenEmbedded-Core (OE-Core)` at ``meta/files/common-licenses``. Once the

suggestion: Provide an :oe_git: link to it?

>   build completes, the list of all licenses found and used during that build
>   are kept in the :term:`Build Directory` at ``tmp/deploy/licenses``.
>   
> @@ -617,8 +613,8 @@ Source Definition and the effort for reviewing and approving licenses
>   that conform to the Open Source Definition (OSD).
>   
>   You can find a list of the combined SPDX and OSI licenses that the Yocto
> -Project uses in the ``meta/files/common-licenses`` directory in your
> -:term:`Source Directory`.
> +Project uses in the ``meta/files/common-licenses`` directory in

suggestion: DItto.

Cheers,
Quentin

