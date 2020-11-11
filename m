Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web12.11955.1605123484097014987
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 11:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XyVZKseg;
 spf=pass (domain: konsulko.com, ip: 209.85.167.194, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f194.google.com with SMTP id m13so3472068oih.8
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 11:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/xDkG33O0411IVHtmdAcbvMz0P3hSawkR7ZLjOC85o=;
        b=XyVZKsegZVDQGfrxbwsOePvEGfcedfT2mq8S08mtrdbNt0hY24v7wetY2R0qRQF5QE
         qOLnVrt23YiWkGBfwfOo2/6Hgborsw/1KxAVDoDy5+W7DnmoNLq1UiPuwgcgoKdMfofc
         qUsip9HqILPm23Lovs+RB45Ma41LImMaE8Oow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/xDkG33O0411IVHtmdAcbvMz0P3hSawkR7ZLjOC85o=;
        b=hf0vu9wG5B+c3SUUqPKQW3ajnDvufMDIijBNnaoWZh9PRhqX/qeudxjGuxrQNvb8P5
         ogBqM1tCAwqu3wXm4oUxXpYbuZhRx92xEApwTwCfZgNMvsacJCYn/NI8p7n/I8ko1rgt
         zMvhgEi8xomw5H3+tiSoaHxJ+ggOP3kpdpH0VWATrfzcCtRMfPZMLnVEz6kEwDsP9QuA
         FbO9Gwk+YddZ8QgDkpxmb+deHaO7OSqMJVB9HANODs1FWvcVcZUzc4s716y0T1OuGcx9
         HB46Ur2WDw2OZHYqnci+IQ4jr5AISXRoGawSMdqiSsIm72ZfsWpsmGnGIc6ky6alwxNS
         Xitw==
X-Gm-Message-State: AOAM533wrOeiOV8/Ru+v6biAyzyVZTqwKQ5GUBSuP9Fp0YvsO/y9GX9P
	QWwNrKBpJC2ReWGOT9/ZIoFdamyUkGwBJHCO761daQ==
X-Google-Smtp-Source: ABdhPJzDHyhQ67Xow6uR0QBJ0WFxNdLP1Z1zOyTUZ/SwSVylXvTgfyfhd1YVQD2tZXvORDZGp5yoLCkLoDrohCp3isI=
X-Received: by 2002:aca:c6cb:: with SMTP id w194mr3178784oif.27.1605123483428;
 Wed, 11 Nov 2020 11:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20201111184201.104015-1-nicolas.dechesne@linaro.org> <20201111184201.104015-3-nicolas.dechesne@linaro.org>
In-Reply-To: <20201111184201.104015-3-nicolas.dechesne@linaro.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 11 Nov 2020 19:37:53 +0000
Message-ID: <CAM9ZRVuNr+z0RA2jvOieU9fWOv1q6Xr7wiH07WL8yWYT4MfBXA@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/2] poky.yaml: updates for 3.2
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2020 at 18:42, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> Updates global variables for 3.2 / Gategarth release.
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  documentation/poky.yaml | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 85f42cf07..41f244f1c 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,11 +1,11 @@
> -DISTRO : "3.1"
> -DISTRO_NAME_NO_CAP : "dunfell"
> -DISTRO_NAME : "Dunfell"
> -DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1"
> -YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
> -DISTRO_REL_TAG : "yocto-3.1"
> -POKYVERSION : "23.0.0"
> +DISTRO : "3.2"
> +DISTRO_NAME_NO_CAP : "gatesgarth"
> +DISTRO_NAME : "Gatesgarth"
> +DISTRO_NAME_NO_CAP_MINUS_ONE : "Dunfell"

s/D/d/ I guess as it's NO_CAP.

> +YOCTO_DOC_VERSION : "3.2"
> +YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
> +DISTRO_REL_TAG : "yocto-3.2"
> +POKYVERSION : "24.0.0"
>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
> --
> 2.29.2
>
>
> 
>


-- 
Paul Barker
Konsulko Group
