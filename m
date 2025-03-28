Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049A7C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 16:03:58 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.22])
 by mx.groups.io with SMTP id smtpd.web10.15063.1743177835396952389
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 09:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KjmL8eoJ;
 spf=pass (domain: cherry.de, ip: 40.107.130.22, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMy/3SDFD/f5c1CANnhr7gXlTxSrt1UTCBayXvDw63gecwbJQf9fkhH+jUMH+6KSVj3JWgckAAvPN9JU3z5rCz7dpUZQeNdUD7DSkrseI1zzwAgqD/C6nvsp2mH08/SfeVbzfwmMRBeE6SDystVI34lO0Dm8jMxacFlgTAWzI+oNU0FeRkCet82Aol/o0AFgO4UR3ZfW6Xzag5Dnef+5uVUTcJJ6uF6SsvlHFXo3WWGE84Kk+pU5Ky8gt13NNz+pPaLbVWDrpWMQXUbs4h6BnwFzITLsC+glvHCNe5W1UXnhsrQWvbF/AST1egh91c5C5RJdFIwx7TacN8GGK5HI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJjygR/PlGFHE9u+9rXcZmgDjqaaPDKKvLJIFmL7PYs=;
 b=OQBp/SmY/X0nedYWWppHJ6tpj04bLSFpnXYcFUx8yWeMA+D7SEzHvKue+ScrT1aKsad/S4RGs+DKgIodXVWsff/akwrggHBq4tAVtJqdMhHoVY9y7eNfUuTb47LpGlow50WLjDjtsOP8/2EdegCGcv/BABtmHlWzUfNY94Pxf/4YkKSuNJ25oSU9VU8S5JbFXaYObDzTQguaJl5VKPEmhxwNG0UbIPn8NfCYOGjN1kzhNTW7Ho0UHFVSY7tutcpl/BwmJ1/SsrpAQ7ijtOl9pM+dP3vX/RkiIpAvO/J3TFBPU/3Fxy0uPjkkQVCH8jFP62MrB9THCxG65o+5ZojVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJjygR/PlGFHE9u+9rXcZmgDjqaaPDKKvLJIFmL7PYs=;
 b=KjmL8eoJRkhpA/YUn3pV70JS/nztLK3bTlStNJ8zvTH3XmR5YHhfvF6jYwzoOygJQfsbine34rlKAMfDA9Xo4zk63TLtb+QozDsn4I1XcLE3wk9VO94PZuJbuzPKjEmwNfQLDrYSOCMZlStR/4XNedaF/DcSMtGYu9ZKMfllpMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9457.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 16:03:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 16:03:50 +0000
Message-ID: <83f27b97-7352-469b-a6d2-975a32f59335@cherry.de>
Date: Fri, 28 Mar 2025 17:03:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 11/11]
 migration-guides/{migration,release-note}-5.2: update for 5.2 release
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
 <20250328-release-note-5-2-updates-2-v1-11-c913513e9140@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-11-c913513e9140@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a79818f-1d11-4d14-ab66-08dd6e12216b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZWN3NE02R2NwOTlJQmV3Qm0wbFJsalZBcW1FQ0VmNzdWd3o4d0tNTXFPaGNM?=
 =?utf-8?B?bFRPRU9oSWRvZmt5c2wxc28yZStVcjJJbTl5dGl4eXViRVpXZmk2QTFrU0JB?=
 =?utf-8?B?Y3JhWHNiMklZSy9tY3hEZk45VVBmWEVSQmR4N3RRaEplM1Q2YkJWZFh6YWVv?=
 =?utf-8?B?aTREdm9yY1l0dUZZNnFDUS9MSllPdkhqL2kxMHhyN0syUG9oajFsL1d5SVY5?=
 =?utf-8?B?bGRzNmUrdXI1bFF5eE41YzlQTVE4L3RwOGhsSFJIOC9LK1RsY283Rnd5bElU?=
 =?utf-8?B?TkY1eTFWVnQvVDFtdG8vd2w3enNuWGZiNlY5NmlZQlhDRy9SUTJJMXl5cUZZ?=
 =?utf-8?B?eTRqMENGbkxZeWlYM0VFWG9NVHNCcW1kSlBUb1B0eGIzaGJpVm5CblU2UGcx?=
 =?utf-8?B?MDFQU01JMEpJdTJ6SFNyWFNTNGh5eFg3aGpSZHNFeDJWY3RPanFuVmpRaXJy?=
 =?utf-8?B?V1BZWmVTTU1ueWNOdXJZUk5TSGtkTzFYRDVwRy9jbTNXZjRXRS9NSzlPaDdT?=
 =?utf-8?B?UHRmOVBuSmRVN2krZUZFTTB2OE9kekRLY2hTYVdLSEZqZHF2YXcrNk9aczFv?=
 =?utf-8?B?WlVhb3JYYTBWUHpzdnhJaGN6azlyb2pIbXdOTDJyamQ2bXNUYm9LRldmT0U3?=
 =?utf-8?B?WWpUbjJuY3Mxa09KcFBIVUhTMFFYR3hQOXFqRVJpT0dLdmQ3WmtPNmc0STJq?=
 =?utf-8?B?aTh5YTRBTEhnclVhNXh1NXhUYzJiY3J0L2grMGFRc3ozdldDblBoRDV2SHgv?=
 =?utf-8?B?NTU5ejhPUDZURmVBQ1hjdFJGTlRybGZqSDgrTWhESTc3REdSaTFFRnhId2gz?=
 =?utf-8?B?OUdwMGFCQ0JvcjRPcjZVUDBNUDFZWUg0T2c2d3pLanhpSGRRRGc4OERkOFhi?=
 =?utf-8?B?K290SDZiQTJYOHkvMHRkQ3pJTGdhM3MyV29YczlieEU1d2g3aWkzZGEyOENj?=
 =?utf-8?B?Nmd0YmhZejdMSFlBT2szSEZOMFljRHlFYldGMzZaeUFKMTZoa0o2RWFXbGQz?=
 =?utf-8?B?VzB1Vlh5ZmczNDZneTZ6Q3BXVmhVblZtM0ppNC9ZcUpkWlZjYkoyN1h3dlRz?=
 =?utf-8?B?Znh4QU5wZWZEYUk0VXkxQUFvSm5yRjJRZlhsbE1DN2ZlNDdMZHNqZnhkdHFN?=
 =?utf-8?B?a0ZidThmNHZqTmk1b0ZPbFoxcU9FRzNZZmI4ZVdZRkNiakZpUGdRdHU0NENK?=
 =?utf-8?B?RUpsS0lBS0dQNXBkQjNqSGhuMWE1UzE0Ync2Qjhpcy93bTNFTVdqa1QwMWNw?=
 =?utf-8?B?RkxCTWw0UW5NMGV0Q0g1QUYzZjdKcEVoSGpkMHJ0Q21HcFlyNFFDMjVJb3Bx?=
 =?utf-8?B?cXFWUUc0SDVCNUJYbmhjNE44TXZrajBHNklzaEJMSGhGZ2FyL3MvZ21wUkRB?=
 =?utf-8?B?VFdtZ3hhTW5vNGh5bHgweXZ2cFRhR0RnL3hqMVMvdTFRWG5STzdGdDF0Rjcy?=
 =?utf-8?B?aWVCY0pDcmRRc0hPMm02U3Z4TmdqMkNGd1oyYWhQRjJUdndrMk9xbkJaOE9v?=
 =?utf-8?B?amt0L3dTWXpuYkd3NHJlRkJ3bnJzOThVdHJzcGltbC9MQnZ1cUNpKzFPc2dI?=
 =?utf-8?B?SWV5d29ZQlEyeWdadjJ4Rm9qY3JucmZCTlBvc2Z0S1FxY2d2alpSQ0t4aStC?=
 =?utf-8?B?bnVhbTVJRGxLVWh2TnplZ01qMXRqaUtaWnBwbzhtMHRaRzNCV3pKY2pGU2xo?=
 =?utf-8?B?ZHZuK04zUXFRdzlQSW9RdnJmeHNtZ21SZXJIN2t3ejdkdU5GaXF2emdUNFZ2?=
 =?utf-8?B?TXg1a2tEa0U1RWdTdmtQTkZtbTlIQW5nSHllL1NXaVhPTDBWWXNoLzQ1MFJU?=
 =?utf-8?B?eEtJYS84b2N3QnMxd3l6Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Yk5sRjJTeUtXK3VLR0lwZEp2MDVrUFpGYW1rQ1kwN2dJTDlpM0xONWE1S1pV?=
 =?utf-8?B?ZUlKaHJtVGpkSEszU0FjNXF0NGNQV3BNTkZmZ2FQY2NpbTJIOWRKbm5ndHda?=
 =?utf-8?B?NDFKTlF2VVJ1anVWekdCWGNlSmE2QVdnWmUzdzdOdTJ2T0dFY0lvbW5uSGZ4?=
 =?utf-8?B?ZU1JdkdFWFI0MS82eVkwSERONkdYZXJYNjlEdVR1b0NFZ3VPMXJTRitxd2N2?=
 =?utf-8?B?U2xBREh0a293NnZ1Q0hYREF6RGlGcHd6My9YUXNoaUNKQTVwMVQva2tKSlBC?=
 =?utf-8?B?aUl1YkFFczNEOXVlS3JJM0RtK3pubkpicnNSeWE4N2hjR24xNEx2VXJZRGJz?=
 =?utf-8?B?R1R1L1hNSGhWSjR6UmpTZVNxYzh5WVRmZ01FRWh2ZG5Ccmtwc0VUcGFyVUl5?=
 =?utf-8?B?Sk1LdjVDTWdsdGpSOHovcHA2QVB6bnJRYVZNeVcrekdvUEMxcThwcjVYL1Fj?=
 =?utf-8?B?RHR1RFMzUHNUV3psSmNWL1JuQjM4aVI3ck1sRmxMcityOGxhSVBoWkxieFhZ?=
 =?utf-8?B?aUFwSmFtM2QrNGUrNmtlbG9aTFMzbTUxMS8xb3BTeE5UaW9ZcW8zN1c5M3BE?=
 =?utf-8?B?N0dPcTU1UFIrQW1xRW1JTm1nbHljM215YXdpallqejRWU1I1bzRIN2tMU3pF?=
 =?utf-8?B?NWlQaC96Q0JRSVRZa2sybE54NWtESmhqVmhuT3p3Vmp5MWRlMHArUzNFOGpK?=
 =?utf-8?B?cE9NdG0yLytxWHRndmpsN1VMK3dZbFRuaXdGYkVJQkZYU2tDVDFlWUo1Nlpx?=
 =?utf-8?B?d1k5bDJtNDRseTZGamhqZ1JmY1FadEJ4SC80a0NsaXZNTE04UStYS2pGQ1J2?=
 =?utf-8?B?Q04vY3F4Q2lsTE00ZjZLb0tCM0VZb3JXalJ0Vkt1c0N6azIzYk1leHZkSGxZ?=
 =?utf-8?B?VVQrdGxQWGlGZU8xazRkKzBTeEN5RVN3VnpoSnRhcmoyditUa0I2Z2JRLysy?=
 =?utf-8?B?ajU5bmNyMHU5UERmUXRCOXhBR05rdm4ybWs3Nzk5SzRyVFBVZ09ReWFZWjQ3?=
 =?utf-8?B?Um9tTjR4L1JST0J3VThuZGJIdWw1S2k5ZUVqL2ZYditEMXBLRjRoNE1xVGFI?=
 =?utf-8?B?ZFo1d3ZpWVpGeHV5eGdUdzUzMWhyMDRrTE4zUUtiZUNnN1JKTlVCY0owMmo0?=
 =?utf-8?B?UVcvMWxXVTFlaTBqVkdXMm5hT1RRRER4dXRTZFk2Qzk1WEU5NnR0MGtBOURk?=
 =?utf-8?B?ZFFvYS9xdWVzUGpJbjJrZmo2ZzZqcVpyVlFvVi9uZ2ZEL0FlaEdhNi8wMjk4?=
 =?utf-8?B?Ny8yL05IUkNHMEo0VzdDb2lxSnVPR1hGdW9iSTRBc3dSVkE0K3pKSFJhMTI5?=
 =?utf-8?B?Nmh4alk0cElWZG9SOWxRTStaeUhUQ1lkdjBPQ29qU05JRnNpSlMvMnB3K1gr?=
 =?utf-8?B?RDgxS0ovRFNzQUI4UDBITmRpcE5kSjJIUzBSRUh3MCs0RklqQ3hhOUROZmNm?=
 =?utf-8?B?RStmMnF2ZjBPTWc1a3FTUFdzL3EyeWZRQlhTV2YzeEFESHNsN0Z0T3VqWnlh?=
 =?utf-8?B?SVBNOFZ0dnZDazVzL1FLZUtnU3hSbVpmTjdLZnZpREloSW5aQnhQR0Z0aFBq?=
 =?utf-8?B?dGZpdU9QZ2xDRG85dnBneDJyQ3plQnRzdC9mVnN5cjl0OWQ5YU5KKzc2WEdu?=
 =?utf-8?B?R0orT1JrS3FhSzFYT1Jaa3ZJbGZHYjVrS3I0c3l6TzlibFhVT21kN3FXOU1V?=
 =?utf-8?B?Yk0rTytYSWNVZERVR2FYenpZdEN1RU4rL25CUG1uSllGbVdrUHpza0ZzMnh1?=
 =?utf-8?B?VHNTSTVMUVhvSnREZXB6K1JSRzBaT2J0aWdyeVdMd0hQakgyelVSaVpQejds?=
 =?utf-8?B?czU0RTZoZk1IM3dKREFOaGpOa0lrUk5MYVZwMFFDWDNodVZ1ZnhvcWVtVjg1?=
 =?utf-8?B?MFNNZ0JyTTN0RVpqT0x0TjBTUmRZUGxPQnIzQW1leldEeEJZMXBXSkhGWi8y?=
 =?utf-8?B?YW5wcjBLQS9RSHFIVzZZYTlwYmIvNnRLd21uSHVmSUhXVXhPM05Dcll1WGdT?=
 =?utf-8?B?cWFVZ2lVNEJFbXpJZCtuTkxNZTNjS3ZmLzViY1J0RmlUeWFMUG1LMjloUnB2?=
 =?utf-8?B?YjJjLzNOSERCaU1FVmM5UlZ1UDBxamJDUmtNZG5VazI1VkIxS2gzSkU5VTJp?=
 =?utf-8?B?RGxpWVViRnBNY1MxQU5HbG8rL0VnMWhYMjZtN1U1czUyVS9wTzY1SW5SWVd0?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a79818f-1d11-4d14-ab66-08dd6e12216b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 16:03:50.6963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8O+unJCZYWve0oFbSXhHczdEbBhAuh2XC0W8uxv4FEYDe6tIc0f/NtoH0MIuaEcS+toXzbQHouTN6z++TNh6wQ9YkgKh4unl2dI5AJQpjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9457
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 16:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6679

Hi Antonin,

On 3/28/25 2:07 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Document changes between 0e91a1dabf27 ("adwaita-icon-theme: upgrade 47.0
> -> 48.0") up to b3c21a23ad3a ("migration-guides/release-notes-5.2:
> update for upcoming 5.2 release") in Poky.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.2.rst   | 26 ++++++++++++++++++++++
>   .../migration-guides/release-notes-5.2.rst         | 22 ++++++++++++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index 59a2782f2..c54f054c7 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -178,6 +178,32 @@ This should now be replaced by::
>   
>      UBOOT_ENTRYPOINT ?= "0x20008000"
>   
> +
> +Git fetcher: support for multiple revisions per URL removed
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The support for having multiple Git revisions per URL in :term:`SRC_URI` was
> +removed from BitBake, which means the following syntax is not supported
> +anymore::
> +
> +   SRC_URI = "git://some.host/somepath;branch=branchX,branchY;name=nameX,nameY"
> +   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
> +   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
> +
> +This was rarely used in the core repositories, and this removal simplifies the
> +code logic in several places.
> +

Can we suggest the user how to transition away from that? What was this 
even supposed to do?

> +Git fetcher: Branch parameter now required in :term:`SRC_URI`
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The ``branch`` parameter is now required when specifying a Git repository in
> +:term:`SRC_URI`, for example::
> +
> +   SRC_URI = "git://some.host/somepath;branch=branchX"
> +
> +A missing ``branch`` parameter used to produce a warning, and will now produce
> +an error.
> +

You can specify that it used to default to "master" when it was missing, 
so if the recipe was building without, you likely want to have 
;branch=master in there? (I haven't re-checked but I believe that's the 
case?).

>   Recipe changes
>   ~~~~~~~~~~~~~~
>   
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> index cbef0d686..05fc92e85 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -43,6 +43,13 @@ New Features / Enhancements in |yocto-ver|
>         This can be used for authentication of private NPM registries, among other
>         uses.
>   
> +   -  The :term:`GRUB_MKIMAGE_OPTS` can be used to control the flags to the
> +      ``grub-mkimage`` command in the context of the Grub recipe (``grub-efi``).

It should be GRUB, all uppercase? https://en.wikipedia.org/wiki/GNU_GRUB

> +
> +   -  The :term:`SPDX_PACKAGE_VERSION` variable controls the package version as
> +      seen in the SPDX 3.0 JSON output (``software_packageVersion``). The default
> +      value for this variable is :term:`PV`.
> +

Would recommend not giving the default value here if it's already in the 
glossary, let's avoid having to modify multiple places if this gets 
changed in the future.

>   -  Kernel-related changes:
>   
>      -  :ref:`ref-classes-cml1`: in :ref:`ref-tasks-diffconfig`, do not override
> @@ -81,6 +88,10 @@ New Features / Enhancements in |yocto-ver|
>          -  ``qcom-x1e80100-lenovo-t14s-g6-adreno``
>          -  ``qcom-x1e80100-lenovo-t14s-g6-audio``
>          -  ``qcom-x1e80100-lenovo-t14s-g6-compute``
> +       -  ``qcom-adreno-a623``
> +       -  ``qcom-qcs8300-adreno``
> +       -  ``qca-qca2066``
> +       -  ``qcom-adreno-a2xx``

The git diff indentation seems odd, but maybe everything;s fine (a case 
of tabs vs spaces maybe?).

>   
>      -  ``linux-firmware``: split ``amgpu``, ``ath10k``, ``ath11k`` and ``ath12k``
>         in separate packages.
> @@ -208,6 +219,10 @@ New Features / Enhancements in |yocto-ver|
>      -  ``rust-target-config``: Update the data layout for the *x86-64* target, as
>         it was different in Rust from LLVM, which produced a data layout error.
>   
> +   -  The :term:`PACKAGECONFIG_CONFARGS` value if now passed to the ``cargo
> +      build`` command, which means that Rust recipes can now properly define
> +      their :term:`PACKAGECONFIG` configuration.
> +
>   -  Wic Image Creator changes:
>   
>      -  Allow the ``--exclude-path`` option to exclude symlinks.
> @@ -330,6 +345,8 @@ New Features / Enhancements in |yocto-ver|
>         -  ``wget``: increase timeout to 100s from 30s to match CDN worst
>            response time.
>   
> +      -  ``wget``: Support setting :term:`PV` in :term:`SRC_URI`.
> +

Sorry, don't understand what that means? Do you have a commit to refer to?

>         -  Add support for fast initial shallow fetch. The fetcher will prefer an
>            initial shallow clone, but will re-utilize an existing bare clone if
>            there is one. If the remote server does not allow shallow fetches, the
> @@ -494,6 +511,8 @@ New Features / Enhancements in |yocto-ver|
>      -  ``systemd``: ``apparmor``, ``fido``, ``mountfsd``, ``nsresourced``
>      -  ``ovmf``: ``debug``
>      -  ``webkitgtk``: ``assertions``
> +   -  ``iproute2``: ``iptables``
> +   -  ``man-db``: ``col``
>   

odd indentation in git diff but maybe just a tabs vs space issue?

Cheers,
Quentin

