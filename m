Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44F4E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 13:51:11 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web10.37217.1733493066109248082
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 05:51:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=f8eAKEh1;
 spf=pass (domain: cherry.de, ip: 40.107.21.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSz5imW54yBgHmQTXgysUtJzLd9E4cytAi9H6EriXIOXqv/qpB8eQZJqN8Ru0iEiaayOLTn2GD/gknI9dnWVWvE5xqRr/+otHcmk1sGxHTOBrNLaDLS8UBsojI3gXCv8yNMaNs+9gmoFp8EVNZs+V+S6pQQ58wElNvUpjXsOSiJukiFyUoQpbmWP3IaKUfd6IBkPmobo2fHPUQO+kppajT2+8Yyxpy0Zb1ezm17OPSK0PO0xFu5eVMwUepeUyNGo8TvxwRPTB29YBXCWGPdGTk8bFSU+ep5xhrg9dm8F7+/CmJ2TNCA348OLkH5t31g72Moiis/zPl1tIG+TaDxwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svx5RbS4fwH6PFwcHcmW1sGCbCA8F0esn2212FAQ2xg=;
 b=G3j/Un8Fvw98+EXiPRFYV3MjQkt2VVPPKS7mi1Qo3NYa3wZfU86MppcbV1TUvJITT7zFeQ0VTLqbfTEaO16rNZ9E5fqvkrMLBSyWdBeTV7214QkRayKkQm1yPr/uE9fPTEEH+VEMSqx58sLLePWnFaVkyfjL9py0+UNg6EBLOFxKj9Cl+wR5j4I35ZCiMUFtZcUYS6tKgfcwREn9Po/SuO+vcjrSo3UE6gsrFK8zVGtyTNvvaX83R7zqz+85WSWtoFBO37J+LCtwyi1pM4AjuUwSdflsAIqdz5Q88hkKNEMxb73TXoUVJ+xcoaqncqyXlPC82RlpHBC4cgy9idE7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svx5RbS4fwH6PFwcHcmW1sGCbCA8F0esn2212FAQ2xg=;
 b=f8eAKEh1IO/gtpxtiM88uWmC/HjdAf8+daCUnAAD2+mh8xN4lfOfAOlqcDhnpHY5jqO16pAZEoGzGFxnUvv9i7wQkHHEaz92/s3RZKAAwc3ptrCyofjqlcjTfgSy3jX9DoDtL7ER8EieWJIy7EQPRjUqv+p7+0hzA/u9acMQAYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA1PR04MB10988.eurprd04.prod.outlook.com (2603:10a6:102:48f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 13:51:02 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 13:51:01 +0000
Message-ID: <bbe9f42c-e716-44d7-8930-71a44c4c9a36@cherry.de>
Date: Fri, 6 Dec 2024 14:51:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2 1/6] Gather dependencies in poky.yaml.in
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-1-1d9b4063476f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241204-update-doc-deps-v2-1-1d9b4063476f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA1PR04MB10988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae2f738-2628-4f9b-2b43-08dd15fd0548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+dQKrleGdz6h/aC+0gmgnPjrci5/awnSacfa2hfwekA/Q+qhU+PzDhvuBOnf?=
 =?us-ascii?Q?VcNjIKLUtN7MkYWBL+nAqbSsSwPU2INLEDYdnCLHTK2XhU4jc25Ne3Hjh2r7?=
 =?us-ascii?Q?PoSkzwjdi9PBeETUjCO6wjuIrkHe0X6IFWdoeCvhS2+XLKgG8OQ3LYwMPF00?=
 =?us-ascii?Q?VRXBo01PwggbM3/EO+kwPSysglw6gNv5tAkghMjm1RP9EFB+NJdroFV681D1?=
 =?us-ascii?Q?ZAZJ/WuDD2spqLiqeqzIf1oaGuKlf58oePaiTtiMNIChaiBLZ7+OFObv/gWv?=
 =?us-ascii?Q?/LzCZ8HvemwIBrutbukPE/V4nRzq07Rug1UMWl77nQ7GUXEFqW9tfqiBK5KJ?=
 =?us-ascii?Q?Qf9/PsXaq7V+1h/awfV4dl6eBu9tdFlYeT9gmbyCYLZs0B4GMgTxlPChjwA1?=
 =?us-ascii?Q?AkUIT8aBRY+ZTIJtTHz/e4oYv4PhGMAPaOARFIlzlsfg1sJY9YsFGuym4XAz?=
 =?us-ascii?Q?ZHsqOIWZ037L99dLF8+vV1Z+flXlVZ5i0EMMDyhsHoqXB4Xrt9OZEx2rvwcr?=
 =?us-ascii?Q?BwRY+Sa5eEZ8oD0KWYiHsfGa69HO5gQAv7jNchNinEdUGlWFAhWUe8iW0Zao?=
 =?us-ascii?Q?wInH3YAJRpowqFg+xBRO6U/E2IRvmxK1zIU4mcyw+NKYxjP+rd6pxiHAP+11?=
 =?us-ascii?Q?zXvZJQIHx9wgpnOJRGgfrCgeAyEuPFjggXGIGa9WCoTO1Oa1ujot/p9Mv9xp?=
 =?us-ascii?Q?wzvBSmcYvOBlbCqmO0uvhZMf2DFufPU2iTuLkyI9yzwKKllOVF+31G+edkyk?=
 =?us-ascii?Q?tF8HIrh3lE4ZMCcVUviUfcbtHHL7A/8HtKo7zfx827nkLI0dI2X/EXfFINr1?=
 =?us-ascii?Q?adADm3sEEcwXmRlMgDwZziC+MDmipMYC6U4CSz1pmjzSfIfBg+eZzlRDu/bO?=
 =?us-ascii?Q?/lKTc2smtUK3aI/m8BjkW1ME7jxjxPIPG7kMMx7QHb1OaoGp1zgVqTzmi0Fk?=
 =?us-ascii?Q?7u5iF0Kpzh/FIYIoz5vQv9Ss3v4KCrBbgpVjbIUlZ2Uj72CqxQOp3peKKb8N?=
 =?us-ascii?Q?D2ulMlvsGtPLwstjRSo8BE2HNrFrMlb7v5PjNSaKr43l+z9s2zp7GJQr90pe?=
 =?us-ascii?Q?W0Pyq+kjfCWbPmAEqWOxZm82aho04/hYTZa1CaEwTJfsSU2144zIBE7y6KQs?=
 =?us-ascii?Q?N/6IaSjumhuKiFTy5a4EDhVwio9mATjW6jSbQfEPTxKuyHTpk6/YLKobkN80?=
 =?us-ascii?Q?s4ZZA4R+ksEDmFGQVLSTjz5SBTM4i3UUmnd199m3HYLNBawRNp4Y8basE/Hk?=
 =?us-ascii?Q?p6Hu2oToI4QZqEyGGEoMMvdwWRxMCeV2lkMy8XcMDSAhACmfq66VoWNK0yiu?=
 =?us-ascii?Q?MJA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q/uG56DNi+yZ2R/q/4pTp2163ZN+7q852hsb81/AenzktUmiCWVYEmj2ONAL?=
 =?us-ascii?Q?rWWSbe5pdW7DpQA61qzlCkbKowT4eDlU5c4c5Z9wNNM3pQPa/0C6WULZztYL?=
 =?us-ascii?Q?KDdxSbEB5sGrdqRIDb23YrBh+PsJ41huKwlJ8Xs5DLCUG8qoC1BgHnAuu0pj?=
 =?us-ascii?Q?azq1NTGuIHpkFKoCdEKsSdWQiZ0OWy+PI7AOMrl5uLxg3UM0koHKD93Jg3We?=
 =?us-ascii?Q?2KKHakd3Z2YYviEUelcdHm2T/+GMGMRR/IK6jOfSrVkh4n6UbsIByU/8+JBV?=
 =?us-ascii?Q?M/3Mue45xxh7sNrQPKUOps4PA7Yse2ddhHEDzmp7PtjhmDasV0CDcbLS8YfB?=
 =?us-ascii?Q?sxGsuZJ21T263kMdEmRbEk4zSFr1ou67/5urv49dziACXnDP5YE+uiAkwyg8?=
 =?us-ascii?Q?RS52hO9Qf2dDltXW5nrkvhZVYe6ePIv+NnC6TWBeNKo467DMVNbIYzfuGn6t?=
 =?us-ascii?Q?DC2JWiYbZjIYXAREyWewPPa1XeFrucYl9veOZkzg5VSKPpT8epAbrLME2Xd4?=
 =?us-ascii?Q?OFHR8Vd3ROh/qEYab/Ej00SBWm24t7Co6ujSG1hyNzV4K5BWD8nq+OGk6xhy?=
 =?us-ascii?Q?mryUXACuvsqPVXoUOeigs2V7NmSc6cj7Dl+UxEic/iMo2+B5W8M69aEeYlwm?=
 =?us-ascii?Q?cZVJXvUhlN8C2wLkZ1FRLwEYIRDB/KudsJ2wVSLkZeKFNihoT19DCdbf8mY2?=
 =?us-ascii?Q?fgImi6VW5P6Qf1w4rA0BTR5J9Tc1joFAZ6z6oc0voqdwH8YpueIUCroNATfx?=
 =?us-ascii?Q?fhE9LNI/46uFnWyz6ND3c7ZX42hvPIxIxUYTRv++l2nrB8n/fai8MR3j4Ip0?=
 =?us-ascii?Q?PdFgbGWhsP3FnWYUJF88kee4w3hH71wERC46v/zHi7SHwSAjVS9gH2kjXRli?=
 =?us-ascii?Q?6mMY3pI7wGxUCdoEOImShtV7m1kcio1iN4lbCNlSeP7FoiwUELFH1UwcaCBY?=
 =?us-ascii?Q?6W19wErO87RYx3uza8SxEaL9PefmZj5x8JSbJmDsptPeU0PVvSGO+uI4xPBO?=
 =?us-ascii?Q?DGdJC5HrOMzPZAa5HgbmtnOFfxBoyPJCLn9BbDp8ngS7fZVjm9uzrjyTC6wA?=
 =?us-ascii?Q?ZTyjbQZgXr6V7vxHlzS0sZMqSmEpSDO56PtbSUJfFyrWbSYXm+ptfrryn+Lb?=
 =?us-ascii?Q?sdMmECvEFpDs4/bcYP5307zFqOXt9OYI1lXTp/NLtSX0d+Aay3JYkruoFqsQ?=
 =?us-ascii?Q?D4qAw4KTf7TO4EI+VPsSrLlXeROq72rglmZ8IhH/fcng5cyrNvJOZsnP0wAI?=
 =?us-ascii?Q?HuLh+TAONy5qwgC51vXKYhosKC/oDEMD1nYui7LSunvxnNrCXHUcPbblWSoO?=
 =?us-ascii?Q?AJMWruYm25WZINZibp6vg0muh7aG5okXDePCwThv8w/PnTBtlVSj9AxF72+2?=
 =?us-ascii?Q?WAFKmgOB7jaw3yro1rHwtJbQxKt3j+eNwc78pxb3UVB1RroMkraoK/UMvN8m?=
 =?us-ascii?Q?/p0knNks+m6elUoOI8dP3YRzl33ql9EJmiagLLyDUmmkwO7Q4o6NKL7TXs9F?=
 =?us-ascii?Q?RL+AQvMO+uEz0T/CkV5PT+Q4L3z7zvZtwGn8HXwOasAgl6blrpo/T0nL2skz?=
 =?us-ascii?Q?64j1PbOJMKkBqKxHN91xH26vAE7ihLgSS7VgSRrsYPKqn62VdMx0Cem/wjcK?=
 =?us-ascii?Q?Cg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae2f738-2628-4f9b-2b43-08dd15fd0548
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 13:51:01.7042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtZC8nrbQJt+jggYdCPalM6DuVW2gNqDz5UdYPSKcx0WEaj5A7+A2/yOsGIwGpOjKSt3R52/Ey1fpFZpcP6tiMEcnojABsD2moCf+6SoDwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10988
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Dec 2024 13:51:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5890

Hi Antonin,

On 12/4/24 1:23 PM, Antonin Godard wrote:
> We used to have packages here and there in system-requirements.rst for
> each distro. Instead, gather all the dependencies in poky.yaml.in so we
> have an overview of what we provide for each distro.
>=20
> Use yaml ">" to list the dependencies in alphabetical order, one entry

Yet >- is used :)

> per line, which makes them easier to read and compare among distros.
>=20
> Rename UBUNTU_=E2=80=A6 variables to UBUNTU_DEBIAN_=E2=80=A6, since these=
 are used for
> both distros.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/brief-yoctoprojectqs/index.rst     |   2 +-
>   documentation/poky.yaml.in                       | 218 ++++++++++++++++=
++++---
>   documentation/ref-manual/system-requirements.rst |  22 ++-
>   3 files changed, 207 insertions(+), 35 deletions(-)
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
> index 66f758fe85fcd10291f00902639b43a1da639b0f..d03809f557960d10a6b9a2753=
a65c80937c62e13 100644
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
> @@ -46,3 +25,192 @@ MIN_DISK_SPACE : "90"
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

I'm wondering if this is really required?

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

I'm wondering if this is required? I guess the times we could have=20
python3 and python2 code mixed is over?

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
> +  inkscape
> +  make
> +  python3-pip
> +  python3-saneyaml
> +  python3-sphinx-rtd-theme
> +  sphinx

The three packages above are supposed to be coming from pip according to=20
the current version of the instructions.

> +  texlive-fncychap
> +  texlive-latex-extra

This isn't currently part of the instructions.

> +  which
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

Ditto for python and python-curses, especialy since we have=20
python3-curses below.

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

This is aligned with Fedora but I'm still wondering if it actually is a=20
requirement (well, if you INHERIT ccache, yes).

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

The original list had "install" but it's gone here, on purpose?

Cheers,
Quentin

