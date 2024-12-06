Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B384DE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 14:00:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web11.37208.1733493619781282919
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 06:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=k3dJ5CcN;
 spf=pass (domain: cherry.de, ip: 40.107.22.78, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXNwPxLKFyQHkfHDnUQXBCe6MwPHtg23svjIB2tUWdfhQPzmDcka/BiU3dF09WsShOLbgV6rv9dzlU/AcIQzJSSgr29OwJUYRQumEmUhEtiQVkkuwjMNvnwR+ErZbcETs3dgnTT7aXUiEuGn5rMNzwPurc85KPO+Tte3tGUNOGHWvI3enViJkx1m88D8atWUKyIL/hM3LJkI2dMP7dVsetX+un6SMiKOUjv6jOjwzq3try6xlRkGvzSbA1MEejL3a1w/srpOoLaHVtR1tTjqeJyHP5E3wx1HqYQOfVuUCTllG0sP4VPoK1ihf+9c9kv2Hvl2bpfQMmjDA/QYijf+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRS6mXQNEfYjaHzWvd061ZtcJjA952Qt69Xdc2l6U0A=;
 b=ibcZME/fAEsnKUzp4w4pKh/UFjZr+jiW7y5/a1Qv2F6Di8Q/OMGGqj0f0eAenCRASMB9DivWoCx7FLAahj6iy3l3FEzJ7O4f+7aSwNl4lllw4AAIBp08stVm1mklR5eiXpJJqLxsmdLm3H5F54SjrKXwCb5zO2IQzXFgmW2Ml8Azoy/HGRQdtCLVBsUhOOzodM7NAMV1DYnySXzQOBS4hlXOBzk3vkM0r3m5Y0bjJlsEn6p5OYZLkNAgGpQnJkTtP+x1nFbxAECwUjGgBR8kDB7W6qk/aejIopMfHXflF+BY8nGH9QKWUQHfN8aSTm/pDPzpebarN/i0FTqHELObdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRS6mXQNEfYjaHzWvd061ZtcJjA952Qt69Xdc2l6U0A=;
 b=k3dJ5CcNaqKxM42epeEvTefz+TZzr1m0/kUr8VlmtZMvb89ntafm4yt7ZR0KsRVBPoK3bVvbc66rHNgGGeEA2PxcjFXlRw2BJUmxJgNyua1ZN/EYj6zZxhV+PuFf2DXAgNBuwwpa6CWPF5jvvrV2cFSbNNc3YKpWL431Z2S3gME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM8PR04MB7810.eurprd04.prod.outlook.com (2603:10a6:20b:237::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 14:00:13 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 14:00:13 +0000
Message-ID: <f6b0c418-bd94-4fc2-a58d-ec7634926fe1@cherry.de>
Date: Fri, 6 Dec 2024 15:00:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2 5/6] system-requirements.rst: add
 dependencies for pdf builds
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-5-1d9b4063476f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241204-update-doc-deps-v2-5-1d9b4063476f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::9) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM8PR04MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b20d69b-1e2c-4535-1e88-08dd15fe4df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXZWeDF3MWgxTnJOb2gzRVB3ckRobDBwSEpJNTRSYjk3dlNrTkJrWE1zdUNL?=
 =?utf-8?B?dDFZRE9PWlpVUHdMSUE1OTBSdER4SEhtSFc2OXZzYVU1bExYMDRkTFBQK0E4?=
 =?utf-8?B?cHJ2US82NzBWTDRTWHplc0VtUE0zZEF1LzB5OVhUcXVCVUQ3MmYyaG4rS0hi?=
 =?utf-8?B?U2hVZnlWdnlVRmJ4WGVEUVhLL2xuU3ArVytIeTBzRDhFOXBEL0EwLzNUTWpR?=
 =?utf-8?B?cEFkdHowd0pNMTNvUnloWjMwVGN3L1ZFV09Md1pxT2lSZWQ0eFBnakY5bXcz?=
 =?utf-8?B?b3hRNVFmd2Q1bUZlTi9JbStScE12Y1VxN0JVaC9PREZSa2ZjbFkvNkRpMW5Z?=
 =?utf-8?B?SERUTzNVd3FsUmhkMEwvTVdYLzFaeUZOV3pqSlc0UWVtRzBtMnJQand5S3dy?=
 =?utf-8?B?UnAyVEhYWE5xdXV1eHJYNk9XVXcrSnlYQmptS2duNUZlMmRnbkt1dWw5c2Q4?=
 =?utf-8?B?VFF2M2NYTFpQUGZPQ3NUbVcxa3ZVUUtJR0VFVGMrMFBQWHNhYTR3Mm1TTWc4?=
 =?utf-8?B?aUs2ZHBQeUFwWlNjVm13VXpYZFlCR3ViU0ZXNndCcFo2SU9UTk41cXZaMU1P?=
 =?utf-8?B?OU9jRnFTOEdMLy9Tc2dYR2tnVHJoT1F4NEM2Z2wzYmJibVduZHpHS3YzTFkr?=
 =?utf-8?B?WXpiaDUwU0dKQ0Ywc2lHcHNnL29Rb0RoN0RwVUVGK1pEcGlLUE1ObEw3Smht?=
 =?utf-8?B?enhiL0t6bVVZRWpkOHdQeXp6Vm9pNXRac0dORHdweUZVcjN5c2hMTVQ2dnRx?=
 =?utf-8?B?QUJIKzh6UHhTSUk0aEw0TTJXa3YxTjBTRHZxbExsaCttRVMxL04vNVl6elh4?=
 =?utf-8?B?THpoc2hGQ29ORjFyc2xyYXBjYnpDZ3BsMjBPV3JqS3V1YStZTytaejZwOUt5?=
 =?utf-8?B?TjNlL0dxQklWVjFrbzdvRVlWMTVXM3g2bFFlZHcxbzMzeFFZc1BkZ2MyMU4x?=
 =?utf-8?B?SFVHUXhmK0tmUjlKRzZXM05heFBqZ1hMd1o1cS84RG5CM3ZtaERGL0taWUky?=
 =?utf-8?B?eGtmcWR2SjlLK1NMUzVUMm0xVUFCU09TR0dyYUpZK3RwM2IwemRTVWRDd1VF?=
 =?utf-8?B?QmdCVFZOZ0ZRWVhNOHZqVlZmRk9Tdk8xZFZEWmtqcjRaaDdFUXlLZlQ0cmZJ?=
 =?utf-8?B?amlCUERWRUR1TzRmU3B0TEdkWUFXRCs0bXgzMlR3ay91YU92R0pZMGEyRFFv?=
 =?utf-8?B?NmQrWlBXaGV5TGNlb2FEbVlMc0ZiMVBmU3YyaDE4OGF1bHRhS2pzT2grcTVp?=
 =?utf-8?B?eEt0eFp0cGhybmpyS200Y082cHhmNHVjUFBTanZxWUlJY08zdjdET1N0RVdB?=
 =?utf-8?B?WTNUVmg3eXlxTDJaV0VySnF5YkZQYS80Z0poTmVJc2ZpYXQzUzY3R2tmeDZP?=
 =?utf-8?B?NlhZMFhBSHJHUWRqczNMblE5UURXcnNQVW01WGxadFJOZkxTU05HcEpXSk5B?=
 =?utf-8?B?b3hRMmNwZG5VZWk0UFg1aHp2YmhjdUJPSnk5K2VUYlRGMkh0MW1KN3pUUEtp?=
 =?utf-8?B?MFl1andUQjFEYU1QcU1GTGJhTlNrOUZudm5UZGRWVmJhSml2MkR1WHlJMlFp?=
 =?utf-8?B?YW9hRFNWZlR6SjhIaVpYa0FSdXh6UGV3VVlPVmpSQUFsRFVad2VnTjgydUly?=
 =?utf-8?B?ODRrU2FUYmNzZ0NoS1kwb1ZrQ3pJcUtCT21lU3hJV2FFNWV0Z1M0QTFFeWxT?=
 =?utf-8?B?K2ZPMVp3U25YYi9wb0U4REFCS2hPck1CWmllUG9USEhGOWFyYWRTMzdFa2Nz?=
 =?utf-8?B?QWdOL0g4Z3JaYWtFTXMvM3J5MHIzcUsxZHk4RFE5K1VBVEovTUsrNk9HU2I2?=
 =?utf-8?B?QU8rekpBc2VsMHNLN0V6Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFdJLzdKUEdPK0d0ak1wTEdYcFRQU0RCVHVqU0V5Y254VnBhOWpmMzdRekpW?=
 =?utf-8?B?ektoVDhkeFBQRk5CMHFmWWFKcUVOQ3kzRHRPWllmUXhkUEhjdjEvVlp3WEFN?=
 =?utf-8?B?U3BqSm9oc2Y5bW8rV1JxVlFiM1BWeWo3YzY1eU83ZUhCRjJIM0RnTnNTalEv?=
 =?utf-8?B?WnRpdkovSTFOWkpPYS80cGxsTWhWSDR5VHhTVWpxdktZVXp2cmtOMUs2TWIr?=
 =?utf-8?B?bkF0RzRvbHBGSldXSnVvMkQ1S0ZFeFpvc3AzWUdIVzllWUhudSs3aXZOQ2wr?=
 =?utf-8?B?QjFXbzJvcE4xbFg3c1hZbEI1b0I1M0hQUTVlcytidVdGUXFMMTkwNDVoNWdz?=
 =?utf-8?B?dEVOdmZvMHFvZzdYUGl3VHBHMUV3eExrS2duM252bnZ1ZnQ3V0tGSlQ4Rk1V?=
 =?utf-8?B?SnNZU2lMYStvOVNtcUc3c1UrTkR6Q2pMNnhnMVhVb2tJMWhyWlJHQXNjUDI4?=
 =?utf-8?B?N3ZLWVJRNGdnbUxocGNDSUJZakpWakx6UDQ0TndhSlp1UkhXM3lQSHdsYkVM?=
 =?utf-8?B?TlFkb21VZDA2bjJ0RVZZOXN0dzR3SHB0UHJFRHhFMFExZ1pEaFNvVmgzOFRS?=
 =?utf-8?B?cG5sN3MyTFhoK1IvZW1vWU9pOVIyZTU3STdPRmczM2ZvWjJCQURBZXdoTGFm?=
 =?utf-8?B?ZGxra3c3d0I5a2c1VFc2cHlZbWNsOWpvdEg4dE0rWGZML0g1R25idWVtTlNY?=
 =?utf-8?B?dlNNbncrcGNhUlBnQVd2VTRaSmhkcVpsejZ3NnRBSHM4dU1vZzUwMGcwK2Uv?=
 =?utf-8?B?OWVMTHdsUGN0ZGRxWWtJZjM1TDJGRHM5SlhjVmhUQi9IOGNyYkFxOG9RMkl4?=
 =?utf-8?B?UWRsaTVqZitDajRlM1ZnaW1Ua0ZBOFk1d3BkclRHbEVxVWZjRzlxQXQ4MUMv?=
 =?utf-8?B?b2U1NWlBOGhaWGtDbFdTVG9VT08vTmZUOHlOcE1BMzJJMmorQnY2S2toSE90?=
 =?utf-8?B?Ylo1M1prT3J2akZNT1RXYmJLQzBlbkFlWlJmaFlBdVpqaERVZ3NKeHh6cjdw?=
 =?utf-8?B?cUxZUW8zeUI2QnUxczI0K2ZkSmFvcFFDdHpxV0NvM0kyWjgvYTFEcVRxL2pr?=
 =?utf-8?B?Um14Tjdyb0w5MXpWdzVnaDdUbmFpczkvSUJ3VEdZZHMyTGhkN0xHRVBaRytv?=
 =?utf-8?B?OFJhUiszb0lJbmFnNkZ1T1Z3SkJVS3BhSk92bFJDZm8wVFVqeTdIRXB1dGp0?=
 =?utf-8?B?VHJuUU91c2lLSndZcU1TKzlDQVdWQUZsSDVlVnNPangvcE1aY1ExOVNTWFlS?=
 =?utf-8?B?N29CVnptUHdMY0xkVUlaL3dVSWp2STN2R2ppd2lNQWx1eDRxMktvTnpPUDRV?=
 =?utf-8?B?OTVVNW5HMXB5TDQxTXVhVi8zaWswVHNxbitleWpMMFVFSlBSM1R5SzZHTzk3?=
 =?utf-8?B?Y2dnSzhnZmF5N0hHM3NEcjdnbHljZThZS3hIbmdIaTBlbTByRzJZOExjczBV?=
 =?utf-8?B?aGg5Mm4yV2o5N0xhMjJGSFljdENidEZLcEJhVTd1NXN3clQzaTBvZlI1bHZH?=
 =?utf-8?B?d2RNS3hkQ08wTjRiY1lvNkRKT0svMmZUQ1BPdlM4V2VLdUY2ZitabzNrV2tH?=
 =?utf-8?B?V2VQbC9OOXJVWUdNYVhreXpuYTJ6NVBXTTBjMksvUTZ1RmZKWVVwd0VQL29q?=
 =?utf-8?B?d05tVmRKeDNudWdONUM4U1RhUDUwcUJKcms4R2RoaU92bkhETTFMZVpDWUMx?=
 =?utf-8?B?NzFUWHQ0aXI1cmoxTHZaa1NDMGM1SmZZeTZhSndPY1FRYys5Ym9ISGQ1cFQ1?=
 =?utf-8?B?SlFweDhiTEhGaWloUlFUdXJ4RmxpeFhsVjFpbEUxSnIzM2lrZWM2N1p5ZnRN?=
 =?utf-8?B?cDUyNzR6WW1PclpCS0JvZDIzTzZXQW1QWUVNN203dGYzdkcwa1FmWXNzY3F4?=
 =?utf-8?B?dUlaU0VreVVpR1NEY0J5NDFqQWhIeTA4eVg3bCtWRkU3cVFkNVUreFYxaDJW?=
 =?utf-8?B?SjBwZW4yYW90ckpGUGExVG82L0U0THo1N1RCLzhPZGdTTXEybjNOL2Jpd2Zm?=
 =?utf-8?B?MCtNOFp2TDdzRUdEbHBEbE5hMmprcDVpdVZ2SWNYRk4ySE9sN0sycmpDMVAz?=
 =?utf-8?B?MWlLYnhWWStBa0RBQTEwMzZXRWgrcWlQbXRNOHJVKzlEdFpPY0ZUV1lxZHVJ?=
 =?utf-8?B?bzZ5VlcxU1laZ05VQWxFd1VtcHdrZ2lBUm1nemFxSDRzSW9KYm9TL3NjL1hH?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b20d69b-1e2c-4535-1e88-08dd15fe4df0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 14:00:13.1105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0MFmf6GF0pUxk4Pvpc+RBwUfLFQUT4QG2j3qWZ6hNb/uRI496EQF3i/XYpw3c3KhabQFFHPojFdhomL5dIH7ksJOteDkF0pwZKl6xJXRJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7810
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Dec 2024 14:00:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5892

Hi Antonin,

On 12/4/24 1:23 PM, Antonin Godard wrote:
> With the recent changes from commit
> bd6265ca323fac547a197bb516dc4a9ef3897508 ("doc: Makefile: add support
> for xelatex"), the list of dependencies needs to be updated.
> 
> The initial list of dependencies was made for Ubuntu/Debian, and the
> packages were translated for the other distros using pkgs.org.
> 
> Add them separately from the rest of the dependencies as they pull a
> _lot_ of additional dependencies (for LaTeX).
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
>   documentation/poky.yaml.in                       | 47 +++++++++++++++++++++++-
>   documentation/ref-manual/system-requirements.rst | 27 ++++++++++++++
>   2 files changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 94849acf9942c7ebddb2ac7f8aaf5eb9d87e0c5b..25385068679a51e0f2e9e516b02b62e19e126291 100644
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
> @@ -129,6 +138,19 @@ FEDORA_HOST_PACKAGES_DOC: >-
>     texlive-latex-extra
>     which
>   
> +FEDORA_HOST_PACKAGES_DOC_PDF: >-
> +  latexmk
> +  texlive-collection-fontsextra
> +  texlive-collection-fontsrecommended
> +  texlive-collection-lang*

Please use single quotes to surround texlive-collection-lang* otherwise 
it may be interpreted by the shell, c.f. for me:

```sh
$ sudo dnf install texlive-collection-lang*
zsh: no matches found: libgpiod*
```

while `sudo dnf install 'texlive-collection-lang*'` works just fine.

Ditto for the other occurrences later in this diff.

Cheers,
Quentin

