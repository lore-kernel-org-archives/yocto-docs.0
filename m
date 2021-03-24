Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web10.3157.1616577553190081753
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 02:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4F52jn3pm7z5tlD;
	Wed, 24 Mar 2021 10:19:09 +0100 (CET)
Date: Wed, 24 Mar 2021 10:19:08 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Janne Kiiskila <Janne.Kiiskila@pelion.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] UBUNTU sudo apt git instead of git-core
Message-ID: <20210324091908.a3gfvr6pq3oghoe5@qschulz>
References: <KkZH.1616523262298523931.IGi7@lists.yoctoproject.org>
 <20210323182357.i4sm2b3ggj3i7cjq@qschulz>
 <DBAPR08MB5558BFAE9CD6AACFAF72D7B5F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DBAPR08MB5558BFAE9CD6AACFAF72D7B5F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Janne,

On Wed, Mar 24, 2021 at 05:51:56AM +0000, Janne Kiiskila wrote:
> Hei,
> 
> Updated patch provided with sign-off and a test script which confirms sudo apt-get install git works on mentioned distributions.
> 

Please send a v2 following the same process you went through for the
original mail (basically, the mail subject is the commit title, the mail
body is the commit log + content of the patch.

https://docs.yoctoproject.org/dev-manual/common-tasks.html#responding-to-patch-review
should help you with how to do a v2 of your patch.

Thanks for the patch :)

Slight note: your From: is different from the Signed-off-by, is this
expected?

Cheers,
Quentin

> From b43f224c44e18c1ee41e0170c4289bada8844559 Mon Sep 17 00:00:00 2001
> From: Janne Kiiskila <janne.kiiskila@arm.com>
> Date: Tue, 23 Mar 2021 11:11:39 -0700
> Subject: [PATCH] UBUNTU sudo apt git instead of git-core
> 
> Ubuntu has changed packing and git-core is not available anymore,
> it is now just plain git.
> 
> (pelion-venv) jankii01@ubuntu1804:~/poky/documentation$ sudo apt-get install git-core
> [sudo] password for jankii01:
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> Note, selecting 'git' instead of 'git-core'
> git is already the newest version (1:2.17.1-1ubuntu0.8).
> The following package was automatically installed and is no longer required:
>   linux-hwe-5.4-headers-5.4.0-65
> Use 'sudo apt autoremove' to remove it.
> 0 upgraded, 0 newly installed, 0 to remove and 13 not upgraded.
> 
> Documentation should match the current package name to avoid confusion/warnings.
> 
> Change can be verified by running the following script
> 
> set -ex
> 
> distros=("debian:8" "debian:9" "debian:10" "ubuntu:16.04" "ubuntu:18.04" "ubuntu:20.04")
> for i in "${distros[@]}"
> do
>    folder="${i/:/.}"      # change : to .
>    mkdir -p $folder
>    cd $folder
>    echo FROM $i > Dockerfile
>    echo RUN apt-get update \&\& apt-get install -y git >> Dockerfile
>    cat Dockerfile
>    docker build -t test-$folder .
>    cd ..
>    rm $folder/Dockerfile
>    rmdir $folder
> done
> 
> Signed-off-by: Janne Kiiskila <janne.kiiskila@pelion.com>
> ---
>  documentation/poky.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 3c30c4430e..2554f1e496 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -11,7 +11,7 @@ YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
>  YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> -UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texinfo gcc-multilib \
> +UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc-multilib \
>       build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
>       xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
>       pylint3 xterm python3-subunit mesa-common-dev"
> --
> 2.17.1
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

-- 
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
Fax: +43 1 667 20 02 4401
quentin.schulz@streamunlimited.com, www.streamunlimited.com
