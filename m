Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1898C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:44:18 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.85976.1738583056381171702
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 03:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YkEvnpOv;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6f1be1daeso409481585a.0
        for <docs@lists.yoctoproject.org>; Mon, 03 Feb 2025 03:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583055; x=1739187855; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=neCH6E0Ze/pezFnNxk3YllfoIG47ORMFaNm9NXK4UlQ=;
        b=YkEvnpOvdj8h2bDYXcrh0O+TszN5wRQsRLu7LUBLVKfQ4eXmfwjnDK2s3onEw/nTjw
         YGWnpGRNlGhmMuKnB70AUe0HgMPj8v0JGa/LPVytlcydRQPAiAN+N1Pa1hRHzWVGQCSZ
         N3N2HMO+4tFWeGKvKRll1G1JKp/3zrLbc3BzgrzNfsiC1f6YpsSHCxd3c/IUs+52aee6
         mlYdHPgrEz3VMkts4/zSAC4VX2DJWui0QMiCoRcWdaZ9bC0PJiGl/ctoUCUx5K9LcxJk
         ccXxuH/qqTLnm7+J7SR/ojfkBLdhPuZBpt3Kq/2P/qffJTx4SVrdrEqYce6DSC8pRMJL
         q+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583055; x=1739187855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neCH6E0Ze/pezFnNxk3YllfoIG47ORMFaNm9NXK4UlQ=;
        b=WQnJBm4KEfWdVWkclnNUjMYLKEZUyVho+whueeN9JsCZ/NsYNyTxkvG9JfqBImhPwI
         IPqYlHSmaWLa4W0Mg5tJHUrEVV8ivFfEsfu27Wh20gEH0wYPMKt0faLhhRoz9Pj/wPuc
         wmV5sJ7DXsWtnAQfv69ukMHaKjOpogA2img4ElWKfZMfenHrlbVc5OCiJcta/zg/sjoL
         ELGgnnHdmcQWJzYvrBFe6wHHaKx1hqEvu6+kc3C39rftFTjkdB/HEcaAo+d4kh7GEm2S
         DYHFSsU9GToNyCGMQZKBv664rZFdrSgEEyTZn6mO1hkNy8FgpYkK9g7t/XEn/THBZEsZ
         4l3Q==
X-Gm-Message-State: AOJu0Yxb0g1rvmrVvL+yivii6o3+pn4fAWG4A/MoYAHY12NRwBj/lo1f
	EynIkvHru5XgA449u+fCtLbtJjJDaOH178AIJrxy+1A9qpHRsrm/RRSF1piM2pm5MaENgvKeQwc
	HF2fGLWv7JTYRWasKyNDJELiM+O8=
X-Gm-Gg: ASbGnctFny7a9FkxOxElguNwqzV/q1BG9D4W39ZaJA5+z2Ha4HRWBmePaoFDf8whljZ
	A5wo1VDK0671jEJTwhYrwJ5R/qXx7eQExQPi7qaR25kW/3YZt2Zvo0cH2pg9w4mfXxqT9hegHtU
	2ny1jYF7BqDKqhvzUlPTi2cT1+4Glx
X-Google-Smtp-Source: AGHT+IHRWGeh8rIPmLD0U5dEWln5vqtHy0F7BUkv2dIgzAgnAQ4pdkRFBeaODuFmNt3pU47ibhqKcUWDX0jZ60zUJDM=
X-Received: by 2002:a05:6214:2683:b0:6d8:af2d:2a44 with SMTP id
 6a1803df08f44-6e243c6392amr296335256d6.32.1738583054847; Mon, 03 Feb 2025
 03:44:14 -0800 (PST)
MIME-Version: 1.0
References: <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com> <20250203114234.1508324-1-zboszor@gmail.com>
In-Reply-To: <20250203114234.1508324-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 12:44:03 +0100
X-Gm-Features: AWEUYZnCPjHY5QKj84S8yx_iZtcMSVg4zED39PLWOEbCqQEbYlSkv0KiCS4HsOg
Message-ID: <CANNYZj93GGVA_n-h21qrPQ82AAHPAXvN6wpLQx4HcavNHnHdXg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 1/2] rpm-sequoia: New recipe for version 1.7.0
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: docs@lists.yoctoproject.org, Antonin Godard <antonin.godard@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000659715062d3b69ba"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Feb 2025 11:44:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6242

--000000000000659715062d3b69ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wrong mailing list.

Alex

On Mon 3. Feb 2025 at 12.42, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszo=
r@gmail.com> wrote:

> rpm 4.20 removed the built-in code to handle signed packages
> and uses rpm-sequoia as a more feature complete library.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  .../rpm-sequoia/rpm-sequoia-crates.inc        | 486 ++++++++++++++++++
>  .../rpm-sequoia/rpm-sequoia_1.7.0.bb          |  57 ++
>  3 files changed, 544 insertions(+)
>  create mode 100644
> meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
>  create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.b=
b
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 6e3cb54a1f..087fa7e69c 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -744,6 +744,7 @@ RECIPE_MAINTAINER:pn-rpcbind =3D "Hongxu Jia <
> hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-rng-tools =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-rpcsvc-proto =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-rpm =3D "Robert Yang <liezhi.yang@windriver.com>"
> +RECIPE_MAINTAINER:pn-rpm-sequoia =3D "Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi <zboszor@gmail.com
> >"
>  RECIPE_MAINTAINER:pn-rsync =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-rt-tests =3D "Unassigned <unassigned@yoctoproject.o=
rg
> >"
>  RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burton@arm.com>"
> diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
> b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
> new file mode 100644
> index 0000000000..2764030ec7
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc
> @@ -0,0 +1,486 @@
> +# Autogenerated with 'bitbake -c update_crates rpm-sequoia'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/aead/0.5.2 \
> +    crate://crates.io/aes/0.8.4 \
> +    crate://crates.io/aes-gcm/0.10.3 \
> +    crate://crates.io/aho-corasick/1.1.3 \
> +    crate://crates.io/android-tzdata/0.1.1 \
> +    crate://crates.io/android_system_properties/0.1.5 \
> +    crate://crates.io/anstyle/1.0.7 \
> +    crate://crates.io/anyhow/1.0.86 \
> +    crate://crates.io/ascii-canvas/3.0.0 \
> +    crate://crates.io/assert_cmd/2.0.14 \
> +    crate://crates.io/autocfg/1.3.0 \
> +    crate://crates.io/base16ct/0.2.0 \
> +    crate://crates.io/base64/0.22.1 \
> +    crate://crates.io/base64ct/1.6.0 \
> +    crate://crates.io/bindgen/0.68.1 \
> +    crate://crates.io/bit-set/0.5.3 \
> +    crate://crates.io/bit-vec/0.6.3 \
> +    crate://crates.io/bitflags/2.6.0 \
> +    crate://crates.io/block-buffer/0.10.4 \
> +    crate://crates.io/block-padding/0.3.3 \
> +    crate://crates.io/blowfish/0.9.1 \
> +    crate://crates.io/botan/0.10.7 \
> +    crate://crates.io/botan-sys/0.10.5 \
> +    crate://crates.io/bstr/1.9.1 \
> +    crate://crates.io/buffered-reader/1.3.1 \
> +    crate://crates.io/bumpalo/3.16.0 \
> +    crate://crates.io/byteorder/1.5.0 \
> +    crate://crates.io/camellia/0.1.0 \
> +    crate://crates.io/cast5/0.11.1 \
> +    crate://crates.io/cc/1.0.106 \
> +    crate://crates.io/cdylib-link-lines/0.1.5 \
> +    crate://crates.io/cexpr/0.6.0 \
> +    crate://crates.io/cfb-mode/0.8.2 \
> +    crate://crates.io/cfg-if/1.0.0 \
> +    crate://crates.io/chrono/0.4.38 \
> +    crate://crates.io/cipher/0.4.4 \
> +    crate://crates.io/clang-sys/1.8.1 \
> +    crate://crates.io/cmac/0.7.2 \
> +    crate://crates.io/const-oid/0.9.6 \
> +    crate://crates.io/core-foundation-sys/0.8.6 \
> +    crate://crates.io/cpufeatures/0.2.12 \
> +    crate://crates.io/crunchy/0.2.2 \
> +    crate://crates.io/crypto-bigint/0.5.5 \
> +    crate://crates.io/crypto-common/0.1.6 \
> +    crate://crates.io/ctr/0.9.2 \
> +    crate://crates.io/curve25519-dalek/4.1.3 \
> +    crate://crates.io/curve25519-dalek-derive/0.1.1 \
> +    crate://crates.io/dbl/0.3.2 \
> +    crate://crates.io/der/0.7.9 \
> +    crate://crates.io/des/0.8.1 \
> +    crate://crates.io/difflib/0.4.0 \
> +    crate://crates.io/digest/0.10.7 \
> +    crate://crates.io/dirs-next/2.0.0 \
> +    crate://crates.io/dirs-sys-next/0.1.2 \
> +    crate://crates.io/displaydoc/0.2.5 \
> +    crate://crates.io/doc-comment/0.3.3 \
> +    crate://crates.io/dsa/0.6.3 \
> +    crate://crates.io/dyn-clone/1.0.17 \
> +    crate://crates.io/eax/0.5.0 \
> +    crate://crates.io/ecb/0.1.2 \
> +    crate://crates.io/ecdsa/0.16.9 \
> +    crate://crates.io/ed25519/2.2.3 \
> +    crate://crates.io/ed25519-dalek/2.1.1 \
> +    crate://crates.io/either/1.13.0 \
> +    crate://crates.io/elliptic-curve/0.13.8 \
> +    crate://crates.io/ena/0.14.3 \
> +    crate://crates.io/equivalent/1.0.1 \
> +    crate://crates.io/errno/0.3.9 \
> +    crate://crates.io/fastrand/2.1.0 \
> +    crate://crates.io/ff/0.13.0 \
> +    crate://crates.io/fiat-crypto/0.2.9 \
> +    crate://crates.io/fixedbitset/0.4.2 \
> +    crate://crates.io/foreign-types/0.3.2 \
> +    crate://crates.io/foreign-types-shared/0.1.1 \
> +    crate://crates.io/generic-array/0.14.7 \
> +    crate://crates.io/generic-array/1.1.0 \
> +    crate://crates.io/getrandom/0.2.15 \
> +    crate://crates.io/ghash/0.5.1 \
> +    crate://crates.io/glob/0.3.1 \
> +    crate://crates.io/group/0.13.0 \
> +    crate://crates.io/hashbrown/0.14.5 \
> +    crate://crates.io/hkdf/0.12.4 \
> +    crate://crates.io/hmac/0.12.1 \
> +    crate://crates.io/iana-time-zone/0.1.60 \
> +    crate://crates.io/iana-time-zone-haiku/0.1.2 \
> +    crate://crates.io/icu_collections/1.5.0 \
> +    crate://crates.io/icu_locid/1.5.0 \
> +    crate://crates.io/icu_locid_transform/1.5.0 \
> +    crate://crates.io/icu_locid_transform_data/1.5.0 \
> +    crate://crates.io/icu_normalizer/1.5.0 \
> +    crate://crates.io/icu_normalizer_data/1.5.0 \
> +    crate://crates.io/icu_properties/1.5.1 \
> +    crate://crates.io/icu_properties_data/1.5.0 \
> +    crate://crates.io/icu_provider/1.5.0 \
> +    crate://crates.io/icu_provider_macros/1.5.0 \
> +    crate://crates.io/idea/0.5.1 \
> +    crate://crates.io/idna/1.0.2 \
> +    crate://crates.io/indexmap/2.2.6 \
> +    crate://crates.io/inout/0.1.3 \
> +    crate://crates.io/itertools/0.11.0 \
> +    crate://crates.io/js-sys/0.3.69 \
> +    crate://crates.io/lalrpop/0.20.2 \
> +    crate://crates.io/lalrpop-util/0.20.2 \
> +    crate://crates.io/lazy_static/1.5.0 \
> +    crate://crates.io/lazycell/1.3.0 \
> +    crate://crates.io/libc/0.2.155 \
> +    crate://crates.io/libloading/0.8.4 \
> +    crate://crates.io/libm/0.2.8 \
> +    crate://crates.io/libredox/0.1.3 \
> +    crate://crates.io/linux-raw-sys/0.4.14 \
> +    crate://crates.io/litemap/0.7.3 \
> +    crate://crates.io/lock_api/0.4.12 \
> +    crate://crates.io/log/0.4.22 \
> +    crate://crates.io/md-5/0.10.6 \
> +    crate://crates.io/memchr/2.7.4 \
> +    crate://crates.io/memsec/0.7.0 \
> +    crate://crates.io/minimal-lexical/0.2.1 \
> +    crate://crates.io/nettle/7.4.0 \
> +    crate://crates.io/nettle-sys/2.3.0 \
> +    crate://crates.io/new_debug_unreachable/1.0.6 \
> +    crate://crates.io/nom/7.1.3 \
> +    crate://crates.io/num-bigint-dig/0.8.4 \
> +    crate://crates.io/num-integer/0.1.46 \
> +    crate://crates.io/num-iter/0.1.45 \
> +    crate://crates.io/num-traits/0.2.19 \
> +    crate://crates.io/once_cell/1.19.0 \
> +    crate://crates.io/opaque-debug/0.3.1 \
> +    crate://crates.io/openssl/0.10.64 \
> +    crate://crates.io/openssl-macros/0.1.1 \
> +    crate://crates.io/openssl-sys/0.9.102 \
> +    crate://crates.io/p256/0.13.2 \
> +    crate://crates.io/p384/0.13.0 \
> +    crate://crates.io/p521/0.13.3 \
> +    crate://crates.io/parking_lot/0.12.3 \
> +    crate://crates.io/parking_lot_core/0.9.10 \
> +    crate://crates.io/peeking_take_while/0.1.2 \
> +    crate://crates.io/pem-rfc7468/0.7.0 \
> +    crate://crates.io/petgraph/0.6.5 \
> +    crate://crates.io/phf_shared/0.10.0 \
> +    crate://crates.io/pkcs1/0.7.5 \
> +    crate://crates.io/pkcs8/0.10.2 \
> +    crate://crates.io/pkg-config/0.3.30 \
> +    crate://crates.io/polyval/0.6.2 \
> +    crate://crates.io/ppv-lite86/0.2.17 \
> +    crate://crates.io/precomputed-hash/0.1.1 \
> +    crate://crates.io/predicates/3.1.0 \
> +    crate://crates.io/predicates-core/1.0.6 \
> +    crate://crates.io/predicates-tree/1.0.9 \
> +    crate://crates.io/primeorder/0.13.6 \
> +    crate://crates.io/proc-macro2/1.0.86 \
> +    crate://crates.io/quote/1.0.36 \
> +    crate://crates.io/rand/0.8.5 \
> +    crate://crates.io/rand_chacha/0.3.1 \
> +    crate://crates.io/rand_core/0.6.4 \
> +    crate://crates.io/redox_syscall/0.5.2 \
> +    crate://crates.io/redox_users/0.4.5 \
> +    crate://crates.io/regex/1.10.5 \
> +    crate://crates.io/regex-automata/0.4.7 \
> +    crate://crates.io/regex-syntax/0.8.4 \
> +    crate://crates.io/rfc6979/0.4.0 \
> +    crate://crates.io/ripemd/0.1.3 \
> +    crate://crates.io/rsa/0.9.6 \
> +    crate://crates.io/rustc-hash/1.1.0 \
> +    crate://crates.io/rustc_version/0.4.0 \
> +    crate://crates.io/rustix/0.38.34 \
> +    crate://crates.io/rustversion/1.0.17 \
> +    crate://crates.io/same-file/1.0.6 \
> +    crate://crates.io/scopeguard/1.2.0 \
> +    crate://crates.io/sec1/0.7.3 \
> +    crate://crates.io/semver/1.0.23 \
> +    crate://crates.io/sequoia-openpgp/1.21.1 \
> +    crate://crates.io/sequoia-policy-config/0.6.0 \
> +    crate://crates.io/serde/1.0.204 \
> +    crate://crates.io/serde_derive/1.0.204 \
> +    crate://crates.io/sha1collisiondetection/0.3.4 \
> +    crate://crates.io/sha2/0.10.8 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/signature/2.2.0 \
> +    crate://crates.io/siphasher/0.3.11 \
> +    crate://crates.io/smallvec/1.13.2 \
> +    crate://crates.io/spin/0.9.8 \
> +    crate://crates.io/spki/0.7.3 \
> +    crate://crates.io/stable_deref_trait/1.2.0 \
> +    crate://crates.io/string_cache/0.8.7 \
> +    crate://crates.io/subtle/2.6.1 \
> +    crate://crates.io/syn/2.0.70 \
> +    crate://crates.io/synstructure/0.13.1 \
> +    crate://crates.io/tempfile/3.10.1 \
> +    crate://crates.io/term/0.7.0 \
> +    crate://crates.io/termtree/0.4.1 \
> +    crate://crates.io/thiserror/1.0.61 \
> +    crate://crates.io/thiserror-impl/1.0.61 \
> +    crate://crates.io/tiny-keccak/2.0.2 \
> +    crate://crates.io/tinystr/0.7.6 \
> +    crate://crates.io/toml/0.5.11 \
> +    crate://crates.io/twofish/0.7.1 \
> +    crate://crates.io/typenum/1.17.0 \
> +    crate://crates.io/unicode-ident/1.0.12 \
> +    crate://crates.io/unicode-xid/0.2.4 \
> +    crate://crates.io/universal-hash/0.5.1 \
> +    crate://crates.io/utf16_iter/1.0.5 \
> +    crate://crates.io/utf8_iter/1.0.4 \
> +    crate://crates.io/vcpkg/0.2.15 \
> +    crate://crates.io/version_check/0.9.4 \
> +    crate://crates.io/wait-timeout/0.2.0 \
> +    crate://crates.io/walkdir/2.5.0 \
> +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> +    crate://crates.io/wasm-bindgen/0.2.92 \
> +    crate://crates.io/wasm-bindgen-backend/0.2.92 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.92 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.92 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.92 \
> +    crate://crates.io/win-crypto-ng/0.5.1 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-util/0.1.8 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/windows-core/0.52.0 \
> +    crate://crates.io/windows-sys/0.52.0 \
> +    crate://crates.io/windows-targets/0.52.6 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_aarch64_msvc/0.52.6 \
> +    crate://crates.io/windows_i686_gnu/0.52.6 \
> +    crate://crates.io/windows_i686_gnullvm/0.52.6 \
> +    crate://crates.io/windows_i686_msvc/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnu/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_x86_64_msvc/0.52.6 \
> +    crate://crates.io/write16/1.0.0 \
> +    crate://crates.io/writeable/0.5.5 \
> +    crate://crates.io/x25519-dalek/2.0.1 \
> +    crate://crates.io/xxhash-rust/0.8.11 \
> +    crate://crates.io/yoke/0.7.4 \
> +    crate://crates.io/yoke-derive/0.7.4 \
> +    crate://crates.io/zerofrom/0.1.4 \
> +    crate://crates.io/zerofrom-derive/0.1.4 \
> +    crate://crates.io/zeroize/1.8.1 \
> +    crate://crates.io/zeroize_derive/1.4.2 \
> +    crate://crates.io/zerovec/0.10.4 \
> +    crate://crates.io/zerovec-derive/0.10.3 \
> +"
> +
> +SRC_URI[aead-0.5.2.sha256sum] =3D
> "d122413f284cf2d62fb1b7db97e02edb8cda96d769b16e443a4f6195e35662b0"
> +SRC_URI[aes-0.8.4.sha256sum] =3D
> "b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0"
> +SRC_URI[aes-gcm-0.10.3.sha256sum] =3D
> "831010a0f742e1209b3bcea8fab6a8e149051ba6099432c8cb2cc117dec3ead1"
> +SRC_URI[aho-corasick-1.1.3.sha256sum] =3D
> "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
> +SRC_URI[android-tzdata-0.1.1.sha256sum] =3D
> "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
> +SRC_URI[android_system_properties-0.1.5.sha256sum] =3D
> "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
> +SRC_URI[anstyle-1.0.7.sha256sum] =3D
> "038dfcf04a5feb68e9c60b21c9625a54c2c0616e79b72b0fd87075a056ae1d1b"
> +SRC_URI[anyhow-1.0.86.sha256sum] =3D
> "b3d1d046238990b9cf5bcde22a3fb3584ee5cf65fb2765f454ed428c7a0063da"
> +SRC_URI[ascii-canvas-3.0.0.sha256sum] =3D
> "8824ecca2e851cec16968d54a01dd372ef8f95b244fb84b84e70128be347c3c6"
> +SRC_URI[assert_cmd-2.0.14.sha256sum] =3D
> "ed72493ac66d5804837f480ab3766c72bdfab91a65e565fc54fa9e42db0073a8"
> +SRC_URI[autocfg-1.3.0.sha256sum] =3D
> "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
> +SRC_URI[base16ct-0.2.0.sha256sum] =3D
> "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
> +SRC_URI[base64-0.22.1.sha256sum] =3D
> "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> +SRC_URI[base64ct-1.6.0.sha256sum] =3D
> "8c3c1a368f70d6cf7302d78f8f7093da241fb8e8807c05cc9e51a125895a6d5b"
> +SRC_URI[bindgen-0.68.1.sha256sum] =3D
> "726e4313eb6ec35d2730258ad4e15b547ee75d6afaa1361a922e78e59b7d8078"
> +SRC_URI[bit-set-0.5.3.sha256sum] =3D
> "0700ddab506f33b20a03b13996eccd309a48e5ff77d0d95926aa0210fb4e95f1"
> +SRC_URI[bit-vec-0.6.3.sha256sum] =3D
> "349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb"
> +SRC_URI[bitflags-2.6.0.sha256sum] =3D
> "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
> +SRC_URI[block-buffer-0.10.4.sha256sum] =3D
> "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
> +SRC_URI[block-padding-0.3.3.sha256sum] =3D
> "a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93"
> +SRC_URI[blowfish-0.9.1.sha256sum] =3D
> "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
> +SRC_URI[botan-0.10.7.sha256sum] =3D
> "350081af1a3c6883f8a1f863ac553bfe6922589aad60008a70947765ed57c53e"
> +SRC_URI[botan-sys-0.10.5.sha256sum] =3D
> "9f49dde1b8ebd2996cc41c55c39f6ef8b54e38148d8973aeba0792b87b1621ca"
> +SRC_URI[bstr-1.9.1.sha256sum] =3D
> "05efc5cfd9110c8416e471df0e96702d58690178e206e61b7173706673c93706"
> +SRC_URI[buffered-reader-1.3.1.sha256sum] =3D
> "cd098763fdb64579407a8c83cf0d751e6d4a7e161d0114c89cc181a2ca760ec8"
> +SRC_URI[bumpalo-3.16.0.sha256sum] =3D
> "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
> +SRC_URI[byteorder-1.5.0.sha256sum] =3D
> "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
> +SRC_URI[camellia-0.1.0.sha256sum] =3D
> "3264e2574e9ef2b53ce6f536dea83a69ac0bc600b762d1523ff83fe07230ce30"
> +SRC_URI[cast5-0.11.1.sha256sum] =3D
> "26b07d673db1ccf000e90f54b819db9e75a8348d6eb056e9b8ab53231b7a9911"
> +SRC_URI[cc-1.0.106.sha256sum] =3D
> "066fce287b1d4eafef758e89e09d724a24808a9196fe9756b8ca90e86d0719a2"
> +SRC_URI[cdylib-link-lines-0.1.5.sha256sum] =3D
> "d98eabef08bbdf5afd0b9c0cabb1ac335f7c70447ef095eed85dffd9628b20bc"
> +SRC_URI[cexpr-0.6.0.sha256sum] =3D
> "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
> +SRC_URI[cfb-mode-0.8.2.sha256sum] =3D
> "738b8d467867f80a71351933f70461f5b56f24d5c93e0cf216e59229c968d330"
> +SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> +SRC_URI[chrono-0.4.38.sha256sum] =3D
> "a21f936df1771bf62b77f047b726c4625ff2e8aa607c01ec06e5a05bd8463401"
> +SRC_URI[cipher-0.4.4.sha256sum] =3D
> "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
> +SRC_URI[clang-sys-1.8.1.sha256sum] =3D
> "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
> +SRC_URI[cmac-0.7.2.sha256sum] =3D
> "8543454e3c3f5126effff9cd44d562af4e31fb8ce1cc0d3dcd8f084515dbc1aa"
> +SRC_URI[const-oid-0.9.6.sha256sum] =3D
> "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
> +SRC_URI[core-foundation-sys-0.8.6.sha256sum] =3D
> "06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f"
> +SRC_URI[cpufeatures-0.2.12.sha256sum] =3D
> "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
> +SRC_URI[crunchy-0.2.2.sha256sum] =3D
> "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
> +SRC_URI[crypto-bigint-0.5.5.sha256sum] =3D
> "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
> +SRC_URI[crypto-common-0.1.6.sha256sum] =3D
> "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
> +SRC_URI[ctr-0.9.2.sha256sum] =3D
> "0369ee1ad671834580515889b80f2ea915f23b8be8d0daa4bbaf2ac5c7590835"
> +SRC_URI[curve25519-dalek-4.1.3.sha256sum] =3D
> "97fb8b7c4503de7d6ae7b42ab72a5a59857b4c937ec27a3d4539dba95b5ab2be"
> +SRC_URI[curve25519-dalek-derive-0.1.1.sha256sum] =3D
> "f46882e17999c6cc590af592290432be3bce0428cb0d5f8b6715e4dc7b383eb3"
> +SRC_URI[dbl-0.3.2.sha256sum] =3D
> "bd2735a791158376708f9347fe8faba9667589d82427ef3aed6794a8981de3d9"
> +SRC_URI[der-0.7.9.sha256sum] =3D
> "f55bf8e7b65898637379c1b74eb1551107c8294ed26d855ceb9fd1a09cfc9bc0"
> +SRC_URI[des-0.8.1.sha256sum] =3D
> "ffdd80ce8ce993de27e9f063a444a4d53ce8e8db4c1f00cc03af5ad5a9867a1e"
> +SRC_URI[difflib-0.4.0.sha256sum] =3D
> "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
> +SRC_URI[digest-0.10.7.sha256sum] =3D
> "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
> +SRC_URI[dirs-next-2.0.0.sha256sum] =3D
> "b98cf8ebf19c3d1b223e151f99a4f9f0690dca41414773390fc824184ac833e1"
> +SRC_URI[dirs-sys-next-0.1.2.sha256sum] =3D
> "4ebda144c4fe02d1f7ea1a7d9641b6fc6b580adcfa024ae48797ecdeb6825b4d"
> +SRC_URI[displaydoc-0.2.5.sha256sum] =3D
> "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
> +SRC_URI[doc-comment-0.3.3.sha256sum] =3D
> "fea41bba32d969b513997752735605054bc0dfa92b4c56bf1189f2e174be7a10"
> +SRC_URI[dsa-0.6.3.sha256sum] =3D
> "48bc224a9084ad760195584ce5abb3c2c34a225fa312a128ad245a6b412b7689"
> +SRC_URI[dyn-clone-1.0.17.sha256sum] =3D
> "0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125"
> +SRC_URI[eax-0.5.0.sha256sum] =3D
> "9954fabd903b82b9d7a68f65f97dc96dd9ad368e40ccc907a7c19d53e6bfac28"
> +SRC_URI[ecb-0.1.2.sha256sum] =3D
> "1a8bfa975b1aec2145850fcaa1c6fe269a16578c44705a532ae3edc92b8881c7"
> +SRC_URI[ecdsa-0.16.9.sha256sum] =3D
> "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
> +SRC_URI[ed25519-2.2.3.sha256sum] =3D
> "115531babc129696a58c64a4fef0a8bf9e9698629fb97e9e40767d235cfbcd53"
> +SRC_URI[ed25519-dalek-2.1.1.sha256sum] =3D
> "4a3daa8e81a3963a60642bcc1f90a670680bd4a77535faa384e9d1c79d620871"
> +SRC_URI[either-1.13.0.sha256sum] =3D
> "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
> +SRC_URI[elliptic-curve-0.13.8.sha256sum] =3D
> "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
> +SRC_URI[ena-0.14.3.sha256sum] =3D
> "3d248bdd43ce613d87415282f69b9bb99d947d290b10962dd6c56233312c2ad5"
> +SRC_URI[equivalent-1.0.1.sha256sum] =3D
> "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
> +SRC_URI[errno-0.3.9.sha256sum] =3D
> "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
> +SRC_URI[fastrand-2.1.0.sha256sum] =3D
> "9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a"
> +SRC_URI[ff-0.13.0.sha256sum] =3D
> "ded41244b729663b1e574f1b4fb731469f69f79c17667b5d776b16cda0479449"
> +SRC_URI[fiat-crypto-0.2.9.sha256sum] =3D
> "28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d"
> +SRC_URI[fixedbitset-0.4.2.sha256sum] =3D
> "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
> +SRC_URI[foreign-types-0.3.2.sha256sum] =3D
> "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
> +SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D
> "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
> +SRC_URI[generic-array-0.14.7.sha256sum] =3D
> "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
> +SRC_URI[generic-array-1.1.0.sha256sum] =3D
> "96512db27971c2c3eece70a1e106fbe6c87760234e31e8f7e5634912fe52794a"
> +SRC_URI[getrandom-0.2.15.sha256sum] =3D
> "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
> +SRC_URI[ghash-0.5.1.sha256sum] =3D
> "f0d8a4362ccb29cb0b265253fb0a2728f592895ee6854fd9bc13f2ffda266ff1"
> +SRC_URI[glob-0.3.1.sha256sum] =3D
> "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
> +SRC_URI[group-0.13.0.sha256sum] =3D
> "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
> +SRC_URI[hashbrown-0.14.5.sha256sum] =3D
> "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
> +SRC_URI[hkdf-0.12.4.sha256sum] =3D
> "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
> +SRC_URI[hmac-0.12.1.sha256sum] =3D
> "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
> +SRC_URI[iana-time-zone-0.1.60.sha256sum] =3D
> "e7ffbb5a1b541ea2561f8c41c087286cc091e21e556a4f09a8f6cbf17b69b141"
> +SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D
> "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
> +SRC_URI[icu_collections-1.5.0.sha256sum] =3D
> "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
> +SRC_URI[icu_locid-1.5.0.sha256sum] =3D
> "13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242dbf637"
> +SRC_URI[icu_locid_transform-1.5.0.sha256sum] =3D
> "01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e"
> +SRC_URI[icu_locid_transform_data-1.5.0.sha256sum] =3D
> "fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b946f6e"
> +SRC_URI[icu_normalizer-1.5.0.sha256sum] =3D
> "19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc6a84f"
> +SRC_URI[icu_normalizer_data-1.5.0.sha256sum] =3D
> "f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e989516"
> +SRC_URI[icu_properties-1.5.1.sha256sum] =3D
> "93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092aeef5"
> +SRC_URI[icu_properties_data-1.5.0.sha256sum] =3D
> "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569"
> +SRC_URI[icu_provider-1.5.0.sha256sum] =3D
> "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
> +SRC_URI[icu_provider_macros-1.5.0.sha256sum] =3D
> "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
> +SRC_URI[idea-0.5.1.sha256sum] =3D
> "075557004419d7f2031b8bb7f44bb43e55a83ca7b63076a8fb8fe75753836477"
> +SRC_URI[idna-1.0.2.sha256sum] =3D
> "bd69211b9b519e98303c015e21a007e293db403b6c85b9b124e133d25e242cdd"
> +SRC_URI[indexmap-2.2.6.sha256sum] =3D
> "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
> +SRC_URI[inout-0.1.3.sha256sum] =3D
> "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
> +SRC_URI[itertools-0.11.0.sha256sum] =3D
> "b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57"
> +SRC_URI[js-sys-0.3.69.sha256sum] =3D
> "29c15563dc2726973df627357ce0c9ddddbea194836909d655df6a75d2cf296d"
> +SRC_URI[lalrpop-0.20.2.sha256sum] =3D
> "55cb077ad656299f160924eb2912aa147d7339ea7d69e1b5517326fdcec3c1ca"
> +SRC_URI[lalrpop-util-0.20.2.sha256sum] =3D
> "507460a910eb7b32ee961886ff48539633b788a36b65692b95f225b844c82553"
> +SRC_URI[lazy_static-1.5.0.sha256sum] =3D
> "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
> +SRC_URI[lazycell-1.3.0.sha256sum] =3D
> "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
> +SRC_URI[libc-0.2.155.sha256sum] =3D
> "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
> +SRC_URI[libloading-0.8.4.sha256sum] =3D
> "e310b3a6b5907f99202fcdb4960ff45b93735d7c7d96b760fcff8db2dc0e103d"
> +SRC_URI[libm-0.2.8.sha256sum] =3D
> "4ec2a862134d2a7d32d7983ddcdd1c4923530833c9f2ea1a44fc5fa473989058"
> +SRC_URI[libredox-0.1.3.sha256sum] =3D
> "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
> +SRC_URI[linux-raw-sys-0.4.14.sha256sum] =3D
> "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
> +SRC_URI[litemap-0.7.3.sha256sum] =3D
> "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
> +SRC_URI[lock_api-0.4.12.sha256sum] =3D
> "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
> +SRC_URI[log-0.4.22.sha256sum] =3D
> "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
> +SRC_URI[md-5-0.10.6.sha256sum] =3D
> "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
> +SRC_URI[memchr-2.7.4.sha256sum] =3D
> "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
> +SRC_URI[memsec-0.7.0.sha256sum] =3D
> "c797b9d6bb23aab2fc369c65f871be49214f5c759af65bde26ffaaa2b646b492"
> +SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D
> "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
> +SRC_URI[nettle-7.4.0.sha256sum] =3D
> "44e6ff4a94e5d34a1fd5abbd39418074646e2fa51b257198701330f22fcd6936"
> +SRC_URI[nettle-sys-2.3.0.sha256sum] =3D
> "b495053a10a19a80e3a26bf1212e92e29350797b5f5bdc58268c3f3f818e66ec"
> +SRC_URI[new_debug_unreachable-1.0.6.sha256sum] =3D
> "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086"
> +SRC_URI[nom-7.1.3.sha256sum] =3D
> "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
> +SRC_URI[num-bigint-dig-0.8.4.sha256sum] =3D
> "dc84195820f291c7697304f3cbdadd1cb7199c0efc917ff5eafd71225c136151"
> +SRC_URI[num-integer-0.1.46.sha256sum] =3D
> "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
> +SRC_URI[num-iter-0.1.45.sha256sum] =3D
> "1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf"
> +SRC_URI[num-traits-0.2.19.sha256sum] =3D
> "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
> +SRC_URI[once_cell-1.19.0.sha256sum] =3D
> "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
> +SRC_URI[opaque-debug-0.3.1.sha256sum] =3D
> "c08d65885ee38876c4f86fa503fb49d7b507c2b62552df7c70b2fce627e06381"
> +SRC_URI[openssl-0.10.64.sha256sum] =3D
> "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
> +SRC_URI[openssl-macros-0.1.1.sha256sum] =3D
> "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
> +SRC_URI[openssl-sys-0.9.102.sha256sum] =3D
> "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
> +SRC_URI[p256-0.13.2.sha256sum] =3D
> "c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b"
> +SRC_URI[p384-0.13.0.sha256sum] =3D
> "70786f51bcc69f6a4c0360e063a4cac5419ef7c5cd5b3c99ad70f3be5ba79209"
> +SRC_URI[p521-0.13.3.sha256sum] =3D
> "0fc9e2161f1f215afdfce23677034ae137bbd45016a880c2eb3ba8eb95f085b2"
> +SRC_URI[parking_lot-0.12.3.sha256sum] =3D
> "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
> +SRC_URI[parking_lot_core-0.9.10.sha256sum] =3D
> "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
> +SRC_URI[peeking_take_while-0.1.2.sha256sum] =3D
> "19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099"
> +SRC_URI[pem-rfc7468-0.7.0.sha256sum] =3D
> "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
> +SRC_URI[petgraph-0.6.5.sha256sum] =3D
> "b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db"
> +SRC_URI[phf_shared-0.10.0.sha256sum] =3D
> "b6796ad771acdc0123d2a88dc428b5e38ef24456743ddb1744ed628f9815c096"
> +SRC_URI[pkcs1-0.7.5.sha256sum] =3D
> "c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f"
> +SRC_URI[pkcs8-0.10.2.sha256sum] =3D
> "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
> +SRC_URI[pkg-config-0.3.30.sha256sum] =3D
> "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
> +SRC_URI[polyval-0.6.2.sha256sum] =3D
> "9d1fe60d06143b2430aa532c94cfe9e29783047f06c0d7fd359a9a51b729fa25"
> +SRC_URI[ppv-lite86-0.2.17.sha256sum] =3D
> "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
> +SRC_URI[precomputed-hash-0.1.1.sha256sum] =3D
> "925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c"
> +SRC_URI[predicates-3.1.0.sha256sum] =3D
> "68b87bfd4605926cdfefc1c3b5f8fe560e3feca9d5552cf68c466d3d8236c7e8"
> +SRC_URI[predicates-core-1.0.6.sha256sum] =3D
> "b794032607612e7abeb4db69adb4e33590fa6cf1149e95fd7cb00e634b92f174"
> +SRC_URI[predicates-tree-1.0.9.sha256sum] =3D
> "368ba315fb8c5052ab692e68a0eefec6ec57b23a36959c14496f0b0df2c0cecf"
> +SRC_URI[primeorder-0.13.6.sha256sum] =3D
> "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
> +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D
> "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
> +SRC_URI[quote-1.0.36.sha256sum] =3D
> "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
> +SRC_URI[rand-0.8.5.sha256sum] =3D
> "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
> +SRC_URI[rand_chacha-0.3.1.sha256sum] =3D
> "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
> +SRC_URI[rand_core-0.6.4.sha256sum] =3D
> "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
> +SRC_URI[redox_syscall-0.5.2.sha256sum] =3D
> "c82cf8cff14456045f55ec4241383baeff27af886adb72ffb2162f99911de0fd"
> +SRC_URI[redox_users-0.4.5.sha256sum] =3D
> "bd283d9651eeda4b2a83a43c1c91b266c40fd76ecd39a50a8c630ae69dc72891"
> +SRC_URI[regex-1.10.5.sha256sum] =3D
> "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
> +SRC_URI[regex-automata-0.4.7.sha256sum] =3D
> "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
> +SRC_URI[regex-syntax-0.8.4.sha256sum] =3D
> "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
> +SRC_URI[rfc6979-0.4.0.sha256sum] =3D
> "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
> +SRC_URI[ripemd-0.1.3.sha256sum] =3D
> "bd124222d17ad93a644ed9d011a40f4fb64aa54275c08cc216524a9ea82fb09f"
> +SRC_URI[rsa-0.9.6.sha256sum] =3D
> "5d0e5124fcb30e76a7e79bfee683a2746db83784b86289f6251b54b7950a0dfc"
> +SRC_URI[rustc-hash-1.1.0.sha256sum] =3D
> "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
> +SRC_URI[rustc_version-0.4.0.sha256sum] =3D
> "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
> +SRC_URI[rustix-0.38.34.sha256sum] =3D
> "70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f"
> +SRC_URI[rustversion-1.0.17.sha256sum] =3D
> "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
> +SRC_URI[same-file-1.0.6.sha256sum] =3D
> "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> +SRC_URI[scopeguard-1.2.0.sha256sum] =3D
> "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> +SRC_URI[sec1-0.7.3.sha256sum] =3D
> "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
> +SRC_URI[semver-1.0.23.sha256sum] =3D
> "61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b"
> +SRC_URI[sequoia-openpgp-1.21.1.sha256sum] =3D
> "b870b0275eeae174058fcf0ce5affccaaafeb7eceeabce8d6c7f51fbe6a41e2a"
> +SRC_URI[sequoia-policy-config-0.6.0.sha256sum] =3D
> "757d45d308f2bd9c0d6fdd640f320998ad24856bdf2890ddd28d3c3b85808274"
> +SRC_URI[serde-1.0.204.sha256sum] =3D
> "bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12"
> +SRC_URI[serde_derive-1.0.204.sha256sum] =3D
> "e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222"
> +SRC_URI[sha1collisiondetection-0.3.4.sha256sum] =3D
> "1f606421e4a6012877e893c399822a4ed4b089164c5969424e1b9d1e66e6964b"
> +SRC_URI[sha2-0.10.8.sha256sum] =3D
> "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D
> "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> +SRC_URI[signature-2.2.0.sha256sum] =3D
> "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
> +SRC_URI[siphasher-0.3.11.sha256sum] =3D
> "38b58827f4464d87d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d"
> +SRC_URI[smallvec-1.13.2.sha256sum] =3D
> "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
> +SRC_URI[spin-0.9.8.sha256sum] =3D
> "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
> +SRC_URI[spki-0.7.3.sha256sum] =3D
> "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
> +SRC_URI[stable_deref_trait-1.2.0.sha256sum] =3D
> "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
> +SRC_URI[string_cache-0.8.7.sha256sum] =3D
> "f91138e76242f575eb1d3b38b4f1362f10d3a43f47d182a5b359af488a02293b"
> +SRC_URI[subtle-2.6.1.sha256sum] =3D
> "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
> +SRC_URI[syn-2.0.70.sha256sum] =3D
> "2f0209b68b3613b093e0ec905354eccaedcfe83b8cb37cbdeae64026c3064c16"
> +SRC_URI[synstructure-0.13.1.sha256sum] =3D
> "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
> +SRC_URI[tempfile-3.10.1.sha256sum] =3D
> "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
> +SRC_URI[term-0.7.0.sha256sum] =3D
> "c59df8ac95d96ff9bede18eb7300b0fda5e5d8d90960e76f8e14ae765eedbf1f"
> +SRC_URI[termtree-0.4.1.sha256sum] =3D
> "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
> +SRC_URI[thiserror-1.0.61.sha256sum] =3D
> "c546c80d6be4bc6a00c0f01730c08df82eaa7a7a61f11d656526506112cc1709"
> +SRC_URI[thiserror-impl-1.0.61.sha256sum] =3D
> "46c3384250002a6d5af4d114f2845d37b57521033f30d5c3f46c4d70e1197533"
> +SRC_URI[tiny-keccak-2.0.2.sha256sum] =3D
> "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
> +SRC_URI[tinystr-0.7.6.sha256sum] =3D
> "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
> +SRC_URI[toml-0.5.11.sha256sum] =3D
> "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
> +SRC_URI[twofish-0.7.1.sha256sum] =3D
> "a78e83a30223c757c3947cd144a31014ff04298d8719ae10d03c31c0448c8013"
> +SRC_URI[typenum-1.17.0.sha256sum] =3D
> "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
> +SRC_URI[unicode-ident-1.0.12.sha256sum] =3D
> "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
> +SRC_URI[unicode-xid-0.2.4.sha256sum] =3D
> "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c"
> +SRC_URI[universal-hash-0.5.1.sha256sum] =3D
> "fc1de2c688dc15305988b563c3854064043356019f97a4b46276fe734c4f07ea"
> +SRC_URI[utf16_iter-1.0.5.sha256sum] =3D
> "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
> +SRC_URI[utf8_iter-1.0.4.sha256sum] =3D
> "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
> +SRC_URI[vcpkg-0.2.15.sha256sum] =3D
> "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> +SRC_URI[version_check-0.9.4.sha256sum] =3D
> "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
> +SRC_URI[wait-timeout-0.2.0.sha256sum] =3D
> "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6"
> +SRC_URI[walkdir-2.5.0.sha256sum] =3D
> "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
> +SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D
> "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> +SRC_URI[wasm-bindgen-0.2.92.sha256sum] =3D
> "4be2531df63900aeb2bca0daaaddec08491ee64ceecbee5076636a3b026795a8"
> +SRC_URI[wasm-bindgen-backend-0.2.92.sha256sum] =3D
> "614d787b966d3989fa7bb98a654e369c762374fd3213d212cfc0251257e747da"
> +SRC_URI[wasm-bindgen-macro-0.2.92.sha256sum] =3D
> "a1f8823de937b71b9460c0c34e25f3da88250760bec0ebac694b49997550d726"
> +SRC_URI[wasm-bindgen-macro-support-0.2.92.sha256sum] =3D
> "e94f17b526d0a461a191c78ea52bbce64071ed5c04c9ffe424dcb38f74171bb7"
> +SRC_URI[wasm-bindgen-shared-0.2.92.sha256sum] =3D
> "af190c94f2773fdb3729c55b007a722abb5384da03bc0986df4c289bf5567e96"
> +SRC_URI[win-crypto-ng-0.5.1.sha256sum] =3D
> "99abfb435a71e54ab2971d8d8c32f1a7e006cdbf527f71743b1d45b93517bb92"
> +SRC_URI[winapi-0.3.9.sha256sum] =3D
> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D
> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +SRC_URI[winapi-util-0.1.8.sha256sum] =3D
> "4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b"
> +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D
> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> +SRC_URI[windows-core-0.52.0.sha256sum] =3D
> "33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9"
> +SRC_URI[windows-sys-0.52.0.sha256sum] =3D
> "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
> +SRC_URI[windows-targets-0.52.6.sha256sum] =3D
> "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
> +SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D
> "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
> +SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D
> "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
> +SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D
> "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
> +SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D
> "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
> +SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D
> "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
> +SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D
> "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
> +SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D
> "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
> +SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D
> "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
> +SRC_URI[write16-1.0.0.sha256sum] =3D
> "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
> +SRC_URI[writeable-0.5.5.sha256sum] =3D
> "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
> +SRC_URI[x25519-dalek-2.0.1.sha256sum] =3D
> "c7e468321c81fb07fa7f4c636c3972b9100f0346e5b6a9f2bd0603a52f7ed277"
> +SRC_URI[xxhash-rust-0.8.11.sha256sum] =3D
> "63658493314859b4dfdf3fb8c1defd61587839def09582db50b8a4e93afca6bb"
> +SRC_URI[yoke-0.7.4.sha256sum] =3D
> "6c5b1314b079b0930c31e3af543d8ee1757b1951ae1e1565ec704403a7240ca5"
> +SRC_URI[yoke-derive-0.7.4.sha256sum] =3D
> "28cc31741b18cb6f1d5ff12f5b7523e3d6eb0852bbbad19d73905511d9849b95"
> +SRC_URI[zerofrom-0.1.4.sha256sum] =3D
> "91ec111ce797d0e0784a1116d0ddcdbea84322cd79e5d5ad173daeba4f93ab55"
> +SRC_URI[zerofrom-derive-0.1.4.sha256sum] =3D
> "0ea7b4a3637ea8669cedf0f1fd5c286a17f3de97b8dd5a70a6c167a1730e63a5"
> +SRC_URI[zeroize-1.8.1.sha256sum] =3D
> "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
> +SRC_URI[zeroize_derive-1.4.2.sha256sum] =3D
> "ce36e65b0d2999d2aafac989fb249189a141aee1f53c612c1f37d72631959f69"
> +SRC_URI[zerovec-0.10.4.sha256sum] =3D
> "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
> +SRC_URI[zerovec-derive-0.10.3.sha256sum] =3D
> "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
> diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
> b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
> new file mode 100644
> index 0000000000..469c94fb1a
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
> @@ -0,0 +1,57 @@
> +SUMMARY =3D "An OpenPGP backend for rpm using Sequoia PGP"
> +HOMEPAGE =3D "https://sequoia-pgp.org/"
> +
> +# The license line is taken verbatim from Fedora's specfile
> +# with formatting differences for Yocto. (AND -> &, OR -> |)
> +#
> https://src.fedoraproject.org/rpms/rust-rpm-sequoia/blob/rawhide/f/rust-r=
pm-sequoia.spec
> +LICENSE =3D "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT &
> Unicode-DFS-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) &
> (Unlicense | MIT)"
> +
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Df0ff5ff7747cf7d394079c6ae87f5f0c"
> +
> +DEPENDS =3D "openssl"
> +
> +inherit pkgconfig rust cargo cargo-update-recipe-crates
> +
> +SRC_URI =3D "git://
> github.com/rpm-software-management/rpm-sequoia.git;protocol=3Dhttps;branc=
h=3Dmain
> "
> +
> +SRCREV =3D "0667e04ae7fb8cf0490919978d69883d16400e41"
> +
> +S =3D "${UNPACKDIR}/git"
> +
> +require ${BPN}-crates.inc
> +
> +CARGO_BUILD_FLAGS +=3D "--no-default-features --features crypto-openssl"
> +CARGO_INSTALL_LIBRARIES =3D "1"
> +
> +do_compile:prepend () {
> +       # rpm-sequoia.pc is generated in the source directory
> +       # but the target directory does not exist there.
> +       mkdir -p ${S}/target/release
> +
> +       # From rpm-sequoia's README.md:
> +       #
> +       # We also set two environment variables when calling `cargo build=
`:
> +       # * `PREFIX` is the prefix that will be used in the generated
> +       #   `rpm-sequoia.pc` file. It defaults to `/usr/local`.
> +       # * `LIBDIR` is the installed library path listed in the generate=
d
> +       #   metadata. It can be an absolute path or one based on
> `${prefix}`,
> +       #   and defaults to `${prefix}/lib`.
> +
> +       export PREFIX=3D"${prefix}"
> +       export LIBDIR=3D"${libdir}"
> +}
> +
> +do_install:append () {
> +       # Move the library to the correct location expected by
> rpm-sequoia.pc
> +       mkdir -p ${D}${libdir}
> +       mv ${D}${rustlibdir}/librpm_sequoia.so
> ${D}${libdir}/librpm_sequoia.so.1
> +       ln -s librpm_sequoia.so.1 ${D}${libdir}/librpm_sequoia.so
> +
> +       rmdir -p --ignore-fail-on-non-empty ${D}${rustlibdir}
> +
> +       # rpm-sequoia does not install its pkgconfig file. Do it manually=
.
> +       mkdir -p ${D}${libdir}/pkgconfig
> +       install -m644 ${S}/target/release/rpm-sequoia.pc
> ${D}${libdir}/pkgconfig
> +}
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.48.1
>
>

--000000000000659715062d3b69ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wrong mailing list.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 3. Feb 2025 at 12.42, Z=
olt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto:zboszor@gmail.c=
om">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">rpm 4.20 rem=
oved the built-in code to handle signed packages<br>
and uses rpm-sequoia as a more feature complete library.<br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0.../rpm-sequoia/rpm-sequoia-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4=
86 ++++++++++++++++++<br>
=C2=A0.../rpm-sequoia/<a href=3D"http://rpm-sequoia_1.7.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">rpm-sequoia_1.7.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 57 ++<br>
=C2=A03 files changed, 544 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crat=
es.inc<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm-sequoia/<a href=3D"http:=
//rpm-sequoia_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.=
7.0.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 6e3cb54a1f..087fa7e69c 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -744,6 +744,7 @@ RECIPE_MAINTAINER:pn-rpcbind =3D &quot;Hongxu Jia &lt;<=
a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@win=
driver.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-rng-tools =3D &quot;Anuj Mittal &lt;<a href=3D"m=
ailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-rpcsvc-proto =3D &quot;Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot=
;<br>
=C2=A0RECIPE_MAINTAINER:pn-rpm =3D &quot;Robert Yang &lt;<a href=3D"mailto:=
liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&=
gt;&quot;<br>
+RECIPE_MAINTAINER:pn-rpm-sequoia =3D &quot;Zolt=C3=A1n B=C3=B6sz=C3=B6rm=
=C3=A9nyi &lt;<a href=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszo=
r@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-rsync =3D &quot;Yi Zhao &lt;<a href=3D"mailto:yi=
.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&quot;<=
br>
=C2=A0RECIPE_MAINTAINER:pn-rt-tests =3D &quot;Unassigned &lt;<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.=
org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-ruby =3D &quot;Ross Burton &lt;<a href=3D"mailto=
:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;&quot;<b=
r>
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc b/met=
a/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc<br>
new file mode 100644<br>
index 0000000000..2764030ec7<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crates.inc<br>
@@ -0,0 +1,486 @@<br>
+# Autogenerated with &#39;bitbake -c update_crates rpm-sequoia&#39;<br>
+<br>
+# from Cargo.lock<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aead/0.5.2" rel=3D"noref=
errer" target=3D"_blank">crates.io/aead/0.5.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aes/0.8.4" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/aes/0.8.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aes-gcm/0.10.3" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/aes-gcm/0.10.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/1.1.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/1.1.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/android-tzdata/0.1.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/android-tzdata/0.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/android_system_propertie=
s/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/android_system_prop=
erties/0.1.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstyle/1.0.7" rel=3D"no=
referrer" target=3D"_blank">crates.io/anstyle/1.0.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anyhow/1.0.86" rel=3D"no=
referrer" target=3D"_blank">crates.io/anyhow/1.0.86</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ascii-canvas/3.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/ascii-canvas/3.0.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/assert_cmd/2.0.14" rel=
=3D"noreferrer" target=3D"_blank">crates.io/assert_cmd/2.0.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.3.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base16ct/0.2.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/base16ct/0.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.22.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/base64/0.22.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64ct/1.6.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/base64ct/1.6.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bindgen/0.68.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bindgen/0.68.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bit-set/0.5.3" rel=3D"no=
referrer" target=3D"_blank">crates.io/bit-set/0.5.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bit-vec/0.6.3" rel=3D"no=
referrer" target=3D"_blank">crates.io/bit-vec/0.6.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.6.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/2.6.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/block-buffer/0.10.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/block-buffer/0.10.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/block-padding/0.3.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/block-padding/0.3.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/blowfish/0.9.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/blowfish/0.9.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/botan/0.10.7" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/botan/0.10.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/botan-sys/0.10.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/botan-sys/0.10.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bstr/1.9.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/bstr/1.9.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/buffered-reader/1.3.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/buffered-reader/1.3.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bumpalo/3.16.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bumpalo/3.16.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/byteorder/1.5.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/byteorder/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/camellia/0.1.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/camellia/0.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cast5/0.11.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cast5/0.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.106" rel=3D"noref=
errer" target=3D"_blank">crates.io/cc/1.0.106</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cdylib-link-lines/0.1.5"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/cdylib-link-lines/0.1.5</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cexpr/0.6.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/cexpr/0.6.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfb-mode/0.8.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/cfb-mode/0.8.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.4.38" rel=3D"no=
referrer" target=3D"_blank">crates.io/chrono/0.4.38</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cipher/0.4.4" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cipher/0.4.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clang-sys/1.8.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/clang-sys/1.8.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cmac/0.7.2" rel=3D"noref=
errer" target=3D"_blank">crates.io/cmac/0.7.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/const-oid/0.9.6" rel=3D"=
noreferrer" target=3D"_blank">crates.io/const-oid/0.9.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/core-foundation-sys/0.8.=
6" rel=3D"noreferrer" target=3D"_blank">crates.io/core-foundation-sys/0.8.6=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cpufeatures/0.2.12" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cpufeatures/0.2.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crunchy/0.2.2" rel=3D"no=
referrer" target=3D"_blank">crates.io/crunchy/0.2.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crypto-bigint/0.5.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/crypto-bigint/0.5.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crypto-common/0.1.6" rel=
=3D"noreferrer" target=3D"_blank">crates.io/crypto-common/0.1.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ctr/0.9.2" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/ctr/0.9.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/curve25519-dalek/4.1.3" =
rel=3D"noreferrer" target=3D"_blank">crates.io/curve25519-dalek/4.1.3</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/curve25519-dalek-derive/=
0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/curve25519-dalek-deri=
ve/0.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dbl/0.3.2" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/dbl/0.3.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/der/0.7.9" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/der/0.7.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/des/0.8.1" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/des/0.8.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/difflib/0.4.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/difflib/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/digest/0.10.7" rel=3D"no=
referrer" target=3D"_blank">crates.io/digest/0.10.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dirs-next/2.0.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/dirs-next/2.0.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dirs-sys-next/0.1.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/dirs-sys-next/0.1.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/displaydoc/0.2.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/displaydoc/0.2.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/doc-comment/0.3.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/doc-comment/0.3.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dsa/0.6.3" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/dsa/0.6.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/dyn-clone/1.0.17" rel=3D=
"noreferrer" target=3D"_blank">crates.io/dyn-clone/1.0.17</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/eax/0.5.0" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/eax/0.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ecb/0.1.2" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/ecb/0.1.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ecdsa/0.16.9" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/ecdsa/0.16.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ed25519/2.2.3" rel=3D"no=
referrer" target=3D"_blank">crates.io/ed25519/2.2.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ed25519-dalek/2.1.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/ed25519-dalek/2.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/either/1.13.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/either/1.13.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/elliptic-curve/0.13.8" r=
el=3D"noreferrer" target=3D"_blank">crates.io/elliptic-curve/0.13.8</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ena/0.14.3" rel=3D"noref=
errer" target=3D"_blank">crates.io/ena/0.14.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/equivalent/1.0.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/equivalent/1.0.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno/0.3.9" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/errno/0.3.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fastrand/2.1.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/fastrand/2.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ff/0.13.0" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/ff/0.13.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fiat-crypto/0.2.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/fiat-crypto/0.2.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fixedbitset/0.4.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/fixedbitset/0.4.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types/0.3.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/foreign-types/0.3.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types-shared/0.1=
.1" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types-shared/0.1=
.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/generic-array/0.14.7" re=
l=3D"noreferrer" target=3D"_blank">crates.io/generic-array/0.14.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/generic-array/1.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/generic-array/1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.2.15" rel=3D=
"noreferrer" target=3D"_blank">crates.io/getrandom/0.2.15</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ghash/0.5.1" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/ghash/0.5.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/glob/0.3.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/glob/0.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/group/0.13.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/group/0.13.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.14.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hashbrown/0.14.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hkdf/0.12.4" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/hkdf/0.12.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hmac/0.12.1" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/hmac/0.12.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/iana-time-zone/0.1.60" r=
el=3D"noreferrer" target=3D"_blank">crates.io/iana-time-zone/0.1.60</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/iana-time-zone-haiku/0.1=
.2" rel=3D"noreferrer" target=3D"_blank">crates.io/iana-time-zone-haiku/0.1=
.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_collections/1.5.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/icu_collections/1.5.0</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_locid/1.5.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/icu_locid/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_locid_transform/1.5.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/icu_locid_transform/1.5.0=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_locid_transform_data=
/1.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/icu_locid_transform_=
data/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_normalizer/1.5.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/icu_normalizer/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_normalizer_data/1.5.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/icu_normalizer_data/1.5.0=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_properties/1.5.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/icu_properties/1.5.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_properties_data/1.5.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/icu_properties_data/1.5.0=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_provider/1.5.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/icu_provider/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_provider_macros/1.5.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/icu_provider_macros/1.5.0=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/idea/0.5.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/idea/0.5.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/idna/1.0.2" rel=3D"noref=
errer" target=3D"_blank">crates.io/idna/1.0.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indexmap/2.2.6" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/indexmap/2.2.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/inout/0.1.3" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/inout/0.1.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itertools/0.11.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/itertools/0.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/js-sys/0.3.69" rel=3D"no=
referrer" target=3D"_blank">crates.io/js-sys/0.3.69</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lalrpop/0.20.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/lalrpop/0.20.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lalrpop-util/0.20.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/lalrpop-util/0.20.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.5.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/lazy_static/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazycell/1.3.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/lazycell/1.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.155" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.155</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libloading/0.8.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/libloading/0.8.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libm/0.2.8" rel=3D"noref=
errer" target=3D"_blank">crates.io/libm/0.2.8</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libredox/0.1.3" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/libredox/0.1.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/linux-raw-sys/0.4.14" re=
l=3D"noreferrer" target=3D"_blank">crates.io/linux-raw-sys/0.4.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/litemap/0.7.3" rel=3D"no=
referrer" target=3D"_blank">crates.io/litemap/0.7.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.4.12" rel=3D"=
noreferrer" target=3D"_blank">crates.io/lock_api/0.4.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.22" rel=3D"noref=
errer" target=3D"_blank">crates.io/log/0.4.22</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/md-5/0.10.6" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/md-5/0.10.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.7.4" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/memchr/2.7.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memsec/0.7.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/memsec/0.7.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/minimal-lexical/0.2.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/minimal-lexical/0.2.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nettle/7.4.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/nettle/7.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nettle-sys/2.3.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/nettle-sys/2.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/new_debug_unreachable/1.=
0.6" rel=3D"noreferrer" target=3D"_blank">crates.io/new_debug_unreachable/1=
.0.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nom/7.1.3" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/nom/7.1.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-bigint-dig/0.8.4" re=
l=3D"noreferrer" target=3D"_blank">crates.io/num-bigint-dig/0.8.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-integer/0.1.46" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-integer/0.1.46</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-iter/0.1.45" rel=3D"=
noreferrer" target=3D"_blank">crates.io/num-iter/0.1.45</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2.19" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.19</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.19.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/once_cell/1.19.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/opaque-debug/0.3.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/opaque-debug/0.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.64" rel=3D"=
noreferrer" target=3D"_blank">crates.io/openssl/0.10.64</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-macros/0.1.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/openssl-macros/0.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.102" rel=
=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.102</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/p256/0.13.2" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/p256/0.13.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/p384/0.13.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/p384/0.13.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/p521/0.13.3" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/p521/0.13.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot/0.12.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.12.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.9.10"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.9.10</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/peeking_take_while/0.1.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/peeking_take_while/0.1.2</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem-rfc7468/0.7.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pem-rfc7468/0.7.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/petgraph/0.6.5" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/petgraph/0.6.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/phf_shared/0.10.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/phf_shared/0.10.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkcs1/0.7.5" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pkcs1/0.7.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkcs8/0.10.2" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/pkcs8/0.10.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.30" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.30</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/polyval/0.6.2" rel=3D"no=
referrer" target=3D"_blank">crates.io/polyval/0.6.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ppv-lite86/0.2.17" rel=
=3D"noreferrer" target=3D"_blank">crates.io/ppv-lite86/0.2.17</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/precomputed-hash/0.1.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/precomputed-hash/0.1.1</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/predicates/3.1.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/predicates/3.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/predicates-core/1.0.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/predicates-core/1.0.6</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/predicates-tree/1.0.9" r=
el=3D"noreferrer" target=3D"_blank">crates.io/predicates-tree/1.0.9</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/primeorder/0.13.6" rel=
=3D"noreferrer" target=3D"_blank">crates.io/primeorder/0.13.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.86" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.86</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.36" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.36</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.8.5" rel=3D"noref=
errer" target=3D"_blank">crates.io/rand/0.8.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chacha/0.3.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/rand_chacha/0.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/0.6.4" rel=3D"=
noreferrer" target=3D"_blank">crates.io/rand_core/0.6.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.5.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.5.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_users/0.4.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/redox_users/0.4.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.10.5" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/regex/1.10.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-automata/0.4.7" re=
l=3D"noreferrer" target=3D"_blank">crates.io/regex-automata/0.4.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.8.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.8.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rfc6979/0.4.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/rfc6979/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ripemd/0.1.3" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/ripemd/0.1.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rsa/0.9.6" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/rsa/0.9.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-hash/1.1.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/rustc-hash/1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc_version/0.4.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/rustc_version/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustix/0.38.34" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/rustix/0.38.34</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustversion/1.0.17" rel=
=3D"noreferrer" target=3D"_blank">crates.io/rustversion/1.0.17</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/same-file/1.0.6" rel=3D"=
noreferrer" target=3D"_blank">crates.io/same-file/1.0.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.2.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/scopeguard/1.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sec1/0.7.3" rel=3D"noref=
errer" target=3D"_blank">crates.io/sec1/0.7.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/semver/1.0.23" rel=3D"no=
referrer" target=3D"_blank">crates.io/semver/1.0.23</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sequoia-openpgp/1.21.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/sequoia-openpgp/1.21.1</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sequoia-policy-config/0.=
6.0" rel=3D"noreferrer" target=3D"_blank">crates.io/sequoia-policy-config/0=
.6.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.204" rel=3D"no=
referrer" target=3D"_blank">crates.io/serde/1.0.204</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.204" re=
l=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.204</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sha1collisiondetection/0=
.3.4" rel=3D"noreferrer" target=3D"_blank">crates.io/sha1collisiondetection=
/0.3.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sha2/0.10.8" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/sha2/0.10.8</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/shlex/1.3.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/shlex/1.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/signature/2.2.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/signature/2.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/siphasher/0.3.11" rel=3D=
"noreferrer" target=3D"_blank">crates.io/siphasher/0.3.11</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.13.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/smallvec/1.13.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/spin/0.9.8" rel=3D"noref=
errer" target=3D"_blank">crates.io/spin/0.9.8</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/spki/0.7.3" rel=3D"noref=
errer" target=3D"_blank">crates.io/spki/0.7.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/stable_deref_trait/1.2.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/stable_deref_trait/1.2.0</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/string_cache/0.8.7" rel=
=3D"noreferrer" target=3D"_blank">crates.io/string_cache/0.8.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/subtle/2.6.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/subtle/2.6.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.70" rel=3D"noref=
errer" target=3D"_blank">crates.io/syn/2.0.70</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/synstructure/0.13.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/synstructure/0.13.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tempfile/3.10.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/tempfile/3.10.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/term/0.7.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/term/0.7.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/termtree/0.4.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/termtree/0.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror/1.0.61" rel=3D=
"noreferrer" target=3D"_blank">crates.io/thiserror/1.0.61</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror-impl/1.0.61" r=
el=3D"noreferrer" target=3D"_blank">crates.io/thiserror-impl/1.0.61</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tiny-keccak/2.0.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/tiny-keccak/2.0.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinystr/0.7.6" rel=3D"no=
referrer" target=3D"_blank">crates.io/tinystr/0.7.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml/0.5.11" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/toml/0.5.11</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/twofish/0.7.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/twofish/0.7.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/typenum/1.17.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/typenum/1.17.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.12" re=
l=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-xid/0.2.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unicode-xid/0.2.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/universal-hash/0.5.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/universal-hash/0.5.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/utf16_iter/1.0.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/utf16_iter/1.0.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/utf8_iter/1.0.4" rel=3D"=
noreferrer" target=3D"_blank">crates.io/utf8_iter/1.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/vcpkg/0.2.15" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/vcpkg/0.2.15</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wait-timeout/0.2.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/wait-timeout/0.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/walkdir/2.5.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/walkdir/2.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.11.0+wasi-snapsho=
t-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.11.0+wasi=
-snapshot-preview1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen/0.2.92" rel=
=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen/0.2.92</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-backend/0.2=
.92" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-backend/0.=
2.92</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro/0.2.9=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-macro/0.2.92=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro-suppo=
rt/0.2.92" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-macr=
o-support/0.2.92</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-shared/0.2.=
92" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-shared/0.2.=
92</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/win-crypto-ng/0.5.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/win-crypto-ng/0.5.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-windows-g=
nu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-i686-pc-win=
dows-gnu/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.1.8" rel=
=3D"noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.8</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-windows=
-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-x86_64-pc=
-windows-gnu/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-core/0.52.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-core/0.52.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-sys/0.52.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-sys/0.52.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.52.6" =
rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.52.6</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnullvm/=
0.52.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_gnul=
lvm/0.52.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msvc/0.5=
2.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_msvc/0.=
52.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.52.6"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.52.6</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnullvm/0.5=
2.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnullvm/0.=
52.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0.52.6=
" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.52.6</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/0.52.=
6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0.52.6=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnullvm/0=
.52.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnullv=
m/0.52.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc/0.52=
.6" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc/0.52=
.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/write16/1.0.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/write16/1.0.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/writeable/0.5.5" rel=3D"=
noreferrer" target=3D"_blank">crates.io/writeable/0.5.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/x25519-dalek/2.0.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/x25519-dalek/2.0.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/xxhash-rust/0.8.11" rel=
=3D"noreferrer" target=3D"_blank">crates.io/xxhash-rust/0.8.11</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/yoke/0.7.4" rel=3D"noref=
errer" target=3D"_blank">crates.io/yoke/0.7.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/yoke-derive/0.7.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/yoke-derive/0.7.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerofrom/0.1.4" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/zerofrom/0.1.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerofrom-derive/0.1.4" r=
el=3D"noreferrer" target=3D"_blank">crates.io/zerofrom-derive/0.1.4</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zeroize/1.8.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/zeroize/1.8.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zeroize_derive/1.4.2" re=
l=3D"noreferrer" target=3D"_blank">crates.io/zeroize_derive/1.4.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerovec/0.10.4" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/zerovec/0.10.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerovec-derive/0.10.3" r=
el=3D"noreferrer" target=3D"_blank">crates.io/zerovec-derive/0.10.3</a> \<b=
r>
+&quot;<br>
+<br>
+SRC_URI[aead-0.5.2.sha256sum] =3D &quot;d122413f284cf2d62fb1b7db97e02edb8c=
da96d769b16e443a4f6195e35662b0&quot;<br>
+SRC_URI[aes-0.8.4.sha256sum] =3D &quot;b169f7a6d4742236a0a00c541b845991d0a=
c43e546831af1249753ab4c3aa3a0&quot;<br>
+SRC_URI[aes-gcm-0.10.3.sha256sum] =3D &quot;831010a0f742e1209b3bcea8fab6a8=
e149051ba6099432c8cb2cc117dec3ead1&quot;<br>
+SRC_URI[aho-corasick-1.1.3.sha256sum] =3D &quot;8e60d3430d3a69478ad0993f19=
238d2df97c507009a52b3c10addcd7f6bcb916&quot;<br>
+SRC_URI[android-tzdata-0.1.1.sha256sum] =3D &quot;e999941b234f3131b00bc13c=
22d06e8c5ff726d1b6318ac7eb276997bbb4fef0&quot;<br>
+SRC_URI[android_system_properties-0.1.5.sha256sum] =3D &quot;819e7219dbd41=
043ac279b19830f2efc897156490d7fd6ea916720117ee66311&quot;<br>
+SRC_URI[anstyle-1.0.7.sha256sum] =3D &quot;038dfcf04a5feb68e9c60b21c9625a5=
4c2c0616e79b72b0fd87075a056ae1d1b&quot;<br>
+SRC_URI[anyhow-1.0.86.sha256sum] =3D &quot;b3d1d046238990b9cf5bcde22a3fb35=
84ee5cf65fb2765f454ed428c7a0063da&quot;<br>
+SRC_URI[ascii-canvas-3.0.0.sha256sum] =3D &quot;8824ecca2e851cec16968d54a0=
1dd372ef8f95b244fb84b84e70128be347c3c6&quot;<br>
+SRC_URI[assert_cmd-2.0.14.sha256sum] =3D &quot;ed72493ac66d5804837f480ab37=
66c72bdfab91a65e565fc54fa9e42db0073a8&quot;<br>
+SRC_URI[autocfg-1.3.0.sha256sum] =3D &quot;0c4b4d0bd25bd0b74681c0ad2149761=
0ce1b7c91b1022cd21c80c6fbdd9476b0&quot;<br>
+SRC_URI[base16ct-0.2.0.sha256sum] =3D &quot;4c7f02d4ea65f2c1853089ffd8d278=
7bdbc63de2f0d29dedbcf8ccdfa0ccd4cf&quot;<br>
+SRC_URI[base64-0.22.1.sha256sum] =3D &quot;72b3254f16251a8381aa12e40e3c4d2=
f0199f8c6508fbecb9d91f575e0fbb8c6&quot;<br>
+SRC_URI[base64ct-1.6.0.sha256sum] =3D &quot;8c3c1a368f70d6cf7302d78f8f7093=
da241fb8e8807c05cc9e51a125895a6d5b&quot;<br>
+SRC_URI[bindgen-0.68.1.sha256sum] =3D &quot;726e4313eb6ec35d2730258ad4e15b=
547ee75d6afaa1361a922e78e59b7d8078&quot;<br>
+SRC_URI[bit-set-0.5.3.sha256sum] =3D &quot;0700ddab506f33b20a03b13996eccd3=
09a48e5ff77d0d95926aa0210fb4e95f1&quot;<br>
+SRC_URI[bit-vec-0.6.3.sha256sum] =3D &quot;349f9b6a179ed607305526ca489b34a=
d0a41aed5f7980fa90eb03160b69598fb&quot;<br>
+SRC_URI[bitflags-2.6.0.sha256sum] =3D &quot;b048fb63fd8b5923fc5aa7b340d8e1=
56aec7ec02f0c78fa8a6ddc2613f6f71de&quot;<br>
+SRC_URI[block-buffer-0.10.4.sha256sum] =3D &quot;3078c7629b62d3f0439517fa3=
94996acacc5cbc91c5a20d8c658e77abd503a71&quot;<br>
+SRC_URI[block-padding-0.3.3.sha256sum] =3D &quot;a8894febbff9f758034a5b8e1=
2d87918f56dfc64a8e1fe757d65e29041538d93&quot;<br>
+SRC_URI[blowfish-0.9.1.sha256sum] =3D &quot;e412e2cd0f2b2d93e02543ceae7917=
b3c70331573df19ee046bcbc35e45e87d7&quot;<br>
+SRC_URI[botan-0.10.7.sha256sum] =3D &quot;350081af1a3c6883f8a1f863ac553bfe=
6922589aad60008a70947765ed57c53e&quot;<br>
+SRC_URI[botan-sys-0.10.5.sha256sum] =3D &quot;9f49dde1b8ebd2996cc41c55c39f=
6ef8b54e38148d8973aeba0792b87b1621ca&quot;<br>
+SRC_URI[bstr-1.9.1.sha256sum] =3D &quot;05efc5cfd9110c8416e471df0e96702d58=
690178e206e61b7173706673c93706&quot;<br>
+SRC_URI[buffered-reader-1.3.1.sha256sum] =3D &quot;cd098763fdb64579407a8c8=
3cf0d751e6d4a7e161d0114c89cc181a2ca760ec8&quot;<br>
+SRC_URI[bumpalo-3.16.0.sha256sum] =3D &quot;79296716171880943b8470b5f8d03a=
a55eb2e645a4874bdbb28adb49162e012c&quot;<br>
+SRC_URI[byteorder-1.5.0.sha256sum] =3D &quot;1fd0f2584146f6f2ef48085050886=
acf353beff7305ebd1ae69500e27c67f64b&quot;<br>
+SRC_URI[camellia-0.1.0.sha256sum] =3D &quot;3264e2574e9ef2b53ce6f536dea83a=
69ac0bc600b762d1523ff83fe07230ce30&quot;<br>
+SRC_URI[cast5-0.11.1.sha256sum] =3D &quot;26b07d673db1ccf000e90f54b819db9e=
75a8348d6eb056e9b8ab53231b7a9911&quot;<br>
+SRC_URI[cc-1.0.106.sha256sum] =3D &quot;066fce287b1d4eafef758e89e09d724a24=
808a9196fe9756b8ca90e86d0719a2&quot;<br>
+SRC_URI[cdylib-link-lines-0.1.5.sha256sum] =3D &quot;d98eabef08bbdf5afd0b9=
c0cabb1ac335f7c70447ef095eed85dffd9628b20bc&quot;<br>
+SRC_URI[cexpr-0.6.0.sha256sum] =3D &quot;6fac387a98bb7c37292057cffc56d62ec=
b629900026402633ae9160df93a8766&quot;<br>
+SRC_URI[cfb-mode-0.8.2.sha256sum] =3D &quot;738b8d467867f80a71351933f70461=
f5b56f24d5c93e0cf216e59229c968d330&quot;<br>
+SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619e3cbc0120e=
e582ebb74b53b4efbf79117bd2da40fd&quot;<br>
+SRC_URI[chrono-0.4.38.sha256sum] =3D &quot;a21f936df1771bf62b77f047b726c46=
25ff2e8aa607c01ec06e5a05bd8463401&quot;<br>
+SRC_URI[cipher-0.4.4.sha256sum] =3D &quot;773f3b9af64447d2ce9850330c473515=
014aa235e6a783b02db81ff39e4a3dad&quot;<br>
+SRC_URI[clang-sys-1.8.1.sha256sum] =3D &quot;0b023947811758c97c59bf9d1c188=
fd619ad4718dcaa767947df1cadb14f39f4&quot;<br>
+SRC_URI[cmac-0.7.2.sha256sum] =3D &quot;8543454e3c3f5126effff9cd44d562af4e=
31fb8ce1cc0d3dcd8f084515dbc1aa&quot;<br>
+SRC_URI[const-oid-0.9.6.sha256sum] =3D &quot;c2459377285ad874054d797f3cceb=
f984978aa39129f6eafde5cdc8315b612f8&quot;<br>
+SRC_URI[core-foundation-sys-0.8.6.sha256sum] =3D &quot;06ea2b9bc92be3c2baa=
9334a323ebca2d6f074ff852cd1d7b11064035cd3868f&quot;<br>
+SRC_URI[cpufeatures-0.2.12.sha256sum] =3D &quot;53fe5e26ff1b7aef8bca9c6080=
520cfb8d9333c7568e1829cef191a9723e5504&quot;<br>
+SRC_URI[crunchy-0.2.2.sha256sum] =3D &quot;7a81dae078cea95a014a339291cec43=
9d2f232ebe854a9d672b796c6afafa9b7&quot;<br>
+SRC_URI[crypto-bigint-0.5.5.sha256sum] =3D &quot;0dc92fb57ca44df6db8059111=
ab3af99a63d5d0f8375d9972e319a379c6bab76&quot;<br>
+SRC_URI[crypto-common-0.1.6.sha256sum] =3D &quot;1bfb12502f3fc46cca1bb51ac=
28df9d618d813cdc3d2f25b9fe775a34af26bb3&quot;<br>
+SRC_URI[ctr-0.9.2.sha256sum] =3D &quot;0369ee1ad671834580515889b80f2ea915f=
23b8be8d0daa4bbaf2ac5c7590835&quot;<br>
+SRC_URI[curve25519-dalek-4.1.3.sha256sum] =3D &quot;97fb8b7c4503de7d6ae7b4=
2ab72a5a59857b4c937ec27a3d4539dba95b5ab2be&quot;<br>
+SRC_URI[curve25519-dalek-derive-0.1.1.sha256sum] =3D &quot;f46882e17999c6c=
c590af592290432be3bce0428cb0d5f8b6715e4dc7b383eb3&quot;<br>
+SRC_URI[dbl-0.3.2.sha256sum] =3D &quot;bd2735a791158376708f9347fe8faba9667=
589d82427ef3aed6794a8981de3d9&quot;<br>
+SRC_URI[der-0.7.9.sha256sum] =3D &quot;f55bf8e7b65898637379c1b74eb1551107c=
8294ed26d855ceb9fd1a09cfc9bc0&quot;<br>
+SRC_URI[des-0.8.1.sha256sum] =3D &quot;ffdd80ce8ce993de27e9f063a444a4d53ce=
8e8db4c1f00cc03af5ad5a9867a1e&quot;<br>
+SRC_URI[difflib-0.4.0.sha256sum] =3D &quot;6184e33543162437515c2e2b4871479=
4e37845ec9851711914eec9d308f6ebe8&quot;<br>
+SRC_URI[digest-0.10.7.sha256sum] =3D &quot;9ed9a281f7bc9b7576e61468ba615a6=
6a5c8cfdff42420a70aa82701a3b1e292&quot;<br>
+SRC_URI[dirs-next-2.0.0.sha256sum] =3D &quot;b98cf8ebf19c3d1b223e151f99a4f=
9f0690dca41414773390fc824184ac833e1&quot;<br>
+SRC_URI[dirs-sys-next-0.1.2.sha256sum] =3D &quot;4ebda144c4fe02d1f7ea1a7d9=
641b6fc6b580adcfa024ae48797ecdeb6825b4d&quot;<br>
+SRC_URI[displaydoc-0.2.5.sha256sum] =3D &quot;97369cbbc041bc366949bc74d346=
58d6cda5621039731c6310521892a3a20ae0&quot;<br>
+SRC_URI[doc-comment-0.3.3.sha256sum] =3D &quot;fea41bba32d969b513997752735=
605054bc0dfa92b4c56bf1189f2e174be7a10&quot;<br>
+SRC_URI[dsa-0.6.3.sha256sum] =3D &quot;48bc224a9084ad760195584ce5abb3c2c34=
a225fa312a128ad245a6b412b7689&quot;<br>
+SRC_URI[dyn-clone-1.0.17.sha256sum] =3D &quot;0d6ef0072f8a535281e4876be788=
938b528e9a1d43900b82c2569af7da799125&quot;<br>
+SRC_URI[eax-0.5.0.sha256sum] =3D &quot;9954fabd903b82b9d7a68f65f97dc96dd9a=
d368e40ccc907a7c19d53e6bfac28&quot;<br>
+SRC_URI[ecb-0.1.2.sha256sum] =3D &quot;1a8bfa975b1aec2145850fcaa1c6fe269a1=
6578c44705a532ae3edc92b8881c7&quot;<br>
+SRC_URI[ecdsa-0.16.9.sha256sum] =3D &quot;ee27f32b5c5292967d2d4a9d7f1e0b0a=
ed2c15daded5a60300e4abb9d8020bca&quot;<br>
+SRC_URI[ed25519-2.2.3.sha256sum] =3D &quot;115531babc129696a58c64a4fef0a8b=
f9e9698629fb97e9e40767d235cfbcd53&quot;<br>
+SRC_URI[ed25519-dalek-2.1.1.sha256sum] =3D &quot;4a3daa8e81a3963a60642bcc1=
f90a670680bd4a77535faa384e9d1c79d620871&quot;<br>
+SRC_URI[either-1.13.0.sha256sum] =3D &quot;60b1af1c220855b6ceac025d3f6ecdd=
2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0&quot;<br>
+SRC_URI[elliptic-curve-0.13.8.sha256sum] =3D &quot;b5e6043086bf7973472e0c7=
dff2142ea0b680d30e18d9cc40f267efbf222bd47&quot;<br>
+SRC_URI[ena-0.14.3.sha256sum] =3D &quot;3d248bdd43ce613d87415282f69b9bb99d=
947d290b10962dd6c56233312c2ad5&quot;<br>
+SRC_URI[equivalent-1.0.1.sha256sum] =3D &quot;5443807d6dff69373d433ab9ef53=
78ad8df50ca6298caf15de6e52e24aaf54d5&quot;<br>
+SRC_URI[errno-0.3.9.sha256sum] =3D &quot;534c5cf6194dfab3db3242765c03bbe25=
7cf92f22b38f6bc0c58d59108a820ba&quot;<br>
+SRC_URI[fastrand-2.1.0.sha256sum] =3D &quot;9fc0510504f03c51ada170672ac806=
f1f105a88aa97a5281117e1ddc3368e51a&quot;<br>
+SRC_URI[ff-0.13.0.sha256sum] =3D &quot;ded41244b729663b1e574f1b4fb731469f6=
9f79c17667b5d776b16cda0479449&quot;<br>
+SRC_URI[fiat-crypto-0.2.9.sha256sum] =3D &quot;28dea519a9695b9977216879a3e=
bfddf92f1c08c05d984f8996aecd6ecdc811d&quot;<br>
+SRC_URI[fixedbitset-0.4.2.sha256sum] =3D &quot;0ce7134b9999ecaf8bcd65542e4=
36736ef32ddca1b3e06094cb6ec5755203b80&quot;<br>
+SRC_URI[foreign-types-0.3.2.sha256sum] =3D &quot;f6f339eb8adc052cd2ca78910=
fda869aefa38d22d5cb648e6485e4d3fc06f3b1&quot;<br>
+SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D &quot;00b0228411908ca868=
5dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b&quot;<br>
+SRC_URI[generic-array-0.14.7.sha256sum] =3D &quot;85649ca51fd72272d7821ada=
f274ad91c288277713d9c18820d8499a7ff69e9a&quot;<br>
+SRC_URI[generic-array-1.1.0.sha256sum] =3D &quot;96512db27971c2c3eece70a1e=
106fbe6c87760234e31e8f7e5634912fe52794a&quot;<br>
+SRC_URI[getrandom-0.2.15.sha256sum] =3D &quot;c4567c8db10ae91089c99af84c68=
c38da3ec2f087c3f82960bcdbf3656b6f4d7&quot;<br>
+SRC_URI[ghash-0.5.1.sha256sum] =3D &quot;f0d8a4362ccb29cb0b265253fb0a2728f=
592895ee6854fd9bc13f2ffda266ff1&quot;<br>
+SRC_URI[glob-0.3.1.sha256sum] =3D &quot;d2fabcfbdc87f4758337ca535fb41a6d70=
1b65693ce38287d856d1674551ec9b&quot;<br>
+SRC_URI[group-0.13.0.sha256sum] =3D &quot;f0f9ef7462f7c099f518d754361858f8=
6d8a07af53ba9af0fe635bbccb151a63&quot;<br>
+SRC_URI[hashbrown-0.14.5.sha256sum] =3D &quot;e5274423e17b7c9fc20b6e7e2085=
32f9b19825d82dfd615708b70edd83df41f1&quot;<br>
+SRC_URI[hkdf-0.12.4.sha256sum] =3D &quot;7b5f8eb2ad728638ea2c7d47a21db23b7=
b58a72ed6a38256b8a1849f15fbbdf7&quot;<br>
+SRC_URI[hmac-0.12.1.sha256sum] =3D &quot;6c49c37c09c17a53d937dfbb742eb3a96=
1d65a994e6bcdcf37e7399d0cc8ab5e&quot;<br>
+SRC_URI[iana-time-zone-0.1.60.sha256sum] =3D &quot;e7ffbb5a1b541ea2561f8c4=
1c087286cc091e21e556a4f09a8f6cbf17b69b141&quot;<br>
+SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D &quot;f31827a206f56af32e=
590ba56d5d2d085f558508192593743f16b2306495269f&quot;<br>
+SRC_URI[icu_collections-1.5.0.sha256sum] =3D &quot;db2fa452206ebee18c4b5c2=
274dbf1de17008e874b4dc4f0aea9d01ca79e4526&quot;<br>
+SRC_URI[icu_locid-1.5.0.sha256sum] =3D &quot;13acbb8371917fc971be86fc8057c=
41a64b521c184808a698c02acc242dbf637&quot;<br>
+SRC_URI[icu_locid_transform-1.5.0.sha256sum] =3D &quot;01d11ac35de8e40fded=
a00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e&quot;<br>
+SRC_URI[icu_locid_transform_data-1.5.0.sha256sum] =3D &quot;fdc8ff3388f852=
bede6b579ad4e978ab004f139284d7b28715f773507b946f6e&quot;<br>
+SRC_URI[icu_normalizer-1.5.0.sha256sum] =3D &quot;19ce3e0da2ec68599d193c93=
d088142efd7f9c5d6fc9b803774855747dc6a84f&quot;<br>
+SRC_URI[icu_normalizer_data-1.5.0.sha256sum] =3D &quot;f8cafbf7aa791e9b22b=
ec55a167906f9e1215fd475cd22adfcf660e03e989516&quot;<br>
+SRC_URI[icu_properties-1.5.1.sha256sum] =3D &quot;93d6020766cfc6302c15dbbc=
9c8778c37e62c14427cb7f6e601d849e092aeef5&quot;<br>
+SRC_URI[icu_properties_data-1.5.0.sha256sum] =3D &quot;67a8effbc3dd3e4ba1a=
fa8ad918d5684b8868b3b26500753effea8d2eed19569&quot;<br>
+SRC_URI[icu_provider-1.5.0.sha256sum] =3D &quot;6ed421c8a8ef78d3e2dbc98a97=
3be2f3770cb42b606e3ab18d6237c4dfde68d9&quot;<br>
+SRC_URI[icu_provider_macros-1.5.0.sha256sum] =3D &quot;1ec89e9337638ecdc08=
744df490b221a7399bf8d164eb52a665454e60e075ad6&quot;<br>
+SRC_URI[idea-0.5.1.sha256sum] =3D &quot;075557004419d7f2031b8bb7f44bb43e55=
a83ca7b63076a8fb8fe75753836477&quot;<br>
+SRC_URI[idna-1.0.2.sha256sum] =3D &quot;bd69211b9b519e98303c015e21a007e293=
db403b6c85b9b124e133d25e242cdd&quot;<br>
+SRC_URI[indexmap-2.2.6.sha256sum] =3D &quot;168fb715dda47215e360912c096649=
d23d58bf392ac62f73919e831745e40f26&quot;<br>
+SRC_URI[inout-0.1.3.sha256sum] =3D &quot;a0c10553d664a4d0bcff9f4215d0aac67=
a639cc68ef660840afe309b807bc9f5&quot;<br>
+SRC_URI[itertools-0.11.0.sha256sum] =3D &quot;b1c173a5686ce8bfa551b3563d0c=
2170bf24ca44da99c7ca4bfdab5418c3fe57&quot;<br>
+SRC_URI[js-sys-0.3.69.sha256sum] =3D &quot;29c15563dc2726973df627357ce0c9d=
dddbea194836909d655df6a75d2cf296d&quot;<br>
+SRC_URI[lalrpop-0.20.2.sha256sum] =3D &quot;55cb077ad656299f160924eb2912aa=
147d7339ea7d69e1b5517326fdcec3c1ca&quot;<br>
+SRC_URI[lalrpop-util-0.20.2.sha256sum] =3D &quot;507460a910eb7b32ee961886f=
f48539633b788a36b65692b95f225b844c82553&quot;<br>
+SRC_URI[lazy_static-1.5.0.sha256sum] =3D &quot;bbd2bcb4c963f2ddae06a2efc7e=
9f3591312473c50c6685e1f298068316e66fe&quot;<br>
+SRC_URI[lazycell-1.3.0.sha256sum] =3D &quot;830d08ce1d1d941e6b30645f1a0eb5=
643013d835ce3779a5fc208261dbe10f55&quot;<br>
+SRC_URI[libc-0.2.155.sha256sum] =3D &quot;97b3888a4aecf77e811145cadf6eef59=
01f4782c53886191b2f693f24761847c&quot;<br>
+SRC_URI[libloading-0.8.4.sha256sum] =3D &quot;e310b3a6b5907f99202fcdb4960f=
f45b93735d7c7d96b760fcff8db2dc0e103d&quot;<br>
+SRC_URI[libm-0.2.8.sha256sum] =3D &quot;4ec2a862134d2a7d32d7983ddcdd1c4923=
530833c9f2ea1a44fc5fa473989058&quot;<br>
+SRC_URI[libredox-0.1.3.sha256sum] =3D &quot;c0ff37bd590ca25063e35af745c343=
cb7a0271906fb7b37e4813e8f79f00268d&quot;<br>
+SRC_URI[linux-raw-sys-0.4.14.sha256sum] =3D &quot;78b3ae25bc7c8c38cec158d1=
f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89&quot;<br>
+SRC_URI[litemap-0.7.3.sha256sum] =3D &quot;643cb0b8d4fcc284004d5fd0d67ccf6=
1dfffadb7f75e1e71bc420f4688a3a704&quot;<br>
+SRC_URI[lock_api-0.4.12.sha256sum] =3D &quot;07af8b9cdd281b7915f413fa73f29=
ebd5d55d0d3f0155584dade1ff18cea1b17&quot;<br>
+SRC_URI[log-0.4.22.sha256sum] =3D &quot;a7a70ba024b9dc04c27ea2f0c0548feb47=
4ec5c54bba33a7f72f873a39d07b24&quot;<br>
+SRC_URI[md-5-0.10.6.sha256sum] =3D &quot;d89e7ee0cfbedfc4da334021849219624=
1d89eefb6dab27de5df917a6d2e78cf&quot;<br>
+SRC_URI[memchr-2.7.4.sha256sum] =3D &quot;78ca9ab1a0babb1e7d5695e353088628=
9c18cf2f87ec19a575a0abdce112e3a3&quot;<br>
+SRC_URI[memsec-0.7.0.sha256sum] =3D &quot;c797b9d6bb23aab2fc369c65f871be49=
214f5c759af65bde26ffaaa2b646b492&quot;<br>
+SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D &quot;68354c5c6bd36d73ff3fece=
b05efa59b6acb7626617f4962be322a825e61f79a&quot;<br>
+SRC_URI[nettle-7.4.0.sha256sum] =3D &quot;44e6ff4a94e5d34a1fd5abbd39418074=
646e2fa51b257198701330f22fcd6936&quot;<br>
+SRC_URI[nettle-sys-2.3.0.sha256sum] =3D &quot;b495053a10a19a80e3a26bf1212e=
92e29350797b5f5bdc58268c3f3f818e66ec&quot;<br>
+SRC_URI[new_debug_unreachable-1.0.6.sha256sum] =3D &quot;650eef8c711430f1a=
879fdd01d4745a7deea475becfb90269c06775983bbf086&quot;<br>
+SRC_URI[nom-7.1.3.sha256sum] =3D &quot;d273983c5a657a70a3e8f2a01329822f3b8=
c8172b73826411a55751e404a0a4a&quot;<br>
+SRC_URI[num-bigint-dig-0.8.4.sha256sum] =3D &quot;dc84195820f291c7697304f3=
cbdadd1cb7199c0efc917ff5eafd71225c136151&quot;<br>
+SRC_URI[num-integer-0.1.46.sha256sum] =3D &quot;7969661fd2958a5cb096e56c8e=
1ad0444ac2bbcd0061bd28660485a44879858f&quot;<br>
+SRC_URI[num-iter-0.1.45.sha256sum] =3D &quot;1429034a0490724d0075ebb2bc9e8=
75d6503c3cf69e235a8941aa757d83ef5bf&quot;<br>
+SRC_URI[num-traits-0.2.19.sha256sum] =3D &quot;071dfc062690e90b734c0b2273c=
e72ad0ffa95f0c74596bc250dcfd960262841&quot;<br>
+SRC_URI[once_cell-1.19.0.sha256sum] =3D &quot;3fdb12b2476b595f9358c5161aa4=
67c2438859caa136dec86c26fdd2efe17b92&quot;<br>
+SRC_URI[opaque-debug-0.3.1.sha256sum] =3D &quot;c08d65885ee38876c4f86fa503=
fb49d7b507c2b62552df7c70b2fce627e06381&quot;<br>
+SRC_URI[openssl-0.10.64.sha256sum] =3D &quot;95a0481286a310808298130d22dd1=
fef0fa571e05a8f44ec801801e84b216b1f&quot;<br>
+SRC_URI[openssl-macros-0.1.1.sha256sum] =3D &quot;a948666b637a0f465e8564c7=
3e89d4dde00d72d4d473cc972f390fc3dcee7d9c&quot;<br>
+SRC_URI[openssl-sys-0.9.102.sha256sum] =3D &quot;c597637d56fbc83893a35eb0d=
d04b2b8e7a50c91e64e9493e398b5df4fb45fa2&quot;<br>
+SRC_URI[p256-0.13.2.sha256sum] =3D &quot;c9863ad85fa8f4460f9c48cb909d38a0d=
689dba1f6f6988a5e3e0d31071bcd4b&quot;<br>
+SRC_URI[p384-0.13.0.sha256sum] =3D &quot;70786f51bcc69f6a4c0360e063a4cac54=
19ef7c5cd5b3c99ad70f3be5ba79209&quot;<br>
+SRC_URI[p521-0.13.3.sha256sum] =3D &quot;0fc9e2161f1f215afdfce23677034ae13=
7bbd45016a880c2eb3ba8eb95f085b2&quot;<br>
+SRC_URI[parking_lot-0.12.3.sha256sum] =3D &quot;f1bf18183cf54e8d6059647fc3=
063646a1801cf30896933ec2311622cc4b9a27&quot;<br>
+SRC_URI[parking_lot_core-0.9.10.sha256sum] =3D &quot;1e401f977ab385c9e4e3a=
b30627d6f26d00e2c73eef317493c4ec6d468726cf8&quot;<br>
+SRC_URI[peeking_take_while-0.1.2.sha256sum] =3D &quot;19b17cddbe7ec3f8bc80=
0887bab5e717348c95ea2ca0b1bf0837fb964dc67099&quot;<br>
+SRC_URI[pem-rfc7468-0.7.0.sha256sum] =3D &quot;88b39c9bfcfc231068454382784=
bb460aae594343fb030d46e9f50a645418412&quot;<br>
+SRC_URI[petgraph-0.6.5.sha256sum] =3D &quot;b4c5cc86750666a3ed20bdaf5ca2a0=
344f9c67674cae0515bec2da16fbaa47db&quot;<br>
+SRC_URI[phf_shared-0.10.0.sha256sum] =3D &quot;b6796ad771acdc0123d2a88dc42=
8b5e38ef24456743ddb1744ed628f9815c096&quot;<br>
+SRC_URI[pkcs1-0.7.5.sha256sum] =3D &quot;c8ffb9f10fa047879315e6625af03c164=
b16962a5368d724ed16323b68ace47f&quot;<br>
+SRC_URI[pkcs8-0.10.2.sha256sum] =3D &quot;f950b2377845cebe5cf8b5165cb3cc1a=
5e0fa5cfa3e1f7f55707d8fd82e0a7b7&quot;<br>
+SRC_URI[pkg-config-0.3.30.sha256sum] =3D &quot;d231b230927b5e4ad203db57bbc=
bee2802f6bce620b1e4a9024a07d94e2907ec&quot;<br>
+SRC_URI[polyval-0.6.2.sha256sum] =3D &quot;9d1fe60d06143b2430aa532c94cfe9e=
29783047f06c0d7fd359a9a51b729fa25&quot;<br>
+SRC_URI[ppv-lite86-0.2.17.sha256sum] =3D &quot;5b40af805b3121feab8a3c29f04=
d8ad262fa8e0561883e7653e024ae4479e6de&quot;<br>
+SRC_URI[precomputed-hash-0.1.1.sha256sum] =3D &quot;925383efa346730478fb48=
38dbe9137d2a47675ad789c546d150a6e1dd4ab31c&quot;<br>
+SRC_URI[predicates-3.1.0.sha256sum] =3D &quot;68b87bfd4605926cdfefc1c3b5f8=
fe560e3feca9d5552cf68c466d3d8236c7e8&quot;<br>
+SRC_URI[predicates-core-1.0.6.sha256sum] =3D &quot;b794032607612e7abeb4db6=
9adb4e33590fa6cf1149e95fd7cb00e634b92f174&quot;<br>
+SRC_URI[predicates-tree-1.0.9.sha256sum] =3D &quot;368ba315fb8c5052ab692e6=
8a0eefec6ec57b23a36959c14496f0b0df2c0cecf&quot;<br>
+SRC_URI[primeorder-0.13.6.sha256sum] =3D &quot;353e1ca18966c16d9deb1c69278=
edbc5f194139612772bd9537af60ac231e1e6&quot;<br>
+SRC_URI[proc-macro2-1.0.86.sha256sum] =3D &quot;5e719e8df665df0d1c8fbfd238=
015744736151d4445ec0836b8e628aae103b77&quot;<br>
+SRC_URI[quote-1.0.36.sha256sum] =3D &quot;0fa76aaf39101c457836aec0ce2316db=
dc3ab723cdda1c6bd4e6ad4208acaca7&quot;<br>
+SRC_URI[rand-0.8.5.sha256sum] =3D &quot;34af8d1a0e25924bc5b7c43c079c942339=
d8f0a8b57c39049bef581b46327404&quot;<br>
+SRC_URI[rand_chacha-0.3.1.sha256sum] =3D &quot;e6c10a63a0fa32252be49d21e77=
09d4d4baf8d231c2dbce1eaa8141b9b127d88&quot;<br>
+SRC_URI[rand_core-0.6.4.sha256sum] =3D &quot;ec0be4795e2f6a28069bec0b5ff3e=
2ac9bafc99e6a9a7dc3547996c5c816922c&quot;<br>
+SRC_URI[redox_syscall-0.5.2.sha256sum] =3D &quot;c82cf8cff14456045f55ec424=
1383baeff27af886adb72ffb2162f99911de0fd&quot;<br>
+SRC_URI[redox_users-0.4.5.sha256sum] =3D &quot;bd283d9651eeda4b2a83a43c1c9=
1b266c40fd76ecd39a50a8c630ae69dc72891&quot;<br>
+SRC_URI[regex-1.10.5.sha256sum] =3D &quot;b91213439dad192326a0d7c6ee395591=
0425f441d7038e0d6933b0aec5c4517f&quot;<br>
+SRC_URI[regex-automata-0.4.7.sha256sum] =3D &quot;38caf58cc5ef2fed281f8929=
2ef23f6365465ed9a41b7a7754eb4e26496c92df&quot;<br>
+SRC_URI[regex-syntax-0.8.4.sha256sum] =3D &quot;7a66a03ae7c801facd77a29370=
b4faec201768915ac14a721ba36f20bc9c209b&quot;<br>
+SRC_URI[rfc6979-0.4.0.sha256sum] =3D &quot;f8dd2a808d456c4a54e300a23e9f5a6=
7e122c3024119acbfd73e3bf664491cb2&quot;<br>
+SRC_URI[ripemd-0.1.3.sha256sum] =3D &quot;bd124222d17ad93a644ed9d011a40f4f=
b64aa54275c08cc216524a9ea82fb09f&quot;<br>
+SRC_URI[rsa-0.9.6.sha256sum] =3D &quot;5d0e5124fcb30e76a7e79bfee683a2746db=
83784b86289f6251b54b7950a0dfc&quot;<br>
+SRC_URI[rustc-hash-1.1.0.sha256sum] =3D &quot;08d43f7aa6b08d49f382cde6a798=
2047c3426db949b1424bc4b7ec9ae12c6ce2&quot;<br>
+SRC_URI[rustc_version-0.4.0.sha256sum] =3D &quot;bfa0f585226d2e68097d4f95d=
113b15b83a82e819ab25717ec0590d9584ef366&quot;<br>
+SRC_URI[rustix-0.38.34.sha256sum] =3D &quot;70dc5ec042f7a43c4a73241207cecc=
9873a06d45debb38b329f8541d85c2730f&quot;<br>
+SRC_URI[rustversion-1.0.17.sha256sum] =3D &quot;955d28af4278de8121b7ebeb79=
6b6a45735dc01436d898801014aced2773a3d6&quot;<br>
+SRC_URI[same-file-1.0.6.sha256sum] =3D &quot;93fc1dc3aaa9bfed95e02e6eadabb=
4baf7e3078b0bd1b4d7b6b0b68378900502&quot;<br>
+SRC_URI[scopeguard-1.2.0.sha256sum] =3D &quot;94143f37725109f92c262ed2cf5e=
59bce7498c01bcc1502d7b9afe439a4e9f49&quot;<br>
+SRC_URI[sec1-0.7.3.sha256sum] =3D &quot;d3e97a565f76233a6003f9f5c54be1d9c5=
bdfa3eccfb189469f11ec4901c47dc&quot;<br>
+SRC_URI[semver-1.0.23.sha256sum] =3D &quot;61697e0a1c7e512e84a621326239844=
a24d8207b4669b41bc18b32ea5cbf988b&quot;<br>
+SRC_URI[sequoia-openpgp-1.21.1.sha256sum] =3D &quot;b870b0275eeae174058fcf=
0ce5affccaaafeb7eceeabce8d6c7f51fbe6a41e2a&quot;<br>
+SRC_URI[sequoia-policy-config-0.6.0.sha256sum] =3D &quot;757d45d308f2bd9c0=
d6fdd640f320998ad24856bdf2890ddd28d3c3b85808274&quot;<br>
+SRC_URI[serde-1.0.204.sha256sum] =3D &quot;bc76f558e0cbb2a839d37354c575f1d=
c3fdc6546b5be373ba43d95f231bf7c12&quot;<br>
+SRC_URI[serde_derive-1.0.204.sha256sum] =3D &quot;e0cd7e117be63d3c36787767=
53929474f3b04a43a080c744d6b0ae2a8c28e222&quot;<br>
+SRC_URI[sha1collisiondetection-0.3.4.sha256sum] =3D &quot;1f606421e4a60128=
77e893c399822a4ed4b089164c5969424e1b9d1e66e6964b&quot;<br>
+SRC_URI[sha2-0.10.8.sha256sum] =3D &quot;793db75ad2bcafc3ffa7c68b215fee268=
f537982cd901d132f89c6343f3a3dc8&quot;<br>
+SRC_URI[shlex-1.3.0.sha256sum] =3D &quot;0fda2ff0d084019ba4d7c6f371c95d8fd=
75ce3524c3cb8fb653a3023f6323e64&quot;<br>
+SRC_URI[signature-2.2.0.sha256sum] =3D &quot;77549399552de45a898a580c1b41d=
445bf730df867cc44e6c0233bbc4b8329de&quot;<br>
+SRC_URI[siphasher-0.3.11.sha256sum] =3D &quot;38b58827f4464d87d377d175e90b=
f58eb00fd8716ff0a62f80356b5e61555d0d&quot;<br>
+SRC_URI[smallvec-1.13.2.sha256sum] =3D &quot;3c5e1a9a646d36c3599cd173a4128=
2daf47c44583ad367b8e6837255952e5c67&quot;<br>
+SRC_URI[spin-0.9.8.sha256sum] =3D &quot;6980e8d7511241f8acf4aebddbb1ff938d=
f5eebe98691418c4468d0b72a96a67&quot;<br>
+SRC_URI[spki-0.7.3.sha256sum] =3D &quot;d91ed6c858b01f942cd56b37a94b3e0a17=
98290327d1236e4d9cf4eaca44d29d&quot;<br>
+SRC_URI[stable_deref_trait-1.2.0.sha256sum] =3D &quot;a8f112729512f8e442d8=
1f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3&quot;<br>
+SRC_URI[string_cache-0.8.7.sha256sum] =3D &quot;f91138e76242f575eb1d3b38b4=
f1362f10d3a43f47d182a5b359af488a02293b&quot;<br>
+SRC_URI[subtle-2.6.1.sha256sum] =3D &quot;13c2bddecc57b384dee18652358fb231=
72facb8a2c51ccc10d74c157bdea3292&quot;<br>
+SRC_URI[syn-2.0.70.sha256sum] =3D &quot;2f0209b68b3613b093e0ec905354eccaed=
cfe83b8cb37cbdeae64026c3064c16&quot;<br>
+SRC_URI[synstructure-0.13.1.sha256sum] =3D &quot;c8af7666ab7b6390ab78131fb=
5b0fce11d6b7a6951602017c35fa82800708971&quot;<br>
+SRC_URI[tempfile-3.10.1.sha256sum] =3D &quot;85b77fafb263dd9d05cbeac119526=
425676db3784113aa9295c88498cbf8bff1&quot;<br>
+SRC_URI[term-0.7.0.sha256sum] =3D &quot;c59df8ac95d96ff9bede18eb7300b0fda5=
e5d8d90960e76f8e14ae765eedbf1f&quot;<br>
+SRC_URI[termtree-0.4.1.sha256sum] =3D &quot;3369f5ac52d5eb6ab48c6b4ffdc8ef=
bcad6b89c765749064ba298f2c68a16a76&quot;<br>
+SRC_URI[thiserror-1.0.61.sha256sum] =3D &quot;c546c80d6be4bc6a00c0f01730c0=
8df82eaa7a7a61f11d656526506112cc1709&quot;<br>
+SRC_URI[thiserror-impl-1.0.61.sha256sum] =3D &quot;46c3384250002a6d5af4d11=
4f2845d37b57521033f30d5c3f46c4d70e1197533&quot;<br>
+SRC_URI[tiny-keccak-2.0.2.sha256sum] =3D &quot;2c9d3793400a45f954c52e73d06=
8316d76b6f4e36977e3fcebb13a2721e80237&quot;<br>
+SRC_URI[tinystr-0.7.6.sha256sum] =3D &quot;9117f5d4db391c1cf6927e7bea3db74=
b9a1c1add8f7eda9ffd5364f40f57b82f&quot;<br>
+SRC_URI[toml-0.5.11.sha256sum] =3D &quot;f4f7f0dd8d50a853a531c426359045b19=
98f04219d88799810762cd4ad314234&quot;<br>
+SRC_URI[twofish-0.7.1.sha256sum] =3D &quot;a78e83a30223c757c3947cd144a3101=
4ff04298d8719ae10d03c31c0448c8013&quot;<br>
+SRC_URI[typenum-1.17.0.sha256sum] =3D &quot;42ff0bf0c66b8238c6f3b578df37d0=
b7848e55df8577b3f74f92a69acceeb825&quot;<br>
+SRC_URI[unicode-ident-1.0.12.sha256sum] =3D &quot;3354b9ac3fae1ff6755cb6db=
53683adb661634f67557942dea4facebec0fee4b&quot;<br>
+SRC_URI[unicode-xid-0.2.4.sha256sum] =3D &quot;f962df74c8c05a667b5ee8bcf16=
2993134c104e96440b663c8daa176dc772d8c&quot;<br>
+SRC_URI[universal-hash-0.5.1.sha256sum] =3D &quot;fc1de2c688dc15305988b563=
c3854064043356019f97a4b46276fe734c4f07ea&quot;<br>
+SRC_URI[utf16_iter-1.0.5.sha256sum] =3D &quot;c8232dd3cdaed5356e0f716d285e=
4b40b932ac434100fe9b7e0e8e935b9e6246&quot;<br>
+SRC_URI[utf8_iter-1.0.4.sha256sum] =3D &quot;b6c140620e7ffbb22c2dee59cafe6=
084a59b5ffc27a8859a5f0d494b5d52b6be&quot;<br>
+SRC_URI[vcpkg-0.2.15.sha256sum] =3D &quot;accd4ea62f7bb7a82fe23066fb0957d4=
8ef677f6eeb8215f372f52e48bb32426&quot;<br>
+SRC_URI[version_check-0.9.4.sha256sum] =3D &quot;49874b5167b65d7193b8aba15=
67f5c7d93d001cafc34600cee003eda787e483f&quot;<br>
+SRC_URI[wait-timeout-0.2.0.sha256sum] =3D &quot;9f200f5b12eb75f8c1ed65abd4=
b2db8a6e1b138a20de009dacee265a2498f3f6&quot;<br>
+SRC_URI[walkdir-2.5.0.sha256sum] =3D &quot;29790946404f91d9c5d06f9874efdde=
a1dc06c5efe94541a7d6863108e3a5e4b&quot;<br>
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D &quot;9c8d87e72b=
64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423&quot;<br>
+SRC_URI[wasm-bindgen-0.2.92.sha256sum] =3D &quot;4be2531df63900aeb2bca0daa=
addec08491ee64ceecbee5076636a3b026795a8&quot;<br>
+SRC_URI[wasm-bindgen-backend-0.2.92.sha256sum] =3D &quot;614d787b966d3989f=
a7bb98a654e369c762374fd3213d212cfc0251257e747da&quot;<br>
+SRC_URI[wasm-bindgen-macro-0.2.92.sha256sum] =3D &quot;a1f8823de937b71b946=
0c0c34e25f3da88250760bec0ebac694b49997550d726&quot;<br>
+SRC_URI[wasm-bindgen-macro-support-0.2.92.sha256sum] =3D &quot;e94f17b526d=
0a461a191c78ea52bbce64071ed5c04c9ffe424dcb38f74171bb7&quot;<br>
+SRC_URI[wasm-bindgen-shared-0.2.92.sha256sum] =3D &quot;af190c94f2773fdb37=
29c55b007a722abb5384da03bc0986df4c289bf5567e96&quot;<br>
+SRC_URI[win-crypto-ng-0.5.1.sha256sum] =3D &quot;99abfb435a71e54ab2971d8d8=
c32f1a7e006cdbf527f71743b1d45b93517bb92&quot;<br>
+SRC_URI[winapi-0.3.9.sha256sum] =3D &quot;5c839a674fcd7a98952e593242ea400a=
be93992746761e38641405d28b00f419&quot;<br>
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D &quot;ac3b87c63620=
426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6&quot;<br>
+SRC_URI[winapi-util-0.1.8.sha256sum] =3D &quot;4d4cc384e1e73b93bafa6fb4f1d=
f8c41695c8a91cf9c4c64358067d15a7b6c6b&quot;<br>
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D &quot;712e227841=
d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f&quot;<br>
+SRC_URI[windows-core-0.52.0.sha256sum] =3D &quot;33ab640c8d7e35bf8ba19b884=
ba838ceb4fba93a4e8c65a9059d08afcfc683d9&quot;<br>
+SRC_URI[windows-sys-0.52.0.sha256sum] =3D &quot;282be5f36a8ce781fad8c8ae18=
fa3f9beff57ec1b52cb3de0789201425d9a33d&quot;<br>
+SRC_URI[windows-targets-0.52.6.sha256sum] =3D &quot;9b724f72796e036ab90c10=
21d4780d4d3d648aca59e491e6b98e725b84e99973&quot;<br>
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D &quot;32a4622180e7a0=
ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3&quot;<br>
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D &quot;09ec2a7bb152e2252=
b53fa7803150007879548bc709c039df7627cabbd05d469&quot;<br>
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D &quot;8e9b5ad5ab802e97eb8e2=
95ac6720e509ee4c243f69d781394014ebfe8bbfa0b&quot;<br>
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D &quot;0eee52d38c090b3ca=
a76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66&quot;<br>
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D &quot;240948bc05c5e7c6dabb=
a28bf89d89ffce3e303022809e73deaefe4f6ec56c66&quot;<br>
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D &quot;147a5c80aabfbf0c7d9=
01cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78&quot;<br>
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D &quot;24d5b23dc417412=
679681396f2b49f3de8c1473deb516bd34410872eff51ed0d&quot;<br>
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D &quot;589f6da84c64620474=
7d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec&quot;<br>
+SRC_URI[write16-1.0.0.sha256sum] =3D &quot;d1890f4022759daae28ed4fe62859b1=
236caebfc61ede2f63ed4e695f3f6d936&quot;<br>
+SRC_URI[writeable-0.5.5.sha256sum] =3D &quot;1e9df38ee2d2c3c5948ea468a8406=
ff0db0b29ae1ffde1bcf20ef305bcc95c51&quot;<br>
+SRC_URI[x25519-dalek-2.0.1.sha256sum] =3D &quot;c7e468321c81fb07fa7f4c636c=
3972b9100f0346e5b6a9f2bd0603a52f7ed277&quot;<br>
+SRC_URI[xxhash-rust-0.8.11.sha256sum] =3D &quot;63658493314859b4dfdf3fb8c1=
defd61587839def09582db50b8a4e93afca6bb&quot;<br>
+SRC_URI[yoke-0.7.4.sha256sum] =3D &quot;6c5b1314b079b0930c31e3af543d8ee175=
7b1951ae1e1565ec704403a7240ca5&quot;<br>
+SRC_URI[yoke-derive-0.7.4.sha256sum] =3D &quot;28cc31741b18cb6f1d5ff12f5b7=
523e3d6eb0852bbbad19d73905511d9849b95&quot;<br>
+SRC_URI[zerofrom-0.1.4.sha256sum] =3D &quot;91ec111ce797d0e0784a1116d0ddcd=
bea84322cd79e5d5ad173daeba4f93ab55&quot;<br>
+SRC_URI[zerofrom-derive-0.1.4.sha256sum] =3D &quot;0ea7b4a3637ea8669cedf0f=
1fd5c286a17f3de97b8dd5a70a6c167a1730e63a5&quot;<br>
+SRC_URI[zeroize-1.8.1.sha256sum] =3D &quot;ced3678a2879b30306d323f45426266=
97a464a97c0a07c9aebf7ebca65cd4dde&quot;<br>
+SRC_URI[zeroize_derive-1.4.2.sha256sum] =3D &quot;ce36e65b0d2999d2aafac989=
fb249189a141aee1f53c612c1f37d72631959f69&quot;<br>
+SRC_URI[zerovec-0.10.4.sha256sum] =3D &quot;aa2b893d79df23bfb12d5461018d40=
8ea19dfafe76c2c7ef6d4eba614f8ff079&quot;<br>
+SRC_URI[zerovec-derive-0.10.3.sha256sum] =3D &quot;6eafa6dfb17584ea3e2bd6e=
76e0cc15ad7af12b09abdd1ca55961bed9b1063c6&quot;<br>
diff --git a/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoi=
a_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.7.0.bb</a> b=
/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia_1.7.0.bb" =
rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.7.0.bb</a><br>
new file mode 100644<br>
index 0000000000..469c94fb1a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia_1.7.0=
.bb" rel=3D"noreferrer" target=3D"_blank">rpm-sequoia_1.7.0.bb</a><br>
@@ -0,0 +1,57 @@<br>
+SUMMARY =3D &quot;An OpenPGP backend for rpm using Sequoia PGP&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://sequoia-pgp.org/" rel=3D"noreferrer"=
 target=3D"_blank">https://sequoia-pgp.org/</a>&quot;<br>
+<br>
+# The license line is taken verbatim from Fedora&#39;s specfile<br>
+# with formatting differences for Yocto. (AND -&gt; &amp;, OR -&gt; |)<br>
+# <a href=3D"https://src.fedoraproject.org/rpms/rust-rpm-sequoia/blob/rawh=
ide/f/rust-rpm-sequoia.spec" rel=3D"noreferrer" target=3D"_blank">https://s=
rc.fedoraproject.org/rpms/rust-rpm-sequoia/blob/rawhide/f/rust-rpm-sequoia.=
spec</a><br>
+LICENSE =3D &quot;LGPL-2.0-or-later &amp; Apache-2.0 &amp; BSL-1.0 &amp; M=
IT &amp; Unicode-DFS-2016 &amp; (Apache-2.0 | MIT) &amp; (MIT | Apache-2.0 =
| Zlib) &amp; (Unlicense | MIT)&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Df0ff5ff7747cf7d394079c=
6ae87f5f0c&quot;<br>
+<br>
+DEPENDS =3D &quot;openssl&quot;<br>
+<br>
+inherit pkgconfig rust cargo cargo-update-recipe-crates<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-software-manageme=
nt/rpm-sequoia.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/rpm-software-management/rpm-sequoia.git;protocol=3D=
https;branch=3Dmain</a>&quot;<br>
+<br>
+SRCREV =3D &quot;0667e04ae7fb8cf0490919978d69883d16400e41&quot;<br>
+<br>
+S =3D &quot;${UNPACKDIR}/git&quot;<br>
+<br>
+require ${BPN}-crates.inc<br>
+<br>
+CARGO_BUILD_FLAGS +=3D &quot;--no-default-features --features crypto-opens=
sl&quot;<br>
+CARGO_INSTALL_LIBRARIES =3D &quot;1&quot;<br>
+<br>
+do_compile:prepend () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# rpm-sequoia.pc is generated in the source dir=
ectory<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# but the target directory does not exist there=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/target/release<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# From rpm-sequoia&#39;s README.md:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# We also set two environment variables when ca=
lling `cargo build`:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# * `PREFIX` is the prefix that will be used in=
 the generated<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0`rpm-sequoia.pc` file. It default=
s to `/usr/local`.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# * `LIBDIR` is the installed library path list=
ed in the generated<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0metadata. It can be an absolute p=
ath or one based on `${prefix}`,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0and defaults to `${prefix}/lib`.<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export PREFIX=3D&quot;${prefix}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export LIBDIR=3D&quot;${libdir}&quot;<br>
+}<br>
+<br>
+do_install:append () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Move the library to the correct location expe=
cted by rpm-sequoia.pc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${libdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${rustlibdir}/librpm_sequoia.so ${D}${li=
bdir}/librpm_sequoia.so.1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s librpm_sequoia.so.1 ${D}${libdir}/librpm_=
sequoia.so<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir -p --ignore-fail-on-non-empty ${D}${rustl=
ibdir}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# rpm-sequoia does not install its pkgconfig fi=
le. Do it manually.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${libdir}/pkgconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m644 ${S}/target/release/rpm-sequoia.p=
c ${D}${libdir}/pkgconfig<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--000000000000659715062d3b69ba--

