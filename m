Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BCEC54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 15:24:01 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.89])
 by mx.groups.io with SMTP id smtpd.web11.403.1663601036830160413
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Sep 2022 08:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=el3BaaKg;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.89,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEXSJIEGOtYU2skPc8xFoR2YgSKU4fpHj2DL9a5OKC4NO6WlW8wCLyKCFaqglftMIFnv3uexEsb2QRvCrHcUAXkc0JMXKhLINkBpoq+dJaq6i/3OSe2VGna9MmtwPB+jC8K6jPn5W6a8LR5f/aJbVgClMCXotrqbmDjpKO3/lRaj/nOfDA+wfc0e8BZEtrX05HN0E1voyqNJLXnCwydXxiVQkKlVZrHwk1oX/kGYahkCaMEd1HFhtHMjQbubvpp2GlTwBFEQIiZQMOnESx9e3ZMvi7ApJnoTfqvz8IuCkI7QlFX6gC+ccXaRgyMS+khlEZxrD3XF+yuLpbAwBEy84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8WFmb6W4mp1jvNZ3bMvtLoZy9zBqYqVsvhsbSF/VAw=;
 b=M/HIvackPk09HGH9lhqkjUQYDjjVPylLgQhI6WJLP0n43bvDwPZjaul8Z4HXy2R8O+cetgyg6T5z3sEJApxGI4Ujbk99D4+ICFjoupA6nxPzr9Ec8D+H050n7gKpBeRK0kgxIbXJy0Q9akSNRbSPawsgcklplLQcV0oQJz/ChY/StmS4PsP9O6m92kK2B4yTaSo/hAd5jKND3A651Rnqsiif5yAPmmhBztiGXM0efW8qaK6Mm5GTiLYscfLzKebhL2ZDV8Xc2xUXVdnxthnHPuA87P5s9MjYav8rPaXEESP3vu2fg9DywT7ZRYlg1xgWKfOeDIIO36JxnLcvMJkCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8WFmb6W4mp1jvNZ3bMvtLoZy9zBqYqVsvhsbSF/VAw=;
 b=el3BaaKg2ammUhmDtY7WMOc61qNdgDUIb5NOQup3EmpNX1p0vJ5Vk7/rvRVcsrptPr5k+kYGfM7+l+q/U3PyrJtoONbnjC1BdEy49AJ0yVmLMoVu8YRzcQyXT2UeZs+0/BXikV8JDzb+/qIpNEd+y08PBVl9DeRVxgJvGn1Gi2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 15:23:51 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 15:23:51 +0000
Message-ID: <056487c1-6447-d078-be5d-05340b424ce5@theobroma-systems.com>
Date: Mon, 19 Sep 2022 17:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 3/5] common-tasks.rst: describe the newly added
 layer setup and template config commands
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-3-alex@linutronix.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220911172608.2542076-3-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: b685c909-52e8-4344-f746-08da9a52f512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EETPnDDoAc60xUY2FMuEgI2mLXAj3a0OO6wefmVqxZgAqJz9yuQXUMWfbXUg/1mnp/zOMl+pHyCX3OSOtY5tVYpc+f42yRPBNJAWajBRugvnaVvOR2h6p+v0L0J++sY+NatgN34uCFvJqv9aQNQjJBo5oTJulYQxQ/R/Phlknko3CwauvFPxXSjYuHnSn2s1BHGJS798WsH3FlqghFTqH8XshUIouzvp7yCGeDiqXpyKiYGqn2qxIBdd6qkILS04HrEoIEGAuPcZ/eFqZIOYuoj67EHgYYjbV9s/dK0YUJNY1h+XECGnHfG4iRunZqIjByuptjqw3kBsleW6HaBHuOVCMjuuOSBhostiJMi6eQNRTQJjY7SXkml1CrKbUMomfX24R8l/QuGO7CF10ByANsbXF0NRCq81zKRdLf+lrAsu59zGpClPxOaIPDvuj5a6l4yqaCx2MdBTY3vIILR8arZtVh6/frqzF2+fDiLi2jyb8QOgajfCpzJzKWsC17up1EjtVDsMhtnfkcwRoLuTEcj4FXxkwYQBwQ1OEd+Y4u40TrNwCQHDt5LDv5RRV34wco5nmM5ORlUfDA/x8y+a+wM8nMa+4BBsk3HfUfWjNUfqhJk5iwFwH/4XbbVjYWjm50T1syNyCN2j7z7CgKg8W0DT1dkm22nEpPKd55PEqeCX5jaQ5uOYHwo+hZeG2xqfA8dS3zG6AKrqldhPmfftRr2XLSrL7JX8Kwe1wh/LSXKGEHpWYrhiRGhKpKpGaJJEogaiUxMoH2F337a0hmVkJ+AXzNIamAJ5QUL286pfDaM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(346002)(366004)(39840400004)(451199015)(66946007)(8676002)(4326008)(66556008)(66476007)(5660300002)(31696002)(8936002)(86362001)(316002)(38100700002)(83380400001)(53546011)(41300700001)(6486002)(6506007)(478600001)(2616005)(186003)(26005)(6512007)(31686004)(44832011)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWNvM3RSajZ4NXIzenh6dDlWTC84S0RYWHJ0cHprWjN5bjFSbWhKbUhpS3Nj?=
 =?utf-8?B?eFNmdWY2d0hYRW9rV2NJa2tacGlKRkpPZXFVTVpYRTU5aW5sVXhRRnpjZnRx?=
 =?utf-8?B?VkVERmZHc3FzMC9NbWtRbkNyUVl2K092UGJIQUZWd2o2ZTFuMHppWHQ3WFdn?=
 =?utf-8?B?a0JmdFc2WTJacHJncE4rSHRBU1phemUzSzhrbDJDUVduRUdiNHlQa0owQ2J2?=
 =?utf-8?B?ZDYxU096TjZEQk5RWHA5cFdiTlNPS2ZJQVpFQzNRcXh3NmNBcFdWNFkyalJY?=
 =?utf-8?B?MFhSSTJENDJyT0VEU0FYb3BHY0FHSEdnMmhOM1QrNkFaKytYN0N4dG5Ya0V1?=
 =?utf-8?B?Nm5weVpNZCtDL2RqVkxjZjU0NW5LeVZzWmk0Z2RtTHZYclNTaHBjMHViTkFq?=
 =?utf-8?B?ZnFqcjEzMDlxalBYNm40b3hQakJtOTc1dlRyU0pGaWVsNWFqWUVyUjlPaTNZ?=
 =?utf-8?B?ckk3R1NOVWVQb1NUcVI5YWVGNDdSbDRmTkVaRGdXdkJ6SFdVQTduazdRdkx6?=
 =?utf-8?B?MlBuRFduVFdiQVZ4b0lTWmJXVDBTNzg2d1Fqak1Pd29zSGVPWUJ0bXBnZ0J4?=
 =?utf-8?B?a0xiMzJUNlhIS3BLK3B3M3Z5Tnc2UHhoUzlrVkloRnpiTGRQdzU3eWtTb2JR?=
 =?utf-8?B?K0JWRCtHUHNySE1DZ3N0Z0lrUFV4MzViL3licWpIVVdDanhQY0xsQXN0N0xQ?=
 =?utf-8?B?dkJlb0ZJN2ZscjVQQmswWDlkaWNpWHJuaTN5Uk1QeGU1d1JjN21hT0UrUzVR?=
 =?utf-8?B?VmRBNVlNOHlmR3BPclF2UU04M0J5Wmh3ZVNoeEdUckpBOWJaU1JjWkk3bWx5?=
 =?utf-8?B?N2k1U2FJVFRsQTMrK2o1TjZsZnBWZGpBelVMNzdoZk4vaHFCc3lTZ085TnI3?=
 =?utf-8?B?T240ajhPOHV0UEJqV1oxbUcvY0ZrTFlrQ25FR2lJVXNqUlpmUVFteEtIU2Iz?=
 =?utf-8?B?TFBHMVE5QmZ4VTJXR21VWVIvZytOSkJLSEJMZzdZRGhPOHQrZzJGQzVHclN2?=
 =?utf-8?B?bDFEajc5T2x6dUlKd1A0MEFWWXpKVWpDMlgyditQemNHVy9QWUtjNjVUVndq?=
 =?utf-8?B?enJrUm1nTWtwTlpXK3NibFJGeklCZ1F2ZEpmelBHUUJMTE5lV2RkK3RxSkk0?=
 =?utf-8?B?Q2U2ZFh0YW5rUDNpS2sxUEVXVHg4WFdROWZiSktKenVHLzhLdzdTbmR4eDR4?=
 =?utf-8?B?cUhhNFBVS3U5Yzl1bTJNWktaTjRPTWZLRjdRR0UxUlRmTWdBeCtlR1VLcng5?=
 =?utf-8?B?VUdWa1BxQ1cxTGU2ZkUybzNhdk1vZXNoRnZubG5OVTE3UEhjYW13QnRsUU04?=
 =?utf-8?B?RjlCUjUvZXpYeTlzYWRhb29NVmxFa1Nya3lBbmxiRkhlWTA1RHNWUXZ3UjBU?=
 =?utf-8?B?R3E5MVRzZ1F3VnlOUG5JelBZM3krYkRwc1NGeE5waE5iWW5yVEN0MFpuQ2lN?=
 =?utf-8?B?S29jSXl5cVdNOWJ2V08vUXExVTB5UllEV2pyZWhzczFqNlRPaWxyenoxVk1V?=
 =?utf-8?B?MUo4Zi9sZFgyM0x6MHNBaFMzdE9uT0lMbWRmT20vOUduaVcxdyt6UVg4Q09n?=
 =?utf-8?B?SkZSMVAxTkNaV1VaUzZBWE9peGtuU2hnVlRteFA5NUtHQnlOeDRVUzBEUG5H?=
 =?utf-8?B?WVYybkkyVmZEVmtyUVg0cTRaVExJSlh3VWljVDlxR2M3NGdzY2JKZXdRNGFa?=
 =?utf-8?B?ZEpveUw0eVN6QWVMcUExM01iSmpWY0VMczB3VzdEMTlObnNYd2grYVFCSVk4?=
 =?utf-8?B?N3VjQTBxSlN5MUU4YWN3NGJ0OGFDWVNHUVdWUmdxN1ZmV1R1ZStqV3REaUJQ?=
 =?utf-8?B?Szh4dnFhR3BkVkY5UE1qVnlNRW8rR0V2SS90d3h2VklHeVpSTXp5SlRjQmVr?=
 =?utf-8?B?MGNObHc2eitnWGhhMndLanRvSlZOWkIxM2FkM0Z1Zy9pZzI2YXNXVlJLMU9B?=
 =?utf-8?B?S3VVTVVQdUhWUTY0Q1ZyQkVScWNha0JKVGMzem9PVHB1ZmMrdHFaQnhoRWsv?=
 =?utf-8?B?ZHpBSHBTWkN4Q2xFdWliUkZBWU5xZVR5K054ZXBudjVJZXgzRFZHWmJBdU5N?=
 =?utf-8?B?ZGk4TVR4Y0YwR05JSXMrcFRacjZQcmc3aExOQVF3TERVNHUzRXU2WHNZOUtJ?=
 =?utf-8?B?YXJJNHN1YjFZRlc4dGVSTjhWSnh3SFR6RWxjOXE1UTZ3R3ZJR2ZBN2FZTlUw?=
 =?utf-8?Q?m/tzNDpgBVh2qAtvCgCxyrg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b685c909-52e8-4344-f746-08da9a52f512
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 15:23:51.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f6NIfTefzKxBHDuGTEJ4XjG9XcESJk/dEFKgRmCeM1maKXduYdZuGWbMasIR6+wOVT84BUxJi1tSgzfIH0U2b25zGrPH36ypWokCBbV1iLUjudXiQmpNNGWbFdGlMAV0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 Sep 2022 15:24:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3173

Hi Alex,

On 9/11/22 19:26, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/dev-manual/common-tasks.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index c2afec946..4d19bd921 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -728,6 +728,17 @@ The following list describes the available commands:
>   
>   -  ``create-layer``: Creates a basic layer.
>   
> +-  ``save-build-conf``: Saves the currently active build configuration
> +   (conf/local.conf, conf/bblayers.conf) as a template into a layer.

Double tick-quote the paths please, e.g.:
``conf/local.conf``

> +   This template can later be used for setting up builds via TEMPLATECONF.

:term:`TEMPLATECONF`

> +   For information about saving and usinc configuration templates, see

s/usinc/using/

> +   ":ref:`dev-manual/common-tasks:creating a custom template configuration directory`".
> +
> +-  ``create-layers-setup``: Writes out a configuration file and/or a script that
> +   can replicate the directory structure and revisions of the layers in a current build.
> +   For more information, see ":ref:`dev-manual/common-tasks:saving and restoring the layers setup`".
> +

Should we order alphabetically the list of available commands?

Cheers,
Quentin

