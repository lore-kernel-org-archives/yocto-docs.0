Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACBED49204
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:50:14 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10916.1765540211873366856
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 03:50:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=b5fLo7Jj;
 spf=pass (domain: cherry.de, ip: 52.101.72.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/xY+X0mNFXW8vZIfFkXrX1/j171Zu45aOhhn8kGbLaegHXLtWo9TsqxwBuMhlncKwfuJGZLmBG/WuVODhO0CwAQpgLEyrHjcasmnjvqnLtc1vkE60zyTkZIWEBYQjEqiVeV/nNKAMxfIvR/TdYJZQ1XeK4T1xHI3xO1TT2UQ1+48LRQv4pAvsJ8LvdI8b0/ssH4nNdshaacD3L17XFMbpJIKPd2ZrlSqy7KA7NjfUMrXy0xlgZ+yYxY+oZLwXtKRrnKNj+edSMXoMOsSjjO7R92QBe26QcJHq6FgIeIeEs9lx6w6XJzwoWMPIgxTgnUYszov5dpJM7rVepuCNRTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIJJTEBb9CZ5kL+HUyLhu893j1CyU/n8gWEf3ows8Ig=;
 b=bUCRnR+np3fut78XleTOz3sXBmeohFcoMUhVzvRFo18dGkeBJqOiEWYVz6SqBdYUm1GzxjdyZq4FM/ZWblRNT4slZu9KDOG5s8nz+zNAaMe7y5uvi1kgmvTAvHs2UzfRlgFKAXF3rdI91vKv2rjxEp5OmfAr82NDGaEPKKCUAIdNFNxxKNLdbNNy9xI5m16WAcIZ8Q9zMeJeT9iY+0hE5PoB+hCPwZ2ur+4MWB3jRyC2JbbM9gzCezwRapX+ACaEbReTOIVXdksL17iPQgMp2yYlxIeNMimArP+dMGsjlFeyBQqhIW3jL87Fb7b4DDW8qzb1XmebYgO3V66jqs4NPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIJJTEBb9CZ5kL+HUyLhu893j1CyU/n8gWEf3ows8Ig=;
 b=b5fLo7JjJBMxvb0NcX40KnxE4pSAH1H1tyt6O59RGpY0Ps5iOC8YM5HLXkY19teLB5uBgwUjwzBUXYjQprveJf80/ukDDlX/5wAI2v/e2WOE+egBQVzvMGvx2oABz0MJp/jaCUaZLW0XE5lc58QQr2avWougBZ/56R3i14Bk52Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB9232.eurprd04.prod.outlook.com (2603:10a6:102:2ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 11:50:07 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 11:50:07 +0000
Message-ID: <71fc0789-0280-4e3c-939c-310d3258e031@cherry.de>
Date: Fri, 12 Dec 2025 12:49:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 5/5] ref-manual/system-requirements.rst: add
 RockyLinux install instructions
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
 <20251212-build-docs-container-tlmgr-v3-5-a45c1ce6d8f7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251212-build-docs-container-tlmgr-v3-5-a45c1ce6d8f7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0331.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a58c5a-209f-4f90-e25d-08de39749891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bnB1eFNoVE9Ja29iOUlRYXVxSUlaNkRQM0RrV205aGJ2OVgxSVhhSzM4dTRq?=
 =?utf-8?B?ektkek5xVnErZE42Nnh4Zll0RmE1UUd3MlBYVjNKTWt6MWU0d1dBUkJPS3ZR?=
 =?utf-8?B?Lzk4MWhjMk1nVDdUNGhvNkdsWlF4TElQWGt2UVNmRGR6MHR2Zk50NThUUWNa?=
 =?utf-8?B?UGU5dHhsNTFYN3dDWWlMeFRTMFdJa2dlWmtyNVdsOStRdG5EUmhDWDU5OEdt?=
 =?utf-8?B?eWcwNXcwV0R3M05OSmdwVzhBb01CYnZXL0ZDOEh5NDh3K1YyNVpSZkN3cnA4?=
 =?utf-8?B?S2g5R24rand2NzBlMkRmdkVqYlQyRlo2L3VOWkl4NDhaTEovc3RzWEZJWE9F?=
 =?utf-8?B?MDArai9VdGNLWUowNmI5TlNJaWZmY1RodzJYZkdhbVE2RlFvbHZjRVJ6UnVo?=
 =?utf-8?B?Y2JvdTYxeWRwRmp1QWcwY1psN0toTUdhS29HamlyZkRkT25hQXFoYUZCaXdM?=
 =?utf-8?B?TFYvdTBUc0I3NzdhaTNJUFF6V1U3VU1RNHlQT0htaWUyWS83YTkwd3EzUzht?=
 =?utf-8?B?Tm0yRWdWY2h6NUxpLzN0aUdKUW1hSHI4MUVtZTNncGZKczFuMEtQSDhTdk1x?=
 =?utf-8?B?MnEyRHF4aTJ5REVwK3llTVkzZ3VvRXdzVVVudFR5QzNpblpTcStPSGpraklr?=
 =?utf-8?B?eGVYeEZac0s3MWova2kzSTJOZkZWRXdVTWJ5SCtneDNuTis4RVM0QzhlYU1Y?=
 =?utf-8?B?eitqOFZiVUR3V3NWRHFLbXBNeFlqTitYdHc3b2lDTXpyOHdUcDE5Z1VneTBZ?=
 =?utf-8?B?Um9UUGRzVEpSNWJxUDFXM1pDYkRuSnppZVlHZ1ZwMEVmOXkvSDZnc3RMTFJk?=
 =?utf-8?B?TjgwZVdqNUwwS3hqODZhYTVGeFB0T2VRcmY3blNNdmVwQUhYY24vaHF4ZlF0?=
 =?utf-8?B?RkVVRnVUOXBVcG04VGc0TzNUMXM2QjBDeUw3M3M3dU5HQTRYTjZtNGVBaGhq?=
 =?utf-8?B?QmNRSGxaYzVhemswbEMrd29sVmFLb0hFY3MrK1NmTndIbFpFTm05UHB3bVIw?=
 =?utf-8?B?OUlCTW81U2pJQ1BkbFUwOW9sVi9kWFNWdm43TWdHZDY2UCtQc292Yy9KODRl?=
 =?utf-8?B?ZWc2R2F4YitxTVZLUldFZW00dksvZHpuK25aNGVSWThXNlBFWXBTUnYxcExE?=
 =?utf-8?B?MGNrZjNlcmhpdnY4TkZwU1ViVXRlV05uSDBwaGYyL1hVeHJEc1lOelNPd1Mr?=
 =?utf-8?B?OUVnemxCdGU1ZmFqdjFkNXJHaWs4bUhGMFNYcmJoUTNWUzVnaENDNVR4TURr?=
 =?utf-8?B?ZEk2VkNTYmxzcTFHSTF0aDc2Snh5WHBXUkxKdHpldjZNaXZscE9WSkdBZXZn?=
 =?utf-8?B?VUFYY3ZCM1hyTjdTY0ZxaUdxNEYzdnN3QjNlSWtnM05YeUgzOE55bGFrSzB0?=
 =?utf-8?B?ZjU2UFY2VEZsQ1hyLy81bVAzbk4rdjA1b3VTUFNBSE8zUjk1cUlWQmNxNnow?=
 =?utf-8?B?dmVVWmpvQm9tM3gvQkwveTh4bEpLMDR6bW5qVFVZdGpCRzdJVW5CdnFjZ0c0?=
 =?utf-8?B?U3Nvc0hpcUpwTWYzRmU2VlpLTEVBVDVtNTdNN1J0UysvN0c4MStEWkN1Qmgr?=
 =?utf-8?B?b0pjN0NjdDdZcEJFU2pwU0hnQW1aNEZudWFleHdremsrQjIyUnpWMzdGdnly?=
 =?utf-8?B?VXQzWVdxeTI1SmZDSGovS252TG8wZnUrWDdya3ZTNVA3aEtiVHgxOXVySmVW?=
 =?utf-8?B?cExabThVWEtYbE5ueXBrU2lJNlpkd05FWUsyOVFiYWxMRHZ1dDUrT3NHQlZJ?=
 =?utf-8?B?K09ZMlJOMGcwclJjZ2RnUEtFVVJ5NEdsOUdzVzUvSUYwdVNkem4wOVVkcG1z?=
 =?utf-8?B?c09JSjZZamdsbTh4d1FXZ1lZbTdxaVJDOU00ak9COXN0TmRTNUlOeEF0YlBh?=
 =?utf-8?B?UmQ1UTZ5dHlkMys4UTl3dG4zOVZablFZTmNnK3lhYlEwa0M2eFlvaFd5Qmts?=
 =?utf-8?B?bFkyUW5LbXo0S1czT3V2VEM1YlFhWndydUV4Nng2dXZqbkxMOUZyRTVIbnZv?=
 =?utf-8?B?S1RNdmJhOFl3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHNPMjZrYk1CZmVnWHpuR1NNREdlVEtNMTlUNFpNR3lJQWlNWkYxTFJ3Z0pH?=
 =?utf-8?B?L0c2UFZtTU9tS0dTSkl1dExqakovVTJIMDNDR2tSTlhzZ1hNQVZUL3UrUXR5?=
 =?utf-8?B?QzFiNWZWRWJRWUJkSWJreUduNzR6aVM5Mk8yYUZncEYxM05TeUtwUkVrTnoy?=
 =?utf-8?B?U3hGWlNFSkZ5NSs5Mi9yL3oxOTlOQ2gwWlIrT0JrWGpNaXFOdkxWTkR6NThz?=
 =?utf-8?B?T2dhZlVXTm8vN3RkR0tNOHR6THJpY2s0Z2ZPMlFsbGNYMXVkNUx1QjVvUE1V?=
 =?utf-8?B?emhRN2s0T28yNkZDOWVySFFvcldOQkJSM21PcXR1cDUzRlN1STh4dTJ4UGpJ?=
 =?utf-8?B?ZmNHMmVpQUpaM0ppRlpZNnZVYkJjTzl5NHJUNGFpZTQ3aVFZVVc1NVd1V2JN?=
 =?utf-8?B?a1NvNmlJMzc5Z1phaHBPUDgzSVltajFZR2hlelIzeDU3THNkbFZpYkhpUjNi?=
 =?utf-8?B?YzhDWktVeks5S2dFTGp2MlRBVTVvVVFtVWJ1OTZEcWhDZDRxOGdOckg3bStt?=
 =?utf-8?B?YjlURGR6QXg5bzRXcDl0M1VJYVdXYVVzKzQxR25zd2pkMmpOZERRMGg1dzF2?=
 =?utf-8?B?MmFSbW1sallKUVprK0xjNm1TL2ppaGNQVzQ1SEdzalpYT2hQUHFGeFJKN1N2?=
 =?utf-8?B?emxYbURhTkN1UGsvSVlEYUxCUFhERnZ5dVQ3N3NLNFYyUTVVNHpqYUJXRDVD?=
 =?utf-8?B?ZHRWd0dNai92TGRQUEx0UnJqaGVWaVVzQUU2aVJpbFFzMUNZNXFDYnlMekVt?=
 =?utf-8?B?OVMrZ1A0SXhrTFBDSWxpNFMxdFZ5QUthNUNsTHgzQmxSTGVsV1NDNjZjRlhL?=
 =?utf-8?B?M3RRZUVvc1ZFU2tnOGNhUzNJYnI5TVI5WDNiVnBWcGdGTlB4SW82d3ZLeWJR?=
 =?utf-8?B?TEF2ZFVickZQaTFpeFh4QlpGR0NkTzBQME9ZYk5ac3JzWFE0U0xFZmlzTHBz?=
 =?utf-8?B?cERudWdXYWo3N0NFaFh5QWV4SXJRTXJjU1F6ZVY4aVJabzIyUEpjUy81bjVF?=
 =?utf-8?B?Mnd6MW9ZcWVyVkhXdW0yelVGVjZiZlFuY2dVOUhTQVNWREQzRmM3d3IrZHpa?=
 =?utf-8?B?Y0RnQWp5bnUzUERYRllWcC9xRG5zSlZkbGlFVUNWaTNIaENKRStRb21Ndzlq?=
 =?utf-8?B?MUFCRmxiOHFkODR1c3JZaXpuZGwyQTIwV0lwUVNibjROVUMyTEFvN2ZSWWJK?=
 =?utf-8?B?cEJjSkliYXFwZVI1dVUzcDJ0aHphSlVNL201YlZKd20zenZ3MjBveVR0K2Zo?=
 =?utf-8?B?NFpRNEExTHQ5SEpuR3VtUHB6OFZwSjZjakxzNFhrOEtpdXAwMkpSblplWlhz?=
 =?utf-8?B?V1NMRTBXV2ZmMTQrMEdMdXZIQTY3c3N6eExIdjNha1BPZ1JyV3JiQXZrdnN4?=
 =?utf-8?B?WHBxSnZjUjU2clVrMExPU2s3SUd0eTl6K3doOU12SlVvSWxaNFZLcUFzRmY2?=
 =?utf-8?B?L1ZOdTQ3ejlxWEJ3OSthZkNyY2ZtdUNhNVQwOERvZXJFUWx5Z1B1YU5wMmhO?=
 =?utf-8?B?UWwyZCtrUDBqOXhvcVN1bjVOb3NnZWlObit2Q0tlb0V3dm1lRVQwb29jc3Ex?=
 =?utf-8?B?eVNSd3IvWE9ZWnM0SmF2RDJuTDhUVXlUSlBLcEw5NHJHS0hMNmhYZHl2Tjda?=
 =?utf-8?B?ZnJINGc4T3hzaVVmaTJvS1BmcnBRNzcxcHdSNHNrMVBaVTliUVZyZndDN1Aw?=
 =?utf-8?B?TlNaMzE1cnNhWEpybloyQTJBNVErNElKMG4rZnJrQjdITFpVNGNKQkE5by81?=
 =?utf-8?B?TmdHMythVWVTMm5qazRENEE1eC9hb1h3cUdWMlB5eHQ3T1FBcTgxOTlCNzFU?=
 =?utf-8?B?RWQ0VTJ5c0NnYlY5enVDS2p4S25yWDY5R041TnUyc2tJWi9CY0ZLSzM5aHhI?=
 =?utf-8?B?YVNFWTNiVWlIS2dteWQxbXlJYjhkc2VrYzBmSC9ESFdyZzdwMmhCREwrL3F0?=
 =?utf-8?B?ZWp5KzFGUld6cVJlWUNTQmtGWEhjOWNGbVNkL082YWFSZ1VDTUU0dFMxZ3FN?=
 =?utf-8?B?NVVLS0loa01IcWlzdGRrR2MyMUFqYjE0MWRPQVU4U3pBVmhnMG1zaEd5K003?=
 =?utf-8?B?aVNuWEZkVWc5cXN4VVg3aHVGejZVczlFaFdTTUR1RHdHMWlrVFgwRWIyK3Vz?=
 =?utf-8?B?dlo3R2lVdFBWMkdtdFdpMmF5YlRLb2NObllTRFhYbm9TWS9VbkFLUFl5UCtO?=
 =?utf-8?Q?Ft9uXUIrNEr5rGcDO5wjTl4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a58c5a-209f-4f90-e25d-08de39749891
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 11:50:07.2588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wi5C2Kjxz1E/dvl4l5gSmC1LrDL6wq3im81KQN1fJwdWVnBt3NieLKKtoN1k6NRHXjoPCx5BCJuhXvTEQ4/DZDp5ylT28cylVF7lEAosHBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9232
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 11:50:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8270

Hi Antonin,

On 12/12/25 11:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add instructions on how to install host packages on Rocky Linux. It is
> very similar to AlmaLinux so installation scripts were based on it.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst   | 49 ++++++++++++++++++++++
>   documentation/tools/build-docs-container           | 10 +++++
>   .../tools/containerfiles/Containerfile.rocky       |  1 +
>   .../tools/host_packages_scripts/rockylinux_docs.sh |  1 +
>   .../host_packages_scripts/rockylinux_essential.sh  |  1 +
>   5 files changed, 62 insertions(+)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index b41295c4b..a56e683ca 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -304,6 +304,55 @@ Before building the documentation PDF, setup the ``PATH`` to use the installed
>   packages (with ``${textooldir}`` pointing to the TeX Live installation from the
>   previous step):
>   
> +.. code-block:: console
> +
> +   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
> +
> +RockyLinux Packages
> +-------------------
> +
> +Here are the packages needed to build an image on a headless system
> +with a supported RockyLinux distribution:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/rockylinux_essential.sh
> +   :language: shell
> +
> +.. note::
> +
> +   -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
> +      a collection of packages from Fedora built on RHEL/CentOS for
> +      easy installation of packages not included in enterprise Linux
> +      by default. You need to install these packages separately.
> +
> +   -  The ``PowerTools/CRB`` repo provides additional packages such as
> +      ``rpcgen`` and ``texinfo``.
> +
> +   -  The ``makecache`` command consumes additional Metadata from
> +      ``epel-release``.
> +
> +Here are the packages needed to build Project documentation manuals:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/rockylinux_docs.sh
> +   :language: shell
> +
> +.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
> +   :language: shell
> +
> +In addition to the previous packages, the following TeX Live packages
> +are needed to build the documentation in PDF format and can be installed with
> +the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/tlmgr_docs_pdf.sh
> +   :language: shell
> +
> +.. warning::
> +
> +   The Tex Live installation above is only valid for `x86_64` hosts.
> +
> +Before building the documentation PDF, setup the ``PATH`` to use the installed
> +packages (with ``${textooldir}`` pointing to the TeX Live installation from the
> +previous step):
> +
>   .. code-block:: console
>   
>      $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index 6a33b9068..23c3dfe33 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -44,6 +44,8 @@ $0 OCI_IMAGE [make arguments...]
>        - fedora:42
>        - leap:15.5
>        - leap:15.6
> +     - rockylinux:8
> +     - rockylinux:9
>        - ubuntu:22.04
>        - ubuntu:24.04
>        - ubuntu:25.04
> @@ -133,6 +135,14 @@ main ()
>         docs_pdf=opensuse_docs_pdf.sh
>         pip3=pip3_docs.sh
>         ;;
> +    "rockylinux:8"*|\
> +    "rockylinux:9"*)
> +      containerfile=Containerfile.rocky
> +      essential=rockylinux_essential.sh
> +      docs=rockylinux_docs.sh
> +      docs_pdf=tlmgr_docs_pdf.sh
> +      pip3=pip3_docs.sh
> +      ;;
>       "ubuntu:22.04"*|\
>       "ubuntu:24.04"*|\
>       "ubuntu:25.04"*|\
> diff --git a/documentation/tools/containerfiles/Containerfile.rocky b/documentation/tools/containerfiles/Containerfile.rocky
> new file mode 120000
> index 000000000..5430d17dc
> --- /dev/null
> +++ b/documentation/tools/containerfiles/Containerfile.rocky
> @@ -0,0 +1 @@
> +Containerfile.stream
> \ No newline at end of file

Same question as for patch 4, why a symlink to .stream and not .dnf 
directly?

Otherwise, with no experience or testing of RockyLinux, this looks fine 
to me

Cheers,
Quentin

