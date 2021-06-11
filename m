Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.4875.1623394123386749827
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 23:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ee/RNN1p;
 spf=pass (domain: linaro.org, ip: 209.85.208.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f50.google.com with SMTP id s6so35850850edu.10
        for <docs@lists.yoctoproject.org>; Thu, 10 Jun 2021 23:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NqkUI7ywQYpmXFB9xBJMtp0VIVAN8tG+MP5vD2+o22M=;
        b=ee/RNN1pb4WJlolz6+YQ/KXnSv1NrV9sE+YrTWcuiW4mMJe3X0zEWLe5LkJ4cugcWf
         7Pzb+fmUJN7Zjw7a9ZzHNO5I02fW4W9isqWVYBBuJ4GKfuIrZKMWDA9xDInHPmd5LyLM
         pKD4Pkf6uKPfEmlTh6Kl5jBcq7LCy24Y9qUm6kmuw2wcsEdFR/Pd3I60Bv2BNMZFmfhw
         wc8rbOh179Z4e0THj82QqgvvkOJKuRVd4O5zFKJ+LD9GESIGbb2kgbQ7n3cNwrFrqY3J
         E3xkzvkYP20nXx3u8wzfCkO5cyv2+B3MNPx9ncuJ/cTiBxV0BsrAyGlJIv63osYrRK6Q
         fDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqkUI7ywQYpmXFB9xBJMtp0VIVAN8tG+MP5vD2+o22M=;
        b=Gsf4rCR717fDMoHG+rtHvXLHInpi4qkHy7JMDGN6mJJSkF4JXVMzpq+j5u4lFa/Pc4
         HyjFCY0GfAQcVIW1cTGxEjTo2/qzl8zGQS32sMBpQTWF5fLqQOg9BkZyQkhxSNZ2otJm
         fX7lhEaClHXOhcVEnJjUNJGqYKLK/9DEw4AKnspM0eWjQp1buqOQfky9ceXX5IEwkG5d
         o29qQUxLNI4hCFRjEMBCY9uPyDmuF4UpvTGFDPs6bf29/omnoVyfAmAh7G0kWSxaGlBO
         U1vWSHXhrZfKVT6voR2D4fe+/46f6li9+T1itNekHWfMqvJpZmkypHaZW+LemupFvkgj
         z45w==
X-Gm-Message-State: AOAM533H5aDO3vZeT+NNs77KsDo60U02sDCyF785TA+P1J/O4r1GOip9
	iNvQcfaFnqTyYWy7E7MqaqY0Vkxz+YuzWi6fz+AMIOaFRbNGc1uT
X-Google-Smtp-Source: ABdhPJyMQC8fIOk3KUIrelTPgX3koB6sSekmwL26HheP5QV9MjdTg1YK1hbCi3BdeoUn8b4d4Z0/+eNZUAsHlm7w4nM=
X-Received: by 2002:a05:6402:44:: with SMTP id f4mr2148235edu.364.1623394121814;
 Thu, 10 Jun 2021 23:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210611062613.188300-1-dwagenknecht@emlix.com>
In-Reply-To: <20210611062613.188300-1-dwagenknecht@emlix.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 11 Jun 2021 08:48:31 +0200
Message-ID: <CAP71WjxxVGmb7n2U74FvQgscZ6q=t_5oy4yrU9Hr0rQPNv8M=Q@mail.gmail.com>
Subject: Re: [docs] [PATCH 0/2] ref-manual: variables: document IMGDEPLOYDIR
To: Daniel Wagenknecht <dwagenknecht@emlix.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f628ea05c477e575"

--000000000000f628ea05c477e575
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 11, 2021 at 8:26 AM Daniel Wagenknecht <dwagenknecht@emlix.com>
wrote:

> Hello!
>
> I recently stumbled upon direct references to DEPLOY_DIR_IMAGE when
> upgrading an old Yocto Krogoth project. Those caused the symlinking of
> the most recent image to fail. I needed quite some time to find the root
> cause, since IMGDEPLOYDIR was not documented yet.
>
> I'm unsure if a note to `documentation/ref-manual/migration-2.2.rst`
> should also be added, since that is when the changes where introduced.
>

I would suggest adding it. It's an important change very visible and
impacting for users.


>
> Best Regards
> Daniel Wagenknecht
>
>
> Daniel Wagenknecht (2):
>   ref-manual: variables: update examples refering to DEPLOY_DIR_IMAGE
>   ref-manual: variables: document IMGDEPLOYDIR
>
>  documentation/ref-manual/variables.rst | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> --
> 2.25.1
>
>
> 
>
>

--000000000000f628ea05c477e575
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 11, 2021 at 8:26 AM Danie=
l Wagenknecht &lt;<a href=3D"mailto:dwagenknecht@emlix.com">dwagenknecht@em=
lix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hello!<br>
<br>
I recently stumbled upon direct references to DEPLOY_DIR_IMAGE when<br>
upgrading an old Yocto Krogoth project. Those caused the symlinking of<br>
the most recent image to fail. I needed quite some time to find the root<b=
r>
cause, since IMGDEPLOYDIR was not documented yet.<br>
<br>
I&#39;m unsure if a note to `documentation/ref-manual/migration-2.2.rst`<b=
r>
should also be added, since that is when the changes where introduced.<br>=
</blockquote><div><br></div><div>I would suggest adding it. It&#39;s an imp=
ortant change very visible and impacting for users.=C2=A0</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best Regards<br>
Daniel Wagenknecht<br>
<br>
<br>
Daniel Wagenknecht (2):<br>
=C2=A0 ref-manual: variables: update examples refering to DEPLOY_DIR_IMAGE=
<br>
=C2=A0 ref-manual: variables: document IMGDEPLOYDIR<br>
<br>
=C2=A0documentation/ref-manual/variables.rst | 23 ++++++++++++++++++++---<=
br>
=C2=A01 file changed, 20 insertions(+), 3 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000f628ea05c477e575--
