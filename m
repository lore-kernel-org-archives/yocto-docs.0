Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A45D2D0FE
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:25:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58701.1768310739879748378
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Cst+rJzE;
 spf=pass (domain: cherry.de, ip: 40.107.162.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltgr/FMUCU7sMJo5nR9NhAfA1tU0Z3aPj8yz10DWp32paE36DMPuYOFyxnh2v9zK6s4K7KUEdt1ApeglJ8RFaujXs9iIbgVMy1iCcxfJAfLqTntUd4RxaZfy2p7/4a8PshvTNv2EtHH6tlbMMxFdrwedL9aejF+rqyq9nxR84+QLbr1WXKupbpXA5ugdqX8zY49Us5Nmfwqy6k3QE3GPvLYwgBGG4HIqAyYcNd2iXuruPzy6ltuWI8jtCvV0EJfPJgQn0e+ZAK1vUJKZMyc/0v+BCW10DfaM+bob212h1W274CHnCF9/8fl4+80z4ejyceovbhpK5pcOL5Jb4uzv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8Tfdfvk+PJDpPbrD55r3UBvx+acsLM7mktaB+3Xjq8=;
 b=Xs9HieM8amn7ev6DgQi4TwkVpDz7eGDyMty7nzrWHkli9Q8w7CQEOcWS6IRI7Znk9arvAUevdZQyIhqQ1S8/AedCwNzdI3CZrxCjSbfug+jgPuMoULdJMz2T3W7Zf1UAla7qxzSCZSvBoW6B4tq26fSlyK5hOb3N0Z1dP5eemCswjY4aAh6bwgJMuO4pgouC/rGqSMprTd/9rFSEAHoGcxiHXemHlMfk7O1XTloqFK0r1VBBh/vuA2OEjFJArFOlL1fdbRg/1GkKWI7aKCKL9kVE0/k5F+m4wvy3gDA32bI9yUj4ZF5J573e2CvSIR0X4JLD3aEVCtDnPT/QSoQnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8Tfdfvk+PJDpPbrD55r3UBvx+acsLM7mktaB+3Xjq8=;
 b=Cst+rJzEddz/5orwfugMTxksuzywUS9O23U9KWqmCgKop83pyZst1zRCFEwPZefcRwLhJ9iNcPZZdldODsmkSuOVleqNCrcBVTFK37TlK3EQsHqXv0kBWxdU49fzUlshpFnKyzDwaSAfvl0RcqIt8Gb2049d5FUDUJyyl1HOcxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:25:34 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:25:34 +0000
Message-ID: <e6ada93a-902c-4b88-a407-5fb690d9b8f4@cherry.de>
Date: Tue, 13 Jan 2026 14:25:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 19/53] kernel-dev/common.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-19-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-19-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0113.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::42) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfde18d-cdc8-47b5-6068-08de52a73b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SHdWamRzWS9mcGN3T1ZqanVpV3l2c1IyTjlRODFwN1k4NURmUzlhYlZSOHhm?=
 =?utf-8?B?TS9rT1NpS0Iwdy81S3BWdkMrMU1hWVY0eGswcm1wRGtSQUtPblNRWkhuZy9x?=
 =?utf-8?B?eHhkU0RnK0E2eTZSQitNZ2V3MHpFS2prdE1iVFlGT01oTVdUS25jR0tpT1gw?=
 =?utf-8?B?VnpmM0MvTVlmNDV5ZkhZbWM5NXNDY2VoSWxNMjNFWkd1aWw3UUVzbm9lc0lR?=
 =?utf-8?B?U0NjdHgwVlNqbWt3ZTNodUtSUWNrT29KWVVleVgzT2NkSEgydDFvUDZyekZH?=
 =?utf-8?B?QW9kMFVyQWhOL2haS2djcjR4YzZqbjlYaWJWRFZuVHdxbUI4OTFxNE9yRnU1?=
 =?utf-8?B?VVluV0VnMDlENXdHeGlCVDYzdDM1MlU2T29ucnJQaFZEZ3pFYTJQRGVuMUQy?=
 =?utf-8?B?MXgrKzR6bVhvNEpJVHNUbUhjR1NOQ3BwMXpHQ3dXNEJLVldBTEJqajBFcjV0?=
 =?utf-8?B?dzRPK1FocHFUT0Fma0MzOHp6a3ZnaGhXbGhETlRNRjdSSWlqUWRTdjlZUUky?=
 =?utf-8?B?WE5VVEY3M1kzekxsRFJ6VFhhWTQvdldXMVYzbGoxcXRvMEpTYzVTaHdKSVlw?=
 =?utf-8?B?aDlSYWdCdDBtTDNVTmpJVXptQ0loelh6QkVqQVQyRlJnM2pPZTA4Q2lzejNM?=
 =?utf-8?B?QUluRm1oeDhUSEdQdXhLTGgxNjJ1bUZKRExOOXFDK25pVGs2TzkzTmExYTdy?=
 =?utf-8?B?SHVkMkpqUEhCVno0cGxRN1VjTzB0a0k0b3RjUGJaYXlIQUUvWC9yRWtxb056?=
 =?utf-8?B?TEtjaEdBVXJlZTNId3N4SFcwM0p3Q0dTWWZ2MnE0YjJLaHlyQndidmJSNzQw?=
 =?utf-8?B?SW1KUXJWSzUrdUloenNKMktwV0lMTS9GTnBnbDNEODVmYlJCQitFYVJUQW1s?=
 =?utf-8?B?ZCtWemJRREY5ZUFHRFN6YWhOZlUra1c4dEhKa0oxUjlFNVJQV3ZkQWZ4QXdq?=
 =?utf-8?B?TEVaZWlvOFJSbDFUMnpMdU93VCt6bnE3cElDWk1vMDZZZ3JwbURmaDVGc2Fs?=
 =?utf-8?B?c0p6NjlpZFBaUmFIWnJaTFVEcHpqTGtBVzNqT3BtamthMm5JSU5ELzJlQ0pG?=
 =?utf-8?B?cXNsbzJUQmlaSjkzUWY3UkhDVHZSNENiY0xaSTJ6RGxwalFwSmpZU0cveTZi?=
 =?utf-8?B?bkFDUXpWYlZsNVFFUFFXeTZmalc1WUtISlpHSUN6OUxsSi9zNzhDUWFPZzI2?=
 =?utf-8?B?d05JT3VCWjRSb1dXb1l4R2ptSlUvNWYxTUgrRS94bVMya0xJZlpOVnhtOXFk?=
 =?utf-8?B?bHhnTVdHU3FiWkV4ZktMTy8xVUJleTRwZ2VZZFJUR0RLNzh4RUE2Rm9uN285?=
 =?utf-8?B?TGttVUVFTXUvbDJJWVJKbWNiSWNBOThjdm9RS2xJOTQwVHp5aTcreXcxdzlh?=
 =?utf-8?B?OENlSTFwd0g1M0hSTkdSWWlNdWM5WWRxQzI3V0dzajRxQ0RuekZSV3hPT0lO?=
 =?utf-8?B?OUdDNlBRR3lleXZqbkZ3K2VhaENqTzBrd01sSllOMEZzNG5rSEFJYTRqZi9j?=
 =?utf-8?B?ZXptUXpvT2NRZWZBMUY4RUEyblV5dWdMMUNCOFM0dWZGWHBYTmJBV1JBTGZl?=
 =?utf-8?B?Z3Bqdi8zdml6KzVvN1M3UFVuSWN2Q2lyQ0k4TE9vUG92a0ZHbmpqTDY2YVND?=
 =?utf-8?B?elJKUW9qVjU5RzNmVDhDdUk2cTdrNDMxVUNLLzJjTytsZTlVeXhzRHc1RkM4?=
 =?utf-8?B?VXFEeHM3aEVEY2t1MDNESmFpOXVEUjZDM3FxejRSTWdvSmwyWmVJUW1ZMGYz?=
 =?utf-8?B?Z3dsOUZ5QnFRMjM5SnJwbmhpYjcxR2xpU3NWUlpyQ2VNUjl1a0xNeklBS21E?=
 =?utf-8?B?dXErZG5RaXV1VExCMk9sajI1U2VqUmd4akJadENVbkU0MGlkUXZZbEFEMUYx?=
 =?utf-8?B?c1lpUkp3aWZSYS9sNjVFRU9LcU81Rm50Z09leHRoSHhtNlFTWVdJcHZBTmtr?=
 =?utf-8?Q?/0oWAPqsHiZvSrdmrl3vPU+elqfZPkvV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dG5kdU9mUnE2ak9WZ2dkWVdwdE1JclU4SzdPRUROMWdMN3pIVWtzaDFlRTdR?=
 =?utf-8?B?ZEFjZFpyc2I0NmIwQ0xsMDBxaWZ1K3pnMGp5SlVrSHgrOFdibHluZElOU3lh?=
 =?utf-8?B?UGFpQzEzT0ZOUkROS0NkOXlhbnA1czJNT0Z3YW9vaTRtZ1hWd2hPN3dtUGFi?=
 =?utf-8?B?V2FLaVZjMW5aQkxWallrbmpHcmROYnd5bStXRUlycUdPMjNDSkpyNHVWSlo3?=
 =?utf-8?B?VTBvK1JqMVlnQnNHUGMxcGIvT0twVmk4b0IzbmVZNnh0WjFzTkxSLzdYMGRw?=
 =?utf-8?B?VlI4bGRSQXhRVXhOQmtlWE1GK2ZBR0t3ZkwzWEhUSFdBOGpwRmpvU1dmVzZh?=
 =?utf-8?B?QUE0QTJvMk1IR09TOTZjMWdxSlgvaVBuYytueHpQcTViTUFndjk0WmtlOSs3?=
 =?utf-8?B?bzlGeDY1M2pldExGMElYNmlYTzBIYjRBYTBWb1hZR2lRVVNzZHBYbHQ1amcr?=
 =?utf-8?B?SkdXdVpMNGR0RkJ5TkZqMHQzZnlBSzRkZVJ5RWFBbk9GZGI5R0MwT3NObmxs?=
 =?utf-8?B?a1hnQk1xMjB6a0llT3dFeVhDNE91YjVPV1NXOVF3QjJNbElOODFWZ0FnanpY?=
 =?utf-8?B?WXdrZ0d0bmdrUC9kTVFLYVMrOFFqUHF1MVFkdENTU3IwZCswOThpZnRVTnNx?=
 =?utf-8?B?bGt2K280c29lc29hS0VyTlFRYms1TUhoZDQ2Z29uRjIvY1RrTE53MDlZNU03?=
 =?utf-8?B?bWs2djZFaitYb1FkdSswUW0vNkVwVzJPNHEzVEJWRktETXNuMExPZjhsbzNI?=
 =?utf-8?B?cVdkZWFUUHRvZ2VIM3o3bmN3bU5yUTY0Z1o0b2o3bmVkM0dtUDN3MmVjaFQ3?=
 =?utf-8?B?Z2JFaEhVZW8zb2JsWmJ5eGkxRDNST3Npb2gweURIU2liQmJCWlViV1Q4NFlm?=
 =?utf-8?B?NDljUWZWdDBzMWhWWWNVUjdPM0hSMUVuTS9LaUEybUxrQWYwaGl1c05BVUNT?=
 =?utf-8?B?Sm1qU0NmWnB6cnhNV3d2TDFwY0V3a3FMazE4Y2RIY3lvWlJKWDc5cXVZc3V0?=
 =?utf-8?B?VUpnOWpBUERFRkpQcGdybUkwZVQwQ1VmcnZ5UzNDS0dobkRodXNOMWFiNVRa?=
 =?utf-8?B?WUpUa280dTQ4Q3FjQlR6V2NjaEtYZEFOdUczSlRURnR4Rkx1SWF0ZC9DWEIr?=
 =?utf-8?B?UkNZczhMT0Q1RXYxb1NKNkFGWk5CTm1mcmVpeW84WVdlMXNRaTkwZUpiekl4?=
 =?utf-8?B?TWZYSm9nbHZvS09oOEJzcXlobEp2Q2g2K3RrN09zanBsZG12K0FhTEZ4YkFM?=
 =?utf-8?B?TkhxWEhadkxxYkFLUitlaStORmJmelVHY0Rjdmg1VzhRWEhaeFR0L1JWQzRx?=
 =?utf-8?B?amJubWhVYkdDY2Radm5Xbng1QXZnZ2RkZjUyRjZyUWI2NUIyajRKbEhOOERC?=
 =?utf-8?B?bFNObFRJamx3NHF4dURuRHZGODBhc3UrZmxiMGFLVFdHMjB4VGs1OTdFV0du?=
 =?utf-8?B?c3h5Tmxuc0FSaSs5cnN5SUFLTS92Mkw0ZE5mQlVYZlZwY3I3dXBrZDIrSnp2?=
 =?utf-8?B?VDJCMVl2WnJmQytld0ZjRXh1NGQ2Z0dDSHcyTVMyRjFWckpaaFNWTGhwUTRD?=
 =?utf-8?B?aGVnVEFxRUV3Q3l6QU8zUUNBUldURkx0K2t2TG9FVlVlM1UyRE5xZDU1QlFR?=
 =?utf-8?B?Um1nTENUOUJnbGZ6WDZvQ2plbUQ4Tnc1ZkN0RnBtbWlzYktIbGhVZ0U1ZC9R?=
 =?utf-8?B?RmMvTFRZZ1d4OGNKVjhqVnZ4Y09La1JERjhNc1QrNC9NTDdmQ0xPNXBYT0NU?=
 =?utf-8?B?NGVmZmVMK0d6VElkVXJoQTFTUFF6VmUwbWF6Ry95TnUwdVhCWXV5YjV3MVVv?=
 =?utf-8?B?QnRCOGRQTCtlZzNBbnl3bUlyWUo3dWRGQ2R5MXFrYVJJNi9ZVVluZm5lUTBu?=
 =?utf-8?B?SXoyRDlMRFluTWdvQ0tyR253VUx2N2M0OHFPTFBReHlTM2hpYXpsSExiUCtk?=
 =?utf-8?B?ZHJoTjhWTHA4NWs1WHlWcmE3QlFnNk0yNnl2bzJBdGZMLzNwdnpvVjF4M3h2?=
 =?utf-8?B?S2xjQWM3NUdZKzVIbmFqcXdoOTRHMDFQK3kwc0NlWGp3cTFZU1JpYUR1RWxh?=
 =?utf-8?B?NXFWaG1jZzJZNTdpTW14SkFMa2VPRmp3SldZY1d3djJlb1hSeXY4TFphN1dG?=
 =?utf-8?B?N3g0RTFmZHMvb2RsSU91Z2w2b0ZLVktNUC9nblpHc25wOGdldU5MNnkraUJL?=
 =?utf-8?B?V0xoOWFHdk9vQ1h6VWtrblh5cWdsclVrRGtIbWU5RXh1UVlBemwzbE9telc5?=
 =?utf-8?B?OTZ4SHBBRms2RjVoS3U0T0dCakQxaStrVWZxaGVlcXFxdlFkTC9HUnNxMDNN?=
 =?utf-8?B?bkhPdjlZQndLWWhaYkRVY2lzOUU3aTVPaWhBcFY4OWZ0TkN0MlFPQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfde18d-cdc8-47b5-6068-08de52a73b9d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:25:34.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dg07sMtyLcgdPT1SGG0gZF/TPgF+lCSCspiXGPX5cc0z+XW5hgptn0fVXv4jiZug+phQNFNzbgshClncWvIu3C+Rzp22mFJwJqGm3FUEoxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:25:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8508

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/kernel-dev/common.rst | 107 ++++++++++++++++--------------------
>   1 file changed, 46 insertions(+), 61 deletions(-)
> 
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> index 2142d31c0..ba3a09942 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -44,25 +44,15 @@ image and ready to make modifications as described in the
>   ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
>   section:
>   
> -#. *Initialize the BitBake Environment:*
> -   you need to initialize the BitBake build environment by sourcing
> -   the build environment script (i.e. :ref:`structure-core-script`)::
> -
> -      $ cd poky
> -      $ source oe-init-build-env
> -
> -   .. note::
> -
> -      The previous commands assume the
> -      :ref:`overview-manual/development-environment:yocto project source repositories`
> -      (i.e. ``poky``) have been cloned using Git and the local repository is named
> -      "poky".
> +#. *Initialize the Build Environment:* Follow the :doc:`/dev-manual/start`
> +   section of the Yocto Project Development Tasks Manual in order to have a
> +   ready-to-use shell that can execute ``devtool``.
>   
>   #. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable
>      is set to "qemux86-64", which is fine if you are building for the QEMU
>      emulator in 64-bit mode. However, if you are not, you need to set the
>      :term:`MACHINE` variable appropriately in your ``conf/local.conf`` file
> -   found in the :term:`Build Directory` (i.e.  ``poky/build`` in this example).
> +   found in the :term:`Build Directory` (i.e.  ``project/build`` in this example).
>   
>      Also, since you are preparing to work on the kernel image, you need
>      to set the :term:`MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS` variable to include
> @@ -79,7 +69,7 @@ section:
>      patches created for the kernel image. You can use the
>      ``bitbake-layers create-layer`` command as follows::
>   
> -      $ cd poky/build
> +      $ cd project/build
>         $ bitbake-layers create-layer ../../meta-mylayer
>         NOTE: Starting bitbake server...
>         Add your new layer with 'bitbake-layers add-layer ../../meta-mylayer'
> @@ -103,7 +93,7 @@ section:
>      :term:`BBLAYERS` variable in the
>      ``bblayers.conf`` file as follows::
>   
> -      $ cd poky/build
> +      $ cd project/build
>         $ bitbake-layers add-layer ../../meta-mylayer
>         NOTE: Starting bitbake server...
>         $
> @@ -157,7 +147,7 @@ section:
>      set to "qemux86-64", which is fine if you are building for the QEMU emulator
>      in 64-bit mode. However, if you are not, you need to set the :term:`MACHINE`
>      variable appropriately in your ``conf/local.conf`` file found in the
> -   :term:`Build Directory` (i.e.  ``poky/build`` in this example).
> +   :term:`Build Directory` (i.e.  ``project/build`` in this example).
>   
>      Also, since you are preparing to work on the kernel image, you need
>      to set the
> @@ -175,7 +165,7 @@ section:
>      patches created for the kernel image. You can use the
>      ``bitbake-layers create-layer`` command as follows::
>   
> -      $ cd poky/build
> +      $ cd project/build
>         $ bitbake-layers create-layer ../../meta-mylayer
>         NOTE: Starting bitbake server...
>         Add your new layer with 'bitbake-layers add-layer ../../meta-mylayer'
> @@ -198,7 +188,7 @@ section:
>      :term:`BBLAYERS` variable in the
>      ``bblayers.conf`` file as follows::
>   
> -      $ cd poky/build
> +      $ cd project/build
>         $ bitbake-layers add-layer ../../meta-mylayer
>         NOTE: Starting bitbake server ...
>         $
> @@ -210,8 +200,7 @@ section:
>   
>      For simplicity, it is recommended that you create your copy of the
>      kernel Git repository outside of the
> -   :term:`Source Directory`, which is
> -   usually named ``poky``. Also, be sure you are in the
> +   :term:`Source Directory`. Also, be sure you are in the
>      ``standard/base`` branch.
>   
>      The following commands show how to create a local copy of the
> @@ -237,8 +226,7 @@ section:
>   #. *Create a Local Copy of the Kernel Cache Git Repository:* For
>      simplicity, it is recommended that you create your copy of the kernel
>      cache Git repository outside of the
> -   :term:`Source Directory`, which is
> -   usually named ``poky``. Also, for this example, be sure you are in
> +   :term:`Source Directory`. Also, for this example, be sure you are in
>      the ``yocto-4.12`` branch.
>   
>      The following commands show how to create a local copy of the
> @@ -334,8 +322,7 @@ Modifying an Existing Recipe
>   In many cases, you can customize an existing linux-yocto recipe to meet
>   the needs of your project. Each release of the Yocto Project provides a
>   few Linux kernel recipes from which you can choose. These are located in
> -the :term:`Source Directory` in
> -``meta/recipes-kernel/linux``.
> +:term:`OpenEmbedded-Core (OE-Core)` in ``meta/recipes-kernel/linux``.
>   
>   Modifying an existing recipe can consist of the following:
>   
> @@ -430,9 +417,8 @@ Although this particular example does not use it, the
>   :term:`KERNEL_FEATURES`
>   variable could be used to enable features specific to the kernel. The
>   append file points to specific commits in the
> -:term:`Source Directory` Git repository and
> -the ``meta`` Git repository branches to identify the exact kernel needed
> -to build the BSP.
> +:term:`OpenEmbedded-Core (OE-Core)` Git repository branches to identify the
> +exact kernel needed to build the BSP.
>   
>   One thing missing in this particular BSP, which you will typically need
>   when developing a BSP, is the kernel configuration file (``.config``)
> @@ -677,7 +663,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
>   
>                 ERROR: Taskhash mismatch 2c793438c2d9f8c3681fd5f7bc819efa versus
>                        be3a89ce7c47178880ba7bf6293d7404 for
> -                     /path/to/esdk/layers/poky/meta/recipes-kernel/linux/linux-yocto_4.10.bb.do_unpack
> +                     /path/to/esdk/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb.do_unpack
>   
>   
>         You can safely ignore these messages. The source code is correctly
> @@ -688,11 +674,11 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
>   
>      #. *Change the working directory*: In the previous step, the output
>         noted where you can find the source files (e.g.
> -      ``poky_sdk/workspace/sources/linux-yocto``). Change to where the
> +      ``build/workspace/sources/linux-yocto``). Change to where the
>         kernel source code is before making your edits to the
>         ``calibrate.c`` file::
>   
> -         $ cd poky_sdk/workspace/sources/linux-yocto
> +         $ cd build/workspace/sources/linux-yocto
>   
>      #. *Edit the source file*: Edit the ``init/calibrate.c`` file to have
>         the following changes::
> @@ -758,7 +744,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
>      your working directory to where you modified the ``calibrate.c`` file
>      and use these Git commands to stage and commit your changes::
>   
> -      $ cd poky_sdk/workspace/sources/linux-yocto
> +      $ cd build/workspace/sources/linux-yocto
>         $ git status
>         $ git add init/calibrate.c
>         $ git commit -m "calibrate: Add printk example"
> @@ -784,7 +770,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
>      command from your :term:`Build Directory` in the terminal
>      set up to run BitBake::
>   
> -      $ cd poky/build
> +      $ cd project/build
>         $ bitbake core-image-minimal
>   
>   Using Traditional Kernel Development to Patch the Kernel
> @@ -868,7 +854,7 @@ Section.
>      :term:`SRCREV` statements similar
>      to the following to your ``local.conf``::
>   
> -      $ cd poky/build/conf
> +      $ cd project/build/conf
>   
>      Add the following to the ``local.conf``::
>   
> @@ -888,14 +874,14 @@ Section.
>      committed, and the ``local.conf`` file pointing to the kernel files,
>      you can now use BitBake to build the image::
>   
> -      $ cd poky/build
> +      $ cd project/build
>         $ bitbake core-image-minimal
>   
>   #. *Boot the image*: Boot the modified image in the QEMU emulator using
>      this command. When prompted to login to the QEMU console, use "root"
>      with no password::
>   
> -      $ cd poky/build
> +      $ cd project/build
>         $ runqemu qemux86
>   
>   #. *Look for Your Changes:* As QEMU booted, you might have seen your
> @@ -959,14 +945,14 @@ Section.
>   
>         To build ``core-image-minimal`` again and see the effects of your patch,
>         you can essentially eliminate the temporary source files saved in
> -      ``poky/build/tmp/work/...`` and residual effects of the build by entering
> +      ``project/build/tmp/work/...`` and residual effects of the build by entering
>         the following sequence of commands::
>   
> -              $ cd poky/build
> -              $ bitbake -c cleanall linux-yocto
> -              $ bitbake core-image-minimal -c cleanall
> -              $ bitbake core-image-minimal
> -              $ runqemu qemux86
> +         $ cd project/build
> +         $ bitbake -c cleanall linux-yocto
> +         $ bitbake core-image-minimal -c cleanall
> +         $ bitbake core-image-minimal
> +         $ runqemu qemux86
>   
>   
>   Configuring the Kernel
> @@ -1013,10 +999,10 @@ environment, you must do the following:
>   The following commands initialize the BitBake environment, run the
>   :ref:`ref-tasks-kernel_configme`
>   task, and launch ``menuconfig``. These commands assume the Source
> -Directory's top-level folder is ``poky``::
> +Directory's top-level folder is ``work``::
>   
> -   $ cd poky
> -   $ source oe-init-build-env
> +   $ cd work

Why suddenly work? SHouldn't it be project?

Comment to follow below. Be aware that on Thunderbird, everything below 
here got collapsed automatically so you may want to expand :)

> +   $ source layers/openembedded-core/oe-init-build-env
>      $ bitbake linux-yocto -c kernel_configme -f
>      $ bitbake linux-yocto -c menuconfig
>   
> @@ -1063,7 +1049,7 @@ the ``.config`` file would be:
>   
>   .. code-block:: none
>   
> -   poky/build/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18...
> +   project/build/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18...
>      ...967-r0/linux-qemux86-standard-build/.config
>   
>   .. note::
> @@ -1279,32 +1265,32 @@ Here is sample output from the :ref:`ref-tasks-kernel_configcheck` task:
>   
>      ---------- CONFIG_X86_TSC -----------------
>      Config: CONFIG_X86_TSC
> -   From: /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc-cpu.cfg
> +   From: /home/scottrif/project/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc-cpu.cfg
>      Requested value:  CONFIG_X86_TSC=y
>      Actual value:
>   
>   
>      ---------- CONFIG_X86_BIGSMP -----------------
>      Config: CONFIG_X86_BIGSMP
> -   From: /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
> -         /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
> +   From: /home/scottrif/project/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
> +         /home/scottrif/project/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
>      Requested value:  # CONFIG_X86_BIGSMP is not set
>      Actual value:
>   
>   
>      ---------- CONFIG_NR_CPUS -----------------
>      Config: CONFIG_NR_CPUS
> -   From: /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
> -         /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc.cfg
> -         /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
> +   From: /home/scottrif/project/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
> +         /home/scottrif/project/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc.cfg
> +         /home/scottrif/project/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
>      Requested value:  CONFIG_NR_CPUS=8
>      Actual value:     CONFIG_NR_CPUS=1
>   
>   
>      ---------- CONFIG_SCHED_SMT -----------------
>      Config: CONFIG_SCHED_SMT
> -   From: /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
> -         /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
> +   From: /home/scottrif/project/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
> +         /home/scottrif/project/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
>      Requested value:  CONFIG_SCHED_SMT=y
>      Actual value:
>   
> @@ -1461,9 +1447,9 @@ on a future, mutually-supported kernel version.
>   To help you use your own sources, the Yocto Project provides a
>   linux-yocto custom recipe that uses ``kernel.org`` sources and
>   the Yocto Project Linux kernel tools for managing kernel Metadata.
> -You can find this recipe in the ``poky`` Git repository:
> -:yocto_git:`meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> -</poky/tree/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb>`.
> +You can find this recipe in :term:`OpenEmbedded-Core (OE-Core)`:
> +:oe_git:`meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> +</openembedded-core/tree/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb>`.
>   

suggestion: We could also simply make "linux-yocto custom recipe" a link 
instead of needing two sentences to convey that information?

>   Here are some basic steps you can use to work with your own sources:
>   
> @@ -1600,10 +1586,9 @@ Linux kernel sources, if you need an external kernel module, the
>   ``hello-mod.bb`` recipe is available as a template from which you can
>   create your own out-of-tree Linux kernel module recipe.
>   
> -This template recipe is located in the ``poky`` Git repository of the
> -Yocto Project:
> -:yocto_git:`meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> -</poky/tree/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb>`.
> +This template recipe is located in :term:`OpenEmbedded-Core (OE-Core)`:
> +:oe_git:`meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> +</openembedded-core/tree/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb>`.
>   

suggestion: Ditto.

Cheers,
Quentin

