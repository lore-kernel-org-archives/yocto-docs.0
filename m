Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183E1C02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 08:51:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.69])
 by mx.groups.io with SMTP id smtpd.web10.65010.1738918271085503099
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 00:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QFLO9Ws6;
 spf=pass (domain: cherry.de, ip: 40.107.21.69, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtjj73HbDo2DJzIR+cJ6X5Lc8v7pGmJ1OMtGkFS43iTZtLY/AHHDGf4Kl8+Rfn93RKEP8r59avBewZPUlh1X0VIwR9AU5QwzjuDb6Lo8UYjDWDFRtTlPo17DJiWj7LRlB+uy3JYgoE7zYdG176Mm9bfUmziTADiy74EHa94ZrvFfmvHDAXoXjI4H/aNiS2WdKfmI3vqubrXOTxawu9UX0I62yfYBfjBZDrfOONseDQm+02jMpbMAIq3eHSKXkNCQE+WAZad+NBxIH3ykQPJ28sE9VtgWCk0+j0Vdp+x3SZnD8e7Y08mKMjjpgRC4OcPZhiHiLWA9jZK2vy1YA134Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7ArQmMmTyxpHCNAvtPde9MTxDKVnuCvAoPu0CwD2PA=;
 b=xjMGnaXw9GOipRmWJqIpJvPuJC93M+tOXsy0AoNvIygl+agPWzb7T6/u5ERxdJOBjVY0+IuvQ+2Ny5w6Gmd8lLry5alWDrDuYOEZDkwwMgKBaEzBEQjIhL84TTKJOxKrNsG/z8vZJ98VpSCZsyfdaVbP/aNRA9ByEPbXIkDjOaIp+PSaTpvcOkWIWVTfHhYxiGJQvDgg1QeVqGTyIaAPuNkXbJh9tfJojKRXJTXXcbxK7CemuaLf0Fav5McBXvCIKskiqOGVQoTwmhRye1+tI/YM/DHXSxwSxFUPkTAYBo6cUpLvv1sIZcs/lvjV2mZTenxmwj2IHzon10/R3NHBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7ArQmMmTyxpHCNAvtPde9MTxDKVnuCvAoPu0CwD2PA=;
 b=QFLO9Ws6tFhvEtgz0PhfPk0DtWI7UAigZHnjieRHkHcv8nBhkOeVwZr+ojSdM83XQERzs+i6E2dYDqpKlflhrIY9wenTW3ll/D8bsMsT/KS3Mtu4D8rzoS/x0pq7VPxz3cRKxOZMKe0Q+kjIdBKvulD/7fAuB7E9qKHVJBDRNCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Fri, 7 Feb
 2025 08:51:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 08:51:08 +0000
Message-ID: <665c75d0-48d3-4d67-a11f-3bf6f22a0e57@cherry.de>
Date: Fri, 7 Feb 2025 09:51:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] migration-5.2: add virtual provider change
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250207-migration-5-2-updates-v3-0-9571efbb1cd0@bootlin.com>
 <20250207-migration-5-2-updates-v3-2-9571efbb1cd0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250207-migration-5-2-updates-v3-2-9571efbb1cd0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::22) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: c4fc3893-0b8d-4570-c225-08dd47549045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QVRUOUdQcUFzV3FQMndTd3ptaU5IZE1KdzJHVlg3UkZ6RTIyWk1SRVdlN2NS?=
 =?utf-8?B?ckU2Rk1XdHNnTW9kQUJ6THNIT1ZEd0V2U0RCa2FNYW5qbVAwa3U0b01saE1q?=
 =?utf-8?B?RmRqcmYveUlhRDNyNkdxSlZTWk5aTlRkSHVkZXE5ME1ZK1ZpTlBiaWFjOHN0?=
 =?utf-8?B?dUpLVmNEZERlNkFkSk5ocmkzNmVkTUF2L2RFU0ozcncyUVpzNXdMVk0vVExJ?=
 =?utf-8?B?UnZ3cW1yL0FhTElZY1FjSTdsdEI1QWJDU2pTSG1kNnV3V0p4NzFEWHgwUjJI?=
 =?utf-8?B?SlRnZ3lJVXBmZkM1RWJXY2hmMm5vbGQ3WVcrdDBHcmM4TkZFVDhsYkhYYndF?=
 =?utf-8?B?dnFCNTF0RFVvbVhaU2ZRZ3RLZFZ4VU9IV3IzU1hvdzMvL2xWUmxLTnVabG5M?=
 =?utf-8?B?VlY0a0lObGxmYUVQRjdNc1llWllRenhwbUkxYVZ4bEc2cm4wcDgvV0NubkR6?=
 =?utf-8?B?M1dTbnFvOTN6QTljYVh0VEtUUy8zVkltc3l1NHFnT1BoOGdXVVBoa1ZkRGN2?=
 =?utf-8?B?cFZ5MTZEZHpJVk1XckRyZ0M1S1BVMktrM01YdzFnRWUyTzNEN05UWElRbjlz?=
 =?utf-8?B?NkllZGoweDY3VERYeE8zZTFnWE0wb2hmWWZlV2hLbTN6MHozeEFvMGJ3Q2xy?=
 =?utf-8?B?cVpWUFplREJma0kxNXkvc1lGRUFRVmt0WlNOdlJRU3M0TXhGczlOSGNpQk9v?=
 =?utf-8?B?UHg0eTFtV3JqSm5mOFJjUklJNVd5ZzRuMUdlY0F3eXRNZGIwZXVpL2tpUXNN?=
 =?utf-8?B?R2Y4Z0VRbUtZVm5BY05SUzRFTGJWZ3NWMGhsejlGMXVNN1IxQ1ZNSzg5RmZM?=
 =?utf-8?B?ZVpGTTF6RkVVM1RvbzNuQzVmZ3Rsams1KzhYZVMydkpQanBMSis5amJvcVc5?=
 =?utf-8?B?L281V3RoK0xCMStjMERuRkQ2dzZmSWd3OFhXczRWVUFPbVk1OFVsamxkbTBG?=
 =?utf-8?B?MWd3NmNNVmdNZDlERmJLajN6WjAzTTZyL3BUVkk4dHExNE53T05CWVQwd25D?=
 =?utf-8?B?Y1FkWXk0SEM4NjNHdjRuNU9pdzloaWpUNkRpcFJBaklGTC9NZy9hc2FGZXlW?=
 =?utf-8?B?V0RhTkRsckhUKzk2NFJkdDZEMFJsT1cwd0N1OGJYT3k4aHRRRzM0SnNiTk44?=
 =?utf-8?B?NjVMOWJTdlJvRU0rVGRPdm9KRkJwalA2MUlPa0J1RjJuejRMbGZLbFpoNHU2?=
 =?utf-8?B?RnRBeDJSb3gwWXY5M1EyNTBQeTF5SDAxRC9KdUlyVWwzdFpwajZwUHkvYWdm?=
 =?utf-8?B?TFdDVUhiSExmZFVJdUtWSW9haitwZDAyVlBNSW1WK2FCa3JERkRLN0ljdXgx?=
 =?utf-8?B?RjhwclBhQVE4d0l5UVBCdzNrVlEzSGFVVVM2NGpic000M1J4ZWpSY2ZOM252?=
 =?utf-8?B?V1pRT2JqTjhsdFY0eG5xQ0ZLb0t4RDlNT2w2dEZ6Z0NVR1JKbUtLZmZ5cXdF?=
 =?utf-8?B?NkhHTXAxRW4rZVdrSzV2VlFoWGF4anVMeGVYeE9ydlZRWFFnL3AvMDQ0WW5J?=
 =?utf-8?B?eU5YUi85THdWVmcvRWZacmUyaTFDVUpWVzNSWDE5R2RXZWY4WlJ5M0luOUN2?=
 =?utf-8?B?aURYRGxZTXo0ZU1uREQxUWR0N0tPaWVicGt2Sy9FWWZKV2Q3S2h4MlRDYjE3?=
 =?utf-8?B?LzY4Z1BLZEIzOXdkOHViSnBVbFZhL0tFT25IRDJOckZqWEJDRVZXYXE4NGxo?=
 =?utf-8?B?WC9mdUV3SklnWFVzakZqQjdVWklDcVJYdFArV3RheG5TS0dZZVE1cndGMjZN?=
 =?utf-8?B?ZkhzbHRsK2RRSS9sTGltemJHdTBPdUlWT2JWZlg2NGZVcWM2WmVCYlZ0QjZo?=
 =?utf-8?B?T0YrdHRncUtMTCs1RTRaSjcyd2JIaVo2Mm50eXg5aWEwU2Y5WkJ2eFQ4U3la?=
 =?utf-8?Q?Fa7wRd1s9Vqt6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1lVeGFtTTVKQ0xPeTU5Z0J0WXZWOFh3MFNjS3l3TzFKSjJEZnMyYXhqWEEy?=
 =?utf-8?B?R3h3VVFnb1lUektOQnpZVUh6QldhZGxvbG5aQmR1dEV3bFlNUU5SM0tqSS9j?=
 =?utf-8?B?RDNJb1FLK3kyVUhxaFF6OHVYOC8vRlpLVVNIUWxXTWR0MjFab3lQbE5aSk9J?=
 =?utf-8?B?cDBpbmI0eGV0OXBkZkZ1VzM4ZGQwM3doVVZ6Wks1RzhMSmQrNndaR0Z1SktX?=
 =?utf-8?B?ektkMTNxSFNHcTdKT3A0L3VZWWpUT1RCSElBR2lrSVdlV1RuNVIxNzlYcW1r?=
 =?utf-8?B?WlhrTWRZc0NjejZQci8xL3djWGRERGJiazJPbVo5U01lSThMYUx6NW1RSnA3?=
 =?utf-8?B?cndITWhGUXFNMk0vUDE0MUdPbXNuQmdUS2tIRjRaOFhCa1Q1R2Y4WG85enQx?=
 =?utf-8?B?SHpnOWt5WkJVUEV1czFHZnBNa1RVQjBvOWcrazBhMnFRZUo2TWJ3MlV5eTJS?=
 =?utf-8?B?R0V5Y2E2TjJkSW40YXR4a3lxeklaRkIzZjBXd2JobWpmQkdRR3hEYzJNNUhn?=
 =?utf-8?B?a3BIV0ZocmZEcmlENnYwdTJMM3ozSWoxVEVuTzBrdzFPNlhqcTcrSEpvUzUw?=
 =?utf-8?B?MUdDQ05GTEJSZWZTQ2c0K0pUR2hMQkVmREg0b0dsMDlGdk02YjJaYTVKa1hz?=
 =?utf-8?B?VkYzRk9SRHVqUjVXS3NtejRXY3d3YUcyMUVjazYwREZSaUFVQjhqM0dFRjlP?=
 =?utf-8?B?WHBMR1BFVnhtR2lzT2ZmZmVFOU9XNVFLcE5sQlpwUUlvRUZHV1FZRi9qMVZx?=
 =?utf-8?B?N0ZWOEJ1ZUszd2YwSmlqbklrVXZJWGxKMGk4Q1pTZzFFaG1mYjVxYXNxZEJz?=
 =?utf-8?B?WlNhQzhhZDB6WTVUS1dsWmt3R3pLUkxpSmFKL1JJelVyZkp6US9IQjhLYkcy?=
 =?utf-8?B?bUxLak9hdzEvNGpUNmVYV2FwcVdoZlZwMTBFR2RZSTkyY2NHaWFnaEFrK1dL?=
 =?utf-8?B?WW9zZVU0YlFqS0hxckJGZFZIT3RkT25WbGVaMUFwRGlVZUw5cllGNjhMUzdC?=
 =?utf-8?B?NzJuYktjTDFScWR0emlvRWkrcGlnem9RNFhkaUYzV2NaUDdIS3dKZlFjWXlv?=
 =?utf-8?B?cHNvMkZFcjF0NkhDTk5TclBaTnB1WmhOUkUrdmFzSHRDWXBPQWtZN2ZHaUlk?=
 =?utf-8?B?NkQ1WXBROVdFSHc0cnpCVk5WbklxdE5adkxOWllBTnVwck01WWtHcHpudlhM?=
 =?utf-8?B?ZE13N1UxQ1BjOG00Z1Fpd1VlanlxOGxxa3ArNHhNb2tXVFlIeVA0ZnF5a1JN?=
 =?utf-8?B?bEJvVk5vSndoTlVOY0d2N0lrcWYrNlZRemY3eGFESjBLVG5XeVpkUVNzSmVK?=
 =?utf-8?B?Y2JrUVJQMXdSdDk4ZllzSDYxR1ZiQ2JYOGdSUVFxSVpDeE5HN3RvOCtPOUd2?=
 =?utf-8?B?RjBQUEZJNE9CNy92akNNYzZWVTFKTTdGa0xaWXA1RVM3ZFExKy9CTGNkbXRY?=
 =?utf-8?B?TFJVNkY0SWh6OHpiWW5LYm1LcmtyQSt6elhLbnB6Q0RZN2J6WFpQckhoM2Vr?=
 =?utf-8?B?K2x1Zjd6NG1vdVlLN3dmTWw0cm1CQWJYQndkRkpLdGVBaE9pYTBlbGVneS9X?=
 =?utf-8?B?UnJ5b014bXNCbGdCVzRScER2OXN4ZExmbXFmTDB1SHFMZEV0UXM2QVd3SkV1?=
 =?utf-8?B?TVJSWEtEdzRVRGhZWmYxV0NZbmZReGpyL2pDWDdKTS85b1lDUkdpWWJqSDBZ?=
 =?utf-8?B?cEZxeit5SW05eGNxRytNK0ZLa1BHTS9zeGNWWGlMTGJ5ekEzK1habnl0S2Vn?=
 =?utf-8?B?YXFueTNSeGF6ZFkvK2R5SEtyR1o5VUhtU1R6VUgzTnJTRm5zS0hlS0NqOFIx?=
 =?utf-8?B?cFYwYXBnd2xRL3FnazBLbm5wVkRVcFFlaDY4WVpNcTlxNXp4b2U4eFBiWTNo?=
 =?utf-8?B?a2lxS3REU0gwMWxMU29QZzVxWG9UZGhxaHJBekhrR2NKQzVCUldJekl4YnU2?=
 =?utf-8?B?Kzhlb1JxVCt5NHdnb2VXbTdyU01UeXc0UndyQXhGd0RoVlBIRHVMRnZNQ1k1?=
 =?utf-8?B?NlZEcGcvTFBpeDRUaUhoYTkyM2kzVXF5S1c4TFhEbGp3WDRHM3Vndlh2RmEv?=
 =?utf-8?B?anJDSjJQVnliRWxOcUhZVHdZNDIvVTJzWG1OVUttZVhYREZ6bmRveVMyUzhM?=
 =?utf-8?B?b3FONXM1eUpocDdsSTRZT0FmSi92UHB2QUdiS3ZtRzhiT2xRRDNTNzFXQ1hH?=
 =?utf-8?Q?VwhlWFbBc0D9bqFdOnrOczA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fc3893-0b8d-4570-c225-08dd47549045
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 08:51:08.0924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/IsCyYuogf4GweZ8uuYSaHkThA874d6KKXElbJ+dMGj3vvuZojzgwvsEtN02z/r7Okp2nEecRoDvS6MGTa/d5sfR5ERAlxZbGBdv9qZfPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 08:51:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6276

Hi Antonin,

On 2/7/25 9:27 AM, Antonin Godard wrote:
> The commit 4ccc3bc8266c ("classes/recipes: Switch virtual/XXX-gcc to
> virtual/cross-cc (and c++/binutils)") in OE-Core changes the
> virtual/XXX-gcc to virtual/cross-cc (and c++/binutils) syntax. Add it to
> the migration manual.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.2.rst | 35 ++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index a60e3e9a8..2e9095bfb 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -105,6 +105,41 @@ some obscure bugs.
>   Any logic based on ``BB_CURRENT_MC`` equalling to ``default`` by default should
>   be changed to be equal to an empty string.
>   
> +Virtual toolchain provider changes
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Support was added for virtual providers on a per-recipe basis for specific
> +key toolchain providers listed in ``BB_VIRTUAL_RECIPE_PROVIDERS``. As part of
> +that support, the ``cross`` providers were simplified to remove the triplet
> +prefix (:term:`TARGET_PREFIX`, :term:`SDK_PREFIX` and :term:`HOST_PREFIX`) and
> +generalise the naming. Here are example of how references to these variables

s/example/examples?

With that changed,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

