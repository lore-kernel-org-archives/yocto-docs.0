Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26DCD58D75
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 17:55:25 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.62])
 by mx.groups.io with SMTP id smtpd.web10.24846.1732557323962109248
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 09:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=WdAhdpIo;
 spf=pass (domain: cherry.de, ip: 40.107.247.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zs4lUAWe3SwVb+U/d56ddEFMUsRhW+sTojz6RijKzl7r5x6LRO2mp3lCLZWS34AC15myniOqKPDa6mOrehcqd4qrEfhQIp6mR9Q4qoRHO73MNqk67YgyV27QtMG99muIy2xFuvM94SD/Y9gdT0G6oX0PI5Nqn0SxKIwBQ18b+8ho3/0XZJknnD9KZLlqxX0o+ETHBZUGofpgunezVGCpPfn0Ugj9Ac3qDnLaqSsP5zdJ64TRvrUNgOeTo8dCvWF6CxobATuIbuWGn1nQZgBDDccMy+q9NpaomOr0JnNbexrFjekGmZyAGBwGBOTJincwpHyELw38f5j2hE3YQuBqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OXDJZ8/TE5A2Oz2QXIPEBuNvzjaaVJu6UEtHWRhoFA=;
 b=sw36eORtHwDBZmo/jJq7Tqublbuh12UJxnnUeBB/aC3jwqj/2deveYbTV7SRNhVqukNY+gYyukVcoc286LPBMrbWX4AL2NrozVZQCmMRl5JyGHrDNgRt0FyiHfY33v44ICEe8jxwX5VV9bythZN3H+/XaqYeVpDXypG+nV4hyM9e+tEWwgtdbjz66unNrSj92FRaIUgVzo86bJNHoPkUu/o+q4ylU0osmSnkVvnlwLDaOqwtvHj9qU5A2k4wfZMK8zjSD4WPWxO7IElUVmGrKWgTvek6AqNz+qu4MdSDheFSQMUyg1DUehhfXKG8E4UPL/bV8xwYdZ+cruX9fdJnTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OXDJZ8/TE5A2Oz2QXIPEBuNvzjaaVJu6UEtHWRhoFA=;
 b=WdAhdpIo4J3Uw7Sd033Z/tMs7+EAyWkcDs/lSiEarBrwCpDehaiCKhKoSEGLgRheJ10tslQ9z8G2co3eiPXePjQl2bj/koOkO5L8MaaRkGDJ9qGb7bkEP0wXW9XY7iRsgR2pfCeIBSArxK01BT5GxVa7AJPV1KyrZ80xW5r5IyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9219.eurprd04.prod.outlook.com (2603:10a6:102:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:55:20 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:55:19 +0000
Message-ID: <86bd7352-1a33-492d-8308-c2eeff6b4a71@cherry.de>
Date: Mon, 25 Nov 2024 18:55:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 1/5] Gather dependencies in poky.yaml.in
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-1-50e267ae4123@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241120-update-doc-deps-v1-1-50e267ae4123@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5b5f03-cf2a-4e56-3194-08dd0d7a53a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fJWvzwO+Dl9IBmywBMzulMI6xiUAQXOP18rKdzb+E42NHTwGJHxjkOrKEYYc?=
 =?us-ascii?Q?Gc2lwX6i8FcwzJyPWRFILD+IvruLVWZNtVl923koJ8bfLvHpLB5nxuHOEbHp?=
 =?us-ascii?Q?pJXrcoEpPuvWJsHP4yzMTh6GLX142LoR95ARcWwy61cvy9Vnih96weKftsR1?=
 =?us-ascii?Q?3MV85eFo7qcmzkTBBMxDvmMb3lK+ImOvhd9CksCeJ03nYdCZ3pKEfLm3nbQE?=
 =?us-ascii?Q?VFCvNJtVL1q1ojJyXSQHyTwK+iqzlzUqfAYb2L8e5RESE3S/Fam9QvjL17aN?=
 =?us-ascii?Q?FFXJDN8mFvASjhr5PfNzr/Vqe/VEEy3QWYAU5YDmZhMNJI2DAxUqAePdp5wd?=
 =?us-ascii?Q?iLG8sJIcI9OJi1Y/ZaNUVA/pB7Ic1Fj7mZ9Uu34laGE/1h97q8Mc4yjEOhe9?=
 =?us-ascii?Q?pslsPrhJ2AHwnyPolJlLzOeoRoF61iYjgrWC407vI5xDFdRCbVWxLFXnaIBe?=
 =?us-ascii?Q?B5d4OjKufQH6hQTLr34yBALjTmxh6Kq0e7HgBfKXKrQvB6zDPXNfezkcGVkC?=
 =?us-ascii?Q?Lom7yprROarZ6aDKlB6uTHA2BKSa8m8frqY57zgEXH+zXaI9G0f0+96I/2uY?=
 =?us-ascii?Q?57kryKvL23xufU4PQ+vNn4ludfGieEw68B/tcEDOEbDJgVq924sq8cUu2eK9?=
 =?us-ascii?Q?V10gtBjVPuy30W2s8FS95fiGjlQElvpU0Btq+vxG7Kb/4Rx5iBOW3zwew0sn?=
 =?us-ascii?Q?Fg9Qea7bnh6t/u+SBpS0cK9fWKFwPMy4XQf3Kjmrt2ZtqmBT0nTQgczWqsBr?=
 =?us-ascii?Q?TWD2hQHD3LvieuESxmjxOxJBJ+igIu08AV9BcoltuN2zbUVvWBhQybroKKwg?=
 =?us-ascii?Q?cEJazso7scvwx6w0ZkDBQs2aE4/32OaQec3W+DxQdyFR7D34wOKETA35Qhf5?=
 =?us-ascii?Q?TyhabdiHYaWx+YYYRvgFOigUqCBwdpkCMmHGl2+lIa2oFWISFW7kFqWWDUZm?=
 =?us-ascii?Q?eZ/UWKdke4R5PVNxNUl+XfwN0viEyu4uVIXPbUfOpeg+xT5ukb/k3J8dfOzU?=
 =?us-ascii?Q?mO99R225/cX/lf5N4u5uTAzXh4NdIB0xAHbzYy4rCr0g9lyWLdONj7pRniCR?=
 =?us-ascii?Q?HqE2q3I7kYsVy8pc4cKPw+eyHHcKxawEbtXIWECkKusgsUG5ZTeVdFMx7TzK?=
 =?us-ascii?Q?EX6ih93KORvuE4zFDAYuf3S2ptzxEnpUY+mwTbLN/A7oCD7Tyn8VUqmZFrL4?=
 =?us-ascii?Q?+/OtV0wNRUUywpRQSfOEwmli/1DpjdL0xQoON91bKfFahdqvvWF/eaeMudc5?=
 =?us-ascii?Q?9JB7j/dkX/fIVNpYEV8U75MVhBqfoJunK3h2nJu+mc5wlZfwypQ+1VSTvqoH?=
 =?us-ascii?Q?JoM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GLxF+434vH0n7wKfwrg0LYnsaOB3Z0JAOCoMswrqAp37QJXPJY/G/uF/C70j?=
 =?us-ascii?Q?sW81L1HIYOA2sTRhsAL9GlwXawk8DKiFjgVhRyFngyFW7IWdJLpBNzAHlRCp?=
 =?us-ascii?Q?wlFVf1oogwJfcF3vJZcqftir4WZMPE2Bnw6Z9YKsBCMPnTJkTO+laAGHknzn?=
 =?us-ascii?Q?Y4MrpMGoZwMYE3lIbwpINWYAmRY8P7kNMThtfS1rRvUhVgTCHBQYPRQ7rEkc?=
 =?us-ascii?Q?XLPTJBD9UgaOBgpV35QRGpAAgy/Gy0xuAd9JF5qB6qMYW/N/jgKnz3DVM68P?=
 =?us-ascii?Q?+GGhNtqSqIN+Xk8Pz2l0V7Ox0NMTkrFqmb8M1QSNe0nWkH2pFgKglhKlkBHq?=
 =?us-ascii?Q?zuAWzS7Q1HAubpUPDbakDdSf06FS1M6a9z6i1pgHC3Qcif7nmKbbnkiqHgRL?=
 =?us-ascii?Q?s4CxwgUnggu3cY01tkVLXtMGhNYtMUFMTmdtiQ2CxtG+B4VYq4tPKDqoE23t?=
 =?us-ascii?Q?H0aJNOZHF0e0NAWe2iTOIlCN1QIkwgNzvo3LP7RS+L6i2OWgh1eB/Ukji5NM?=
 =?us-ascii?Q?TYNRim9tL4mv0S6qCO0ntz6Zy1Q8x2KONWDEleJpvqyVRuVC59ssa8kONSZ1?=
 =?us-ascii?Q?83XzWy6CIfJF1SEJbHIiwwk+BblnU3IfmC2KdzprXhW/JkTw58cWPYhgUlks?=
 =?us-ascii?Q?loel4Qe5sYQR4zmrKTxe+dghLWMkg9owSewLdvP+w448CvwJqCUlN95LzMiI?=
 =?us-ascii?Q?S0qImLXmT24DQhRkcQ9aDALdkX3w4m9YY+ngp2EuBYD6tEqBqv+kZXG7Wwcc?=
 =?us-ascii?Q?HTDjZRPUw2lJcZxUcQ5SKoKQV2codKcSyJarxI8cIFlzyOjRfdQgo+sfGDyE?=
 =?us-ascii?Q?6+QXy0/k9HD6X1JuqUDmwF5qnZK4LTIhTFZtv1CIwcFJYLBdJoEh2XztrBuq?=
 =?us-ascii?Q?JcVN1pgV6LxOnpx7qxljRjBFISd6Y0u+snq6PHDx8MK3+gfUs+MmsgsQJcte?=
 =?us-ascii?Q?afXEx3ShDJUUCXt4nTmaSaWGB9zvPN5r1w7odJVATeuUK1Tp8g7/htoXfQGk?=
 =?us-ascii?Q?+6cIeYgpNIoldaw/or2tA1g3T9ivt/2jz1eZnP/rBj1Au8vO3jE8pmI89QPc?=
 =?us-ascii?Q?dwNtapeAAN296Nalasq/kPPojpfe62R/XXHROq+uSCEwM/FZryYoWizEkllt?=
 =?us-ascii?Q?8V2DeiPUYk+gmhztIEKGbIW05/XbmaJbYiIP47NGUHBx93nMGSZaZmt9Fs3p?=
 =?us-ascii?Q?Zn79b2dgEiNYOAH2p5XsiGFRAWahHM9NTtZVMCzPvyvID+HRgQ0Qsqu+97x9?=
 =?us-ascii?Q?obxdeFZbFKESVqoxs6KRUtyeCxTCl1y6uXNGV1W4bRfWhZBay3TkazJIhCik?=
 =?us-ascii?Q?xSpv1TmwXvvhNK34y9/Pb+HHMJcV27Jod2Wq14PNQYlTSX5nHL22Swqn19TJ?=
 =?us-ascii?Q?mZTP5/JkKLvCQs1TUHzzcBJnvHsO6vW6pA20xwgCkZkHy61OaiBBV7OZ/Opl?=
 =?us-ascii?Q?YFa2CjCVGb8tNFQsSD2PbzOL557VukoTHtwu4eV9mNxSsw3nGFUCVS5HSaHI?=
 =?us-ascii?Q?eyRVy/bMtSke0pO9F2Fm0+2iSzYFyChRFZjO/2pCmzsZ98Q3FE5Y72pl1c2v?=
 =?us-ascii?Q?Dz4RItdmcYFK0IwZjgVexEDTVG//k4kCyud0cih0L+taD4yJRV0vas7vLtIB?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5b5f03-cf2a-4e56-3194-08dd0d7a53a5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:55:19.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EqjxZE/b9Er28qkELRsL+qNTW09ABNXjSIK9jca1ZkaTgHu2X9oKKccoTMk5RehxBwpkiyWEt1OGDNDH7yTAtFoTY7ZqTdY1GGXWvtJkgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9219
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 17:55:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5804

Hi Antonin,

On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
> We used to have packages here and there in system-requirements.rst for
> each distro. Instead, gather all the dependencies in poky.yaml.in so we
> have an overview of what we provide for each distro.
>=20
> Use yaml ">" to list the dependencies in alphabetical order, one entry
> per line, which makes them easier to read and compare among distros.
>=20
> Rename UBUNTU_=E2=80=A6 variables to UBUNTU_DEBIAN_=E2=80=A6, since these=
 are used for
> both distros.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/brief-yoctoprojectqs/index.rst     |   2 +-
>   documentation/poky.yaml.in                       | 228 ++++++++++++++++=
++++---
>   documentation/ref-manual/system-requirements.rst |  20 +-
>   3 files changed, 214 insertions(+), 36 deletions(-)
>=20
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation=
/brief-yoctoprojectqs/index.rst
> index c5400e4ac8dafb9e3d1e4c14a065d02ac3e2f7a7..3d249eefaae35239b92c8a2f8=
dedf27ec2dbdca0 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -78,7 +78,7 @@ You must install essential host packages on your build =
host. The
>   following command installs the host packages based on an Ubuntu
>   distribution::
>  =20
> -   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
> +   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;
>  =20
>   .. note::
>  =20
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 66f758fe85fcd10291f00902639b43a1da639b0f..b840320a89bfadb259d5d9d0e=
11f951c55e13389 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -1,3 +1,7 @@
> +#
> +# Macros used in the documentation
> +#
> +
>   DISTRO : "5.1"
>   DISTRO_NAME_NO_CAP : "styhead"
>   DISTRO_NAME : "Styhead"
> @@ -10,31 +14,6 @@ BITBAKE_SERIES : ""
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org/"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org/"
>   YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> -UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo g=
cc \
> -     build-essential chrpath socat cpio python3 python3-pip python3-pexp=
ect \
> -     xz-utils debianutils iputils-ping python3-git python3-jinja2 \
> -     python3-subunit zstd liblz4-tool file locales libacl1"
> -FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 =
unzip perl patch \
> -     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath =
\
> -     ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl=
-bignum socat \
> -     python3-pexpect findutils which file cpio python python3-pip xz pyt=
hon3-GitPython \
> -     python3-jinja2 rpcgen perl-FindBin perl-File-Compare \
> -     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en liba=
cl"
> -OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make =
wget python-xml \
> -     diffstat makeinfo python-curses patch socat python3 python3-curses =
tar python3-pip \
> -     python3-pexpect xz which python3-Jinja2 rpcgen \
> -     zstd lz4 bzip2 gzip hostname libacl1
> -     \n\   $ sudo pip3 install GitPython"
> -ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> -     \n\   $ sudo yum install dnf-plugins-core
> -     \n\   $ sudo dnf config-manager --set-enabled crb
> -     \n\   $ sudo dnf makecache
> -     \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzi=
p perl patch \
> -     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath =
ccache \
> -     socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue pytho=
n3-pip \
> -     python3-GitPython python3-jinja2 python3-pexpect xz which \
> -     rpcgen zstd lz4 cpio glibc-langpack-en libacl"
> -PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme py=
yaml"
>   MIN_PYTHON_VERSION : "3.8.0"
>   MIN_TAR_VERSION : "1.28"
>   MIN_GIT_VERSION : "1.8.3.1"
> @@ -46,3 +25,202 @@ MIN_DISK_SPACE : "90"
>   MIN_DISK_SPACE_RM_WORK : "40"
>   # RAM (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu =
22.04 (x86-64) on a 4 core system
>   MIN_RAM : "8"
> +
> +#
> +# Dependencies
> +#
> +
> +# Shared between distros
> +PIP3_HOST_PACKAGES_DOC: sphinx sphinx_rtd_theme pyyaml
> +
> +UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
> +  build-essential
> +  chrpath
> +  cpio
> +  debianutils
> +  diffstat
> +  file
> +  gawk
> +  gcc
> +  git
> +  iputils-ping
> +  libacl1
> +  liblz4-tool
> +  locales
> +  python3
> +  python3-git
> +  python3-jinja2
> +  python3-pexpect
> +  python3-pip
> +  python3-subunit
> +  socat
> +  texinfo
> +  unzip
> +  wget
> +  xz-utils
> +  zstd
> +
> +UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
> +  git
> +  inkscape
> +  make
> +  python3-saneyaml
> +  python3-sphinx-rtd-theme
> +  sphinx
> +  texlive-latex-extra
> +
> +
> +FEDORA_HOST_PACKAGES_ESSENTIAL: >-
> +  bzip2
> +  ccache
> +  chrpath
> +  cpio
> +  cpp
> +  diffstat
> +  diffutils
> +  file
> +  findutils
> +  gawk
> +  gcc
> +  gcc-c++
> +  git
> +  glibc-devel
> +  glibc-langpack-en
> +  gzip
> +  hostname
> +  libacl
> +  lz4
> +  make
> +  patch
> +  perl
> +  perl-Data-Dumper
> +  perl-File-Compare
> +  perl-File-Copy
> +  perl-FindBin
> +  perl-Text-ParseWords
> +  perl-Thread-Queue
> +  perl-bignum
> +  perl-locale
> +  python
> +  python3
> +  python3-GitPython
> +  python3-jinja2
> +  python3-pexpect
> +  python3-pip
> +  rpcgen
> +  socat
> +  tar
> +  texinfo
> +  unzip
> +  wget
> +  which
> +  xz
> +  zstd
> +
> +FEDORA_HOST_PACKAGES_DOC: >-
> +  git
> +  make
> +  inkscape
> +  texlive-latex-extra
> +  sphinx
> +  python3-saneyaml
> +  python3-sphinx-rtd-theme
> +  git
> +  make
> +  python3-pip
> +  which
> +  texlive-fncychap
> +
> +OPENSUSE_HOST_PACKAGES_ESSENTIAL: >-
> +  bzip2
> +  chrpath
> +  diffstat
> +  gcc
> +  gcc-c++
> +  git
> +  gzip
> +  hostname
> +  libacl1
> +  lz4
> +  make
> +  makeinfo
> +  patch
> +  python
> +  python-curses
> +  python-xml
> +  python3
> +  python3-Jinja2
> +  python3-curses
> +  python3-pexpect
> +  python3-pip
> +  rpcgen
> +  socat
> +  tar
> +  wget
> +  which
> +  xz
> +  zstd
> +
> +OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
> +
> +OPENSUSE_HOST_PACKAGES_DOC: >-
> +  git
> +  inkscape
> +  make
> +  python3-pip
> +  texlive-fncychap
> +  which
> +
> +ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
> +  bzip2
> +  ccache
> +  chrpath
> +  cpio
> +  cpp
> +  diffstat
> +  diffutils
> +  gawk
> +  gcc
> +  gcc-c++
> +  git
> +  glibc-devel
> +  glibc-langpack-en
> +  gzip
> +  libacl
> +  lz4
> +  make
> +  patch
> +  perl
> +  perl-Data-Dumper
> +  perl-Text-ParseWords
> +  perl-Thread-Queue
> +  python3
> +  python3-GitPython
> +  python3-jinja2
> +  python3-pexpect
> +  python3-pip
> +  rpcgen
> +  socat
> +  tar
> +  texinfo
> +  unzip
> +  wget
> +  which
> +  xz
> +  zstd
> +
> +# note: indent below is for sphinx's code block (three spaces)
> +ALMALINUX_HOST_PACKAGES_ESSENTIAL_CMDS: |-
> +     $ sudo dnf install -y epel-release
> +     $ sudo yum install dnf-plugins-core
> +     $ sudo dnf config-manager --set-enabled crb
> +     $ sudo dnf makecache
> +     $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
> +
> +ALMALINUX_HOST_PACKAGES_DOC: >-
> +  git
> +  inkscape
> +  make
> +  python3-pip
> +  texlive-fncychap
> +  which
> diff --git a/documentation/ref-manual/system-requirements.rst b/documenta=
tion/ref-manual/system-requirements.rst
> index b33518c7f1e0c76caa70a719e023b9c405b744e2..ca75f849d0ad10344900c7525=
f7163726ffe5400 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -150,7 +150,7 @@ Ubuntu and Debian
>   Here are the packages needed to build an image on a headless system
>   with a supported Ubuntu or Debian Linux distribution::
>  =20
> -   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
> +   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;
>  =20
>   You also need to ensure you have the locale ``en_US.UTF-8`` enabled::
>  =20
> @@ -172,8 +172,7 @@ If this is not the case, you can reconfigure the ``lo=
cales`` package to add it::
>  =20
>   Here are the packages needed to build Project documentation manuals::
>  =20
> -   $ sudo apt install git make inkscape texlive-latex-extra
> -   $ sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
> +   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC;

Aren't we missing the PIP3_HOST_PACKAGES_DOC here?

Also FYI, using pip on the system level is a very bad practice (as a=20
matter of fact, it's not even allowed on Debian Bookworm anymore). We=20
should probably rather document how to do this in virtual environments=20
for example? One thing after the other though, we can start by just=20
migrating the docs variable for now :)

>  =20
>   Fedora Packages
>   ---------------
> @@ -185,8 +184,8 @@ with a supported Fedora Linux distribution::
>  =20
>   Here are the packages needed to build Project documentation manuals::
>  =20
> -   $ sudo dnf install git make python3-pip which inkscape texlive-fncych=
ap
> -   &PIP3_HOST_PACKAGES_DOC;
> +   $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC;
> +   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
>  =20
>   openSUSE Packages
>   -----------------
> @@ -195,11 +194,12 @@ Here are the packages needed to build an image on a=
 headless system
>   with a supported openSUSE distribution::
>  =20
>      $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
> +   $ sudo pip3 install &OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL;
>  =20
>   Here are the packages needed to build Project documentation manuals::
>  =20
> -   $ sudo zypper install git make python3-pip which inkscape texlive-fnc=
ychap
> -   &PIP3_HOST_PACKAGES_DOC;
> +   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC;
> +   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
>  =20
>  =20
>   AlmaLinux Packages
> @@ -208,7 +208,7 @@ AlmaLinux Packages
>   Here are the packages needed to build an image on a headless system
>   with a supported AlmaLinux distribution::
>  =20
> -   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
> +&ALMALINUX_HOST_PACKAGES_ESSENTIAL_CMDS;

It's a bit odd to have a different way to add the packages to install=20
depending on the distro, couldn't we have all distros have no=20
indentation, or all have some indentation?

Cheers,
Quentin

