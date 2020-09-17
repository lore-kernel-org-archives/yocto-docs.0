Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web12.12468.1600338270489161279
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 03:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IcmuWGtq;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id 8so1315612ybu.4
        for <docs@lists.yoctoproject.org>; Thu, 17 Sep 2020 03:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w6pAQJzoJK9zU+/95SKjJQCcCnOaOZjuXU7lZu1KO08=;
        b=IcmuWGtqw4qLYyaB+7cim9n9eqv9aSD4CotCGd9gAvUiWJs5zk71gM3AmxMD7oQO1i
         MnjBPkWgzc/MFVxjSLf+F6prwnWGEMy3tzpj3tAjYtWoVw/LzbK0ddZKjgBVYfp7Lbq0
         9OMFTBrroB1jXKQVIE9cKtkJ2rPlH0kKndh5D8ywAbqHuzIPKdwJ+5Hdm6MDj6SEywoq
         nopZ/O9ysK65y/xQRWmHdWKNo42+1yWaZffeiVSbFx6DEUMOvMW19x9NBFHm/TrxF0jl
         2QnCST6BqP3Zr9zIyXDBFp+0i2r+68jjYHTEClAXk/KQRJ2EVsPuaNX6kx75/4t4ybZ4
         0rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w6pAQJzoJK9zU+/95SKjJQCcCnOaOZjuXU7lZu1KO08=;
        b=Zj3/0FtCKkIvcoXyCQbKCFB9NbEOLK51TtmYGxCksYq6oiiIYVI6lq/5dZQMb69TPo
         Wp8yYdMhImQNRDMyYosRlEAwNZqkrjl2di+Eq/+8ZPkvQODoCyKPP2/zhqn0qAeujCnW
         79znf0U1x8dGabTVYRn1KKNHo/rrG7OsFL+2Uvlob7AOjKSEaAFQZlBUtFRTlt2mxyHQ
         1/DiAWEfoxg6mCl0Z/3Ho+fVU59V42ladmwDtRBtFzU2bCkmofsHyIpT9Oa1Hand/HpC
         ux6w7KqXLAcjpMJMPHkgmVUUj4effGcsFOrKUmebKreBNscrLCv4bbj3yXegkV3EoFsf
         eHTg==
X-Gm-Message-State: AOAM531yjwHSPSFYv8rXS2cJ1MmU6fALBaYJfK44GtV/MQQ9/suvYH2T
	ZuY2JjS2jKzVCPE4y5lNDom91GNmq8UjTiEKfc1fPw==
X-Google-Smtp-Source: ABdhPJxs1HMci5VPiUMgahXPFCwR9BN3YByXMOX/tbDmxFC/49L4DnZQIM34f9P4AbzAUWLNBthaD1h7SW/MWaNnOLc=
X-Received: by 2002:a25:bd41:: with SMTP id p1mr9030009ybm.475.1600338269475;
 Thu, 17 Sep 2020 03:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <1600320047-25913-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
In-Reply-To: <1600320047-25913-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 17 Sep 2020 12:24:18 +0200
Message-ID: <CAP71WjxftGS19J4fkJACm5oLgG_RjhGey29FaXAfwkJ81+EVKA@mail.gmail.com>
Subject: Re: [docs] [PATCH] sphinx: ref-variables: Added entry for IMAGE_EFI_BOOT_FILES
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

hi Khairul Rohaizzat,



On Thu, Sep 17, 2020 at 7:20 AM Jamaluddin, Khairul Rohaizzat
<khairul.rohaizzat.jamaluddin@intel.com> wrote:
>
> From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
>
> IMAGE_EFI_BOOT_FILES created to help differentiate files needed between
> bootimg-efi and bootimg-partition when creating the installer/..wic file.
>
> Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

as you might have seen from the recent emails about 'sphinx
migration', we will no longer take patches in the XML docbook files.
Can you please resubmit your change against the new sphinx based
documentation files? If you face any issue with sphinx, please let us
know.

> ---
>  documentation/ref-manual/ref-variables.xml | 55 ++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
> index a506480..6e438e8 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -5719,6 +5719,61 @@
>              </glossdef>
>          </glossentry>
>
> +        <glossentry id='var-IMAGE_EFI_BOOT_FILES'><glossterm>IMAGE_EFI_BOOT_FILES</glossterm>
> +            <info>
> +                IMAGE_EFI_BOOT_FILES[doc] = "A space-separated list of files from ${DEPLOY_DIR_IMAGE} to place in EFI boot partition."
> +            </info>
> +            <glossdef>
> +                <para role="glossdeffirst">
> +                    A space-separated list of files installed into the
> +                    EFI boot partition when preparing an image using the Wic tool
> +                    with the <filename>bootimg-efi</filename> source
> +                    plugin.
> +                    By default, the files are installed under the same name as
> +                    the source files.
> +                    To change the installed name, separate it from the
> +                    original name with a semi-colon (;).
> +                    Source files need to be located in
> +                    <link linkend='var-DEPLOY_DIR_IMAGE'><filename>DEPLOY_DIR_IMAGE</filename></link>.
> +                    Here are two examples:
> +
> +                    <literallayout class="monospaced">
> +     IMAGE_EFI_BOOT_FILES = ${IMGDEPLOYDIR}/${IMAGE_BASENAME}-${MACHINE}.ext4;rootfs.img
> +                    </literallayout>
> +                </para>
> +
> +                <para>
> +                    Alternatively, source files can be picked up using
> +                    a glob pattern.
> +                    In this case, the destination file must have the same name
> +                    as the base name of the source file path.
> +                    To install files into a directory within the
> +                    target location, pass its name after a semi-colon
> +                    (;).
> +                    Here are two examples:
> +                    <literallayout class="monospaced">
> +     IMAGE_BOOT_FILES = "boot/loader/*"
> +     IMAGE_BOOT_FILES = "boot/loader/*;boot/"
> +                    </literallayout>
> +                    The first example installs all files from
> +                    <filename>${DEPLOY_DIR_IMAGE}/bcm2835-bootfiles</filename>
> +                    into the root of the target partition.
> +                    The second example installs the same files into a
> +                    <filename>boot</filename> directory within the
> +                    target partition.
> +                </para>
> +
> +                <para>
> +                    You can find information on how to use the Wic tool in the
> +                    "<ulink url='&YOCTO_DOCS_DEV_URL;#creating-partitioned-images-using-wic'>Creating Partitioned Images Using Wic</ulink>"
> +                    section of the Yocto Project Development Tasks Manual.
> +                    Reference material for Wic is located in the
> +                    "<ulink url='&YOCTO_DOCS_REF_URL;#ref-kickstart'>OpenEmbedded Kickstart (.wks) Reference</ulink>"
> +                    chapter.
> +                </para>
> +            </glossdef>
> +        </glossentry>
> +
>          <glossentry id='var-IMAGE_BOOT_FILES'><glossterm>IMAGE_BOOT_FILES</glossterm>
>              <info>
>                  IMAGE_BOOT_FILES[doc] = "A space-separated list of files from ${DEPLOY_DIR_IMAGE} to place in boot partition."
> --
> 2.7.4
>
>
> 
>
