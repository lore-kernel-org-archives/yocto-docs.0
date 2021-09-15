Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web10.6323.1631706859320627030
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 04:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=BPPT2YRJ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.77, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVSUfi5NnJXLGP4P0I1yI8mSup3uhcP1OicvCwW31/IuuGHrp+pFOsdhoD6eX+G5fqszSCxHBbrcYvvu4ZstcpJEDsRMpX9A1FIHjRy4Onv5y7DbXih7aiaqCxjDeAMVGyv20EKVcvGa02BEtaQgWwaEFLuV8h0Hi5eyqHDvO5us134pnoTCVAYcqdLDqce+yy8o6a3zau/gMfqcL5AtnUtImBA7vn+Hz6byPMqgtgg5boJatBKkQsN4zefUmIidmORsuXZ4lOISmnv9OxpEHT8VxgCWAsK1kvOqnN8cc4OJLv5cQvr0OPjP9nEYxYpWaNe8Asfuwse+t6Dy5Avlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pCeqTEuF0j7WXoafofNtZhRXntP3uIoWVmWaBnq7fTo=;
 b=Kh+s3CgzRqwf5NuDzIAvGyWB+nHURU74Prn1KQRmiBZ34hwcp5N6PmHayCXYXjVMZFIKpEsJ11oCY0EqPL9vIh8zTAOL3c9Ls4xVMd6itHPCJSH6Pv6sKamK/EzNKLcxhmOXClkRwOFu2Gfp2C0+WtuIeo3048KGgwq2N1M1f+z3y+vl3238MDKep4kaWAQKERWpY1VkLs+BWDGnJwFpavPslbz0EsopihWa9xPu0/mBt3Jeqfl8ohNXBoM6NmvlJXzB37hnhWOvD5ta8O3tlk3gaIXswubKAEeKI+N1RZy1s/VD4uinp+29q4O70L1vBSdKT8njLKEeRavNzrJoYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCeqTEuF0j7WXoafofNtZhRXntP3uIoWVmWaBnq7fTo=;
 b=BPPT2YRJyApZf6j1NH0uSpenRPkXH0zONxCvYlCqSc2vqKe4jNhRXm2r7MqzBvq1JkyYERyaTeVccF9kOPSIQuRB558aJgH/WAa+WQjRBJVpOvg+EBmK8Fd3cd28o6kobCR4malN57Ox8/dUWaeVCuy5DKJTlUHi5vxboRhu9EE=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB7489.eurprd04.prod.outlook.com
 (2603:10a6:20b:281::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.19; Wed, 15 Sep
 2021 11:54:16 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 11:54:16 +0000
Date: Wed, 15 Sep 2021 13:54:14 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/4] ref-manual: improve documentation for RECIPE_NO_UPDATE_REASON
Message-ID: <20210915115414.foevwwwmhcivc2ra@fedora>
References: <20210915101219.2198566-1-michael.opdenacker@bootlin.com>
 <20210915101219.2198566-3-michael.opdenacker@bootlin.com>
In-Reply-To: <20210915101219.2198566-3-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM0PR02CA0153.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::20) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM0PR02CA0153.eurprd02.prod.outlook.com (2603:10a6:20b:28d::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 11:54:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97af8234-4339-4753-fc70-08d9783f8b30
X-MS-TrafficTypeDiagnostic: AM9PR04MB7489:
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB7489F01347C77E9D1C48A4B4C2DB9@AM9PR04MB7489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nkjYgjtfLaDmnDrwjNwrVhH6mptap17ssUVxSkOzZ+UogeR4ekrXMxpHRGEhYXpaziCgc9ob9FleCL4YhhMA3w86SAxJCL12Ua6xpdrWSkS0/8bbVIaaYWqyFmG9ZsFWdzdLA0j0Yun945akR6YMGyPSFMy908fFo1tyC5YjL3BkxFuWJpEesZLQKxTiGokBGdg4mAyDo8UFynHkfWUvMUvAiXvaTNEb3TdV4YWvU5VyRm51PtvB10AouyUU2C8c5rhrAXAn6x+bwOOvCEb86MSbqiOPsNudCTuAN/i9CKX/OqxpwAwW1E4EEGAx6HyT5CpZsDQGd/BpGHyjyxk5miFLkoIiBNU9Ro7VvZHCAfPOUDKKDEWz+GEN6FL3jA0BP+aeEMgZ7y4bIYnIZsGPx0sHvVpAfqTysS1Ulqgq9a5jZyR4pSoFCzQe0fswyyirpk7+1bN+TTm0lfUYS6SgbUu8gZ7WuQ7SefJvdhd3gt4zzLWlf0tq2rQHZZZOiSNLUW8UzC7VIy0cG3zc12DSYI8k6kfdQPZ4+J5i6EoocNA3uIZqP+al8KiNGI8bW3gbiwCEcWts4DRBKNKyx5SUBQF1u7aw00RzAtTEuQwM4kBoHxgLnWFxNe03apyGg44zShQ7CAQE3dX/imca+EIigWASDWUrLS4LBrMh6FnxGZzK/S6vQGY9Yz0HpnDk6Ntp077HVtkoRhh4XhvTtc4T6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39850400004)(396003)(346002)(136003)(38100700002)(44832011)(26005)(38350700002)(5660300002)(9686003)(9576002)(316002)(4326008)(2906002)(8676002)(86362001)(6916009)(478600001)(1076003)(186003)(8936002)(83380400001)(52116002)(6496006)(956004)(66946007)(55016002)(66556008)(66476007)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z0mG7bKZmae9z6pi4yP7EjiWiB4ifJs1oBXccD5WYlE+FZopcQvz/dxUeT++?=
 =?us-ascii?Q?rd545C8m66uM1ScIwV0kpEuo8Rb2/v/FTYGhOCeQy8aessTN/4bfBJhQYnXD?=
 =?us-ascii?Q?2tyxQL1Pn74IxySdq8qRnCid9poQeHIr+6ZZqENiqc0EZXGlMdsy8STRF8oz?=
 =?us-ascii?Q?Nt4yJzV8RkzCoGNzUtT7VqXFHWfNQ3tW7Pzyt/VOw7Gxw/kHRHQpaEcG+FTN?=
 =?us-ascii?Q?IvOBnhluHb4dUFffQX4+blnQcB4OxuSkQcfFYZh/lBz3/vSZKJG+rse21Vdx?=
 =?us-ascii?Q?uQhwevEFgg2NEzm9KYfpAVVaYY/CagYrYst6DilktB483qncpveeqqhhwr0z?=
 =?us-ascii?Q?Ryr6Do34MHgF/PH315gZ/odMZ7cH3J2yhRoqkvGYm2MukG11kUAO1cCkrlIk?=
 =?us-ascii?Q?l2YBUsndOkWHEOngqHPhAwJnot1qBaveQPR2EG8dDX4cW6inCqtmk/st+1dC?=
 =?us-ascii?Q?2U8vWKxbFDukVxFjrpuAvYZtKpWH7jKHyd6oa5Aad5mky/MWPCW0cL6Bi97W?=
 =?us-ascii?Q?xKSrW+h0bAXZvWe/nznvWvjflc15EQHvf+Wf9exDPwpNUzWZrJQrqve/izDh?=
 =?us-ascii?Q?dpa9H53g2NnFIVg66hZRQFn1gWsxPd0UP9sIgHT596p1QRQfKW7xWf8at5RA?=
 =?us-ascii?Q?QEBF2jnb+tml/IDBsG0ZNtSRHu67g6s3YGh1bNB970/1SegurC7EfKTd3TJx?=
 =?us-ascii?Q?YE3NnTbsAygjkpXnw7gQGOhiYUI7d905bWy8LKRGsqnFPtsiNyYt385baVCL?=
 =?us-ascii?Q?KP9+gXQI67AeInzMTrCIvpE8sQMh25PRKwpkBLSZL5m8yWBP8GNqijsdwQNS?=
 =?us-ascii?Q?BYKdLrjFpXtsJpbdVOVvoN2YG7cRpaV/fRYk4xlC7brEcr1Su7Hpg96uWEfI?=
 =?us-ascii?Q?V5sHI1mBLBs/LZlHzU4urqb5VS0q7I9cU10wNx9wftpAD7wnYthtfpRBl8ua?=
 =?us-ascii?Q?DTNz2KMUQ85Ojv9FsCOsykfa63PfIvYsRGSxR1h4R30pMnD/n1pJu1S5Dut1?=
 =?us-ascii?Q?ogSQRMj80bjW8mOiNBsQzcDDLFc0P9JEe83H+H18lf/vau8OlF6WI4f/UleG?=
 =?us-ascii?Q?MozOj4jSnTnzyqOkkgXEXIGjlrEx+fUjw9oI7EKyXVkzIyda3fjnO9lRvzO1?=
 =?us-ascii?Q?3j0NjNlIKLI9EoikRhoHr4Xcj57e6RvocLZApHJtc+pVmaXqWlJuy1TrYApQ?=
 =?us-ascii?Q?PAUiNV2ai4T1A4wfshRCCC9QF4X4yLMT6vcFCN7dymUqzqaUqWc98ocTvBc1?=
 =?us-ascii?Q?oBqbHjNVvUDjH5cox/Rj4qFmEbrRsqin7KsXoNkJ4mxeOfhY2xa+8504uGwy?=
 =?us-ascii?Q?XcTyiRE7gDisRcSTNPQks66q?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97af8234-4339-4753-fc70-08d9783f8b30
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 11:54:16.4021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5jA0cC9rg4JmsjyIz1kGJplXbA4vUltjUIpbF1wyURQIdhCOOOuHL6LQ+AJP/LdBcnNGM+8sBFVK/RGISRijjNuFJMqvP07lB88pBmwWit9PJOroGItUgW3OCY/jg02
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7489
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Wed, Sep 15, 2021 at 12:12:18PM +0200, Michael Opdenacker wrote:
> This add a description of this variable to the variable index,
> and clarifies the explanations given in the devtool reference
> section.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/devtool-reference.rst | 13 ++++---------
>  documentation/ref-manual/variables.rst         |  7 +++++++
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
> index 5a0d6c25ae..761c7cb738 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -375,15 +375,10 @@ Following is a partial example table that reports on all the recipes.
>  Notice the reported reason for not upgrading the ``base-passwd`` recipe.
>  In this example, while a new version is available upstream, you do not
>  want to use it because the dependency on ``cdebconf`` is not easily
> -satisfied.
> -
> -.. note::
> -
> -   When a reason for not upgrading displays, the reason is usually
> -   written into the recipe using the ``RECIPE_NO_UPDATE_REASON``
> -   variable. See the
> -   :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
> -   recipe for an example.
> +satisfied. Maintainers can explicit the reason that is shown by adding
> +the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
> +See :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
> +for an example.
>  
>  ::
>  
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 74d04dfd49..ecad6acfff 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6132,6 +6132,13 @@ system and gives an overview of their function and contents.
>        BitBake User Manual for additional information on tasks and
>        dependencies.
>  
> +   :term:`RECIPE_NO_UPDATE_REASON`
> +      If a recipe should not be replaced by a more recent upstream version,
> +      setting this variable in a recipe allows to explain the reason why in

I think it's missing the information about what this variable should be
set to (the reason - a string).

What about:
"""
If a recipe should not be replaced by a more recent upstream version,
putting the reason why in this variable in a recipe allows
``devtool check-upgrade-status`` command to display it, as explained
[...]
"""

What do you think?

> +      the output of the ``devtool check-upgrade-status`` command, as explained
> +      in the ":ref:`ref-manual/devtool-reference:checking on the upgrade Status of a recipe`"

lowercase S in the reflink?

Cheers,
Quentin
