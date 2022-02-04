Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4A7C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:41:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.55])
 by mx.groups.io with SMTP id smtpd.web09.12198.1643996465686302728
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=DJ7MzUJ7;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.55,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvjXZc57BTMiJf+4qHiTdRx5V+fHc6kCjpPM6GXMgjs0Bg8StuRReRK4vhSab34p4svoXomGMkzBlm8zoTcXQKgQEr0lArPnQzLm5NiW9o3v6LJwvOuD4OI+kyNWVqKzwxV/UOpluWuOBM0CToF+qCEk3ouIUYCTrCLlN41Sc2vF2lSdt28JVjO/Akjo9spbuRc2iDtWbU1Smb3eMwQuvxzyG61ePyJDKkH6rFFXZGqJRI0YWllaDabbx1Q8JcxPlTNfNCa90clCOI/5Qj6Df/1rw3m3bi/f9CgvVLHjvRiaMnSYy9ni99pTrRb0IfAECt1VAITIBBqVy0mNQJ++/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLriWRGM9/rLxrognjU27IOXBqcJCCViQBk6RKWuOE4=;
 b=ldmihxTCMgHodSn/aYkOKgON0onPLs/3pL9H/vXio04IDYb0uz4NHfQlDxIwYsZAJfapCPzo0vKqxvx1OPEH9tGP6HaeesdcZYi9Ch4FfNg/wyEkSvVyGtLGf6NX08tX7jezqAGAvGRR5tae1XrzUqqS+uHpmqG7y7LxmEREYafvc6u2X8niAyNvFRwv/XfKFwOIggzawJeUvs5nlaePd6oYfF0R+POGOqGlNEK3O3vsAmmz0IWL4kXeO8orCGy/TY0FUwoN56M04joavGV2HJxnHRMDYLHFov1Z8U/ibGE9PdwP9OK9gktqzL+UifI70X+McmfBeWPwrHvj3ibQqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLriWRGM9/rLxrognjU27IOXBqcJCCViQBk6RKWuOE4=;
 b=DJ7MzUJ79fqTNd1VSHy5iHQG2meyQ4zH4ipFZiPhGqmrafFWkxr4YTaNVuPnPLR1ke1wrO68TR0NZiFeQIAqEP/zojWww8UE1qS9BqusdV/iwWi8Fc8jhvaN0xVn6TY6+RyeCZqBWBm9TKb3z6EwUdSQ7QCkIYcUDxVQ5ryxgUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DB9PR04MB9378.eurprd04.prod.outlook.com (2603:10a6:10:36a::6)
 by VI1PR0401MB2526.eurprd04.prod.outlook.com (2603:10a6:800:58::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Fri, 4 Feb
 2022 17:41:02 +0000
Received: from DB9PR04MB9378.eurprd04.prod.outlook.com
 ([fe80::c540:31f6:c27f:c6a1]) by DB9PR04MB9378.eurprd04.prod.outlook.com
 ([fe80::c540:31f6:c27f:c6a1%4]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 17:41:02 +0000
Message-ID: <a6f4704f-406c-12ef-195c-08a1c970691e@theobroma-systems.com>
Date: Fri, 4 Feb 2022 18:41:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] documentation: Update for skip_recipe rename
Content-Language: en-US
To: Saul Wold <Saul.Wold@windriver.com>, docs@lists.yoctoproject.org
References: <20220204172917.110423-1-saul.wold@windriver.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220204172917.110423-1-saul.wold@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0151.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::44) To DB9PR04MB9378.eurprd04.prod.outlook.com
 (2603:10a6:10:36a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e820e37e-b126-43bc-115d-08d9e8058378
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2526:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0401MB25263201A30A63A220C80A99C2299@VI1PR0401MB2526.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GkxRK9+PyPWZWXZwjJ5JDY9z3wnx43s+B7uQ30mr9bdpf5ZrD7BgB7t5aEY2gxA/Htiu3ZkzVAW68oadtziT9OFFjUQrgWkmhAV7ADZhs4T63slvaoB5/mD/Du2g+/bq/djsSJY01NhZ1G23qsq1i8oFRR/mfrCiygEl0umABEa6JSuMnbFznj13pKMNU5KnQPiJk3l4NXwMFEpNgaV5LMsI+kp2AxO0P/X080gOEkKrKNyl1WinxZbq4aXQKGo+hNWJ+Za7AhBE0fZ+tuV5sp3hio4ZR8N3D6kQ6NsRF9CHN/lMPrTLc48V91SH7LVsain1RXDE+Dpx68JlEIea1NiJ/VqJcFSVlMB9bIsDth0yi2jJOVHNbGd/sE+VEY94eLKzzBlZ7aywaGOTGvQIZeYlZg0xHTWmDZG1IvurYbMY8WZtH2HJoOrxERyuD5KCpXzfSxeG+xE5ebokl16rhVwuW6rUpWLGaSS9ehmV7cGmOMZd0HKTFh4klL9+eEFJ6+gCgVSPQOVaFX7znh/d15g0jtCqIfbw371frwSiITtCJ8YwekCUU3jWDDYxx1zzenMTKVAz53WpzJDsncPhH41fhqFsRFVLPV8K2ucRoww6dNPWED3E2Bo/gB/x63J5o3rCqWvNUDQENJJtpewPaVNspGsZeW9psQ/ma5x+HLO/0hgHT7GQ8MdBA7Sy0IbnGsdB52B6cJeO55VaKHWkH2zX860TZMpNNr3j4kLw2hYVlk1KOWuXP324Vz9EcEHNdVbrutzIwa64gw8GFCFNLgFJmHao0l1I49eYqkHlZsf3tfOMjCldcpTogt5c0niiIinxYGpOptua0xUAAuiyLKhm940WG+C502OV0vjnsuk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9378.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(31696002)(508600001)(36756003)(6512007)(6506007)(186003)(86362001)(66476007)(2906002)(53546011)(8936002)(8676002)(38100700002)(66946007)(66556008)(316002)(15650500001)(966005)(6486002)(5660300002)(31686004)(83380400001)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjBEV2RjTnlHd2NWY0NmVnh4Ui9yd2RjY0pZUFQ0TXJPK2R5VTBxeFFSWkdt?=
 =?utf-8?B?L2kyb3pmTzJlZWlOR1NKSldxS2dlWkR3Q1liaXZhQkVadFpRTFVFSnFjSExN?=
 =?utf-8?B?RWIzejlkb1VCSmxLMU9PNU1yZjJhWVVLS1hhanN1a0djaUd6QXBVTlFUUmJN?=
 =?utf-8?B?TFo4TXdaQUdpalNJT1EvSXNoWWZWNUpsbWhGblZpa3haVFRVNHRXUGxwcXQy?=
 =?utf-8?B?dHlRTWxaY09IdkJnVDN4REFvanY2MithV1J1dnZBQnppS1F4aWIybUxGRjk1?=
 =?utf-8?B?N0VDVmZKakU4ZXJobS9uYWdzcTRTUEFoaWFnaWZWUWlUVmRGRUFzckF5Zlkv?=
 =?utf-8?B?c25aZDZGOTVhMWJzK2d3ZXgweWxYWmE2bkxyMG41UnVvWnBVK0dMdC85c21X?=
 =?utf-8?B?d1pQVjNBb0hXQkF6NUoydjNaRDZBQnhkRlNGQ25KVFljSE9HM3F2U0ovOGlV?=
 =?utf-8?B?bVNxZGZ5WUJBTXVFQXMyaWdGbmhKUXhKS1NGZ3o2ZStLV2lGOVZVTWRyMk54?=
 =?utf-8?B?dEluNjRTZEVUM2xPbldZTkZud0ljQm5DdHhWTzhOZVdxbERFQk5vMGh0NzBO?=
 =?utf-8?B?STlpR25iODdWVUhtT1BSZ254SStNb2FqREw5KzlsM25uYlFhYzdCOHVOL1Vv?=
 =?utf-8?B?d0lWSnNmYmxBazAveG5yWVg5VUhEY3pkRXFIajQrd2JoejZFbUs0WXNleHJt?=
 =?utf-8?B?c00yRUN3c28vRmdUNEpxVkkxendqQnBoN2VnQnIyMGduWjBLT3ZpZmw5c1FN?=
 =?utf-8?B?bmF4QWpnRXBLWTRLZTl5Qzk3c2VkVERiU0grZmFtaCtIYWVYTWpBS0x4Qjgx?=
 =?utf-8?B?eHFTRnR2aWhZelRucDduMjd0RmV6NVZYY0hZbDZGdlAvSWZrL0RaYzlYYUNT?=
 =?utf-8?B?aUc4dmozZWUxVGs3U3F1Nk10bGVKWjZkd1BBSzhPYUl3aHBLei81VjVOWGNm?=
 =?utf-8?B?SDM5Sk50K1hMMC9WTzhyeUQ0NnlyTUJMSXYwSnlSd0htUHpaVU9vOVVQUWVn?=
 =?utf-8?B?SCtCcTR5K2s4MVpUaVVtM1FrR3dibVg1ZVc0aEZEbkViK2x0YmhGa2cvK0dC?=
 =?utf-8?B?c3RGRWFiNDBOL1FSZWlLeHRPeWtVb3RoeEpnbFk4bE5vdmI5Qmx0M2tzWmZL?=
 =?utf-8?B?WjZkVTRIczloMHVvenNUQ2drZHh0Um5pNDhuVnllQVpub2U1Y2NxdDZORHBw?=
 =?utf-8?B?MkRPVnUwVHpkMElHNlBBdGtLNitpM0h3aC9TRnQ1Skx1S1FhK2NGYmQyLzlh?=
 =?utf-8?B?YzZKcmFab2JrNmo1Zzh0b3BmSi92RHBnU0d6WjIzTitRdklMSFJ2U1RwbVFl?=
 =?utf-8?B?dE5ENEtXb21ZbGI2TXdieWZ3SU5CRWVBQjBSNXpGLzRjeGk1cDlUcmh3bnhp?=
 =?utf-8?B?UVQ1elNYT0R2WU9RTHo1dFF5Sm55eG5tTXpub0xhcS8yS243YVhvcFFhN3do?=
 =?utf-8?B?RkNhQnh0NHRIUGJDYTZQUmpsZnhOMm5NMUY0bC9ySEhBQ3VSZWZyN2VrUTEr?=
 =?utf-8?B?cGx1ZnpSNnNqZGNNR2VJTnlDWjBMK3dHSnVCUHNqd3RQSDJpTGhsUE94TFgw?=
 =?utf-8?B?SVdKWUZ6Qm1tWHVkWUowTG9OVlExbGhHeFFMTm9YRnNvWlhFcTYxNE5aa3J6?=
 =?utf-8?B?UmoyTVNacDBSR1FOZXVuYUZxZUZNcEJhMlJwM3lZQU1WMm55aFgxV3picXRv?=
 =?utf-8?B?L2NCc2dtU1g3QUhMVUkrU01iUUUvTjh3OFVVK2QzT0NpZ1k2RE81NlNnZlVZ?=
 =?utf-8?B?RmowSXpEL0swemNaL0JOY2t4cFU0ZG9BNk9JTXFNV3RtK21DVnloOXJCRTIz?=
 =?utf-8?B?U0R4WXduLy9IU1EvMStVUWlHZG5yR0lzcGwzN21MZ2F6dy9JaE9pM1RLcHUw?=
 =?utf-8?B?YTBzMEl4TGIyZTE3b1ZuTnBhK2xVRkxwRmh2Qlg2SG5xKzNGOHVGdUZDVWVM?=
 =?utf-8?B?VHBkM216cTIrVHB2ZElsbDUwTEQwN20wQURkbHV5aHo2d1NnbHlsOU9tT0tN?=
 =?utf-8?B?S0JuUlh4YjRpOXFIRytvVGlPTy90VWpzUDBLL3Q3ZFkyVGRUMzMraEdyMG5w?=
 =?utf-8?B?SVprNnJXQVRGMGQ0c0k1ZVNLdEJGMnJ2OGZjNTF6dHVuc2IyQTF2clE2cFkx?=
 =?utf-8?B?cHlHWlY5VkJycjdWNHZIbHJyRHVPeDRlbzhhMmx1cTM3VUlHR1djTzJGVDhr?=
 =?utf-8?B?WTVDWWdaUVRDSk1LdDVPd0YwcVNidjlYMGtVMnMwY3VJR3pQL2hVejZGbDFz?=
 =?utf-8?B?V2pTdGowQlhSM3BLd25tVjMwSkU4cmlwYm01S1d2a0t5ZUFIM2xLU3BBMEVx?=
 =?utf-8?B?ZllaT2N1YTJJc05Nelc2WTlVdWx6Y0RWd2pWanhvOVVYVUVyRXFoSitiUEl0?=
 =?utf-8?Q?0Jro0KHe78z/2PgQ=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e820e37e-b126-43bc-115d-08d9e8058378
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9378.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:41:02.8425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oVh8m+R8sS4ySUWx3nzohABnw0+hfoGSy06h8PMpIqJU7JV7CvFV41KVi2iLveqg+vhbzLYtMfAy7JEAmXF9pSdfZaOJkcTt9sTH9/XFx6+FqZVAAFQe49wcqNy+Nze1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2526
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Feb 2022 17:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2462

Hi Saul,

On 2/4/22 18:29, Saul Wold wrote:
> This change better aligns the name of the variable with it's
> purpose. Since we removed the odler class, the associated
> documentation is also removed.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   documentation/ref-manual/classes.rst   | 17 -----------------
>   documentation/ref-manual/variables.rst | 24 ++++++++++++------------
>   2 files changed, 12 insertions(+), 29 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 949217bf42..8444fa4621 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -208,23 +208,6 @@ scripts to be disabled should be specified using the
>   :term:`BINCONFIG` variable within the recipe inheriting
>   the class.
>   
> -.. _ref-classes-blacklist:
> -
> -``blacklist.bbclass``
> -=====================
> -
> -The ``blacklist`` class prevents the OpenEmbedded build system from
> -building specific recipes. To use this class, inherit
> -the class globally and set :term:`PNBLACKLIST` for
> -each recipe you wish to ignore. Specify the :term:`PN`
> -value as a variable flag (varflag) and provide a reason, which is
> -reported, if the package is requested to be built as the value. For
> -example, if you want to ignore a recipe called "exoticware", you
> -add the following to your ``local.conf`` or distribution configuration::
> -
> -   INHERIT += "blacklist"
> -   PNBLACKLIST[exoticware] = "Not supported by our organization."
> -
>   .. _ref-classes-buildhistory:
>   
>   ``buildhistory.bbclass``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index d4f40b6929..323f9a4ced 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5683,18 +5683,6 @@ system and gives an overview of their function and contents.
>         packages for the target and for Multilib, :term:`PN` would be ``bash``
>         and ``lib64-bash``, respectively.
>   
> -   :term:`PNBLACKLIST`
> -      Lists recipes you do not want the OpenEmbedded build system to build.
> -      This variable works in conjunction with the
> -      :ref:`blacklist <ref-classes-blacklist>` class, which is inherited
> -      globally.
> -
> -      To prevent a recipe from being built, use the :term:`PNBLACKLIST`
> -      variable in your ``local.conf`` file. Here is an example that
> -      prevents ``myrecipe`` from being built::
> -
> -         PNBLACKLIST[myrecipe] = "Not supported by our organization."
> -
>      :term:`POPULATE_SDK_POST_HOST_COMMAND`
>         Specifies a list of functions to call once the OpenEmbedded build
>         system has created the host part of the SDK. You can specify
> @@ -6929,6 +6917,18 @@ system and gives an overview of their function and contents.
>   
>            SKIP_FILEDEPS = "1"
>   
> +   :term:`SKIP_RECIPE`
> +      Used to prevent the OpenEmbedded build system from building a given
> +      recipe. Specify the :term:`PN` value as a variable flag (varflag)

We could probably link to the syntax documentation? 
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#variable-flag-syntax

or put varflag in tick quotes at least?

> +      and provide a reason, which is reported, if the package is requested
> +      to be built

which will be reported when attempting to build the recipe.

> +
> +      To prevent a recipe from being built, use the :term:`SKIP_RECIPE`
> +      variable in your ``local.conf`` file or distrbution configuration.

distribution

> +      Here is an example that prevents ``myrecipe`` from being built::
> +

s/that/which/ ? don't know, I've always struggled with this one.

Thanks for doing this! Can you add a few words on this change in the 
migration guide too please?

Cheers,
Quentin

> +         SKIP_RECIPE[myrecipe] = "Not supported by our organization."
> +
>      :term:`SOC_FAMILY`
>         Groups together machines based upon the same family of SOC (System On
>         Chip). You typically set this variable in a common ``.inc`` file that
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2461): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2461&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QwAVv26m3nhxkLg8vIRbg36-64e9TOFcu4EwANM184tkx4wepEJJqTALti_MunCq&s=AQxZ3r5lqvoIAHpA1QN7ZyhKXkiD6ZZ0WUtvzjvHT98&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_88911954_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QwAVv26m3nhxkLg8vIRbg36-64e9TOFcu4EwANM184tkx4wepEJJqTALti_MunCq&s=yia1KFy-nyY6I3BSOlf6PkQpRbNnZM9Nk9JU5JeK0jA&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QwAVv26m3nhxkLg8vIRbg36-64e9TOFcu4EwANM184tkx4wepEJJqTALti_MunCq&s=epVA_LS6rJTNC3JYzQlRyuXnY2XcLU7GW66huIz2Rg4&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

