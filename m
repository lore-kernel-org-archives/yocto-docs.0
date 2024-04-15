Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BFAC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 08:07:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.101])
 by mx.groups.io with SMTP id smtpd.web11.16024.1713168419524448270
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 01:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=XhlhuBoY;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.101, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eL/qwJAIcXzq5Wbzb9O4Zc4zEsxAbpuzOrJA3NSAyoHRpC6JMqj6316REfK5OP6MCoi9O6RM7zV1sJwdqqWwzet22TK73O4h8WOKUWCNxt0pbaWApMGbCsrE7re/ww0HLR7B5ZFJPNBWZNqGlpsUkC84Cxkf8xYKEOrS6bWzWqSBy4Q/tqnzwP3qQeAWGX+0fc/BJ1Mt3FN5tdkmkMfBVMyexvD0KiJOQQX4d7FsmufiqlmU+oaKBeDcae1mNPg9gwFL0ed4b+kk5TsoE85DrA2danqon4bQR8+ZygtxIyoFzLXW0WoESAPe7AzTBX6dqY2D0LCGdgyEumgpU2s3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LKv8AcmKQZFhr4oofg99SutoYGVyl+iiPLBfGW1aDc=;
 b=JIUf2wkC0bYUUVcSCx7KINDB95UwIihow5YkwdZQRJNXhDkBlcnNf/nkW7Lt3+fozlkpAVjIVsOH9y1AO1ft7kqoFc1cUl2r6dnX4jv3QacjeYx5ZQMA9/4oIFUUPWEpkyYh6EVFft3qKw87fOXHZGLNediBSVrNiKjv01U6IHjI3KAKRrPo/gJvOJ44Hd4ld+lqezKWXbKuiLe4Ja+om2mtNFAqQrI++XWHMfdH4yi3epBTznI8BdYn+B+dMzaRBGLqURKwHGqZ1RxfQPxnudS1JQZ8B6m5ILcblfVxlmuLybUvMBgNCq1kf1R0hA5xjNEVxRg06AKX54CrHyWSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LKv8AcmKQZFhr4oofg99SutoYGVyl+iiPLBfGW1aDc=;
 b=XhlhuBoYTcd1ip6aI8x3qZLYc6AP/X4O9EJaJ1kNcK3S2NbaVxWEpFOVJfeNmrEdPUqcI5qzezZ6iSyA3OLROEIga4CKiHfC0K/XNzQVkpNvSZuBxOhvteAOuDImCoPil4boIvfYn9+5yuYNziBcP6bulwwhJaIh2gH72aIx1+6dYUTtKp0MtUf2Zo0REnWVfKWAtUiGku3nHywXyOPiw75Vp9woywJATCR3m7Lf390eNsNHqozu9zX8f23jsr3Ub6rsIIuDX424dbfibUUwaO7+VQnT2nTzcX5Mtl6KdTLvGvBUDRfPYbpu8taQWZmlmA8tSOud1ZHFX7hlrXrC5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 08:06:54 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::bdc7:4b2c:e74e:1504%7]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 08:06:53 +0000
Message-ID: <bd77ae10-99da-44cc-9086-3eb4deb80218@theobroma-systems.com>
Date: Mon, 15 Apr 2024 10:06:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 9/9] release-notes: additional features and one
 known issue for 5.0
To: bluelightning@bluelightning.org, docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <91fad937a3567c0c66d0c28e4ed2fb3227450a5e.1713127068.git.bluelightning@bluelightning.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <91fad937a3567c0c66d0c28e4ed2fb3227450a5e.1713127068.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 559d3acf-634d-48a7-dc07-08dc5d230321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pfh8GrIK4Hri5oeVRZ+9tBgcGX3T+vp700WlhDPA4O0fXnS1zy8xgNUBABe/OU6SsTfkg6MMHsiZ4FwtkYS1uyXbKy8R+pa7CG2cDRq4pbXEtQ8K79wZ6DtkglfWpIt+p+eHhLPXk9wFmG1Y+uyUiRMq67yhS+GLxRVxMIKuJ7AIEh9PszeK0hXlTYQBEgzDzoSu/xW7y+hXsLtKBCg4oeV1VNWTArGdVuMrC5Knmi1jPGU7cAALJK8l9Jmhe4TGW+rVTNViDMbKj8AWOBkd+JcazCwiP6sOCsNeykgKffROCzhlyL7khdXynW/l6TuBJyYModw8dVt+x+xZ+w8UNVqR3tvKBI8GVAfUp8YmN4Fcyzuae9M9fQBzKBE5elGDyDc59flnbMJdvQh9/b/u+b99vyx9F2qYSfR+poeohdiaQkQqmsqui0NpCdgurvA/y97M1yPqDruI1dXLiX1SDhwU3At1T4mcoxr5zgNM0ZXZmxVVxsGS8GGuGlKio4kvuRHQb277pUt2QMap6ehHsV1ox8jJEmpcsTRaGPl3I7FMMu/g3nkglliZmwkMjm4miT9Hsy4jB7/0JPuukXUcgVTBtQn3dhkQperDOoGXCZ7Y1Kl8kwvBPe4GdVr+hlKnB6CLU3iK2yniPa6lS6fMJQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEY0bzVCL2J6L2VKRVBkQ3lPOTQ3ZWdpOHYwRENWSmJIZjdqNXJnS1U3WU05?=
 =?utf-8?B?aU95K2tta3N0ZitnWHljUjJ2VXc1K3ppYzN5Z2ExTWdKdE83VHpIbFNaSk1V?=
 =?utf-8?B?UmdiclBHcjhkOU1uT2haZHU0ZTJSZ0U2TDZRV0hXc0laSWovc3ZUNlMxZzQ4?=
 =?utf-8?B?OWM4bndMNmZuYWFGSHd5aWR4U3BSS1BoZzliV1o5NFJUdUpQdkRmVXU5bm8z?=
 =?utf-8?B?NGxCSzU1WDk5ams1M1E2YjJYOW01K1Z5YW4wUVNIWGZqenBiWVk0eDc4cGN3?=
 =?utf-8?B?TGZiemR3OHF0eU8xeDUzc3dWZEQySC9MK2tvNWpnMjhNSmVXOFJLWTd6Q1hK?=
 =?utf-8?B?T0FsVGN0Ry9pVFhIOWtJMkpaWjBtcFRZZTZMZG4rRzlmOW9tRWFxc3FuSnB5?=
 =?utf-8?B?YUFld2lSY21SbVlIeTN1bjZ1SVFFTU9Qa0EyVHR5OStRS3F5bXRBS2xadWxY?=
 =?utf-8?B?WEJtM3V2S3FyTU1YazJ5a3hjS2FYZzBOZUFGU3Y5SHVWMmhzQllCbFN2ZjVP?=
 =?utf-8?B?NGxiRktReXVieFk5RU5yRkZHWjZHdnl0eTVqTnM3YmxKaVJGSUIxNnJxWHo5?=
 =?utf-8?B?dzB4Q21LMFVDMlY2YWpEU2RMZ0duektDU1NkZTI2Z2w5QXJCdkp3Z0lEbGRh?=
 =?utf-8?B?cUhwZ2oraE1SSmM2K1ZaZXVWVkQzVGJucFg4ajVDSm1DN1BrbXF4aVN6N2JU?=
 =?utf-8?B?dXdHaHNlOHVBNTFobEJ4eHpHaTd4R0QyamRUalV6SEQxTnhjWDhMRGswRzhn?=
 =?utf-8?B?eExRQmxOTzNlZU9LMEs3ME1IYUNkYWdOclA0a0k0aGNrWjBMZzFpaFRCd2VX?=
 =?utf-8?B?S0h5dUF3eFBEZlU1aHZ2L0xON0tsbTNTYnpJclM0RDlSb3VIc1ZFeE1GS0ZU?=
 =?utf-8?B?UEpFaXRIL3M5cEJ0Uy9VUGZiSEtjemRJMlozaUcyODhYMnpFTDltMDBabEV6?=
 =?utf-8?B?N3BISjNNWGV0UFhGdzRObzgzYU5yMEJzclRzaTJqUW9jWDgrQlpKTU9nZXpn?=
 =?utf-8?B?VGNUZk91eEYrTWRkWEs2S2FDKzVlU0lIZWtMaVVaTExvRUc5TUIyM0Z2ZkVj?=
 =?utf-8?B?U2gxTkJiZURPRlZpcGFaZzBkeDBpNkw2UC9CUTUyNE1uM3Z6anlwOGlFMzk0?=
 =?utf-8?B?VkltR0s5ZFFtNm5zbWgwVnQwN0U1aW0zeXZWRjlVTFR0dFRnWjR6anN6YmxC?=
 =?utf-8?B?d0hkUVNDcHdOaXg2cWxKWllQNHFxRm02U2UreEwxamFsTi9FUlk4NlBaTDZo?=
 =?utf-8?B?eXNxVXAzNGNIOXJKVzdpQmNzN1FSUjBzSHhpbVhwVC9JY0swQ3lBTzh4bnJy?=
 =?utf-8?B?QmxMYTk5QnJOaE0vdjAxa3V6U3RSbGsweEQvdGhDLzJrc2NNVkVuZStPRURk?=
 =?utf-8?B?YlRZVFdkWnVUT3RuMUFaYVF4emxWdEp2RkNJTktFTXFHWjVNMVMzSVVuUGtY?=
 =?utf-8?B?UjY1bmxxYUlYMXVSaG9QZTY5NGNMU3FScVdLYmNDUkdOUkZnQ3E1UFdCN0J3?=
 =?utf-8?B?d1RTZTBVUER4Z0ZrSjlsTDYrR0g5Wnk3bVVjbmdETGlENW9zQkJvRGNhNEpN?=
 =?utf-8?B?ZElSQU16eEVmL1ExTHltU3c1b3pFbG9jMGhjQjlvL2VjMzFEbnhwQWljL1Jh?=
 =?utf-8?B?c3A3SkY1SGJFUVV5R3M4NGkza1FwQWs3THZQR3JCQTlYTUt1RmM5bWdyb09K?=
 =?utf-8?B?QjdQZzRKMGl6OHJRVHl0bHpPeGFYcFV1THRiaktUM21Wbys3TTFxampBMzAv?=
 =?utf-8?B?OHFmMDY4NFpzZ1BuWWZvSTNUQi80d3lnWFJJK2ttS3lkbVN0SGYvVnFONlQx?=
 =?utf-8?B?bmx4WGVVV1ZHNmV3UXFpQXlsZSt0ak9melQvSFZTOUNKYm1QdXRQOGpFUHJR?=
 =?utf-8?B?dG5CcnMvWlJvamJzUEhNOEErUmN0SlFCK25FYVNWRnRGRzRLZE43cjYwMXc0?=
 =?utf-8?B?Z0NUUzdVbWZmak9SR3duUGxsWHNSdG5uWlNUMjNVVjVjNHhhL1RxUTB3Zk02?=
 =?utf-8?B?TlhvUXdzbU10bWVRd3ZHVzJpdU95Sld0eXlJZGZuZGhoUjBzaGI3anI2T3BL?=
 =?utf-8?B?UUl6WEhMQ0tCeXJGV05XUUovVWpUMW1weEdsckxJMnV6SFBqQU5ncTdGbXoy?=
 =?utf-8?B?MGV5OWM1U2FycVVXMk1jdHVqcXhRaUxsY0JPV25rak5YcC9sTlZyZVRpQzly?=
 =?utf-8?Q?JU8UMuUEPJ6Wqlu6rts1NyU=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559d3acf-634d-48a7-dc07-08dc5d230321
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 08:06:53.9079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2ais7a15D9vcEPACQs4djW3oLYPx22Ib80zzu2EBtIhvS1xlUp86HS2FJpagwmzJ329b8zb/P7BKy7uAOC3D05+Ka0WZxfCpNQYosoXuFq66Ng5RKsFoO3n82Jpu1FU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 08:07:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5145

Hi Paul,

On 4/14/24 22:43, Paul Eggleton via lists.yoctoproject.org wrote:
> Add additional features and tweak some existing entries.
> 
> Also add one known issue for gpgme.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   .../migration-guides/release-notes-5.0.rst    | 71 +++++++++++++++++--
>   1 file changed, 66 insertions(+), 5 deletions(-)
> 
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index 21de79a638..121c2afaff 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -23,6 +23,8 @@ New Features / Enhancements in 5.0
>      -  :term:`EFI_UKI_PATH`, :term:`EFI_UKI_DIR`: define the location of UKI
>         image in the EFI System partition.
>   
> +   -  :term:`TARGET_DBGSRC_DIR`: specifies the target path to debug source files
> +
>   -  Architecture-specific enhancements:
>   
>      -  ``genericarm64``: a new :term:`MACHINE` to represent a 64-bit General Arm
> @@ -33,6 +35,8 @@ New Features / Enhancements in 5.0
>      -  ``arch-armv9``: remove CRC and SVE tunes, since FEAT_CRC32 is now mandatory
>         and SVE/SVE2 are enabled by default in GCC's ``-march=armv9-a``.
>   
> +   -  ``arm/armv*``: add all of the additional Arm tunes in GCC 13.2.0
> +
>   -  Kernel-related enhancements:
>   
>      -  The default kernel is the current LTS (6.6).
> @@ -145,6 +149,10 @@ New Features / Enhancements in 5.0
>      -  ``nativesdk``: prevent :term:`MACHINE_FEATURES` and :term:`DISTRO_FEATURES`
>         from being backfilled.
>   
> +   -  Support for ``riscv64`` as an SDK host architecture
> +
> +   -  Extend recipes to ``nativesdk``: ``acpica``, ``libpcap``, ``python3-setuptools-rust``
> +
>   -  Testing:
>   
>      -  Add an optional ``unimplemented-ptest`` QA warning to detect upstream
> @@ -155,15 +163,29 @@ New Features / Enhancements in 5.0
>   
>      -  ``oeqa``, ``oe-selftest``: add test cases for Maturin (SDK and runtime).
>   
> --  Utility script changes:
> +   -  Enable ptests for ``python3-attrs``, ``python3-pyyaml``, ``xz``
>   
> -   -  New ``recipetool/create_go.py`` script added to support Go recipe creation
> +-  Utility script changes:
>   
>      -  ``oe-init-build-env`` can generate a initial configuration (``.vscode``)
>         for VSCode and its "Yocto Project BitBake" extension.
>   
> +   -  The ``sstate-cache-management`` script has been rewritten in python for better performance and maintainability
> +
> +   -  ``bitbake-layers``: added an option to update the reference of repositories in layer setup
> +
>   -  BitBake improvements:
>   
> +   -  New ``inherit_defer`` statement which works as ``inherit`` does, except that

I think there's a way to link to the bitbake doc for inherit directive.

Maybe something like:

"""
:ref:`inherit 
<bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\`\` 
directive>`
"""

would work? Just a suggestion though.

> +      it is only evaluated at the end of parsing - recommended where a conditional
> +      expression is used, e.g.
> +

I think we're missing a double colon here to make this a code snippet?

"""
expression is used, e.g.::
"""

?

Thanks!
Quentin

