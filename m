Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF76C54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:14:54 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8288.1785406486595542310
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jul 2026 03:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=H01a/gn9;
 spf=pass (domain: cherry.de, ip: 40.107.130.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1JHdSglb75d7YoZN5V2HTSCYaZIPxIxJKTDWPe36rCtjbWvfdBGAGXfWVjFi0bWRcLnd7MXopZTaYYVS3Y4CLDBbhuQapGZySh6XLDXoaxab4e/MQeMvyQM7oc7wT962Tj0yXRjqg/9KE4lS/lfhNaZfBgLOvjSp02IBw/aOEztmucfswQ9Tl3fRL9zHgi/tNW5jjfbPSQmmRRLfM1sTx5WpFmTNmP7oXCqZ65boiJb+nItigswYhWZQBcUplumI0U3r8y7e0w6L5gchbUOyyfKCuTU9Y9p+/SMu6T1m6x0cvqeaBhNtqiuQVpVks59xUZhZCcIuL0UEiUWQOEGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRb2sQghl5VjNpSdFNbEEIrBGi2w+mgfMzCcOlk9Rg0=;
 b=yVCgzJtW9G4k/uUveReN7USUieLMRa4H8XxxSwyEhgX5qhrvHPnMMiUfHEOzfXCzKT0tyCcbWT+4a+s9UqEVVV+REQ+4aMU0BprQjjJ8K4zTWw9aHe8NE69HeakppJQB8HXdZarrMd3/Ow5IrzrV0VnANOsp4OBBuO8c2pTTqkGO3SVGmSjF/ifbGfGWWP5xfgOtKyldzM2IcmLlhbVTqGeAyXO9tfrere4FXhGkGaU4dwPVy/2W5FjzxVwMiymeg6SEUiQClqEWc0b3gSyZQ90LcujxWkbENlJFVYDBetZTM8+5nxiI7vX+L3Copkok0KrIe16/w6+DAdSpVFv3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRb2sQghl5VjNpSdFNbEEIrBGi2w+mgfMzCcOlk9Rg0=;
 b=H01a/gn9g/DJxyBtNk0uyM4O1fhNzoaJdJpUHKzI5qBXIKQJ1agN4fMcOzXmsciU/qdtZpT7Ivt4DswDyFES0Y0kJ3gBf6ScGlNYRNDrHjO9n8ntQrn71+cwM26Iji8h4caWmD5W6yvccUTZWedY/xWFzto6GpGt3NDq/bQKEqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by GVXPR04MB9993.eurprd04.prod.outlook.com (2603:10a6:150:112::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Thu, 30 Jul
 2026 10:14:35 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:14:35 +0000
Message-ID: <f08291a1-53ef-4946-8a40-22ccfc8ae6da@cherry.de>
Date: Thu, 30 Jul 2026 12:14:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/5] sdk-manual/appendix-customizing-standard.rst:
 use code block for bitbake assignment
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
 <20260729-sdk-clarifications-v1-1-661e65201bc7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260729-sdk-clarifications-v1-1-661e65201bc7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0004F082.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::626) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|GVXPR04MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: 898efb70-eb67-432e-7a79-08deee235ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ugwsUsaHJfv4TzlqX+WJRl/JhvAzwOE3/SjjPbqfT+X0+VGEfW5bLAFxlb9CFq0QpFrD2EzrEZrkVNZZ7T+upmaAMQNlqShm0gJUvzeiabQin0bN8Slp4zg6W3vZy0xASr9IOdPLZmSnZjnE8fWIIaFOI6Sq+ufGv/FARnda43baZaPv1bMT5TyFx/pRLIZVp08tbZTSMMi46lDSKzDDoLkDuHtqFIQd6jZ+MuXldnUNrwYscNKA34RAdVralmii90tk4ayCqPOFF7VSoE/GrhOR7TC4Y+6MBY1m9EWRM2LcPRG3pL6HA1F/t5IkyY50kK0mNk8DehYTpndatPib1d+tQvWw/OhDQyDXVyeR1I9aSJS/HL6hCPTCeYaBApHlCuVIUYcGobMzp4/Ph5n8X83aiQtv8f4lrLM7OAMoCunfpLG2uxPxhpVrG+zgL/lkkx9GnZW7YSsWNXea51kW7NJAsG9/pIVCBJglILYJgxiv8jKPbF+myx2kyRkjo67rDhHRlEonR448OJm9HK6bjmkAUw/It7O4NXC52EI760wc1evX8xv2F7VwQSLE6PP75Ovsfd0uQZ0hvwGObtFThqc9TWfjYrl4LQiiLyyzq5gyJomHBREdfPF7djW9P+J370SE73+SDcoTBq5nnfj5kT6mY8nxzo5Sc4HEivE37EQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eE1YWmZELzZsNWhkNTU0aFVuWW8vbmFKNmtkTjRjQmg2cG15MHB0d2dBNHZZ?=
 =?utf-8?B?azErU2UzVi9pSHRqV1N2YVJqMWxsRURiUFNsMDZNOC9RMzVPckgxMHV2TTZp?=
 =?utf-8?B?aWZUMDhNNkFpSkg3eWNnd2tVekNkQkxWU3QrVHYrSExRbU1sdXRQamVHQWll?=
 =?utf-8?B?Vk40Q2RsSDdZRlRtZEJoaFJ5WjI0STg1RkljdFNXdFNoTmdhU3RqeCtGQ1d5?=
 =?utf-8?B?dWYrRitIQklJMU5YT2RSUkowVmU4S1ZUWi9IaEIvL0ZEd0w5U0h1YnhnOVAr?=
 =?utf-8?B?N21aTGlCUlAyKzhyd3FxZGhzSmNNT2krMWYrVXJrVUxwTG1VeENka2pxclZj?=
 =?utf-8?B?MXB2Mnl4alVDZTlmcnB1aG8zM2toMXBjZW5jYVdWRi9JYWszL3RtQlVmejR6?=
 =?utf-8?B?d2N2bVFBbkhaT0M0QWZHWXVZQ3MvOWoyRCtSZjR3UjUxUWY2N0V2QUhtaERF?=
 =?utf-8?B?K09oWnZCY2RMT2E3M0xnaW1vZGdkVWUxdVhmWG1CdVowTW1GVDlkczl2WnJX?=
 =?utf-8?B?MHN3VVhNMU1XbjV1T2M3QzJwOXBLVlBETkZCRk9POGw2SUpXWDd6VUJHUUYz?=
 =?utf-8?B?K0l4NElhekg2QUVxZS9WMFY5aFZyU2hhVDIrUE1rTFVNVFdTM1ZpdnBYSjFt?=
 =?utf-8?B?LzRGdFY4ZysxSk5GZmtYdVk4MVY0S2Y2cEF2TU9ZNVZHUXVpOVVTQWg0amp2?=
 =?utf-8?B?dExzeHIzSERPYWtwdFpXeEpjQlMvZlkxZUgvcExWSEJtcFREaWE1cURNUnl5?=
 =?utf-8?B?a1l1TVNWL3hmL0lkOU5RbkZHaThQNFMyN0xxQllzSzRpbW5LVC85TnFtMkNu?=
 =?utf-8?B?ZU5BMjJyaEE0MjdpbmJDanM1cHAzUWxBNkpNSkttV1FmdzFlSU55bUpOZWhz?=
 =?utf-8?B?Smx5cEZrOGQyQXFMeVM5RU80UU1oSzA0STJzd3hIUGczemloVnZOMjFXaVB4?=
 =?utf-8?B?c094cXRIdzN1SXdDMkRhSWNIeVUvakNveDBPajJ3WHFXQ2xhZDJ5T2gvMW42?=
 =?utf-8?B?Z0VJbFpNbHFWRmpnU3BUcDV3ZXAyMHJiNU84Qmg4RUx6MnlsYUVxclNoN09l?=
 =?utf-8?B?SFJQMVpFeFE1NnpSZEl2V1A3MnBBejZMbVZNRndCUm5jODNRbkZoZTFlRG9r?=
 =?utf-8?B?eVQxYkFUdDhvZkJtY0VBaHlQVWVhQWpZeVJXczhBN0JsUmVNdlBUM0J6bjZU?=
 =?utf-8?B?bnhPb1NJM1ZlcHpvMkdCaXNDSGl6bHpGZm9Ed1h2eWJ3ZE9HcWFxaCtmaXVW?=
 =?utf-8?B?WlZrdzRObTFxTDdMUW5vZWxsaThPUUNlMzUwOFhrRmhSQ0NhRDhxVFNkcEZH?=
 =?utf-8?B?eFpza2xidmRQMnJGUEg1Z1h6UjFuSlFIczczSmRPNVFsNnBPY2VxMGV3UTlq?=
 =?utf-8?B?R2ZPNkczTklaYWZOay94b1hIdXFXMHRXK3VGbW14c3g0N2dhdzBiaGdpZUFB?=
 =?utf-8?B?UFpoa3VFVU5NSmdHOStSS05XZjhVckpTWG5zeENHc0VBSStIWFVYS1VxKzYw?=
 =?utf-8?B?dXZoMnh4dE5pL0ovOHo5blQveFo4WTFlNUxWRGdWdS9VZkE5Z0o3N1p6MjFl?=
 =?utf-8?B?ajhlcFJKMkE1NytpMHNkVTJjUGhkRm14bGZVejArbEM1S2Y4S3pRTjRtbkNS?=
 =?utf-8?B?cDR4NGZlbjVINkFaMGt6WGtaaGdwTjloQUhJbTNyREdBUUt6SFR6TGU1bUdV?=
 =?utf-8?B?SFBBbkNaanZiU2EzbFBmd2dqb3grMTUxRzJmWVNuVy9UY0MrSitCUDljUm9W?=
 =?utf-8?B?TjJRZ0FuY2tQZEJkVDM2UStrMFFPc29JOGJyYm00S0JSQnBsei8yV1F4Y2pY?=
 =?utf-8?B?cWtkQVAzbSt4eFY2cVluRDV2b20vTVVUSXcrclp3SzF1ajRYY1BROWI2ekxS?=
 =?utf-8?B?MG1sTExySE5ySHBJV1JUSnBWTzRtaUtXcHY3SVpTTlB5RFAzYlNVUlRacmRl?=
 =?utf-8?B?NU1NWGFUNUY1N1JNMVZDb2JFVTZCM3pZeEc0cnVrM1NkclBXZEZwVUNaeEVu?=
 =?utf-8?B?UDJBUGptSGQvTHZaT2tYaXA5cjJOckc0bWlhUnBsemlLaVo2QnoxSVVrb1F3?=
 =?utf-8?B?c2FKdFdpWDE4YlhxQkM0NmYrNGNvRTZ3MGsrckV2NDZZcklTWWI5MmUyYkU1?=
 =?utf-8?B?dFNuVkJoYkloWVdoOWZxU3BBVzhRRGFmWWZhaUxBck1NQXJZYTllS2ZaRGFQ?=
 =?utf-8?B?UjZOY0xpejhkbEJRekp5U3dwbjVQV1ZJaVFWNHRwb3lKQXRGTU9IckYvc0Zm?=
 =?utf-8?B?K2src0xXZ3Y2ZkR3WGlzMHZNMCs3VnNCVjZzeGRWYktNYlRDUHpweFlrbmpR?=
 =?utf-8?B?Mjk4d3FMclFmL0pXSExTK0RjaEY2SXZKRlZTaDY0cUhnLzdZM3AvQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 898efb70-eb67-432e-7a79-08deee235ad7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:14:35.0347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxSpvjno1kYG2MHBqXwfBiU6hev67JMuu9/kKcBmQGpfMol/QljoWsd+gBFbKXsSrAO4x8grXNg5UCI6k7llE/Mj48MgiOjnu5YG0xLQi3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9993
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jul 2026 10:14:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10193

Hi Antonin,

On 7/29/26 12:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Use a code block for the DISTRO_FEATURES assignment instead of how it
> appears as regular text currently.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

