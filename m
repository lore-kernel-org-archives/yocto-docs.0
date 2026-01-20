Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2ADED2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:31:25 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5377.1768912281852070997
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 04:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bxekI7d6;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso53569036d6.0
        for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 04:31:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768912281; cv=none;
        d=google.com; s=arc-20240605;
        b=IlHlyLxgwTorJsup/S40KX+Xl1ah5i6nfvAE3YDTG2AMTaxY9cXdVoMn4FfFBYH6gb
         BrN3oXvPrOC2V7seIKjY81tf29DNgdKiSwC4q+XzSBoAe1YCKJeUbQtMYKqmcaNvkdvZ
         M2Fpi8q4QQnCzvldZuK98wFmrFyG9kgGTW9/+UopfVrS9bOLlK0imWtzErEMyT1SCHgQ
         MXzFQmLbvNXU0Dnysmk8JCtBsRjBwYa7UGqUjviaBtoM5DJtTWIYh7hbTSeoADOhGPJJ
         oZXOKyouWKcbRlxu0vpuhcOe1PQj94NIcIBdm8BTVENLhRsoScmPNcdg0SVnq2BtWLnc
         IzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3FOVJGag79m2izN7S0yu1Cgo9alM3OM2bBGislUcfp8=;
        fh=2rnQJTGylf4tf2dVfCZ2YEBMXRIuQblSFn1TPjyt9K4=;
        b=VsHbOGOzp7smBXvpAj+z06zVSgw3qa6iJLfPiZjsjJ3A71pOunnHg+db3eF/FIvIHN
         3ofjVC5aSDmcCZt/H7qjEQiJXKTZihsChrHYsob4wcziegpJNbfhte8LRMAHHwBPdfPM
         ZgNC+UPZqKBBdOg03ZXUQRskoJO0qT6+dV1PiJkP9JYzWpKHBSB6A0sz9CvPqQ1dNQor
         wozAIbdhv+j4uawdwYlPJyl7UWuGjd/CH84GlpnNvvJ+kg+v8395ZMF3rjFDx1sb11es
         blj/NryIzqVevQq9GWeoDvvqHVthWlcNQxYpuptbJBgcbtBiPkRtM7TfK6U9MAVaZ/qu
         2zzA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768912281; x=1769517081; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3FOVJGag79m2izN7S0yu1Cgo9alM3OM2bBGislUcfp8=;
        b=bxekI7d6LzKN//EIbsl4S9YfhTh4D6azl+tFDnpAFcKQjGw/eog4H+no5+lO4+htWg
         XCMYllab8v8Umma/zlm6TJCxTud7yeUXDge1Q9c4QsKunrdTFMSUb35ZRvjZfvcBWGvH
         Re18KnqyOtErJ/f09rWxoG6QjdV2tAJN+AjV0+Inb6hZrKfgnHR0W6MAyDgNnBAbts+5
         sr7M+1/3qAZVRvIzUAmxRoTtUc3LalO00a4PFyY5mOx2nGW7aMKiorkIt0TiNzxxA8Mp
         1UQk55rERIRI2u3f9KVbJnuHH1ue4MFmRJWiFk3tSXYmOe390LNtqizSIOWegDu+H6B7
         TsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912281; x=1769517081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FOVJGag79m2izN7S0yu1Cgo9alM3OM2bBGislUcfp8=;
        b=AboW5iXCSvOopBfeLuuJish2obQejnzy1cOgzMPKe1hGw25QkUZxq6Sq3el2QPjhlH
         UX2O4ebzEOIIIc+tkHEE+om3rr/J7LmhQ04eOU5j3v87GD2KTsoQox7rRA4INUOmrnGz
         EN2W4pai1IJ8kY4e9hwjdzkLt1aaaIdtkozX8ITmaK7vUqYjYjmTVKTtuy1DwlXuWOyL
         X6I31t9GuEW5/Q71SaUv1TtE1ZLVkrb1pHgWg12FUBYk3/Oi6DQuNRlER8pnnIFwksg6
         9i2f0tDHku0SuX3OuzwWztELXAiFH16fdEKz+kkZn12Y3BMtSohHfkQf1M5/05GXcvY8
         cmLA==
X-Forwarded-Encrypted: i=1; AJvYcCWNNxxybT0I1I5cVRG8dfHxb555fPC2uQbjbZk2DjxfBhlrld0EkznAU7xNHFDJMAlcm1tH@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yzk1qEmuJJH+ngiIuifO3SB5Jkxk0ZPwcAMMt3WYMOQppo4VrVc
	1DNqQ8cY58UssY0BaKc92JIPWF15wEyXdMdV2o4JzyPiNBw+gfBeKuDJYIrHgF7V/8MZl8nqwvO
	obBoqfDVqNX8QqZyBrsW4o7Koha8vm5xkxw==
X-Gm-Gg: AZuq6aI+Bc2lK7kzkDLcvpAA+890g97YsRd3e/Ok25328mzSvHVLNBA4TnDtoY9lpsm
	8gn0qY87a71nT+kc9W9/898JfgAcQHzvTHEtICYzppa2/sBa4bF2ofWRAu9OstbPMEYUeNWleoe
	rA+/7sm+4R8iLlvvmcALLq5i8s2CoyvqQkLO+POE6n9mwDS0o5vgPBcgUk43ci7PmfruaKLUKrY
	PDLC7tOFq1ILOTR+vCzeq0dsGhF4DTvSMGzAHntMXw2GYbeF4b9jL4w7L63eUiolX68lstwBbck
	MjmsYy09Yj1YeoFrjrai4IqHvThjnQ==
X-Received: by 2002:a05:6214:5092:b0:890:3eb8:1ee8 with SMTP id
 6a1803df08f44-89389f83a29mr229041026d6.2.1768912280821; Tue, 20 Jan 2026
 04:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20260120-bitbake-setup-choose-builtin-v2-0-ade604ff2351@bootlin.com>
 <20260120-bitbake-setup-choose-builtin-v2-2-ade604ff2351@bootlin.com>
In-Reply-To: <20260120-bitbake-setup-choose-builtin-v2-2-ade604ff2351@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Jan 2026 13:31:08 +0100
X-Gm-Features: AZwV_Qi-3mk_mMayIM75ExSj7e6t8ZgqO05f1RnUvxjEqWJEkyw991WlubTjOEo
Message-ID: <CANNYZj-O4u6t3ECRcvbdWnCQU_AW3dJmVE5aGopA4kSDmsxr2g@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/2] default-registry: update fragments choices
 with descriptions
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 12:31:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8590

I think only master configs should be adjusted to use the extended
format? Whinlatter configs should remain usable with whinlatter
version of bitbake-setup.

Alex

On Tue, 20 Jan 2026 at 09:57, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
>
> Give descriptions to the fragment choices to help the user know what to
> pick during 'bitbake-setup init'. These descriptions were based on the
> descriptions found in the corresponding configuration files in
> OE-Core/meta-yocto.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  .../configurations/oe-nodistro-master.conf.json            |  6 +++++-
>  .../configurations/oe-nodistro-whinlatter.conf.json        |  6 +++++-
>  default-registry/configurations/poky-master.conf.json      | 14 ++++++++++++--
>  default-registry/configurations/poky-whinlatter.conf.json  | 14 ++++++++++++--
>  4 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/default-registry/configurations/oe-nodistro-master.conf.json b/default-registry/configurations/oe-nodistro-master.conf.json
> index 180d2008a72..00c4befb1ac 100644
> --- a/default-registry/configurations/oe-nodistro-master.conf.json
> +++ b/default-registry/configurations/oe-nodistro-master.conf.json
> @@ -45,7 +45,11 @@
>              "oe-fragments-one-of": {
>                  "machine": {
>                      "description": "Target machines",
> -                    "options" : ["machine/qemux86-64", "machine/qemuarm64", "machine/qemuriscv64"]
> +                    "options" : [
> +                        { "name": "machine/qemux86-64", "description": "Machine configuration for running an x86-64 system on QEMU" },
> +                        { "name": "machine/qemuarm64", "description": "Machine configuration for running an ARMv8 system on QEMU" },
> +                        { "name": "machine/qemuriscv64", "description": "Machine configuration for running an RISC-V system on QEMU" }
> +                    ]
>                  }
>              }
>          }
> diff --git a/default-registry/configurations/oe-nodistro-whinlatter.conf.json b/default-registry/configurations/oe-nodistro-whinlatter.conf.json
> index 7b183ae1c43..8d416015ab0 100644
> --- a/default-registry/configurations/oe-nodistro-whinlatter.conf.json
> +++ b/default-registry/configurations/oe-nodistro-whinlatter.conf.json
> @@ -46,7 +46,11 @@
>              "oe-fragments-one-of": {
>                  "machine": {
>                      "description": "Target machines",
> -                    "options" : ["machine/qemux86-64", "machine/qemuarm64", "machine/qemuriscv64"]
> +                    "options" : [
> +                        { "name": "machine/qemux86-64", "description": "Machine configuration for running an x86-64 system on QEMU" },
> +                        { "name": "machine/qemuarm64", "description": "Machine configuration for running an ARMv8 system on QEMU" },
> +                        { "name": "machine/qemuriscv64", "description": "Machine configuration for running an RISC-V system on QEMU" }
> +                    ]
>                  }
>              }
>          }
> diff --git a/default-registry/configurations/poky-master.conf.json b/default-registry/configurations/poky-master.conf.json
> index 1de038babe7..18657ece103 100644
> --- a/default-registry/configurations/poky-master.conf.json
> +++ b/default-registry/configurations/poky-master.conf.json
> @@ -54,11 +54,21 @@
>              "oe-fragments-one-of": {
>                  "machine": {
>                      "description": "Target machines",
> -                    "options" : ["machine/qemux86-64", "machine/qemuarm64", "machine/qemuriscv64", "machine/genericarm64", "machine/genericx86-64"]
> +                    "options" : [
> +                        { "name": "machine/qemux86-64", "description": "Machine configuration for running an x86-64 system on QEMU" },
> +                        { "name": "machine/qemuarm64", "description": "Machine configuration for running an ARMv8 system on QEMU" },
> +                        { "name": "machine/qemuriscv64", "description": "Machine configuration for running an RISC-V system on QEMU" },
> +                        { "name": "machine/genericarm64", "description": "Machine configuration for Arm64 SystemReady IR/ES platforms" },
> +                        { "name": "machine/genericx86-64", "description": "Machine configuration for generic x86_64 (64-bit) PCs and servers" }
> +                    ]
>                  },
>                  "distro": {
>                      "description": "Distribution configuration variants",
> -                    "options" : ["distro/poky", "distro/poky-altcfg", "distro/poky-tiny"]
> +                    "options" : [
> +                        { "name": "distro/poky", "description": "Distro configuration for Poky (Yocto Project Reference Distro)" },
> +                        { "name": "distro/poky-altcfg", "description": "Distro configuration for Poky (systemd init manager)" },
> +                        { "name": "distro/poky-tiny", "description": "Distro configuration for Poky (optimized for size)" }
> +                    ]
>                  }
>              },
>              "configurations": [
> diff --git a/default-registry/configurations/poky-whinlatter.conf.json b/default-registry/configurations/poky-whinlatter.conf.json
> index bfa67426dbf..d9f75a8cd38 100644
> --- a/default-registry/configurations/poky-whinlatter.conf.json
> +++ b/default-registry/configurations/poky-whinlatter.conf.json
> @@ -55,11 +55,21 @@
>              "oe-fragments-one-of": {
>                  "machine": {
>                      "description": "Target machines",
> -                    "options" : ["machine/qemux86-64", "machine/qemuarm64", "machine/qemuriscv64", "machine/genericarm64", "machine/genericx86-64"]
> +                    "options" : [
> +                        { "name": "machine/qemux86-64", "description": "Machine configuration for running an x86-64 system on QEMU" },
> +                        { "name": "machine/qemuarm64", "description": "Machine configuration for running an ARMv8 system on QEMU" },
> +                        { "name": "machine/qemuriscv64", "description": "Machine configuration for running an RISC-V system on QEMU" },
> +                        { "name": "machine/genericarm64", "description": "Machine configuration for Arm64 SystemReady IR/ES platforms" },
> +                        { "name": "machine/genericx86-64", "description": "Machine configuration for generic x86_64 (64-bit) PCs and servers" }
> +                    ]
>                  },
>                  "distro": {
>                      "description": "Distribution configuration variants",
> -                    "options" : ["distro/poky", "distro/poky-altcfg", "distro/poky-tiny"]
> +                    "options" : [
> +                        { "name": "distro/poky", "description": "Distro configuration for Poky (Yocto Project Reference Distro)" },
> +                        { "name": "distro/poky-altcfg", "description": "Distro configuration for Poky (systemd init manager)" },
> +                        { "name": "distro/poky-tiny", "description": "Distro configuration for Poky (optimized for size)" }
> +                    ]
>                  }
>              },
>              "configurations": [
>
> --
> 2.52.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8588): https://lists.yoctoproject.org/g/docs/message/8588
> Mute This Topic: https://lists.yoctoproject.org/mt/117360439/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

