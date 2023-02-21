Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8656C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 12:01:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web11.40728.1676980910121125659
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 04:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=Km2+LFji;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.78, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAxeOW/o0cky8736v3BAYJchPo1jZ5nZKSvPilXBDqwCWw9iBq7IcHLc9K+OQvyCmg9HVfjnk5PWGpuN5wysjyzz2Rm309zlg/7UlLDSuQXBl5ChQp0mQ3LeVQMFcbM0B0QzHbCvt+KHji9Ey1QS8nA2P1XzHpsUUs2WiwE9+BdlbNlawPDtH5kGx7+LfGjtxjpHeL4LQpkYu6PS+dM15E4Li3EOW8gpu4Bctr2p6UTlLLwrlJ0Y5UYL9OsazBvNlJXmi/YvG9L+JgmX8CLAe5WKGSZrKeYlHTgMLpVBKAwz5WarmidV02Il3x04fS+u41UaKrH7pUvByrMMO+I6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmnFMDBy/Yx3S0vClX82dc1KjGlY2OoEiGbmlrD2hmY=;
 b=TpEnjkpPyPwnHwHr6x/PuYleym4gR0970BLVwmMZqvz2FEYSPBP/A8fLB8W2LZHID445lyMww5pHp1HQoMWanPklSP3iMIkR5MKehgScpCdwm0aSN/gdpYuM81W4xL8CXYhDAgdUAg6j84sWa3Mg4fCe7IAPqvFefi012KU2Bsl0xA9KD3fQbb7BhQDkhVz3xkA5DF93pQjXsV9DHaVRH4I4TwcamUESGsB8jSmkL7+GEvQMzzKRkmZpcG1WeUnHPdH2N3kG1IGk6HqnEO0o0HFhalFBGRkXpZCl7i9UwqEaRxbCcYUDlwB3OlLvFWGnrj2PtlEODxMPM7EU+F2Ygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmnFMDBy/Yx3S0vClX82dc1KjGlY2OoEiGbmlrD2hmY=;
 b=Km2+LFjiRcPhGgnlJXPAC9ZciT6Ddz0V6D9hsrolHU0XJd4YEexk5gpTblPAipr8J2IBboCaiwWPnO7J6nh4g/rXi2lq1rO4eK+nhZiug7UqTmxCFBAgLtprK03od41cvjEp+Ycz7b7qEQs6uvWXfDKM/bUHbJ7/l/YudjWII0NsYF9rRtShvqWVzzx2/7Jf6v44Db0iPzA6QgIdZGZaJ+vbRxqWOG+jDXZPf2kUOhme7GH4tupzHvmwCT0ss4YS9eaYXUFT3/h8pZf1kFNTY/s+xYypexCJAWlf2+4RU9GxboFBHKHxm3YRJ58Vmp/nQNplfl4lt8yXxp7QWlFw0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB9280.eurprd04.prod.outlook.com (2603:10a6:102:2b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 12:01:46 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%8]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 12:01:46 +0000
Message-ID: <b218e63b-b446-25d7-165a-b4a9926cc047@theobroma-systems.com>
Date: Tue, 21 Feb 2023 13:01:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] manuals: document COMMERCIAL_[AUDIO|VIDEO]_PLUGINS
 variables
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20230221104436.20516-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230221104436.20516-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a92990-228b-40fe-cb0a-08db140367a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	04Ht5T4JEDnagX359qS4kP4STglBquSp6V7kkDPhMoyYJ2nvOjk2wWBqclAP4nfLDU3vtcNrP1QNqSVqGdNg4cFBxXcjVqCGEJyOxLqTlqM6G/yY6GmAONS81eK+D2/vr4lJzrDEKkrsHoDwU+xtR5WRK3QC020Iuiy5ywJh2O+4059LWPcYlWfbiFMQucycUXD/d8dNfp4LBuBoGqRuyaJxwsU/UqEHsFGbH9OwMsHa8Fh+edN3V0vLnd68j6ekwPWpMKqqb27TGLVjh3tFpzsywonF8ZB7yQuThKAy73HszcuROLxyqesabMU7EGwI1kRIXfWVGPIYvOow1GVqPCTcfr+bdjCHcE0Ld2GGCO5qE/jO38lClunGYr+l6MjzYz17SsmvAbBDevHy9NC7XkgJgzIN+x+YqCzq1WoQECJ+KHFtCXi3uYolARPfovBc0ynLaoU4NORF74E7QB2m4BVE+y6kS5MaGaF6cCmw7IH/3yDWQ5W/C77w02aMAovYyP/ewrlsYdxSdy5svWwgVvjD+6+db4+b3e3UClIh9ipQEYhTEZrbd0E+8Fd6PBsIk1JYG9yJ6rhYmD3XnqGwykNmX4wjfSPuzsl1KI62XSMz6UdUbeG3t05Ozgx6Dlj47RAIJLKYBFHDLCs9kjzX4WREjHgYTnT5M0gx8mys+yuTJ8l8CZbYkkzIcJfmByE99MTi9e3u2hU6DHoJHzpyRAfwRod0m8DAkefTBXXYWUEIprA/8g+WyMcVynIWsZ3Y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(366004)(39850400004)(346002)(396003)(451199018)(31686004)(44832011)(2906002)(31696002)(86362001)(36756003)(38100700002)(186003)(6506007)(26005)(478600001)(53546011)(66556008)(66476007)(8676002)(6512007)(41300700001)(2616005)(6486002)(83380400001)(8936002)(66946007)(316002)(5660300002)(83133001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUt1aVNzVnl6VEFiaVFGam9BZzkwdldwVEJPc1Q3OC81cE1sTG0vdXlkVXZq?=
 =?utf-8?B?WHdlbHNCbk5WRkdUa3JlZXZIM0M3Tmg2dTZGM0RoazFGL3VuYUJlV1hybXRU?=
 =?utf-8?B?V0M0elp3VU1TaWJmNmQ4UTBFVnVqZnFscTlOdFh1YjVjbjBUVFVieE1hQUR5?=
 =?utf-8?B?aTJycWJvOXZqd1JnVjhOQ0pYSGhmSXhRNFA4TXBUdG1GVnJoL2F6aGt2T3Bk?=
 =?utf-8?B?NnBxZ3hxbEZaOWUxYTg4MkFkMnplSlRhTDU0dG8xQlVPWjR2ZWpmQjU4TjlZ?=
 =?utf-8?B?Wm1VWmM0b2lTVXpDazRFeUNlSW1EOXJIby91SU1Kb3NTRUxqODlqdlVscTBR?=
 =?utf-8?B?ejBJeTc5UXRZNzYzS2dRSjcwWGdSeGxzQ1hqYVg2N3pMcTJDSkE3RndQdkJ2?=
 =?utf-8?B?T2tHUkw2TTZ5ejh2M2hTaXREUVVQamg1b3dFVE80TXd1UXk0SXFuTHlGRk04?=
 =?utf-8?B?aS9iZGxQekUxSTZBMXZVQ0pvVmE5ejFrVzNOcmlqcU1FY2Z3WnlkRTErZWRF?=
 =?utf-8?B?M05UWElvUWxNTzhkSGVoNGoyUllaelNwQ0VoWlp3alZ3YVBhSEYyZjJPUk53?=
 =?utf-8?B?OUV0cHRJQmo4SW5mWTR6QzQyWjZFUWx1VWppRDVvbDZMOTFPMkxnTnppZFBr?=
 =?utf-8?B?RStyekFyc0ZLeGlxQTNrOWNsV0k1Skh6SFUwdEJYNVBuOUtxQjVHVVJ6NGlz?=
 =?utf-8?B?WFdXeDYvL2k0LzhiZlBTT1VUZFlwMExXR0VaZTlXakRjYmdSTXZHblZhWEk0?=
 =?utf-8?B?N0plODBwZGhncjQvSzJxRzBrRlpYYk9FTUhhR2Y4cy9zdXNqaGJ5U0htdjFK?=
 =?utf-8?B?eG9TeHhzc1cvQUxUNUFjUk51SjhMc1NpbStESkx4Y2YvK0MvWFpQbjRqeHRX?=
 =?utf-8?B?cDY5RE5CdlZBdFFON0dqUUxlZkZwcVN4K29rWWN2Y3BzR2ZYSjYxaXRvajdu?=
 =?utf-8?B?cmEvbDVKcmtpQ1RHZkN1TmVnSDdQZk9iYitSYWdBeGsraFpDcXNHR1lJRCt2?=
 =?utf-8?B?S3hSSUMySHcyNithTXZFL2FIcm1BY2YzZ3BqK1ZnZmNyMXBZMllsTWZaMlRm?=
 =?utf-8?B?MDhtSmkrY1gzMlE2ZUtlQ1h1RU9TZWZhWWIrMmxFSTlTcE1UTndyeURMWGM4?=
 =?utf-8?B?Sm9FZEtDa2habEZIZVlaR3lvMVFYM2FrK2xqRWREdEM1TmJIMTJiRXNXK1Aw?=
 =?utf-8?B?azFsNHpxdkd3QWxpMG8zSWZnRTFoL0tIL0VRdVJnVFcxWnFvUUZqYjJhaVJB?=
 =?utf-8?B?emt4MnV5dVhQanFDYW05ZEx1allHNTZFZHlqcDlUMXlxVFhOZ21aNmdGdXNi?=
 =?utf-8?B?RHduOGtRVzczT1dXY05TcjBublpSN0tqVmlERWkrc3M3RC9lZFc5dHovWFNK?=
 =?utf-8?B?UnBJMUlVck41QlRNT0lrbUFHRHpJQ0dmcmRFazZkZFVYZyt3REtNU0pzZkds?=
 =?utf-8?B?Nk14Um1CdzhIRWlFTjU2ZTlFRmVJZXZ2b0Q1T1RXQW5xSVVJUGNMVVJJM244?=
 =?utf-8?B?cUtrOFB2ZmlwNkY4dkkzLzNtSk05MUFxWnZiOGVFK2syK29MdWJ1aGRTQ0hv?=
 =?utf-8?B?SDdNY0tEN216WVFBcU4xQ0hjN0VYcXcwS1NENXFsTWdGVmREZTVTSHo2SGxx?=
 =?utf-8?B?U2tyVXo1M2tXZ1gzTUZLSnFoYkhLdWlTR3ducVBORkcwejRURVV5V1l4MjRO?=
 =?utf-8?B?UTh1MWZVK1BsRUpYZ2wxY240ZXQ2NW4raEdaeHgrZ29ZTkRYcU52eXhmNzZL?=
 =?utf-8?B?dHJvVXl4TnN1NTdOcm0vc0RHbTJsQzJjeTlHa21MZDNKOFkzdXVRWGJNVm1G?=
 =?utf-8?B?QWxRUVBUNHlFcytUa0RvMGFTTGlhcFJheVFpWHJOTHZEV0VUVjYzNG9EWFRu?=
 =?utf-8?B?YW0rU012ZDBHcTlhenN4UVY1anhjOVZpK2FVRkRMY2ZFZEdXbTVwd3QwNG45?=
 =?utf-8?B?eW51UEpabTJkcklDdzdXVFNiMXN5alg3ZmJOcHM1aWNma3ZaZStVd0lYK2tv?=
 =?utf-8?B?UENrc1AwMm1GVHNEditHdGhuNUJnUCsvRk8wOSsvUWpIeHdybmpKUjBrRk1Z?=
 =?utf-8?B?a3g5UUNxYTQvREx4d1lTcXFxN1J1ckx6VlVIbGZoOWhQU1FiT212TFZjQm9U?=
 =?utf-8?B?UFJiSkFqY1hnTEttU3lQeStoYm9KaXJsQTQ5dFlBbmFrNllxbjdVMFdhMkpB?=
 =?utf-8?Q?5rebEMvcCQWcB1TBxbEPeAQ=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a92990-228b-40fe-cb0a-08db140367a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 12:01:46.0970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmZJYdB6NRyWwaZg8+gqCjU4v5kKPWqLwEUNDZiVGFOE5mqihhV3/JpJNN1+8Of6owjiULKBFQBKMW+sfpLZZsRrdeEMq01yu7JBf4t6vptBEEv+4aU4Dl6oTdkjeRBL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9280
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Feb 2023 12:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3705

Hi Michael,

On 2/21/23 11:44, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> - Add COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables to the
>    variable index.
> - Clarify that these plugins are still open-source
> - Improve line width
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/dev-manual/licenses.rst  | 30 +++++++++++++++-----------
>   documentation/ref-manual/variables.rst | 20 +++++++++++++++++
>   2 files changed, 37 insertions(+), 13 deletions(-)
> 
> diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
> index 65914e5efe..54d3a2e5f1 100644
> --- a/documentation/dev-manual/licenses.rst
> +++ b/documentation/dev-manual/licenses.rst
> @@ -242,10 +242,8 @@ defined in the
>      COMMERCIAL_AUDIO_PLUGINS ?= ""
>      COMMERCIAL_VIDEO_PLUGINS ?= ""
>   
> -If you
> -want to enable these components, you can do so by making sure you have
> -statements similar to the following in your ``local.conf`` configuration
> -file::
> +If you want to enable these components, you can do so by making sure you have
> +statements similar to the following in your ``local.conf`` configuration file::
>   
>      COMMERCIAL_AUDIO_PLUGINS = "gst-plugins-ugly-mad \
>          gst-plugins-ugly-mpegaudioparse"
> @@ -253,20 +251,26 @@ file::
>          gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
>      LICENSE_FLAGS_ACCEPTED = "commercial_gst-plugins-ugly commercial_gst-plugins-bad commercial_qmmp"
>   
> -
> -Of course, you could also create a matching list for those
> -components using the more general "commercial" in the
> -:term:`LICENSE_FLAGS_ACCEPTED` variable, but that would also enable all
> -the other packages with :term:`LICENSE_FLAGS`
> +Of course, you could also create a matching list for those components using
> +the more general "commercial" in the :term:`LICENSE_FLAGS_ACCEPTED` variable,
> +but that would also enable all the other packages with :term:`LICENSE_FLAGS`
>   containing "commercial", which you may or may not want::
>   
>      LICENSE_FLAGS_ACCEPTED = "commercial"
>   
>   Specifying audio and video plugins as part of the
> -``COMMERCIAL_AUDIO_PLUGINS`` and ``COMMERCIAL_VIDEO_PLUGINS`` statements
> -(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes the
> -plugins or components into built images, thus adding support for media
> -formats or components.
> +:term:`COMMERCIAL_AUDIO_PLUGINS` and :term:`COMMERCIAL_VIDEO_PLUGINS` statements
> +(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes the plugins or

s/with the/with/ or s/with the enabling/with the enabling of/

as "along with the enabling <smth>" feels wrong to me.

> +components into built images, thus adding support for media formats or
> +components.
> +
> +.. note::
> +
> +   GStreamer "ugly" and "bad" plugins are actually available through
> +   open source licenses. However, the "ugly" ones can be subject to software
> +   patents in some countries, making it necessary to pay licensing fees
> +   to distribute them. The "bad" ones are just unreliable and therefore

s/are just unreliable/are deemed unreliable/

Also mention that this isn't a choice of Yocto but rather gstreamer 
community's?

> +   should be used with care.
>   
>   Maintaining Open Source License Compliance During Your Product's Lifecycle
>   ==========================================================================
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 760c608bde..26215f679f 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1313,6 +1313,26 @@ system and gives an overview of their function and contents.
>         optional at the distribution level, in case the hardware supports
>         Bluetooth but you do not ever intend to use it.
>   
> +   :term:`COMMERCIAL_AUDIO_PLUGINS`
> +      This variable is specific to the :yocto_git:`GStreamer recipes
> +      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
> +      It allows to build the GStreamer `"ugly"
> +      <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-ugly__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1avSgpDo$ >`__  and
> +      `"bad" <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-bad__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1Wm8oVT2$ >`__ audio plugins.
> +
> +      See the ":ref:`dev-manual/licenses:other variables related to commercial licenses`"
> +      section in the Development Tasks Manual for usage details.
> +
> +   :term:`COMMERCIAL_VIDEO_PLUGINS`
> +      This variable is specific to the :yocto_git:`GStreamer recipes
> +      </poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb>`.
> +      It allows to build the GStreamer `"ugly"
> +      <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-ugly__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1avSgpDo$ >`__  and
> +      `"bad" <https://urldefense.com/v3/__https://github.com/GStreamer/gst-plugins-bad__;!!OOPJP91ZZw!g3-jyo-zyCDgt8PzhEQCODfcdBgZFn81oApK_JDf-SOUZOj7xU1NTcsM3TiT7ijx5ktBKoVFrB10eWRqoTwwCKsmaV88ozoHJZrdCVVHKI1r1Wm8oVT2$ >`__ video plugins.
> +
> +      See the ":ref:`dev-manual/licenses:other variables related to commercial licenses`"
> +      section in the Development Tasks Manual for usage details.
> +

Please don't mention where to find the documentation if you link it. It 
allows to move the source across manuals without having to update the 
text, only the links.

If you want to point to a specific section of the paragraph about 
commercial licenses, maybe add a target in there? e.g.

.. _gstreamer-commercial-licenses:

Cheers,
Quentin

