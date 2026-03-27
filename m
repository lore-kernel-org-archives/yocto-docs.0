Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804CB10F285F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 17:18:08 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77973.1774631884699867687
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 10:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=avgWKUf4;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cfc085395fso255832485a.2
        for <docs@lists.yoctoproject.org>; Fri, 27 Mar 2026 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774631883; x=1775236683; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBqugnqQ5I68p6JOTpacby4ZuKBC73emXQLsYwfHyb8=;
        b=avgWKUf4tZ/lBJ8Kr5AxTNtCUBbIjNodwARoLm+kT+UyfmZ+ereUkVJl9UzVhR8rkw
         2EwQ4/1PUNMUZd62Aazv3Rlc30EKVbNpjUy+K2Dt+m4vq27Yxjum8QtOF4FG4BjBDexY
         iP6k87q5v7irXLoCnnuNy2rY2qlW+NaNWMgXglzlAFoO/S0rNK+DMVgRFCCd3Wx1jXe/
         2h/8r/xH8/+vcZwkIU0Lrj2BvS7Qu5R27eqNtY1clAiYson1KS2ahuN88L2qr8PIsSSw
         k/UdbXTJoI2YljUTo9wfXCQCmFVx545Gwcg0YON0MtTSF74LWFP1hs0EaXIaNgSP6sXU
         q8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631883; x=1775236683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBqugnqQ5I68p6JOTpacby4ZuKBC73emXQLsYwfHyb8=;
        b=U70MiixEgRVnoMlUIobykjmQArH6Sje1j5AouW84KlQHRtebVAj2oHOtNRAYgMBPlt
         iNLdShlsj8MtPJa+tJsrR/m4GGRUNl6ySAN4KzGQbOyt7LKQQthSYYJVBCPKrIH3Y7Ii
         KNHS9RkmQ2BS5rhTYR0phlLrk9WrTv9xT2LgX9mzi4da2/Hv7gOaY1m8ZDSPgMdLfThI
         l+2oUe6e/siw26Ob45ue5VcFL56K8So4R7Jg+dzFuRdnFxoIcd1tzfZgeSiUhZ0P9801
         LjSaRe3ub502Js73YC2StvOo+0X5kiyrO5/eRFb5WY2neGS1BIRWxcM7TLPN9Fch1qpV
         hvPA==
X-Forwarded-Encrypted: i=1; AJvYcCV5snzaxZQc8oeNiyjLsPsM0JyeYdomGGWv0ng6ctQLID+uyrBFZTg8ixdj6sLY94vjm6f3@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy3NYvbbk8uY4q8L0ypC9Hs65vgvBbEwMWLJn5dRw+wSrxHNprS
	8TAqTGlTxRUXh57/33Qw1J0svySu8bSkrK3HrVfPZUaWmHhckgxJKrMUN4a8CrvZE00=
X-Gm-Gg: ATEYQzxMi5L7xnMkr96JKiTX1tlbTolGRVTsEXfU4AfOObRfdcz+ATzex1mtSyKVVKa
	fvaqkctaKrwKyGb3N1PCVfXrP7CMlyfHAoB32NxyhRT2Ad3z/YlsLuP//7DIxglTk/aFgw5cBks
	W6OeBbGNzbucaM3QRSGyhs3eqfnAZKLWTVbeAzwNdKeAAJHKXBQ4vGoQj8ANd5ANkz1PHHLhwhG
	3fdukFrpRYtFnTlT7ur6aN/ryyOe8umbh706CcsHiqaV5yVXu7P4BczyIP4LPbVvwKeMoM3wWOl
	LeLuxb+Wh9r5h0wVzRvXuBAHbz7q1snnjodt0wrdjPrDlcmOzozVxD/kupshL9gi+f+sIdSDIDz
	0+2+lmuFV+XZ4WJjGXL372DqLVAuNVfrOHbtHJ6gBOfcCEnBbMJYD5lB+OvAtd/1BVWfULkwWrA
	JQBFMakCYXBX0tTa+N0QNAqdXS5CEW+LbIWZauTyfEhurI2kkURENwt1te1IXmJLVzmYwIHbWL5
	0c3
X-Received: by 2002:a05:620a:170f:b0:8c6:a539:55cd with SMTP id af79cd13be357-8d01c7fd518mr415666285a.41.1774631883275;
        Fri, 27 Mar 2026 10:18:03 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e3d656fsm551085085a.17.2026.03.27.10.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:18:02 -0700 (PDT)
Message-ID: <93ca0508-0361-4826-9ef8-c9da61e43bb0@baylibre.com>
Date: Fri, 27 Mar 2026 13:18:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ref-manual: document the usage of FIT_LOADABLES
To: Francesco Valla <francesco@valla.it>, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Antonin Godard <antonin.godard@bootlin.com>
References: <20260327130349.843041-2-francesco@valla.it>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20260327130349.843041-2-francesco@valla.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Mar 2026 17:18:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9140


On 2026-03-27 09:03, Francesco Valla wrote:
> Add documentation for the new logic and variables that can be used to
> add additional arbitrary loadables to a FIT image.

Hi Francesco,

Thanks for taking the time to document this!

Trevor

>
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>   documentation/ref-manual/classes.rst   |  16 ++-
>   documentation/ref-manual/variables.rst | 178 +++++++++++++++++++++++++
>   2 files changed, 192 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index dc131be9fb93..ec30d6417cb0 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1420,12 +1420,13 @@ Its behavior is mainly controlled by the following variables:
>   ====================
>   
>   The :ref:`ref-classes-kernel-fit-image` class provides support to pack a kernel image,
> -device trees, a U-boot script, and an :term:`Initramfs` into a single FIT image.
> +device trees, a U-boot script, an :term:`Initramfs` and additional loadables into a
> +single FIT image.
>   In theory, a FIT image can support any number of kernels, U-boot scripts,
>   :term:`Initramfs`, and device trees.
>   However, :ref:`ref-classes-kernel-fit-image` currently only supports
>   limited usecases: just one kernel image, an optional U-boot script,
> -an optional :term:`Initramfs`, and any number of device trees.
> +an optional :term:`Initramfs`, and any number of device trees and loadables.
>   
>   The FIT image is created by a recipe which inherits the
>   :ref:`ref-classes-kernel-fit-image` class.
> @@ -1535,6 +1536,17 @@ allow configuration:
>      At run-time, U-boot's boot command can be configured to load the boot script
>      from the FIT image and source it.
>   
> +-  Multiple additional loadables (e.g.: firmwares for auxiliary processors) can
> +   be added to the FIT image created by :ref:`ref-classes-kernel-fit-image`.
> +   The addition of loadables is optional. The loadables are specified using the
> +   :term:`FIT_LOADABLES` variable; each of them can then be configured through
> +   flags on the following variables: :term:`FIT_LOADABLE_ARCH`,
> +   :term:`FIT_LOADABLE_COMPRESSION`, :term:`FIT_LOADABLE_DESCRIPTION`,
> +   :term:`FIT_LOADABLE_ENTRYPOINT`, :term:`FIT_LOADABLE_FILENAME`,
> +   :term:`FIT_LOADABLE_LOADADDRESS`, :term:`FIT_LOADABLE_OS` and
> +   :term:`FIT_LOADABLE_TYPE`. All loadables specified in this way will be added
> +   to all configurations present in the FIT image.
> +
>   -  The FIT image generated by the :ref:`ref-classes-kernel-fit-image` class is signed when the
>      variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
>      :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 9e0c5b0835a2..e5dc838fa011 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3510,6 +3510,184 @@ system and gives an overview of their function and contents.
>         The default value is set to "x509" by the
>         :ref:`ref-classes-kernel-fit-image` class.
>   
> +   :term:`FIT_LOADABLE_ARCH`
> +      Architecture the loadables defined in :term:`FIT_LOADABLES`; the value
> +      will be used for the ``arch`` property of the loadable.
> +      If no value is defined for a specific loadable, the kernel architecture
> +      will be used.
> +
> +      This variable cannot be used directly, but only defining flags on it.
> +
> +      Example::
> +
> +         FIT_LOADABLES = "foo"
> +         FIT_LOADABLE_ARCH[foo] = "arm"
> +
> +   :term:`FIT_LOADABLE_COMPRESSION`
> +      Compression type for the loadables defined in :term:`FIT_LOADABLES`; the
> +      value will be used for the ``compression`` property of the loadable.
> +      If no value is defined for a specific loadable, its ``compression``
> +      property will be set to ``none``.
> +
> +      This variable cannot be used directly, but only defining flags on it.
> +
> +      Example::
> +
> +         FIT_LOADABLES = "foo"
> +         FIT_LOADABLE_COMPRESSION[foo] = "gzip"
> +
> +      .. note::
> +
> +         The binary should already be compressed, as no compression is
> +         performed by the :ref:`ref-classes-kernel-fit-image` class.
> +
> +   :term:`FIT_LOADABLE_DESCRIPTION`
> +      Description for the loadables defined in :term:`FIT_LOADABLES`; the value
> +      will be used for the ``description`` property of the loadable.
> +      If no value is defined for a specific loadable, its description will be
> +      set to the loadable name followed by a space plus the string ``loadable``.
> +
> +      This variable cannot be used directly, but only defining flags on it.
> +
> +      Example::
> +
> +         FIT_LOADABLES = "foo"
> +         FIT_LOADABLE_DESCRIPTION[foo] = "Foo firmware binary"
> +
> +   :term:`FIT_LOADABLE_ENTRYPOINT`
> +      Entry point for the loadables defined in :term:`FIT_LOADABLES`; the value
> +      will be used for the ``entry`` property of the loadable.
> +      If no value is defined for a specific loadable, the ``entry`` property
> +      will be omitted.
> +
> +      This variable cannot be used directly, but only defining flags on it.
> +
> +      Example::
> +
> +         FIT_LOADABLES = "foo"
> +         FIT_LOADABLE_ENTRYPOINT[foo] = "0x80234000"
> +
> +   :term:`FIT_LOADABLE_FILENAME`
> +      Filename (or relative path) for the loadables defined in
> +      :term:`FIT_LOADABLES`; this will be used to search for the binary to
> +      include and is therefore mandatory for each loadable. Binary files to be
> +      included need to be located in :term:`DEPLOY_DIR_IMAGE`.
> +
> +      This variable cannot be used directly, but only defining flags on it.
> +
> +      Example::
> +
> +         FIT_LOADABLES = "foo"
> +         FIT_LOADABLE_FILENAME[foo] = "foo-firmware.bin"
> +
> +   :term:`FIT_LOADABLE_LOADADDRESS`
> +      Load address for the loadables defined in :term:`FIT_LOADABLES`; the
> +      value will be used for the ``load`` property of the loadable.
> +      This is mandatory for each loadable.
> +
> +      This variable cannot be used directly, but only defining flags on it.
> +
> +      Example::
> +
> +         FIT_LOADABLES = "foo"
> +         FIT_LOADABLE_LOADADDRESS[foo] = "0x80230000"
> +
> +   :term:`FIT_LOADABLE_OS`
> +      Operating system for the loadables defined in :term:`FIT_LOADABLES`; the
> +      value will be used for the ``os`` property of the loadable.
> +      If no value is defined for a specific loadable, the ``os`` property will
> +      be set to ``linux``.
> +
> +      This variable cannot be used directly, but only defining flags on it.
> +
> +      Example::
> +
> +         FIT_LOADABLES = "foo"
> +         FIT_LOADABLE_OS[foo] = "linux"
> +
> +   :term:`FIT_LOADABLE_TYPE`
> +      Type for the loadables defined in :term:`FIT_LOADABLES`; the value will
> +      be used for the ``type`` property of the loadable.
> +      If no value is defined for a specific loadable, the ``type`` property
> +      will be set to ``firmware``.
> +
> +      This variable cannot be used directly, but only defining flags on it.
> +
> +      Example::
> +
> +         FIT_LOADABLES = "foo"
> +         FIT_LOADABLE_TYPE[foo] = "firmware"
> +
> +   :term:`FIT_LOADABLES`
> +      Space-separated list of loadables to add to a FIT image in addition to
> +      regular ones (kernel, initramfs, dtsb etc.).
> +      Values specified here will be used as node names inside the FIT image;
> +      all of them will be included in all configurations by using the
> +      ``loadables`` property.
> +
> +      For each loadable specified in this variable, additional parameters can be
> +      defined using :term:`FIT_LOADABLE_ARCH`, :term:`FIT_LOADABLE_COMPRESSION`,
> +      :term:`FIT_LOADABLE_DESCRIPTION`, :term:`FIT_LOADABLE_ENTRYPOINT`,
> +      :term:`FIT_LOADABLE_FILENAME`, :term:`FIT_LOADABLE_LOADADDRESS`,
> +      :term:`FIT_LOADABLE_OS` and :term:`FIT_LOADABLE_TYPE`.
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` class and
> +      is empty by default.
> +
> +      For example, the following configuration adds as loadables a TF-A BL31
> +      firmware and a (compressed) TEE firmware, to be loaded respectively at
> +      0x204E0000 and 0x96000000::
> +
> +         FIT_LOADABLES = "atf tee"
> +
> +         FIT_LOADABLE_FILENAME[atf] = "bl31.bin"
> +         FIT_LOADABLE_DESCRIPTION[atf] = "TF-A Firmware"
> +         FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
> +         FIT_LOADABLE_ARCH[atf] = "arm64"
> +         FIT_LOADABLE_OS[atf] = "arm-trusted-firmware"
> +         FIT_LOADABLE_LOADADDRESS[atf] = "0x204E0000"
> +         FIT_LOADABLE_ENTRYPOINT[atf] = "0x204E0000"
> +
> +         FIT_LOADABLE_FILENAME[tee] = "tee.bin.gz"
> +         FIT_LOADABLE_COMPRESSION[tee] = "gzip"
> +         FIT_LOADABLE_TYPE[tee] = "tee"
> +         FIT_LOADABLE_OS[tee] = "tee"
> +         FIT_LOADABLE_LOADADDRESS[tee] = "0x96000000"
> +
> +      and will be converted to the following FIT source::
> +
> +         images {
> +                 atf {
> +                         description = "TF-A Firmware";
> +                         type = "tfa-bl31";
> +                         compression = "none";
> +                         data = /incbin/("<DEPLOY_DIR_IMAGE>/bl31.bin");
> +                         arch = "arm64";
> +                         os = "arm-trusted-firmware";
> +                         load = <0x204E0000>;
> +                         entry = <0x204E0000>;
> +                 };
> +                 tee {
> +                         description = "tee loadable";
> +                         type = "tee";
> +                         compression = "gzip";
> +                         data = /incbin/("<DEPLOY_DIR_IMAGE>/tee.bin.gz");
> +                         arch = "arm64";
> +                         os = "tee";
> +                         load = <0x96000000>;
> +                 };
> +         };
> +
> +         configurations {
> +                 default = "<my-board>.dtb";
> +                 <my-board>.dtb {
> +                         description = "1 Linux kernel, FDT blob, loadables";
> +                         kernel = "kernel-1";
> +                         fdt = "<my-board>.dtb";
> +                         loadables = "atf", "tee";
> +                 };
> +         };
> +
>      :term:`FIT_MKIMAGE_EXTRA_OPTS`
>         When inheriting the :ref:`ref-classes-kernel-fit-image`, the
>         :term:`FIT_MKIMAGE_EXTRA_OPTS` variable allows passing extra options to

