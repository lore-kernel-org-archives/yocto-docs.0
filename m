Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6274CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:34:27 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.161601.1712741658347127441
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 02:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20230601.gappssmtp.com header.s=20230601 header.b=uoai1WFA;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.167.54, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d536f6f2so5390726e87.2
        for <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20230601.gappssmtp.com; s=20230601; t=1712741656; x=1713346456; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2c5uV1DRjtU1tD38aHcHJMep0r+OFlhgdu0Q6Wi2PeQ=;
        b=uoai1WFAuWh91UkAdyBNEBsJeQtaK5voWpwyJLBw/aNqfKz+ZVgVgRfqDCtEaWtz5o
         BAL51EX5UEjMz2lcL2RjAqRJ2avYlPGXZR9M0uo9q/cQCZuzA/fxiH5b6bUK77lkinv7
         zS+hsS89ZVjXbmY58Cd6Z1bsAyBGHrToPkUYLATW1tOE8/vPO5i9cOOe9fc3ItkW3oco
         gNgioTGC6rgvQgynm6T/ySzFwMVxivuf8A592i5VxTyQ04WUDTbL2mXlaiO6zGpdFkVE
         rgGKnfcWj0LeCFAY4buK8jK32qc5FNsueahVDmDKPnFWLANTch/OEyJWHqDVPsGm96wz
         7cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712741656; x=1713346456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2c5uV1DRjtU1tD38aHcHJMep0r+OFlhgdu0Q6Wi2PeQ=;
        b=PKfv/d0SVHJ54XCeDGm4VcIrYb2lqxyktg5kfXzsaR7ClsqzCsszUpwJSuwUwUasg5
         3oZRGmUpQ639Eln971iUvnwQlnimvFt68ocJVeriG2WAHfliwNRB3J9tUlbKhhQZ02SF
         TKJv//9x6Dgw2uzBaWKXs4e2u4+ShkO9fqM9E4XnHU9zl/lq8eiuCnOQXxiEoSDA21Nc
         fSlMQE1r2tu76BnF/Pawuh8SKzPZVcSqQWb41K8HjkntUACcX5/bn9PuHqQTfrKJ6Eix
         ML0EIKHwKErFwdH9lFfQFPV9Nczfca2tEkuu4XN5n+ugVKuQShAFDGkAtNRImY8XxCNO
         pLTg==
X-Forwarded-Encrypted: i=1; AJvYcCWrupcLNXb8w/ewaOuGC2lyuUYoECRSgZtnq+PZcJNUI1tLPR43yLjnzPqgPzWDCsrFegHjfMzzRDcLaBTtt6sXy1eVJprnwyo+0a4=
X-Gm-Message-State: AOJu0YxSF7wyIDQxxFZ+4gM3Bm1ckR5YgttGTKljS19ZlzGNrS7bFamV
	ubAvk5WCAkKbRSE5k7MErJh3toE9/wrlyMMYWb8nna565cIFhvTkW9kzQvuGhfY=
X-Google-Smtp-Source: AGHT+IEcCfMkAwIGkStJtWcsDmTBzwGCbMTMlxqFBmL7THJ10KDAxBSG3NAG7mHtUB8CcLNvS5eVSA==
X-Received: by 2002:ac2:485a:0:b0:516:d444:b26b with SMTP id 26-20020ac2485a000000b00516d444b26bmr1269201lfy.46.1712741656128;
        Wed, 10 Apr 2024 02:34:16 -0700 (PDT)
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709061f1300b00a4e03823107sm6775705ejj.210.2024.04.10.02.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 02:34:15 -0700 (PDT)
Message-ID: <ff1a9414-c174-473f-bc92-491d43a57184@bytesatwork.ch>
Date: Wed, 10 Apr 2024 11:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v1 1/2] release-notes: add updates for 5.0
Content-Language: en-US
To: joaomarcos.costa@bootlin.com, docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com, michael.opdenacker@bootlin.com
References: <20240410091124.2976089-1-joaomarcos.costa@bootlin.com>
 <20240410091124.2976089-2-joaomarcos.costa@bootlin.com>
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Autocrypt: addr=daniel.ammann@bytesatwork.ch; keydata=
 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
 cZ+2nBA=
In-Reply-To: <20240410091124.2976089-2-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 09:34:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5100

Hello Joao,

Comment inline.

Kind regards

Daniel


On 4/10/24 11:11, Joao Marcos Costa via lists.yoctoproject.org wrote:
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
> index 0a740688f..a34821398 100644
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
> +
>   -  New core recipes:
>   
> +   -  `bmaptool <https://github.com/yoctoproject/bmaptool>`__: a tool for
> +      creating block maps for files and flashing images, being now under Yocto
> +      Project umbrella.
> +
> +   -  ``core-image-initramfs-boot``: a collaborative effort for making
> +      machine-readable software metadata easily available

The recipe name seems to not match the description.

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
> +
> +   -  `python3-yamllint <https://github.com/adrienverge/yamllint>`__: a linter
> +      for YAML files. In U-Boot, the binman tool uses this linter to verify the
> +      configs during compile time.
> +
> +   -  ``systemd-boot-native``: a UEFI boot manager, this time built as native to
> +      provide ``ukify`` tool.
> +
> +   -  `utfcpp <https://github.com/nemtrif/utfcpp>`__: a C++ library to handle
> +      UTF-8 encoded strings. It was added as a dependency for ``taglib`` after
> +      its upgrade to v2.0.
> +
> +   -  `vulkan-utility-libraries <https://github.com/KhronosGroup/Vulkan-Utility-Libraries>`__:
> +      a set of libraries to share code across various Vulkan repositories.
> +
> +   -  `vulkan-volk <https://github.com/zeux/volk>`__: a meta-loader for Vulkan,
> +      needed to support building latest ``vulkan-tools``.
> +
>   -  QEMU / ``runqemu`` enhancements:
>   
>      -  QEMU has been upgraded to version 8.2.1
>   
> +   -  ``qemuboot``: support predictable network interface names.
> +
> +   -  ``runqemu``: match ".rootfs." in addition to "-image-" for the rootfs.
> +
>   -  Rust improvements:
>   
>      -  Rust has been upgraded to version 1.75
>   
> +   -  The Rust profiler (i.e., PGO - Profile-guided Optimization) options were
> +      enabled back.
> +
> +   -  The Rust's ``oe-selftest`` were enabled, except for ``mips32`` whose tests
> +      are skipped.
> +
> +   -  ``rust-cross-canadian``: added ``riscv64`` to cross-canadian hosts.
> +
>   -  wic Image Creator enhancements:
>   
>      -  Allow the imager's output file extension to match the imager's name,
> @@ -46,19 +134,50 @@ New Features / Enhancements in 5.0
>   
>   -  SDK-related improvements:
>   
> +   -  ``nativesdk``: let :term:`MACHINE_FEATURES` be set by ``machine-sdk`` conf
> +      files.
> +
> +   -  ``nativesdk``: prevent :term:`MACHINE_FEATURES` and :term:`DISTRO_FEATURES`
> +      from being backfilled.
> +
>   -  Testing:
>   
>      -  Add an optional ``unimplemented-ptest`` QA warning to detect upstream
>         packages with tests, that do not use ptest.
>   
> +   -  ``testimage``: retrieve the ptests directory, especially for the logs,
> +      upon ptest failure.
> +
> +   -  ``oeqa``, ``oe-selftest``: add test cases for Maturin (SDK and runtime).
> +
>   -  Utility script changes:
>   
>      -  New ``recipetool/create_go.py`` script added to support Go recipe creation
>   
> +   -  ``oe-init-build-env`` can generate a initial configuration (.vscode) for
> +      VSCode and yocto.bitbake extension.
> +
>   -  BitBake improvements:
>   
> +   -  Add support for :term:`BB_LOADFACTOR_MAX`, so Bitbake can stop running
> +      extra tasks if the system load is too high, especially in distros where
> +      ``/proc/pressure`` is disabled.
> +
> +   -  Add garbage collection to remove unused unihashes from the database.
> +
> +   -  ``taskexp_ncurses``: add ncurses version of ``taskexp``, the dependency
> +      explorer originally implemented with GTK.
> +
> +   -  Improve ``runqueue`` performance by adding a cache mechanism in
> +      ``build_taskdepdata``.
> +
> +   -  ``bitbake.conf``: add ``runtimedir`` to represent the path to the runtime
> +      state directory (i.e., /run).
> +
>   -  Packaging changes:
>   
> +   -  ``package_rpm``: the RPM package compressor's mode can now be overriden.
> +
>   -  Security improvements:
>   
>      -  Improve incremental CVE database download from NVD. Rejected CVEs are
> @@ -85,6 +204,8 @@ New Features / Enhancements in 5.0
>   
>      -  Disable strace support of bluetooth by default.
>   
> +   -  ``openssh`` now has a Systemd service: ``sshd.service``.
> +
>   Known Issues in 5.0
>   ~~~~~~~~~~~~~~~~~~~
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5098): https://lists.yoctoproject.org/g/docs/message/5098
> Mute This Topic: https://lists.yoctoproject.org/mt/105438482/3616718
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [daniel.ammann@bytesatwork.ch]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

