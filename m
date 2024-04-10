Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53FCCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:17:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.166788.1712755044424020110
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 06:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pnExqB0w;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87C2060008;
	Wed, 10 Apr 2024 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712755041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tohoIuLm/zNyFFNGotITWsqpRH8p46hwQ518l5CowS4=;
	b=pnExqB0w9euvGe5ZAGvBiiDGNdcw4QvocJ4JT79Xqtx1IxvwoejEVNKqnNcTTFmmd6IuIF
	DnrPzv2HivjqiSi5rLPCVA5bGnbAySMRxUv6wi0MttXQDTuuI6SIvEcLSvXalXSdxjXc/P
	oYXXAMdd7pfPvw2pU3/HbXu4DUBflMgwcRkVfDmzNfpvhh38I9cZ58EeileRzq6aNXgGst
	0vrW8xqjEWm0EKxjYXwVfP28NajGQFO2VGAV6dOze/egjhaDkTFApBZuyw7HwNTs0+M6hZ
	DUkmSaTd21axsfyJDLjtCfLus4XEi3Z+vdp+fN2z2iXUeV0ShCYXdl8NFq7WlQ==
Message-ID: <701f21d1-3f72-46ad-99a1-457ca816077d@bootlin.com>
Date: Wed, 10 Apr 2024 15:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v2 1/2] release-notes: add updates for 5.0
To: joaomarcos.costa@bootlin.com
References: <20240410094746.2978238-1-joaomarcos.costa@bootlin.com>
 <20240410094746.2978238-2-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240410094746.2978238-2-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 13:17:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5106

Hi again João,

Thanks for these updates.

On 4/10/24 at 11:47, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> - add new core recipes section
> - add new variables
> - add arch-specific enhancements
> - add kernel-related enhancements
> - add qemu enhancements
> - add rust enhancements
> - add wic enhancements
> - add sdk-related improvements
> - add testing enhancements
> - add utility script changes
> - add packaging changes
> - add bitbake improvements
> - add miscellaneous changes
> ---
>   .../migration-guides/release-notes-5.0.rst    | 123 +++++++++++++++++-
>   1 file changed, 122 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index 0a740688f..1c4b300be 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -6,7 +6,7 @@ Release notes for 5.0 (scarthgap)
>   New Features / Enhancements in 5.0
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> --  Linux kernel 6.6, gcc 13.2, glibc 2.39, LLVM 18.1, and over XXX other recipe upgrades
> +-  Linux kernel 6.6, gcc 13.2, glibc 2.39, LLVM 18.1, and over 300 other recipe upgrades
>   
>   -  New variables:
>   
> @@ -14,20 +14,108 @@ New Features / Enhancements in 5.0
>         internal CVE database for incremental update (instead of a full
>         redownload).
>   
> +   -  :term:`RPMBUILD_EXTRA_PARAMS`: support extra user-defined fields without
> +      crashing the RPM package creation.
> +
> +   -  :term:`OPKG_MAKE_INDEX_EXTRA_PARAMS`: support extra parameters for
> +      ``opkg-make-index``.
> +
> +   -  :term:`EFI_UKI_PATH`, :term:`EFI_UKI_DIR`: define the location of UKI
> +      image in the EFI System partition.
> +
>   -  Architecture-specific enhancements:
>   
> +   -  ``genericarm64``: a new ``MACHINE`` to represent a 64-bit General Arm
> +      SystemReady platform.


s/``MACHINE``/:term:`MACHINE`/
Fixed.

> +
> +   -  Add Power8 tune to PowerPC architecture.
> +
> +   -  ``arch-armv9``: remove CRC and SVE tunes, since FEAT_CRC32 is now mandatory
> +      and SVE/SVE2 are enabled by default in GCC's ``-march=armv9-a``.
> +
>   -  Kernel-related enhancements:
>   
> +   - The default kernel is the current LTS (6.6).
> +
> +   - Added suport for ``genericarm64``.

s/suport/support/
s/Added/add/ (we're using the present tense)
Fixed

> +
>   -  New core recipes:
>   
> +   -  `bmaptool <https://github.com/yoctoproject/bmaptool>`__: a tool for
> +      creating block maps for files and flashing images, being now under Yocto
> +      Project umbrella.


The Yocto Project umbrella. Fixed.

> +
> +   -  ``core-image-initramfs-boot``: a minimal initramfs image, containing just
> +      udev and init, designed to find the main root filesystem and pivot to it.
> +
> +   -  `lzlib <https://www.nongnu.org/lzip/lzlib.html>`__: a data compression
> +      library that provides LZMA compression and decompression functions.
> +
> +   -  `lzop <https://www.lzop.org/>`__: a compression utility based on LZO
> +      library, that was brought back after a (now reverted) removal.
> +
> +   -  `python3-jsonschema-specifications <https://pypi.org/project/jsonschema-specifications/>`__:
> +      the support files for JSON Schema Specifications (meta-schemas and
> +      vocabularies), added as a new dependency of ``python3-jsonschema``.
> +
> +   -  `python3-maturin <https://github.com/pyo3/maturin>`__: a project that
> +      allows building and publishing Rust crates as Python packages.
> +
> +   -  `python3-meson-python <https://github.com/mesonbuild/meson-python>`__: a
> +      Python build backend that enables Meson build-system for Python packages.
> +
> +   -  `python3-pyproject-metadata <https://pypi.org/project/pyproject-metadata/>`__:
> +      a class to handle PEP 621 metadata, and a dependency for
> +      ``python3-meson-python``.
> +
> +   -  `python3-referencing <https://github.com/python-jsonschema/referencing>`__:
> +      another dependency of ``python3-jsonschema``, it provides an
> +      implementation of JSON reference resolution.
> +
> +   -  `python3-rpds-py <https://pypi.org/project/rpds-py/>`__: Python bindings
> +      to the Rust rpds crate, and a runtime dependency for ``python3-referencing``.
> +
> +   -  `python3-sphinxcontrib-jquery <https://pypi.org/project/sphinxcontrib-jquery/>`__:
> +      a Sphinx extension to include jQuery on newer Sphinx releases. Recent
> +      versions of ``python3-sphinx-rtd-theme`` hardly depend on it.

Removing "hardly" here. I hope that's correct.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

Many thanks again for these nice release notes!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


