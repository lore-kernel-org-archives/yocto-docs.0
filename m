Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D62C54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 15:43:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web12.612.1663602217289773191
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Sep 2022 08:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=VJCkFvvb;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.64,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXy3QFWLnTj6tfKczh7KMq5uVQUQYfxuHXcX26L32WoMElXAzTC2wIjqtARkr3mHVYt+NrBqx73wJXBoPMYQsR/rWPa61GKOSPq7sP9xosnFsgbfpNBIi9ZWdikvxrmT+fLPEr6svDN9gc+/i8HutzYuaU9Z4a2vrgIL3wF4YQ7AgDELRXyp0N9OZQW/ytZmVFX/JjvgwTgsA1v4Nkyq9n5NMygFOk8he74kE8TI5ujxuJTtVs1AZWrQwM4QmT2SJLqqBMAQPt/W3xvraqWFm3HpjQBSZx42vUQRQcE5hwosJhcOigs0zcHIvX0ec5NJGQnqQEWTr30aWf2sLKnk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daOC84Vo1/fLs9aC4tQkka8VWpdCRfGv/LPO7Vn2BIs=;
 b=XhgnjTfOqqI+kx6GURR0WamopCbJ9yRSwD6769aY/KYq/vJMJQy801K/7pPc8ePlYgo8yIiRWTyHbWqvu9YRpF+pVX57KJLha2+fzBnXEjYW5sNfxJVSyloYT8Eccx3u4iXJE0P/oBSb5icetpZFfpqh+gkMS3AQMNdBwV+x5tCDBCret7+L5jB1qbzqdidr3x91hHKW0cgu8nigQVwCc7FSQZMQhFItrRn46ugau3pc+BxtMocIb92rSReswxoJ2jJKjGd/YXMdj81rqpOKdDutFvbYHLIPrLERQwz47cHwxW5nrHoveVOcYpAfCtvuQ/9L29pavbCbfBagfAOUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daOC84Vo1/fLs9aC4tQkka8VWpdCRfGv/LPO7Vn2BIs=;
 b=VJCkFvvbYeysSUYEnV8NLGEIpWlUyBmDLiB/yikaSwxRNTMRSRQ8PNRzi+aOFwgZz1yR58n/dFBQIIPTzDBcWCYNc7AJuoApZ5tbwZRKYkN+Sv/BWlEiC56ZxUrD8Sw5o/5mLmmF5NjZCCvg+BZdSXwLkT0yfjXfMkCG19Vgc91O9TUIiVY4Ji5ICXNxsFhKICGCsRM/EiAUgejv/R9z8COEX/E07njqqwTcuYL5cYR2j8GwUd9uS1DYSQGs8A/4D2MKRmuaw9F0n4bLsU6bTSlQGA04whusta0QwlbhHL7I+ze+RBg7lQrLAs9p1nQpOOO2O10gRKz8FoGh1Wr2fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB9060.eurprd04.prod.outlook.com (2603:10a6:102:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.20; Mon, 19 Sep
 2022 15:43:33 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 15:43:33 +0000
Message-ID: <12b8b41b-caf1-5e34-0003-def37613d705@theobroma-systems.com>
Date: Mon, 19 Sep 2022 17:43:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 5/5] common-tasks.rst: rewrite the section about
 configuration templates
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-5-alex@linutronix.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220911172608.2542076-5-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 9782a4c9-b2a5-40f1-c7ad-08da9a55b52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	21rFb+Y4uMtdFPBWSqXu2RxVQkE3P0YsXWmZAg9sU5kZVHgA+w1UhoBUNEl/5QtkvQzOl2a4BtT08Rf/FQrjM0lluXe/3tIlIUlL98drLWUqGpELv9MmT1cz9VMHdwN+FJZxr/ocDLloKs/kXEzWwIRwDNCFesw/fhL/B5suv+lZpjD1FSF+hglEn92tQ4NCS+RlQPDrNCdm6LvIrWlsQTGYkwP4U0QpOGD8OHGvco2C+e2Z1YX7ID0Zg1oYKPb+YvBMhwunpABiBArP02HCLpkr5Lo1WuW1W0LOuGmzgm7sOUJpgRV4SaFmLl37uXXS5uPdL7HT54PBCaRm57jKaKUp9KZjVBEOo9Zhj47us5UkepI9YgN/CeRI7V7P5JtCC5eYkFRmqtQQto3psdpjcxl3Wx5Npxx8EvoAlr0RCpJ5tyJvw02ItqWiGoAPuy5YyFuxGUYgN8++ADp6Md+A1kMVqd1fgL6PfAsOqPIcuFvhtw/msJIW9pkQPyaw/itT7SGTpVgeLtJPKCyFZ5NUxe3oeXyE33dDqWas8xBOD6uWf5AU4QkyWYTH4UpjTOmYyKgH4m8eB/npBdPZndCSKpdzuwvibLT+puy6gLv0bJ46wh8JIVos/vsPdXnDPuKiNUUwrJsIOyzMrRd1o75wWQ8zUHYl3H5Gsd0258A8qyYdAwyvdURjqhfIXM0eGW2NcR82Zrg18JZt/01uYNAa1ypxMKHH1WVR/S1IwWAC3j4P89vVcNv3Or+TKKEVjcQ5MmYHUwKNeeBcrCzpM/IdZ3WT2ftXM3cL2lxZSX9moU0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39850400004)(136003)(396003)(376002)(366004)(451199015)(2616005)(186003)(31696002)(86362001)(83380400001)(38100700002)(5660300002)(41300700001)(8936002)(44832011)(66476007)(66556008)(8676002)(4326008)(66946007)(2906002)(26005)(6506007)(6512007)(53546011)(6486002)(478600001)(316002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eS9QaDczbk8vb2pmUWhtbk1yRzZyZVJ5VEd2N2NsdE5MYVZ0WlYwYW9uVURJ?=
 =?utf-8?B?RHdKVDYzdG5OM1ovOWlTc1JRVmozTEVra3I5S2RoQnpSR0xjcmpRSFRpdita?=
 =?utf-8?B?eENrVVhIazVXM3J2Ymduc09IQkh4RjZiRHNFWTlwdk1vd0l6bGYzYWJOVzNi?=
 =?utf-8?B?OGttTytSVWJndnBkeDFwRjZ3WXJ1M0Z3UTdobUFQV1RWdytuRXUzeTlKcHRN?=
 =?utf-8?B?YUFSMHN6QkptckpVQnZqVWJlb00rTURpYnUwS0dmcE5wSlBuK2o3TTdHWk03?=
 =?utf-8?B?YWJwMWVQVUg1R1A1eEFxWkZqN08xdW9iM2UwZk1iSEtWcDllRFVBZUJQSXFK?=
 =?utf-8?B?QWIzUkFYOWRUaGkxQTBtc0JaVTVKYmVtbUl2M0ptcGZkeVJvM0xlOXRKVTc1?=
 =?utf-8?B?cVVPdmRxR2hFUGN5QjhERVZON3VzM0lCMkRjOUlFT0Y2YkxvZTc2ZGNEMEtJ?=
 =?utf-8?B?emRtVVhPbDU4cE9oY0JaSmRLQTk1VXp5V0JNRmhjNlNKbWtOYm1FK2tNM3FI?=
 =?utf-8?B?ZVd6ZGl1ckJGZzJIRFFIVUxLQmQ0MktRVVdKTXBoTERNVTZpWTFGcURiVGFt?=
 =?utf-8?B?MEFEdHpETDhxVG56TWdTV25kVnBOY1BzZUVod0x1L3hoWktPekxpL2hBTnRJ?=
 =?utf-8?B?aExWbjFyZ0I2dlZTb2F0Z2RYa3JHTGkzQUVRQTluTXN2RUFBTHZ6cDRkQXMv?=
 =?utf-8?B?ZStFdXVvckpYOVFYVlVhdDMySjhkVjBnQlkvM3pVS002NC9kM0pGanZRcmhV?=
 =?utf-8?B?TUlXVHYwK3BGQ2xGemdHZlZ4Q2o1STVOa3JTY3locGtCNlpzSHFzUmhRd3k4?=
 =?utf-8?B?eS9JaDRtT2F2d21HWnM3U3pyU3Z6a0d1bHk0MmFRQ29QeFcrYnBrQ282UjdQ?=
 =?utf-8?B?TlFYbUVrTHcyVEJEQUlJMjhDR1RmYXpZejlhbG5PWS9RK0p1M21TKzJiUkNG?=
 =?utf-8?B?MnB3NXA1RHhkNVk0QWQ2bXRYdGk5ZGNReUl4Y1I5RXBrcFBJaTAvQmgxeGpU?=
 =?utf-8?B?SjZXOHNOMS96cmtsV0tGVVh6OXFHTWxTTEZZNHphVWcwaU1oZmRTZWhaa0lC?=
 =?utf-8?B?bHcwY1FQM1dMa3hNU3FHYWtPMUZ1UmFEWGVjT3RmSTRXQ0dJYUNLc205U1FB?=
 =?utf-8?B?TE1haGV2clJUY2loeWFVcGpiY2Y2ZjFRbHdmV3k2QU50NXBSdFNuWjlydjBn?=
 =?utf-8?B?UzVhVXhTRlhzVFZRbzJBczlrdFRtelhXU3BmVE45SXNsQ3dhL3ZubWJreldj?=
 =?utf-8?B?Q2tzQlRUR0huMmo5MlpjZjJySk5EZ2EyYU1TSGQrVFJqN2NVRlloQWFYdWMy?=
 =?utf-8?B?MExqVkJzL3VKM0U2M3haWkw5WW8zRmhiK3pGZ25OaFlhUmlOeS9wZDF5UEU0?=
 =?utf-8?B?QUhURDlIZ0RJem54M0J3TnJSc0EybTlHY2lxNnYwQWt0R1JpdTh0SVFNbkRx?=
 =?utf-8?B?SHJaRGFWMW5ESUhZeXB0TEkvNHcxWjdtWFlRbnZRVlNadDhkdEJWSDV2YUpL?=
 =?utf-8?B?QzJuem94cVdoSDM4QWFQalNTQlRseDZJTFE2enVzaVdjTVZBQWQrR01iaXVU?=
 =?utf-8?B?NkNsam1Xdk9COVAxeDA0b1NuOXlxTXVVRHUwRlJwZEo2VzQrOVYxQXVVU2tn?=
 =?utf-8?B?eERXSW9MYVRtTnZXMkc2dWUrOVRlYlJsQ1J6UlhZaWNIejRlOFJyNm1JSEc1?=
 =?utf-8?B?QnNRcHVGVExnWE1IL1JjK2MrcUN6MkQ2TUN0TTRCRjBMZUg0YUJtcWl5ck4r?=
 =?utf-8?B?Slp0Uzc2QzNQMlhDaVo4YXlIODNFdlRCSkdXOUJRSCs5ZjBvN0IwUWtPQjVU?=
 =?utf-8?B?VDFGaEdZMVAySXA4Q200UHJFalcvNVNZUGxQSEtwaEpCL3RqMlROeXdyTHov?=
 =?utf-8?B?cmV6Q3RUcW5adEdHMmFJWGlaalpIUlJ4d3V0UmFleVd6bWNHQXVHQUFTelhO?=
 =?utf-8?B?c3NiN3NVZjZTLzZQcjhBZW9CMmkvRFpERmIzcWhhakoybituUzNxcEVIVFdk?=
 =?utf-8?B?b2NmWGx2cHhqUmduckJEMkJMQysxUnFBdTRsNHpvcjFsamRrcUQ4VGpXZENT?=
 =?utf-8?B?ZENJQm1NcFhtMnFTemR3cW9wVWVFeHRNZEk5OHA1TVJyYjNnbXRSNERaQ0hR?=
 =?utf-8?B?RU1GTWs3RTVpa2k4amp6WUY2eWZlNGh3VEVnbFF3bWFRTW5vMTR0Qm9nUjFy?=
 =?utf-8?Q?NUUXDTgz8S1vQhJXNZAGlZc=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9782a4c9-b2a5-40f1-c7ad-08da9a55b52b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 15:43:33.0820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VScePQbRm1ODcFKjEplLra9+kWGvebKtA6k1od5Kth8GdrD/Ogw1H1jyoN1aS4MbTToIu0hPueUHMhwUbkRBwjewpleMQY4/U2FwXE0WBoaDEMHKcSI9VD+ROnqupauv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9060
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Sep 2022 15:43:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3176

Hi Alex,

On 9/11/22 19:26, Alexander Kanavin wrote:
> This now includes a description about how to create a template
> with the newly added tooling, and drops the description
> of .templateconf as a way to point to a custom template
> (which is not correct: .templateconf is used only to point to a default
> template in poky or core when TEMPLATECONF is not specified).
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/dev-manual/common-tasks.rst | 92 +++++++++--------------
>   1 file changed, 36 insertions(+), 56 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 6c2df9aa6..eab5648fd 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -6463,71 +6463,51 @@ Creating a Custom Template Configuration Directory
>   ==================================================
>   
>   If you are producing your own customized version of the build system for
> -use by other users, you might want to customize the message shown by the
> -setup script or you might want to change the template configuration
> -files (i.e. ``local.conf`` and ``bblayers.conf``) that are created in a
> -new build directory.
> +use by other users, you might want to provide a custom build configuration
> +that includes all the necessary settings and layers (i.e. ``local.conf`` and
> +``bblayers.conf`` that are created in a new build directory) and a custom
> +message that is shown when setting up the build. This can be done by
> +creating one or more template configuration directories in your
> +custom distribution layer.
>   
> -The OpenEmbedded build system uses the environment variable
> -:term:`TEMPLATECONF` to locate the directory from which it gathers
> -configuration information that ultimately ends up in the
> -:term:`Build Directory` ``conf`` directory.
> -By default, :term:`TEMPLATECONF` is set as follows in the ``poky``
> -repository::
> +This can be done by using ``bitbake-layers save-build-conf``:
>   

Double colon to end a sentence to start a code-block missing here.

> -   TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf}
> -
> -This is the
> -directory used by the build system to find templates from which to build
> -some key configuration files. If you look at this directory, you will
> -see the ``bblayers.conf.sample``, ``local.conf.sample``, and
> -``conf-notes.txt`` files. The build system uses these files to form the
> -respective ``bblayers.conf`` file, ``local.conf`` file, and display the
> -list of BitBake targets when running the setup script.
> -
> -To override these default configuration files with configurations you
> -want used within every new Build Directory, simply set the
> -:term:`TEMPLATECONF` variable to your directory. The :term:`TEMPLATECONF`
> -variable is set in the ``.templateconf`` file, which is in the top-level
> -:term:`Source Directory` folder
> -(e.g. ``poky``). Edit the ``.templateconf`` so that it can locate your
> -directory.
> +   $ bitbake-layers save-build-conf ../../meta-alex/ test-1
> +   NOTE: Starting bitbake server...
> +   NOTE: Configuration template placed into /srv/work/alex/meta-alex/conf/templates/test-1
> +   Please review the files in there, and particularly provide a configuration description in /srv/work/alex/meta-alex/conf/templates/test-1/conf-notes.txt
> +   You can try out the configuration with
> +   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
>   
> -Best practices dictate that you should keep your template configuration
> -directory in your custom distribution layer. For example, suppose you
> -have a layer named ``meta-mylayer`` located in your home directory and
> -you want your template configuration directory named ``myconf``.
> -Changing the ``.templateconf`` as follows causes the OpenEmbedded build
> -system to look in your directory and base its configuration files on the
> -``*.sample`` configuration files it finds. The final configuration files
> -(i.e. ``local.conf`` and ``bblayers.conf`` ultimately still end up in
> -your Build Directory, but they are based on your ``*.sample`` files.
> -::
> +The above command takes the config files from the currently active build directory under ``conf\``,

Spurious backslash.

> +replaces site-specific paths in bblayers.conf with ##OECORE##-relative paths, and copies

Please double-tick quote bblayers.conf and ##OECORE##.

> +the config files into a specified layer under a specified template name.
>   
> -   TEMPLATECONF=${TEMPLATECONF:-meta-mylayer/myconf}
> +To use those saved templates as a starting point for a build, users should point
> +to one of them with :term:`TEMPLATECONF` environment variable:
>   

Double colon to end a sentence to start a code-block missing here.

> -Aside from the ``*.sample`` configuration files, the ``conf-notes.txt``
> -also resides in the default ``meta-poky/conf`` directory. The script
> -that sets up the build environment (i.e.
> -:ref:`structure-core-script`) uses this file to
> -display BitBake targets as part of the script output. Customizing this
> -``conf-notes.txt`` file is a good way to make sure your list of custom
> -targets appears as part of the script's output.
> +   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
>   
> -Here is the default list of targets displayed as a result of running
> -either of the setup scripts::
> +The OpenEmbedded build system uses the environment variable
> +:term:`TEMPLATECONF` to locate the directory from which it gathers
> +configuration information that ultimately ends up in the
> +:term:`Build Directory` ``conf`` directory.
>   
> -   You can now run 'bitbake <target>'
> +If :term:`TEMPLATECONF` is not set, the default value is obtained
> +from ```.templateconf`` file that is read from the same directory as

Spurious tick quote.

> +`oe-init-build-env` script. For ``poky`` reference distribution this

Double-tick quote oe-init-build-env.

Cheers,
Quentin

