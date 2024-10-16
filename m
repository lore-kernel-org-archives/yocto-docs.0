Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9D5D20694
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:13:47 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.58])
 by mx.groups.io with SMTP id smtpd.web10.23906.1729088023941172136
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=S8QfjBeu;
 spf=pass (domain: cherry.de, ip: 40.107.105.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUH/i0n3o3SrSNAaUpqHD7clR7lLJVqiovWrzQF8trLnoaqc87drzJCKuMn8dZLY+bHxOVI3ZC/yK5zTpS+ZJpw5VbKWuBO3bTGUUww99iyQqGTNmutfhF35NTiWAXU4gtmxMucv0Untwr8gcSyc3yBXZoDnbXmIAMLUEL2HnsKFLxJj4t4RO65O5NPAiX0Tn/uoTVNElX3GN6ZdrYJ5Tjc4T5n1Uu99NTqiRbGe5DwzTw1YFUtblcfeG14QSekBwv4SjLe+4fngUDWeNsQhVOlGBbtlEJJ43THcp4ZEacrLlYBL2acb9Yx2km4ozcqXzB7As0E6XoSQAgDBz9fY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpdXwFfs0aEtJuo5n7civXqdp9jCDGfztilZYAaQzzE=;
 b=ObyQGWRrghPy4zVlpltZFLyNMxQEzEpOgnwrm5CGcbpVJjr8ueDLTZ7LB/M+0dALDyLV1CbS1C4XQd3aFAgSTOrv9jTdoq4Fsi2vosopU0V3tpyXUM3iWyt6BtVioplgWq+W9nbeE8Ygv5JesScTdMw2h2qh6iAQHCkKirGzYFrpZPj02M0fzwyvFoTeK7KdlR+VPv3Ji273w4TFhZ4W6ISQaFEV/Fci04r8ANemTAtMeeL9Rnc21lHBc4uxsVddBlJUslksfxIvPWj+dGHfvB3xRPJTgiuNG+zEy33OcB91Ijh4gFccbxzEKVfHpjN2etcbg1ky8c+m5Aqu3HlQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpdXwFfs0aEtJuo5n7civXqdp9jCDGfztilZYAaQzzE=;
 b=S8QfjBeueyRBjKl8Xg2JcR+QLt8nnAgaZDNN6qTudMDxeOn6PA7E32b7GX1y+ZICY3EA8FRkYyoZGoxyDJoSDJF1m8rL1ICwIwR4N2zUC1sYM/VCt9PDrW22mE95eJ2AmkAdi7WLNiRlmjFoGediK/lAvbgx6CtGUy8POXHwt4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 14:13:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 14:13:40 +0000
Message-ID: <afa39359-5303-448c-9925-b61375d0051f@cherry.de>
Date: Wed, 16 Oct 2024 16:13:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 1/2] docs: Replace VOLATILE_LOG_DIR with
 FILESYSTEM_PERMS_TABLES
To: Niko Mauno <niko.mauno@vaisala.com>, docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com
References: <20241016140940.3166992-1-niko.mauno@vaisala.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016140940.3166992-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 41876b22-bb3a-450b-52b6-08dcedecbbff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZGV0YU1qemREUVB1RC9TZi93ZjdReDBKR0xsTmJHeEVuWG5oWndsdUU3TGh5?=
 =?utf-8?B?NkdCeVdyWU9sbGVPK1U1Q01YZXl0Slp5Q2l1ZDR0ekdYd0lLR2Y1ZWVPMFN6?=
 =?utf-8?B?M2FiY1p1a3EwWjVUTjVvY1ZsK05OZDFrM0FkYnJYbHk5MENzQldIRU9NbFVP?=
 =?utf-8?B?T1Z5VUNVanNSN0VZNzFOVVRaNFl2anhVNWZLRHNvRTVGenBMU2RpY2dQcmRP?=
 =?utf-8?B?b24xSVhHVExmSWd2RzYwREdsZ1JQUDJieW90R0xpTENST3IwQ3FXZ0pFNkxX?=
 =?utf-8?B?YWw2WEdzNDlnbXdoWTFpZXhMU0QvMkwzOUhmOHZTbkxlTmp0dlFLRG04TUJy?=
 =?utf-8?B?cDdQdjI4dzlVUWYralZac3BOVnVlMHJLV3hkU3FJVG1rYkNQM1FOdk1WWGhm?=
 =?utf-8?B?QzJ4eGtESC9yR05ROEx4dUhINzRBcTlYdzhZY25vcFJmaW5ySVBoUndSdS9Y?=
 =?utf-8?B?VW9vSkhOVG9JVVNWUmk2Q2dJNHJkSm16VjNOL0h6Uks2d25STWlZMjNMSTNP?=
 =?utf-8?B?QzNxWm5qR09MY2Y4OS9FVnByS2JCaStUdUVhaTBYcHhWbS8rVmlaR1RFdlpJ?=
 =?utf-8?B?eFdXeFF3SEFoaGJ5VFY4c1F4L2x5ZWgrYnYrZVg4STc3cUkwZ3p3UkF2NUxS?=
 =?utf-8?B?b3E1Q0k5ZURIV1prSXI3bXREcUcwUzVlK29IdG03OGRLaG8rcC9ldU5xa05x?=
 =?utf-8?B?ZkI1Zy9CNkdTYzhXYjdLMDk1WFJqb29uTGlEdG5NVldFTE02T0hFNHV3OGZB?=
 =?utf-8?B?YTkyaFl0L0Q1SDY5LzNjK1NMdVNOMVdZVmw0OVdMRjNoLzhTRXNMbXRRdnZK?=
 =?utf-8?B?d2tNOGRLb0owNGpTVVVmNzBRSndhUmduY2l2NWhIVjFicEZrUFpaMzViem4z?=
 =?utf-8?B?aXhNT0w3M3lUSTE5eGVWc0JQS0FGeVllZkwweFk5VjlSY3plZklWVUhhSnhM?=
 =?utf-8?B?dy9rVURpNExFTXZYY1BjNmlqNWRKVXc5dVRxeXd3TnMyRG9hbHZDVUN5UjdH?=
 =?utf-8?B?OTc1YW1uNHFULzZXVWZmdmE1NHIwRjh4YmRmNzFtamR3NHBlNjZyU09qR1pB?=
 =?utf-8?B?WktHbGg2cFFDTDJ2S1ppZEdNRWtWMHViby8rdUs1V0IvUzhHR2QvYUJOUGsv?=
 =?utf-8?B?MzllUmlNMUNoR0JsOHZRMjlhSllYcys0djBqK3YxU0pKOXdRY3c0S0IxTlNr?=
 =?utf-8?B?ei92c1E0RUZsN2NrOFFOYVFqT1JNZ25TdGswc2MrSDY2TUsyeG1sR05KRkZj?=
 =?utf-8?B?anBPTHFaOTN4ZjBnRC92VXJDM29IVEE0NzJPcVo0N25mQXIxUzVobGk5V0Vi?=
 =?utf-8?B?WTlqM2xLL2Z5aEZoM1hNL2FCOUxadnZydC9hTjZuWFhxNEhxczBEYzBkbFdk?=
 =?utf-8?B?ZHIyMjREQkY3dkNOeFY3RkhmSmxFVjhxa3hHWk5ybHYwSm5sK2VCc3ZoRVBl?=
 =?utf-8?B?YzQ3R215L1BZMnpBZDNTNmhaSWlzbTlZUVcrQ1FoK2RjTWlDUFJmTldUaWFw?=
 =?utf-8?B?eWk2VGFMUFNCY3JSYkpHWnVaVGRlaW8vS1dCbzQyNk5YWnllVHkzNzFUY1ND?=
 =?utf-8?B?M3hxUnp1ZEdPYTdIUDh1eHRDODcwb1NvckRGam5sN01sRzJGdXVxVDk5cHZL?=
 =?utf-8?Q?CTbUFdLjQEvUnv0XMeW+Li8SDCNioepq86FXB0V2d4lw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amYxQSszRDljV2dVNXU4NXhvaTRBc0x4cGdTRkVHSzhYWEpjazJOeC8wZkd0?=
 =?utf-8?B?aWwvWUZqZzZKblVvK0ZCOEg1NzhGekNkK0MxVCt5d3ltdThMSURmWGl5S3Qw?=
 =?utf-8?B?TE45aHFod1c0bno4by94MExkWmFnTkQ1TjN2WDQ3anVoRVpsYVlxYk42Q01j?=
 =?utf-8?B?YkVtSE1HUzBJVGZEQWI0SHBQa1hTbWt6dHRFdG0vaU9rOHJmU0pTam1RWkRl?=
 =?utf-8?B?ekhpVXZOWUtpa2hkcUE4U3BNL1FiZUZUUWlqeTZFWmdJbm9SZWNzd3E0dHFk?=
 =?utf-8?B?ZWtsV2xyN0F6NW8vd3IwQ2toaW0zMEJQMkQwNWJlcVNXaDV3eW9PRFdVT0l5?=
 =?utf-8?B?ZFdTU0M1ZU8xMklNUDYzckxaKzc0OFFIVVM5ck1aUEJvZXgycEhuUVpoTS9S?=
 =?utf-8?B?TEx6ekNDWHEvV0VUQ0x6WWwvL09sL3gvWTlBbzRqTk12WmxTdE55MDExNWc4?=
 =?utf-8?B?dlI2aElpY21ZKzh4QVFJNHdNalowRFBHbHFHdDBBQ0tjR2VUS1NZbkViZVQy?=
 =?utf-8?B?NkJsdUxQeVVXS3QvaXV0bnJJd0FLSGZPNEtxeHJ0cFhMUDJwKzNxMmdhdFI3?=
 =?utf-8?B?Tm80dmpJNjkwTWhDVTVwWi9VekF3b3NhVThXY3J5aXhmWmlaeGM3MFpka2or?=
 =?utf-8?B?SkRYZjlwdHg4UGc4Y2s4UDlCYWxkRmllYjBPNWtJNWR5RUluNkVkMnJLZkRV?=
 =?utf-8?B?VVg0WlhaeTNZdVdIY2FYSlpReGVjMzlyMkxsZFpPNVV3ZEJ1TGlIZ2trUmRi?=
 =?utf-8?B?MjF0L0doNTU5QUdVMGdoRkNIWHY2dlhjd2lqVjg4RitRb3pLbGdRelJ2Ynda?=
 =?utf-8?B?a2EvdEYwT1VFVHM2encxRElhMVpod0xkWUZHUnpiOXRnNUFJMnArM2E4am1w?=
 =?utf-8?B?VUt0SFl5V2FWV01wcnJSM0R5KzVaNVZsR1krZUZuZy9nMnlWY0NCUTUwdkZq?=
 =?utf-8?B?dE1xck8vdmhJZFM2TzRzakJHdXlVN1Rpb1hHSlNzdU9BbGNTT3l6RDFiT3RZ?=
 =?utf-8?B?L3lFTWZwYWhPN2VaNi8rVnJ4emxBWDZSTnpTWlQvY2VhVFpEUER3ZXJQSElm?=
 =?utf-8?B?MFp3TVN2c24zaWpXSy9UUThPcjgyQm96KzR3dlZqb1hZYS9JNS9LWjkzc3lN?=
 =?utf-8?B?elVTdWs3MG1uZnhzK2xpN0pYTTFCZCt2RncyQ0tONEg1NmY5MXZ6bzZsRkRD?=
 =?utf-8?B?UlIwWkNLbTZQYXUzeDh4UnBEaStZZVBIZE0vMk14TjJzU0FkcUpUQzdiazFV?=
 =?utf-8?B?ajkvWnEwNURqZlI0ZEdJdEx3eFI2Vm51end4dkhacXdXdVRMQllkQlNFVnRC?=
 =?utf-8?B?VTlsRVJoRzVtV0JkOUVQekJkWnNjNVVUMHlyUU1KeVIwbllQdTBRTjRKcVU5?=
 =?utf-8?B?TWlXMEN0bHFzU283aTBuZmVIaVA1SkVYMDE3T0x3Tk8yWUE5ejh5TW9YR3Vv?=
 =?utf-8?B?aUxXSjdXUjFMcGhiTk1BUG1lVHJIVWpEUmRtMVFiVlJzbk56RVZ0bENaSkQ2?=
 =?utf-8?B?cEdTVi9STW1FbS9iV1FXZHV1OUIwUWhPUXlVRGRLZXhBNzF0Sm1YS2pOZXd4?=
 =?utf-8?B?OGlnNmE0Q1dHVkh5Sy9mcDBqOWhuSm5Ld0lGcmNXbWx6akxRZStVNGdJTTZM?=
 =?utf-8?B?OGxHU2JSbWpWVmR3QzZORU4xTGhyZ3Jpd3lzUlV5TDM5ZUwrQjdxRmtXb3Zz?=
 =?utf-8?B?TVhpeGhOazRIUFcyK3pZS3ljcktXYUJraWxmREV3eTN4clVnUXJnYWhaZ2Er?=
 =?utf-8?B?TmJYdmd6YmpGSjQzbURnQ1ViWndIQS81b3A0bFN6cjJwL0JMQjhpbkh5Y09w?=
 =?utf-8?B?TkZ4UVRHTlpqcmFUaDl3cS92SHdxRE5JbjZsTFMvVmdBQlhrWUJKUlUvSHg4?=
 =?utf-8?B?Vno4TnE2VUF4RS9EcHJCOTgrY09OdG1BazlmWXNqdWlYdUFXb1FaWHJVNWlo?=
 =?utf-8?B?L04yaEtZNlExN3JOR1hDWE92QWRxSkUvcVhBSjFSSnJoaUtSaE02TDRXY0xi?=
 =?utf-8?B?dGgydmVRRlJRQ2VUYjBXYmhaaG1ldTkvTWd2cUNLb1Fhb3kzNUx2UTVBQTlO?=
 =?utf-8?B?N3Q4b28vd2pIR1lXOXZ6YVoxWkhyZ1NUWnVXQStzbVlhTmJIYi9xRjdLQkhS?=
 =?utf-8?B?ZHJKWmhpZ2RIcmM5VjNsanBUdmlnWGFmdHlYMHpMZFBybVdCMnJDbllnNi9R?=
 =?utf-8?Q?JaA/hcBPPjhBWikUgtbaiYc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 41876b22-bb3a-450b-52b6-08dcedecbbff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 14:13:40.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUfESy8SKLxGu05BD71fcIYaKUHk6YudFcc+4SAiotjYVffOlu9Z7s1hzY1uFreW8ABxXUQFiC9IHSGZ/fs92w7LNxOatsD2WIJnRgtoWrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:13:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5516

Hi Niko,

On 10/16/24 4:09 PM, Niko Mauno wrote:
> The VOLATILE_LOG_DIR variable was removed and it's functionality
> replaced with a FILESYSTEM_PERMS_TABLES entry in
> https://git.yoctoproject.org/poky/commit/?id=2f8806deb7655b37d6f8d12ff54680d6acf7a298
> ("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead")
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>   .../migration-guides/migration-5.1.rst        |  6 +++
>   documentation/ref-manual/features.rst         |  5 ++-
>   documentation/ref-manual/variables.rst        | 40 +++++++++----------
>   3 files changed, 27 insertions(+), 24 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index 298ff3e250..2b945f8165 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -117,6 +117,12 @@ Removed variables
>   
>   The following variables have been removed:
>   
> +-  ``VOLATILE_LOG_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used instead.
> +   By default, :term:`FILESYSTEM_PERMS_TABLES` now contains the value
> +   ``files/fs-perms-volatile-log.txt``, which means that volatile log is
> +   enabled. Users can disable the volatile log by removing the value
> +   ``files/fs-perms-volatile-log.txt`` from :term:`FILESYSTEM_PERMS_TABLES`.
> +
>   .. _migration-5.1-removed-recipes:
>   
>   Removed recipes
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
> index b2ba731bb2..6e52dfce17 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -327,8 +327,9 @@ The image features available for all images are:
>   
>      .. note::
>   
> -      To make the ``/var/log`` directory on the target persistent, use the
> -      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
> +      To make the ``/var/log`` directory on the target persistent, remove the
> +      ``files/fs-perms-volatile-log.txt`` value from
> +      :term:`FILESYSTEM_PERMS_TABLES`.
>   
>   -  *ptest-pkgs:* Installs ptest packages for all ptest-enabled recipes.
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 32c9e7407d..c27a0ad7d6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -13,7 +13,7 @@ system and gives an overview of their function and contents.
>   :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
>   :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
>   :term:`R <RANLIB>` :term:`S` :term:`T`
> -:term:`U <UBOOT_CONFIG>` :term:`V <VOLATILE_LOG_DIR>`
> +:term:`U <UBOOT_CONFIG>` :term:`V <VIRTUAL-RUNTIME>`
>   :term:`W <WARN_QA>` :term:`X <XSERVER>`
>   
>   .. glossary::
> @@ -2988,26 +2988,30 @@ system and gives an overview of their function and contents.
>         :ref:`ref-tasks-patch` task as well.
>   
>      :term:`FILESYSTEM_PERMS_TABLES`
> -      Allows you to define your own file permissions settings table as part
> +      Allows you to define your own file permissions settings tables as part
>         of your configuration for the packaging process. For example, suppose
>         you need a consistent set of custom permissions for a set of groups
>         and users across an entire work project. It is best to do this in the
>         packages themselves but this is not always possible.
>   
> -      By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
> -      which is located in the ``meta/files`` folder in the :term:`Source Directory`.
> -      If you create your own file
> -      permissions setting table, you should place it in your layer or the
> -      distro's layer.
> +      By default, the OpenEmbedded build system uses the ``fs-perms.txt`` and
> +      ``fs-perms-volatile-log.txt`` which are located in the ``meta/files``
> +      folder in the :term:`Source Directory`. If you create your own permission
> +      setting table files, you should place those in your layer.
>   
> -      You define the :term:`FILESYSTEM_PERMS_TABLES` variable in the
> -      ``conf/local.conf`` file, which is found in the :term:`Build Directory`,
> -      to point to your custom ``fs-perms.txt``. You can specify more than a
> -      single file permissions setting table. The paths you specify to these
> -      files must be defined within the :term:`BBPATH` variable.
> +      You can override the value of :term:`FILESYSTEM_PERMS_TABLES` variable
> +      in your distribution configuration file to point to your custom
> +      permission table files. You can specify one or more file permissions
> +      setting tables. The paths that you specify to these files must be defined
> +      within the :term:`BBPATH` variable.
>   
> -      For guidance on how to create your own file permissions settings
> -      table file, examine the existing ``fs-perms.txt``.
> +      In order to disable the volatile log, which is enabled by default, one
> +      can remove the ``files/fs-perms-volatile-log.txt`` value from
> +      ``FILESYSTEM_PERMS_TABLES``.

missing :term: here, but maybe Antonin could fix this when applying :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

@Antonin, candidate for styhead backport I believe (I see a styhead 
branch but I don't know if you've branched off already, so mentioning 
anyway).

Thanks!
Quentin

