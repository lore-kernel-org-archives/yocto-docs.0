Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web12.529.1631731218486137242
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 11:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cWm81B/q;
 spf=pass (domain: gmail.com, ip: 209.85.222.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id c33so2288365uae.9
        for <docs@lists.yoctoproject.org>; Wed, 15 Sep 2021 11:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wD00x5h/S+du9bcYnNS6gJXK61nE3EUMgulvflDDM+U=;
        b=cWm81B/qh5MD+/hfp4YX9krw4SgG2M431HNxjZIKndhPsA9XeXgBxse2xi2WD1iUcE
         nlYzUUxFoBa2gq+zTI286uyztRxk0GorlOzrJRVJ3AmsqdcJknLs69Hc7glI2Tg1XuQL
         lVfoyr5WmcqHzL9utZFLZcCuqFEE9Vxe50QTcauoPaK6YjMwYakr6A1Ixh+/9oQjJ/Cl
         4a8JKq6vn2RfwuTpmQTtUjT1zOA8oZwFJAKrvsLrV4VVhcYqjpBBaeV7gDoYRWKZLXcQ
         ipVTCpy1yqKrKT3HFSTEjxqpJRgfM0L9so4trXRVv26hBx8/C8xaUCcYbBL99zAIEdm+
         yeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wD00x5h/S+du9bcYnNS6gJXK61nE3EUMgulvflDDM+U=;
        b=jtdqliaWFwXPgEqKnQFQGjiD9WGodm/qTdZO7uwLe/6ZotXtXg00vNR4WXWrvo5QDo
         sgVc6pNJW5CI6e08jngt7bP+JReKFuhdiXvxl7q4otIqUz8aDY+0kfEab7+aSQMYFwur
         QeuwXdNIHv3an/dswxqKJ9z+L9JI9ay12VQ9RqYNy4VpcYQZAdhmZv5t9gg5xiEII0dT
         Tq22+2tgh4xLVILoc2JI8nIXUpAXfwIXZwur4f6BoOhF1dNw3u1QVj/wu4Wd1deLBUfP
         PHXor0oWBUFBLZToFQlE4FNbsxjY/6HgrF48P3CsFi2QExW0zuhKnNvQMKeHSb6mSgiC
         vK7g==
X-Gm-Message-State: AOAM5310WnGCVwHdbhpKg3uhyDKphz//9joSC68ceuPZolYAZt/3lJxM
	95wT9ZoDNkbxwGPkOqQssRo8hTeBbQ4PlRz1vWY6Arja
X-Google-Smtp-Source: ABdhPJymQTUE6fDtI34Pqq04qvmIfngBQBbgGzuI4s0KXohwwUid2+VbE9qWlaSS3t8FTG61EcamHWTFt9nDYRoar2c=
X-Received: by 2002:ab0:3b49:: with SMTP id o9mr1550363uaw.100.1631731217618;
 Wed, 15 Sep 2021 11:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org> <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 15 Sep 2021 20:40:05 +0200
Message-ID: <CANNYZj8VoJxfUHD5f7vTJO1S7QEEyh86x5yXS7Zn_dYtzEt1Lg@mail.gmail.com>
Subject: Re: [docs] [PATCH v3 0/5] Complete upstream version check documentation
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000985dd305cc0d075a"

--000000000000985dd305cc0d075a
Content-Type: text/plain; charset="UTF-8"

Other than my two comments, lgtm, thanks!

Alex

On Wed, 15 Sept 2021 at 19:58, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> This V3 add documentation for the UPSTREAM_CHECK_COMMITS and
> UPSTREAM_VERSION_UNKNOWN variables, and takes their usage into account
> in the explanations.
>
> There is a little bit of extra text to review if you're interested.
>
> This addresses https://bugzilla.yoctoproject.org/show_bug.cgi?id=14431
>
> Thanks in advance.
>
> Michael Opdenacker (5):
>   ref-manual: document UPSTREAM_CHECK_COMMITS and
>     UPSTREAM_VERSION_UNKNOWN
>   ref-manual: remove checkpkg task
>   ref-manual: improve "devtool check-upgrade-status" details
>   ref-manual: improve documentation for RECIPE_NO_UPDATE_REASON
>   ref-manual: update "devtool check-upgrade-status" output
>
>  .../ref-manual/devtool-reference.rst          | 57 ++++++++++---------
>  documentation/ref-manual/tasks.rst            | 31 ----------
>  documentation/ref-manual/variables.rst        | 35 +++++++++++-
>  3 files changed, 63 insertions(+), 60 deletions(-)
>
> --
> 2.25.1
>
>
> 
>
>

--000000000000985dd305cc0d075a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Other than my two comments, lgtm, thanks!</div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 15 Sept 2021 at 19:58, Michael Opdena=
cker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenack=
er@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">This V3 add documentation for the UPSTREAM_CHECK_COMMITS and<=
br>
UPSTREAM_VERSION_UNKNOWN variables, and takes their usage into account<br>
in the explanations.<br>
<br>
There is a little bit of extra text to review if you&#39;re interested.<br>
<br>
This addresses <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D14431" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D14431</a><br>
<br>
Thanks in advance.<br>
<br>
Michael Opdenacker (5):<br>
=C2=A0 ref-manual: document UPSTREAM_CHECK_COMMITS and<br>
=C2=A0 =C2=A0 UPSTREAM_VERSION_UNKNOWN<br>
=C2=A0 ref-manual: remove checkpkg task<br>
=C2=A0 ref-manual: improve &quot;devtool check-upgrade-status&quot; details=
<br>
=C2=A0 ref-manual: improve documentation for RECIPE_NO_UPDATE_REASON<br>
=C2=A0 ref-manual: update &quot;devtool check-upgrade-status&quot; output<b=
r>
<br>
=C2=A0.../ref-manual/devtool-reference.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 57 ++++++++++---------<br>
=C2=A0documentation/ref-manual/tasks.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 31 ----------<br>
=C2=A0documentation/ref-manual/variables.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
5 +++++++++++-<br>
=C2=A03 files changed, 63 insertions(+), 60 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000985dd305cc0d075a--
