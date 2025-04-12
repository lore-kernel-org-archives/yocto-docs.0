Return-Path: <ypa.takayasu.ito@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232A6C369AE
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 16:38:09 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.14099.1744475884949934438
 for <docs@lists.yoctoproject.org>;
 Sat, 12 Apr 2025 09:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ig8lXG+I;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: ypa.takayasu.ito@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-227914acd20so33057815ad.1
        for <docs@lists.yoctoproject.org>; Sat, 12 Apr 2025 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744475884; x=1745080684; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Utv987ItPgaNQ6kUITX+WkdxBsier6wHz/WiElUT2o0=;
        b=Ig8lXG+IQmo3mNUmdg8hwS++JI6ZGzzvubU7RI7jy2LTnTttytWdAS8DwoqAH+jkJy
         g4O4oVBiEK33XBzZCxwkAf7GvrWhUtpjPMiV61T9DPWiDH8mKqAbivEo0Z5bpPU7iw/2
         xPYkwYH4F8B3u4reOEuuokVPI4VVJiUREELOZzlU0dgIyw7OoPN0llau5D+AN1UdQh2Y
         nRWqMc2XYl57XMgHSz8L8A+mcR44YtZQalAH8BZUgJCJkVKrYnw1/KswDJrYEMvaTyqW
         RccJ+S4CQahkJnmeMi18AbJjpBFaQmTTffV9mGNjlgoeeyTl+3L6MtLa5XhGEb03AOVJ
         zrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744475884; x=1745080684;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Utv987ItPgaNQ6kUITX+WkdxBsier6wHz/WiElUT2o0=;
        b=rr8czfKcBC5bRaP+12TR00+6PPFPTDABa74/+kZCnU60A9ireLjK7RsREOko/RLfEn
         uuHbuUh0cY2ZPt/SOmdVAUmIWRFe1Lh4j+s2oCS/sOPZ0H4YhI13xgeamXiw2VW19kL3
         ueuUjckcgqfyFVmFueSZB9EaBsHk2D4G/FOzQw/zXX4ZrKPxwnbNOSGZRmDU4sGbbV95
         NRGK76MvGs/u/9seya6H6SEcU8/9nuT+vpIIkfk4BSrW5yDSR5BS9Gsmz6GC8PoH6gqj
         bG9c1kXSZBWXKZ/U8q8G3RhoQPQuN2odNEz+EvGEH7nzI1AhHYhECpnUOY17nVTsIXfZ
         bGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7/2BlO4qOAKfMxNvU2bYRrBN5BTmf1rNALeSGrKolsAEvQBF9LqtCt1WNrTtCcf7c3GSu@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwI+dgzD9+P1PXY7JrfM0r227kutFVKg46yu4teb9UQ5D98C+8q
	WSgAkGsWTmhRsb3WPRUTM9TmksbqUiBQw2usqaO3ZXf1wMgNbewx
X-Gm-Gg: ASbGnct1L+aokZKftkaQyETvPrSAh8t5G2kpjIx92CSZzZOvOnIeguSNY3lCspEVj9E
	3M0jCNo8xh441LpYc5QlJowmFAu1tNzuBIvKhSsR8s9b9qd1PmQSDSs7nmoW/Hl9NgRhdL25KfG
	I+Irh9u5l/AbZ3vUBdO1ESA/SFmnWAn9hCYIVuQNVeCxOwlqJ50G4wL6lTW51/+jGMuQrZNTRoT
	YwcqORrfa11t5f406RbGL4KQVXGlBdw73Tijoe2y1TGUyzaLoVQB/V6izmsNBePa4rdRtz8U9BG
	Dbcfdb8kEiZd6dPuym6jRHIyZzpmTSm6d39xh4wB3bewRJN9+fUC8sDW2e+j3M4+5/iWzR0teRm
	OF2CCEA6HTxYyc3vjiz9dbpYxUtRmYSUHU8FeosiFoA==
X-Google-Smtp-Source: AGHT+IG/MGic0Fnc8qKWhki8C4QqKOPHa2A/Pa6ZOvYWX08vpMh4iPe5b0lL67c3hxR1IuliuI989Q==
X-Received: by 2002:a17:902:ccce:b0:221:1497:7b08 with SMTP id d9443c01a7336-22b7f91d901mr171579535ad.23.1744475883996;
        Sat, 12 Apr 2025 09:38:03 -0700 (PDT)
Received: from ?IPV6:2400:2412:6a60:8500:7fb7:f96a:650d:c0fe? ([2400:2412:6a60:8500:7fb7:f96a:650d:c0fe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b355sm69145035ad.87.2025.04.12.09.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 09:38:03 -0700 (PDT)
Message-ID: <5fc0d33e-4ba5-4f8d-80c2-c5c87be79680@gmail.com>
Date: Sun, 13 Apr 2025 01:38:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 04/11] migration-guides/release-notes-5.2.rst: add
 security fixes
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
 <20250328-release-note-5-2-updates-2-v1-4-c913513e9140@bootlin.com>
From: Takayasu Ito <ypa.takayasu.ito@gmail.com>
Content-Language: en-US
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-4-c913513e9140@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 12 Apr 2025 16:38:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6739

Hi all.

* CVEs that have been fixed but are not on the list

< +   * -  ``gstreamer1.0``
< +     - :cve_nist:`2024-47606`
< +   * -  ``gstreamer1.0-plugins-base``
< +     - :cve_nist:`2024-47538`, :cve_nist:`2024-47541`, :cve_nist:`2024-47542`,  :cve_nist:`2024-47600`, 
:cve_nist:`2024-47607`, :cve_nist:`2024-47615`, :cve_nist:`2024-47835`
< +   * -  ``gstreamer1.0-plugins-good``
< +     - :cve_nist:`2024-47537`, :cve_nist:`2024-47539`, :cve_nist:`2024-47540`, :cve_nist:`2024-47543`, 
:cve_nist:`2024-47544`, :cve_nist:`2024-47545`, :cve_nist:`2024-47546`, :cve_nist:`2024-47596`, :cve_nist:`2024-47597`, 
:cve_nist:`2024-47598`, :cve_nist:`2024-47599`, :cve_nist:`2024-47601`, :cve_nist:`2024-47602`, :cve_nist:`2024-47603`, 
:cve_nist:`2024-47606`, :cve_nist:`2024-47613`, :cve_nist:`2024-47774`, :cve_nist:`2024-47775`, :cve_nist:`2024-47776`, 
:cve_nist:`2024-47777`, :cve_nist:`2024-47778`, :cve_nist:`2024-47834`
see https://gstreamer.freedesktop.org/security/

< +   * - ``openssh``
< +     - :cve_nist:`2025-26465`, :cve_nist:`2025-26466`
see https://www.openssh.com/txt/release-9.9p2

< +   * - ``socat``
< +     - :cve_nist:`2024-54661`
see http://www.dest-unreach.org/socat/

* CVEs already fixed in previous releases

 > +   * - ``libssh2``
 > +     - :cve_nist:`2023-48795`

The patch for CVE-2023-28795, which is no longer needed due to libssh2 upgrading to 1.11.1, was committed on 2024/01/24 and has 
already been fixed at the time of the scarthgap release, so we do not consider it necessary to post it to this list of fixes.
see: 
https://git.yoctoproject.org/poky/commit/meta/recipes-support/libssh2/libssh2?h=walnascar&id=3adac25f899054b7d1d8c14458a1a4cd310abbd7


* CVE numbers that should be changed in ascending order

 > +   * - ``expat``
 > +     - :cve_nist:`2024-50602`, :cve_nist:`2024-8176`
< +   * - ``expat``
< +     - :cve_nist:`2024-8176`, :cve_nist:`2024-50602`


 > +   * - ``grub``
 > +     - :cve_nist:`2024-45781`, :cve_nist:`2024-45782`, :cve_nist:`2024-56737`, :cve_nist:`2024-45780`, 
:cve_nist:`2024-45783`, :cve_nist:`2025-0624`, :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2025-0622`, 
:cve_nist:`2024-45776`, :cve_nist:`2024-45777`, :cve_nist:`2025-0690`, :cve_nist:`2025-1118`, :cve_nist:`2024-45778`, 
:cve_nist:`2024-45779`, :cve_nist:`2025-0677`, :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve_nist:`2025-0686`, 
:cve_nist:`2025-0689`, :cve_nist:`2025-0678`, :cve_nist:`2025-1125`
< +   * - ``grub``
< +     - :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2024-45776`, :cve_nist:`2024-45777`, 
:cve_nist:`2024-45778`, :cve_nist:`2024-45779`, :cve_nist:`2024-45780`, :cve_nist:`2024-45781`, :cve_nist:`2024-45782`, 
:cve_nist:`2024-45783`, :cve_nist:`2024-56737`, :cve_nist:`2025-0622`, :cve_nist:`2025-0624`, :cve_nist:`2025-0677`, 
:cve_nist:`2025-0678`, :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve_nist:`2025-0686`, :cve_nist:`2025-0689`, 
:cve_nist:`2025-0690`, :cve_nist:`2025-1118`, :cve_nist:`2025-1125`

 > +   * - ``libarchive``
 > +     - :cve_nist:`2024-57970`, :cve_nist:`2025-25724`, :cve_nist:`2025-1632`
< +   * - ``libarchive``
< +     - :cve_nist:`2024-57970`, :cve_nist:`2025-1632`, :cve_nist:`2025-25724`

 > +   * - ``libxml2``
 > +     - :cve_nist:`2025-24928`, :cve_nist:`2024-56171`
< +   * - ``libxml2``
< +     - :cve_nist:`2024-56171`, :cve_nist:`2025-24928`

 > +   * - ``tiff``
 > +     - :cve_nist:`2023-52356`, :cve_nist:`2023-6228`, :cve_nist:`2023-6277`
< +   * - ``tiff``
< +     - :cve_nist:`2023-6277`, :cve_nist:`2023-52356`, :cve_nist:`2023-6228`

 > +   * - ``vim``
 > +     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`2025-22134`, :cve_nist:`2025-24014`, 
:cve_nist:`2025-26603`, :cve_nist:`2025-1215`, :cve_nist:`2025-27423`, :cve_nist:`2025-29768`
< +   * - ``vim``
< +     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`2025-1215`, :cve_nist:`2025-22134`, :cve_nist:`2025-24014`, 
:cve_nist:`2025-26603`, :cve_nist:`2025-27423`, :cve_nist:`2025-29768`



On 2025/03/28 22:07, Antonin Godard via lists.yoctoproject.org wrote:
> Add security fixes by going through the log between yocto-5.1 and
> walnascar branch tip on Poky.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   .../migration-guides/release-notes-5.2.rst         | 67 ++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> index 1e05631d9..d583f3e9d 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -765,6 +765,73 @@ The following changes have been made to the :term:`LICENSE` values set by recipe
>   Security Fixes in |yocto-ver|
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> +The following CVEs have been fixed:
> +
> +.. list-table::
> +   :widths: 30 70
> +   :header-rows: 1
> +
> +   * - Recipe
> +     - CVE IDs
> +   * - ``barebox``
> +     - :cve_nist:`2025-26721`, :cve_nist:`2025-26722`, :cve_nist:`2025-26723`, :cve_nist:`2025-26724`, :cve_nist:`2025-26725`
> +   * - ``binutils``
> +     - :cve_nist:`2024-53589`, :cve_nist:`2025-1153`
> +   * - ``curl``
> +     - :cve_nist:`2024-8096`, :cve_nist:`2024-9681`, :cve_nist:`2024-11053`, :cve_nist:`2025-0167`, :cve_nist:`2025-0665`, :cve_nist:`2025-0725`
> +   * - ``expat``
> +     - :cve_nist:`2024-50602`, :cve_nist:`2024-8176`
> +   * - ``ghostscript``
> +     - :cve_nist:`2024-46951`, :cve_nist:`2024-46952`, :cve_nist:`2024-46953`, :cve_nist:`2024-46954`, :cve_nist:`2024-46955`, :cve_nist:`2024-46956`
> +   * - ``gnutls``
> +     - :cve_nist:`2024-12243`
> +   * - ``go``
> +     - :cve_nist:`2024-34155`, :cve_nist:`2024-34156`, :cve_nist:`2024-34158`, :cve_nist:`2024-45336`, :cve_nist:`2024-45341`, :cve_nist:`2025-22866`, :cve_nist:`2025-22870`
> +   * - ``grub``
> +     - :cve_nist:`2024-45781`, :cve_nist:`2024-45782`, :cve_nist:`2024-56737`, :cve_nist:`2024-45780`, :cve_nist:`2024-45783`, :cve_nist:`2025-0624`, :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2025-0622`, :cve_nist:`2024-45776`, :cve_nist:`2024-45777`, :cve_nist:`2025-0690`, :cve_nist:`2025-1118`, :cve_nist:`2024-45778`, :cve_nist:`2024-45779`, :cve_nist:`2025-0677`, :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve_nist:`2025-0686`, :cve_nist:`2025-0689`, :cve_nist:`2025-0678`, :cve_nist:`2025-1125`
> +   * - ``libarchive``
> +     - :cve_nist:`2024-57970`, :cve_nist:`2025-25724`, :cve_nist:`2025-1632`
> +   * - ``libcap``
> +     - :cve_nist:`2025-1390`
> +   * - ``libsndfile1``
> +     - :cve_nist:`2024-50612`
> +   * - ``libssh2``
> +     - :cve_nist:`2023-48795`
> +   * - ``libtasn1``
> +     - :cve_nist:`2024-12133`
> +   * - ``libxml2``
> +     - :cve_nist:`2025-24928`, :cve_nist:`2024-56171`
> +   * - ``ofono``
> +     - :cve_nist:`2024-7539`, :cve_nist:`2024-7540`, :cve_nist:`2024-7541`, :cve_nist:`2024-7542`
> +   * - ``omvf``
> +     - :cve_nist:`2023-45236`, :cve_nist:`2023-45237`, :cve_nist:`2024-25742`
> +   * - ``openssl``
> +     - :cve_nist:`2024-9143`, :cve_nist:`2024-12797`, :cve_nist:`2024-13176`
> +   * - ``orc``
> +     - :cve_nist:`2024-40897`
> +   * - ``python3``
> +     - :cve_nist:`2025-0938`, :cve_nist:`2024-12254`
> +   * - ``qemu``
> +     - :cve_nist:`2024-6505`
> +   * - ``rsync``
> +     - :cve_nist:`2024-12084`, :cve_nist:`2024-12085`, :cve_nist:`2024-12086`, :cve_nist:`2024-12087`, :cve_nist:`2024-12088`, :cve_nist:`2024-12747`
> +   * - ``ruby``
> +     - :cve_nist:`2024-41123`, :cve_nist:`2024-41946`
> +   * - ``rust``
> +     - :cve_nist:`2024-43402`
> +   * - ``tiff``
> +     - :cve_nist:`2023-52356`, :cve_nist:`2023-6228`, :cve_nist:`2023-6277`
> +   * - ``vim``
> +     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`2025-22134`, :cve_nist:`2025-24014`, :cve_nist:`2025-26603`, :cve_nist:`2025-1215`, :cve_nist:`2025-27423`, :cve_nist:`2025-29768`
> +   * - ``webkitgtk``
> +     - :cve_nist:`2025-24143`, :cve_nist:`2025-24150`, :cve_nist:`2025-24158`, :cve_nist:`2025-24162`
> +   * - ``wpa-supplicant``
> +     - :cve_nist:`2024-5290`
> +   * - ``xserver-xorg``
> +     - :cve_nist:`2024-9632`, :cve_nist:`2025-26594`, :cve_nist:`2025-26595`, :cve_nist:`2025-26596`, :cve_nist:`2025-26597`, :cve_nist:`2025-26598`, :cve_nist:`2025-26599`, :cve_nist:`2025-26600`, :cve_nist:`2025-26601`
> +   * - ``xwayland``
> +     - :cve_nist:`2024-9632`, :cve_nist:`2025-26594`, :cve_nist:`2025-26595`, :cve_nist:`2025-26596`, :cve_nist:`2025-26597`, :cve_nist:`2025-26598`, :cve_nist:`2025-26599`, :cve_nist:`2025-26600`, :cve_nist:`2025-26601`
> +
>   Recipe Upgrades in |yocto-ver|
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6658): https://lists.yoctoproject.org/g/docs/message/6658
> Mute This Topic: https://lists.yoctoproject.org/mt/111953531/7581020
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [ypa.takayasu.ito@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Takayasu Ito
Yocto Project Ambassador
ti@itrc.jp


