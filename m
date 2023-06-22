Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C470AEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 12:54:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.54])
 by mx.groups.io with SMTP id smtpd.web10.10597.1687438459772470241
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 05:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=DfSQgflq;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.54, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFUNZxs0EtTgBY54+tJtJhmEbaAmOBC2wc5Xoktnvg+PZYEgkTcKqYo+4C5oGgl/LWgcM0efrOI2axuSp2AwX9NIyY78wU9cB2wEeZNT+DLPZdYP62diVmXKNTHeJkK+7tUWNipWNUN1pCYX9JeJXuanPJ8kpelENqI0l8hUdwjngwynho2Q1xsUctf2YSzYcA4Mqi1ahtJ36HoU0C+Wqg6ggKEI4O+RDCqAzO7P9EGfxNEONsfKS4zX8rsUsy2fBVIB4Va5k1voMUyfxmGyaXBiKIYYQ3MOHLxMKvyNYdQwoxxmKpm/TsPEH6vZrohOxdGa2WgNEhJHpZfI1uO8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhMa3hxRPGpcZVWzIfxXExQjpM0HvVWQMLQYeQ+ul6w=;
 b=QFETb9i0cTTJfZclwSE+6KjODOe1a6f5lyHq2TLmNShm2Q94HjGf9MOkKu59AkCqyMZHeMp6Yj/MlyAIFPryCGW33CIlCvu5umroGOjo/v36RJShLDhcFSwQcgup0YRSqriUS6VxQE0FXO2uJgWCokMt6d+78AjbRXvURv24XuTor9xKRQR0JoIvmUkZcKUQdJDvzEeF0cB5lKa0osOrNeaRcrhtms4d8ixWDXzqRLmKg5LLjRtJEjC48gXV4hSgd2b+OHsJjG8Dy7JzFvqXh8D5no7/oPS7E1BVwjZCygQE3q6D9LmmLAlDMIqqvJVYdtjsfSaTstN/jg3+alD7nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhMa3hxRPGpcZVWzIfxXExQjpM0HvVWQMLQYeQ+ul6w=;
 b=DfSQgflqoWyg3zmLB8slgIYzxzLqeVCtvYs4AAR4oym3Ko9q72J5jJcz6rRHJQTyGK/sNFDTBVj0HKNZ9iLVEIv4p/cf7Wfl98ypgZlUBAPfi+7JJ4rvmup3D+hqN/bxS//yII8rbpYItbsg3r1kl4TafYGMTtnRmc9LIjuZEmwYjunpnQccpMH8FoRojaa/fMZyr+JJHp1J6w12GYvxiBidZxoiwam7FomKiJUU6F116GWMaC44H5a9heFqw5ZbX98wVTFEZkUJ+pIml2dr7p8f+YmgpqQ0DaIZS85QJscIJzQjQ9pUZNgSrru06KSw+ZWE5eq0v4C6N4CWEVg1Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB8PR04MB7145.eurprd04.prod.outlook.com (2603:10a6:10:fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 12:54:15 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb%3]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 12:54:15 +0000
Message-ID: <f4e27e11-5b97-207e-61e5-559dbad5da43@theobroma-systems.com>
Date: Thu, 22 Jun 2023 14:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [docs] [PATCH] ref-manual: classes.rst: document
 devicetree.bbclass
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20230412191122.620584-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230412191122.620584-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB8PR04MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 54839ef3-c593-4543-05d2-08db731fc8f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a3vZl+M0IJkoNGBBIgpM0C1/ezUUEtT19nUyWZ/BgzcEenTVq/DqFbFKjcerdmKEilVYT0F9wOFd+PWQezI06Wjo39tJihHLzijquIUMMFK0mL8BrGgjACCjuuNUjCH+1QKKiyVSxMwwNCF5w1jOJ4YLyV59MCgSax/GSZbYFpk/y9P7tMcIWUE3LfAaAN6BR8FVIZsosbQ3QiD3MRnHuq/kxNHkjO3Ge/j3ozLFVspTMCz8pdPuUAL3CheLKabL5eomLSp/rywZNSxvawrRwRvT/Ac7Q1Ws5R+01SEbc0XSesKeQE9yzqvgunXl+qxwG7SUI49zAbdIDVVTvzRvLdCiKfa7TEFNJbktkLI/MV3L81II5r/CiGYHls8Lnn+PB/GURZtKEVRIjdP9DcQACFl270CVVjcNn6+8S2vZOL2qzPy4o+oZOKAobW8Vj9Qq2tVd1aVjQS5fgWJ0A+LOJV07Irz1aeRkv3kpn9IX7IBpBrTdbiJptb4cNm362Gix+0V66s7mLqTALFAD+4sHXtIFDlHZaCjEwSXmXrurRKUtjDcx5eoTAczEoCr4LWFVQSZsljHaqi0tS5IXAiKdltWkyxA4eRWxB6qPDGdfobklqQ2xzPcY0n/WVzpeGhRfCMhqDaAAvaaN+5smgw6pVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39850400004)(136003)(366004)(451199021)(53546011)(38100700002)(83380400001)(6506007)(186003)(6486002)(2616005)(44832011)(5660300002)(2906002)(8936002)(8676002)(41300700001)(36756003)(478600001)(66476007)(66556008)(66946007)(4326008)(6512007)(31696002)(86362001)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SStPTzYxYjJOVnJkd0w3TVY3K2JWMmt6MzZFY2NJU285SUw0bzFZODlXNVB6?=
 =?utf-8?B?aExsckNhaDNvRUJVbzY0YnFSeGZRMXVZdmhScmRLWFd6b0tXRDlQcmR4N1Er?=
 =?utf-8?B?MDhaSm9MQXRqR1ZWTjhDNk5hQnJ3SmNaU0N3ZXo0d1RkVC9VN1NlZFdVNFly?=
 =?utf-8?B?WnorNnhoQys5VnFvWml3c1N6cG5KejRkSlhaalVXZHR6YTlWbW5xRGs1QWhx?=
 =?utf-8?B?aWVqZG9TUEw3YnQyZUZlcTZGeFR3TkxybTJUYm5hUVRHVUdPYUZ5NDc2ZnQ3?=
 =?utf-8?B?S3JXZHUrTGVVMWR5NE43SnEzRUZlbWRtMGkvOFB4L0dUQ0RXV2lBMER3TDlO?=
 =?utf-8?B?VGNVeEJMQ05xTE1zdmZOaitkYjN3Mk9iRnU0aDF1Mng5akNSNkNhSTZWZTBD?=
 =?utf-8?B?WEtlU0hYV053WHNNTTlFL0xlT0syZnlqeDRFd2gvMkhUY3E0RzRaNWoxNUY2?=
 =?utf-8?B?TnJxNFZEbUMzQUEvN1dJNjhBdE5YajJXRkFuVTIyQzZmRU4zK1NuZzIvL3Rv?=
 =?utf-8?B?ZkZDeWxnTzlTUE1GRVcvelVqTDY2T1RIWTltMGhQMmxJRnNORjFXTkluQmxV?=
 =?utf-8?B?aDE2dVpBNWt2ejNNSktwMVdHUnFxTUNhUVhLaDVUU0QvbUNkTFZ4ZlZlWjlC?=
 =?utf-8?B?NmpEeG0ycDd1czdXakw0OWQzNnpWUlRMOUVmUEZmRDJ1enEvVzE5V0RWMThY?=
 =?utf-8?B?L0lFMjByRTB6eHUraVlwYkVZS2JqTUM2VENvOEZ6NzJxdEVoWTYreDd1amFP?=
 =?utf-8?B?MVVYL0Vid2IyZzFVaU5pS1ZZYkJ1NDViOEM1NnBBVkU3eEhRb3lvY1YvMkY0?=
 =?utf-8?B?cWc4YmVyYlByQjQxdHdlODZxT2RzM2txbFFSYldqcWY3d3VNUE9BdWFKOVk1?=
 =?utf-8?B?WXRheHZIQXZDZjgxR2EvSVdJS2Eydi9ZRXFybUhxclhOUEZ6MjBMa0xKeXMy?=
 =?utf-8?B?UGFoVGkxTXlpUUVQaUFHblJXMHNkT1NXc3hpdm5ZTm8ybnJxV0RpR05jRzlk?=
 =?utf-8?B?RUliSjB1RzVzTyt4c3dSUklodDg1aFduVTIwVmNFTDIyVk43bFlLR3hGYmVw?=
 =?utf-8?B?TU1RRkZsQjY3Z1RXbnpWYkl6TWNRUmpzY0xoMU1MSjEyZ1dWOW11YUY2M0JD?=
 =?utf-8?B?b0RnSGt3R1ArTm9FRGZkeEVZVnAxMnVFV242N1hFOG5RdytkcWVLOVVZM1JH?=
 =?utf-8?B?ZDdRQkh4VWx2ZHpwQUJyVHNVM2hXdUd3WjdKUVFMbndvQ0VEcDJ6UlRRR0ZO?=
 =?utf-8?B?S2ZiMi85U2U4d1dDYTI4a0xsVE1RSlpZbVFUZzZvRXVCV2Vpc3UxTWlNTHBU?=
 =?utf-8?B?dkc2UTVmcmc0ZU1BTU9IVjFNV3RLS3lESXNvOHVEUGE0NXBPc0FGMUdBSlRR?=
 =?utf-8?B?WTRKb1lmRnBpYkZLcUg3ZTF0OStCYVYrKzdUTFFQQ25Ya1d3YzNHMmRwczF6?=
 =?utf-8?B?T1hISURCM3h0a2hpTTk1WEROcXorRDhKZTBzcjBjN3UxTG9JTXluK0duanVn?=
 =?utf-8?B?NlhwakdZVDUvamtNWG9NOTdSdkQyR1RRVUpnVnRCdTRHMW1jL2ZORVY5SWdy?=
 =?utf-8?B?emg1UFFNc0xEdnIwcitxdXI3emxUVWwxbkhZLzNGM0xoa0EzZFA3ZmdvRTM0?=
 =?utf-8?B?NDk2K3kzMVB2aGZXMnQ4a1ZNVlFVa0NFRzBFN045c3RjNVdvbXpZTkpDbFlt?=
 =?utf-8?B?WERuRXVUY1E1aTJLNHp3TzNhQ2o0WVZseE5MY3ZFdDc2d2tFa3JNWE9WNGds?=
 =?utf-8?B?S1gxSSt0TDNLck1ueGE1YWViVGFUbThvT2oweUlHZ2k5eWFkdzlQS3U5dVNk?=
 =?utf-8?B?bVpRWU5rdUdkeHZaa1YxUDB1aXdNMTNyL3cwbDg0YWhEY0YxOHRlQk1CTnZn?=
 =?utf-8?B?aTBOKzhYcktiS1hScVJjL0ZLckRGdlJOS2lsRkx5V2RVc3lhU0NWa2RlWUdr?=
 =?utf-8?B?Z2pnNHcwNXRIOEJidDVid2gyRU1aN0U1Q0xZMjRZcWNRV1ovMVUwb3dpRVdI?=
 =?utf-8?B?L1VTRzZuUGh3T0p3aDQwSGpKWjdSR2JuV29tN2tPZlZBSXhJaVYvYVE2eUt3?=
 =?utf-8?B?QVpQT0d2bW00MG0vb25uTzNLMG12S1J0MUYxMno5QkVaREJJS0FHT3JEK05v?=
 =?utf-8?B?VmhuKzFYaitnZFZZOGFTcUxuQkVhL3BSdGpuN3UzSHdha1kyemNvQ0Vpa3M3?=
 =?utf-8?B?L3pjMHZIU0xLWkxVZVl3VWYyTlpnYnBNU3ZCcVRlaFUyVTJyQTNkcnMzQkxi?=
 =?utf-8?B?YXIwR0diUWM1dWFXOVozMFZwTjV3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54839ef3-c593-4543-05d2-08db731fc8f0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 12:54:15.7503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPTE8lMUTZw7sYfKypQhXaTRTYY4QTej8j/6KpGNjj/sPU4/CinQerkYrRdn8CH+8gBJQkw4JKTRJK4fOvRD8VZ+K7F4dZy7en/rhIxJWElWz9wkxjTiubBVCbmJPvLF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7145
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 12:54:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4024

Hi Michael, Luca,

On 4/12/23 21:11, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This addresses [YOCTO #15092]
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 43 ++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index f8172e6b29..79a2bdb69b 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -580,6 +580,49 @@ add the task at the appropriate place, which is usually after
>   :ref:`ref-tasks-install`. The class then takes care of
>   staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
>   
> +.. _ref-classes-devicetree:
> +
> +``devicetree``
> +==============
> +
> +The :ref:`ref-classes-devicetree` class allows to build a recipe that compiles
> +device tree source files that are not in the kernel tree.
> +
> +The compilation of out-of-tree device tree sources is the same as the kernel
> +in-tree device tree compilation process. This includes the ability to include
> +sources from the kernel such as SoC ``dtsi`` files as well as C header files,
> +such as ``gpio.h``.
> +
> +The :ref:`ref-tasks-compile` task will compile two kinds of files:
> +
> +- Regular device tree sources with a ``.dts`` extension.
> +
> +- Device tree overlays, detected from the presence of the ``/plugin/;``
> +  string in the file contents.
> +
> +This class behaves in a similar way as the :ref:`ref-classes-kernel-devicetree`
> +class, also deploying output files into ``/boot/devicetree``. However, this
> +class stores the deployed device tree binaries into the ``devicetree``
> +subdirectory.

If I'm not mistaken, you're saying the same thing twice.

I believe :ref:`ref-classes-kernel-devicetree` class puts the dtb in 
/boot directory by default (KERNEL_DTBDEST which defaults to 
KERNEL_IMAGEDEST which defaults to boot) while 
:ref:`ref-classes-devicetree` class puts it into /boot/devicetree/ 
directory?

I think you may have used the comment from the devicetree.bbclass header 
which is also a bit confusing.

Cheers,
Quentin

