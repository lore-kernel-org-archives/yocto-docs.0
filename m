Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF682C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 10:35:49 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.42])
 by mx.groups.io with SMTP id smtpd.web11.2858.1740566141290693104
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Feb 2025 02:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dXjCWQ+S;
 spf=pass (domain: cherry.de, ip: 52.101.71.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrLUZt9vOuv5/Y/knx2p7VVypuHHTBdudgIFP/knVlvDVb7G68hSFmQaB+sB6KSczJc1nXBsa15De/6v2ABCco5G3FbXxLFoa6dGz6j0Mo/Vpxeedr+HCGm2pl1DrnynGZHzLOruXnx0Y+C6ZmmCiqhS2NyS/fumjmmAyNDh5+mBcP4h34DaRA/EbI8I3uja7ZYpLgnbHmFcNtcMFb5MbOc1hgK8ydQb2s/h/hXe0iPMIwKmbTQSE6d1yuSFra57wRsJ6gFC2Dd8CBvSIzcrPYhSH84adB+7bxtm+sB00kznuTpdk3IFQzMlN2GYbCSihUFsWkhxIwfxYIuq8QU4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn+uIS+EfJPqRbXQxEips77GuYQic2BxZXkmSKJRxl8=;
 b=c4OEYyGgKuqGQJFNlZ2znVFbWB/RiNN/h7y4lc5aB1b9CbgmYKeeEUfMzZaF4Pc6QooIPFvMJw1bgj7rwSpodosOftG5/d89NZG2tZgMNCO2gECCOu3Bb2BUwAT9DvOYngXGL9E6+YNj3yfXb8CIGMgkXklxYmqpvvX8IFKjznKuc9X5vZityP4OEFrmPXj63az5tUKBGEUMyjDpkkwJX8VtiT3ZEDc+3KhHfVosK7eR09isyAJ62G2oxnRR6gOFjZPh4l4vqeF9EGy5cp2myXyUPMQN29eoM+szurvFYBLfec0zv4l6DSayWSM2Bs1eEI0L9zxiysqqX6ntGPb06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn+uIS+EfJPqRbXQxEips77GuYQic2BxZXkmSKJRxl8=;
 b=dXjCWQ+SkIKl5YBBm0VXRy0roPzuZVqMe1zWxDsRQav7A8QBHFsj2XOUBHE0R4GglT9IFMcTuxUDWhibElEGZ05zv52JiInIp0hMC+05WELfogwEZhMqTulQpg3bpvWpnMfKivUYoWc/8Kz2WRu2wZes1QWzw9WD1WUfUhLbAH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8737.eurprd04.prod.outlook.com (2603:10a6:20b:42a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 10:35:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 10:35:38 +0000
Message-ID: <8e8d604c-6f95-496f-a0f9-0b83cc6d7b75@cherry.de>
Date: Wed, 26 Feb 2025 11:35:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v4] ref-manual: cover UBOOT_ENV variables
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250225222442.3347665-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250225222442.3347665-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0325.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8883cb-6e39-45bc-7868-08dd56514f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzIvQWFtaGtHSjcyNUc3NU1UMklxRGk2MjhUQ0lvZU5oNWp1Z3R1Y3E2YUg1?=
 =?utf-8?B?K2xqb0k4cCtyd3Vma3ByZlBGN1oyRU1zNnQxM1hVNnMrNVRPUW9LUnp3UHlk?=
 =?utf-8?B?Qk5CNG1qeFY3cTNzT2Q0djMwcDJzME9pUm1pSGpxbFV1S1BqZ0h4cWNWcVpX?=
 =?utf-8?B?U3VFV21ya1Qrc2doTmxabjQrMERsa2VxZ1RKZ0hyU1dzWDNnU0ZaVHZ1eEVW?=
 =?utf-8?B?SzF5NVJ6YkRpVFpGRGY2Z2JhVzJvT2Z1YXo3WkNQRWtpZ1dJUFBVZjdOdTNo?=
 =?utf-8?B?RzlxZk54Q3NzL2dOTzRsNkk3STE2RHJIemxQTzVIU24xWG9Nb2hSRmx3M0FP?=
 =?utf-8?B?ZEFmVVVScVJsUllyRXFJSGk5MlFXdGRlNzdoWUJyUmxJT0o0UlhLQ01FTDYr?=
 =?utf-8?B?SzNER1VvdzFib01sR1VRSjM1R2Y0NXUyaVB4dDJDd0ZjRmhNVy9XOXYzM05v?=
 =?utf-8?B?b2RIdkVNQ2pDSjFxV1lHelduL0VCWVduZy9IZ3RPY0haUGJoUUEvNFpqUVZP?=
 =?utf-8?B?bkdha1U1NldXNDFVM3hMNHdvbVlYdnhVc2Qzc01tcm5ZQ3ZGV3dId0EvMTQ0?=
 =?utf-8?B?cTBzTUxFRnJsNzRHQjFIdzg0QUF5cEo2QW15NWQ3RlFYa3REWWtGRTQ3TVF5?=
 =?utf-8?B?bnBuOXlzWGlubUxNUDVDZC8wbW5pdU12V0ZzVEUzelJ3UTBUczVtSk03SVpC?=
 =?utf-8?B?Qm1DQ3dEMlpSWmJQN3VRa1FoU2cxenRuRVh4N2hJS1R0RUZkZzhpU0JQb3cw?=
 =?utf-8?B?WWhQUGlJOHYrZ0p1WTRaTFJiaHZrSFpJTytBOUtjam1jRng1NVQ0ZHBobGpz?=
 =?utf-8?B?dWIvcUpsK0pvWm0vZDZrUk9GOFBuN1EwMW02QmIxNXNwVWtsa3R1cUpQN1pu?=
 =?utf-8?B?bXRKQ0RNZXRSUGFZSDBoM00wMFoyR0FpUlFqV0prS0d6L0NVUjZMenY5ekU1?=
 =?utf-8?B?enRLeU5ydzNEbUx5Q1dHZkwzS3R2SzZMUnJNd0FkeHFZVjA0dTdTQW1lRVJq?=
 =?utf-8?B?Q05BeVpWVnJuVFluNUppMnVWYWFib2NvVHVvN0M5MXdqQTVHZEpIZjU0MEhk?=
 =?utf-8?B?enVFWlp0MURBMkJnM04zN1J4MmE2N0U2dTU4RHZCTDNUbWZLKzhwdGdsOXRw?=
 =?utf-8?B?SHZSMDMzdWhJc0x0dERRZnlMOVB0MjNsMjIyTUFGSHlRc3o3OVlHa0lsVXp5?=
 =?utf-8?B?RWZiT1B1QTJXaXBMRlc4T0ltOXlnK1A0cytvNlFPV1lFUlc0RDdLalZGaXRq?=
 =?utf-8?B?NXpYN2E0WWdsbUFLbll2ZXBnMXhjQkR6VWl4b1pGdWpLNTFwRnBvSHVTV04x?=
 =?utf-8?B?MUZ6MERVdHc2ZytXUEx0VURrcGlMaWplTUI3dEtDeHFWWVh1NDd4T2RHSVNL?=
 =?utf-8?B?R0RrTlg2NmtzVWxMa0l6MmcrM3VudHRkNE5ZU0lZRkRod3A4cDMxUzVZOGVa?=
 =?utf-8?B?U3ZQMTlINC96b0VadjNBaCtEUndlZlRkUUsrSHpUbEU5OFF2aWd0WDcvYmQ2?=
 =?utf-8?B?cVVveCtEWU1vNzVqTUlZYkR0a1NXYXQ3dTBoSDFyN3ZvenlZd1RURDdYUldL?=
 =?utf-8?B?NEpWaDRuWktVOFRLdXM3V29WaFd1ak8yTzZQV3BhMDM4R2VWbmZyQnVITTRs?=
 =?utf-8?B?QXR5c3BOMWd5ZHYxVExVR1dCQit6V01VVlorb3poR0ZzY1ltS2lqcWpsS250?=
 =?utf-8?B?MTV2ZHg4Y3BOblZvYUhSOE5wTlpSZ2JSclcwMWU4ZTNnbEZ3ekFXRkhrVkU0?=
 =?utf-8?Q?r7aHt+UMSVsrCMEHZBTFTEA3zwgs/xkl4389k7p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YVhhVE1Wa00wLzRueWJQRXFVSzl5Ui91bmVaOUg3Q1VjQTRvQ0NidTZxUzkx?=
 =?utf-8?B?VzhIeFBuelVrd3oxcFlzL1JTdG1MZjNQOU8xdjl1UFo4N0R3RURITE1pYlQ3?=
 =?utf-8?B?aWdDQUxvQm04WVBlQW9ZclhsRnpqaUpoL3dTaEpsckpsTGsxbElyUU5DL3VH?=
 =?utf-8?B?UVJ2SVVudzRjakZYcU16QnliYkYzSXBKSmpxendzMGhrM1Rkek5iWDBmUTQx?=
 =?utf-8?B?b2JZOGFNR2gwUkxXWGFDMkVHWmtOMjRrbVVMOXZ0WUJxcHdsbE5UWm5sUWcv?=
 =?utf-8?B?NkpORWs0TG9EcU53UEtlY04rRU5DUmFQRVM0dWRHU282dnMrQlRyUjZ2bzNH?=
 =?utf-8?B?VStIbFhWYW4xMjFrN0pTUDI3OFJtdHpsOWpLaFFGa1ozSVAxVElYYjN2NHBI?=
 =?utf-8?B?aFVsdTVxU0lRUFhFVXp1L05TUGtGakRUbGJRSnBUN0NoakVqQ2JoWjNoUTBy?=
 =?utf-8?B?MUlEMjRCWlkrcWlKTkVnNUMwZU51WU9rUzZ1L2trOUFBZ2lUSGNMMzVOeXBi?=
 =?utf-8?B?YmI5SFRVR2l0NEpmNTNoTEVlUi9ObUNiK1hCZGNTY1VkVkFyalBzM01yamVX?=
 =?utf-8?B?REZxRkh5aWJIMk1BZnFJdVdzK21Wc0d5cXFWblhLQ01wdXpZNHVLN1BheVhD?=
 =?utf-8?B?dnBYZUVaNUIvQmcvcFBQVjJDd3lMMTRhVUxoT25YTHEwcjZFamphOU5VRmR0?=
 =?utf-8?B?c1JnV3ZNc2NUMmZ3Zzh5TGJid3h4dk4yWkU3UkpLTEZwQ3psNjRBTm80TlBs?=
 =?utf-8?B?R3AvMlU1WGtVN0VuSG80L0lROHAveGtpRDRGYmZUdFpmTjMzd012alovcWUw?=
 =?utf-8?B?cXhlbTd4K0xtUkhkSlJmYWk5Lzh0eTNOY3RkcW5uZUE5RWxJK2tYZ0c4OG8z?=
 =?utf-8?B?MnRKY05LR2RnaG4yRUExMkVXUkkwL3lnUjRPTGQ0aUV0ZERuY2Q1QndvcSsz?=
 =?utf-8?B?VnJtdHFjM0d0ZnlJOG9RWGprUzJ0eHpIZlByQnU0OWZocUg1Rk9jRmYwdHQ1?=
 =?utf-8?B?bVFkd0hZZUxGcGlDaUNLd1hDQ1Zxa3FJYWJTdS9ESmNZbjFJQ28wbjdQVzlo?=
 =?utf-8?B?MUlrNmlRVDJ0SDdIVzh1SFkrS2VGTTBMNjZUS1N6NE5LS2lBaFNUWFhMRjJZ?=
 =?utf-8?B?eVlKbXl2bGZGR091enREM1JjQnR4Mjd5eGtoM24zZzJPRUtrTG1QUXY3ZlQ3?=
 =?utf-8?B?WUlYMHlHS1R0bHUvbkpTRHVTL0V5Y0lscnEySldVamNaSGFtdFhvMmlrVWJl?=
 =?utf-8?B?OUhXVjBHM2J6N3VQQm16dzBjZ01HNEZZN2Q1d09Cd0J5bVpWQXhNUVFHSS9i?=
 =?utf-8?B?d0xPMklVYk9xbTlKYVY1ZzB6SUcwKzB5TWM0RFU1YXJrUStlSGNlVG9GS3Q3?=
 =?utf-8?B?dU1WR2hIUjJZK0ZVbVZramFId1FlWTZ4SHhFZ1Z0SkdCMFgvdXBldmpaTnNk?=
 =?utf-8?B?ZnBISFI5MFZiM3hWOXcvWlRJdlhDcXg4ZEJkVXVvUWowNUY4eVFXYzVNelpu?=
 =?utf-8?B?dXZDek96OTVMSVdkdjJway90b1dLRmUrcTh1WjM5d2FaT1FvUEZ6UTc3dTlp?=
 =?utf-8?B?WUpPOGNCZDJmRjRSSUIxTjJIWFJKeDRvU1V4ZVV0K2pjTUk2TWFQWFdEY2Ri?=
 =?utf-8?B?b0NBR3dyWkM0TXdrUG5KQ1B6S3pWZWdqWDlCS1E4ZUxVM2dWMFJBRjRJMDVE?=
 =?utf-8?B?U3NMSmNCSmRkYzhsUXA5NktlTXhydk9RYlhSREs2MzBkZ0NocEZWWFpMb3Nm?=
 =?utf-8?B?U3AyYkYrWXBZMVNzRHFBaW93SjBRaXFRRTc5RUZ4UDBiK05NZk13eEp5VFNm?=
 =?utf-8?B?cVZPT2grdDZycEZhWDB4MDc1TlRXNmk4MWd4ZENUL00vMGlUOSswRk01U0pZ?=
 =?utf-8?B?Q2xEY1g5K1lFQlp1QXpGbTZBcEhnVGVUV2xMUnBJM25ZTmdBQzJ1dW45TnBF?=
 =?utf-8?B?TWJ0ZHZmNDhqUHRXbDlQdXpmazE3YjAwSnU3eThLVUppVFVGR0YydGRiUjFs?=
 =?utf-8?B?bE1UYkR4RHRKN3R6MjNweXVzUWVIblVKWnFCOThNTDFpcDNobTUyVVFiMDFS?=
 =?utf-8?B?Q1JkOFJ5Vys3RnBUd0w2OTBkU255bDFuM1d5WGNZZjRvTVBXcmphM3JqN0w3?=
 =?utf-8?B?YjNudStROFZmUWZuVFk0YzlqRy8zRGJ3a1pjcURaaStGZ3VxcTIxMWNrWU1Q?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8883cb-6e39-45bc-7868-08dd56514f30
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:35:37.9584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X84dKWn5BNwKwxhXGctLhSlWQ/DzSc+ny5rkHhCu/wdbp0FoCKojzuaXwU5lBNXQM2jQpwpIe+rSELYLpKztgvgVdCCjINYvqEXBIY6tLx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8737
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Feb 2025 10:35:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6457

Hi Adrian,

On 2/25/25 11:24 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/ref-manual/variables.rst | 63 ++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index adbef69d8f3..a3d59390cd1 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3180,6 +3180,31 @@ system and gives an overview of their function and contents.
>         The default value for this variable is set to "2048"
>         by the :ref:`ref-classes-kernel-fitimage` class.
>   
> +   :term:`FIT_UBOOT_ENV`
> +      This variable allows to add a U-Boot script as a text file to the
> +      FIT image. Such a script can be sourced from the U-Boot shell.
> +
> +      When inheriting the :ref:`ref-classes-kernel-fitimage` class a
> +      script file should be included in the :term:`SRC_URI` of the Linux
> +      kernel recipe.
> +
> +      Example:
> +
> +      -  Add a script ``boot.cmd`` to the Linux kernel recipe::
> +
> +            FIT_UBOOT_ENV = "boot.cmd"
> +            SRC_URI += "file://${FIT_UBOOT_ENV}"
> +
> +      -  Use the script file from the U-Boot shell. The name of the script in
> +         FIT image is ``bootscr-${FIT_UBOOT_ENV}``. This example loads the FIT
> +         image from a TFTP server::
> +
> +            tftp $loadaddr $fit_tftp_path
> +            source $loadaddr#bootscr-boot.cmd
> +
> +      More information can be found in the official U-Boot documentation:
> +      `U-Boot source command <https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image.f>`__
> +
>      :term:`FONT_EXTRA_RDEPENDS`
>         When inheriting the :ref:`ref-classes-fontcache` class,
>         this variable specifies the runtime dependencies for font packages.
> @@ -9791,6 +9816,44 @@ system and gives an overview of their function and contents.
>         :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
>         classes.
>   
> +   :term:`UBOOT_ENV`
> +      This variable allows to add additional environment variables or a script
> +      to be installed together with U-Boot.
> +      This file, typically ``uEnv.txt`` or ``boot.cmd``, is installed in
> +      ``/boot`` as well as copied to the :term:`DEPLOYDIR` directory.
> +
> +      For machine configurations needing one of these files a ``.bbappend``
> +      file should include it in the :term:`SRC_URI` of the U-Boot recipe.
> +
> +      If the variable :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` the script is
> +      packaged as a uImage (``mkimage -T script..``) otherwise it gets
> +      installed verbatim.
> +
> +      Some examples:
> +
> +      -  Adding a script ``boot.cmd`` as a uImage to ``/boot``::
> +
> +            UBOOT_ENV = "boot"
> +            UBOOT_ENV_SUFFIX = "scr"
> +            SRC_URI += "file://${UBOOT_ENV_SRC}"
> +
> +      -  Adding a script ``uEnv.txt`` as a plain text file to ``/boot``::
> +
> +            UBOOT_ENV = "uEnv"
> +            UBOOT_ENV_SUFFIX = "txt"
> +            SRC_URI += "file://${UBOOT_ENV_BINARY}"
> +

It is indeed odd to specify UBOOT_ENV_BINARY/UBOOT_ENV_SRC out of nowhere.

We could state that one should use UBOOT_ENV_BINARY when referencing the 
uboot environment in any form, to be installed. And UBOOT_ENV_SRC when 
referring to the source script that will be installed as uImage, 
otherwise use UBOOT_ENV_BINARY.

Considering setting UBOOT_ENV_SRC_SUFFIX to txt would allow use to use 
UBOOT_ENV_SRC for every example above, maybe we should do that instead 
so it's less confusing?

Then we would only need to specify what UBOOT_ENV_SRC means in a note 
(or in a new term in the glossary), e.g. that it defaults to 
${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}?

What do you think?

In any case, this looks good to me, therefore:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

