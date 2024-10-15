Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BC5CFC28A
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 11:20:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.51])
 by mx.groups.io with SMTP id smtpd.web10.10916.1728991223994615331
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 04:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Gf3fEWqC;
 spf=pass (domain: cherry.de, ip: 40.107.22.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nf9L5kRUh921vgTQWV8DkMzOAs9zrPsPDt/g+Cofate/SIDUiRmsLgsUO2ID90zY0gAk3/qcfPdUv1KD394rL0XG4aN0odcgDsANyi0jfpc9skRvPHAbMX/iYjV0LTgs0Wj+AwvB8G8mI1zMxOR+9aQHDyLPVuyR1+BLp7l7Rmo59BML6UHCd/SgV9zc/Z0ChM3AHxKGEpc3v4GmjCs+Ia5N5gMJvy9XKCWqbeQBKkDzWhgWv2DWKLkDfBK6/XWehTG1ecsEzBBQ21Q0OWyDZPUv2qOmkTYdBazjnHeGEdqzwCUd3OwyKkla5U3w2mtdX6NdEhP5YNBBWLhRIml9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx/u7N9fmuily9EjkwltgBN78enZ5ISviaZ+oWt3cLg=;
 b=Qzp9w5VS0jL4wLPnuyPVPOtph4UOUfCyirGWXqS2fS/qg2K/dkJ2oHoJhrimneGJnT2+WeJScfzhLMHUu/RjXZ2fH1P+62srALQ3RJkTb/g1Ut6HOyoHuHBtOo6b8pYQwQQYfoHH52CT7rPWiTdLs1zukx+AQ1K+3C/z8hcXr7fn7fbUepwBZWJIsRM6z0p6MudTox76s/NpoRlj9UFXftZ7vbiTjSBmZZRrcZEQAfmGJXEOQVCwbcnHzCn9bdZMECdrrexC0hbo9r90Dx8Xox8JN1czvJMQa2mIPtOcaZ7ywGUXSFXcmLE+3/oxDQx7TlPZZw4Q5PDOt9SxQv2rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cx/u7N9fmuily9EjkwltgBN78enZ5ISviaZ+oWt3cLg=;
 b=Gf3fEWqC8JVDJCDR23c2fO5WSVkfTyE/3LElvbyFPnaZ8sajht+tTwaAxL9bqlzo3ZfRd6K6gFDkIB5ztmytJWOxptGi10mXz6o5fSzqBI9bBa+w/YLtGFNqwD7OxRdp5aBVeHA4xAuVpjhXq/WR6M/9oeTKBqnwRPIx+zrbANg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9222.eurprd04.prod.outlook.com (2603:10a6:102:2a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Tue, 15 Oct
 2024 11:20:20 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 11:20:20 +0000
Message-ID: <8eb61ec2-4f53-45f4-ac08-af5aec1c997e@cherry.de>
Date: Tue, 15 Oct 2024 13:20:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: structure.rst: document missing tmp/
 dirs
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20241014-bug-14543-v1-1-7c8519be9c9c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241014-bug-14543-v1-1-7c8519be9c9c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: d60407a4-b0b1-4a7f-648b-08dced0b5a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?blBMSXlJd0ZaUnpjVkExalpZejFhQXFBS1FqMFUvb3RUMDg2WHVXdnJLdUlj?=
 =?utf-8?B?ZzVUVzNYL1J0Y1Y0VXE0bldXajRzY1IxNWtBdlJDSnhuQnAxWjNHbnBraXB2?=
 =?utf-8?B?OWhtdDJsTis1SFJaUFRtdDZuaHd2Ry96akUxUC9CN3JTdjFIYmNzK2VIUHNS?=
 =?utf-8?B?L1pMNTJrRWZZVjBBeFdHRlBvVGp6VkRhaE9LUm5kWEZkL2Fjd0hjUlFVRDhD?=
 =?utf-8?B?QmtCdXJxcE1DcHBPck82cUk1aU0zdjkwSlc0TDloUG5PeWUwNGUvbnpDanJr?=
 =?utf-8?B?S2R0S3J1bWp5eHhvcTRHaVhERzZOaTVMeVFZb3htcFdvbURBZ1RMRW9JMHVW?=
 =?utf-8?B?ejN4OWRXMGxvaS95UzFPMEtEZzNnTVF3cDN2Z1lVRkk1aXJIaGpNNlhxQ3gy?=
 =?utf-8?B?Mkk1WlZNZE5pM1VTSVFDUkVka0Vaa01jZ2VYUjhIWm50S3VOR0tBaUxGdDNu?=
 =?utf-8?B?eVNNRVRmR1J2UG1VbVpJei92YndmV2FrQjlCbmZIaDZzYkgreUtqNW5BbStk?=
 =?utf-8?B?Y09oWFRCb3hvaVBoL0RScVVJUjZpOTRKV0VpSCtOQUVrZkZUZDg0VVJIdWgv?=
 =?utf-8?B?UHVwOEF1VUUreXRQdk1UUUVhNnNsemhMZ3A1SitDR0hyalMxVVJUNVZJVWJp?=
 =?utf-8?B?Y3BKd1NkMFRPaW94NE5ldXdCQldjVlloL0cyaERyNlZ2L2dqKzFVRk93eXN5?=
 =?utf-8?B?aFhPSlZSYWlUeFkzb1FIRGJoR09BRnovMm5ZY2M1Q2ZJeEl2OEY2ellFR3Bl?=
 =?utf-8?B?ZjVkQjJrdzVkc1JKVWpMZkRMdG9wSE1hMHRMbGdCRlErdmdnSEVReEhJZVcv?=
 =?utf-8?B?a2ladTlLck1mc3VlWlVmMG9mWXQ3ZzF2L29pMWM4MWFRNWdTbm1xd1FvUjNr?=
 =?utf-8?B?bjd6WVJIQzNoRndtT282YjFTU0FJSlI0eTBPM2FVSjdnRHUxYnc5ZXFuaEQ1?=
 =?utf-8?B?b1VMS3dhUkg0L05wWXorbnVyNERWQzl0SFFKQmpMdDRoSnBaaW94Tk9NMHJl?=
 =?utf-8?B?UnhLRzN2MkJpRTFOdG43TXFQSTAxWVh0dFJCdDhraVUvQ3QzNDVCNUFsV01r?=
 =?utf-8?B?YWpZVU9Tcm9YdE1LZDRuVHdha283WENnanB2eG9LcDNacm5RcWpzWEhSeW1p?=
 =?utf-8?B?SVpvVytCMHl6OWp6UXgvK2JPTGNBN2QycHJCRDVzVDRQNmcrYkE3cnRjREU0?=
 =?utf-8?B?NVhlRXVCY1lFd1ZBMUxIN1A2Mi9xOVZVU2FVT0s2bVM3ZVdOcStZWnBvRVNj?=
 =?utf-8?B?ZEFrKzlFWjRYMm5YM2hxRjRzOVNodGhCbjlnbUZ3NWlnQ1ZVUWhQeVdBR2Mx?=
 =?utf-8?B?U0NMZzUyejBSMHBnL1BaTWNSaWFNYURuMTluTEp1Q3NpWC9QdFF3Zi94TzVL?=
 =?utf-8?B?RUVja1NlMUs3VVdHZU1XOHo1bVBZMDVJT1RkSmI4UUwzZVJoc1ZIZFM2UFN2?=
 =?utf-8?B?NWZPY1dWMzh2Nis2MENoSXRlTnptaHRWTForUzNneHRUeC8yd2JnQmdhNmlI?=
 =?utf-8?B?Z1ZRSnFiQ21pR2hHWWhCK3EwbWtYUVBKc0x5eGxFYU5rbjE3ZWNMMEZLUlJL?=
 =?utf-8?B?VEtoUzV6N2tNbThvSkNGc2xrcXNuRzhjVnhKZUorR2xLSTFaNEJNU3lISjJY?=
 =?utf-8?B?RWRpYS9NbnBoZ2hKbXV3c29WTXJPTmdsbHM0WDhQL3N5a1NWbHp6REZwdjJw?=
 =?utf-8?B?dDZwbEtjZ2loTXNNenhZajAyRHEvSDhIelpJNzErUWNraElaWEtKSFlRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUp4SkFKVDJ6ejdGa2tOQndBK0k5UEpVWGRkUmlJSS9mbERyRVhJSFd5azlH?=
 =?utf-8?B?YnR1bnV4VWl6STJ2VGNkanNMSkloRWFMNjhTZUdoNktLMkRWWVNKSDFraURL?=
 =?utf-8?B?M3dDNXp6cGZHS2tVQjdobEdkS1VNRGd6cTNTNXd3RVlTKzBSVnNSdit0VDN5?=
 =?utf-8?B?NVRKdmc4WTc0WUl0K3V1dVFieUtacTMwU1YrZCtVbFl3dDJBOHptK0RlYUtE?=
 =?utf-8?B?ZEtaSGlzSUhickN1ZkpjdWpoSUlGdnhRS3N5aDBoME1UZDdtMDVseGJxajhn?=
 =?utf-8?B?RVFQdEJOeWNQVCtUNkJack9PU1NDaW9RdkVpZFB5dHJ5YkxEWGZxZ2VxeThi?=
 =?utf-8?B?b2x1UGszdkZ0UmlKTnRWTVpDZHA3am1EdmlwV0QxbzRjSUczSVdmbXRDbWpJ?=
 =?utf-8?B?YmpLa1puaEhwdEJUL3lWbU5iN1NZL0xFeUgzby9WR0RyYldwUnV5aXpabjdh?=
 =?utf-8?B?aHkzVzY1TCtpTDRzVlFBeHpWVjFEeVlyTkdiczltSWJIbytrQ0E5MFdXUVlx?=
 =?utf-8?B?eWl1NmE3dW8yWDl0YTZKQ1BjRWZET3JtUXhPMS9xT1JaeThUeE1mYWlsdmpH?=
 =?utf-8?B?R3UwRk05WEdWaWtMdEpGYTVOU0dYZVhOVXZWVFZ4RGdBU3NLWXgxVG5OOCtK?=
 =?utf-8?B?ajMxaHJ4VDVOR2pFaEw0L0Z3RURNZm1iSG82dnFCbGIvOTQyNUx3MVNLVytj?=
 =?utf-8?B?b2t1TlpYNnNlZjEyWXdIL3Qwd2ZKVWR5UzMvT0lOQW1TUkRBanUyR251YmZC?=
 =?utf-8?B?OEo4LzNmWnpNcTN4bjRtVXE3RzZIZndHWGdvUTdLZjRQRzdIWU42UCtVNnJs?=
 =?utf-8?B?Qk9nWjNZUHM4amZmMU1BOG1lQzVRNVdPMGZqWjRGdnljQWsxSk9tOVRwQm9j?=
 =?utf-8?B?U3ZscFN5Z2NBeEpRZERnZEZhb1ZoMkZUZjQvbGNqcGZxTTdoaDY2LzVvSDdo?=
 =?utf-8?B?MmpneGZYS2RUOXNPMUdaU2xEc05wb3ZVeHRubE9QV1l3NzV4M0thZ1A5Q2FW?=
 =?utf-8?B?aEZaZGJlbVd3UzlOcUQ0TjRncHZlaHpoZXEranl2Qm1CQUljckRHc1c3Smt0?=
 =?utf-8?B?Snc0anN5NmJ4aGtIZ0NvcVhsZ2JSZHJaSXRuTGNLV1VYZHhUbklYU2owRDFU?=
 =?utf-8?B?ZkxjWS95bnEzUDFRNTljTTVwQ2lqSWhvM0pid0RNeGtYdmZobFVSTS9aOG9I?=
 =?utf-8?B?Q3BLeVhuQ3R3dGpZSGdjc0REN3VwN2FqWEltdTdienFIZ0FxYXFwMEx4WDJS?=
 =?utf-8?B?U3VObCs5OUlCQUtCQ3R1OXNlb2tsckE1M2l1NVJhN2hOYUZxUGplZGxaRTVO?=
 =?utf-8?B?L3JvLy96cDB0eDlNUjRZbjZPS2NSeWpOLzV5Y1Q1Y2oyTzRFTWdMRk9ZMlQw?=
 =?utf-8?B?MnV5YVF3LzVDSGc0UmRXWG9LSkhsQVRsOXp4WG9ZYVltS2piWlFnQ0Z0UlhV?=
 =?utf-8?B?eGZ3dXpTLzIybEhoOC9tV0lXOVZ6RnFGeFRCYkdQY1dlU282aHp1N2xjY2RL?=
 =?utf-8?B?TndqeVlWR2VBdU54SGRWSEZzamt1cDlOc2x6c09IMnV1VjBvWlpoUThBb2xr?=
 =?utf-8?B?Si9zVEYzcFFXd0NHaVBiT2RkakdXWVNUd2FJdjgyZXNMRjBQYlI2SEpONGhE?=
 =?utf-8?B?WUNDT3F0Sy9NeE5HVlNMOWwrSEFONTBlTitZa0RXeCtRQWpaV3htRFVnd2Nl?=
 =?utf-8?B?MVNjRjNWanJZbXlMeXZsMEdnckZ0SkVMV3c4Z0syN2RTMVFWeHFMUGR1Vktz?=
 =?utf-8?B?bXhxUVQwOGVaU2J2Ykl6RDVsK0xwQzF5aWtrYXN4QzFNUngyMlhKZjQvaUJn?=
 =?utf-8?B?N2xCcEMyMmxUMXFWWmNlekhFMHU1TUM2UDV6alJ6bVJ3bFpyb3lpc0FiZ2ly?=
 =?utf-8?B?SW9WMHg4NGVORDJnYks2eHk0LzgxUW5UdW41cDAxQWhYSk9IeVFNSis5YkRV?=
 =?utf-8?B?bnl6Vnk2c3NRbDhucE5kMzJDcFNaNmxwT2FDRVozQWJDM3E1eUp2ZUJTYS95?=
 =?utf-8?B?WnZGbkxCSjVKNzAreE03aCtiUnJMUnh2RXY1TlFyNUVQbHMxZEIrMEVEOUp1?=
 =?utf-8?B?NnI2VFJId2lnRGg2ZHp5OXNmTHE0dGRnZnVUYU9GTTFOaWlSWlA0OG9udUVO?=
 =?utf-8?B?R0FYWXdJN2RxR2dtaWU2aWNOZDRLc3Y0VEtmL1V6WVNLalkwd3p5SWlrVlAv?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d60407a4-b0b1-4a7f-648b-08dced0b5a7d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 11:20:20.0266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ51ow2D3/HnZJ47U0JAApzL/9fsfJ7MVgGQqQ4Zw6gjXT1lrypBwBBTKPTVnjdKmODsaV2rYPdQN3YAXA4PO/7GjceMYIXOAKfQvgTsCKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9222
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Oct 2024 11:20:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5488

Hi Antonin,

On 10/14/24 3:44 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Document `hosttools/`, `pkgdata/` and add some more information on
> `work-shared/`.
> 
> Adresses [YOCTO #14543].
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> ---
>   documentation/ref-manual/structure.rst | 31 +++++++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index e4d8b54bb9e39ffe344d2db1798e4fe76c742f4e..d13743cc285420b4d24f022ff6134a7ca33edcb2 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -484,6 +484,30 @@ the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
>   section in the Yocto Project Application Development and the Extensible
>   Software Development Kit (eSDK) manual.
>   
> +.. _structure-build-tmp-hosttools:
> +
> +``build/tmp/hosttools/``
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The OpenEmbedded build system uses this directory to create symbolic links to
> +some of host components that are allowed to be called within tasks. These are

some of the? I think we're missing a "the" here?

> +basic components usually pre-installed on the :ref:`supported Linux
> +distributions <system-requirements-supported-distros>`. These components are

I think this is a bit misleading as they are not necessarily 
preinstalled (I believe?) but rather part of the minimal setup required 
to get Yocto working, as documented in the link you provide there.

In any case, s/pre-installed/preinstalled/ if it were to stay.

> +listed in the :term:`HOSTTOOLS` variable and are limited to this list to prevent
> +host contamination.
> +
> +.. _structure-build-tmp-pkgdata:
> +
> +``build/tmp/pkgdata/``
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +The OpenEmbedded build system uses this directory to store package metadata
> +generated during the :ref:`ref-tasks-packagedata` task. The files stored in this
> +directory contain information about each output package produced by the
> +OpenEmbedded build system, and are used in different ways by the build system
> +such as ":ref:`dev-manual/debugging:viewing package information with
> +\`\`oe-pkgdata-util\`\``".
> +
>   .. _structure-build-tmp-sstate-control:
>   
>   ``build/tmp/sstate-control/``
> @@ -657,8 +681,11 @@ Here are key subdirectories within each recipe work directory:
>   
>   For efficiency, the OpenEmbedded build system creates and uses this
>   directory to hold recipes that share a work directory with other
> -recipes. In practice, this is only used for ``gcc`` and its variants
> -(e.g. ``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth).
> +recipes. This is for example used for ``gcc`` and its variants (e.g.
> +``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth), or by the
> +:ref:`ref-classes-kernel` class to store the kernel source code and kernel build
> +artifacts as a way to make it common to out-of-tree kernel modules or other

Can suggest:
s/as a way to make it common to/to make it available to/
or
so it's common between

But not necessarily a better wording :) Up to you!

Cheers,
Quentin

