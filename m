Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655E1F5580B
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 10:44:15 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16814.1776681846438366062
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 03:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bmdCER7t;
 spf=pass (domain: cherry.de, ip: 52.101.70.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncHGaCUZ6Tnrv8wWRA2N5eyf2u54fQrL5/IQvkKZC7KFcpiYXXqBVC719fLTmOdZ63LtTJzdQ8S0bKVLPfyviSqtAHLJ77g53ekoTeb+oe+0CxKZ6qGhgXYm418GOxZZoH5RKMMeUbUcl2clIe0oDldY9WMARzOOE0mL8fog5Efmmeql8cp3ZpbYhtWYBrWi2O5+GKNnX6oY2PQOLYpOZoQ2noSYhIs0Bghsm1N9TLhB8lbuwnzXRWU/kInBGw3WaPhL813Udefxy/JTqhjB+L4gt/OXmEGff59OeOc9sGRj8tNvwIYrYax+2wEisrzFlYoPPdDPH/bIuNrzgkrvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J96EdzK3J6p0Dv9I6OGdUQBdgQu9F6duhfmzEeccO0=;
 b=Oj9r0TnWrs1m4qZRMhyqaR1vSFM1ffyFwrAPyihh7OcEP5o3y4550JQ8FS6iPFxU9H8iTH/xFpUmtscSd6pQbgleatxSFiYj4UspeQQJ9iuRQv7Ki6Wzb6eVum+B5N0CRiEfH0bnusp2+PRYcgfSvpXkWSi1kObRy6NhLeLzxIjXs/TASoKFOCJQpyeHqvIqJCgXD2m/H5fP2Y5St7YSjwkLORi+XssyTYCnMREPThQHFcd9nHOS55+jJWz/hobb6LSdDL1xFOhWpVjHE4bfiYJlEUlsRMFvludjDkmCVoWdlfHnDe6KGUI8B200Wa9BLgbCmqw6+hcsWGPtcWNo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J96EdzK3J6p0Dv9I6OGdUQBdgQu9F6duhfmzEeccO0=;
 b=bmdCER7tbqLFYtrflN0LCOLoX1MI2+Z7yVS5yUmkrEg4znCM/Fca8m8l49s+DOFgnR+k3olAZDA+d3b8TM6mUhPRAXCP/NSIiWDpwlriro51dh7N48kqwynPU/whEPTQaAmA/l+wkB6x5gHO9lW0IB93YC6JkWg7tClel02xEyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI1PR04MB9931.eurprd04.prod.outlook.com (2603:10a6:800:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 10:44:01 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 10:44:00 +0000
Message-ID: <20adf95e-b7ee-428c-b0b1-72c3577326f5@cherry.de>
Date: Mon, 20 Apr 2026 12:43:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/2] ref-manual/system-requirements.rst: make
 python3-websockets a default host requirement
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com>
 <20260420-python3-websockets-requirement-v2-1-a273a01a6f44@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260420-python3-websockets-requirement-v2-1-a273a01a6f44@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIXP296CA0005.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::9) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI1PR04MB9931:EE_
X-MS-Office365-Filtering-Correlation-Id: 20262ffa-762f-4a63-16ed-08de9ec9bbc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	EaLnA17t9pRDFXl0zCUiQ9PVUPoqwHgo+H+DUwBUAdbhvi5QJAzVzId48NWhCL97BHy5mldgTrpsmsLHZImcIjuFrcNmzLQ7Wri7J6zDdZlBXL1lAo6oheVpFgC+QFCKAAnkKebaXXVVw1uNidLzvgpgxQOgpzqN1yBxG7F9LtteL/GvABSkXOclTzm8em9dJUevFyQdcq3wkUyGdw00fth/sliCb93L+6WvXtaU7yqTDbjMVwaD2jfQBdE8+HNxeWEshuqMuFSuyDsiVADFJhaD3HvJcetukJCD6Wb0KTco/sccJmY4q2LjQLr66/S7W9OA59E6hFfOh1ic29aOjfaszTTRzjueDsOUGnhVxMYOTsWPGgs/qSt9Bq2GD7yOt5UshYE5Gjtfb3LNUwqAwrc69OxkcZTDBCglnHyDu1ADnmKETELcg5VCvZ1IqBGQlZXElguAgPQPqDh0YuutG4VDUcZrDzdNa74tLTy1/a7Y8Sf0y3rS2u7dgIhJlRxDqn+Tqi3cmO+deA/ho/3ZMX/CeoSKeHFy8JDGxiy2MvdFIgKa+locpho4sw3S6QC4pRytlBdBXK72XgHaEUgJLHlLo9s4asSkWhP9uQ0euQbspRLEGbwBmunJ6hAua4hC3WJ0XKsEpfuTl52B4fm13rf0v+yZldUvKdL2xoF2KvLbssZsiQ0wku4DHMAjDKff
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUF2dmdtcnAvNFAvdDlYazZtZWJ5dHRNVTJjeFpEZFpwUkVYVmJ3Sjg0dUh2?=
 =?utf-8?B?Z1BSMTdZUmxhRXpna2NIWjljaG1rbVVlbDRGdUhRK0Y0dWNwYWxVZnlqdXNh?=
 =?utf-8?B?YzZmYW1lNUEyRVhRZndCdWNEQ0F4OW1pUWpMSmp2WXhhK1pmL213SzVYZEtn?=
 =?utf-8?B?cUdwS0srNFFsVktOT245MjBuOGtkOVI0M2tOMysvK0VyWmUzUlhTS0ljb2NL?=
 =?utf-8?B?MmlkYzdnQk0vc3ZXWDdoWVY1NGRJajBCc3pUb2hrSHIvTEg0QlV2Z3Y3RURE?=
 =?utf-8?B?b2FqR2ZJb3kzY2gxT3ROWGFnV3d4Z0xxcDdYMlVoc2djTTd6dkpYdGlzSmtL?=
 =?utf-8?B?QTFOaS9HWVhVZ095c21DVjhjajJTaW1YRUFseStyTzJLc1ArQ1puY1BTT2ZV?=
 =?utf-8?B?QjJtTkV6dlNHZ2tmaDRqYTFBS1BFbDduY01SZGRiZW4wQkFJKzFRS2dLdlZ4?=
 =?utf-8?B?SkovTnBlMCs2MlJhcHFPM3Y3Vmp5dlhTYmZ4L2RiQVlxYndmdzUxTmpLbmxW?=
 =?utf-8?B?SWFMUnVxVXVWWm1Ub3NnSDhOMFU4RkVuei81OGdQYVZ6bmJmS0U1VWNZUnRu?=
 =?utf-8?B?VDJUQ1BUc1cydlZmcVR4akJlRFI4NzljdGc1TTAwd3A2Vjh1YS9uWXFFYWhK?=
 =?utf-8?B?SWk2V1h4R2tUN0tRdjZtUGFhb0RzUjVQTjg5ZnE3d2dwZG1DZUJLTkVCdEsy?=
 =?utf-8?B?Z05Lcy8rbHEvSUxkNEFUUEU2aGhSU0k5dDFnYmZjdDRNS01vMzJ5TEJQKzZv?=
 =?utf-8?B?MVpYY3NwbnFhbU9iaVI2ZDN1UXAzalgvcFlqdlZva3VMNGlDOC9mVFRBd2ZJ?=
 =?utf-8?B?bTIxeGp3Wkc4WmFDVEtjeHExbzcxVnZpRWhxaExSZzVWVjVwd0o0KzNhMk9V?=
 =?utf-8?B?NlR6RVhSZ3ptbFZ4NFR5ZmEvTkd6Q0szVVlFVXk1ZlhhVGdDR0IxSVptQkQv?=
 =?utf-8?B?Y1NTTnh4RlJhWUZpWnRTVVNVYWVNVlVtK0NTdUlOcXJSaEpERGpaMkJvczFm?=
 =?utf-8?B?eTBlQVZFdGVzYXNPVGlrejdVZDl4SFpwOUo0eFJuYVF1SjhMcGtsUHRkVlZT?=
 =?utf-8?B?QUlIeTVOL0ZMazZUT2FUR1JYeVlpNnI5UmxTUmlma3JSRk9CRUpIcVBua0pt?=
 =?utf-8?B?YjVVUXhuRy9GMnFTQ3gwQnZXMXowTlZUMU1UMTZ3cTNkOFFSUzdvUnRKa0Vw?=
 =?utf-8?B?S0VBS3Z4T0YzeU9zajZuTWlnMzRxNVJlU1BVaXpCRkw3SUluOFc3aWtNV3E5?=
 =?utf-8?B?akJFVlhlNlJVTmRoT1ZCWWRGWE1XMWNUWktpOEZIVHg3VlFPZnZ1cTJSVHhR?=
 =?utf-8?B?ZElZS0wwdzR4SzJNaUlSRWxieW93WnptUGN0VlJjQ1dma29mYVJoeFZodHpq?=
 =?utf-8?B?SmhFaTJVTjA3Tm9JNWdyaURUNGVEZzFaNWZkbWNzWi9KN1pGSDdoYTR5S2Jt?=
 =?utf-8?B?WnNwWk1FTFdFTWNaZHFteEZqNVgrWHNYRk0xSi9yV29NS09LSFNGazdMWWVi?=
 =?utf-8?B?YXVWdStsNUFoU1ltMUVRcmUxUzlpQ2EwZnJTR3dkaHk1STZpZXpQd3ZiMW90?=
 =?utf-8?B?cjg3VytrbG53YjdkSmU3NEp6MGtBN0hDcEllQTlhRjlySmcvM3NWZmE4cGk0?=
 =?utf-8?B?RUNQQWx6Q0R1eHp0OThUVmdzU1BYZjFhTEVhcFdSaFZqRUNOeFpaM3Z5cUtD?=
 =?utf-8?B?OFdLV20zd1kyWnFvTk9LaU42SWdDVG9FNFJUQnIyV1JDMHZCVW9OMEZpbkhv?=
 =?utf-8?B?QTIrMWJPeUFMYmV4SEgvdmxoMVNGeDBqM3NSelVIdTYwMlBaTmszaUtoT2pr?=
 =?utf-8?B?VUtEOHkzdUMrV2pMVzhWVzZoZFFsYU1vbWNlOTFpSG1zWlJ4UnRmd2VCd0NN?=
 =?utf-8?B?QVdiam14Nk10am5YRUg2OHNjS1NqQWtZbE1yS2wrazUzZmpKYXVIMnV4RGF3?=
 =?utf-8?B?MXRtR1R0NjZmTlZKdTZncmZlNE9qMThYZ3ltd2Y4RUJ4Q2hSdnRxYVJJOXRp?=
 =?utf-8?B?RVdKdktKL2FWWlhWbUxid1lVRGhpR0RSYm5YSzJxRXc3N3dRQytSM1hyNy9Q?=
 =?utf-8?B?eXEybE1yNFBWNytLbFArRm85b0RlRDB4aEI5NEZ2bEtYUDRuQ3VjdUZ4c2xi?=
 =?utf-8?B?L2FWcElTb2FQTjFaaXpkOWZGZFROc3lBaDZ3aVhBUWdQSVcyVlNNMDg0L0pE?=
 =?utf-8?B?V0hFcHRCdVB3V3dtM0E4QkhlSHU4bUZFSTVmdmhaSHZKbTcyZFZqdVNjUXhE?=
 =?utf-8?B?Z1Q3eWVoQzEwYlg4TFB5WnNOMGFjZVg3U3hzQnlqd2tubk1PdXROM25kY0w2?=
 =?utf-8?B?RGxqRVJSYWVjS3Y4eFZKaFRZK29OR1NmUllyTDIrcU96aWlFREVBRGJSQnRW?=
 =?utf-8?Q?IJVcXbFpl2YMRPFPL7bqgu9eGScXisuPi9xF5?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 20262ffa-762f-4a63-16ed-08de9ec9bbc0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:44:00.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkbjKiN8qSmWNlor03CXF/rhAziiP3jjVOiAMJZpJMdZqi9Lfp7f1szjxXPOKoTXb5XRK9qWsRSdypbFvpLGvDRdyuMdGNWyFKPT5hqtCoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9931
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 10:44:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9286

Hi Antonin,

On 4/20/26 11:52 AM, Antonin Godard via lists.yoctoproject.org wrote:
> When configuring the project through bitbake-setup we can choose the
> "poky-with-sstate" configuration, which requires the python3-websockets
> package.
> 
> Add this package as a host requirement (under different names depending
> on the distro).
> 
> Alma, CentOS, and Rocky have a requirement on the buildtools tarball,
> which already contains this package, so we don't need to add it for
> them.
> 
> On Ubuntu 22.04 and Debian 11, the version of python3-websockets
> provided by the distribution is too old compared to what we need [1].
> Add a separate set of instructions for these.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst   | 28 ++++++++++++++++++++++
>   .../host_packages_scripts/fedora_essential.sh      |  2 +-
>   .../opensuse_essential_16.0.sh                     |  2 +-
>   3 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 298832dd9..baa965573 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -166,6 +166,34 @@ Ubuntu and Debian
>   
>   .. include:: ubuntu-debian-host-packages-nodocs.rst
>   
> +Additionally, on distributions other than Debian 11 and Ubuntu 22.04 (otherwise
> +see note below), install the following package:
> +
> +.. code-block:: console
> +
> +   $ sudo apt install python3-websockets
> +

Maybe use apt-get here? I know we have one or the other across the 
code-base. For some reason, I can't bring myself to use apt, it always 
results in weird behaviors I don't have using apt-get on servers (I 
don't run Debian-based on my own machines).

> +.. note::
> +
> +   On Debian 11 and Ubuntu 22.04, the requirement on the version of

A bit awkward wording to me, would

the minimum version for ``python3-websockets`` is not satisfied...

work better?

> +   ``python3-websockets`` is not satisfied by the host distribution. This
> +   package is used for fetching pre-built :ref:`shared state
> +   <overview-manual/concepts:shared state>` artifacts from upstream Yocto Project
> +   servers (see :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` for more
> +   information).
> +
> +   In order to use this feature, you can get the correct version of
> +   ``python3-websockets`` by either:
> +
> +   -  Using a :term:`buildtools` tarball by following the
> +      :ref:`system-requirements-buildtools` section below.
> +
> +   -  Installing ``python3-websockets`` using `Pip <https://pip.pypa.io/en/stable/>`__:
> +
> +      .. code-block:: console
> +
> +         $ pip install websockets
> +

websockets 9.1 supports Python 3.9 which is available in Debian 11 and 
Ubuntu 22.04 so it'll get at least that version (it's not because a 
newer version of a package is available on PyPI that your system can 
install it; and the opposite is true, you may have a too new Python 
version for the last package version available (e.g. tensorflow-lite 
isn't compatible with Python 3.14)). Can you check what happens if the 
user already has python3-websockets installed on the system and runs 
this command? My hunch is it'll not get updated to >=9.1 without 
-U/--upgrade. Also, running -U will likely break their system if any of 
the hsot packages depend on that older version of websockets... Maybe we 
should only be using Python packages from a virtualenv?

>   Here are the packages needed to build Project documentation manuals:
>   
>   .. literalinclude:: ../tools/host_packages_scripts/ubuntu_docs.sh
> diff --git a/documentation/tools/host_packages_scripts/fedora_essential.sh b/documentation/tools/host_packages_scripts/fedora_essential.sh
> index 99e5d2c0b..55b8b704b 100644
> --- a/documentation/tools/host_packages_scripts/fedora_essential.sh
> +++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
> @@ -1 +1 @@
> -sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
> +sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip python3-websockets rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
> diff --git a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
> index e557ae4fb..96bdd9317 100644
> --- a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
> +++ b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
> @@ -1 +1 @@
> -sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python3-xml rpcgen socat tar wget which xz zstd
> +sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python313-websockets python3-xml rpcgen socat tar wget which xz zstd

Can you rather use python3-websockets here? 
https://opensuse.pkgs.org/16.0/opensuse-oss/python313-websockets-14.2-160000.2.2.aarch64.rpm.html 
says it provides and replaces python3-websockets. That should make the 
upgrade to the next Leap version easier since I'm assuming it may switch 
to Python 3.14 by then?

Cheers,
Quentin

