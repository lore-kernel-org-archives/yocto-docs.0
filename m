Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.241.1615914911261194518
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 10:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sR1s5Zqj;
 spf=pass (domain: linaro.org, ip: 209.85.218.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f53.google.com with SMTP id p7so62137121eju.6
        for <docs@lists.yoctoproject.org>; Tue, 16 Mar 2021 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9KbokOSs7MNmctKp1+Ezt/W7NHis2ASRUC+nPQRNffw=;
        b=sR1s5ZqjQKWK9BiQteaavOZ/qYUiEsEK7HgH/a3RN0x4cXp0XS5TlLJ583nj1VXfeX
         pxeL2Fil9JqhqyhuTJNmawBWfwYUjK7sbW2+VU+1YuHC5RLemlbbRoZISJgVeXzUZ6w4
         jZv7DKK6KJB9bhTN0XKXEazXuSiIm/8A0KLWLxMZdiuBzvVJL9JkObM1LkQRnKbufkuE
         PPwdgBBeP5+2Q58G90OBsSiWZ+rmk/d8Mg2hSyn4+ungiSeCyG2SZ+hEKAmQ8Uc8DipB
         5vnNVlBRhhUcq5dSDJQ3ZKHCMJ7o8FZfah9hsqEhuWQKH0rw+HMkpCXUbpz3+XGrD0wa
         caAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9KbokOSs7MNmctKp1+Ezt/W7NHis2ASRUC+nPQRNffw=;
        b=Ic82pDxd4EIgYCQo2iD4FVGzBBg0YX3iRbOKQ0CegnKINGcUmKiphm3pjI8vpX1oPq
         f76o2GU7gTo8JJ9XkAnXTo0bAPkcOoQd/yFxGU6HnT5BSrJW9mdUm6GemP1Gavwcg3yj
         j9YFnRfF1CSTALy+jFiU2l53jX9HK2WdTbiqEXva/XWf4p4jNzDJbYD0MUj1IfkaMlIz
         NocBrE4QaBRqVpkkJ8pOpbNKdTwh0EFEpg1XOWkxbzlHGR/3aorKPkj5hGS8i2cfp0hr
         tzI2nN4oaH9rzy7GF3/aeinMVMM0s5YBMIhwwwzbOmUpcuBJv9WpcQhlJXWJJ6LzSntN
         YsPQ==
X-Gm-Message-State: AOAM531BzyCeKr89BUrcciQKX1A9uFwWgISzP2KA7lheJ2NPuThmjb2X
	V1jsjdudliqCMTiA8CoUVzzOT3N8bcqQHs/BQ9J7U1CUrN3QSu/5
X-Google-Smtp-Source: ABdhPJzv8N0LNOsVU5t2cEtOOa/qvXskY6wOKieOtBJqMjrBOwDCKlCSOc4HlZZBlD4wSx2awFqnHprM332C4Jz9LAk=
X-Received: by 2002:a17:906:d71:: with SMTP id s17mr31650797ejh.126.1615914909495;
 Tue, 16 Mar 2021 10:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <4a582ed9-d8ce-c819-ae67-38b935e6359@crashcourse.ca>
In-Reply-To: <4a582ed9-d8ce-c819-ae67-38b935e6359@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 16 Mar 2021 18:14:58 +0100
Message-ID: <CAP71Wjy9BWrZFSX-FKKXh3R=+7AE6PSqegsJJCzRoTusCZveUQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: remove erroneous '\*' from variables list
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 16, 2021 at 5:45 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
> Not sure what those leading '\*' are doing, but they're rendered
> verbatim and mess up creating a linkable item.

thanks for the patch. they are left over from the docbook migration..

>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

>
> ---
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6808c4947..4f441907b 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2230,7 +2230,7 @@ system and gives an overview of their function and contents.
>        .. note::
>
>           To add packages to the root filesystem, see the various
> -         \*:term:`RDEPENDS` and \*:term:`RRECOMMENDS` variables.
> +         :term:`RDEPENDS` and :term:`RRECOMMENDS` variables.
>
>     :term:`EXTRANATIVEPATH`
>        A list of subdirectories of
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> 
>
