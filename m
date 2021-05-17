Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.16073.1621238011083527976
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 00:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 59FD620003;
	Mon, 17 May 2021 07:53:29 +0000 (UTC)
Subject: Re: [docs] [PATCH] Fedora33: add missing pkgs
To: Armin Kuster <akuster808@gmail.com>, docs@lists.yoctoproject.org
References: <20210516151557.21643-1-akuster808@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <22da4caf-7b7a-6c11-de22-278c86dbfeda@bootlin.com>
Date: Mon, 17 May 2021 09:53:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210516151557.21643-1-akuster808@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Armin,

On 5/16/21 5:15 PM, Armin Kuster wrote:
> [ Yocto #14188]
>
> The following packages where needed to a fresh FC33 install
> perl-FindBin
> perl-File-Compare
> perl-File-Copy
> perl-locale
>
> Error seen:
>
> openssl-native-1.1.1g-r0 do_configure: Execution of '/{snipped}/build/tmp-glibc/work/x86_64-linux/openssl-native/1.1.1g-r0/temp/run.do_configure.14627' failed with exit code 2:
> Can't locate FindBin.pm in @INC (you may need to install the FindBin module)
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  documentation/poky.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 22706a0fb..9737f876f 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -19,7 +19,8 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>       ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>       python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
> -     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel"
> +     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
> +     perl-File-Copy perl-locale"
>  OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>       diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>       python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel


Many thanks for the patch!
I just added "poky.yaml:" to the header line for consistency with prior
commits, but otherwise:

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
I merged your change into the "master-next" branch of yocto-docs.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

