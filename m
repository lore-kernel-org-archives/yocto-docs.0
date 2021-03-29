Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.24112.1617033255919062907
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 08:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0965910000A;
	Mon, 29 Mar 2021 15:54:13 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] UBUNTU sudo apt git instead of git-core
To: Janne Kiiskila <janne.kiiskila@pelion.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <DBAPR08MB55580B8D8BF0C1EFBB404545F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ce7645b2-602f-a675-3c9d-b17f0a742c87@bootlin.com>
Date: Mon, 29 Mar 2021 17:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <DBAPR08MB55580B8D8BF0C1EFBB404545F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Janne,

Thanks for this improvement!

On 3/24/21 1:35 PM, Janne Kiiskila wrote:
>
>  
>
> Signed-off-by: Janne Kiiskila janne.kiiskila@pelion.com
> <mailto:janne.kiiskila@pelion.com>
>
> ---
>
> documentation/poky.yaml | 2 +-
>
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>  
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
> +UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip
> texinfo gcc-multilib \
>
>       build-essential chrpath socat cpio python3 python3-pip
> python3-pexpect \
>
>       xz-utils debianutils iputils-ping python3-git python3-jinja2
> libegl1-mesa libsdl1.2-dev \
>
>       pylint3 xterm python3-subunit mesa-common-dev"
>

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Unfortunately, your patch doesn't apply, or rather your Microsoft e-mail
client or server corrupted it (I see lots of HTML in the message). Could
you send it again through "git send-email", please? I could re-implement
the patch by myself, but I'd like to keep your original commit and the
"Signed-off-by" information that it contains, to give you proper credit.

If that's too complicated for you, let me know and I'll create the patch
by myself...

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

