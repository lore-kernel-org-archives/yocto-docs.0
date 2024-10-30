Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE05DD5CC88
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:19:11 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web10.11738.1730283542630727080
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 03:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=n+aSoLWe;
 spf=pass (domain: cherry.de, ip: 40.107.21.41, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9twjghIdjA/XVqHDsi0e1C8+/0uTtXUqzYt4gLtev3sXa7zJVmxt+wnVV2xIOvqCC2RCTKJEBUDbeGKFD0Beo90YrUl4qW/MbZok7/8bRY7+D0sI0zaucB5Nnav4x8weLghqqsDizcgUAr/jXf4adwNyg/d0lWJah9G6EF1mOH6dmXysp2+US8mrBQkbGcy/6C32vlt4ORd4+coF2nzY55Bk9cae8g4ljRaGsnN1pkG/5snmgkrXZA58uqfOBA8E/FHHxdUpQMiHUZhQ0ammObABo2zTMf4iJWz6ldRgvojCRmTbGGxbfjkFK4CSwEUZaaLn0I7j0/nvO+hs99HeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9tr+EyqDnPCSMnUk0gG94lUvQvLfSx+M7q76faF2uY=;
 b=DK4hOS0v+QNhihKI35cwdU70piCtONhedZNzPGxKl6DuQxpqqrqZxCyn0EUW5XlS/aC7UypTLp0f3kb0BwKuesUWuasaiQ7+UtWaJ/1KgxUolDRrd1jXUR1HGJVZZDkeXfH1n+YE0bLZiDFLSB4xnuCrclGc3Urk8Q5GuWQAzfrGme/8YDyMPKx+2zFRdB9XJhKFqwREgjiS7A6JiyyK+9VEmN0Rm1OzLpNsctd0CzY5+XitFF8lubISXq/CzPXXoqPISZCMjaL1ExyhbWjstKkMJWQcOCp77YnwHOYd4dTJaz79O9tTuikMLSgweWmbcBLytwqusrqGG6DXgQpWiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9tr+EyqDnPCSMnUk0gG94lUvQvLfSx+M7q76faF2uY=;
 b=n+aSoLWe5FCZfiseBxwyQCyxQUEHIoO5p+Afq4AvUEruyZSWOBhBL+yYI80ihaXo/4cIlcMPfYDSkztqbgmWz0L3hZnAvuKBe84bTEUpaIaewqPPoiLKp1lXGuRe94b+nP9BnfUnHF2qXCtyNIYaBs3FNc27WGaZDI0pfvRl7sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10089.eurprd04.prod.outlook.com (2603:10a6:800:227::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 10:18:57 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 10:18:56 +0000
Message-ID: <4fa6fe53-13a1-41e3-9604-ffb9698b78ca@cherry.de>
Date: Wed, 30 Oct 2024 11:18:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] dev-manual: document how to provide confs from
 layer.conf
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
 <20241030-layer-confs-v1-2-0f7dcf460e27@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241030-layer-confs-v1-2-0f7dcf460e27@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P195CA0062.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10089:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe13380-c8b9-4f55-224f-08dcf8cc4342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WGFnc2c3cUdOWHVQZTg0ajdFZDFaSVdObEpNQmJJQmpNa3FhS1JOd05aOEIz?=
 =?utf-8?B?R0N6bStFQ0VMZ0gvbERnRjdodWlzMTBnOFd2bnFsdWx3YnNKaTNKTkhaNits?=
 =?utf-8?B?YVBUWEZ6SVdHL0M5eURaR0ZKRm85YjAxSm5ueVJKSHZURWJqNzJJcUFJWWpI?=
 =?utf-8?B?Ry83ZTZISDFuN1VMS1ZVSkZobTVKYWEyVWVCSVhodU1DOWdxSXo1QThENlNu?=
 =?utf-8?B?NCtZb3NUNi85VE9vNkxYa014anJjb0h6Z1dBOE9qZDh6Y1dSYno0cXl3bXhp?=
 =?utf-8?B?azlLYnJEL0FkcHdFSS9QTGJ1b1NkYzc3a3IrTVNSNGRuRGFMNGR4VXFMcENF?=
 =?utf-8?B?Umx5K0VuSlRaQStGWGxTMUVDcFVSMTZrRFJoTk8xUzIrT0dxQWxOKzZxZHR5?=
 =?utf-8?B?QlFpTy9UdnovdTNVQzFmSDI3ckFJS1hIenJDaGcwZUtEL0ZCZzN2a0JXV1RO?=
 =?utf-8?B?QWxSWU0yclpiZUxZbTRyd0dMRnRNUnYydGhtTGVhVmtoWWdEZ1h1Mzd1cGpu?=
 =?utf-8?B?VGtQVVpKcnFnMUR2dG11Q0p2cnNvWlNicGJwaVdFcUFJa2Y0WEt1NElaQ0VR?=
 =?utf-8?B?bDNHWWdhL2luMW5QYmlaVE5CV1hQTUZJN3pHSHZtcXRlQnIzc24wMGdvWUh0?=
 =?utf-8?B?YnBkdW9QRW5kUFUrT1dqOEpyRnA2UVUrOGIrMkk1Zmc1Uy81RDhPcUkvdTM3?=
 =?utf-8?B?OHlJQW9oZXZHVGlRbVRDTlFvWWtkR2FBT3lkVXc4OVFJYWxvRTR1MEpxcXVX?=
 =?utf-8?B?N1MvU0t4SzV6bmtETlc2RjRGWVdzVmsrckN0VFNFRTFuMEVCSGdiYXMrUjFC?=
 =?utf-8?B?MzZYeTBXeUE3Sk1kWHVEeXpDU0QwTU5YakdnTlJMSGwrZEVJQ3NZL2loNlVZ?=
 =?utf-8?B?VDlTbEtOd1B0L25FNzFoVjUwM0xLVllVRHdHWDBXRHNualh6RHZqOEJOamtW?=
 =?utf-8?B?bEpHcmlRS2F3TG5ZSXFNTTh1Z0JjYXVsaW9hVkdORnFVOTd0NnF3UkFzN01V?=
 =?utf-8?B?alJFL2s1QUEwL1BJay9CTEFhc0FlMy82M0paaGtYK092a2pSdUNvdGJCMWtR?=
 =?utf-8?B?ZytEMXJDSjVkYU5uY2ladk5LaWg5NSthRFlYVVN6UnR2cTJWVWpwZTgwQis4?=
 =?utf-8?B?TWVZR0dvZCtwUWk0N0dKRGsvcU5mZlZseldiR1ZqTS95UjdzVnRPb2ptSVhj?=
 =?utf-8?B?OU5uT0JPamVVZU9FdTI4SjRVdmxzU0duZ29OTVc4S3V3SlZBTjNkQlZPQUFl?=
 =?utf-8?B?cGczSnJDUWJJdlRVL1AweDhkblJ1c2hDcmlESitNK0ZoM1Y1UEphdFVFRHhF?=
 =?utf-8?B?NTJBY3RNT2NndjVjRnR5T0RTUVVUMWU0TFZCRmg2WE1XVUppNTdrUkp5cE9h?=
 =?utf-8?B?S05EeEdZN285Nnk3dy9MZmI5MG8yalp2WmJnb29wV0RWTW5DZU5vQmZ4bHI3?=
 =?utf-8?B?YkR6MjEwc1NVWDRoWTJHL2pWWmc4UlZaQUhJVGVpQTRGbDRubUNpWWhwMEdQ?=
 =?utf-8?B?OUVLNEh3K3d0V1JYeWxNMG5xdlBBNDFpcHkwQ3VaQlB4YWZNd0ZoUGUvV1Vj?=
 =?utf-8?B?Vkt2bzM0UytDa1NjWWYxa2dLQnA5WG12bVlDOEIyQTQ0cVgyZC9wUllzdFRO?=
 =?utf-8?B?N1drdzJaWDhZQ3MxTml3enVOQmxHNTBVME8xckV1VmI1dWdzbFZMYW1raW90?=
 =?utf-8?Q?dCXq9tc84Vr0x0RUgXXw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SklyaW1VczZucUF1cDhISmFPWFBHanRpdHNUaDN3dzlhOEdzWkFodGgweCtU?=
 =?utf-8?B?NG5rOUYxR0RkYThTRDJkdnRxTlFPUXl1d1JDUGxhVStCb3RJYVc4dU9qcTZP?=
 =?utf-8?B?MGVadWMvRVgxMnMxZDVjTW82WE1YODVuZGhsUXh6QjJFT0Mwd2hkcWJzZUdV?=
 =?utf-8?B?QmxrSktqNENuN0hhS0ZsS1IvenUvZjAxNlQ0eitadjFKZm1QTFJmT3dTbHZU?=
 =?utf-8?B?VHVSWE9Hdk03NnQ3UHFsYkVPRmFMY1VaTnZXVUxvTWF0NkZ2ZzFVdmxYMjFS?=
 =?utf-8?B?U3VWTDFKSmFYSDA4S01uSzd5bE5objNUMlRkL3NoQXhCeUt4bHBvcTQ3YlFX?=
 =?utf-8?B?QTJyK25xdXk1L3BsUmNVUDZIUDhSaUE1TmNrZHFlSWdiQWh3eE9VcWV2K3d5?=
 =?utf-8?B?WkgwdXMvNTlUdzdSWml4RkxjK2xyYUFTT1hMSnFBSTJrREdnVm9Fa1pHaFdE?=
 =?utf-8?B?TmttYWR1QWhDa3pNdDFEb0RmVzVaV0ZEN05kcDQxc0lWS29VeFZ2UG82enFU?=
 =?utf-8?B?OGtyZlozQnIvQ1IrNzFCZGsxaUtwNTgycG5qOEdGRFdxOW1pQi9EUENpNTg1?=
 =?utf-8?B?SGtFVHhmMnJZbWxoM2svcS9BSFh2RGZnOWZhejU2RHdiU1NqV2l3Tkw2ZGtr?=
 =?utf-8?B?Wkl1Yi9qMUVhS1hQL0JROVZBRk44NExHTDlvdkpBQURRTXJnRlJJU0ZpOFE2?=
 =?utf-8?B?ZzFtaGtNVjMyQzhtbUVwbVdiTUpFUTI1K0tkNjRRSk9PeXpGbDRVeldHSVpl?=
 =?utf-8?B?TzMwclJtdGgzclFla3VzenMxdjQ0VXg2WE16OXlNWmdsbkExNzR3SUQzZ25N?=
 =?utf-8?B?OWtyNm05dEFjZ2FsaW0vNStwOXUwL2JURDFvdWpNdEFOWElMb1lFZ0EwdHdE?=
 =?utf-8?B?OFQxSlg2dUwwckYrcHpJZXNPYUhWM2ZXbE1PT1B4NFpHQkFSbVgwdzI1TzA0?=
 =?utf-8?B?UWdhd0h4UlFsYXRSUGh1eHRLZitKRFhwU01iOUdkcEtKaE85b0Q5Sk45cVdE?=
 =?utf-8?B?aWszQ0wvb2tFcGxyRzBOR0lKOWZqVGZ3WHlFaUQ0TXc0QjdVcy9sWGZBeVgr?=
 =?utf-8?B?WkpXdkVKUnpqZ3lXZnpUOU12dTNtbUFjeGt2MmxBWlAzekRoYnJEb1dnRTlo?=
 =?utf-8?B?Q2NmeHVXTSthVy9KZzBqSTA0czFqMmNaUTJoa3BnQ3hseVVrV2pHVDZ3K1FR?=
 =?utf-8?B?dWlOUWtzQ0JPTWZHV0t6MXo4aVJlRjhWSyttSWNLMDZaQU1JYjFFMXZoRUk5?=
 =?utf-8?B?ZnY5MkpSMWc3YVVxS083VGRCUXk0bWY4QUh3VGt3TlFRc0lhSXpiTXFQUmJy?=
 =?utf-8?B?Rm1LWEM1dlVkQVloYlo3Z1RIendyUWpHRzBFVDMxczhBTFF0YVNEQTloY3FM?=
 =?utf-8?B?VVp4SUZuemIrdzJqVUhJa2tXTXQxZnlQdmRYbllnTVF1bjlKMVNsRERmQ2o1?=
 =?utf-8?B?dUp2VnN5aUFtNHJJbHpuZlk5QnhxcW0yRUs3WnVPOXdUOW1ROHJKTDdhWkJL?=
 =?utf-8?B?QWU5c2hiSjFYSzNwbXl2SzRabUc2NElVdDVmTWpTT1o4TUdIdFJQcVBUZnp5?=
 =?utf-8?B?ajF0MDFOOWJmMm5CWWFReEtieTVFYVA5N3Q4Z2FmMEhTeENaZHlPWEdQbEQ2?=
 =?utf-8?B?WUhuNm5zVTRuM2xhSmNzVHVkV1NlRHZiaDVwWUtTaXBDRmgrQzVpMDRBK2FW?=
 =?utf-8?B?OVk2b3A3Sm5YMitQcVc1V1doMEdtYnhVVUhHT1JoOW9vTnA2T3R5ZEc0Y3BY?=
 =?utf-8?B?aEYwd3ZBelVPSGU2TXovREJIcUtBbzFMUFRDaFlOQXdOODBzRXppaGdXdW9T?=
 =?utf-8?B?L2xDaUZSQ2hpaDVDQWRaT2JWQmJPK3J4OWRYNFVRU3ZMQkhVMWM0WTlaU0lK?=
 =?utf-8?B?ejdpQ2FtY3licS9rbTZ1MWlqdm1saEtkaURYM1FJLzJycTdQTy91MUZ2dEgr?=
 =?utf-8?B?RERjY0M0ZXNmZCttRWk0UUFoYzZVc09UN2h2VWo0UWpoaVFzQXlkYmQ3VnR4?=
 =?utf-8?B?ZGtmcmJiNUhYMll5V0xWREd5akpvSXFpb0c4ZDllY29UWGVxcloxZjFyMnFw?=
 =?utf-8?B?ZU10UnV2R3hpSjQ3bEhSV1RIaWFwNFVzT0R6dERSWUh0Qms1TC9KN2Y1Snkw?=
 =?utf-8?B?WCtVT1VuRFc0blZhL1NXRnFEM0tIcXQ1ZlNSYUhIRW1nVTBzNG04NDFSTDhL?=
 =?utf-8?Q?8DDPYwmAa+zyJmuV/gAMrNc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe13380-c8b9-4f55-224f-08dcf8cc4342
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:18:56.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBIAMZ96tGTydnF3aIJn3BuvVIb9wETf/ZQbCITKGwVur8PjkCjm00aElS4hHBOEF5w+HcOEX42iLHBdHkyzt/DFnRb9ydkZS2WnkhWyZ6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10089
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5616

Hi Antonin,

On 10/30/24 10:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add a section on providing global level configuration from the
> layer.conf file. Since this file is parsed at an earlier stage in the
> parsing process, it's not possible to combine bb.utils.contains and
> {DISTRO,MACHINE}_FEATURES to conditionally some configurations.
> 
> This patch documents:
> 
> - First that this file can be used for providing such configuration.
> - Then demonstrates how to conditionally provide them, using a technique
>    that is currently used in meta-virtualization
>    (https://git.yoctoproject.org/meta-virtualization/tree/conf/layer.conf#n50).
> 
> Fixes [YOCTO #12688].
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/layers.rst | 78 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 91889bd0ae391c7b6e62068778ae5c180c840762..94d959fde67e911435d99ce8dd85b3d591573c82 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -644,6 +644,83 @@ variable and append the layer's root name::
>      order of ``.conf`` or ``.bbclass`` files. Future versions of BitBake
>      might address this.
>   
> +Providing Global-level Configurations With Your Layer
> +-----------------------------------------------------
> +
> +When creating a layer, you may need to define configurations that should take
> +effect globally in your build environment when it is part of the
> +:term:`BBLAYERS` variable. The ``layer.conf`` file is a :term:`configuration

"when it is part of the BBLAYERS variable" is a complicated way of 
saying "when it is used"/"when it is part of the build setup". Maybe we 
can find something more explicit?

I would also suggest adding "in the new layer" after ``layer.conf`` to 
explicit the location of layer.conf (maybe we should even add it's in 
conf/?). We have many different possible locations for configuration 
files so I feel like we should tell people where exactly to expect 
files. (e.g. local.conf, distro conf file, machine conf file, 
(multiconfig?), bblayers.conf, are all expected in different locations).

> +file` that affects the build system globally, so it is a candidate for this
> +use-case.
> +
> +For example, if your layer provides an alternative to the linux kernel named

s/provides an alternative to the Linux kernel/provides a Linux kernel 
recipe/

s/linux/Linux/

> +``linux-custom``, you may want to define the :term:`PREFERRED_PROVIDER` for the
> +``linux-custom`` recipe::
> +
> +  PREFERRED_PROVIDER_virtual/kernel = "linux-custom"
> +
> +This can be defined in the ``layer.conf`` file. If your layer has a higher
> +:term:`BBFILE_PRIORITY` value, it will take precedence over previous definitions
> +of the same ``PREFERRED_PROVIDER_virtual/kernel`` assignments.
> +

I seem to recall this is the perfect example of what we do NOT want in a 
layer.conf though (might be bad recollection though :) ). I actually do 
not even know what'd be a valid reason to have variables directly 
defined in layer.conf (I see you're providing an example in the next 
section, but do we really need this section to provide an example of 
something the user shouldn't be doing?).

I would add a very big note/warning at the end of this section saying 
that this is almost always wrong as it is mostly expected that adding a 
layer should only minimally change the build output. And that for this 
very example, it should be in a machine or distro configuration file 
instead.

I am not sure that BBFILE_PRIORITY is applicable for this as what 
matters is the parsing order of all layer.conf files from entries in 
BBLAYERS. I believe it's just parsed in the order it appears in 
BBLAYERS? Last one has priority (because we use = and not ?=). If that 
is actually working, we should then expand 
https://docs.yoctoproject.org/ref-manual/variables.html#term-BBFILE_PRIORITY 
as well because it clearly only defines priority for recipes.

> +Conditionally Provide Global-level Configurations With Your Layer
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +In some cases, your layer may provide global configurations only if some
> +features it provides are enabled. Since the ``layer.conf`` file is parsed at an
> +earlier stage in the parsing process, the :term:`DISTRO_FEATURES` and
> +:term:`MACHINE_FEATURES` variables are not yet available to ``layer.conf``, and
> +declaring conditional assignments based on these variables is not possible. The
> +following technique shows a way to leverage this limitation by using the
> +:term:`USER_CLASSES` variable and a conditional ``include`` command.
> +
> +In the following steps, let's assume our layer is named ``meta-mylayer`` and
> +that this layer defines a custom :ref:`distro feature <ref-features-distro>`
> +named ``mylayer-kernel``. We will set the :term:`PREFERRED_PROVIDER` variable
> +for the kernel only if our feature ``mylayer-kernel`` is part of the
> +:term:`DISTRO_FEATURES`:
> +
> +#. Create an include file in the directory
> +   ``meta-mylayer/conf/distro/include/``, for example a file named
> +   ``mylayer-kernel-provider.inc`` that sets the kernel provider to
> +   ``linux-custom``::
> +
> +     PREFERRED_PROVIDER_virtual/kernel = "linux-custom"

Random thought but maybe we should have align this with three 
whitespaces starting from the first character in the list. Here it is 
only one and difficult to notice at first sight. Actually, it's two 
whitespaces, I think that proves my point :D

> +
> +#. Provide a path to this include file in your ``layer.conf``::
> +
> +     META_MYLAYER_KERNEL_PROVIDER_PATH = "${LAYERDIR}/conf/distro/include/mylayer-kernel-provider.inc"
> +
> +#. Create a new class in ``meta-mylayer/classes-global/``, for example a class
> +   ``meta-mylayer-cfg.bbclass``. It Conditionally includes the file

s/Conditionally/conditionally/

Maybe say "Make it conditionally include the file" instead, as the way 
it's phrased could mean that because it's named this way or/and in that 
special directory that it magically includes the file, instead of 
telling the user what to put in that file.

> +   ``mylayer-kernel-provider.inc`` defined above, using the variable
> +   ``META_MYLAYER_KERNEL_PROVIDER_PATH`` defined in ``layer.conf``::
> +
> +     include ${@bb.utils.contains('DISTRO_FEATURES', 'mylayer-kernel', '${META_MYLAYER_KERNEL_PROVIDER_PATH}', '', d)}
> +
> +   For details on the ``bb.utils.contains`` function, see its definition in
> +   :bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`.
> +
> +   .. note::
> +
> +      The ``include`` command is designed to not fail if the function
> +      ``bb.utils.contains`` returns an empty string.

I believe `require` too and we very likely want to use require here to 
make sure the path doesn't have a typo :)

Also, I'm wondering if this isn't actually "breaking" the sstate cache 
as this META_MYLAYER_KERNEL_PROVIDER_PATH would be different on each 
machine so people wouldn't be able to reuse the sstate cache.

Building with the exact same setup - and a shared SSTATE_DIR - in two 
different directories on the same machine should answer that question :)

> +
> +#. Back to your ``layer.conf`` file, add the class ``meta-mylayer-cfg`` class to
> +   the :term:`USER_CLASSES` variable::
> +
> +     USER_CLASSES:append = " meta-mylayer-cfg"
> +
> +   This will add the class ``meta-mylayer-cfg`` to the list of classes to
> +   globally inherit. Since the ``include`` command is conditional in
> +   ``meta-mylayer-cfg.bbclass``, even though inherited the class will have no
> +   effect until the feature ``mylayer-kernel`` is enabled through
> +   :term:`DISTRO_FEATURES`.
> +
> +This technique can also be used for :ref:`Machine features
> +<ref-features-machine>` by following the same steps, the only difference being
> +to place the include file in ``meta-mylayer/conf/machine/include/`` instead.
> +

I don't think the path needs to be specific?

>   Managing Layers
>   ===============
>   
> @@ -916,4 +993,3 @@ above:
>   .. note::
>      Both the ``create-layers-setup`` and the ``setup-layers`` provided several additional options
>      that customize their behavior - you are welcome to study them via ``--help`` command line parameter.
> -

Not sure this line deletion makes sense in this patch?

Cheers,
Quentin

