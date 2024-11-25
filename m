Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E02ED58D7A
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:27:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.51])
 by mx.groups.io with SMTP id smtpd.web10.25681.1732559218113629580
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 10:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ILQheKie;
 spf=pass (domain: cherry.de, ip: 40.107.22.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGzrq5JOXAEopjTYG9myrthbZj8X2edqoCn6CjY5M41Hy/qp2VjIcEOvbsgDXaEg2vcgU9p/GptBWIG1phJlJakcNgvPZ99ZvPT6N4oxqPmeIXQ0ceFxl35tH6qh7H92gcM6IUHe6I84zPOlVg3x0+xCibAOl1gp2Zqgiuk4snOQ9R8ZZiuyy73GW/5qCBM8WTk1eOAPeXW0ultxWLTO1jiValcAYb6un5XTqM9xnK7vXft6ZGRfbGZmdRAHj+jOzkr94AV1hMYx8RXafmKlzqCnOL0eCPSyU3p73rQqbE6iqSV7FgNgN6KZnXjV97kJKlY9Yr6ziQ3v8Ht/J/laPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IO2thHBpX+6zAp4+dVAohqHW8X3QQHeZ63T42BqYkc=;
 b=Ul4JkdZJC/pj8zac/0T89lYhtXufdS1O5gsi6/yZMA+cHlR84sr7/K1K2mZt131jHs5hYlCxbJ/KZaslyYFNeB6Y6W1JzPF4ZRhQjB/hwnNit4NEjdRwrbdF7bkcV6py0uNFQU68JHtFm7gK8BHWVSnjqOMLi236cBdiDqWM/T5gvmHhTgOEwDFrPl32278be9Zr9h/b6/aU9Eno/TV3WL2AsQQOu8Wq0Zx/TbuoAso5wibg9L5KR5XpVe5CSg0TyhFU/WkgasCj6s5OmrbOhtUu5pcEE7b0CjZwORWvk2qDaj4mQp4NZt43DmqgfWWtGBr4EKWZoVkrWYUtIwrYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IO2thHBpX+6zAp4+dVAohqHW8X3QQHeZ63T42BqYkc=;
 b=ILQheKieH3tCLN48vsHtRhMIwiF9lQcb034YKGyov0eM0Q5gSHKynuhLIaoLPT9Wls2aY3ou0sG6WO+E2TI5iHF3agiwiOa9EkOEzgftzXZddybFtadxuh6rcCjv6PsgOgFIb60SiLw9uNXwqT9IxOlWa1PBHyT6VoXdQoTwDG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9554.eurprd04.prod.outlook.com (2603:10a6:10:302::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 18:26:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 18:26:51 +0000
Message-ID: <3b8d482f-93c4-4ad8-ad74-6ed8365fcede@cherry.de>
Date: Mon, 25 Nov 2024 19:26:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] Add scripts to build the docs in
 containers
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ab5be0-dad6-49b1-c275-08dd0d7ebb21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z35v+3Lx5v6TwOdclEv0CSKo1wTefdrOuRdhy/hoNqA5Jg9sZGOoU69Shoy4?=
 =?us-ascii?Q?+FC2veJNkPECNCegQqtLJSnulvFmztW5RkiYdDPIYgOMVnBrCIIg1LGPSMkH?=
 =?us-ascii?Q?syq/KRZsRVog9HQ/YgTvahd0aoITZM3usl6crFHUzLLhxKeOrFVo20frkS2h?=
 =?us-ascii?Q?/knPjhHhjHXsn0hLLgA3ZsU51q/9Hb+iSYv6L7gv2YR3Z6fHZ6JmHzaYXIMJ?=
 =?us-ascii?Q?f5/F+ubulxJARQRzDy3vDpi6FkHwK7zm8z40W30KkATeEuWDHPupfknQGWRp?=
 =?us-ascii?Q?BN1a4knX5WjTS2vV5kjTtV415T5tD/Gm32rC09ENY9otUvk/YwA+4BP9Gwjk?=
 =?us-ascii?Q?BkIPdLalMH20BZ36Mw1OYWzZTXIJhO+FmFjXdY2OYjmUK04IGDXEfVJ5sSHM?=
 =?us-ascii?Q?9Dbi+0882cAAalNoYFm2WDh1g/eL4ztefSiLUJNtGB5ywMkthdAVu0agzgXM?=
 =?us-ascii?Q?YPzvPa5hTaNqHxzBoddTP5pXaI32SNknA+e3lBdZKOqQ46mh5JB8DQBnuuvI?=
 =?us-ascii?Q?63mOHlQNoibOgjf0tYK/stBIb9Q+sMjUmmA6YLEJxJP3BkB8GWsMasX/jd+n?=
 =?us-ascii?Q?SeSatAROV6ViQd4EcP7kZYJwcqAG8Hpds2KkFStQmLUNRBgQR/1j+oO60PaR?=
 =?us-ascii?Q?iSmFXsUZwQonYcaY7EHtS4Ej6LyKddhTqWPzvuOmfGZ3ibjxSjYGtbaCy5Kl?=
 =?us-ascii?Q?KGNNQkoBeYx8z79so5Vr2oplkpflIAvpeqGERnelSosXG826ub0KyLj4Jxm+?=
 =?us-ascii?Q?xABTsH28MM5zYP2iz5UUe3EAsVKLIvxGLYoxBBqwhEyEqgumDMmtcfRpjXDr?=
 =?us-ascii?Q?moBfxd85UWQRlc+EHS//DMzAqgQuBCsZgMtYqF5vp6PSnLwkrFsKLgxO1nUn?=
 =?us-ascii?Q?TC7WEVyu/DjjLXWUg7XDwJATUSoRb7PNGs5DCgewBXZIyUJmhmiYD4DYGzI1?=
 =?us-ascii?Q?JX9QNuBxi3F+MIKjzG00LAYydnU/gmQpUe1g+A9OdukPivDxo1MoQbLBK3Pa?=
 =?us-ascii?Q?pQvT24KJ45Dv7qsybVBvVz9XoJnkKhpQXb91QPoKy5hrf+LVjX8Luk0ZUJhl?=
 =?us-ascii?Q?QMnmctI3CFmY3ggrPPb4wS1Vv+SABvIdsvO5lOVaqsbM45dUtCLGIt74hSPe?=
 =?us-ascii?Q?n7b6M1s6hTcVMqED8pIztV/coohT7c++3ET3mKGAYxX2F1FakAMGlhzD/ohk?=
 =?us-ascii?Q?PMbzSzG/0io0xkjIvjGIZXfV1dpVd+1hi0LhRhCecvKyAO55ACPJtPHPvQEl?=
 =?us-ascii?Q?SIMZfls+u9vwNl9dLkl2qEzwliz4RYJ/tKfFu72BqWxkmm/bJzaFFGlvtp5N?=
 =?us-ascii?Q?y4Az3LRf7WqtcBZ2iNObo82eZ8JSCTSsobkUvri1twapMg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tqKchRE2laOCJWSTniGhnVEMf9smoOBs2ZuWISePWLQ8syrWzzxQiM4OJkHh?=
 =?us-ascii?Q?HhK1h6+hNBPlAJCLJPIQHVTmtNjeRpP2m/jQcZpWMRL/TDJUNc9yGb8BR+GY?=
 =?us-ascii?Q?+zCyySl7yYYf+mlG9bQrvSk+yC7AGCCG2r+nWCZoo/pC3KY1c851lwEWm2D9?=
 =?us-ascii?Q?Q4yUDU+k2To0FunHA+Ngdh3u3qtAZ03OpEY+8maXl1x/v+umsGtwwCwTCuHI?=
 =?us-ascii?Q?WFPS/CEzHdCGgPxPMTps0U64BwSOF7NaJR8cz3T4r5Itiq98gfw9E9m1y4ie?=
 =?us-ascii?Q?TWnAjcJCNUoTrhZvRohmyKPI7DnxQonBdmUx+acGhD+vmIop4iJsVdUEnceK?=
 =?us-ascii?Q?AuXhJuFD46yZVVd9rocSIIzv/VGncbKxCnvu2fHNq7GNYppu5MdzwxrvtKvm?=
 =?us-ascii?Q?xPqYyfjNva+Uyj0NdGxKJH0lr43YfjHuv2gBWHxJZHfBOQE+d4GHJyLygncu?=
 =?us-ascii?Q?ZJ3UzIc9S15yCS1qcUFFrqM71qA5jHpS50Tx36znOSWLhSOhiKR4864nC4Ab?=
 =?us-ascii?Q?4NPtX6YapnJxHKuUaxFU8qmyoPHL5joggoh7LbWnVZdSoHVYIEh7ci5rVVVV?=
 =?us-ascii?Q?+v4n52GMCqi4yO9w6I09BVZxYjHeaOEk66femQLZLd64YXriLztbNpG053xa?=
 =?us-ascii?Q?nh38yK2tqFzvGpg9StOCZZCkcNuruMNSlM0QiGCJsWhAl61rxWZXvFoHCoQh?=
 =?us-ascii?Q?5xmsbUc3Jl+uSoxW0WJwMivQfB46xMiW71WF6bDW0QRSPq/nq/E1o3CpxUXq?=
 =?us-ascii?Q?r/u4Vzg9tlmyvTaHyLyNycn4YskYgaCTzEMXDEXrXAUiSMjw4/3C0ZEGWWOv?=
 =?us-ascii?Q?I/Rsd58IIbDfeeFrruWrzYmxi/T0iOvYD1b1gUqkUuXmV5zBjhdoC8kN4iOy?=
 =?us-ascii?Q?TEx6S1W0Tl4MWyLOr+vniwKfryyt2btRXVtBUZ1ZQdd/JQnh7flLimRm4VUZ?=
 =?us-ascii?Q?+eKfFAK0wA9GnodxzokUvLjYrWuZ/DEdHOtX8tNs57h5F3CxOiO+JWRvWMFe?=
 =?us-ascii?Q?Gxe3UXy6D9Ek4xvJvyke4K9oOSEFU2M//AokMCF9Ff8ZSk5GthMjAQwESwZE?=
 =?us-ascii?Q?b5yiV/6+fwMtqAYiXmLHITZP57n4K0A6IhazMYkE+Ju8Mj6CpiioTUhPxqCc?=
 =?us-ascii?Q?HFcXSwP5beQIcQpxocumhAvj7hYukgbqnqypmsO1BskJnlTwGUuMqWhc7gpR?=
 =?us-ascii?Q?YlMhsJoFdKcASRSruiGX/akz7MS3CLsdezXoJGSnxGxIlrYKME2uM+gSqxDn?=
 =?us-ascii?Q?Nkq0XdDpwJdPZDzDWfkJOA+ICq5qFKJO/dv6rseUyM9ZDHFRVgwlWcT+ZfpM?=
 =?us-ascii?Q?sNPDGuVue/2OM+HPJsx9ZBL9SfuencwaVdej/0a9K4HQzYC16lhvKoktxiiX?=
 =?us-ascii?Q?PwEBNnlF/oODWz+5wpX/F2EpwovLcSs3Rm0EO73eslHTERJjnvgAo2YW5FeB?=
 =?us-ascii?Q?6WzyOwmDquDpOJypPtOniy3wZqyLXwjbtkAusxbdy2C+1AkjZDYDRi0KZWE/?=
 =?us-ascii?Q?O5s8barFCt7FkDKcSq0xm2Zh0otPAu2u36paUO8Joe11AEeZbwe0ZKhVvpoa?=
 =?us-ascii?Q?jBxCSFNJHTtYv1Mnqw06hX/ZdjXEHX8NssPVt+UkUasG+YjPW2joyEz98k9Q?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ab5be0-dad6-49b1-c275-08dd0d7ebb21
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 18:26:51.4661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkFjhUv1A4ozQ2v39FgyytnJmzgZ4rZ3P9489dg8sdp4CDe+qNl7jt+APdCCjPF+d4jnMkIasjd7W9q/CWfBgTBuqa8/iTMfneEsxNa/bBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9554
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 18:27:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5809

Hi Antonin,

On 11/21/24 2:22 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Add two scripts for building a container image and building the
> documentation in that image: build-docs-container and
> container-build-docs.
>=20
> For now, the documentation/tools/dockerfiles directory contains two
> Dockerfiles for building with Ubuntu 24.04 and Debian 12, but we could
> extend this to the supported distros.
>=20
> It should be possible to build the full documentation with two commands:
>=20
>    ./documentation/tools/build-docs-container ubuntu-24-04
>    ./documentation/tools/build-docs ubuntu-24-04
>=20
> The first command builds the container image by pulling the dependencies
> listed in poky.yaml.in. The second command uses this image to build the
> docs.
>=20
> CONTAINERCMD can be replaced by "podman" to build with podman.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/build-docs                     | 48 +++++++++++++++=
+++++
>   documentation/tools/build-docs-container           | 51 +++++++++++++++=
+++++++
>   .../tools/dockerfiles/Dockerfile.debian-12         | 17 ++++++++
>   .../tools/dockerfiles/Dockerfile.ubuntu-24-04      | 17 ++++++++
>   4 files changed, 133 insertions(+)
>=20
> diff --git a/documentation/tools/build-docs b/documentation/tools/build-d=
ocs
> new file mode 100755
> index 0000000000000000000000000000000000000000..2fe8aff3a9834e4f5015e04d6=
4b7462190278004
> --- /dev/null
> +++ b/documentation/tools/build-docs
> @@ -0,0 +1,48 @@
> +#!/usr/bin/env bash
> +#
> +# Build the documentation in a container built by build-docs-container.
> +#
> +# Usage:
> +#
> +#   ./documentation/tools/build-docs <image> [<command>]
> +#
> +# Where <image> is one of the keys in
> +# documentation/tools/build-docs-container's DEPS_KEYS_YQ.
> +# And <command> an optional command to run, default being to run "make p=
ublish".
> +#
> +# E.g.:
> +#
> +#   ./documentation/tools/build-docs ubuntu-24-04
> +
> +SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null &&=
 pwd)
> +CONTAINERCMD=3D${CONTAINERCMD:-docker}
> +
> +DOCS_DIR=3D"$SCRIPT_DIR/../.."
> +
> +main ()
> +{
> +  local image=3D"$1"
> +  shift
> +  local command=3D"${*:-make -C documentation publish}"
> +

Should we only require "publish" to be passed instead of make -C=20
documentation publish? I believe this should be doable with ENTRYPOINT?

> +  if [ "$CONTAINERCMD" =3D "docker" ]; then
> +    EXTRA_ARGS_RUN=3D"--user $(id -u):$(id -g)"
> +  elif [ "$CONTAINERCMD" =3D "podman" ]; then
> +    # we need net access to fetch bitbake terms
> +    EXTRA_ARGS_RUN=3D"\
> +      --cap-add=3DNET_RAW \
> +      --userns=3Dkeep-id"

please add

--security-opt label=3Ddisable

here as well, for SELinux based systems such as Fedora. My understanding=20
is that for anything that is to be used by either the host or the=20
container should disable labeling.

> +  fi
> +
> +  $CONTAINERCMD run \
> +    --rm --interactive --tty \
> +    --volume "$DOCS_DIR:/docs:rw" \
> +    --workdir "/docs" \
> +    $EXTRA_ARGS_RUN \
> +    "yocto-docs-$image" \

please prepend the image name with localhost/ to be sure we don't end up=20
downloading some yocto-docs-ubuntu from docker.io for example :)

> +    $command
> +}
> +
> +set -eu -o pipefail
> +
> +main "$@"
> diff --git a/documentation/tools/build-docs-container b/documentation/too=
ls/build-docs-container
> new file mode 100755
> index 0000000000000000000000000000000000000000..8cfe0f7aa75bf5fcfbbc0e838=
d66e0ef10f20696
> --- /dev/null
> +++ b/documentation/tools/build-docs-container
> @@ -0,0 +1,51 @@
> +#!/usr/bin/env bash
> +#
> +# Build a container ready to build the documentation be reading the depe=
ndencies
> +# listed in poky.yaml.in.
> +#
> +# Usage:
> +#
> +#   ./documentation/tools/build-docs-container <image>
> +#
> +# Where <image> is one of the keys in DEPS_KEYS_YQ. E.g.:
> +#
> +#   ./documentation/tools/build-docs-container ubuntu-24-04
> +
> +SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null &&=
 pwd)
> +CONTAINERCMD=3D${CONTAINERCMD:-docker}
> +
> +# Keys used by yq to get the dependencies from poky.yaml.in
> +declare -A DEPS_KEYS_YQ=3D(
> +  [ubuntu-24-04]=3D".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOST=
_PACKAGES_DOC_PDF"
> +  [debian-12]=3D".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOST_PA=
CKAGES_DOC_PDF"
> +)
> +
> +main ()
> +{
> +  local image=3D"$1"
> +
> +  for cmd in $CONTAINERCMD yq; do
> +    if ! which "$cmd" >/dev/null 2>&1; then
> +      echo "The $cmd command was not found. Make sure you have $cmd inst=
alled."
> +      exit 1
> +    fi
> +  done
> +
> +  local dockername=3D"Dockerfile.$image"
> +
> +  # Put all the dependencies in the deps variable
> +  for dep_key in ${DEPS_KEYS_YQ[$image]}; do
> +    deps=3D"$deps $(yq --raw-output "$dep_key" "$SCRIPT_DIR/../poky.yaml=
.in")"
> +  done
> +
> +  ( cd "$SCRIPT_DIR/dockerfiles" \
> +    && $CONTAINERCMD build \
> +    --tag "yocto-docs-$image:latest" \
> +    --file "$dockername" \
> +    --build-arg DEPS=3D"$deps" \

I am not sure this is future-proof. We'd be limited to the max length of=20
parameters one can use in a terminal. What about creating a temporary=20
file and using that temporary file from within the Dockerfile via COPY.=20
Also, you really want COPY and not MOUNT because changes in files in=20
MOUNT won't invalidate the layer IIRC.

> +    . )

Can't we just run

docker build [...] -f $dockername "$SCRIPT_DIR/dockerfiles"

to avoid having to cd into it in a subshell?

> +}
> +
> +set -e -o pipefail
> +

set -u

while we are at it :)

> +main "$@"

Question: why do we split the image creation from the running?

> diff --git a/documentation/tools/dockerfiles/Dockerfile.debian-12 b/docum=
entation/tools/dockerfiles/Dockerfile.debian-12
> new file mode 100644
> index 0000000000000000000000000000000000000000..18c9c45c3ccfc5d90a09057d8=
74512c6b9826611
> --- /dev/null
> +++ b/documentation/tools/dockerfiles/Dockerfile.debian-12
> @@ -0,0 +1,17 @@
> +FROM debian:12

Would be nice to pass the version number from the shell script as well I=20
guess?

There's a trick for that one IIRC, I'd have to check how I've done that=20
and get back to you if you're interested.

> +
> +ENV DEBIAN_FRONTEND=3Dnoninteractive
> +
> +ARG DEPS
> +ENV DEPS=3D${DEPS}
> +
> +RUN apt-get update \
> + && apt-get --yes --fix-broken upgrade \

That should not be necessary?

> + && apt-get --yes --no-install-recommends install \
> +    ${DEPS} \
> + && apt-get --yes autoremove \
> + && apt-get clean
> +
> +RUN LANG=3D"en_US.UTF-8" locale-gen
> +
> +RUN git config --global --add safe.directory /docs
> diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-24-04 b/do=
cumentation/tools/dockerfiles/Dockerfile.ubuntu-24-04
> new file mode 100644
> index 0000000000000000000000000000000000000000..6ac384c4f242b508027a92d2a=
cad490da41dc374
> --- /dev/null
> +++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-24-04
> @@ -0,0 +1,17 @@
> +FROM ubuntu:24.04
> +
> +ENV DEBIAN_FRONTEND=3Dnoninteractive
> +
> +ARG DEPS
> +ENV DEPS=3D${DEPS}
> +
> +RUN apt-get update \
> + && apt-get --yes --fix-broken upgrade \
> + && apt-get --yes --no-install-recommends install \
> +    ${DEPS} \
> + && apt-get --yes autoremove \
> + && apt-get clean
> +
> +RUN LANG=3D"en_US.UTF-8" locale-gen
> +

I believe this is not working if I remember correctly the thread with=20
Gu=C3=A9na=C3=ABl?

Otherwise, the Dockerfile are identical, so maybe parameterizing the=20
FROM line would be better than duplicating?

Cheers,
Quentin

