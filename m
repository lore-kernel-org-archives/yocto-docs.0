Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35829C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:12:27 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.29])
 by mx.groups.io with SMTP id smtpd.web10.12178.1743171139704894145
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 07:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PM5mRsME;
 spf=pass (domain: cherry.de, ip: 52.101.66.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NM9/eCDIndNZjlWjxDioaXHw8tOOCAcVX6nvDIlXPQylr13sUY9wqnASMS54jAnwSP0x+5HcElh2bZ54auQR8lLxJUoLvw0jkKnvwHGFnPhhm7WvUZiQWwUFfIyKoYY2ykq8pKVUsRqpt6w7UUFwmoA/5GIk9S3yZo1q/C7uGZfjzuE3b/FUrmCDKMl0D/AwGFih7dsiCPL5en5cfKsJzi76iwjRzNtjQmctiYwr69WcUTUbb7t2Bzdoj3nh+zIUgcVD3PAFJSoTQcIKSr06L1+GvdArMbZPTGdKR0HCleW9ZFEqhfQSfIdOpNepVAbwfy7N3YJbp9pVQrLdFUdlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Df3EygAOSj5c2mnPMwUteb8Zvda5gxkRu+Z2QrDePGM=;
 b=J6kIFA4S6W3VToCrrQsQ8pZdSKMKvtK1i/IHi7i8r1elc3xZ4Aeke0sV/ORWSdBwPLvX1k5O9p1LiMnQQ/FxFXxwOmuNk3Ndd6QyQW7TXCaQ1Lncaqtsq8dhS5yrzFz1v8SQQu7SGI2skpu4dgwlz4lIrlsfIJ4Y8OLrjKj8zXdCwP2FHCOuc5zztKUnl/H5s4NWX5sMMJKP6YneiH6UFTYEvqXZhgw3rQmn7AiOA3FbAd0ICUKO8/CQ1v92mhWzp9RHMmx2tnLACHDFZLu3/Nc4dSEb4oTRSB4TVc6mI8DX3JhMATyV/23BkAlRvswLguQ5brB0VC/sYNfbyRIOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Df3EygAOSj5c2mnPMwUteb8Zvda5gxkRu+Z2QrDePGM=;
 b=PM5mRsMEfvspOWo7BUKGgdBjygZRQxzX0cuIOkII8ls1nhuFfnrsb+A3INyrY9hda/C4dV6IzqULWbbArCTfo9dBSZC2BQ4NEiVHpmVRAZwyR5hBnpdCSEomtKc54kYjSQEMtmY33kLPaic7MnBJDBKc/UezGTzAaew2XgGIwOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:12:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:12:17 +0000
Message-ID: <62a40ae8-4ff0-4e24-abb4-168aa0c2c7f9@cherry.de>
Date: Fri, 28 Mar 2025 15:12:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 08/12] ref-manual/variables.rst: document
 autotools class related variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
 <20250325-release-note-5-2-updates-v2-8-19f050d61da3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250325-release-note-5-2-updates-v2-8-19f050d61da3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a964a0-61dc-47d5-61e2-08dd6e028bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dDV0QjRTMGd6MldDanRXQTg4N2dnOXJWR2NQY0crM3Q1SVVLb0VkbnhiNklT?=
 =?utf-8?B?UEtRMTkwS1poSE1FRm5WL3Qwa1YrNXl3MXk5TTN3OVdNcXdvVWloeEZFd1pZ?=
 =?utf-8?B?eFNuWE9qcksyNit4dTFBN042WmpxTlZ1WGx2WUluZEVua2tCUzlRLzR6VGx0?=
 =?utf-8?B?RnZLRDRqM1BIWnF1eWtrNEJpV3ZjWFJVVm1vcWxCVDYvaS9tYlpkRzFYRStG?=
 =?utf-8?B?OEFBdHpMaWJCdjlrbGU2RjBxUit4UkRHd3I1NzVvd25NUVJsZWNIT2VHeGJI?=
 =?utf-8?B?czJicWFGRHgzNU9TZWxyL1RFM0tlNHp5Sno3KzdqVGlhbWdPOWRWZFBXSEl6?=
 =?utf-8?B?L2hwQzcvamFBU3Qvc1FieXpNbmxGN2xrVWpLV1dvMFU0QmtOdFdXamdIbG02?=
 =?utf-8?B?eHpwYkd4ZjhjZ1lacWo1dmZrL1lRNmxrYjdFcGZYMFFFVUk3RlluS01uZ1RO?=
 =?utf-8?B?VnJmaEwvUTNHOVdNekUzOXZUU3VOUGQyODBEaHh1YlU3aFovTWFUVk9TeGJT?=
 =?utf-8?B?dkpkNTNhSWNGWG1UbHlqMDlwWm4rdG5OMTBKWGRYRkdVSTRCQVhLaU1HK0Vq?=
 =?utf-8?B?endVcGxoSlJwaVBmNEZhZ2h6TkxkOXg4N3NWK09DbVlnWUFKbE1vNzg0U25x?=
 =?utf-8?B?K2JrZG1QNmJsUld2SlhxaUpwRno2cmdTZjdTUWVVSWVZZ1NNcFIzZFlqNUxY?=
 =?utf-8?B?M2RoSCtaaklWUGpYWDdUQ3R1dHVXMTVaM0puRE1LUTUzbHhNSU1uSGNCVDky?=
 =?utf-8?B?VzU4QUNMWGljNWd6WGtOcDVieTlRWXArUVBhVU5udWdwbDNKY2lTVnQyYlFT?=
 =?utf-8?B?SVBtSEFaNjdzYUJDZ0hqMVU3TXJYR1BnSWs3VThWU1lGU1VpcGN3aFRoVmk4?=
 =?utf-8?B?ZzZmMkNvQ3VicndVd29FbHFiRTZvVzlIdlYzRFhlRmYvUDNqV0NYMUZoN0lu?=
 =?utf-8?B?aW5zT1dxVW1mNThFWGhwbnM0eDA3djc2NWIyTW1qVXFCVm1zTllrVEY0ejFR?=
 =?utf-8?B?bkNTTXFRRG5UQTNXeGdzWkV5ZVdTa29lM1hISmNyU0ZyNjl4dGloRTJwTkdJ?=
 =?utf-8?B?T1d6QUJNSEllRU1VejdxdVpHK0FEdXNQN0pZYnRFc250NUc5QXA1U0JzQ1ZN?=
 =?utf-8?B?VzlBNkx4RWpXVnNWMmJjdjRhUDVjT0xuOE40OW90bWpmcEJKZ3RzTVBCL1Zt?=
 =?utf-8?B?NTMwdmNFVEkxVmlCNnBDZGdjeWZvWFBMTHp2VDUzNHg0Y2hKMGJTb05HT29B?=
 =?utf-8?B?YnFKQkUzZzl5KzkweVZEaElaVDcyL1ZlT1RHVUNDcFRtMWxDSHNuTERXbjBE?=
 =?utf-8?B?UlV5eHIrL0hPWTlQc2FpcXVtRVdselNUcVNBa2l4WldoQWxqcGVPMU1CZHNh?=
 =?utf-8?B?T0JTbzdpQk9iQWNiTTg3NStPeGYzcnplYzAwc2tUZ0x3K21YN3Y1RW5ZY3RI?=
 =?utf-8?B?T1gxMFRkdThVUlFhNytqU0dYc0JmbnZQUnVpZmlGRVQ0Smw1Vk9tZk56ZlVk?=
 =?utf-8?B?RkhKbzVQUXQ1eEY1ck5rWEs5NTJmUXVnbk1Ba2QvTkRpRU9ja0RyUTlRNEFP?=
 =?utf-8?B?bGZDcjhXSkdURGZaeHp4ZWg4V1VaM1RMTWVwZzZsY2NFblorVkNicjNDOHRa?=
 =?utf-8?B?Z1VGVktCZ2tPV3IyQi8yYzJZTis3UkxYZ0tTVUowK096VTBEbVNQTDJzbE1n?=
 =?utf-8?B?WjZOb0EwMSt3N3JSSkQrZlpTMDVDSmxIQUJnSTI1Q3FlNmlVNTFSaURpS0ox?=
 =?utf-8?B?WXc2by9xK1J5N2F2bzd5M1BNRXVRUHhLU1FHTGZ4dDQ4SmYwbmRpVEM1d3Vj?=
 =?utf-8?B?TWFlc0huQUVKNU9INUJESkVMN0N6Vm12azlJcXBCMkdQV0puc0lxTVBLSlND?=
 =?utf-8?Q?6oNAqr5T//+ym?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmVyV3dPUkJnRFExY3RueW5yamRVbGh2aVpaVTBYY3FFc2dhVFJ2Qk1UZzAv?=
 =?utf-8?B?VE5yYVIzU041QUFQVER5OURpajNsR2c5bDU5YVNGT25kL00xQlpDSUxMMW1W?=
 =?utf-8?B?WExNU0pza2s5MFhVUHVJTmh1bHh0TmNwUEI1TnZ3cnJHMU8yQ1JaZGZkakp2?=
 =?utf-8?B?dEZRbU9JaEpCMC9MMWJQbHY5RHZwSWlrNUliOEpRaG9KbjV0VjI5N1VNTEV2?=
 =?utf-8?B?T2g0Wlc4U01yM0RmUHpETUZkV2hac3ZRNmdtaW5FNVc3SEVrU1gwMUcyQjlT?=
 =?utf-8?B?WGN5ZmZNeGhQaVprNEtySXBSck8wRW9TN3R3Y0NEYndTWW0wcWl2NWlTTXBC?=
 =?utf-8?B?cXRQdDdZUWQ1L1h0d0tJRElYY2F0UktaNExZMEFjK0h4b2I2Q0hGOWlhaFo2?=
 =?utf-8?B?a1JhcEVqZ1p2MnpoR2V5NmgyNEhmRWQyRU5abGR3NWVOcEh2TElaM0hpTm14?=
 =?utf-8?B?M2JkK3pvUU8zaFBOVHNCeldxZHcwOFBaVHEzWC95SG9BVUQvQjJzb05GOGtv?=
 =?utf-8?B?NHRxK3U2SnhOdlVXNHV3aHRxb0dlaTQ3cXY1UTloNEN0OWF5dFdGWkFXSTh2?=
 =?utf-8?B?V3lvRVRsZHROOGdiY3pkNEdraUIyWUFycDZ3S0FJRE8vTFRieHpzSWUrK2VF?=
 =?utf-8?B?KzZBYnUrS290L1R2L3EyNU5oay9vK0YzTG9aMVVHWFNEWUgxaHRsU3NETWJi?=
 =?utf-8?B?TEVNRE5GVmZHd3ZwNURNbzF2VGhhZGFncVNXSWxrUlI0akNpd1BpOTBnRXVi?=
 =?utf-8?B?ZCs5WFQ1RHVJbVN4MFVDMkwvNURscmVkY1JQWWtBQk4xQ2d0ZlY5NmFRMW9v?=
 =?utf-8?B?Zm8wUVJJRFpKa0RKMzdhOUlvbHppbjBVL1IxeVVLVGtsZ3hodFFXL0tzS3Jk?=
 =?utf-8?B?QURQL1djU0FsWlVVSFVmYkZKeVpwK0pNdzNZdS8vMFExS24vbXNmMDI2dzR3?=
 =?utf-8?B?NUlWZHBhckFxWlg1ZmNqQWN6bTloWDRCY3JRUENtWk5WRE92VGFkY2NiUmZV?=
 =?utf-8?B?Z2IzaWdLVGxrNWZ6U0hpQW1uQTl4K3dUL21FcUtxbUNtWU9iVmFmT3kybkpX?=
 =?utf-8?B?QXdtV0hsRjV2UnprVWtmM0NsQ2VEdjlycHNMdEJUcWxTQUdkdE93U2dyRVdi?=
 =?utf-8?B?Si9hb0ZpTEpyRS9OaUR6S0RWRllwV3V4K2NXYUlNaGpxcjJvTVVSTjhKMWdN?=
 =?utf-8?B?cUQyNTBWdngvV09oaTF4VjN3V0lXcmh5SEEvTk1KVE1DQjMxS3Rvb21SMlpG?=
 =?utf-8?B?ZnVxSFRtL3dWb0ZSdnI0cmpqY2lTSlF5dCtOZUZUWFprdTlVOWg2TWY4eDNx?=
 =?utf-8?B?SXhuTkxKQWdqNCtHQmI2TllPOWNHbFc2WnRwUTY2Wkk3WkFrcHZtWC84WDE5?=
 =?utf-8?B?NENLRzYrNDhXVVlTKzZyNG1maWR2MExBd0dVTDV4cXl6M2pTcDB2ajUrMFJC?=
 =?utf-8?B?TFBSSC9RM29hbWF5TDdVY0lLZVVjZStNeTBFWFE1R09TR0JBbzBKR1h5U3lx?=
 =?utf-8?B?NER0clkvS1IvR1BYbTNqNER2WmhkZE5hYU9oZ1lpeVBOUm5yMGxPV1FHZWRq?=
 =?utf-8?B?RmNMSEE3VlNIR2h1b2lFUllZUEhlTEIzSy9xcmc0ZG5lMkR3c3ZMZlJlbEc0?=
 =?utf-8?B?dmYzazVGYVgzblJKa1FqUFNGdGFDbEYzVHJkYU1IZ3hFL3lwWHBwSzYxZlZI?=
 =?utf-8?B?ZDhMQW4xMmg1UnpzTlZMNU9xWlFZblY5eXNHNkhtT29YRENLSno4N2VvdmxP?=
 =?utf-8?B?eWZQNURLZnZSTjJoOVpaaHNzVE1NK0h6OFFZOC9ZTjJYWkV4OFhaakY4MFJn?=
 =?utf-8?B?c0NjdENOTHpBNm93TDY4MHFDbTRNOFdrMkcxOEdtUExRcmlCWXdOQnRhaGxN?=
 =?utf-8?B?Y2dzS2poOUliU1IxVWpZUXcwQkl0OThwZWE2SFlPVkdadWdjYXpjV3dYcHly?=
 =?utf-8?B?OC9RZlNLRzNvelNIbEhmRFlXSU9ncFIvcjh6eGlHOElmU3MyMUJhKy9HaHNz?=
 =?utf-8?B?ZUxCNU1tc1pRS1JMUVhNTnc0MFRJQTJyRkRiTUx1eE9nOXU1ZjIxU3BCWTFB?=
 =?utf-8?B?YjJ1dDVmVyttdzVuV29PVFZKWkYwQWVDQ3l0UkJPSzk4bmRGU0p1eHhzazhy?=
 =?utf-8?B?MzlnS1BqZ3ZVVEp5NDl4VlNBdGVQSGJOK3JsL1Q5VHlWeUJHQ1hhS1lzNnh0?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a964a0-61dc-47d5-61e2-08dd6e028bf6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:12:17.4818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZI5NSA1dTjKNCBINq/4eVI/EITse2ua1ApNq5YupJl0Cgo77VEpnmeEc8bxDrqrgbIBrJUUH9Bv5rTY5CNFi/t0QVMe7ml7+YixoJdBIJZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 14:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6674

Hi Antonin,

On 3/25/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Document the AUTOTOOLS_SCRIPT_PATH and the CONFIGURE_SCRIPT variables.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 597b0d031..e9e8a6933 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -224,6 +224,12 @@ system and gives an overview of their function and contents.
>         must set this variable in your recipe. The
>         :ref:`ref-classes-syslinux` class checks this variable.
>   
> +   :term:`AUTOTOOLS_SCRIPT_PATH`
> +      When using the :ref:`ref-classes-autotools` class, the
> +      :term:`AUTOTOOLS_SCRIPT_PATH` variable stores the location of the
> +      different scripts used by the Autotools build system. The default
> +      value for this variable is :term:`S`.
> +
>      :term:`AVAILTUNES`
>         The list of defined CPU and Application Binary Interface (ABI)
>         tunings (i.e. "tunes") available for use by the OpenEmbedded build
> @@ -1528,6 +1534,17 @@ system and gives an overview of their function and contents.
>      :term:`CONFIGURE_FLAGS`
>         The minimal arguments for GNU configure.
>   
> +   :term:`CONFIGURE_SCRIPT`
> +      When using the :ref:`ref-classes-autotools` class, the
> +      :term:`CONFIGURE_SCRIPT` variable stores the location of the ``configure``
> +      script for the Autotools build system. The default definition for this
> +      variable is::
> +
> +         CONFIGURE_SCRIPT ?= "${AUTOTOOLS_SCRIPT_PATH}/configure"
> +
> +      Where :term:`AUTOTOOLS_SCRIPT_PATH` is the location of the of the
> +      Autotools build system scripts, which defaults to :term:`S`.
> +

I would avoid having multiple locations for the default of a given 
variable, makes it easier to avoid forgetting to update all the locations.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

