Return-Path: <ypa.takayasu.ito@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C13EC47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 13:33:46 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web10.14804.1706535218410074395
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 05:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e48nSDDn;
 spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: ypa.takayasu.ito@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-3be61772d9aso278137b6e.3
        for <docs@lists.yoctoproject.org>; Mon, 29 Jan 2024 05:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706535217; x=1707140017; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TlnbXwGC8SSzMrEu+K4/FLvJbCNnPyzHhnWlj7j/HxA=;
        b=e48nSDDnDDMNIZ27oke8weXVi+r1hZ/dQn1/4VDBFJyiTklcEeutBz0+eE1JMKAvFR
         V/SR7P/UI8c/2RfozzxYd+bbUFUfLrRCd7iUxqN6VfkVYEFYbE0KYlEBsNn98dvcaJ+F
         pCbQB7FUpiikmMCP6+P+1vZ1GdOvZq7DgmPi+A9CBtFg7y1lTaZa+jvADBKF9yAzYKPY
         SERYJvRvmCMROEAT782E9Jq8Uyio6vefHlrANO3GOEc8e0uC+yMlHUnosSHE0g/Rv6Dz
         Z1xVDCqlAFDyt5NNuJyVlCEHHMwBe7GAS87yiOaRdM6RfiGy6cQjVQhPJQ9Yq1+jw3dX
         AZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706535217; x=1707140017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlnbXwGC8SSzMrEu+K4/FLvJbCNnPyzHhnWlj7j/HxA=;
        b=KglKNUOlNYTOpX/hKkWAUrQamOe13X+Qqq8l1DGpcDyQYvxd/DkIgjwOQpRBp/Dwnb
         E8+VVKoCIsD0RyjEfKJzvR0iv18onFS4TtWfCexTvP0Gb5bLRTiA+QSH2Dw2GUpe4ao0
         zdH63KcpKqJ/KZIO/eeMLF/gFRWlexIlGTLzcfAfh5uiFWypbFF9lxOH2WQXl+2XVKEI
         ShpfkuBKvpWpEhRMKYk/7Floe9CnxCYWTXx6ERqB8F+y1BGunQ0hWqg4yDj8WwSg6xRL
         azByVC760nMMXo//2gFws9u4JYbaR+YzZZ/itKDIaC5ZpKbTn34U4Lkkolsr5f2dbHWr
         gaEw==
X-Gm-Message-State: AOJu0YxoUuSruk4LyMDgj92FlTTnayw0hKU6UXPGVTb+/oK9JN8WAYa6
	tZI2lB1M2xbnNig788QxdFSqSiaY1DU+iflqNxIC7S8VLuWfnwOyDja0wjSy6+I=
X-Google-Smtp-Source: AGHT+IFr0vAUxWFPGr2gfC2ldOaxpM7PZihVGsp+3c2T9NUqTSL5qmXqUiAsJK3NBYMVjtZqWgv2lQ==
X-Received: by 2002:a05:6808:23c3:b0:3be:4ea8:3abb with SMTP id bq3-20020a05680823c300b003be4ea83abbmr2543828oib.1.1706535217140;
        Mon, 29 Jan 2024 05:33:37 -0800 (PST)
Received: from ?IPV6:2400:2412:6a60:8500:c83c:a2e2:d6f2:a7ca? ([2400:2412:6a60:8500:c83c:a2e2:d6f2:a7ca])
        by smtp.gmail.com with ESMTPSA id r7-20020aa78447000000b006dd7b08b336sm5862181pfn.20.2024.01.29.05.33.36
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 05:33:36 -0800 (PST)
Message-ID: <497c3940-b6c3-4863-a4a8-e9b63eb7a483@gmail.com>
Date: Mon, 29 Jan 2024 22:33:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 4.0.16
To: docs@lists.yoctoproject.org
References: <20240129055704.1812957-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Takayasu Ito <ypa.takayasu.ito@gmail.com>
In-Reply-To: <20240129055704.1812957-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jan 2024 13:33:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4795

Hi Lee,

I see that the Fixed and Security Fixes are listed in opposite places.

In the actual Security Fixes, cpio is listed above curl if it is listed in ascending order.

In the actual Fixes section, "docs" and "documentation" are listed differently for the same subject.
I also need to be careful about the use of "manuals" and "documentation".

> +-  docs: add :term:`CONVERSION_CMD` definition
< manuals: add :term:`CONVERSION_CMD` definition

# https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=064936af55819541a9653928389a62a1a9b7c9f1
# -rw-r--r--	documentation/migration-guides/migration-2.2.rst	2		
# -rw-r--r--	documentation/migration-guides/migration-2.4.rst	2	
# -rw-r--r--	documentation/migration-guides/migration-3.4.rst	2
# -rw-r--r--	documentation/ref-manual/variables.rst	13
# Both migration-guides and ref-manual are manuals.

> +-  documentation: Add :term:`UBOOT_BINARY`, extend :term:`UBOOT_CONFIG`
< manuals: Add :term:`UBOOT_BINARY`, extend :term:`UBOOT_CONFIG`
  or
< ref-manual: Add :term:`UBOOT_BINARY`, extend :term:`UBOOT_CONFIG`

# https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=f634b9852e22b359fa8ffd4fceb0881e5da9f666
# -rw-r--r--	documentation/ref-manual/classes.rst	2
# -rw-r--r--	documentation/ref-manual/variables.rst	39

> +-  manuals: brief-yoctoprojectqs: align variable order with default local.conf
< documentation/brief-yoctoprojectqs/index.rst
:  brief-yoctoprojectqs: align variable order with default local.conf

# https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=9b7cc27c3987e83e20ed810a6c6dfe3aaa3a038f
# -rw-r--r--	documentation/brief-yoctoprojectqs/index.rst	4
# The change target is a single document.

> +-  manuals: document VSCode extension
< docs: document VSCode extension

# https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=78e79d47c2e08a15b7833bc50ceb47f4854e8efe
# -rw-r--r--	documentation/dev-manual/building.rst	4
# -rw-r--r--	documentation/dev-manual/start.rst	15
# -rw-r--r--	documentation/overview-manual/development-environment.rst	8
# -rw-r--r--	documentation/overview-manual/yp-intro.rst	20
# -rw-r--r--	documentation/ref-manual/resources.rst	5
# -rw-r--r--	documentation/what-i-wish-id-known.rst	7
# The VSCode extension that became the fixes also includes what-i-wish-id-known.rst, which is not classified as manual, so it would be better to use "docs".


> +-  manuals: fix URL
< documentation/what-i-wish-id-known.rst: fix URL

# https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=8caaab325250fcfa6aa5753c77cc36f5ea6bab8a
# -rw-r--r--	documentation/what-i-wish-id-known.rst	5
# The change target is a single document.



On 2024/01/29 14:57, Lee Chee Yang wrote:

> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-4.0.rst          |   1 +
>   .../migration-guides/release-notes-4.0.16.rst | 191 ++++++++++++++++++
>   2 files changed, 192 insertions(+)
>   create mode 100644 documentation/migration-guides/release-notes-4.0.16.rst
>
> diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
> index 09fb8ca04..dfe5e186e 100644
> --- a/documentation/migration-guides/release-4.0.rst
> +++ b/documentation/migration-guides/release-4.0.rst
> @@ -22,3 +22,4 @@ Release 4.0 (kirkstone)
>      release-notes-4.0.13
>      release-notes-4.0.14
>      release-notes-4.0.15
> +   release-notes-4.0.16
> diff --git a/documentation/migration-guides/release-notes-4.0.16.rst b/documentation/migration-guides/release-notes-4.0.16.rst
> new file mode 100644
> index 000000000..60bfbd96b
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-4.0.16.rst
> @@ -0,0 +1,191 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-4.0.16 (Kirkstone)
> +------------------------------------------
> +
> +Security Fixes in Yocto-4.0.16
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  bitbake: asyncrpc: Add context manager API
> +-  bitbake: data: Add missing dependency handling of remove operator
> +-  bitbake: lib/bb: Add workaround for libgcc issues with python 3.8 and 3.9
> +-  bitbake: toastergui: verify that an existing layer path is given
> +-  build-appliance-image: Update to kirkstone head revision
> +-  contributor-guide: add License-Update tag
> +-  contributor-guide: fix command option
> +-  contributor-guide: use "apt" instead of "aptitude"
> +-  cpio: upgrade to 2.14
> +-  cve-update-nvd2-native: faster requests with API keys
> +-  cve-update-nvd2-native: increase the delay between subsequent request failures
> +-  cve-update-nvd2-native: make number of fetch attemtps configurable
> +-  cve-update-nvd2-native: remove unused variable CVE_SOCKET_TIMEOUT
> +-  dev-manual: Discourage the use of SRC_URI[md5sum]
> +-  dev-manual: layers: update link to YP Compatible form
> +-  dev-manual: runtime-testing: fix test module name
> +-  dev-manual: start.rst: update use of Download page
> +-  docs: add :term:`CONVERSION_CMD` definition
> +-  documentation: Add :term:`UBOOT_BINARY`, extend :term:`UBOOT_CONFIG`
> +-  elfutils: Disable stringop-overflow warning for build host
> +-  externalsrc: Ensure :term:`SRCREV` is processed before accessing :term:`SRC_URI`
> +-  linux-firmware: upgrade to 20231030
> +-  manuals: brief-yoctoprojectqs: align variable order with default local.conf
> +-  manuals: document VSCode extension
> +-  manuals: fix URL
> +-  migration-guides: add release notes for 4.0.15
> +-  migration-guides: release 3.5 is actually 4.0
> +-  perl: upgrade to 5.34.3
> +-  poky.conf: bump version for 4.0.16
> +-  pybootchartgui: fix 2 SyntaxWarnings
> +-  python3-ptest: skip test_storlines
> +-  ref-manual: Fix reference to MIRRORS/PREMIRRORS defaults
> +-  ref-manual: classes: remove insserv bbclass
> +-  ref-manual: releases.svg: update nanbield release status
> +-  ref-manual: resources: sync with master branch
> +-  ref-manual: update tested and supported distros
> +-  test-manual: add links to python unittest
> +-  test-manual: add or improve hyperlinks
> +-  test-manual: explicit or fix file paths
> +-  test-manual: resource updates
> +-  test-manual: text and formatting fixes
> +-  test-manual: use working example
> +-  testimage: Exclude wtmp from target-dumper commands
> +-  testimage: drop target_dumper, host_dumper, and monitor_dumper
> +-  tzdata: Upgrade to 2023d
> +
> +
> +Fixes in Yocto-4.0.16
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +-  curl: Revert "curl: Backport fix CVE-2023-32001"
> +-  cpio: Fix :cve_mitre:`2023-7207`
> +-  curl: Fix :cve:`2023-46218`
> +-  dropbear:Fix :cve:`2023-48795`
> +-  ffmpeg: Fix :cve:`2022-3964` and :cve:`2022-3965`
> +-  ghostscript: Fix :cve:`2023-46751`
> +-  gnutls: Fix :cve:`2024-0553` and :cve:`2024-0567`
> +-  go: Fix :cve:`2023-39326`
> +-  openssh: Fix :cve:`2023-48795`, :cve:`2023-51384` and :cve:`2023-51385`
> +-  openssl: Fix :cve:`2023-6129` and :cve_mitre:`2023-6237`
> +-  pam: Fix :cve_mitre:`2024-22365`
> +-  perl: Fix :cve:`2023-47038`
> +-  qemu: Fix :cve:`2023-5088`
> +-  sqlite3: Fix :cve:`2023-7104`
> +-  systemd: Fix :cve:`2023-7008`
> +-  tiff: Fix :cve:`2023-6228`
> +-  xserver-xorg: Fix :cve:`2023-6377`, :cve:`2023-6478`, :cve:`2023-6816`, :cve_mitre:`2024-0229`, :cve:`2024-0408`, :cve:`2024-0409`, :cve_mitre:`2024-21885` and :cve_mitre:`2024-21886`
> +-  zlib: Ignore :cve:`2023-6992`
> +
> +
> +Known Issues in Yocto-4.0.16
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- N/A
> +
> +
> +Contributors to Yocto-4.0.16
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  Aatir Manzur
> +-  Archana Polampalli
> +-  Dhairya Nagodra
> +-  Dmitry Baryshkov
> +-  Enguerrand de Ribaucourt
> +-  Hitendra Prajapati
> +-  Insu Park
> +-  Joshua Watt
> +-  Justin Bronder
> +-  Jörg Sommer
> +-  Khem Raj
> +-  Lee Chee Yang
> +-  mark.yang
> +-  Marta Rybczynska
> +-  Martin Jansa
> +-  Maxin B. John
> +-  Michael Opdenacker
> +-  Paul Barker
> +-  Peter Kjellerstedt
> +-  Peter Marko
> +-  Poonam Jadhav
> +-  Richard Purdie
> +-  Shubham Kulkarni
> +-  Simone Weiß
> +-  Soumya Sambu
> +-  Sourav Pramanik
> +-  Steve Sakoman
> +-  Trevor Gamblin
> +-  Vijay Anusuri
> +-  Vivek Kumbhar
> +-  Yoann Congal
> +-  Yogita Urade
> +
> +
> +Repositories / Downloads for Yocto-4.0.16
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +poky
> +
> +-  Repository Location: :yocto_git:`/poky`
> +-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
> +-  Tag:  :yocto_git:`yocto-4.0.16 </poky/log/?h=yocto-4.0.16>`
> +-  Git Revision: :yocto_git:`54af8c5e80ebf63707ef4e51cc9d374f716da603 </poky/commit/?id=54af8c5e80ebf63707ef4e51cc9d374f716da603>`
> +-  Release Artefact: poky-54af8c5e80ebf63707ef4e51cc9d374f716da603
> +-  sha: a53ec3a661cf56ca40c0fbf1500288c2c20abe94896d66a572bc5ccf5d92e9d6
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/poky-54af8c5e80ebf63707ef4e51cc9d374f716da603.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/poky-54af8c5e80ebf63707ef4e51cc9d374f716da603.tar.bz2
> +
> +openembedded-core
> +
> +-  Repository Location: :oe_git:`/openembedded-core`
> +-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
> +-  Tag:  :oe_git:`yocto-4.0.16 </openembedded-core/log/?h=yocto-4.0.16>`
> +-  Git Revision: :oe_git:`a744a897f0ea7d34c31c024c13031221f9a85f24 </openembedded-core/commit/?id=a744a897f0ea7d34c31c024c13031221f9a85f24>`
> +-  Release Artefact: oecore-a744a897f0ea7d34c31c024c13031221f9a85f24
> +-  sha: 8c2bc9487597b0caa9f5a1d72b18cfcd1ddc7e6d91f0f051313563d6af95aeec
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/oecore-a744a897f0ea7d34c31c024c13031221f9a85f24.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/oecore-a744a897f0ea7d34c31c024c13031221f9a85f24.tar.bz2
> +
> +meta-mingw
> +
> +-  Repository Location: :yocto_git:`/meta-mingw`
> +-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
> +-  Tag:  :yocto_git:`yocto-4.0.16 </meta-mingw/log/?h=yocto-4.0.16>`
> +-  Git Revision: :yocto_git:`f6b38ce3c90e1600d41c2ebb41e152936a0357d7 </meta-mingw/commit/?id=f6b38ce3c90e1600d41c2ebb41e152936a0357d7>`
> +-  Release Artefact: meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> +-  sha: 7d57167c19077f4ab95623d55a24c2267a3a3fb5ed83688659b4c03586373b25
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7.tar.bz2
> +
> +meta-gplv2
> +
> +-  Repository Location: :yocto_git:`/meta-gplv2`
> +-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
> +-  Tag:  :yocto_git:`yocto-4.0.16 </meta-gplv2/log/?h=yocto-4.0.16>`
> +-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
> +-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> +-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
> +
> +bitbake
> +
> +-  Repository Location: :oe_git:`/bitbake`
> +-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
> +-  Tag:  :oe_git:`yocto-4.0.16 </bitbake/log/?h=yocto-4.0.16>`
> +-  Git Revision: :oe_git:`ee090484cc25d760b8c20f18add17b5eff485b40 </bitbake/commit/?id=ee090484cc25d760b8c20f18add17b5eff485b40>`
> +-  Release Artefact: bitbake-ee090484cc25d760b8c20f18add17b5eff485b40
> +-  sha: 479e3a57ae9fbc2aa95292a7554caeef113bbfb28c226ed19547b8dde1c95314
> +-  Download Locations:
> +   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/bitbake-ee090484cc25d760b8c20f18add17b5eff485b40.tar.bz2
> +   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/bitbake-ee090484cc25d760b8c20f18add17b5eff485b40.tar.bz2
> +
> +yocto-docs
> +
> +-  Repository Location: :yocto_git:`/yocto-docs`
> +-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
> +-  Tag: :yocto_git:`yocto-4.0.16 </yocto-docs/log/?h=yocto-4.0.16>`
> +-  Git Revision: :yocto_git:`aba67b58711019a6ba439b2b77337f813ed799ac </yocto-docs/commit/?id=aba67b58711019a6ba439b2b77337f813ed799ac>`
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4794): https://lists.yoctoproject.org/g/docs/message/4794
> Mute This Topic: https://lists.yoctoproject.org/mt/104026711/7581020
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [ypa.takayasu.ito@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
Takayasu Ito
Yocto Project Ambassador
ypa.takayasu.ito@gmail.com


