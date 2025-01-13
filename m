Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AB9C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 15:42:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web10.19886.1736782927507718503
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 07:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=arXeXkNt;
 spf=pass (domain: cherry.de, ip: 40.107.20.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0z73DkdJldCNrSpmxvfTMjZ0XomOM07yQTHdJsFdwvDehLwWapn2k9kDvfcqGNraAGEN9CUeitryYCuyP/lFxxNSMmPHFrXqNBlyGkgcNbC7gHmntmvdmKkJEUUz08vFbGbsohsskCYSsvkpfI/nxDw2U0hix+KYdhZewLQ7sApKGUA5om7glqBoyq3GRi9bYiSzl+abvNIqqW0G+Eoy3dRY5V+p7AzQoqp0H3rzAm3/L7I2AsrA/y+YgQNu4xsWCtAv0R9k7gLs3hUTO8smG07GSRYgWsrl1aM5HzUv1p5fOPblth1jotGKLG8cHkcbAdFaGhhwVOUb9BPAXcBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWuOAvupZ1CPuUzPvEDmfiEKWcDnkyK6ATLdQwsQ+mY=;
 b=NPWU1p6k97kamgZ1mni953Az3JCqH2vTgXHqaWzMPg1FAQ8qr8y7VcXQ2HTUj5//jpJD7BUNQkv97m6XFVveGFHow/j7U/bgpVN/7gTlAe0irZ+jevfWudA9vkmM5LskPKvKoQjhyJkHzG+2epPM8rRxGBUSl772xz+Hzy2mECKq8XpqPpaODGaZ5CIS5rFSrndgdcz2+HIZOdQu/DWnL9B3Y/KR1oPv90A25WrFRLlyY33fDjOzdJy9UA7zRU1nPA6J/aT+oSBPPYJZDB3cnvbk42LBch8RsrJ0AtsOBzkz2Yq8+Qt6X7XG734comzRah39j8kK15QGIRQ6fkwV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWuOAvupZ1CPuUzPvEDmfiEKWcDnkyK6ATLdQwsQ+mY=;
 b=arXeXkNtvqEU3NQmbQzawqGiRZ3O/tIb/Tj+CoZgmdqXiIi26iDd2K4y/SXyyN3Gb6wUs5MmtbmOW84jSp6SC9bDs7YBA1L4RWR44sv2piI71RPIF0Qlg3bakGSQ3c7J3+aqtIdwvf58/eWq2Q3BCcXtKraRjlhPuQvVRqbw9jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7581.eurprd04.prod.outlook.com (2603:10a6:102:f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:42:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 15:42:04 +0000
Message-ID: <28f18b5e-4e22-41b9-b019-82763559772b@cherry.de>
Date: Mon, 13 Jan 2025 16:42:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] Move devtool doc from extensible to dev manual
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Eggleton <bluelightning@bluelightning.org>
References: <20241224-devtool-dev-manual-v1-0-0cc4fb584018@bootlin.com>
 <20241224-devtool-dev-manual-v1-1-0cc4fb584018@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241224-devtool-dev-manual-v1-1-0cc4fb584018@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: cf75abd0-8536-4042-3024-08dd33e8d424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZW5TUTkwRyswdlhkZ1liQmhUSWk3d0U0SEZzYjdjUStBc2ZITGZXbzRJRFFT?=
 =?utf-8?B?M1E5dVB3VmR3MXQzbkxUSUVlYUQrbzk0MzlPUkczNWhjMXltMXlQVEpkZm5G?=
 =?utf-8?B?ZDlFZHpSSEs1OGkvRTV4cmNGMjdwRVNQOERuTlVDb2s3UzZLSERtT0JWTVVU?=
 =?utf-8?B?VU5BVitMQ1NwblZRUXhaRG1Wd2lGMSsvNlRPaTZSL1RDcThENGNoOVA5YzNJ?=
 =?utf-8?B?dHBmcEY3WDBrM055c2xnTGhxWGFqazRTQzdvOEFBNVF6eDg5enNiRUhQTHVE?=
 =?utf-8?B?aE81NU4yNDdMcEZFcTA3K2NWZ0dCcVBGK3lTTFNXNkJyYWZIQ09pOWh1VmNE?=
 =?utf-8?B?akRtaVBaTkxheGk4M0dlZnRHNmlNc245ci9rWnlseVNQei8rZnZpbHhDeDhH?=
 =?utf-8?B?VlcrKzBsQm13bDduZ3VvNGRuVHV0NjNBcnZpcmxYR1N4bnV3WVdUby92TkN0?=
 =?utf-8?B?aE81S2FDVUdmdTBlTEQwUUp3dGNGMU5sak1oQ2hYeTAwcGJUL0JPVXhUNS82?=
 =?utf-8?B?dHpoMllFb2lSdjl5VGxZTFZKWDI5WVNiVHEwYzRmL1ZYelVLUUJsWEoyRjlj?=
 =?utf-8?B?K0NvTUpjOVZzOVc2VmZPZElKb2poQXdnaVlzWGI4SWxUWlJnMjRob2VoZDhi?=
 =?utf-8?B?UzFiblFXRDhMS0d6TGJUU1pjMlplZG5qTkxLWElEKzd2SjJadWxYTWR0dzhB?=
 =?utf-8?B?cGR1VFV2ekY3TnNGdG5MeStFZ000WW40a0x4WFhkRUQybFNJREZqTGNOMUJJ?=
 =?utf-8?B?RU44Wnh3MU5UWTdhUmZTbTNNNHcxamhkb3pqcXU0ci82RVlmbW5zRnoyNk1h?=
 =?utf-8?B?WnJIa2IyZExQb3cxaUM3ODFuUUJ0TXNwOE5acHB3cmd5YXNoSHBKS1ptd011?=
 =?utf-8?B?QmlLNGRTTmpOMTlwQ2ZydXdlQ2JGOWZiOE4xMEJFd3J0THUycFd0V2tLVTE2?=
 =?utf-8?B?R1NyMkpVUzFGTVM0bjJSVDhTZkxvWkhZNHZWMGRpVlJtdjc5OWFRQUJRa0xn?=
 =?utf-8?B?Q0JseUF3NUo2NGJUSHVPdGQzMEkwb2hVVE4yVHN2dXRxUDdUbGcvYnZsQS9S?=
 =?utf-8?B?clBzWExINUNnbWNiSnIwMG1xWUFHSHorRFRtSVQvZ1pxTWQvTUNOaHhrdmt3?=
 =?utf-8?B?TnRXa05yQzhIVE5vV2kxWHpGVnJvaFpjMnJhZEhYZ1ozYWVJMWRRSlpTZmti?=
 =?utf-8?B?bVE4VXFtWTVwdjhyNFhGTEZQMFNXbExqYTE4aTFkUzhCK3VBYWljYWtWR1NS?=
 =?utf-8?B?SVczSDhXZFVoek1pVmpmbUc4YzEyc0JjYlYwZFA2ZG82bVQ0Y3JBV0QzSEdj?=
 =?utf-8?B?QXk2c0MwZlNTcXdVUjk4N2FrMlM1d3BIcTh2a003bWJTdVhqT3Y3dWwvaXhW?=
 =?utf-8?B?TUZmc0RrSmhDSW1iNVJ2dkQyL3h2REVyZFpZRFVxd1V0WjF1Um9mWThaM2kw?=
 =?utf-8?B?YVlLS1ZLUUdodGVyTFYyTUdVK29EelZES3g3QWlZS2RDdU84Z1V5VTJhbnVN?=
 =?utf-8?B?Ty9ReGtOODZvSG5yS3d5c0ZpSHpFYmZTQzV3TVgwbE5GWEREZWg4QXpJcWZ4?=
 =?utf-8?B?ekpvWkxvV0RrOHlTS1oyRm5UWEpWTGt6UWdESEc0OU5HV3pQTmNSOEZoODJk?=
 =?utf-8?B?ZlhPejdsbit2emtkT1pGTURweE4rbDFpV2ZhNkhJNzJZbTRqb0djc0t3eG96?=
 =?utf-8?B?MTRBc1FpU0t0dkJQVngxbHJudnRxNUlFY2t0SG9RR1FVSVJORVdBS2l3dlIx?=
 =?utf-8?B?ZkJQWHpWcVg1QXhVM2Z4L2lvbGtKRzZFNUp1aWZWakxzNGJCb3RoaE1CNjEx?=
 =?utf-8?B?VEpQbE5OalJxRlJSbCttZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDNTOFNvSTBGb2VPOEtRUEF2cE05Y0wyZ1dIWG9nN1RsR0wzWXN3dk1CSzYx?=
 =?utf-8?B?cy91T2ZBK3R2ZTVtZW9mdlRiU0pvUVQzZTR4VWJMUWJ0cU0ySHM3WTJpV2RS?=
 =?utf-8?B?emF4TkF3UGVFVm5mYTBESGJ4ZHpYb0FQSnE5V0ZHMzFXamwvVmFhMDdyTlpw?=
 =?utf-8?B?b3pDQ0paU25MbkxPU0ZYT2ZpN0owaENBMDB5SkR1YUJvUFl1Rm5uWTVDc25l?=
 =?utf-8?B?VTBoNjlwWHduMk1BdkkzamJqNzhua2JYZTE3UXkxVzJIa3lSQm1qdWIvWEk3?=
 =?utf-8?B?VDR3STBBUEl4UXBaNTlLM2dvSG1oejZKR3RSVFRWaE5wclFldXU1S29LT001?=
 =?utf-8?B?aWhmYkZSb2lZSG1ha0Zna3dZMUo2bmdwQk5IMjZVZnNvWVF0a2Exb2xFdlQy?=
 =?utf-8?B?SmhlQ0FpaUlDSVBTZW0vNjV5V3JPSndlVXl0bWN6bUs5YUhSZFd6Um9DRE01?=
 =?utf-8?B?cmdYNzh2a3hQKzFXQUdZc2YyNEx6Ym85RlVHRFdzMlpwL1lkMStCVlg1MHQy?=
 =?utf-8?B?TWppU1ptaituRGU5RVdmV09ZZ01hd01VMVhrVW9ZZTBKUU9UU0RIckhNNVZD?=
 =?utf-8?B?ZWlCVi83eTlGVkpyS0pWSGxSMmt4RTI2VUFKYVVOVHFrYk93Y0FPMXBCWWZX?=
 =?utf-8?B?bGJ5Z0VNWGFHQnhhNWtNTjJTZkMzTG9vYzJzSEpBbHAvamdFR1VYQ2pkRU1r?=
 =?utf-8?B?MXJBUFZ4NmVnOG9yV0E2My94eUV6ZWRyK3o3bUxtdVdnQXI0aDJwMlJPeHN5?=
 =?utf-8?B?S2Z1M0RyM2l1MmlJb0hyMXR2bUNKY1lpRFJRdlNvaGRjaVFtN09uazUydlVp?=
 =?utf-8?B?aFB1dDRjWWh2M0RsenU2cEFUWGU3RXRjcjNsNjFMYjlvWXA2Z1E5TTg1VFJk?=
 =?utf-8?B?TnNTNEtnSmsvOWhmVURXc1ovRDJOSnVJbWZ1NDFWMUJXYmIwODRuUFRqUXN6?=
 =?utf-8?B?dFBWU284Wit6YUlPWkdLcytOdUlRUC91di9YVDBDMkFRdERaSTNHWlNWWUtG?=
 =?utf-8?B?cStYc3RkeTN5dEJLY21jRlI2OVZKSDl3eHB4NGVjM3g3L1dIQkpzRHZid3Bq?=
 =?utf-8?B?aG55ZnJnWkJ0WE0xaWR1SUZvLzlONjlIUEc3U0dRMjQvODhKKzlvU1oyeDQr?=
 =?utf-8?B?RDNSQU9jNStlS2wxd09HNnNyNkNFdXZneE1NdDE0RGp1aXFOcmFyNll1UHFS?=
 =?utf-8?B?SHQvUnowTmxNd0Qya2ZwOG5GRG02NDROcGFIekJrNWMrNHVIdFR4cWxHcU1P?=
 =?utf-8?B?blJYellPRk5vSUZnVW9ta0RWWEcyM1BheVdwS1RNN0VaQXJuZTUrU3BXT1pH?=
 =?utf-8?B?enNNRlFjV0lYT2pWWW1sNitFNlFrSnhnMUc5dmdtWHF2azNON3IwRUNEZS92?=
 =?utf-8?B?T2hjQnZMRENNeGkxK0xlVTdtaXpCSm9TNmZDR1JzbnRMczl0YTVNTzNGSnFQ?=
 =?utf-8?B?cHhXamVsWG0yblJCNUJpMjJkN0RmMGFpREQ1Z0J0b0xSZEIwc3J2L1Y5U2Iy?=
 =?utf-8?B?SWRzRVZqNXV6YlltSlhZVVFybjZuQzhnc3AxK0FNaWg4NzhEMm1aNFBMN0s1?=
 =?utf-8?B?QU54aGxNZ3IxU1pQeVV5UmtwQkJXQUkxbTZWQ3kyZXcxVGxjQ0NPT2hkUlN2?=
 =?utf-8?B?Zmg2VVFRcm85WHhqbUZQVXVLZVVOaHFYR0lBMDVPWjVleGZTV3JiSHpxb0k2?=
 =?utf-8?B?UExTaU1YU2Rnc0drTXI5TllqbDRoWVVGbVdVTWliUGJHekpGYnV6QmtYUjVq?=
 =?utf-8?B?eWlJbnhKMXRZUW15R1VDUklwbkFSaGo1bVVidUpycXNVQXA0cXpmbHMzMk1u?=
 =?utf-8?B?RTdxNXRVS0FyVnhWQWJBbkJUK1JHcGhJWGhyZDdIM3ZGTmY1OHA5b2RsT0o5?=
 =?utf-8?B?ejJ2d01uNjhQR3RrbDNSNGJvK3EvNE1sWGhWdUo3Y05kb1JTdWZtb1Bmc3Ay?=
 =?utf-8?B?bTl1MExyWkVvSFpyMWhtRDZHa29JRkVXclFwWVIrZ3lITTNlSUUwWFZOdEdQ?=
 =?utf-8?B?R0s4SWJ6eEp3dVBwTDhpNXFiQno3MEFxS3QxdHc3SEFvK2d5UU85WE5CY21n?=
 =?utf-8?B?dXNmUnNhbU9Wc0FtdytsaVIxeFZ3a1R2QTlFNTNudlEwNkdUM1lNWWFMZHJa?=
 =?utf-8?B?T1FJNXV4UkU0cDFnNVVUY2kxQjNHYmYxYjYvbGJpakNWSmUvV3Q1MnBTUnVk?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cf75abd0-8536-4042-3024-08dd33e8d424
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:42:04.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJI96ChMnNb67fm8IA9XdH9eMKCW5o2SKEIpgtZcNzjIkDyCKXWlFKet+XtHaMs7EYlK4Ndr+JYy9EYVXH4XEYRQfWYJZ6JApSMCdUnf7VI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7581
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 15:42:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6083

Hi Antonin,

On 12/24/24 9:33 AM, Antonin Godard via lists.yoctoproject.org wrote:
> [ YOCTO #13417 ]
> 
> devtool is not directly tied to the Extensible SDK, and instructions in
> there can be split and added to the development manual.
> 
> This patch is a simple bulk move, except for the following:
> 
> - Intro added to the devtool.rst document (mostly copy-pasted from the
>    devtool quick reference in the ref-manual).
> - Figures renamed to remove "sdk-" from filenames. References
>    devtool.rst adjusted.
> - The part on ``devtool ide-sdk`` was left in the Extensible SDK
>    document.
> 
> Reported-By:  Paul Eggleton <bluelightning@bluelightning.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

[...]

A few double tick quotes for highlighting non-English words (meant as 
not literal) missing here and there, but didn't take note of them while 
reading :/

> +A Closer Look at ``devtool add``
> +================================
> +
> +The ``devtool add`` command automatically creates a recipe based on the
> +source tree you provide with the command. Currently, the command has
> +support for the following:
> +
> +-  Autotools (``autoconf`` and ``automake``)
> +
> +-  CMake
> +
> +-  Scons
> +
> +-  ``qmake``
> +
> +-  Plain ``Makefile``
> +
> +-  Out-of-tree kernel module
> +
> +-  Binary package (i.e. "-b" option)
> +
> +-  Node.js module
> +
> +-  Python modules that use ``setuptools`` or ``distutils``

I believe PEP517/518 pyproject.toml is also supported for the following 
backends:

  - setuptools
  - poetry
  - flit
  - hatchling
  - maturin
  - mesonpy

Additionally, there's also go module support.

Not for this patch though :)

[...]

> +Packaging
> +---------
> +
> +Packaging is not always particularly relevant within the extensible SDK.
> +However, if you examine how build output gets into the final image on
> +the target device, it is important to understand packaging because the
> +contents of the image are expressed in terms of packages and not
> +recipes.
> +
> +During the :ref:`ref-tasks-package` task, files installed during the
> +:ref:`ref-tasks-install` task are split into one main package, which is almost
> +always named the same as the recipe, and into several other packages. This
> +separation exists because not all of those installed files are useful in every
> +image. For example, you probably do not need any of the documentation installed
> +in a production image. Consequently, for each recipe the documentation
> +files are separated into a ``-doc`` package. Recipes that package
> +software containing optional modules or plugins might undergo additional
> +package splitting as well.
> +
> +After building a recipe, you can see where files have gone by looking in
> +the ``oe-workdir/packages-split`` directory, which contains a
> +subdirectory for each package. Apart from some advanced cases, the
> +:term:`PACKAGES` and :term:`FILES` variables controls

s/controls/control/

Looking ok otherwise. Some of the explanation could be reused for just 
how to create a recipe, even outside of devtool. Maybe we already have 
those variables documented somewhere else (not in the glossary I mean)? 
Maybe we should merge/extend 
https://docs.yoctoproject.org/dev-manual/new-recipe.html?

Also, we already have devtool-reference in the ref-manual, isn't there 
some overlap there?

Cheers,
Quentin

