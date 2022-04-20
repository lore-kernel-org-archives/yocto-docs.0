Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C775FC636FD
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.55])
 by mx.groups.io with SMTP id smtpd.web11.8495.1650465239239153451
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=B899phzv;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.55,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBGgpz7Bpqb/wmKCQ91I8Wr+zOd3Z/HZ57ddVr180M1RGBApwASIEEVLbgLec+H/0n8vhsXczVLq/VggSn4NFZ1xH6X74jPostSPQi1glajbkiqzgAd+T81KfIueGLn6D9yAg/EaYH63jm9OtmHJs9nkvs7lGPJssMR6AF5x8RSXIscHb5g3pI3LmAJMXCfIgzKE1uZB0hUMDulKuzdkzEHXC6HzWd89NTW49ZbO1quqWwC953zhJFk9NZdBC78N0DvN3JMDfLT6Ce9L/0kD7oXi9o4b41MiKeXWZog35J5ZLqllqbqzf/0+baqS0nxCWagtemzm0xYMcnwNcjzaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLxNhuZsh1yAXWPTW+vf1lycGIYvyZKCWdg8H4zveYQ=;
 b=IJegkhpqIZNDnfiQaJ1+mKoeK3nLYZX8gBIybqfMSIApPSxmQ/FL4MVu87EwLE1kKrBxPZ72h6gSPs7BOxgPmmITdDsrkhhlQC8z9dCLM70YeZQYaajo30ozfCazHdgvyB2b3y6anupDA/a1fuRL10HJK1PQrw0JjykKFxsVM5x0los6aPjAmRDDzHqXUlmOQ01o/i3brfiGQxHb8YQXpurUZww12fvNbWS648mUFwYyUljYZYHmn0bSok4htPaasW6klLgrsf3SPipXQ+7weqRvafqXpJD3iYykrs5ktgGz8ktrHYN3rs3i3fRYvnW0EvdQFiYwry1c8Mrt1Y0Eog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLxNhuZsh1yAXWPTW+vf1lycGIYvyZKCWdg8H4zveYQ=;
 b=B899phzvn5XIJ/M0tLdqdipq14X5MhkpnTfzX5Y/GHUnsLQMhpXLDV8VYBLpbxIOrMa7K9om3+IrzYefuOd+Db1xeA3yPrkzwM/ObPJW7FyijbHNfrkVK/jun2i3AK8Hc8/cvL/o3NWbJ50vPHEnjaqCr4wOgUG23dhGxLOLJpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 14:33:54 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 14:33:53 +0000
Message-ID: <fac6ec38-a689-9bda-3e4f-90528300d974@theobroma-systems.com>
Date: Wed, 20 Apr 2022 16:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH][dunfell] conf.py/poky.yaml: Move version
 information to poky.yaml and read in conf.py
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0213.eurprd08.prod.outlook.com
 (2603:10a6:802:15::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdfafe63-3a02-4109-4ba9-08da22dacb72
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB56003E5F2FE43A64CF850372C2F59@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uUeOy0xmZvo2X+HrmqCWA+1VsNp2aencPdhDusUIIo+kaNTvCgG6kNb9YwJzBEwWgHXZK6U5/KfFl2SWINrPfYtADNZVRp3Su/yiifQeZtuxtbleLyd2FqQ7pgGqWR2pR2oba9jYzOyUjWstu0UOjKc22Qy0uWem2Jowlqz4uFbcmtAd7ZSt3sZ79OsR/a1u0AOWTmrjV3aBO39HoLRS7xLQ+Kr+aVPpo8oDUqpJK6rNUh7mSjCpvyLZW6jkrzys4g0BkhkZKno0t4g/vJM986u3bCCIqE3YoLkW/AZsV4MSIV2BelipDi1bYlQT37OzFpyRCK8o5tgZb5migseDwBFcdsN0lorly6nPJapFm+wvbhWKmT60CzA8HTFVJjIDg0bRscPCbYiwdybsYvbnSDHppcMGXteThwhRWYNUBPv35P7a0OYzWsta9w2/4+agFfGAWdAacfVz/Zud1SM1mXezc/dESjHlzAZcpMwnzNG+ApOHAPWiSL7IdpyKFfRFGRSOnJLdm8YF+W4uvaB4mzA0ZufagN43W5rR+LioRsKEveYK9rjxdjXs9kIQIkgsaifFS+rohZJOB/y/qCQrBUOayUEwxKODse7TqMLs5D33GBh9hTyDKSJEOpQdVhzbfsOd2dqr/3+qQ3lavTDWAxOjXM1dMLA4A4ElifD61J4P9PbyQKgY4BGWE62Zww0YsFJ0Ry9PWXMIzTFBbikzdYeOaZ6qU9WVQi7vXyRVW86/aKW6O7+7HYV4FkI6Z7xW5Zus+giBWbONHEfMWQgkrSd7TZZ0IlpGxlmx6YY0dhkr5WUk/Rd/FKwT7DWEuhbQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(2616005)(66556008)(316002)(66476007)(66946007)(38100700002)(31686004)(8936002)(186003)(31696002)(6506007)(2906002)(44832011)(508600001)(36756003)(53546011)(8676002)(6512007)(5660300002)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDF3Mm4xWFlZclJzSzg1UlFSZUMyN3FuY1Y1RHh1bFUzS0JDSGw0YXYwcUU4?=
 =?utf-8?B?a3ZyZjNsKzlaL2hUNFpRTVNxU2VMMUZvYUh2ZnBMM25oTU1qV1RCZGplaW5w?=
 =?utf-8?B?ZVJlYkx5V3NIMnFrUGJMOGplUmZDU0hKa3lySTdCSTYreXdKelFHUjhweHpB?=
 =?utf-8?B?eVhqSWxZVW1nTE4rK0VYWCt1RVNteGRhSGY5ZFRwRXdOQUg2ajFZZ3Y2Sitt?=
 =?utf-8?B?LzM1MmRHaUZDaG83Z1lLQmpydXIxdzNpeUlKVXRCTHBwcjFqOFBqRWVnUjFj?=
 =?utf-8?B?a1JHNlVUd0VnZEhTOHZOOGpjOWJ3d0RVeVRvTlUyTUpxNjhXSWNURjl2NUV0?=
 =?utf-8?B?c0tSaXBuZ2FKTk9vZk45bFpJRVlxNGl1K2xkOVkvNnV6YXF2bFFhVFA3UmFW?=
 =?utf-8?B?SStweTR0eUcvM1NoLytFWGhpZFBtRFFyVHZGcDMrdWRKYlNjVTdkVmgvQW5L?=
 =?utf-8?B?VVR2Z2M2b1BycVFEVHU2a28yS3UzQVRMYjhKcy8wNmwrNzl0akxJMUZlanI4?=
 =?utf-8?B?WDZBTU4yM0VUTDh5ckprMTBTNWNObjJPaEpiWGRMYXhQM1pTaTRhVURWeUo1?=
 =?utf-8?B?UWtBL01xOUJ0ZDU2SVJsT2pHZUl5a25zSUxGZlk1NGxQcXdOY1RkR3JxeWJW?=
 =?utf-8?B?Q1pxZlM0TTMvemdQQnNmdTVWaFZZYWkrK0diejBEZERJa3o5QXFLUTJMOXc2?=
 =?utf-8?B?cldMUE91Z285bVJEVGxTRlRzQjBBcTg1dnF3Uk1SbVJXTXpTU01RdDZWLzdl?=
 =?utf-8?B?STdJbTNRZm9LM05uUmhpd0hhNFpKdXROUENIQ09ndmNQNmY0TVlyNnBydXRD?=
 =?utf-8?B?R0MvZ1lSTHNQNCtHWmlXaFdUdDVJcHdBYzlpRHZXVU1Pbk5pbjY1VXlvNkRz?=
 =?utf-8?B?Q2dYa2tDTDdZSmxpQ09hLzdKQ29qTXFQdjViRUQ0bSsreVV5U3pZTDlwa01K?=
 =?utf-8?B?YXJqL1pzMHM0QzFHN3cyM1JHcDBXQytpeXFiYWthV3dkWGxzaGNwbkxmUmg2?=
 =?utf-8?B?M1lZZ1JWQllyWXFaSlN0eC9venArRHJrNUVkSzdSeitrVUJ3ZzBDVEdsM1pY?=
 =?utf-8?B?NDhEU1ZaZWdFZSsvSUdmd3htalZId1pRZ2VVanpzUWRzWXoxc2pSOVJvajlr?=
 =?utf-8?B?dVNaamVZRFpMQUtUeW83U3hRRUtsQUdUbEppQi9nVG54Yi9XYTFBcnAyM2wr?=
 =?utf-8?B?bUJpWjUxcG5VOWN6SzkxN29yU0JuRUtHV0M1YXdjTmJVOE9RVkRHdnNTeEg1?=
 =?utf-8?B?MjY2UTVrbkNwNHJrd0xjNlY4dTlKc2RNQmMrZnhYbzU0ZG04YVVTMEMyRk1Y?=
 =?utf-8?B?bysydlI5dlBFTzBxZWtTRlBlTGFjZlZLWnZXcFdCTVB3aSsreCszYzBrWEpn?=
 =?utf-8?B?U0xldjRkbnNpWEozYnNRT3hrTlVVKzhXS1lFU2JPa1VqaVBORlJNc01MKzUr?=
 =?utf-8?B?R2dTQWR2VHZoUk5nUG1NWjFaTzJnaHl4YUhBR3ViTmorRmZGNDQ5RHZpejhL?=
 =?utf-8?B?ai9DZ3V1ZFJPT0VHN29nTlVOdVBzbkhhTEswSktBL2pXTFM0bXlZalhNMGdY?=
 =?utf-8?B?cVljR08wQnpQTTI1aDlYalBrVkRsdDg0TmM5UmVsNGpPOEJmMTdzZ29LUHBT?=
 =?utf-8?B?UkRBdE84bUNIT3VEN2VHRFVPWXF5Z3RNWWdhRnRBNFhlNTIxSnE3NHc2UGor?=
 =?utf-8?B?RVRQWDh6c3E0eXdFSEFuWnZ0S1VKMStlMnlZRlpOZGQwVEpBeEVNNnNNYllu?=
 =?utf-8?B?d2JQU2pORVo0YnFqVUZXYiswTjlPQi9SaFp2aGdpQ2E1dkROd3dyU0ppUUhB?=
 =?utf-8?B?cnJoUkxCbWV0TytDT055d2NpR3ZWNmVOOXNHT1R1V0wxL2VLZmpJQmRuZ3NL?=
 =?utf-8?B?S2xyUnoxU1NDSmNkSGZYT3Z3aW9YWndGRG5CdHJTc1prMERlNkRENmw1dS84?=
 =?utf-8?B?ZUZ4NzhnVzNhWE1UMHNXajlHMXVGVCtNU1lFanV0K1BrNnk1YlpPNTMvTHpU?=
 =?utf-8?B?QjBiNzFzQnpjOFBZS05SWGwydERNaEpUL0hObkx2WnhNVC8zcFJqaWlzTnBy?=
 =?utf-8?B?elFiNG41bkMwc0JXd2NXWjdGNEpFT1MvUG43dVVZaVI4OXFwYlRwVExhcjNm?=
 =?utf-8?B?NlVrR2ViV0VBejQ2bGxNN2ovN3U0R3AybVFOenhhS0g3L2Q5b2wzZUk2U1k1?=
 =?utf-8?B?RnljdDFWeFlkeDZLdFZqeU9EU1lweFk5azVqTHZIUm5hZkllUWNlSHlGb3FX?=
 =?utf-8?B?ZU4waUJlTFZmRTdRVG9IQzBNL3I5RXk5VGwzT2l5MWgyVjRWSU5zWWVCZGx5?=
 =?utf-8?B?K2xpZEdtNjE1T0d6VkZWbzAramtsaGhJWDFsV244NmdLTHBRdlRZdkttMmRM?=
 =?utf-8?Q?w8qnXccqJqPtLdMcfDKvQRhwu2IwSim4irfqECVpS1OU0?=
X-MS-Exchange-AntiSpam-MessageData-1: MHRFx8SoaMWSfjlRADQX3w2llWO6EgQJsNo=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bdfafe63-3a02-4109-4ba9-08da22dacb72
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 14:33:53.8919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1+6yIxGJI8iTVJeeCbujkAkLyFjT06MNHfoFN3hi1GPxBft9zgQP3hyd0E4bygPJMzHehMGbAY1y4lW8fNT/yssWq7vR3wbjNcLfig1mdNrcAYi8+10QIbJ4ftF55ofn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2806

Hi Richard,

Thanks for helping me with this!

On 4/20/22 13:29, Richard Purdie wrote:
> Merge in the changes from master allowing conf.py to use information from
> poky.yaml. This allows the head version mapped to X.999 on the website to
> have the version information displayed clearly and correctly.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   documentation/conf.py   | 22 ++++++++++++++++++++--
>   documentation/poky.yaml |  2 ++
>   2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 4df8f55d1..df67a5cdf 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -15,9 +15,27 @@
>   import os
>   import sys
>   import datetime
> +try:
> +    import yaml
> +except ImportError:
> +    sys.stderr.write("The Yocto Project Sphinx documentation requires PyYAML.\
> +    \nPlease make sure to install pyyaml python package.\n")
> +    sys.exit(1)
>   
> -current_version = "3.1.15"
> -bitbake_version = "1.46"
> +# current_version = "dev"
> +# bitbake_version = "" # Leave empty for development branch
> +# Obtain versions from poky.yaml instead
> +with open("poky.yaml") as data:
> +    buff = data.read()
> +    subst_vars = yaml.safe_load(buff)
> +    if "DOCCONF_VERSION" not in subst_vars:
> +        sys.stderr.write("Please set DOCCONF_VERSION in poky.yaml")
> +        sys.exit(1)
> +    current_version = subst_vars["DOCCONF_VERSION"]
> +    if "BITBAKE_SERIES" not in subst_vars:
> +        sys.stderr.write("Please set BITBAKE_SERIES in poky.yaml")
> +        sys.exit(1)
> +    bitbake_version = subst_vars["BITBAKE_SERIES"]
>   
>   # String used in sidebar
>   version = 'Version: ' + current_version
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index e0f8166f7..edc23f8aa 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -5,6 +5,8 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
>   YOCTO_DOC_VERSION : "3.1.15"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
>   DISTRO_REL_TAG : "yocto-3.1.15"
> +DOCCONF_VERSION : "3.1.15"
> +BITBAKE_SERIES : "1.46"

I was wondering if this was not the opportunity to explicit that after 
this commit nothing needs to be updated by maintainers for version 
bumping except git tagging the docs git repo?

e.g. DOCCONF_VERSION : 
"autogenerated-from-set_versions.py-from-master-branch"
or something like that.
Or a comment at the top of the file explaining which variables are now 
auto-generated by set_versions.py?

Otherwise, I tested this on all branches listed in this patch series 
with the autobuilder script and it does what I'd expect them to :)

Thanks!
Quentin

