Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12595D58D77
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:11:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.71])
 by mx.groups.io with SMTP id smtpd.web10.25293.1732558296116476951
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 10:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hVTAarly;
 spf=pass (domain: cherry.de, ip: 40.107.22.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWti+d/NNZCVio9Ny2Oigi2lT5T1aRlGt0R2IrYlpsZ4OGKcOFcCjWmKFz7D35h/Y0kgo0du4h7EKo1jd2VHhImI5yONalsND+RuecVBxmlD/xxXJ7UFCCBnlJzqlK4InRaUCq/tpQQ3uKteSS9DnBEHyrpOZ++yYz3tG+0Rbps1AoewmVtQ/CLQbbvWcr5vcBiYK4VfaaaLP3PMu4Z6TN7+hTmsqyINcWxaFDVy/X9nyeHFo9G5EnAeSKmSxnQB3l5Wk0jxuuE9VLP0PqtGqbGkYQfH+6mIAUeugcSS1UKRq0Geeo7INHGEMGraBd4jXOjLbPZ3cN4p/TmNcr11KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFvcc596TsiumhXMdDehrYDfkQ0+bz61eQZx0m2305I=;
 b=auEFSJjCpNMgpABf+8d2sEtSsvdkvqEP25pBFmNPkw4pNPaDN95UosrApmTi+gcLexYyjBrC7ERpwknIRE0DZe2feD+1t9D+p6drcZA9tYbjfKQSbA5YY+l35vD679eW71yNfAzdbeeGvXVwaADRjTwWI1wki2QptHHXVMCZekvWFJ5mNdhOcs+4LnEGj5I4OZFlolpz/fwGxkPh4L/6IDS8oPa1gYMJ4HYRKKsSSRWSOnYgB4pON3wLjZ9Rz4fSxi9W6xnZ2dRkvix1JbhwWXf2j5FxZz1hxBPBbtroujpMGxZegW3KcGDlrfxc9KhFdFQ/Mbe1jOrwalxX23ccGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFvcc596TsiumhXMdDehrYDfkQ0+bz61eQZx0m2305I=;
 b=hVTAarly+sNOiv1q2ACyfpki4rx8MrFb8EPBl3RZyD4trus33AvbwKIlDKqIvf2KocfmtelrgX9xoBhne47H0wiqs7jljQDnKnnP96dNsxV5C5ct06q3Hz6+i+NKGtbpFLOdzazCLqAq0lTp8vWCIDCPCHgps2r/rYADN26ywG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB6941.eurprd04.prod.outlook.com (2603:10a6:803:12e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 18:11:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 18:11:30 +0000
Message-ID: <fd1c29ef-20f8-49d1-8c72-92359a16b894@cherry.de>
Date: Mon, 25 Nov 2024 19:11:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 4/5] system-requirements.rst: add
 dependencies for pdf builds
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-4-50e267ae4123@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241120-update-doc-deps-v1-4-50e267ae4123@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: abce764c-fc59-43f8-d744-08dd0d7c9662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bVIxQ3ltczhCa05aeTVlTWtzcFZJNmNMUkNIVG56TG40RzhyM0JFdVVwSzda?=
 =?utf-8?B?LzRTaW1QSXV2YzlDNG1FL1o0clRqeFprRE51bU02ZGZIeWd0Rm5jZjRReWht?=
 =?utf-8?B?Q0VJeTBmSFk1YVlnMXcyVmhCUWIyZ0ZMdVVrcHRYQ2xNRFBIc3Z1U1BpZmh6?=
 =?utf-8?B?Yy9DdTd1b1l3eWx2c3hvZlVDT3ZWSHB4ZFRUaEVnaHN2SXdoMitLaFp4VFB3?=
 =?utf-8?B?UkZMVGx5N0VIOUwvOEhYYVI4elp3cCtzbTNZakZnRHNYSU53OXBlNlUzTXZa?=
 =?utf-8?B?UEV3Nm1VNkRvSDh1WnhRcmZ6ZlFiQ2VEa01sc3RKREM2bndOL3dMazZyUGds?=
 =?utf-8?B?dnp5d0FSMWlBME5vVUFZMGVza2xvNVQ0eWNrRUswMFFlWFZNcFQrLzVGYjlL?=
 =?utf-8?B?QzhKREJrdHdJQ0ZQQTVlYlF3WWJzUmRQaXExNzMrSHdHRHE3YjFJblFZZEQz?=
 =?utf-8?B?SFlXY0NWdXFLejBEODRNL1lhYjlIQW0zWFk5NHlBVjFwRW9NRllKMEhYTFFY?=
 =?utf-8?B?VEhLclpMbERKRlBaZHE3ZnNSY2hCTXZRNWNxYlZEblZHUnVRbFN1cm4wMnNj?=
 =?utf-8?B?Zy80VGxHYWp5aVMvYnpmNTFQUnVYb0xBS21lcUx4VTd6M05zWDZGWnMrN0pi?=
 =?utf-8?B?alJ4ZlF5Z2x1ZlJqa0l2UCtKazh0UzZycTE2OEI0Y0x3ZEhURXlxdGJBaG10?=
 =?utf-8?B?TmgxOXlQSXI3Z3hBSUxXaU02K2x6bTNYVGd5ZDc0bHZ1TjdSVTlvR0J3Q0tr?=
 =?utf-8?B?WFNleTlaV0ErUWZzTjViWjdCdGp6aHNOVElLMFRmTzN0aHMxVmtuR2RRZFlE?=
 =?utf-8?B?Mm1kemFZVmJwR3FyczFqTkNTV2k1TXlpYU41b1JSekU5NmluU05HekdxaWRX?=
 =?utf-8?B?WTNtN2FNNis1QmQzTlhnenEzNGsyaFAyd0kxR0xGMUU4UVFnajFueC9uRm5r?=
 =?utf-8?B?cTNRQjN1OC9PQWc4Wm9hWGkvbjNEajVPTzFWa3R4bGpaSkkxZ1hnVzBpTmlH?=
 =?utf-8?B?VFd2QXRyUGYyaXBBeWlWOUtzcXdKS1lCRlp5ekh5UjZob1dVWGJoTFhzd2lB?=
 =?utf-8?B?VWNqaS93VlNjQlJtME5kTWpMK2haNG1vdlJSMU1zSGVzY1l2T0NHM2c3TVFn?=
 =?utf-8?B?T2x1TFE2WmNhVmVLeGU2b2orRkZwWko4Q05zQ1o2cndxb0tGMVMreCt4YUQ3?=
 =?utf-8?B?ZC9HUVlOZUV2QVA5Q2k3UTJSdGtMTzJrZjc2MzVabnBlZWRoN2o5dHhEVktl?=
 =?utf-8?B?RFF2dFdrczVzT3c1cDllZnAvZjQxa0xtb0pmWCtLWG1EUDVWNTdINEdla3hU?=
 =?utf-8?B?bnhzRFZtU3VyWnJWVmVtMzgwUld5ZWxiN01ORVVJK2YwWEZtanVkTXE4cG93?=
 =?utf-8?B?TGlzeDh5WUwzSFloZFNxeWRIZ05FazRYNUZlUXBIeVJiRnBOVWpuSEtuRlVK?=
 =?utf-8?B?RkRFcXdkNkdLeVIvdk0yMnlGcnZSSGhkZzd2ZTFhQ3JobkJvMjV3NDZvci9B?=
 =?utf-8?B?SHprbWgvZjRlZFdNVFBNS1RQSTJVRXlwYXA3aEpyWjBHbHNaSXczR01MM0lv?=
 =?utf-8?B?OU5CTmRaK0psbE01VFEyT2Q0Y3BSWUZVTHhLZ0dBUnpwaGRlR3Rwc2daS0t0?=
 =?utf-8?B?cGE5OWxEbmtRRUkxbWo5RDRoYjdaVlAwa3BRL250M08wZkFGSVRZZG9LeVFG?=
 =?utf-8?B?QzFUUlAxVzRsTmx5OHk4RWxmcE5sM3dyc1JEOWcvMTZnNWVxRjQ2c09EVzlk?=
 =?utf-8?B?aHp1SGJwWkpramp1Z2djcFRxMWg3UDNCZUx6NENndEI1N05DWXhLUU5rMmhV?=
 =?utf-8?B?YkpMdThqVy9tSHl2MGY1Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1I2blZ0a1VKNm0vUUNEU2dmdXNmMW11M2NXTGRwSEJmcmgrMEhMejBPNGI5?=
 =?utf-8?B?bi9XN1ovYUpsMlBMY1graW5LNWxVYmZJZmFrWmVBeGNTZTlTc2VLZE4yM1hn?=
 =?utf-8?B?YitROEJxY0RSRnAwY3AxelBuMGdMdUlCL1ZmUk1FQitGUDgrbFhRYWpXYTZZ?=
 =?utf-8?B?a281UU5VNHNTY09aTHIzYWRIYkdzdW1nVTBEd1B2OHp6U1FDVGpseWNyTmsv?=
 =?utf-8?B?RkN6N2hJSFg0WVN1OHNHeU1PVVcrKzZkdi9sMmFndk9vRmRscjByQjQ1bnpV?=
 =?utf-8?B?dVh5Nk1nL3N4cUhzVGp6VXE2T0hDcm53dk9hUElLL2RCeGtNS3pQSGlaYlBz?=
 =?utf-8?B?MHp4NjhXUzZENG1BNUdaZUhwZVdYVm53K1V4SExYdFlEMmdLRERBbGJ2bFpr?=
 =?utf-8?B?ajVlUWV4YTJvRUNxNDdsVW9qYmJQZWFkZlBDQVJDVnd2N3FQeFpDaFZEZDR4?=
 =?utf-8?B?djNvL3NnY2I4WW1Zc29UWTBPWlpDV0huWjdkRUhSblZzSnplMlJxRS80UG1j?=
 =?utf-8?B?bDZKdWJYNk5uTEdaVXlOczFJK2p6TEZiMEVHYlFTeW9zbG02cTRQVHh2cTZ3?=
 =?utf-8?B?NVRzemhwSXc4Rk5tOVk4UXRNQlZ2R25Pb0dtUDRreTRyUVNRV05CNFJXYm1v?=
 =?utf-8?B?cjJDS3RqbzNwWnRBN1I2ZmxvVkZ5WWd1bHAwSElSeFlJRXpPZ0lKSGxnQ0li?=
 =?utf-8?B?OTltcEhPdU5uNWRRcFBPUTlFd0JsdnBDMEpodWh2aTN2Znd6cTNXOUFteVc0?=
 =?utf-8?B?S1V2YnE4aFlFQnRLcHc3NFVZV3hpdVJwbXRnbENmMDNtS3lQZm9PQWZMTEJF?=
 =?utf-8?B?SDNwRzRERkVXbWtVdXlvdWh6dVJhYTFYNlVZcG5hUTFXNzR3YTk3TjlKKzQ4?=
 =?utf-8?B?SStDMi9hemFPVittN1VZNEY5RFRLVWJoWVI0ZXlPZ1VUNE55ZTg0Z3RUc2gz?=
 =?utf-8?B?eDNNdExnd2FTQ3h3UFdwY1VaNXRUNHJlczZXcGUwb25yQWcvTE5YVFd1ZlZi?=
 =?utf-8?B?RHBRUmtwZFdhWmdudFp6Vmh6V0k3bk9aTzk4aWZnQXVuRXZ1WThsQ1ZIYm03?=
 =?utf-8?B?WUVvbnRWM2Y3R2lTdG5DNlFpbGl0eHNxT3JnaTVHNzFTK0NEM3BKcWQ2ZTFG?=
 =?utf-8?B?L0liOHp6cXcyMXM3Z0M4YmRZdTJHZ3RsWW9wRlpPbWlRTm5JWjd3SFJja2k0?=
 =?utf-8?B?ZFVRTGtrLzhPOU5zektxTktzRnF1L2Uyb1pKNi8yVmsyVHpZbjVmKzNCaDJ1?=
 =?utf-8?B?Qks5bWtoZXRSeVp1YzBBQXVHTVQ3c2FPNGhMV1BJckRWcHNzWHk0b0dyZ2s3?=
 =?utf-8?B?NDVvS0VTejJrdytlRERSdHJ2NnRlWExxMG9JMjBiekVZNDAwb0V1cFQ5RU55?=
 =?utf-8?B?cXhJMko5SDl5U0dHWGlEY20yZjZRazFvcEJZaFRHaXE1eldtdGtFdjhXcy9R?=
 =?utf-8?B?V3RUSWYwQ2tGTnU2TDhSdkUxaVRMaDhZWG9JaHg3YmlYWERLWFZIT0E2c2Fq?=
 =?utf-8?B?Ui9wTUFqUnhsR01obGI2bSsrT2RTRFhJYW1Ba0VTNGV1T1Z6RWhOVWhwaE9r?=
 =?utf-8?B?ZkJCNnlmRjJscHptRnJ1Qk5BSklwWFRKMEM2bmZQU0tpb0ErZnpkNERvUEhO?=
 =?utf-8?B?RmpOUkdQT1hrM0tQMDFJamg3SUJwMWtSZFp3T2Y0NkJIVWUzRUs1Um8xcG11?=
 =?utf-8?B?am9tVEZWWVFNcG9FUy9BemF0UFVkWXcxclVmenFCL2JoS3ZxVTFRSS81RlRi?=
 =?utf-8?B?MURjQlpadEY5bis3eTkwNDdjanhUMGthelVWeWtSMk16WDBTRERtdlVEdTdl?=
 =?utf-8?B?ZEJVNDdPYmllZDFtZG5TZzhpVVZyblNFLzFVaEVPYVRpY2pQQVFQdjhvZk1Y?=
 =?utf-8?B?ZHhTWXFmVDJkMGxoTmdUWE9kZXRUWkxVUk5naDdKMzA0VlNBa3NSVmVXbXcx?=
 =?utf-8?B?a1Z4eWFpd0RHdllpWVRpODg5WUhPREZKWUhZV3krVnYzMHBFZmNuRkhOcUp5?=
 =?utf-8?B?RjZhMlcxR0NqOGt2RmRWd1d2WDZMcmdTcXc2RkJHb3Z2WDU4MzZTUzRMMTN3?=
 =?utf-8?B?cnI4blRTOXVUZEZkdmlOaGo0SkFyeWs4RlRXc2FIT0N0ZGdTRit0OWJVTmpm?=
 =?utf-8?B?S2JwMVAxVDNmVEdMdHByTDVSWEQycFM3Zm5FYTlsVlJUUEJ2Z0pobmF4cGE2?=
 =?utf-8?B?YkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: abce764c-fc59-43f8-d744-08dd0d7c9662
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 18:11:30.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdFPxqmF0sSnY/eI5W9cjwlbSNArbefYRism9un6N58H5S8+KlH86hipXJOKHm3SJD+bUAqu6lZ8P7oLaxxjs3CV2YCFgQ6nTOqYgs88ttw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6941
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 18:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5807

Hi Antonin,

On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
> With the recent changes from commit
> bd6265ca323fac547a197bb516dc4a9ef3897508 ("doc: Makefile: add support
> for xelatex"), the list of dependencies needs to be updated.
> 
> The initial list of dependencies was made for Ubuntu/Debian, and the
> packages were translated for the other distros using pkgs.org.
> 
> Add them separately from the rest of the dependencies as they pull a
> _lot_ of additional dependencies (for latex).
> 
> Notes:
> - Fedora/OpenSUSE do not have the "lang-all" texlive collection, so
>    install all available languages.
> - AlmaLinux does not seem to provide texlive-collection-fontsextra,
>    texlive-collection-lang*, and texlive-collection-latexextra, so add a
>    warning about that.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/poky.yaml.in                       | 79 +++++++++++++++++++++++-
>   documentation/ref-manual/system-requirements.rst | 27 ++++++++
>   2 files changed, 105 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index d0c8973db27340838f78f560c01d44fb67771b25..d95b73c74ad7979609c6e7f4e1be5343968da743 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -67,8 +67,17 @@ UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
>     python3-saneyaml
>     python3-sphinx-rtd-theme
>     sphinx
> -  texlive-latex-extra
>   
> +UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF: >-
> +  fonts-freefont-otf
> +  latexmk
> +  tex-gyre
> +  texlive-fonts-extra
> +  texlive-fonts-recommended
> +  texlive-lang-all
> +  texlive-latex-extra
> +  texlive-latex-recommended
> +  texlive-xetex
>   
>   FEDORA_HOST_PACKAGES_ESSENTIAL: >-
>     bzip2
> @@ -131,6 +140,35 @@ FEDORA_HOST_PACKAGES_DOC: >-
>     which
>     texlive-fncychap
>   
> +FEDORA_HOST_PACKAGES_DOC_PDF: >-
> +  latexmk
> +  texlive-collection-fontsextra
> +  texlive-collection-fontsrecommended
> +  texlive-collection-langarabic
> +  texlive-collection-langchinese
> +  texlive-collection-langcjk
> +  texlive-collection-langcyrillic
> +  texlive-collection-langczechslovak
> +  texlive-collection-langenglish
> +  texlive-collection-langeuropean
> +  texlive-collection-langfrench
> +  texlive-collection-langgerman
> +  texlive-collection-langgreek
> +  texlive-collection-langitalian
> +  texlive-collection-langjapanese
> +  texlive-collection-langkorean
> +  texlive-collection-langother
> +  texlive-collection-langpolish
> +  texlive-collection-langportuguese
> +  texlive-collection-langspanish

I'm wondering if we really need all languages or if we were too lazy to 
figure out which ones we actually need.

Also, you should be able to avoid listing them all by using 
'texlive-collection-lang*', dnf should be able to handle that just fine.

> +  texlive-collection-latex
> +  texlive-collection-latexextra
> +  texlive-collection-latexrecommended

latex-extra already requires latex-recommended which already requires 
latex so only the former is necessary.

Cheers,
Quentin

