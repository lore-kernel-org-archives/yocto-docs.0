Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD79C4167B
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 09:57:38 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.49])
 by mx.groups.io with SMTP id smtpd.web10.9606.1670579856702079756
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 01:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=Jf/ppSML;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.49, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eM++ryhQHkaKGMQdjsouYf1BTlrpzEOCFQP5ayzFwvmTNv4x4W4xY9Lkt7BPU8AJiEKQW47VP6tZWRz1WFqG8U8Ka3UKUz86gobDmJmqR7l8g/Q8K70dPOBWWYL5JGAZXB1MwmtgY1wbdAa/Fv2/HknvYH+KwpONW19aN4AM/2xSdBqCnT5DZRdWenA1aMxLR9ZqtEWIlWTl+6NX27PsAATjBMqTTw6MWbVg0P4xjEOoKqCaAUEfkNXuKB89Y7J4Cq645h5d1PyNx6cYqz8RXlpmAtugNNTYodzpK+ZdVRtM3EUe2yY616OSCSMlpfP4DNdMneDNbEe3uAVCtykelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bD+krrUaym96AE8JdYzmULGop1kVCON82uviwSOUhyo=;
 b=j1W76GcuI5+ckElkxf2AiuWD1aWv7lRgVYF55V04Etz228QE3WBTAJch37Bxsn2L3c8MBeky/+8PLNavCE+FTNWpI75pF4uzxKBQ4tocInnb1nKbP/jvSjnVC4xZAjKB81JWt8ltyy4CmCTECWCfYIaRMV2ni4jtIJJqsv3hg1G5hJJEY4ZGZWj0RAAGuiPMgia61Jt6oiZBGnOTnOxgEZ4DT0LZ3TdTPmUEYNMKwzowL+Jk43mCUc2m+SfZrV3T/Hc6VXPAWPR3EqT3un6cprSqhB/RFnKB9Tu6CtqsKOjYLCUPBbi8MMW2qsBEK05NJPlahz3FsGNs0Ec+4w7CxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bD+krrUaym96AE8JdYzmULGop1kVCON82uviwSOUhyo=;
 b=Jf/ppSMLyu34KiUmBK6LlB5i4JLUyvG6uAJ6gf/RzZ7X2VJq4gWtcqozqQPmJ2jPRxNiouNxLVuzzrA3+VJNDQCI5UL5Rw10cnU8jyZHvLUV3gQMSt450y1SsR5CelJBniEQxMTRhOEyWDNHXUZp/2ukWhYA0e24OGCiHXDGZ8VJQawXbA2YgUEzS7G5aciafhkFTQNWAK8dDkCrFPdB9ZY6n6FnBvJ+Af10VniBGMi+dU0WdGdNxi2iPKudePrHorWbznMcbKHn/YNS4PJyx12SGlYK67ZMKVZMpuFaSU40Ehhy1rmjbc/eTW17c/uvs8oDYJiVgEKAw+N9UqQNiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DU2PR04MB8870.eurprd04.prod.outlook.com (2603:10a6:10:2e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 9 Dec
 2022 09:57:33 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 09:57:33 +0000
Message-ID: <952ece4b-be2a-dace-6d1b-510c8e863c4c@theobroma-systems.com>
Date: Fri, 9 Dec 2022 10:57:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [docs] [PATCH] manuals: fix double colons
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221208094158.532375-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221208094158.532375-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0102.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::43) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DU2PR04MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9b77e6-1277-42dc-f489-08dad9cbcaaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6CvD0ErXqSSJbxe0ZpH40xT+E7AlDawtPzF1TA85mgvIz+AX2jImqu7QRKJrRHdjUJvFjXZfrejMxEqPEFTVE9GrLpqawovD4grSRXn6xBJwpPH1IqnzyTDC/r5jyvYcDrWXKpjCRRvHKlDkoSjsUqwdQkTpryls7ZNYwiSGyl/6RNvJxb++gI3BmIQWrQAix5EAmzlqvD1QdTMEsYg8F9Ee1wnSMcoD8kBE+KowNhx4Syp9dgu5cu+GvxszLkUM27D+pS+iUlqrlJXtfCRj40ly/m7LeA427mxf2ZKYmkY8Q+QQFubziRwg4RjYdUT5IUvLrac6uzp2DGOl/kYJxCkzFUOQMPx7SN618quZVnKXu8PVrz6h9I2BgN2IVnDlUShU/eJGCN3lV781Zio9Pjd3milXghn+yyemEGmf2EShMMQNZ/EZS7qhiF0P58N0SZLqUZh9N6rEi6r1XqCoLHQHCBgyoEy+OzJumTX+lwaL1P3JV1sSfKnhKhFi3g5ZPVH/iYwyXUuLSRR61G5srZ7Y6PcsRQ3rEwIzNI95OX7oftRLANTLf/BVU2Xo64EmGwaAl2TPM2Ay89l5Oqfyr7NqS9pg79VOq8aGLScWhVFknTJwysyVCdFg9rDwdd+LZnG+DeEYSXhEjyzH584VHTvCMdhE0vFN1EcvvFLprdRlOi9ztaDOr9LGqtkrn1hMffPjTSDVjloA3WSZASVUHvuQvJJGS6dfRaUNBdnwV31jMYwpGmj/DlIEv1n3YtpS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(346002)(39850400004)(451199015)(30864003)(5660300002)(36756003)(41300700001)(44832011)(2906002)(6506007)(83380400001)(38100700002)(2616005)(53546011)(6512007)(478600001)(86362001)(31696002)(26005)(8936002)(6486002)(186003)(316002)(66476007)(66556008)(66946007)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1lsY0pDUXE5S0dZRkt6cVZXTnVOZWFqdUM0a2RxUFl0ck1odGVjNkhaaHJ2?=
 =?utf-8?B?TWFNVHN1WU45UkdKcUpGS2JwUkdLY2FzSzEyRThrbDV3NkJvVUtnLzg0WnZC?=
 =?utf-8?B?OWpubXExNEhoYTFuZFRrVldTNGs1QXBkQVdNNkpQaDlrRHBZRVBJVi9oczUx?=
 =?utf-8?B?OUVvZVN1NmlhL3YwNS9Uay9QbXZQcGxjMEdiLzEyTFRVclhGZmIyNlJtUkN0?=
 =?utf-8?B?OTNCZzRNakwrbVZocW5MS3BaSnU3NFZEZHpSdE1qRmxPS1QwTVQwVjZkTFFq?=
 =?utf-8?B?OTIxT3Z4dEsxbUpxSlhkWGIxa1h4c0xKaFBGa3JJNnBRRVlEdFBmd0UrYlFl?=
 =?utf-8?B?MFA2WW9rWG9aS0F1cloxM3FHMFVWTTZhS090cmpURkNHV1psa29tMVlrQTZk?=
 =?utf-8?B?c1ZHY1NCWE9pZmpzTmoyVmREUEtDVENCbksraVFXd2VyenRGREZRQ2xKKzRp?=
 =?utf-8?B?eUJpMEVlYnpDSXNwazM3eXZOQ2NzRnk3TG5FMnBWMUYyZ2lsV2hQRE5iaC9J?=
 =?utf-8?B?VVh1bWlFb3RjRkdCUGJqRHZoN1FhalBoVmxBUC9BelNNd2NDNkZqNGwwTVBN?=
 =?utf-8?B?NlNjWTQ5b0hBN1VUNkpsNElRMXVhRUlETi9SQktVVEJFTmxRaktCNXpkNlVL?=
 =?utf-8?B?YmhidGtXcXRMbzhsOVduQ1NEQ1c0K29nY3hQdUo0REJxQUsrZVNoZlF1U3Bl?=
 =?utf-8?B?RFh6dm5BR0RJNnNPd2tjSTIxMnNObTBYV2lrR1VnMTRGd2VrOXlpSUVMK3k2?=
 =?utf-8?B?SXIzcU0wLzVjK1pUMkxkcnlkMzBIQ1JwOXpPNHRLc0hHVzJmZlpMcnR3SWgv?=
 =?utf-8?B?ZDgxMHFKTnJsbDg4UzZXQXcya3J3QVhtcEI4eEQ0ckhYTFgyTytBdkpPRXhC?=
 =?utf-8?B?K2w1MFJXMjA1YWY5dmZ3aDBjeE9QYmVoT1ZnTzBJTFMyYmQ0amx5OUlXNGhy?=
 =?utf-8?B?TWE1Qm9qdllsR2NVcWVBUHZXVk5mNWo1WGl1SVQxamFsNThDMTd5emRMQkZL?=
 =?utf-8?B?WXk0aFBqellITWhlMG1ZY21MQjFaRUp5blZwNjlsL3ZOZWdRcVV5ZTJBSWVr?=
 =?utf-8?B?VE9hdzZvbm83clJQZnhyOHZ6eVlaZFNTL1F4RjhySDVFeU9LY2dGaUZSQVRz?=
 =?utf-8?B?TENxSFJFNXppemowZTVOS0o2Um05ZTFMV1B6aFVnQ0lmZFV1dkQwb05EL0pD?=
 =?utf-8?B?bEE2K3B3WFVROG14WC83ckZEVUsrY3UrNFZQbGpoRE9ieDFrYzNJNXlaQzJp?=
 =?utf-8?B?SnBzbWl2ZHRHZUpveHNKYkEvV0FpZHZGbTJZZWJ6VnNGMmxvNkt6ck45V2tM?=
 =?utf-8?B?aEI5TER3TTRZek96YVliSHRCMGdpZkRZbW11bEZ1MFMxQ3k1cDNiN1dlM3lJ?=
 =?utf-8?B?UXNHWFlXb2xKa1RSVG5TRjNvZTdJTTdRdVZSSDNOOHg3allYZWVFWGhaZzNR?=
 =?utf-8?B?NCsyQy80QVBWMWhldDI5YlVrVmdHUjN5cHZncmZ4Nnc0aEI5TDYyVXJ5UlhR?=
 =?utf-8?B?bC9NRVlWSzFCYVp4eXRCVUVvV3FkZzZUektLc1ZEanpqMXJieFJPRis2MmJ4?=
 =?utf-8?B?VGl3bFhOQ3JiQUl1UUxIRGdNQ0hFOVNwSTJacEgwM0Rxbk5MbTdLc1QxQ3NM?=
 =?utf-8?B?aWZCdUF1YVcxb3lqb0JrZ0dSUkI2VC9ZMlpkc0ppSDQxMkJOWWNZTTNjdlRr?=
 =?utf-8?B?Mm9WVVhUTDEwWVkzRVY5YnpWMjZreFJvejRrTFNWT214UHU0YmN1UmRuYW80?=
 =?utf-8?B?Tms4dWZZdHFKOE1GSVR2VWpwbjQzRFFlVHRsVmFJbDBZemdjeVlKTUdTQStK?=
 =?utf-8?B?eUdKdUFZRTAxZ0piQjAzTHBjb3ZRL1JTL05qSlgzYnhpbkJFaGp4aVFlT3hK?=
 =?utf-8?B?WDMyZks3TlhzT1dhc1M0VDFaVFU3NWh6aTNNditVdTBXYTl0WHNDWnd3VDlS?=
 =?utf-8?B?dFNUYXpPMkVqbTNudmppKzk3aWROWjJldWhBM093VmpLZi84UitLQkgrRGV4?=
 =?utf-8?B?ZTMxT0tzU1htRCtvUHROSlVxald6TUJibXVtakIxTXZITUVqN0swS3ZpUkV0?=
 =?utf-8?B?S0gzcHRnTVJvdTNwSlpwbXhHK0ZySTE2TGVsMHhSVHpwSGI3cnNsQmRIcnZD?=
 =?utf-8?B?dGNic2lDNDlCVmZCRkIvVWlDN3pURWRTY3AvNkxLYzFYSFpibHE2OUFRK1FB?=
 =?utf-8?Q?xr84Au9u1htFHPDZ6TKCrPo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9b77e6-1277-42dc-f489-08dad9cbcaaf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 09:57:32.9869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9L3l5cQaNud5jfgqmMRAMg7YLNC2cMI8OUXRQ5Z2dhsa9fb2aL5DpKFNCHOdUS68RQehrQE4C6Pm4kEu23q/6ec4pqhE1S16bPwzuN5PWRMsHq9twcrOSZsZbP9zCOZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8870
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 09:57:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3531

Hi Michael,

On 12/8/22 10:41, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Fixing double colons appearing alone on a line, while
> they could be put at the end of the previous line.
> 
> Sometimes placing a note after the quoted text
> to avoid such a situation. It's more natural too
> not to have a note between the introduction text
> and the quoted section.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> ---
> 
> Note: instances to replace detected by the following command:
> git grep "^\s*\:\:\s*$"
> ---
>   documentation/dev-manual/debugging.rst        |  6 +--
>   .../dev-manual/error-reporting-tool.rst       |  3 +-
>   documentation/dev-manual/licenses.rst         |  3 +-
>   documentation/dev-manual/new-recipe.rst       | 16 +++----
>   documentation/dev-manual/qemu.rst             | 20 +++------
>   documentation/dev-manual/quilt.rst            |  3 +-
>   documentation/dev-manual/runtime-testing.rst  |  3 +-
>   .../dev-manual/upgrading-recipes.rst          | 14 +++---
>   documentation/dev-manual/wic.rst              |  6 +--
>   documentation/kernel-dev/advanced.rst         | 15 +++----
>   documentation/kernel-dev/common.rst           | 43 ++++++++-----------
>   .../migration-guides/migration-2.2.rst        | 12 +++---
>   .../ref-manual/devtool-reference.rst          |  7 +--
>   documentation/ref-manual/variables.rst        | 36 ++++++----------
>   documentation/sdk-manual/appendix-obtain.rst  |  3 +-
>   documentation/sdk-manual/extensible.rst       | 27 +++++-------
>   documentation/sdk-manual/using.rst            | 21 ++++-----
>   documentation/sdk-manual/working-projects.rst | 15 +++----
>   18 files changed, 94 insertions(+), 159 deletions(-)
> 
> diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
> index ef296de7ac..f433e8e6a9 100644
> --- a/documentation/dev-manual/debugging.rst
> +++ b/documentation/dev-manual/debugging.rst
> @@ -327,8 +327,7 @@ BitBake has determined by doing the following:
>      In the output of the above command, you will find a line like the
>      following, which lists all the (inferred) variable dependencies for
>      the task. This list also includes indirect dependencies from
> -   variables depending on other variables, recursively.
> -   ::
> +   variables depending on other variables, recursively::
>   
>         Task dependencies: ['PV', 'SRCREV', 'SRC_URI', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]', 'base_do_fetch']
>   
> @@ -641,8 +640,7 @@ The syntax you use for recipes written in Bash is similar to that of
>   recipes written in Python described in the previous section.
>   
>   Following is an example written in Bash. The code logs the progress of
> -the ``do_my_function`` function.
> -::
> +the ``do_my_function`` function::
>   
>      do_my_function() {
>          bbdebug 2 "Running do_my_function"
> diff --git a/documentation/dev-manual/error-reporting-tool.rst b/documentation/dev-manual/error-reporting-tool.rst
> index a2636da37a..6854f1046a 100644
> --- a/documentation/dev-manual/error-reporting-tool.rst
> +++ b/documentation/dev-manual/error-reporting-tool.rst
> @@ -71,8 +71,7 @@ Disabling the Tool
>   
>   To disable the error reporting feature, simply remove or comment out the
>   following statement from the end of your ``local.conf`` file in your
> -:term:`Build Directory`.
> -::
> +:term:`Build Directory`::
>   
>      INHERIT += "report-error"
>   
> diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
> index 0db193f7e4..0f8d759519 100644
> --- a/documentation/dev-manual/licenses.rst
> +++ b/documentation/dev-manual/licenses.rst
> @@ -154,8 +154,7 @@ or characters. A partial string will match any license that contains the
>   given string as the first portion of its license. For example, the
>   following value will also match both of the packages
>   previously mentioned as well as any other packages that have licenses
> -starting with "commercial" or "license".
> -::
> +starting with "commercial" or "license"::
>   
>      LICENSE_FLAGS_ACCEPTED = "commercial license"
>   
> diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
> index 2e9c2089f7..3adebf2746 100644
> --- a/documentation/dev-manual/new-recipe.rst
> +++ b/documentation/dev-manual/new-recipe.rst
> @@ -109,8 +109,7 @@ Following are some syntax examples:
>   
>    - Use this syntax to generate a recipe using code that
>      you extract from source. The extracted code is placed in its own layer
> -   defined by :term:`EXTERNALSRC`.
> -   ::
> +   defined by :term:`EXTERNALSRC`::
>   
>         recipetool create -o OUTFILE -x EXTERNALSRC source
>   
> @@ -147,8 +146,7 @@ get started. Here are some points on both methods:
>   -  *Use and modify the following skeleton recipe:* If for some reason
>      you do not want to use ``recipetool`` and you cannot find an existing
>      recipe that is close to meeting your needs, you can use the following
> -   structure to provide the fundamental areas of a new recipe.
> -   ::
> +   structure to provide the fundamental areas of a new recipe::
>   
>         DESCRIPTION = ""
>         HOMEPAGE = ""
> @@ -347,9 +345,7 @@ paste them into your recipe and then run the build again to continue.
>   This final example is a bit more complicated and is from the
>   ``meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb`` recipe. The
>   example's :term:`SRC_URI` statement identifies multiple files as the source
> -files for the recipe: a tarball, a patch file, a desktop file, and an
> -icon.
> -::
> +files for the recipe: a tarball, a patch file, a desktop file, and an icon::
>   
>      SRC_URI = "https://urldefense.com/v3/__http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-$*7BPV*7D.tar.bz2__;JSU!!OOPJP91ZZw!kWzuw1Mds_3xtnfnsBoSmiGFIUcu_JwG7w_hw0UbvTf_Nb8KSDw9pHKjPR4LWczgEdSPv6uDfZ7ZRrYPZ_Rt3IS30dkF-PoSVlDiUyQMZSBELbyk2EmW$  \
>                 file://xwc.patch \
> @@ -1196,8 +1192,7 @@ under ``files``) requires a recipe that has the file listed in the
>   :ref:`ref-tasks-compile` and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
>   directory containing the source code, which is set to
>   :term:`WORKDIR` in this case --- the
> -directory BitBake uses for the build.
> -::
> +directory BitBake uses for the build::
>   
>      SUMMARY = "Simple helloworld application"
>      SECTION = "examples"
> @@ -1233,8 +1228,7 @@ which contains the definitions of all the steps needed to build an
>   Autotool-based application. The result of the build is automatically
>   packaged. And, if the application uses NLS for localization, packages
>   with local information are generated (one package per language).
> -Following is one example: (``hello_2.3.bb``)
> -::
> +Following is one example: (``hello_2.3.bb``)::
>   
>      SUMMARY = "GNU Helloworld application"
>      SECTION = "examples"
> diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
> index 504fcbdd8d..084e67580d 100644
> --- a/documentation/dev-manual/qemu.rst
> +++ b/documentation/dev-manual/qemu.rst
> @@ -103,7 +103,9 @@ available. Follow these general steps to run QEMU:
>         automatically finds the ``bzImage-qemux86-64.bin`` image file and
>         the ``core-image-minimal-qemux86-64-20200218002850.rootfs.ext4``
>         (assuming the current build created a ``core-image-minimal``
> -      image).
> +      image)::
> +
> +        $ runqemu qemux86-64
>   
>         .. note::
>   
> @@ -111,14 +113,9 @@ available. Follow these general steps to run QEMU:
>            and uses the most recently built image according to the
>            timestamp.
>   
> -      ::
> -
> -        $ runqemu qemux86-64
> -
>      -  This example produces the exact same results as the previous
>         example. This command, however, specifically provides the image
> -      and root filesystem type.
> -      ::
> +      and root filesystem type::
>   
>            $ runqemu qemux86-64 core-image-minimal ext4
>   
> @@ -127,23 +124,20 @@ available. Follow these general steps to run QEMU:
>         variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be enabled,
>         an appropriate driver must be installed (see the ``audio`` option
>         in :ref:`dev-manual/qemu:\`\`runqemu\`\` command-line options`
> -      for more information).
> -      ::
> +      for more information)::
>   
>            $ runqemu qemux86-64 ramfs audio
>   
>      -  This example does not provide enough information for QEMU to
>         launch. While the command does provide a root filesystem type, it
> -      must also minimally provide a `MACHINE`, `KERNEL`, or `VM` option.
> -      ::
> +      must also minimally provide a `MACHINE`, `KERNEL`, or `VM` option::
>   
>            $ runqemu ext4
>   
>      -  This example specifies to boot a virtual machine image
>         (``.wic.vmdk`` file). From the ``.wic.vmdk``, ``runqemu``
>         determines the QEMU architecture (`MACHINE`) to be "qemux86-64" and
> -      the root filesystem type to be "vmdk".
> -      ::
> +      the root filesystem type to be "vmdk"::
>   
>            $ runqemu /home/scott-lenovo/vm/core-image-minimal-qemux86-64.wic.vmdk
>   
> diff --git a/documentation/dev-manual/quilt.rst b/documentation/dev-manual/quilt.rst
> index d1b605bcd5..1dd9ff02d4 100644
> --- a/documentation/dev-manual/quilt.rst
> +++ b/documentation/dev-manual/quilt.rst
> @@ -67,8 +67,7 @@ Follow these general steps:
>   
>   7. *Generate the Patch:* Once your changes work as expected, you need to
>      use Quilt to generate the final patch that contains all your
> -   modifications.
> -   ::
> +   modifications::
>   
>         $ quilt refresh
>   
> diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
> index 24f3dd1511..88b3ed541b 100644
> --- a/documentation/dev-manual/runtime-testing.rst
> +++ b/documentation/dev-manual/runtime-testing.rst
> @@ -578,8 +578,7 @@ data:
>   
>   Following is an example JSON file that handles test "foo" installing
>   package "bar" and test "foobar" installing packages "foo" and "bar".
> -Once the test is complete, the packages are removed from the DUT.
> -::
> +Once the test is complete, the packages are removed from the DUT::
>   
>        {
>            "foo": {
> diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
> index a0856f43da..c41e3e1a5d 100644
> --- a/documentation/dev-manual/upgrading-recipes.rst
> +++ b/documentation/dev-manual/upgrading-recipes.rst
> @@ -260,14 +260,7 @@ your build configuration (i.e. ``${BUILDDIR}/conf/bblayers.conf``)::
>   For this example, assume that the ``nano.bb`` recipe that
>   is upstream has a 2.9.3 version number. However, the version in the
>   local repository is 2.7.4. The following command from your build
> -directory automatically upgrades the recipe for you:
> -
> -.. note::
> -
> -   Using the ``-V`` option is not necessary. Omitting the version number causes
> -   ``devtool upgrade`` to upgrade the recipe to the most recent version.
> -
> -::
> +directory automatically upgrades the recipe for you::
>   
>      $ devtool upgrade nano -V 2.9.3
>      NOTE: Starting bitbake server...
> @@ -286,6 +279,11 @@ directory automatically upgrades the recipe for you:
>      NOTE: Upgraded source extracted to /home/scottrif/poky/build/workspace/sources/nano
>      NOTE: New recipe is /home/scottrif/poky/build/workspace/recipes/nano/nano_2.9.3.bb
>   
> +.. note::
> +
> +   Using the ``-V`` option is not necessary. Omitting the version number causes
> +   ``devtool upgrade`` to upgrade the recipe to the most recent version.
> +
>   Continuing with this example, you can use ``devtool build`` to build the
>   newly upgraded recipe::
>   
> diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
> index d2f7bd0130..7ed887b270 100644
> --- a/documentation/dev-manual/wic.rst
> +++ b/documentation/dev-manual/wic.rst
> @@ -539,8 +539,7 @@ will need to boot from ``sdb`` instead of ``sda``, which is what the
>   
>   The example begins by making a copy of the ``directdisk-gpt.wks`` file
>   in the ``scripts/lib/image/canned-wks`` directory and then by changing
> -the lines that specify the target disk from which to boot.
> -::
> +the lines that specify the target disk from which to boot::
>   
>      $ cp /home/stephano/yocto/poky/scripts/lib/wic/canned-wks/directdisk-gpt.wks \
>           /home/stephano/yocto/poky/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
> @@ -557,8 +556,7 @@ Once the lines are changed, the
>   example generates the ``directdisksdb-gpt`` image. The command points
>   the process at the ``core-image-minimal`` artifacts for the Next Unit of
>   Computing (nuc) :term:`MACHINE` the
> -``local.conf``.
> -::
> +``local.conf``::
>   
>      $ wic create directdisksdb-gpt -e core-image-minimal
>      INFO: Building wic-tools...
> diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
> index b16b3e0517..401f5a7a96 100644
> --- a/documentation/kernel-dev/advanced.rst
> +++ b/documentation/kernel-dev/advanced.rst
> @@ -566,15 +566,7 @@ Example
>   Many real-world examples are more complex. Like any other ``.scc`` file,
>   BSP descriptions can aggregate features. Consider the Minnow BSP
>   definition given the ``linux-yocto-4.4`` branch of the
> -``yocto-kernel-cache`` (i.e.
> -``yocto-kernel-cache/bsp/minnow/minnow.scc``):
> -
> -.. note::
> -
> -   Although the Minnow Board BSP is unused, the Metadata remains and is
> -   being used here just as an example.
> -
> -::
> +``yocto-kernel-cache`` (i.e.  ``yocto-kernel-cache/bsp/minnow/minnow.scc``)::
>   

Double space here.

The rest looks fine.

Cheers,
Quentin

