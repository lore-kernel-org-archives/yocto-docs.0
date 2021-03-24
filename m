Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.646.1616610266986228013
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 11:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tar5GiSp;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id l3so17949251pfc.7
        for <docs@lists.yoctoproject.org>; Wed, 24 Mar 2021 11:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=imX72OWZkj07OBQ4fjP1LdzNmo7HB18kMmjRiBNt3OM=;
        b=Tar5GiSpEkL3ms1P1sbnKxOoI6tk/RDMmI0ZAclh6RFqp5SVTvNXOQtR7SEsjPEEsY
         IFZnnfZIc2J0WUouiRMZmUofhji0fb26cKqZfl41k8KueKqXUdgoGoGOORW6l6dJ9jyk
         v6jAdz8nZ9MAOEYXsGQj8GLMsyBqazyWDMcdlXUsVh4eVw6ICj4HcmBv+FDWbTPzJacs
         IVnhBzAatarWCojjcOwutNAtHJ58eP9qjMIwGf23e3HWY2ssWC9/14N6pt24zcWS3jBc
         8N0Fj/oyF9ETEalLyIb50KzkeTaA+BuWuL+2QAZScnyAbbO3A6fZTB0ejRpmDbvj7edA
         HYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=imX72OWZkj07OBQ4fjP1LdzNmo7HB18kMmjRiBNt3OM=;
        b=iTTsD8jSIGuYRLSQA/SL5Hjh+mBvjWBoHkv/OrNsOMKfFuvfiDsMI+vbkkVePhMPzr
         grD9Xyx6e8sgl8pciHvUmIAB+yVCNZ4X/LiNzk0806G2HPN/XEv7EkQEWDGibKFjVMJZ
         V6iuNi2Ck3aF6REv1OklsTc8Rt8yseYC5owDPDHjlIfErpfG1Xf7Xklyj38NrZfmG8AD
         SHUrjZsFDwBDESbpBYUzbWwKRFK+gL+/5LD05H3lgNQ0mEWIPn2I9wr7oxj34L/pITxw
         6xS/m/8LRi7u77OJxQjOwrGKr897ja93txeOuzBU0wEbcwBZNVLFafneO5wzmGkKUQWQ
         TKFA==
X-Gm-Message-State: AOAM533ZuEm6XzZJkWofM9zXvZ4n7kW5BOKMby9IeN6LtRY/R7KVpvif
	s6xoZ5Mv7dVh72Ey1COBno1hCM6mluhqRw==
X-Google-Smtp-Source: ABdhPJx0u7d0yQMUpXEc+BE2HvVrZPn7UJgJIKMkeLweulVa0BCJRTdyQn2F397QAhf8QH6AlBdfJQ==
X-Received: by 2002:a17:902:b7cb:b029:e4:55cd:ddf0 with SMTP id v11-20020a170902b7cbb02900e455cdddf0mr4816198plz.45.1616610266057;
        Wed, 24 Mar 2021 11:24:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:2da1:1afd:1712:ea8b? ([2601:646:9200:a0f0:2da1:1afd:1712:ea8b])
        by smtp.gmail.com with ESMTPSA id f14sm3481428pfk.92.2021.03.24.11.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 11:24:25 -0700 (PDT)
Subject: Re: [docs] [PATCH v2] UBUNTU sudo apt git instead of git-core
To: Janne Kiiskila <janne.kiiskila@pelion.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <DBAPR08MB55580B8D8BF0C1EFBB404545F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9b3174bf-eb43-c78f-f6ce-abf3c3a9ff4b@gmail.com>
Date: Wed, 24 Mar 2021 11:24:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DBAPR08MB55580B8D8BF0C1EFBB404545F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 3/24/21 5:35 AM, Janne Kiiskila wrote:
>  From d7a40397af511baf3a53d12541ee601849f0ab26 Mon Sep 17 00:00:00 2001
> 
> From: Janne Kiiskila janne.kiiskila@pelion.com 
> <mailto:janne.kiiskila@pelion.com>
> 
> Date: Tue, 23 Mar 2021 11:11:39 -0700
> 
> Subject: [PATCH v2] UBUNTU sudo apt git instead of git-core
> 
> Ubuntu has changed packaging and git-core is not available anymore,
> 
> it is now just plain git.
> 
> $ sudo apt-get install git-core
> 
> [sudo] password for jankii01:
> 
> Reading package lists... Done
> 
> Building dependency tree
> 
> Reading state information... Done
> 
> Note, selecting 'git' instead of 'git-core'
> 
> git is already the newest version (1:2.17.1-1ubuntu0.8).
> 
> The following package was automatically installed and is no longer required:
> 
>    linux-hwe-5.4-headers-5.4.0-65
> 
> Use 'sudo apt autoremove' to remove it.
> 
> 0 upgraded, 0 newly installed, 0 to remove and 13 not upgraded.
> 
> Documentation should match the current package name to avoid 
> confusion/warnings.
> 
> Change can be verified by running the following script
> 
> set -ex
> 
> distros=("debian:8" "debian:9" "debian:10" "ubuntu:16.04" "ubuntu:18.04" 
> "ubuntu:20.04")
> 
> for i in "${distros[@]}"
> 
> do
> 
>     folder="${i/:/.}"      # change : to .
> 
>     mkdir -p $folder
> 
>     cd $folder
> 
>     echo FROM $i > Dockerfile
> 
>     echo RUN apt-get update \&\& apt-get install -y git >> Dockerfile
> 
>     echo
> 
>     cat Dockerfile
> 
>     docker build -t test-$folder .
> 
>     cd ..
> 
>     rm $folder/Dockerfile
> 
>     rmdir $folder
> 
> done
> 


perhaps we should install git-all instead that would be same across 
debian-like and redhat-like distros across multiple releases.

> Signed-off-by: Janne Kiiskila janne.kiiskila@pelion.com 
> <mailto:janne.kiiskila@pelion.com>
> 
> ---
> 
> documentation/poky.yaml | 2 +-
> 
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> 
> index 3c30c4430e..2554f1e496 100644
> 
> --- a/documentation/poky.yaml
> 
> +++ b/documentation/poky.yaml
> 
> @@ -11,7 +11,7 @@ YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
> 
> YOCTO_DL_URL : https://downloads.yoctoproject.org 
> <https://downloads.yoctoproject.org>
> 
> YOCTO_AB_URL : https://autobuilder.yoctoproject.org 
> <https://autobuilder.yoctoproject.org>
> 
> YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> 
> -UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip 
> texinfo gcc-multilib \
> 
> +UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo 
> gcc-multilib \
> 
>        build-essential chrpath socat cpio python3 python3-pip 
> python3-pexpect \
> 
>        xz-utils debianutils iputils-ping python3-git python3-jinja2 
> libegl1-mesa libsdl1.2-dev \
> 
>        pylint3 xterm python3-subunit mesa-common-dev"
> 
> -- 
> 
> 2.17.1
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are 
> confidential and may also be privileged. If you are not the intended 
> recipient, please notify the sender immediately and do not disclose the 
> contents to any other person, use it for any purpose, or store or copy 
> the information in any medium. Thank you.
> 
> 
> 
> 
