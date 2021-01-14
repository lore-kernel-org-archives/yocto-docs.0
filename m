Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.69.1610623391449776512
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 03:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pagm6bEf;
 spf=pass (domain: linaro.org, ip: 209.85.208.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f42.google.com with SMTP id u19so5323817edx.2
        for <docs@lists.yoctoproject.org>; Thu, 14 Jan 2021 03:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7fn0a85Pjr9T0EKuLrPqcy4gbZQl0TkhC9hlJDhvk/g=;
        b=pagm6bEfeArRrI7xEkEmEfpD4JGo21uy6CKroJwWaBExfl+E4QEsTws13bsKMsxxNC
         z5BAgVWH4RpUZBTFOPxrZKrM7t6nCubqkb9JfRGG3k3vH8ZwXH+cwdMF0EnMrm8zJ0Kh
         X7RV4d96nn3uxguUwu27ns6hL/vD9rBJFBfJBoKax3y+J2uxUSHxCROEd05BZG/xwZL0
         4yMUpMXYW3Mlj+SyhrfInv2axSe5nNYoec68bi3ZKTcO6v8/9WFwHq9OWBhFH2bzCKZB
         X3xpYzVdnxF4Tnhk7BewRE+2htXlNd4HARobl+7FWHFJfBZLyD6cjB7neHTLseOsrFZm
         w26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7fn0a85Pjr9T0EKuLrPqcy4gbZQl0TkhC9hlJDhvk/g=;
        b=AmsxG7canphYHYdckjCMRTRi8/XgOZ81hd9PQgOBgChRaap5KcX2471qwFQl6FRkdo
         9QL4E59NJ2ok31GiQI4tdoZASk31SVQp0mj7SsKvi/77t4+vanNs2K3m0ChSs3TJntnk
         cNWxD/iFnuTfK9KBVzJkFnLiTJcj9rEAJHLAPwld0R+K59Il+zZynVFgvb6PWQ2G9Zda
         8IflmMlDEcyQ4PxA7iXcFyV931sX5FlMulBuz8673yo5lSXJS6Rb3dLSg171myPccrAU
         eYsrzoz8iXNX80TSDlZT2NdYa2VMaSbRTcXB/LPZ/Cljnb8aGhdNUCRFMrKJmlMJwko8
         TboQ==
X-Gm-Message-State: AOAM533X25f7oF1lb6CNT8INd8epSaEGcv/5VszTk0pJYOr5k1J3maFo
	acFkOlVvJ8A+wnqVQNsppdr89CjV6o+8xe2pRDCNJA==
X-Google-Smtp-Source: ABdhPJwIn51IjnJM/WjIPhoiAoyi4c+eu5kigPIGE0hKtiZGraKJUPDUdwzo3QUWMEFnFkffyCU8Wxa5MC6t+tFw0/s=
X-Received: by 2002:a50:934a:: with SMTP id n10mr5329280eda.26.1610623389860;
 Thu, 14 Jan 2021 03:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20210113172329.7683-1-yoann.congal@smile.fr> <CAP71Wjwi92hxX7U_qC7KwKQpND4mD_F_K8RQ8xBApZUw8o+GFQ@mail.gmail.com>
 <CAMSfU+7kP7kotufDWP=b=SSnK2OXc+w96HfK8doZuNTcDja2Hw@mail.gmail.com> <20210114111815.u5r2ltfrnvqweel5@qschulz>
In-Reply-To: <20210114111815.u5r2ltfrnvqweel5@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 14 Jan 2021 12:22:58 +0100
Message-ID: <CAP71WjxCRKmy2vJzykLiD77_PNHWSexL1vm+ax8Ek8RMo0hgWw@mail.gmail.com>
Subject: Re: [docs] [PATCH] toaster-manual: Fix a warning related to the code-block directive
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000005229005b8da7b5f"

--00000000000005229005b8da7b5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 12:18 PM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> Hi Yoann, Nicolas,
>
> On Thu, Jan 14, 2021 at 12:06:10PM +0100, Yoann Congal wrote:
> > Hi !
> >
> > Le mer. 13 janv. 2021 =C3=A0 18:39, Nicolas Dechesne <
> nicolas.dechesne@linaro.org>
> > a =C3=A9crit :
> >
> > > On Wed, Jan 13, 2021 at 6:23 PM Yoann Congal <yoann.congal@smile.fr>
> > > wrote:
> > >
> > >> Fix the following warning by specifying the language (here : shell):
> > >> .../yocto/poky/documentation/toaster-manual/reference.rst:572:
> WARNING:
> > >> Error in "code-block" directive:
> > >> 1 argument(s) required, 0 supplied.
> > >>
> > >
> > > Which version of Sphinx are you using? I suspect an old version, in
> Sphinx
> > > 2+ (I think) it is no longer an error to omit the language. And I
> don't see
> > > any warnings in my builds. In fact, we have 0 warning in the whole
> doc, and
> > > we will try to avoid adding new ones!
> > >
> >
> > Well you were right! I was running sphinx 1.8. I got no more warnings
> after
> > upgrading to sphinx 3.4.3.
> >
> > Sorry about the noise !
> >
>
> And now I just discovered we don't have a requirements.txt or something
> alike where we could ask for a min version of sphinx.
>
> @Nicolas, any idea why we're not using requirements.txt so that one
> could do pip install -r requirements.txt (and we could also enforce a
> min version of Sphinx, the theme or pyyaml)? Or whatever mechanisms the
> cool kids doing Python use nowadays?
>

We have a Pipfile, which is even cooler, no? but we don't specify any
version yet!

>
> Quentin
>

--00000000000005229005b8da7b5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 14, 2021 at 12:18 PM Quen=
tin Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quenti=
n.schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Yoann, Nicolas,<br>
<br>
On Thu, Jan 14, 2021 at 12:06:10PM +0100, Yoann Congal wrote:<br>
&gt; Hi !<br>
&gt; <br>
&gt; Le mer. 13 janv. 2021 =C3=A0 18:39, Nicolas Dechesne &lt;<a href=3D"ma=
ilto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro=
.org</a>&gt;<br>
&gt; a =C3=A9crit :<br>
&gt; <br>
&gt; &gt; On Wed, Jan 13, 2021 at 6:23 PM Yoann Congal &lt;<a href=3D"mailt=
o:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br=
>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; Fix the following warning by specifying the language (here : =
shell):<br>
&gt; &gt;&gt; .../yocto/poky/documentation/toaster-manual/reference.rst:572=
: WARNING:<br>
&gt; &gt;&gt; Error in &quot;code-block&quot; directive:<br>
&gt; &gt;&gt; 1 argument(s) required, 0 supplied.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Which version of Sphinx are you using? I suspect an old version, =
in Sphinx<br>
&gt; &gt; 2+ (I think) it is no longer an error to omit the language. And I=
 don&#39;t see<br>
&gt; &gt; any warnings in my builds. In fact, we have 0 warning in the whol=
e doc, and<br>
&gt; &gt; we will try to avoid adding new ones!<br>
&gt; &gt;<br>
&gt; <br>
&gt; Well you were right! I was running sphinx 1.8. I got no more warnings =
after<br>
&gt; upgrading to sphinx 3.4.3.<br>
&gt; <br>
&gt; Sorry about the noise !<br>
&gt; <br>
<br>
And now I just discovered we don&#39;t have a requirements.txt or something=
<br>
alike where we could ask for a min version of sphinx.<br>
<br>
@Nicolas, any idea why we&#39;re not using requirements.txt so that one<br>
could do pip install -r requirements.txt (and we could also enforce a<br>
min version of Sphinx, the theme or pyyaml)? Or whatever mechanisms the<br>
cool kids doing Python use nowadays?<br></blockquote><div><br></div><div>We=
 have a Pipfile, which is even cooler, no? but we don&#39;t specify any ver=
sion yet!=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Quentin<br>
</blockquote></div></div>

--00000000000005229005b8da7b5f--
