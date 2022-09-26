Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D316C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 14:05:08 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.55])
 by mx.groups.io with SMTP id smtpd.web10.28715.1664201101702643207
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 07:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=YWw6tbYM;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.55,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRmUMEuymfHifXRJaGOnRQV7TGkX/lhvRSSo7TTeVWcjQmcAAKY6atCfeTh4kvSiP0YSD09vLbzyAa2IJo+36JQTnkRsxuSLlZgyLb/C+bnpOeJL4jBwi5rReWG1cejJVSNdw5qE4w6ykgmZdlci93f0Y+as10q9RaZUyDjLNSeEdObPOsT6puq/v6PqjSqZsPP/8SgC8wm+pUFeQCc1/GHDeHHvm0J4M1Huc17H2mmqyfwF5T5K37h4LeepNJuJ02DXMSQ5O2Z1uSGsebY1w7M19HJzcr8Dd2GJKB37TyRUfio2EHhq+05veTeVGjZ6AElhwvXj3PdDHxsfU/fgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiAnA/XfqwooB88E6tPQ9szX7aN3kJoGvv+WSrGONdE=;
 b=Kk6PudScRUkV7fcAH0kLQ4KSgs2vgIRmGuB59lhK5Tb19ZjCMNDsHjCjWipipkKs9MFg38rlAQIodU8p4DQlLcgzq8GVAoJmna04CF3Ji/e7mNPRpX/4J5pAvLaXZQVm0jXOs5S1NdgyQv8cDE5nHWeQTLL806zIVmBp0tiF7FDcaGEUUDwv72/L38tAVxknKvru2DTgl/K1hUBxxjAKGrN/zmNSUt/qF3dteK8bEEr+n73K0bQjgI6hjU1aLbQ6SW/T6NslHk9SbUqYqsLBfN/uUWFOrC9bSpqDysbyQDfCSU/bo0e92MyXqIg7u/B7sPZwkNcALIvbLZ+P4pxvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiAnA/XfqwooB88E6tPQ9szX7aN3kJoGvv+WSrGONdE=;
 b=YWw6tbYMjsFbwfVXzbJluIs8pQLKfzx3utIGs5JADAu6Tb7phWn6+YTDpCbjyLUbfNFHLNV84Z68Xxt4I1R7F66r5rtbW3pZACtYqM6hVuWyRcJGgKIeOu29vmG8DINXuoxgnx80ueCjdX0p8lmzmISTo9zK0LiPYhR7tMCVzZp8rHSE37pCnn4AsIvsh/bvVg4xrRv97R2al7vgUlY+dzAermAWmPrVllI9ExcGwJ/eiwXS3yoBV5Lm5Hdn0qpkXzIAPvhd+AaiO1IipD8tcvTasufJ6qxZI3syGX+Vdp+JQSaXwuozraUHelo7/FoBAEI6ciNgf1BmK+QhvcYs4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB8001.eurprd04.prod.outlook.com (2603:10a6:20b:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 14:04:58 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 14:04:57 +0000
Message-ID: <d4ec2d36-c931-3732-356d-fb6e8478803f@theobroma-systems.com>
Date: Mon, 26 Sep 2022 16:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 06/30] manuals: add references to the "do_deploy"
 task
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <20220923175219.6652-7-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220923175219.6652-7-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf687b9-ee62-4ba4-654c-08da9fc81857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XQrQ2/BVZFnX0Hb38jkRhGZkmkcu1vIXhBGFkxuz+xXMb5dkrqn8YdK+Sg0m+vGnZoZtFqzSt+f647g4f4coieGnQl3n1WhnA+myxo1tp6/EhzQ1GmzliSeL7oYebmPcjdFQTK+d86IXNm4zNMB5zlhGwrV9rqQiz5gbqxFESGO1F5k6rVB45tlJLDKxlUJLcs1R6bigNPNG6w4DUtsj4bEWU0EaIXsI9Q6nIwVDXZ6BvkgZtmMkBubcxNqcm05suS2WD/zHvkenLVkik9qV0AJnh2ftpffOowfnSNuWIziZqi3Ms87LLTWGDQ5PUfCNjp0gHGyLa5w/3iAXuQRIaih5BjUr06pnMjdn8qq8gDWgzS7bUeppkR1pFKI/Lz6Az5W408ulj+wCf6DZbt/PTfDPq2DPPdeaIKghgj7mTLMXgUJ8QtBNt3JQjyqaHMBBTOde027JfK4/3/yZVll/7+jNOtGy1n/CothZ/EvarOKRLR0LcMMVs5sl29MR3y0sDtUsGqSQKv/oxQDkBjzcLItZ76U5Wz+/gXsQqOFZRpuP/GFn0SzcNHMRMrt4rWNqe5vCBqfoAp0mVWPASzLv1lnXF7PKwwmIspvhsGJ70+S6w3PY03Onn/g9EQmmFOKiH9FxmrpySBe7pHdisiZVZWbpnTN59b7jwIQIqJILmMYZpiuI3vQlD3UzGgv/U0jtLt7uACJXyDfyZT+Dqzs4o05cpR3FwNIMEccI60bL8V+GxKW0gb4k3YAiwon4FNsKmUrKFu6bX/PPBBQ6EGtqqMFEHCEi2fCpNdPNWWthsYZuEnr3S1oB1nwDy7DL0tRo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(39850400004)(396003)(136003)(451199015)(316002)(478600001)(83380400001)(966005)(6486002)(31686004)(66946007)(66556008)(66476007)(8676002)(41300700001)(6506007)(8936002)(53546011)(36756003)(26005)(5660300002)(6512007)(44832011)(2906002)(2616005)(186003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QS83NU5tMStFRVh6WkIxb1JwL01lYmNra1YrWi9nOXJDOHU3VHZKSlNLdmUv?=
 =?utf-8?B?aDhabjhrLzRXeUp6QVl3SXVZU1ZrUG50Y1QxNlZRZkFmVkV2Yk9xYnRmc1FY?=
 =?utf-8?B?TG5uR0RUT2ZFN1JPWjYxa2hlNGR0OTdJTG1rSXFYdnQ3NUR3RHUweEF0V0d2?=
 =?utf-8?B?dUlTcW9CK0xpWHE0cXZXdENmaEFvNm50TlB6RkdZcVRMUnhibnNyNGYrM09a?=
 =?utf-8?B?NlJPT3cwMThCSmIrbXd1UGRZN09WQWt6TCtpblZEbnU5dnA5VFBrbUdCbUxx?=
 =?utf-8?B?aTNTS0c3ZkhNRDZ3VytQLy9MN0xtRDBNVmZXOGltRHFpeVFXVlVpclF2eEN6?=
 =?utf-8?B?bjFJaFNDL2tETkQrNlo3N29jS3cyWGsxcjRBMTFodlJ6MlhFdG1peWNBVmQx?=
 =?utf-8?B?bEl4UTFEUDh2Wjlnb1AvNmdBRzlRcmh4dWFkQ250d1JYa1BCNkZsOElGNWta?=
 =?utf-8?B?dnZoN3hBa1pBclFVQjhBMVVOcllRMG5BbWNUUjFqaXgwV2VXZzhkK0Qvd0FO?=
 =?utf-8?B?bldTMHp1MlZST3NPcEZjMzA1R2hKejZsdkFaeXpYdFFNdEIzYmR4N2U5TVpo?=
 =?utf-8?B?MlRWUTR3S0JnVTdxNUdZUDdvVTNtajBoQ1drbEFGOGlacnM1WHRKblh4RE9Q?=
 =?utf-8?B?dFh0Mk1naGtxSEtJNDRhdFZON2VNQ1ZlRFZIYlVtTFU4MGFaQThMb0xkWjM4?=
 =?utf-8?B?dGlFd3hZNklndFFPa3NtV1RNcVNraENyZHo3Vk5nem5NOUdsNTZJUGROL2N2?=
 =?utf-8?B?SVk3dkNOM2V3S20wL0c5QXBuamVQbjl2VEFRdzV1KytreFI4OFpxaVBtcUJw?=
 =?utf-8?B?RnFiSHFzdmxzTnVnUkd6ZHBQd2Z3YytyQ0R1SW1BVlR3d0p1NUd2aWNuWGYy?=
 =?utf-8?B?SW1TQ1kvNE1YWDh6UTRTUTNzZkgzUHh1Y1ZFdWFEbHhRYjVWcGMybVMrMHJZ?=
 =?utf-8?B?SGVuaFVlcjcxY1dEYnVUVjE2NDJJOC9lNk5tVGlqT0F0RWZBazB0c2daVmty?=
 =?utf-8?B?bHJqdVk4UElKRnJkNmo3aC84TUZoMnZPUmMzUC9tK1NyQ3cyNXZGOGtrcjhw?=
 =?utf-8?B?TWIrVzdMZHJPQkF6dEtXZHU0WCtXQWV2Wi9KTVpRRENpR2pjSmpjNW5NNWZ4?=
 =?utf-8?B?MHFscHA0VXlKUytuU21sS2N1QzF1NzV5ZTNsRWN2clFtbjRsc1BxRHByRmlG?=
 =?utf-8?B?eC9OaHJYTklNZGlpVUdwZEdZanlmcFl2MkQvZ253RTRXVlRQdFdWdW9ZdHhJ?=
 =?utf-8?B?VWowU0xPS0NKTUtOVGY3RlhOa0J4SnJNaGpZR0FCMm9wbmpXVFRPYjh3cVAy?=
 =?utf-8?B?RUdoY1F0NUxqSldMWTFUQXhieEdTUUlzS2lucGpxQ3JwTitGbjdBanJ5VE5t?=
 =?utf-8?B?eEdkWDArbllEQTdyd08xZ2xOdUkrSy9PNmtDUFZlUUVOb2lxR0Q4REU3OEpZ?=
 =?utf-8?B?Z1JabmxWR2FzL2IwQkZ6OGxnRVVGYlNSUlBMOFMrRno2T0F6d1NWUDVMWWZa?=
 =?utf-8?B?cUk2NVpONUZRVmVtcGxmSzJ1ZUZud1dPMUVva0xxNFJhWk0weG9FL3N2ZzhF?=
 =?utf-8?B?ZlZrQmJkY2Irb0tLalVJNzhmTitJa0hCUkgrM2J0TmtwZEpxUjBMWEMrRmpV?=
 =?utf-8?B?Y3hKMkFrVTZqMkZSSHRWL0lldVc0alVzSUZNc2pFL291Y3JXRm5ka1FIbWNx?=
 =?utf-8?B?RHdkL3h2bVRHNUl5ZGZrZFFVZ1FkZXBZbGh2T0R5ZjhieXlmQUk4UUtqMnhC?=
 =?utf-8?B?SkpMT1pvc1Nvb04xbGpsSnRHRllFNDhjM2R5eVlNTkdpTTZEUVRmMGhaUE5l?=
 =?utf-8?B?alFSZnVHYTRlQ0UwYmxFeXpiQ1dSTUFpSVVKaGhIR09KOUdwdWFucGNFMmg0?=
 =?utf-8?B?Y2gwVmMyakV5a3Q4cTI3bVdUMDRNUFNkVFlyK1k4Qi9adktvSG51b2FLenNn?=
 =?utf-8?B?RGliTWFxS2ZhY3d1bVZGOXNkY2wvcUYrUGhzVy9jZUdOYXQ2VjE2K09iT2c2?=
 =?utf-8?B?ZzVqN3U2YnQvSE1paEdldUsrODhVQitlekVlQjd1SWpkK2g5NzUwZ29SMG9z?=
 =?utf-8?B?V0h2Vm5ncVdhMWQ5M0tHcUhXS0VyWTNMRjF5SkhNMk0xOWllM1JvTStBVUxx?=
 =?utf-8?B?NWxQQ0h4S2JEcWNkN1hVY1c2aWlqT1NtTUh4aVJYY3FkcHhCWjRlVEhMUmZm?=
 =?utf-8?Q?xi0EMR/pjCeu37Xjz1Z+JCk=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cdf687b9-ee62-4ba4-654c-08da9fc81857
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:04:57.7940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7iv3jhjGUF4zikVDxGdKhZmgj3Av/q+Usr1lNZHGO2hcPZ2n2jkNSOvYLsu0L2Xj9GkbQD+f2l7QcW4GzouOqQBy7Z7otDFs/GbQs5ZfpIqKA76buq2l3lVn4OYYP2J7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8001
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Sep 2022 14:05:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3250

Hi Michael,

On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> [YOCTO #14508]
> Reported-by: Quentin Schulz <foss@0leil.net>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---

Missing one:
https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migration-3.2.rst#n210

Cheers,
Quentin

>   .../migration-guides/migration-3.2.rst         |  4 ++--
>   documentation/overview-manual/concepts.rst     | 18 +++++++++---------
>   documentation/ref-manual/tasks.rst             |  8 ++++----
>   documentation/ref-manual/variables.rst         |  2 +-
>   4 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
> index 8a8d19d605..4c0de7b0f6 100644
> --- a/documentation/migration-guides/migration-3.2.rst
> +++ b/documentation/migration-guides/migration-3.2.rst
> @@ -207,9 +207,9 @@ files into a subdirectory and reference that instead.
>   deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
>   ----------------------------------------------------------
>   
> -``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
> +:ref:`ref-tasks-deploy` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
>   
> -Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` --- these should be refactored to use ``do_deploy_prepend`` instead.
> +Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with :ref:`ref-tasks-deploy` are unlikely to be affected by this unless they add ``prefuncs`` to :ref:`ref-tasks-deploy` *which also* put files into ``${DEPLOYDIR}`` --- these should be refactored to use ``do_deploy_prepend`` instead.
>   
>   
>   .. _migration-3.2-nativesdk-sdk-provides-dummy:
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 06220401bc..f3f8cbd95c 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1801,14 +1801,14 @@ from the :ref:`deploy <ref-classes-deploy>` class::
>   
>   The following list explains the previous example:
>   
> --  Adding "do_deploy" to ``SSTATETASKS`` adds some required
> +-  Adding ``do_deploy`` to ``SSTATETASKS`` adds some required
>      sstate-related processing, which is implemented in the
>      :ref:`sstate <ref-classes-sstate>` class, to
>      before and after the
>      :ref:`ref-tasks-deploy` task.
>   
>   -  The ``do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"`` declares that
> -   ``do_deploy`` places its output in ``${DEPLOYDIR}`` when run normally
> +   :ref:`ref-tasks-deploy` places its output in ``${DEPLOYDIR}`` when run normally
>      (i.e. when not using the sstate cache). This output becomes the input
>      to the shared state cache.
>   
> @@ -1818,15 +1818,15 @@ The following list explains the previous example:
>   
>      .. note::
>   
> -      If ``do_deploy`` is not already in the shared state cache or if its input
> +      If :ref:`ref-tasks-deploy` is not already in the shared state cache or if its input
>         checksum (signature) has changed from when the output was cached, the task
>         runs to populate the shared state cache, after which the contents of the
>         shared state cache is copied to ${:term:`DEPLOY_DIR_IMAGE`}. If
> -      ``do_deploy`` is in the shared state cache and its signature indicates
> +      :ref:`ref-tasks-deploy` is in the shared state cache and its signature indicates
>         that the cached output is still valid (i.e. if no relevant task inputs
>         have changed), then the contents of the shared state cache copies
>         directly to ${:term:`DEPLOY_DIR_IMAGE`} by the ``do_deploy_setscene`` task
> -      instead, skipping the ``do_deploy`` task.
> +      instead, skipping the :ref:`ref-tasks-deploy` task.
>   
>   -  The following task definition is glue logic needed to make the
>      previous settings effective::
> @@ -1836,16 +1836,16 @@ The following list explains the previous example:
>         }
>         addtask do_deploy_setscene
>   
> -  ``sstate_setscene()`` takes the flags above as input and accelerates the ``do_deploy`` task
> +  ``sstate_setscene()`` takes the flags above as input and accelerates the :ref:`ref-tasks-deploy` task
>     through the shared state cache if possible. If the task was
>     accelerated, ``sstate_setscene()`` returns True. Otherwise, it
> -  returns False, and the normal ``do_deploy`` task runs. For more
> +  returns False, and the normal :ref:`ref-tasks-deploy` task runs. For more
>     information, see the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:setscene`"
>     section in the BitBake User Manual.
>   
>   -  The ``do_deploy[dirs] = "${DEPLOYDIR} ${B}"`` line creates
> -   ``${DEPLOYDIR}`` and ``${B}`` before the ``do_deploy`` task runs, and
> -   also sets the current working directory of ``do_deploy`` to ``${B}``.
> +   ``${DEPLOYDIR}`` and ``${B}`` before the :ref:`ref-tasks-deploy` task runs, and
> +   also sets the current working directory of :ref:`ref-tasks-deploy` to ``${B}``.
>      For more information, see the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags`"
>      section in the BitBake
>      User Manual.
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> index e5938ee236..5efe64b35d 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -81,7 +81,7 @@ Recipes implementing this task should inherit the
>   :ref:`deploy <ref-classes-deploy>` class and should write the output
>   to ``${``\ :term:`DEPLOYDIR`\ ``}``, which is not to be
>   confused with ``${DEPLOY_DIR}``. The :ref:`deploy <ref-classes-deploy>` class sets up
> -``do_deploy`` as a shared state (sstate) task that can be accelerated
> +:ref:`ref-tasks-deploy` as a shared state (sstate) task that can be accelerated
>   through sstate use. The sstate mechanism takes care of copying the
>   output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
>   
> @@ -90,14 +90,14 @@ output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
>      Do not write the output directly to ``${DEPLOY_DIR_IMAGE}``, as this causes
>      the sstate mechanism to malfunction.
>   
> -The ``do_deploy`` task is not added as a task by default and
> +The :ref:`ref-tasks-deploy` task is not added as a task by default and
>   consequently needs to be added manually. If you want the task to run
>   after :ref:`ref-tasks-compile`, you can add it by doing
>   the following::
>   
>         addtask deploy after do_compile
>   
> -Adding ``do_deploy`` after other tasks works the same way.
> +Adding :ref:`ref-tasks-deploy` after other tasks works the same way.
>   
>   .. note::
>   
> @@ -110,7 +110,7 @@ Adding ``do_deploy`` after other tasks works the same way.
>      See the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`"
>      section in the BitBake User Manual for more information.
>   
> -If the ``do_deploy`` task re-executes, any previous output is removed
> +If the :ref:`ref-tasks-deploy` task re-executes, any previous output is removed
>   (i.e. "cleaned").
>   
>   .. _ref-tasks-fetch:
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 8055f044d0..8fac7f77ad 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6712,7 +6712,7 @@ system and gives an overview of their function and contents.
>         - do_populate_lic
>         - do_package_qa
>         - do_populate_sysroot
> -      - do_deploy
> +      - :ref:`ref-tasks-deploy`
>   
>         Despite the default value of "" for the
>         :term:`SDK_RECRDEP_TASKS` variable, the above four tasks are always added
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3221): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_3221&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=F4I8M4SGcdazHCULA4b6vl9pU2JK4-B0XBUvtEqEX2ylNswIzUdWZ3CCfiIiibuD&s=ZEyJmQPpQCxzN0I8nTIITQMrc8SiUNh09KC0AxVJhp0&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_93876107_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=F4I8M4SGcdazHCULA4b6vl9pU2JK4-B0XBUvtEqEX2ylNswIzUdWZ3CCfiIiibuD&s=BFZheqvjA3rsYQi2OpLkymqO-SSiALZOk8nJIzBDmOI&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=F4I8M4SGcdazHCULA4b6vl9pU2JK4-B0XBUvtEqEX2ylNswIzUdWZ3CCfiIiibuD&s=euGgllMDt11J4RgqDdpdhWuZkm2IFiAUyowdcsO3LWc&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

