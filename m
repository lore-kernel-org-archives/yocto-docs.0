Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.11862.1610559583056701310
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Jan 2021 09:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GwwrBuTA;
 spf=pass (domain: linaro.org, ip: 209.85.208.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f50.google.com with SMTP id g21so2859180edy.0
        for <docs@lists.yoctoproject.org>; Wed, 13 Jan 2021 09:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pOBJRJmbo9F3ND4WG+kiX3dhHCKPI/bOCyx8L6wjnQc=;
        b=GwwrBuTADoBKv1MKTTYb5UG1KRCnZnshij2P7W9euuhQLtiDUcdjguY3jzCaWEjNZk
         F5/ZXAawrJbbQNdY1R1Tm+1GVwn5yeXDOFWBHGwqBvQtYzeQddiHuy6Q1myuS7lDlZLU
         vb6KGVAQfVMTINjYHbxaWmaopHNcIPHArGmX56w01nu9g950ZyAFAtLNTHqEnBrFd2T6
         TAJvuG5QYUsMHUHOKo0GVUww2sbmXomsIia+zMSMuMnoMRjWf+sB+o5dQkpiBk0g5KcX
         5W7LGOnHdq7x79jG5jY+d/Xc5Td2RKYe5JZzjj71o9PeljpEudmiipV1voc1ur+8cnhu
         xuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pOBJRJmbo9F3ND4WG+kiX3dhHCKPI/bOCyx8L6wjnQc=;
        b=kQuvocQh9NxIIwB49fzcC8bHcqIfCsrIR/TbM4rt+qd8tJFfEev5CdmCgjOzPw+vPK
         Tdh8RjUmg1klK45girLWIFSfEIR2P6s8KHVr1HmDAoJBS63u4vMDWCHlkacb+byuOzea
         uKmxA/tUTw98ZEg/su7KLGv2YfGrFBLFDP421ByqKrbj/hjfxwxt04P/t7xbzbQV9MIW
         tcR2ZO3qk7XNMr2vaT86BWR+bz2lnB07bsMUtPLBJECF58iIehmkvnywbx7Is5XQm6jr
         +5Ra3ccXRdLhsW8bweBOgIhsdnekN2GTzzE68QKcCI5zpBcMPSjen9UeTFMQ2ONhDzoW
         zLVA==
X-Gm-Message-State: AOAM530z344/O28VOJLPzyotu85+qQMD3GVoanXXLGapXzf2KsRrz5Mb
	GfxrvEfobE1j1Utfvjr/gDZboIPOl6fp1bqhdGuZnw==
X-Google-Smtp-Source: ABdhPJzKR7a4T5m/1r3t1OE3vBhdKUxr/weD6gp3j8ymA5c2N4iVOmofx14Am/89DK9PRt1w68tAFWh6msqIzH42gR4=
X-Received: by 2002:a50:934a:: with SMTP id n10mr2690095eda.26.1610559581366;
 Wed, 13 Jan 2021 09:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20210113172329.7683-1-yoann.congal@smile.fr>
In-Reply-To: <20210113172329.7683-1-yoann.congal@smile.fr>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 13 Jan 2021 18:39:30 +0100
Message-ID: <CAP71Wjwi92hxX7U_qC7KwKQpND4mD_F_K8RQ8xBApZUw8o+GFQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] toaster-manual: Fix a warning related to the code-block directive
To: Yoann Congal <yoann.congal@smile.fr>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000bcc4e005b8cb9f94"

--000000000000bcc4e005b8cb9f94
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 13, 2021 at 6:23 PM Yoann Congal <yoann.congal@smile.fr> wrote:

> Fix the following warning by specifying the language (here : shell):
> .../yocto/poky/documentation/toaster-manual/reference.rst:572: WARNING:
> Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
>

Which version of Sphinx are you using? I suspect an old version, in Sphinx
2+ (I think) it is no longer an error to omit the language. And I don't see
any warnings in my builds. In fact, we have 0 warning in the whole doc, and
we will try to avoid adding new ones!


>
> .. code-block::
>
>    $ bitbake/lib/toaster/manage.py builddelete build_id
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  documentation/toaster-manual/reference.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/toaster-manual/reference.rst
> b/documentation/toaster-manual/reference.rst
> index d2ab14c8e6..135968d40c 100644
> --- a/documentation/toaster-manual/reference.rst
> +++ b/documentation/toaster-manual/reference.rst
> @@ -569,7 +569,7 @@ command would return something like the following::
>  The ``builddelete`` command deletes data associated with a build. Access
>  the command as follows:
>
> -.. code-block::
> +.. code-block:: shell
>
>     $ bitbake/lib/toaster/manage.py builddelete build_id
>
> --
> 2.20.1
>
>
> 
>
>

--000000000000bcc4e005b8cb9f94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 13, 2021 at 6:23 PM Yoann=
 Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
ix the following warning by specifying the language (here : shell):<br>
.../yocto/poky/documentation/toaster-manual/reference.rst:572: WARNING: Er=
ror in &quot;code-block&quot; directive:<br>
1 argument(s) required, 0 supplied.<br></blockquote><div><br></div><div>Wh=
ich version of Sphinx are you using? I suspect an old version, in Sphinx 2+=
 (I think) it is no longer an error to omit the language. And I don&#39;t s=
ee any warnings in my builds. In fact, we have 0 warning in the whole doc, =
and we will try to avoid adding new ones!</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
.. code-block::<br>
<br>
=C2=A0 =C2=A0$ bitbake/lib/toaster/manage.py builddelete build_id<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0documentation/toaster-manual/reference.rst | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/documentation/toaster-manual/reference.rst b/documentation/to=
aster-manual/reference.rst<br>
index d2ab14c8e6..135968d40c 100644<br>
--- a/documentation/toaster-manual/reference.rst<br>
+++ b/documentation/toaster-manual/reference.rst<br>
@@ -569,7 +569,7 @@ command would return something like the following::<br=
>
=C2=A0The ``builddelete`` command deletes data associated with a build. Ac=
cess<br>
=C2=A0the command as follows:<br>
<br>
-.. code-block::<br>
+.. code-block:: shell<br>
<br>
=C2=A0 =C2=A0 $ bitbake/lib/toaster/manage.py builddelete build_id<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000bcc4e005b8cb9f94--
