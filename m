Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEFDC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 14:04:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web08.28612.1664201065728844488
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 07:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=j2cPBqG7;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.51,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAfHpGxGtkx8kDuay3Bho+rPd7BaA+burMHnTYCGoLHhTaf2xjRML1ZQvWh1hHWXsmqPZu69zan0YMOF1JHBDKL/55myL7L03OBFGV7xwNByJjvMD4F1CawNIROGBqn+hT0O5Q/PBLdDw72lbtDG8I3HkS7TRRqL2o2NH5mzl0m5Z5Wv1taDdp6Vd3zr8OWEYI8TSlm2rftME48zYGw9mi2Ia7JMcqxZKxP5NlRylur/XzjADofZoEwIFRIpbX5Fzyx/cQtvZyJS73v5M+qtpdWCWVzNbIc02TLBz9I6U4KA36pgRAOuX6Nuh/CP6YMmBcxj8YSMXnUJ67S2XG03Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+9zrzfQuxmnct2eocDKZYn3eDUrARXL+pHS4ndGLI0=;
 b=ITyBGpVKpKffAqzW4ZCEyStOPtxz4NjIUQrFRUAnhEcgPVbcqQNzGsDyzYbi88qnHb0MfhgmfTiEAhR3uBrKoToK93AitTpr61PctukrbaXf2113oeqPio5WzPOzutKcRl7GS4AkLP4i0QDVh41I2AngFz+ShkysTe0J/+fSytX2h5XO/pwwsWDJnmBCNPSiYvBYfwIftQSJMxOgIYKNf7B5cSk8kR9ZS+skBRAjfXVQ8+JNYQR5E8RYjsSLf73CCLwg17KQUT3n89F1v4C0NUlcuq+AoK73PQ21bLC5aXESpk3XNqO4Cru/LE9GJ6RHggXOMvdpsfwQIXA1z29iUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+9zrzfQuxmnct2eocDKZYn3eDUrARXL+pHS4ndGLI0=;
 b=j2cPBqG7sVFsDMP5yU8xrrhzd18mlP9yH5LvGGzZGVNRvO6mGeP5XjkQ8Pb9Bz8fXW9+nDJNq6XZ+5J+yborAc0F+7c1BayhNXMwxEXY8HzCZ2LVHcNJVewTJG22k0sXtjN7PKHw5MpgBqeRl4S5iO64eDEyguDrgfvcMOeUvqkO6X1VsP5mx+3zlFiYJEfhD7MbRnqKyAQ9EHhGT/cLd6ziO/80puAKkUxQhc4MW0569aGFh0ls/TmwPocY6XVX2r1LLXmxEUpEUc1P999UAOG60EcPQuYYQniGXUb7WiR1DFjNxZRKTb07GLPZaGxQJVg6OfgzgA6n+WWL25wicw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB8001.eurprd04.prod.outlook.com (2603:10a6:20b:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 14:04:21 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 14:04:21 +0000
Message-ID: <0b66819c-04d8-5a99-ff4b-f0576ae9cd71@theobroma-systems.com>
Date: Mon, 26 Sep 2022 16:04:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 02/30] manuals: add reference to the "do_install"
 task
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
 <20220923175219.6652-3-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220923175219.6652-3-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: f65de5c2-78d0-48e8-bc3b-08da9fc802d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i3pG7zZRMmxsnnVcpJwv9CoV9wSKj8RcLge01H5DPaxwWCGezGisZa/rc843orutpFBo9Dg7QbdBjNK+t5kTZHT133t8U2CVgUk+zUh/2fP3mq3WBuZZzb1zA/9557Xs6OHIFL/jYgg/q5jFFcrhmRk1/zfz75/mfEJB9mZBBgtedmo3xm+r6gni79EQjvCx/JQ1DBuGaPes4IP6zZi9YqqFkCe2y3lc4/xhW5T5h7Zo5YiyX1vEv5vbOBewM2h1m9J+tgPus09xQXZyZYY9LEczEe5FUzi/UkT/78ItbEkFe6k2qoWV0WyfQcuYtMKaUJs71bE+FftFImRehl1HWY8BJGY3zjJOlngXmxGy/lh/0+YmLKKCowxi+cxhO6XY3h0yU232jIPL8cDXNEObQVBv/esuRuEMynUsXf2PZDZ+S3NJGNCZHFRsR1fszbEvhstiZtmAPyrXS1uMrTaQskrt+TJ9nOZV9bYgPGNqjgz9GcKGRbeZVoDRTkvlSHzEgLkjLQdPnvuZoSRrXdi0lA1wh1QGFAroWbzyB6jN/e+PCUUG5EVhZOUUKIwDViVhH03uJwCdjWRSZU7I1nwYaHNSPZTuKuvxoWZxklDkHhBMdQoetAPfEqZqbWeqqGK1QTpVcqXZ3nmQ9r1EhmpSPOqBScs0GL7bd1mPq5Ke6M2RKXh9tRcWX3cafU3tVUvJokCpkqIMwfvDhJWGR0XQs1NTM8quu6/nsT8jQbSsx5QDXzgpTixUwy71z8LGQVOIcxJVoe4GXUMF/W9xYixkiLQrivF3UFeIluEpQGL72NcEhC4afucYzMQjPz03Mubk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(39850400004)(396003)(136003)(451199015)(66899012)(316002)(478600001)(83380400001)(966005)(6486002)(31686004)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(6506007)(8936002)(53546011)(36756003)(26005)(5660300002)(30864003)(6512007)(44832011)(2906002)(2616005)(186003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTUzWWxLMEZieFlwWkVFWjJUekU3SHlHVHUycHRNbHBFdUdXaGpsWXVvaGpt?=
 =?utf-8?B?d0FzckVNNDdzU0FzS2VSN1NERFlQZ2R1TlN6WEI4TnFIbVYzd3JBUUY2Vmps?=
 =?utf-8?B?TkZhTG10U0E2T014STNnREQ1aWRONzdSMk4zZUNmRU51UVQvaEdBMHF1MDdO?=
 =?utf-8?B?Qk8rUEFrSTZDaUk2V2t1VENZQUZoSmg2aW9uRG9oVVNvN1VGWnNuYXZWSFRx?=
 =?utf-8?B?Qm5qTGMyVytXVWRVMmIyaXJSKzNsRUtBVW9JTDRZeDlaR3dxbm1WQWZ2dVZx?=
 =?utf-8?B?SCttekJWNDc4NUFxc282TCttOE40Z2Frc096YW5NdUJvL05kNmNtUWlmUyty?=
 =?utf-8?B?VzRjZjVkUlN1L2NkdkRBLy9YMC9MMm9uMFVKZkNOeHRNNlFpK0ZyczVyTGtr?=
 =?utf-8?B?dlIxRzhrMlYvM01CNWpUdlJ4dEk3YWVuS1M2ZzJSMkRHMmo4RFB0QWRHZHE5?=
 =?utf-8?B?a1JKT25LbW5oZzZiYjNKRXpSWUhjZW9meTdOWWpkazN5dHBIcjB5VlZocnAr?=
 =?utf-8?B?TDllVjcyK200aCtESEhpUjJLS3hDNXdZTFc4T3RiNFdzNW9Melc4VkJjbWl4?=
 =?utf-8?B?a0VXNUVqa1RhY1JZNmNoUWM5OVdlcGpldjRkZDlQQ1JJeTgxSUZNK1pwRlBV?=
 =?utf-8?B?T1cxdG1HUnRoR2RMU1FlMmZoVEZTZXVxTWFjd0o0WGRxaS92UzFOcHFrY2tv?=
 =?utf-8?B?UmtTd3hYQmp0dmhnYTFkSmdxeU5XcElXQ282NlFhS0YwUmlHWnhoVE9KQVBj?=
 =?utf-8?B?OTRLY2F1dTc5QzQwMlJ1WUhqb3puMXV6d0VTT3FvZmFQOTA3dHlpWUNaRGdX?=
 =?utf-8?B?amM2SEJtbHNtdU95RDVJdlRJeDVNemtsN2ZSc0w4WEFxazJ6MlNDRFE4ajQ3?=
 =?utf-8?B?NEQ0MXB2cEVuWDZmd2h1RjNlekh0aEZCQ1FacnltNE54MU04clh1ODV1dzEr?=
 =?utf-8?B?cytRQ0l4cVZTRlZPaHMrdTloN3lGajIyUFZ2U3lHZmkrbHhPME54UEhjaCtw?=
 =?utf-8?B?V2RRTjh0SmI5aFFKZ1FkaWRaNGNUc003SUNiWWtzZXRQanBsdW1VMzZPRnds?=
 =?utf-8?B?RHNYa0pMY09KNlRLanQyQWE4TVJqa0FRZndYdEJGL09xMkpWQTUzMVFJZndp?=
 =?utf-8?B?MUg5dDgrZXZ0NTFPQXA1TXZsNWN1RDNacVJYNUVvYzZHMXlqVm1pc0lOcGlX?=
 =?utf-8?B?UUxIeUdEMGZOOVQ4LzBXa1NYUGhSazIvWnIxVmg3UXd4VlJFTGljNTdpLzdr?=
 =?utf-8?B?a0RJU1gxOTN1b2pKeXRsNzNyUm9Qb3pCLzdtbzJjdUM0V1pPNUUrRlNXNU5k?=
 =?utf-8?B?enE1RUNCTnpyUHpZV0xZMlVtcWd4N3RpVk5FSGlGVlUxVDJQNGNLc3dIQVdx?=
 =?utf-8?B?eDFSVVl2Q3N5UUFJYmtQRVpOUlhiOVcyVmtyNHRZSFA4TXFDSjM5RUZxOFFJ?=
 =?utf-8?B?MTUwSnFHNWgzRGoyUjdqRi9SVi9OOVRNWWZwTnROZW4xMDVJRUxCY1pwTWZk?=
 =?utf-8?B?TE54M2YxSmZ1NHF5UzhaTEZZcnlCd3dJcWZ1djRDeGFMOVZNempiUWJabzZ5?=
 =?utf-8?B?aWVpRmNXc3o5Sk1mY3RHajY5WFZZYnpidTJjM0NnQzFydzcrU2l5WlNETnR1?=
 =?utf-8?B?TjIyT29xcEZEUldMbC90c2FvVGgrK3gyN2R1TWM0ZnNyTjRHalhmV0lNTDlZ?=
 =?utf-8?B?aDkrSG1VQm96aXpHb3NSU1JlbXpTSi9jUDh4TnNPQVNFOE9rbHBZNFlONTYx?=
 =?utf-8?B?R3FHaFFqNW1YYS9EUmpKTnR2cWhnRGFwR3Ixelgxb0phb3Q3Y1NacW1OMFd1?=
 =?utf-8?B?OVVDQVVBRnJoNEUzRkx6YS8xbytZa3RZZTRPb2JwYlZrdkhYeGRGb0hLa25u?=
 =?utf-8?B?S2h0cXZBaFY3QnRzSFBCSW03UENPRUt5LzE4bXJBQ0gwTmlIT25GUjBoKzd1?=
 =?utf-8?B?c1F1S1BnQVdScDZuWkpjenlmRzk4ZjhTdFZpdVJKdlZpYVhxQ1RNVjZFRXN3?=
 =?utf-8?B?TTBwaEZkTml0VndoMmhTQThOejdXWHRDNUNCeDc3aTVsQzRvckhML2hZY0pF?=
 =?utf-8?B?ZzZTR0pHMmd3WTJtYUJMckJvZEZXWmtsbGNKdVV6Y2J3YjROaURGYWE2Vlpu?=
 =?utf-8?B?bHpVdEtoVmZQL1dDSjNXZFZBcnIxQS9ZSkNBeE5DbzdLakR0WTNjS2J5bkRK?=
 =?utf-8?Q?HhxRhG++wl7nlvYCIH3b758=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f65de5c2-78d0-48e8-bc3b-08da9fc802d6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:04:21.8905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3xSeZEXGYOkiEO3es3THmavm3/oqpZyB35Aovw5b2DjgP8Zvg47T1OEpguzBQQmQVk0B7z+Q+5yN3X9SuCxCWNXSEqJYQyX63YGUZ9FH4mbDB5uLTV707hv895zM8lHv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8001
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Sep 2022 14:04:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3249

Hi Michael,

On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> [YOCTO #14508]
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Quentin Schulz <foss@0leil.net>
> ---

Missing a few:
https://git.yoctoproject.org/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n1916
https://git.yoctoproject.org/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n1926
https://git.yoctoproject.org/yocto-docs/tree/documentation/dev-manual/common-tasks.rst#n1983

Cheers,
Quentin

>   documentation/dev-manual/common-tasks.rst     | 26 +++++++++----------
>   .../migration-guides/migration-3.2.rst        |  4 +--
>   .../migration-guides/migration-4.0.rst        |  2 +-
>   documentation/overview-manual/concepts.rst    |  4 +--
>   documentation/ref-manual/classes.rst          |  8 +++---
>   documentation/ref-manual/faq.rst              |  2 +-
>   documentation/ref-manual/qa-checks.rst        | 12 ++++-----
>   documentation/ref-manual/tasks.rst            |  2 +-
>   documentation/ref-manual/variables.rst        |  2 +-
>   documentation/sdk-manual/extensible.rst       |  2 +-
>   10 files changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 3b25c9f950..09304d4b6a 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -1731,7 +1731,7 @@ your software is built:
>   
>         If you need to install one or more custom CMake toolchain files
>         that are supplied by the application you are building, install the
> -      files to ``${D}${datadir}/cmake/Modules`` during ``do_install``.
> +      files to ``${D}${datadir}/cmake/Modules`` during :ref:`ref-tasks-install`.
>   
>   -  *Other:* If your source files do not have a ``configure.ac`` or
>      ``CMakeLists.txt`` file, then your software is built using some
> @@ -1888,7 +1888,7 @@ Here are some common issues that cause failures.
>   Installing
>   ----------
>   
> -During ``do_install``, the task copies the built files along with their
> +During :ref:`ref-tasks-install`, the task copies the built files along with their
>   hierarchy to locations that would mirror their locations on the target
>   device. The installation process copies files from the
>   ``${``\ :term:`S`\ ``}``,
> @@ -1906,7 +1906,7 @@ the software being built:
>   -  *Autotools and CMake:* If the software your recipe is building uses
>      Autotools or CMake, the OpenEmbedded build system understands how to
>      install the software. Consequently, you do not have to have a
> -   ``do_install`` task as part of your recipe. You just need to make
> +   :ref:`ref-tasks-install` task as part of your recipe. You just need to make
>      sure the install portion of the build completes with no issues.
>      However, if you wish to install additional files not already being
>      installed by ``make install``, you should do this using a
> @@ -1946,10 +1946,10 @@ installed correctly.
>         might need to replace hard-coded paths in an initscript with
>         values of variables provided by the build system, such as
>         replacing ``/usr/bin/`` with ``${bindir}``. If you do perform such
> -      modifications during ``do_install``, be sure to modify the
> +      modifications during :ref:`ref-tasks-install`, be sure to modify the
>         destination file after copying rather than before copying.
>         Modifying after copying ensures that the build system can
> -      re-execute ``do_install`` if needed.
> +      re-execute :ref:`ref-tasks-install` if needed.
>   
>      -  ``oe_runmake install``, which can be run directly or can be run
>         indirectly by the
> @@ -1958,7 +1958,7 @@ installed correctly.
>         runs ``make install`` in parallel. Sometimes, a Makefile can have
>         missing dependencies between targets that can result in race
>         conditions. If you experience intermittent failures during
> -      ``do_install``, you might be able to work around them by disabling
> +      :ref:`ref-tasks-install`, you might be able to work around them by disabling
>         parallel Makefile installs by adding the following to the recipe::
>   
>            PARALLEL_MAKEINST = ""
> @@ -2337,7 +2337,7 @@ Single .c File Package (Hello World!)
>   Building an application from a single file that is stored locally (e.g.
>   under ``files``) requires a recipe that has the file listed in the
>   :term:`SRC_URI` variable. Additionally, you need to manually write the
> -``do_compile`` and ``do_install`` tasks. The :term:`S` variable defines the
> +``do_compile`` and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
>   directory containing the source code, which is set to
>   :term:`WORKDIR` in this case --- the
>   directory BitBake uses for the build.
> @@ -2407,8 +2407,8 @@ should store them in the
>   :term:`EXTRA_OEMAKE` or
>   :term:`PACKAGECONFIG_CONFARGS`
>   variables. BitBake passes these options into the GNU ``make``
> -invocation. Note that a ``do_install`` task is still required.
> -Otherwise, BitBake runs an empty ``do_install`` task by default.
> +invocation. Note that a :ref:`ref-tasks-install` task is still required.
> +Otherwise, BitBake runs an empty :ref:`ref-tasks-install` task by default.
>   
>   Some applications might require extra parameters to be passed to the
>   compiler. For example, the application might need an additional header
> @@ -2567,7 +2567,7 @@ doing the following:
>      :ref:`ref-tasks-patch` tasks to the
>      :ref:`ref-tasks-install` task.
>   
> --  Make sure your ``do_install`` task installs the binaries
> +-  Make sure your :ref:`ref-tasks-install` task installs the binaries
>      appropriately.
>   
>   -  Ensure that you set up :term:`FILES`
> @@ -4740,7 +4740,7 @@ the built library.
>   The :term:`PACKAGES` and
>   :term:`FILES:* <FILES>` variables in the
>   ``meta/conf/bitbake.conf`` configuration file define how files installed
> -by the ``do_install`` task are packaged. By default, the :term:`PACKAGES`
> +by the :ref:`ref-tasks-install` task are packaged. By default, the :term:`PACKAGES`
>   variable includes ``${PN}-staticdev``, which represents all static
>   library files.
>   
> @@ -6902,7 +6902,7 @@ The previous example specifies a number of things in the call to
>   ``do_split_packages``.
>   
>   -  A directory within the files installed by your recipe through
> -   ``do_install`` in which to search.
> +   :ref:`ref-tasks-install` in which to search.
>   
>   -  A regular expression used to match module files in that directory. In
>      the example, note the parentheses () that mark the part of the
> @@ -9634,7 +9634,7 @@ Running Specific Tasks
>   
>   Any given recipe consists of a set of tasks. The standard BitBake
>   behavior in most cases is: :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
> -``do_configure``, ``do_compile``, ``do_install``, ``do_package``,
> +``do_configure``, ``do_compile``, :ref:`ref-tasks-install`, ``do_package``,
>   ``do_package_write_*``, and ``do_build``. The default task is
>   ``do_build`` and any tasks on which it depends build first. Some tasks,
>   such as ``do_devshell``, are not part of the default build chain. If you
> diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
> index 71778f3e26..8a8d19d605 100644
> --- a/documentation/migration-guides/migration-3.2.rst
> +++ b/documentation/migration-guides/migration-3.2.rst
> @@ -60,7 +60,7 @@ pseudo as the interprocess round trip to the server is avoided.
>   
>   There is a possible complication where some existing recipe may break, for
>   example, a recipe was found to be writing to ``${B}/install`` for
> -``make install`` in ``do_install`` and since ``${B}`` is listed as not to be tracked,
> +``make install`` in :ref:`ref-tasks-install` and since ``${B}`` is listed as not to be tracked,
>   there were errors trying to ``chown root`` for files in this location. Another
>   example was the ``tcl`` recipe where the source directory :term:`S` is set to a
>   subdirectory of the source tree but files were written out to the directory
> @@ -207,7 +207,7 @@ files into a subdirectory and reference that instead.
>   deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
>   ----------------------------------------------------------
>   
> -``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as ``do_install`` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
> +``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
>   
>   Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` --- these should be refactored to use ``do_deploy_prepend`` instead.
>   
> diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
> index ce3212a464..02d3c3e2bd 100644
> --- a/documentation/migration-guides/migration-4.0.rst
> +++ b/documentation/migration-guides/migration-4.0.rst
> @@ -145,7 +145,7 @@ Python changes
>     :ref:`python_setuptools_build_meta <ref-classes-python_setuptools_build_meta>`
>     and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.
>   
> -- The :ref:`setuptools3 <ref-classes-setuptools3>` class ``do_install()`` task now
> +- The :ref:`setuptools3 <ref-classes-setuptools3>` class :ref:`ref-tasks-install` task now
>     installs the ``wheel`` binary archive. In current versions of ``setuptools`` the
>     legacy ``setup.py install`` method is deprecated. If the ``setup.py`` cannot be used
>     with wheels, for example it creates files outside of the Python module or standard
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index fa060ce0de..2e1aa3df48 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1209,7 +1209,7 @@ The build system has knowledge of the relationship between these tasks
>   and other preceding tasks. For example, if BitBake runs
>   ``do_populate_sysroot_setscene`` for something, it does not make sense
>   to run any of the :ref:`ref-tasks-fetch`, ``do_unpack``, ``do_patch``,
> -``do_configure``, ``do_compile``, and ``do_install`` tasks. However, if
> +``do_configure``, ``do_compile``, and :ref:`ref-tasks-install` tasks. However, if
>   ``do_package`` needs to be run, BitBake needs to run those other tasks.
>   
>   It becomes more complicated if everything can come from an sstate cache
> @@ -2163,7 +2163,7 @@ operations that are normally reserved for the root user (e.g.
>   :ref:`do_package_write* <ref-tasks-package_write_deb>`,
>   :ref:`ref-tasks-rootfs`, and
>   :ref:`do_image* <ref-tasks-image>`). For example,
> -the ``do_install`` task benefits from being able to set the UID and GID
> +the :ref:`ref-tasks-install` task benefits from being able to set the UID and GID
>   of installed files to arbitrary values.
>   
>   One approach to allowing tasks to perform root-only operations would be
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 11e0d472e8..6e37738850 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1081,12 +1081,12 @@ Here are the tests you can list with the :term:`WARN_QA` and
>      might result in host contamination of the build output.
>   
>   -  ``installed-vs-shipped:`` Reports when files have been installed
> -   within ``do_install`` but have not been included in any package by
> +   within :ref:`ref-tasks-install` but have not been included in any package by
>      way of the :term:`FILES` variable. Files that do not
>      appear in any package cannot be present in an image later on in the
>      build process. Ideally, all installed files should be packaged or not
>      installed at all. These files can be deleted at the end of
> -   ``do_install`` if the files are not needed in any package.
> +   :ref:`ref-tasks-install` if the files are not needed in any package.
>   
>   -  ``invalid-chars:`` Checks that the recipe metadata variables
>      :term:`DESCRIPTION`,
> @@ -1339,7 +1339,7 @@ Only a single U-boot boot script can be added to the FIT image created by
>   ``kernel-fitimage`` and the boot script is optional.
>   The boot script is specified in the ITS file as a text file containing
>   U-boot commands. When using a boot script the user should configure the
> -U-boot ``do_install`` task to copy the script to sysroot.
> +U-boot :ref:`ref-tasks-install` task to copy the script to sysroot.
>   So the script can be included in the FIT image by the ``kernel-fitimage``
>   class. At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
>   load the boot script from the FIT image and executes it.
> @@ -2412,7 +2412,7 @@ uses these build systems, the recipe needs to inherit the ``setuptools3`` class.
>   
>      .. note::
>   
> -     The ``setuptools3`` class ``do_install()`` task now installs the ``wheel``
> +     The ``setuptools3`` class :ref:`ref-tasks-install` task now installs the ``wheel``
>        binary archive. In current versions of ``setuptools`` the legacy ``setup.py
>        install`` method is deprecated. If the ``setup.py`` cannot be used with
>        wheels, for example it creates files outside of the Python module or
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
> index 61049523a0..cb90677923 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -437,7 +437,7 @@ practice very effective.
>   **Q:** The files provided by my ``*-native`` recipe do not appear to be
>   available to other recipes. Files are missing from the native sysroot,
>   my recipe is installing to the wrong place, or I am getting permissions
> -errors during the do_install task in my recipe! What is wrong?
> +errors during the :ref:`ref-tasks-install` task in my recipe! What is wrong?
>   
>   **A:** This situation results when a build system does not recognize the
>   environment variables supplied to it by :term:`BitBake`. The
> diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
> index fbab1dc92e..ff8916aedf 100644
> --- a/documentation/ref-manual/qa-checks.rst
> +++ b/documentation/ref-manual/qa-checks.rst
> @@ -162,7 +162,7 @@ Errors and Warnings
>      normally expected to be empty (such as ``/tmp``). These files may
>      be more appropriately installed to a different location, or
>      perhaps alternatively not installed at all, usually by updating the
> -   ``do_install`` task/function.
> +   :ref:`ref-tasks-install` task/function.
>   
>   .. _qa-check-arch:
>   
> @@ -536,7 +536,7 @@ Errors and Warnings
>         in (e.g. ``FILES:${``\ :term:`PN`\ ``}`` for the main
>         package).
>   
> -   -  Delete the files at the end of the ``do_install`` task if the
> +   -  Delete the files at the end of the :ref:`ref-tasks-install` task if the
>         files are not needed in any package.
>   
>       
> @@ -582,7 +582,7 @@ Errors and Warnings
>      ``${datadir}/mime/packages``) and yet does not inherit the mime
>      class which will ensure that these get properly installed. Either
>      add ``inherit mime`` to the recipe or remove the files at the
> -   ``do_install`` step if they are not needed.
> +   :ref:`ref-tasks-install` step if they are not needed.
>   
>   
>   .. _qa-check-mime-xdg:
> @@ -592,7 +592,7 @@ Errors and Warnings
>       The specified package contains a .desktop file with a 'MimeType' key
>       present, but does not inherit the mime-xdg class that is required in
>       order for that to be activated. Either add ``inherit mime`` to the
> -    recipe or remove the files at the ``do_install`` step if they are not
> +    recipe or remove the files at the :ref:`ref-tasks-install` step if they are not
>       needed.
>   
>   
> @@ -667,8 +667,8 @@ Errors and Warnings
>   
>       If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this check will ensure that no package
>       installs files to root (``/bin``, ``/sbin``, ``/lib``, ``/lib64``) directories. If you are seeing this
> -    message, it indicates that the ``do_install`` step (or perhaps the build process that
> -    ``do_install`` is calling into, e.g. ``make install`` is using hardcoded paths instead
> +    message, it indicates that the :ref:`ref-tasks-install` step (or perhaps the build process that
> +    :ref:`ref-tasks-install` is calling into, e.g. ``make install`` is using hardcoded paths instead
>       of the variables set up for this (``bindir``, ``sbindir``, etc.), and should be
>       changed so that it does.
>   
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> index cb08a75c90..f3aebcecc3 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -168,7 +168,7 @@ section in the Yocto Project Overview and Concepts Manual.
>   Copies files that are to be packaged into the holding area
>   ``${``\ :term:`D`\ ``}``. This task runs with the current
>   working directory set to ``${``\ :term:`B`\ ``}``, which is the
> -compilation directory. The ``do_install`` task, as well as other tasks
> +compilation directory. The :ref:`ref-tasks-install` task, as well as other tasks
>   that either directly or indirectly depend on the installed files (e.g.
>   :ref:`ref-tasks-package`, ``do_package_write_*``, and
>   :ref:`ref-tasks-rootfs`), run under
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 2971654531..060bf499bb 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5633,7 +5633,7 @@ system and gives an overview of their function and contents.
>            way to ensure this is to use the ``oe_runmake`` function.
>   
>            If the software being built experiences dependency issues during
> -         the ``do_install`` task that result in race conditions, you can
> +         the :ref:`ref-tasks-install` task that result in race conditions, you can
>            clear the :term:`PARALLEL_MAKEINST` variable within the recipe as a
>            workaround. For information on addressing race conditions, see the
>            ":ref:`dev-manual/common-tasks:debugging parallel make races`"
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index 0df6519b8e..09b7169811 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -1112,7 +1112,7 @@ links created within the source tree:
>         ``${``\ :term:`D`\ ``}``.
>   
>      -  ``sysroot-destdir/``: Contains a subset of files installed within
> -      ``do_install`` that have been put into the shared sysroot. For
> +      :ref:`ref-tasks-install` that have been put into the shared sysroot. For
>         more information, see the
>         ":ref:`dev-manual/common-tasks:sharing files between recipes`" section.
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3217): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_3217&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=wQ5vvwPahFb4Yk7vrUzL6iTWRM2erXsbRtK-aKhf1BHWON8AvFgpu-fLeEzzc3PB&s=OH661Yo6S0WMC1be-td0DrCm-qxPS7MoFKSa-0CR0i4&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_93876094_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=wQ5vvwPahFb4Yk7vrUzL6iTWRM2erXsbRtK-aKhf1BHWON8AvFgpu-fLeEzzc3PB&s=pStDeYATg6Sr2uKZuvSysx00okpfZqtasgl4zCgCiYg&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=wQ5vvwPahFb4Yk7vrUzL6iTWRM2erXsbRtK-aKhf1BHWON8AvFgpu-fLeEzzc3PB&s=KJZa0SiMjKVu-5aBRxuDeEhGCWFPGLHyXYys3gryzsw&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

