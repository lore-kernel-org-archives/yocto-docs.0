Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.7950.1623319482235400713
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 03:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=k7E5REV1;
 spf=pass (domain: linaro.org, ip: 209.85.218.41, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f41.google.com with SMTP id ci15so43220175ejc.10
        for <docs@lists.yoctoproject.org>; Thu, 10 Jun 2021 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EuJbMpRi4qAaCYyn78hC3yoPqD9/fdQ/FfeXWHJVZ7I=;
        b=k7E5REV1pyUOMBlb7ZOAS4prLjjd2q/wllrhagh89ijjeXMg/zceIIEk19z9TGK7F4
         IF+ThExOrQQozPc4FcH/O1IRtUBYvT9lM/xOgfrReWD5Je3xB0JZ1WZRrEtDI98lpxEp
         TEML6Q3X+MJjhfRqia6BCat2DL+G/4TaCwuXofPSTwy/z/6U3rKvLO5RCbY1I7UVRw+G
         iMCx1paCQVzU7aJLdQTFIHSKXNrblGeOzKn6Y7ofggPjCzeqD9EKulC3uNZXZHPrizW2
         1gdZwnX4tSYKUdJLZ2NrrfX3objT8aZVv7DwZfWwD4ToZ0H2rpI6y5oT4hZYFtwHNsaP
         HEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EuJbMpRi4qAaCYyn78hC3yoPqD9/fdQ/FfeXWHJVZ7I=;
        b=Q+UGrP1JYGphJKPyzzu1v8W2ysg2MZVi8U2bjKAOLiAhEiYI0wbg/Rqo0GTroa+eAF
         ZMLmEpGbgKXknaObVOfZ9Bjq/Wm2xI3KcqV2Vhx1rn0NaqPa/w2oILS6PgS66vb+nsF1
         e/5S9Y1zWU57pUhwWGWN8EJlZlHedGMy3EQX459M7/I3Khsb8cztRQdwk9BHB0pRX9gQ
         1544ELU2Q2RrvZmfCRaGx8Uy9ecHVHWdQyUihW8SO7z7yxoy4kALM2cr0fNb7yunOk/4
         dbOCk20PeosJuAzaeK1DTeneYkgcyhVBwXkI7uycLCBKQz5UJtEB4MoV/H5q4aokYWdQ
         vo+Q==
X-Gm-Message-State: AOAM53280aWl+E38CwXQv/pYG5GurOW9CSVyo1Td9YSexZiXyKK1Y4py
	qE61YwBeRRxzQjw6Q5NQly8lMgOPn49AGet4mpfODA==
X-Google-Smtp-Source: ABdhPJzFSXF9/+z3zxbbty97OPQ7qtictb+vfTuErRZHWp0yR6wstmB7vI2ruDCaMTbYOVOl+QEjwYmZb1DVPotCOgg=
X-Received: by 2002:a17:906:744:: with SMTP id z4mr3762084ejb.347.1623319480558;
 Thu, 10 Jun 2021 03:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <1675A932C413C877.8243@lists.yoctoproject.org> <16872EDF3FBC0621.15202@lists.yoctoproject.org>
 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
In-Reply-To: <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 10 Jun 2021 12:04:30 +0200
Message-ID: <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	"Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000fefa4e05c4668434"

--000000000000fefa4e05c4668434
Content-Type: text/plain; charset="UTF-8"

Can you please push to master-next , so that everyone can see what it looks
like without having to rebuild (e.g. http://docs.yoctoproject.org/next/
will be updated after you push)?

e.g. i am cc'ding Vineela (release manager) , so that she gets a chance to
review.

On Thu, Jun 10, 2021 at 11:39 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Greetings,
>
> On 6/10/21 11:35 AM, Michael Opdenacker wrote:
> > This makes the reference manual much lighter by moving
> > the release notes to a separate document.
> >
> > The release notes are also reordered from last to first,
> > and they appear directly in the left bar, making them easier
> > to find in the documentation.
>
>
> These are my proposed changes, trying to match what was discussed back
> in April.
>
> Don't hesitate to try them by applying them to the "master" branch and
> running "make html". In particular, you should see a new "Release Notes"
> entry in the left column.
>
> Your feedback and reviews are welcome. I don't expect to get it right
> the first time :)
>
> Thanks in advance,
>
> Michael.
>
> --
>
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> 
>
>

--000000000000fefa4e05c4668434
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Can you please push to m=
aster-next , so that everyone can see what it looks like without having to =
rebuild (e.g.=C2=A0<a href=3D"http://docs.yoctoproject.org/next/">http://do=
cs.yoctoproject.org/next/</a> will be updated after you push)?=C2=A0<br></d=
iv><div dir=3D"ltr"><br></div><div>e.g. i am cc&#39;ding Vineela (release m=
anager) , so that she gets a chance to review.</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 10, 2021 at=
 11:39 AM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootl=
in.com">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Greetings,<br>
<br>
On 6/10/21 11:35 AM, Michael Opdenacker wrote:<br>
&gt; This makes the reference manual much lighter by moving<br>
&gt; the release notes to a separate document.<br>
&gt;<br>
&gt; The release notes are also reordered from last to first,<br>
&gt; and they appear directly in the left bar, making them easier<br>
&gt; to find in the documentation.<br>
<br>
<br>
These are my proposed changes, trying to match what was discussed back<br>
in April.<br>
<br>
Don&#39;t hesitate to try them by applying them to the &quot;master&quot; =
branch and<br>
running &quot;make html&quot;. In particular, you should see a new &quot;R=
elease Notes&quot;<br>
entry in the left column.<br>
<br>
Your feedback and reviews are welcome. I don&#39;t expect to get it right<=
br>
the first time :)<br>
<br>
Thanks in advance,<br>
<br>
Michael.<br>
<br>
-- <br>
<br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https=
://bootlin.com</a><br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000fefa4e05c4668434--
