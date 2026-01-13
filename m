Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5570AD2F326
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:13:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61389.1768317221601310898
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XxKf5MUw;
 spf=pass (domain: cherry.de, ip: 52.101.70.39, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNaIL5SFcLr5628PJANKVwQnEZ/JLTM3JgbkbUUOarwG7FrN9Pmh682nPWqMDqFPqlNVO2UYmoQo7FYnZaDK2tZrcNHvoXJmotQf6HzpDKfQz05n4EpTBizTSiVMQ8BXiQBvzbHYe59m2fcJ0675kIYQbNIwFY/u6nSnLFFZqhxpIFdnf1XxYrgcBbzcGdoOkSZfg0N2tnq1zuntqydkw1dxWDsMSFyMG4xzzkNVLVqO06kFyll7ZnWL07mPtZfqFYW7QwP8impfAu6ZGPDmBqJiwvT3dHRcu2GAR/lty35VdKck6A1jSMWRaDiX8SqXbSzZEbjROe6apWUp3KT+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYvxWsKYtVPutuLmyPEktMn7T03jnhez3Gzorp2Ep/4=;
 b=did/XKjUECv247BqLQZZBw3z8YCm4s5tXduIZJWmDiu9fZTtoZMraU4A2YnpRdnw1SwAzs7CIz/pdheI/aJX+JH0/zrF96SplA+XRJZuLoYNbYoAqRUYhRSodEnp9eAm6IRiLF+AbT7sWUOn/Sab3RfL7lzG5KCV3+pIxMrYUoe7wy/enPJcJ+U4X++UL+PKqzqvFYwNZCuabWOAcrRJRnNGAkgs+BHyzhCehltvT41UMA8XE9wjooaXFeQyHl56ijJ7WdMexpMEi7on1S7nDTozsaM9FCbm2UfO/QTWL8l0WP1sYhigdF0OhfYIp0spQj9tVIDDSMmr/AXw5+yBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYvxWsKYtVPutuLmyPEktMn7T03jnhez3Gzorp2Ep/4=;
 b=XxKf5MUwqMgffb8Frw3SBr5j+MCGnRGWmCSReBT8+uif3PohbrWPy8X8sWapJcDAa84/yv8eDRiUTDx7VqmbZxjU6z+9PJi+D7OzdjCCqw+5x/0+87VC18f9PWsc8PYqs4nNgv4iztDZx9xbGbAZ+mk8wT9qaRO/Ugd3dOFk9YI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8864.eurprd04.prod.outlook.com (2603:10a6:102:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 15:13:36 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:13:36 +0000
Message-ID: <6c3ede34-2810-4430-8afa-d0548ac831f9@cherry.de>
Date: Tue, 13 Jan 2026 16:13:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 45/53] ref-manual/devtool-reference.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-45-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-45-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 2113bbfe-d07b-4ecd-5ea0-08de52b65338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RllMZFlRcGFoazNRZXRyUDdBSWVuWG9hQ1VoTysrZHhRUC9KdFRzSitPdDVM?=
 =?utf-8?B?b0RoMm1rNU40M0pLUTBqa0JnVDhmL2xwZUhScEhZS0sxVTMyTld6YmoySlN2?=
 =?utf-8?B?ZENBSnQwNEVxMU92b3hyQkdYMzhFRUNSeks2QmRzUXRGYWt4MnBWVFJraFRH?=
 =?utf-8?B?UXhCOTVXdFZieDIvV0s2N3pjKyswc2llTXV6Nld3cSsyVU5nRTBWWlFxanBM?=
 =?utf-8?B?SmU2NkRia21kQ3dLd2NvZVRpeW1pR3RjNHpLd3Y2bGhBT3ZuOXM5UndSTGQz?=
 =?utf-8?B?c3EvaTd1M2FVcUVIbEFLb245OWJwN2h5ZzVjdkduVjZ6blUrSE4vYnJSdkxV?=
 =?utf-8?B?QSt4UUMxTW85djRsQjNaLzU1aW9qNTNpVmVBd05LQzFXa1V4Nk12ZDd5MExY?=
 =?utf-8?B?a0FPVWtEMkhwMmdNRXFFcnNsY2w5a3FzNXRqY3lLWkZ2d1ZiNWllV3lVUTdl?=
 =?utf-8?B?ZHl1d3dGTDA2UEFnMVpHV3dUa1Q4SGhHWFRnaUs4VU1LdXFrVHI2RGsrZ3Ba?=
 =?utf-8?B?UytkS1BYb1RkL0Z3SU1nVjRzdklqbXFwbXdoazk1SHJVemxGR0xxSlFrU2Zz?=
 =?utf-8?B?RkU5Ykxzb2lyTzc3M0R2eFZ2ejJrR2F6QUVxUmpDNVJmU3Z0NzlmaUlya2JP?=
 =?utf-8?B?ajhoc1N4ZGt0c1VCNmZDVmNreEJLTTQxUi8zNDA1M1ArN0hUcnhNYnVFeFNP?=
 =?utf-8?B?WU1jcUJ3dTJUdjNOb29KKzY1R1BFR29KQld2QXJ6L1doVHphWWdQc2tIVTdn?=
 =?utf-8?B?WHVPa3ZzT245NlgzVzNKUVcyT3RVTi94OVJ6YzlMNHlXdXRSR0JOMGZLRFRs?=
 =?utf-8?B?Nzh5eHJKdVhreGx1TE9aWjdINnNFdXlIS1BPU3hvbFRMWXdCZzlTZXQxdWNI?=
 =?utf-8?B?L0ZjWllqcExaVVYxQzdpa1FyR1ZVbGNFTWZlVkVhSXpSdGhaaXdpcjk1Slhx?=
 =?utf-8?B?ZE9sS3JWMFNFZVNacG0vY1JTVnhSM3RTdCtuRFpzWWVKVlptWTBsc3lyNkNv?=
 =?utf-8?B?WlFyY3U3Q050RVdFcmZLM0xKYVZMREVJTFRxUHBPUjZMRjk3WG1XcW5SWHpF?=
 =?utf-8?B?TVN6ZzdyWUljZW1pVTUxbEdkTExqL1F4bXB1WVBwcjkwZkd5R3dDWG9ZTGlM?=
 =?utf-8?B?Um5xaUFYdWN1S1FtOHF1TzJZVDVvVkVPMHZLL2NVZU5tYnk1ejMwZk91OFdX?=
 =?utf-8?B?OG83QTBIQys3cnVST1pCdWJ0M0ViVnI2VFVPSUp6MEh4cnFEdU1TMVNya296?=
 =?utf-8?B?TjEwQ0VxWlhUZnpBaDdnWm1iTWZPaTVEOU4ydFhJZnk1N3NKUksrRU5ad25l?=
 =?utf-8?B?dWZyK3M0SDRRY1dKVjY5MXprYlFmalpkbjFRNEtoenBGMmVzUkZtcE83ZS9I?=
 =?utf-8?B?eXBNR2VEVUNJYmRpeVRnMlFqd3g2c2M4SXdTOHlGYUdFWVdBenFrdEFTbnpM?=
 =?utf-8?B?VzZ0d2lUMUxlN05WYVZJTHovZjN3cjRPSDBsdEE4akV6S1ZNWFN4UWVSYkdW?=
 =?utf-8?B?MmFCNnhyT1RobEVGQUI3MnlMaWFhUkEzS2NvYUlPekM3RnFqV2dwZm9yUDdt?=
 =?utf-8?B?QXRwY1pvWkQ3bE1DNlFzMGlhd004K3d5TTF6dC81Y2xVYkJxQTNWK3F1OTBS?=
 =?utf-8?B?c1BhTmtDU1RXNGZNOFNXcUV6UWcrcGg5T1kvdk9ocGNGci85MWpXdkJrcWZR?=
 =?utf-8?B?VWg0eFU4M3cyMmYxcENrbGJQYUlqMGxvV01HSVFlZVAyMXJReEgzR2NaWW5s?=
 =?utf-8?B?aldIdnU5blAzUm1Fbi9YOGtKSFBxRVphRFR5SktiQjlQV1JURC83UWRJTW9q?=
 =?utf-8?B?eG8yOU5QOUNIYTVWSHNqSTZUNGRTUEwrUzlyM01sOCs2V3QyczhTbVErZHZv?=
 =?utf-8?B?dUVNYlRYR1Nra2Q1RHZQeWovOXg5QXdZK0dVaGNydTZUQWdHTlRsWG9wMThG?=
 =?utf-8?Q?s+smC6bETEI/GS+G95GwHOAKrYfQU1qN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVlCTS9LMkJGZTc0UjFTSzhFeEdBeDBqR29TeGZ6eWMwSWhPSE5wQ0xzK2dq?=
 =?utf-8?B?SmlBOGVmVnhwTjJQeXJuVzhhOVpWZ2JnN2JLaHFNSzNMRmVPYVM0Z2ZMVi9L?=
 =?utf-8?B?WlVsVUlZc1hrNkxoNXZ0cjArRlIyM3I2My9QQlBpQ1lHVGhXMytTZG8ybWli?=
 =?utf-8?B?TFVzMXlmeURBZlVpTE92ZXNaUER0WEtSYTlFWnRuRWFteVVDQlQ3UzZCdGs5?=
 =?utf-8?B?Q21UWHR6cEE0WWs2eXJvOVBNeVAxa2lmZVp3eEZvbG4vM0NTMU5mT01tekFp?=
 =?utf-8?B?Q0xQZnl2Vk16M1h2MTgwVEpzVklwallxOHIwaTVRYmFPeVB4OElnbmF5MHpU?=
 =?utf-8?B?MUhOUU1aMzJ2c29vSWFQV1RXK0ptbjF4V3JqVm1IaFE4dzVpNFNFR09PMXdW?=
 =?utf-8?B?OXZBRmprcU9ScHhRZW9lSW9DRHVFK3V1ZlQ2aUloOXd4dUMwRGFLSEw2bFAx?=
 =?utf-8?B?SUtXN0V2RGtyM0Fob05SWlh6aHBtZXFxK0YzZEhmWmE0TVZDQk9LVExjTWNq?=
 =?utf-8?B?aTYyU20wRnFJQjVYZ1NTZ1VhVzZaR3l0cnJCRi9OMDZEUG1qcVFreUU0UW9k?=
 =?utf-8?B?UlkzaVF0MkVoZlpXSUF0YllEek11eVZIME5SMGR1b296ekNqZlB5TWhlNGlF?=
 =?utf-8?B?a1pQSWdIajhXWUpocGdGWEVkTGtKcVdVa1VESXQ1WFlyV3Rtd09OSENzcG16?=
 =?utf-8?B?RmRLK0RUbzQrdk5qVnptYVJmYldkNE5PaFcwZkplV0FkRzN4a2U1ZERqb0VZ?=
 =?utf-8?B?aXBFOW0xbHp1N0hUZXdBSEV1Y1laWkJmTXEvVlU3Vi8rRm0vYnNzcWR5NFJK?=
 =?utf-8?B?cEpFVjJjdGh0NWNMSVl6Wlc1UklpTVBBTThCZklDaWR1TjloVkQ3aUVUVjcr?=
 =?utf-8?B?Nmh5TklybkxodFBqWFNHWmlsdjJHQ3I2V0dHbElzNmtONE8ycHZDdzFYT29o?=
 =?utf-8?B?STRqUTBJeHdRd3ZlV21rOUIzVW1yeUQ5TElZNmxzTzFDZURvYTlIbVlxZFBm?=
 =?utf-8?B?bUh1Q2pocjV0Y3FWRStHS3M0ckpDUm5qOVpIbGVSY0dvWFlmdFNuVFNVbjRk?=
 =?utf-8?B?SmZiVzdYUjlvenBoOStqNm1QUWJqN3ZzeDJkVFJBUVNYTytXek5SaG5LZlNM?=
 =?utf-8?B?alRmWDl3TTRKcUQrRjZNRGJuWlExWWlGR3FOWFhrWkt2N0tNQ0E5emRDK0k0?=
 =?utf-8?B?WkdxWFRUaENpSUpTZ3ZmTzBCL3ovMW0vRVlNWmFvNmlaamlmZER4S3pzREhO?=
 =?utf-8?B?bXk2SnNYN3oyU2JYZEF0NzUxS2NNRFFQYS9wSFFkNTQ1dW5mMHAxUGs2NHRD?=
 =?utf-8?B?Y3p5b1RSVGs5a1EyRUZPcTdkNU52ZW43bGFpMXBGbmVYeDhWYmxZelJxeGxr?=
 =?utf-8?B?NmtGSEh3clc1TEVJVHZhMS9rbks5MDVFb2IrUVFqMkc3TS91M0NwUm5RN0Nu?=
 =?utf-8?B?U3RRZUh3NnA5a0xsREVNUTg5bE9UT1JCQ0htUG83UzlvWE9XMjhNc2I3RFdw?=
 =?utf-8?B?dHlhbVl5azJLVkF1SzBEQ3BBZkRNM2g5U2dwcG1wSnlTd3hjeGN3eHlVZ0tH?=
 =?utf-8?B?Sm5ZRzVidDc4NlUrSTJhL1g3SWR4c1o2MVI1ZTBBWGs4STNheGZMSk1PcFZR?=
 =?utf-8?B?cCszbDM1QVhNQXg2dTVLYnh3a0xuaklqSGFEejRNNndXOWFhUEUxNkJKZ2Iz?=
 =?utf-8?B?YjFUZ2tGQmhUS2RQTjVVd0s4WmRyVVNBbktKK1l1T0J1TktEaFE4dzcrdDBY?=
 =?utf-8?B?MDVJUWNqQmFZKzErU2lMRllKdmt2YWF4c00xZEZyZmlqRDMrNDRFeUVtdm5x?=
 =?utf-8?B?WXVBRHcwUGdneGRBV0VMWW5mR2l6aS9oWGVPZWVMMm9HOElmVjBWTkR1ZGRN?=
 =?utf-8?B?MTVrMzB0MFpnRytmTENVNHBIUmNLSE1DYjRlSy9UZXowbGFSdnRhanFUckpK?=
 =?utf-8?B?MG1pQWlPeXlzdHZIODJQb2djUkk2ZERhdFNrVHd4dkNEaWVPdDJxT21Qakc4?=
 =?utf-8?B?blloRFpQQlNKejZSSExERklpV1Q2R2ltazQwTGVZVVJacnZZT1JHNVJqaXRy?=
 =?utf-8?B?TXdrOWkwVlJ3OVpZc3paOHVBV3RrRm9rYlRDeisvWUpybDNJVVIvTG1PUWFX?=
 =?utf-8?B?ZWE1Z3VpeWhKK2RRSkxSeUw2bUt3QzJGcE0vdjN2OHdmZUxrak1GOGp5am5l?=
 =?utf-8?B?Y3F5YXhQOUhPWlRwTjNNemhCZVNTKzl2RGl5VWhBUktLMWYzUjdjN0oyTllO?=
 =?utf-8?B?ZmpNV0ZnWmRub0o2V3U4NTh1MTBHMlRIZk9PSE43WUlucUwwUVQybXdoVVJv?=
 =?utf-8?B?cksvVnVoYU9DeHRYa3NSY1lhck51L0tvbUJkRENZd0loTzlkWjZKUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2113bbfe-d07b-4ecd-5ea0-08de52b65338
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:13:36.7811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vqr2GNbAA+r9ry1RVkCNgKcDmwpu12FuIIPu0wjTDiq8m3P9SL3YAqFkuZH8dndSBbVFRKVeJFGFvj7D6BRA5//Jn6HlH/nILPGrWQ7ayks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8864
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8534

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/devtool-reference.rst | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
> index 5ac567591..69288744a 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -346,7 +346,7 @@ variables in package recipes.
>         mechanisms cannot find the new upstream versions.
>   
>      -  For the ``oe-core`` layer, recipe maintainers come from the
> -      :yocto_git:`maintainers.inc </poky/tree/meta/conf/distro/include/maintainers.inc>`
> +      :oe_git:`maintainers.inc </openembedded-core/tree/meta/conf/distro/include/maintainers.inc>`
>         file.
>   
>      -  If the recipe is using the :ref:`bitbake-user-manual/bitbake-user-manual-fetching:git fetcher (\`\`git://\`\`)`
> @@ -390,7 +390,7 @@ In this example, while a new version is available upstream, you do not
>   want to use it because the dependency on ``cdebconf`` is not easily
>   satisfied. Maintainers can explicit the reason that is shown by adding
>   the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
> -See :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb?h=kirkstone>`
> +See :oe_git:`base-passwd.bb </openembedded-core/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb?
h=kirkstone>`

It's 3.5.52 now. But maybe we should just point at the parent directory 
so it's never outdated?

With that,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

