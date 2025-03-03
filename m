Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B117CC282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:41:06 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.54])
 by mx.groups.io with SMTP id smtpd.web10.58566.1741020063016396912
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 08:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HiVqSw/L;
 spf=pass (domain: cherry.de, ip: 52.101.66.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bn+PVCe5Ncj/a52GpagID8kbRmS94jBpgiVsJLikhcKTd3Pjzwgae5f4qJIzAA1SWbbFySXsBOONxadT5inPH98B0KkglHOMlU4K+B9jPH3umiNZoMd0vZjfoH6Ij2GxFFKn8J6YyMnaih/omSNFeeQAht7g94tnfxjw9+AeouEGpjbs4u6tEiFlPBPtOogchXqnKCUXY4EFJq0yHxPDoX+amRmJGRQayIleBIZXiIdI9gF7kFuLDpaJ7NT7GMZnw9dOhCjNdQAFRDo0gpYq152TtyLk3iX4BLubs9NHnNxxm1bLBihanxq5ZgWHPzgtuCDVbJwiwdNWrRdEZQXNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVGWUdxNZNuxFz3yIyPkAIA6VhF9vXgbIEyzs72YSVc=;
 b=NTGIXgZYeHA3OnJSOtWyGzEOUyQ46Z7VJKuqO/xr2rJU2kw7EwcCUETsW7AQv5HsgqiecAkeFoY4XBUg6L1gKDl6+HSBVpqPxjdhx5kZkiBRIjVBE+Gmic15LIKbV2Z6EXRtQwylhtorcXq8bnuW5G3/anU1QoSA89RjEqyA8wNfvhHLEjD9vYNu6uap2RyVoXmdrhXMYG03bECcmvf0X/SkkndkB8RCFOsrKLj2NzCs1DBmDIFs/suALxndSiJVtOfg3Xe6get1OhKXZZ5fOYcM3BXfpYnyfNllRa3AiIcHHt68iPhFdo2HJkNc4nYo8WgxZk9TIyo33ybu/sWvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVGWUdxNZNuxFz3yIyPkAIA6VhF9vXgbIEyzs72YSVc=;
 b=HiVqSw/Lq3Rdasgvy5a2SiGr2U+RTf7gbomEwlhQsUh8l/KXySy1uCUgE3HZ3w07VDyRV86jjgu9exkgr30iS88knLw2kxbZXNlkiDphCEJTYPE8crm3YPvQenJv6MFcgRFbNjZ0pbM2/kDGEaK2v7vfLn0/bnU2gPMzZ/HWlE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8151.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 16:40:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:40:59 +0000
Message-ID: <423ecc6e-841b-4edf-9824-debea1db5fa0@cherry.de>
Date: Mon, 3 Mar 2025 17:40:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables: document KMETA* and
 KCONF_AUDIT* variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250225-kmeta-audit-vars-v1-1-d39d3e253b00@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250225-kmeta-audit-vars-v1-1-d39d3e253b00@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 5611ba88-087c-4107-4971-08dd5a722d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aDU0a0tUNWZmaXNvYkxVVE5ycC9kblpvWnFGS3h4TjNEQkdVYTNNU0RpS015?=
 =?utf-8?B?dERsQzVYOERtcVJ2TktTUlgwZVBhcldtLzRDakZ4NWxFak9aUnJoY0lQSEVJ?=
 =?utf-8?B?a2xLVUNReGJwS3Bsekk2YnJMOFlybVdoQTB4T1FPbXo4bitxVWhSd01kUlgz?=
 =?utf-8?B?YWdER1pCTGcxbzBSbVVXakNtK3BXcktBaExteks5QjQ4cEdyREFRNmM4V0ta?=
 =?utf-8?B?NzFXTkI5akI3Vmx0eDBrbXdrSEpDS3dPRnA0K0V0cjljdjN3bXdvU2VPSU4z?=
 =?utf-8?B?VVdCbnFPV3ZLNGtuSkZQQmZ3MGpGUHFMOUlic2s2YXM5SHY0S2l2aWVJdml4?=
 =?utf-8?B?bU42YTFGTDBXVithaWZjM0hidW04Q2paK0o5clUycWU1T1RQb25YK1pqd2FL?=
 =?utf-8?B?UnZsMkx4QXMrdGZNREQ5ZTRGRXFGSWE1UXBtOFNZOS95UVE1OEtWdi94ZXZO?=
 =?utf-8?B?T2JHeU9rcEdEOUI1UHc4T1E3bWh6aVIyTkVJOHFVblJCOWxqeEs3MmVnY0RR?=
 =?utf-8?B?ZVMyR3Y3L2NvMDhnRmRZU3I2OFBaK1I1SXBzZzl2Q2F0M1dMaTJyK05XZSsw?=
 =?utf-8?B?djFjVWZGZG9nakFyVTB2YTQvZHVNSHZuMWVQVk9yMlY5MTBZRkFualFISnNp?=
 =?utf-8?B?QTFlTC9ieXMzeWxBQkRxa2E3Zld2VWxsSEpIQ1VFeElkV2lpMlh5aXRUaUpW?=
 =?utf-8?B?T0NtenMxOUtJcFp5NmZidEMxbGRjYWlCYmYremFsa2hIaHZhMExoa0VCVkdt?=
 =?utf-8?B?cnJpaGxCbnlGcFAxRGVNMytCTXVxeU9RTnNwWlJIZHBkd05icVYyWmJrU01n?=
 =?utf-8?B?aW5YR1FGWkZsUDVhNURxam12YUNNT2xlREhidlQyZlZDTG1lL1ZybVRFeXBC?=
 =?utf-8?B?UUpnMmNpNXFvQ0dJaDg3MXVJYWV6WDF5OWhJMG4vY05vUHFVbFF1S3Q5OVV5?=
 =?utf-8?B?Ujc5T0luU3hYeDEwWEZWZnBPb2RzTHI4cG9DVEVqZEE0L0J6T0xZbFJoY2pw?=
 =?utf-8?B?Mjh6My9xM2lvWGUvbDFYZkNyM0VmUHJCdkRyOGFFU2FpQ0d3WVRRWEtueGRh?=
 =?utf-8?B?bHNXT1hSUXdkeUNGNU9ZMXBmcGk2VlpiRXI1Ni93UG1VSTJveUx6NXh6aGlu?=
 =?utf-8?B?VmlLeGJxck1aTGFJVzJqazluZWlLYmhmeldoYk9hY2E5bVBnelZqV21vK1JL?=
 =?utf-8?B?aW1IbjRRQlJqTkc4WWlwdTdHWEVOd25RbWkvd21Vd3VRMXY1ZitVZXAzOU5q?=
 =?utf-8?B?TFZZRFk0amF1cnNkVTNSZE9rZlhLendrQlVpTTBrYXZhY0dMb2JLb1hQaHFG?=
 =?utf-8?B?bVNNQWVYSW5nTVRoald2TEozWTVRT1dKQTd6YjhYUUtTUkhQcFVmOGhPSjdL?=
 =?utf-8?B?ZW5LZDZVN054ZmFBY3Q2Z1hZTVAzYjJudFRZTlBZTXdtbFlWemYzNVBuUUgy?=
 =?utf-8?B?N05xWjQ4VnVOekkySW0yeXhVWnVDR0tZdWZwR3Fjd2FKUVY2TndIa0htUnRh?=
 =?utf-8?B?bDJmaFVTTGdGVG1WTnlBQ2xFR1VHMjdCcGdkR1NZVFY3VDYwS1dqWS8rVGND?=
 =?utf-8?B?dUpZVnRxMmRaM21Icmw3S0xiRFIvZ3VKVktuMFpkZ0d0UWtYWHFuOW5mMnFq?=
 =?utf-8?B?Y0pwUklLOFFxN2wzRUFUbDgyZWk3azZzV3E1SXdMVXBSUVo1UzF4cHpDdk1O?=
 =?utf-8?B?OFR1dG5RZXhsQXpiSmd2c1h0dGwzMUhiK2UxR3lMOW9FeVVBYVlsa0tiQXhm?=
 =?utf-8?B?KzJyTDQ3SVZRRjdzUDQ2WFNVeTVGVGhpMmZJczR5N0FSSFRYV1dQU0Y5NXBW?=
 =?utf-8?B?Q2xxOGhlK2p3RXI4MzBnUnlsbHNVOWkvTjJvTVdWd2VsYnUwbXQzZVJzTFdW?=
 =?utf-8?Q?l1RgZQKO5mjxT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2JZMTJqcTNqNTZtdnNOWTZmdkpCekswV2xLa0Y4dzY1YWJYZ3RNOENDbEVZ?=
 =?utf-8?B?WGdGbW51SldqZEx1NDFtaHgvNG1wNXc5ajRkbFRySmVwZ3lQYU52bWZxNExw?=
 =?utf-8?B?S3BMU3djNG55WEl5U29iMzBwU0FuQmJvM3BrNVdzdGE2cXR0TjdSc0ZlYTMx?=
 =?utf-8?B?VFVDaWVrZFhGUGtJOEZGdFI1dEdYZ0tyTHJ3VSsxbmR6MlJZdnBHaDZyUTVG?=
 =?utf-8?B?c0NFRzlSQkVjSTdkWndFUHdLTWZVdkloUEh1dU9MaFdrQnJISnlIS3ExRjVr?=
 =?utf-8?B?VEVnc1F6WGNPSVV2MFQvYjdRcElUVkJtM2tNR3h6TWpCNVBIK1l0elcreWts?=
 =?utf-8?B?Rk9OTlp6KzVOOGFXTXNjNWFTWnNJTXZyaG1pNEpLRmlpbE1PdTJ6dDZoMGIv?=
 =?utf-8?B?REtjemxtUHlhd0ttSjFwRTZxMVYvdEJ1bEphMHd2VFZTZm55U2JhREF6S3U2?=
 =?utf-8?B?UFdyQ3lTYnVscXlNNk1hTi9Xb3ZlWWlLNFZBeFVTeWEzTTN0QzNYemhKM3Bn?=
 =?utf-8?B?WFVsamFUczhtVzIvdFVuUkxreVhZUXNzQXlwcWdGd1BLTzVoTDd2d0E4MDhi?=
 =?utf-8?B?cWU3bVpEQ2RZaWxVay80eDNXU2t5QkpTejl4UXoxYzZrcmlHc21td0g1WmIr?=
 =?utf-8?B?Z1ZVaGIxajBkSnRHaHprSnNaejdBQzBhZmdQNFptQ0JOZEFtTFlaRWtqaHpx?=
 =?utf-8?B?STR5OGZkMVBYVFJXcFMrZWU0eTN0Um50TWM3clhsOUt6bWM4VGQzbktwdndE?=
 =?utf-8?B?OUorZTF4Mkp3aE5kUUhRZjdKS1pCK291S2lGNy9pT1VTcWhEUm5mQ3ppMHNH?=
 =?utf-8?B?b2x5bWwyQ2s1aFlxL1ZCR3o4NWt4NzZMbWZmRVJOcVdXQk5zQTFHcjZ3R1Uv?=
 =?utf-8?B?K0hsclZsRVpmNllZUzRDYWVVSE4yRm9qcWpOZFR3NXJIM2hTV21vZnE5K2pw?=
 =?utf-8?B?OUMwTEF1UEk1V3RVR1NMUXErZ0FQV3JtVkUxS0NHM2FiOFJMaEJGMGc0SnRh?=
 =?utf-8?B?N1BMQ3JCcTFyZGlpYnhYdUZaTXltdi9uWW9Ea0h0aUk3N0NVV2FRZFZXN21C?=
 =?utf-8?B?YnhhQ1NqQmV6dHA4YTJlbUY0VEtaYzdVL1F4UUJ5bk5TV0YvV3FQbXV2RHg3?=
 =?utf-8?B?Mk41a0JqUzZtL1llVTB3aUJISURMMG9Wd1hBYnlaVk9IMTlKdEhQbU5WOG5D?=
 =?utf-8?B?eC9EVWhINkg0dy9VeUdoN0dFUUkwMnc5bUZ2aFZZRzV1UTJUUjgwbGRNZzBz?=
 =?utf-8?B?eWtibFNIb3ExVXE2ejJ0OWNIU0MrYVlUT1F5YXRtbnY1UThtZHVDODB0NzEv?=
 =?utf-8?B?U2dadm9CWFFrQ3I5V2ZqakJVaGdzZFFvOU5KVmQ2eXJ4NFVmZ1h2V0NPT2cw?=
 =?utf-8?B?NnVhVEFZaEo3aEQvTVFMeVArbVJoVnk2QWcwbGlsemdQZXJmYVZWc0NMbEpz?=
 =?utf-8?B?M3V5WXVwbk9xUmFzYldFeEtscERuNzltUC9GU1NkSHp6YmtRK21jOXJ2clN6?=
 =?utf-8?B?OGM0Y2RqajUzYW9hUjZ6MWhESEZkMEx5THNYSGdmVk9BNHlOajNZZUlpMC9v?=
 =?utf-8?B?ZXpEY0lUUGlJS3NCcUtiUXdmbS9kbWFLU3ZhdzdubzBKckFuMnA1N2Uyd1Ra?=
 =?utf-8?B?K0hnY3huOGNyRDd4MkttMXlxUzJKUThhWFB3bmw1VW1MSEdtQThBSGpUQ1J0?=
 =?utf-8?B?U2szU205QWRpVm5HVm9OUHQrVU5LSGwzQ1NlN3Jra2E0NmhGY3gyeGl6RDhu?=
 =?utf-8?B?ZnUvdVlQa01zclBOV3NiMGYzajRrYVJWeDZ2K2tJNk0xUmNwMDhCK3BpS2E1?=
 =?utf-8?B?REQ0dEk2aXRKekJCVkl1Z0lrekNuWnZiNDJuS0VYQ0plMmVUNlN6QytRa1Fm?=
 =?utf-8?B?S0RIZkJRQ2Y4NktQYnBRMzVyNEVoZ2wrNFhDQnVQWmttVndqNElxM1FkVGdv?=
 =?utf-8?B?MG4wWDUzc1ZZRVFBQkpLeTNjTzl3cm1zQjcxR3ZrU2o5VkRnNExCRUd3cDVu?=
 =?utf-8?B?S3JwamRWTHNZSjZlellTd0FmUVJWSUpFMHk2ajFraGsvQ1FRM2NmY285d3VY?=
 =?utf-8?B?MUJ3bGlWRGdJNjRRK0MwY2JwOFlkdXdSNTgzczI1NzNYMk50SGl2clFnREtB?=
 =?utf-8?B?SkdJcTNLWU16UVh0eFV4ZUEvTFNOb3ZZWmJFWVBUNXhXNzZrUnMxK2N6aHJH?=
 =?utf-8?B?Znc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5611ba88-087c-4107-4971-08dd5a722d9c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:40:59.5494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOz89vudfk5m82y+HU25fqCTHqqeuhWq8BEy4iK1IfTq+MUUx1+qmfIIZtiUnWe4nF3d98EquLYWMco/s/xoThwXgSPNh5llFxpXBKkxKdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8151
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 16:41:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6489

Hi Antonin,

On 2/25/25 2:42 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Document the variables used to control the outcome of the kernel
> configuration auditing done by the kernel-yocto bbclass.
> 
> [YOCTO #13835]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 61 ++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index adbef69d8f39d33be87c5db6688a807156540410..c842774f0d383e34077b2e558c3347f2abcdb7d2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4563,6 +4563,53 @@ system and gives an overview of their function and contents.
>         ":ref:`kernel-dev/common:using an "in-tree" \`\`defconfig\`\` file`"
>         section in the Yocto Project Linux Kernel Development Manual.
>   
> +   :term:`KCONF_AUDIT_LEVEL`
> +      When inheriting the :ref:`ref-classes-kernel-yocto` class, the
> +      :term:`KCONF_AUDIT_LEVEL` variable specifies whether to report Kernel
> +      configuration values that are different from the user-specified value. Its
> +      value is either 0 or 1 (default: 1):
> +
> +      -  0: no reporting is done.
> +
> +      -  1: report the problems as warnings and trigger and error if

s/and/an/ ?

> +         :term:`KMETA_AUDIT_WERROR` is set.
> +

There's also 2!

C.f. comment above the variable default and at the end of 
do_kernel_configme.

> +      For more details see the :ref:`ref-classes-kernel-yocto` class and the
> +      :yocto_git:`symbol_why.py </yocto-kernel-tools/tree/tools/symbol_why.py>`
> +      script in :yocto_git:`yocto-kernel-tools </yocto-kernel-tools>`.
> +

KMETA_AUDIT needs to be anything but the empty string too for this to 
apply, no?

> +   :term:`KCONF_BSP_AUDIT_LEVEL`
> +      When inheriting the :ref:`ref-classes-kernel-yocto` class, the
> +      :term:`KCONF_BSP_AUDIT_LEVEL` variable can be set to report:
> +
> +      #.  User-specified Kernel configurations that did not make it into the final
> +          Kernel configuration.
> +
> +      #.  Configurations defined in multiple input files with differing values.
> +
> +      Its value is a positive integer (default: 0):
> +
> +      -  0: no reporting is done.
> +
> +      -  1: reporting of configuration options that did not make it in the
> +         final configuration is done and is not limited to the current
> +         architecture (``ARCH``) in use.
> +
> +      -  2: reporting of configuration options that did not make it in the
> +         final configuration is done and is strictly limited to the current
> +         architecture (``ARCH``) in use.
> +
> +      -  3: report the problems found when this variable is equals 2, and also

-is

> +         report configurations options defined in multiple input files with
> +         differing values.
> +
> +      For value 1, 2 and 3 an error is produced if :term:`KMETA_AUDIT_WERROR`
> +      is set.
> +
> +      For more details see the :ref:`ref-classes-kernel-yocto` class and the
> +      :yocto_git:`symbol_why.py </yocto-kernel-tools/tree/tools/symbol_why.py>`
> +      script in :yocto_git:`yocto-kernel-tools </yocto-kernel-tools>`.
> +
>      :term:`KCONFIG_MODE`
>         When used with the :ref:`ref-classes-kernel-yocto`
>         class, specifies the kernel configuration values to use for options
> @@ -4967,6 +5014,20 @@ system and gives an overview of their function and contents.
>         However, the OpenEmbedded build system understands the machine as
>         "core2-32-intel-common".
>   
> +   :term:`KMETA_AUDIT`
> +      When inheriting the :ref:`ref-classes-kernel-yocto` class, the
> +      :term:`KMETA_AUDIT` variable enables or disables auditing of Linux Kernel
> +      configuration. The default value for this variable is "yes", and auditing
> +      is enabled. Set this variable to an empty string to disable auditing.
> +
> +   :term:`KMETA_AUDIT_WERROR`
> +      When inheriting the :ref:`ref-classes-kernel-yocto` class and when the

s/and //

and maybe even

s/and when //

> +      :term:`KMETA_AUDIT` variable is set, when the :term:`KMETA_AUDIT_WERROR`

s/, when/ and/ if you take the second search and replace above.

Aside from this, not too familiar with the code and won't have time to 
dig into it, so don't wait for further review from me :)

Cheers,
Quentin

